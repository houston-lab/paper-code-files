# Single-cell trajectory inference 

This repository contains notebooks and data associated with the preprint ["Alternative approaches to single-cell trajectory inference using a commute time matrix"](https://www.biorxiv.org/content/10.1101/2025.02.12.635984v1) published on **BioRxiv**. These materials provided here should be sufficient to replicate analyses described in the preprint.

### Mathematica Notebooks
To run the Mathematica notebooks, you need **Mathematica 13+**, although there is typically backwards compatibility. Mathematica can be obtained commercially or through institutional licenses. Some free functionality can be provided by running in Wolfram Cloud.

The Pancreas notebook is the most extensive, and can be used as a general starting point, but progressing through the EMT, Bone Marrow, and Pancreas data follows the order in the paper. A jupyter version is provided as of the Bone Marrow data is provided as well. 

1. The `.nb` files link to data in the `data` directory (`datasets` are for SPRING data, see below).
2. Cells in Mathematica notebooks are evaluated by selecting a cell and pressing `Shift + Enter`, or by using the "Evaluation" menu.

### Jupyter Notebook
To run the Jupyter notebook, you will need a **Python 3.8** environment and the following libraries (with dependencies):

- `scanpy`
- `palantir`

These can be installed using `pip`:

```zsh
pip install scanpy==1.9.3
pip install palantir==1.3.1
```
### SPRING
Code is provided for exporting data to SPRING: [browser:https://github.com/AllonKleinLab/SPRING](browser:https://github.com/AllonKleinLab/SPRING)
Clone the repository and launch in a python2 environment and move the desired folders from `datasets` to `SPRING/datasets` to visualize and explore data more interactively. 
