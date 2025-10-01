# hyades-csaf

This repo tracks integration of CSAF into DependencyTrack (Hyades). Since hyades is a micro-services architecture, the development of the various components is spread into multiple git submodules, which track the official DependencyTrack repo. Each repository has a branch `csaf` that contains the adaption of CSAF into hyades.

We will eventually contribute all the CSAF integration code into upstream DependencyTrack repos, so this repository might not be needed in the future.

## Requirements
* Git
* Nodejs and npm
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
## Known Issues
In this section, we list known issues for this project.

### Invalid CSAF document upload does not trigger error message
**Description:**
When attempting to upload an invalid CSAF document, the system does not generate any error message, leading to potential confusion for users.

**Technical Details:**
The validation of the document occurs only within the Mirror Service. Since the Mirror Service cannot communicate directly with the user interface (UI), no warning or error message can be displayed to the user upon upload of an invalid document.

**Impact:**
Users may mistakenly believe that their upload was successful, which can lead to further issues.

**Status:**
This is a known issue and will be documented as a limitation of the current system.

**Link to Issue:** https://github.com/csaf-sbom/hyades-csaf/issues/11
