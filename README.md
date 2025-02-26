# hyades-csaf

This repo tracks integration of CSAF into DependencyTrack (Hyades). Since hyades is a micro-services architecture, the development of the various components is spread into multiple git submodules, which track the official DependencyTrack repo. Each repository has a branch `csaf` that contains the adaption of CSAF into hyades.

## How to run
Checkout and update submodules
```
git submodule update --init --recursive
```

Build containers & run
```
./run-it-all.sh
```
* It will create containers & volumes named **hyades-csaf-\***
* **Ports will conflict** with other deployments of DependencyTracks and therefore other instances must be stopped beforehand

## Troubleshooting
SELinux may prevent create-topics.sh from running
disable temporarily with 
```
# setenforce 0
```

