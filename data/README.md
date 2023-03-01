# Zebrafish-GEM data

This directory contains datasets that were used for the generation and curation of Zebrafish-GEM. The files and their contents are briefly summarized below.


- `human2ZebrafishOrthologs.tsv`: The human-zebrafish ortholog pairs downloaded from the [Alliance of Genomes Resources](https://www.alliancegenome.org) using the following code:
```bash
curl -X \
GET "https://www.alliancegenome.org/api/homologs/9606/7955?filter.stringency=stringent&limit=50000&page=1" \
-H  "accept: application/json" | \
jq -r \
'["fromGeneId", "fromSymbol", "toGeneId", "toSymbol", "best", 
"bestReverse", "methodCount", "totalMethodCount"], (.results[] | 
[.gene["id"], .gene["symbol"], .homologGene["id"], .homologGene["symbol"], 
.best, .bestReverse, .methodCount, .totalMethodCount]) 
| @tsv' > human2ZebrafishOrthologs.tsv
```
- `zebrafishSpecificMets.tsv` and `zebrafishSpecificRxns.tsv`: The curated metabolic network that is not part of human metabolism but specific to zebrafish.


