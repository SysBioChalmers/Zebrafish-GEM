%
% FILE NAME:    masterScriptZebrafishGEM.m
%
%
% PURPOSE: This script is for reconstruction of the Zebrafish-GEM, by using
%          the Human-GEM as template and taking in account specie-specific
%          pathways/reactions.
%
%


%% Load Human-GEM as template
load('Human-GEM.mat');


% convert gene identifiers from Ensembl ids to gene symbols
[grRules,genes,rxnGeneMat] = translateGrRules(ihuman.grRules,'Name','ENSG');
ihuman.grRules    = grRules;
ihuman.genes      = genes;
ihuman.rxnGeneMat = rxnGeneMat;



%% Use MA reactions identifiers 

% load reaction annotaiton files
rxnAssoc = jsondecode(fileread('humanGEMRxnAssoc.JSON'));

%replace reaction identifiers with MA ids if available
ind = getNonEmptyList(rxnAssoc.rxnMAID);
ihuman.rxns(ind) = rxnAssoc.rxnMAID(ind);



%% Generate Zebrafish-GEM by using Human-GEM as template

% get ortholog pairs from human to zebrafish
zebrafishOrthologPairs = extractAllianceGenomeOrthologs('human2ZebrafishOrthologs.json');
zebrafishGEM = getModelFromOrthology(ihuman, zebrafishOrthologPairs);



%% Incorporate species-specific reactions

% get metabolic networks based on the KEGG annoation using RAVEN function
KEGG_human=getKEGGModelForOrganism('hsa');
KEGG_zebrafish=getKEGGModelForOrganism('dre');

% remove reactions shared with human
ZebrafishSpecificRxns=setdiff(KEGG_zebrafish.rxns,KEGG_human.rxns);

% remove reactions included in Human-GEM
ZebrafishSpecificRxns=setdiff(ZebrafishSpecificRxns,rxnAssoc.rxnKEGGID);


% get species-specific network for manual inspection and then
% organize species-specific pathways into two tsv files:
zebrafishSpecificNetwork=removeReactions(KEGG_zebrafish,...
    setdiff(KEGG_zebrafish.rxns,ZebrafishSpecificRxns), true, true, true);

% "zebrafishSpecificMets.tsv" contains species-specific metabolites
metsToAdd = importTsvFile('zebrafishSpecificMets.tsv');

% "zebrafishSpecificRxns.tsv" contains species-specific reactions
rxnsToAdd = importTsvFile('zebrafishSpecificRxns.tsv');
rxnsToAdd.subSystems = cellfun(@(s) {{s}}, rxnsToAdd.subSystems);

% integrate zebrafish-specific metabolic network
[zebrafishGEM, modelChanges] = addMetabolicNetwork(zebrafishGEM, rxnsToAdd, metsToAdd);


%% Gap-filling for biomass formation
[zebrafishGEM, gapfillNetwork]=gapfill4EssentialTasks(zebrafishGEM,ihuman);
% Added 1 reaction for gap-filling


%% Save the model into mat, yml, and xml

zebrafishGEM.id = 'Zebrafish-GEM';
save('../model/Zebrafish-GEM.mat', 'zebrafishGEM');
writeHumanYaml(zebrafishGEM, '../model/Zebrafish-GEM.mat');
exportModel(zebrafishGEM, '../model/Zebrafish-GEM.xml');

