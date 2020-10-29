This repository contains personal research tipps and scripts that help me automising certain tasks like the reporting of statistical results.  

## Project steps:
**Start of the project:**
- create folder and encrypt with Boxcryptor
- start (private) git & github repo, including:
   - .gitignore
   - notes.md
- start (private) OSF repo
   - remember to not include any identifying info in uploaded documents (for double blind review)

**Before data collection:**
- upload anonymous preregistration on OSF 

**During the project:**
- include any sensitive data directory/file in gitignore
- do not use any identifying participant info in scripts (otherwise in git)

**Before submitting:**
- check if all materials are on OSF (without identifying info)
- put manuscript on psyarxiv but without connecting it to the repo (otherwise repo is not anonymous anymore; you can mention the view anonymous repo link in the preprint though)

**In case of acceptance:**
- make OSF public
- connect psyarxiv preprint to OSF repo
- update OSF README "recommended citation" with the journal version link

## Function Description:
### reporting.R 

**report_brm**: report results for a variable of a brms model (or its fixed effects summary)
