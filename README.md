# **SFDX-Project for the File preview bug**

## create scratch org:  
sfdx force:org:create -f config/project-scratch-def.json -a fpbug -s  
sfdx force:source:push  
sfdx force:org:open  
