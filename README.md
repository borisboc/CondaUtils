# Conda Utils

## Introduction

These scripts can be useful when dealing with [conda](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html). I think some features are missing that is why these scripts are meant for. But I might be misusing conda, or did not found the proper explanations in the documention. In these cases, please write me so that I can remove / fix / disclaim the scripts.

## Linux

### Running scripts

You can run them in your terminal. For instance, assuming you are in the folder containing the script : 

```
sh conda_find_package.sh PACKAGE_NAME
```

For instance, if you look at the package containing `numpy` in the name : 

```
sh conda_find_package.sh numpy
```

which may return you such an output assuming you have some conda environment with `numpy` package installed.

```
Packages for conda environment: NAME_1
numpy                     2.0.1           py311h08b1b3b_1  
numpy-base                2.0.1           py311hf175353_1  

Packages for conda environment: NAME_2
numpy                     1.26.4          py312hc5e2394_0  
numpy-base                1.26.4          py312h0da6c21_0  

Packages for conda environment: NAME_3
numpy                     2.0.1           py312h1103770_0    conda-forge
numpydoc                  1.7.0              pyhd8ed1ab_3    conda-forge
```

Please note that use of wildcard (`*`) was needed : it found all packages containing your input (in this example, it found both `numpy` and `numpydoc`).

In case you have not this package in no conda environment, you will have such a printed output :

```
No conda environment has the package: label
```

### Using alias commands

To be able to call these scripts in whatever terminal at whatever current directory, I invite you to create some aliases. There are several ways of doing it. Here is mine : I have a `.bash_aliases` file close to my `.bashrc` file (see some explanations on [askubuntu](https://askubuntu.com/a/1504466)). And I have declared some functions, and copied the script code in it.
```
conda_find_package() {
    COPY THE SCRIPT CODE HERE
}
```

## Windows

### Running scripts

You can run them in your terminal. For instance, assuming you are in the folder containing the script : 

```
conda_find_package.bat PACKAGE_NAME
```

TODO : finish this with examples.

### Using alias commands

TODO : explain how.

