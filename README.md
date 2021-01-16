
# Zebrafish-GEM: The generic genome-scale metabolic model of _Danio rerio_

[![GitHub version](https://badge.fury.io/gh/sysbiochalmers%2FZebrafish-GEM.svg)](https://badge.fury.io/gh/sysbiochalmers%2FZebrafish-GEM)


#### Brief Model Description

This repository contains the latest version of Zebrafish-GEM, a zebrafish genome-scale metabolic model.


#### Citation

Manuscript under preparation


#### Model Keywords

**Utilisation:** multi-omics integrative analysis, predictive simulation
**Field:** metabolic-network reconstruction  
**Type of Model:** reconstruction, curated  
**Model source:** [Human-GEM](https://doi.org/10.1126/scisignal.aaz1482)   
**Omic source:** genomics; metabolomics   
**Taxonomic name:** _Danio rerio_  
**Taxonomy ID:** [7955](https://identifiers.org/taxonomy:7955)  
**Genome ID:** [GCA_000002035.4](https://identifiers.org/insdc.gca:GCA_000002035.4)  
**Metabolic System:** general metabolism  
**Tissue:**  
**Bioreactor:**    
**Cell type:**  
**Cell line:**  
**Condition:** generic metabolism


### Model Overview

|Taxonomy | Template Model | Reactions | Metabolites| Genes |
| ------------- |:-------------:|:-------------:|:-------------:|:-----:|
|_Danio rerio_ |   Human-GEM |  129563  | 8384 | 3228 |


## Installation

### Required Software
* A functional MATLAB installation (MATLAB 7.3 and higher).
* The [RAVEN toolbox](https://github.com/SysBioChalmers/RAVEN).
* The [COBRA toolbox](https://github.com/opencobra/cobratoolbox) (not necessary for most functionality).


### Dependencies - Recommended Software
* The libSBML MATLAB API (version [5.13.0](https://sourceforge.net/projects/sbml/files/libsbml/5.13.0/stable/MATLAB%20interface/) is recommended).
* [Gurobi Optimizer](http://www.gurobi.com/registration/download-reg) for any simulations.


### Installation Instructions
* Clone the [master branch](https://github.com/SysBioChalmers/Zebrafish-GEM/tree/master) of this repository, or [download the latest release](https://github.com/SysBioChalmers/Zebrafish-GEM/releases/latest).
* Add the directory to your MATLAB path (instructions [here](https://se.mathworks.com/help/matlab/ref/addpath.html?requestedDomain=www.mathworks.com)).


## Usage

#### Loading/saving the model

`Zebrafish-GEM.mat` (Recommended if on `master` branch)
* Load and save using the built-in MATLAB `load()` and `save()` functions.

`Zebrafish-GEM.xml` (SBML format)
* Load using the `importModel.m` function (from [RAVEN Toolbox](https://github.com/SysBioChalmers/RAVEN))
* Save using the `exportModel.m` function (from [RAVEN Toolbox](https://github.com/SysBioChalmers/RAVEN))


## Websites

- [Metabolic Atlas](https://metabolicatlas.org/) enables visualization and exploration of Zebrafish-GEM content.


### Contributing

Contributions are always welcome! Please read the [contributing guidelines](.github/CONTRIBUTING.md) to get started.

