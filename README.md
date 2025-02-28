# hyades-csaf

This repo tracks integration of CSAF into DependencyTrack (Hyades). Since hyades is a micro-services architecture, the development of the various components is spread into multiple git submodules, which track the official DependencyTrack repo. Each repository has a branch `csaf` that contains the adaption of CSAF into hyades.

We will eventually contribute all the CSAF integration code into upstream DependencyTrack repos, so this repository might not be needed in the future.

## Requirements
* Git
* Maven
* Java 21 OpenJDK
* Docker (as non-root user)

## How to run
Checkout modules, build containers & run
```
./run-it-all.sh
```
* It will create containers & volumes named **hyades-csaf-\***
* **Ports will conflict** with other deployments of DependencyTracks and therefore other instances must be stopped beforehand
* Frontend will be available at [http://localhost:8081/](http://localhost:8081/). You can login with the DependencyTrack default of `admin` / `admin`. Be aware that you need to change the password at the first login.

## Troubleshooting
SELinux may prevent create-topics.sh from running
disable temporarily with 
```
# setenforce 0
```

