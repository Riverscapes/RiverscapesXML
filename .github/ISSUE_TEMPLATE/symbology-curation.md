---
name: Symbology Curation
about: This issue template is for requesting additions or changes to business logic
  and symbology.
title: Symbology for xxxxx Layer in yyyy Project Type
labels: symbology
assignees: ''

---

## Specification
*Project Type*:  `e.g. Riverscapes Context` 
*Layer(s)*:
Layer 1 name  (reference line in business logic if possible - e.g. :
https://github.com/Riverscapes/RiverscapesXML/blob/85df57997cbcd5927b2cc78c361936b3bed01ea7/RaveBusinessLogic/RSContext.xml#L19

*Type(s)* - Raster or Vector

## Description and/or Explanation of Need
Lorem ipsum 

## Example(s) of Inspiration
Optional: Drag and paste in here any examples or screen shots of what you want this to look like 

-------
## To-Do 
Instructions for tasks:
1. delete those tasks not needed; 
2. check off tasks as you complete them; 
3. do not close issue until all tasks completed
4. reference this issue in all commits (e.g. with `#33` notation where 33 is issue number)

- [ ] Start new branch with descriptive name for these changes (e.g. curation_Veg_RCAT) 
- [ ] Make necessary edits to business logic and commit to new branch 
- [ ] Author `*.qml` for QRAVE of layer(s) and test in QRAVE and commit
- [  ] Produce screen shot of each qml layer to provide in commit or later pull request for reviewer (include legend). Also, provide warehouse link to riverscape project you did testing on (use same project(s) for testing ArcRAVE and WebRAVE)
- [ ] Make pull request for just QRAVE changes. Choose appropriate reviewer(s)
- [ ] Author `*.lyr` for ArcRAVE of layer(s) and test in ArcRAVE and commit  
- [ ] Make pull request for just ArcRAVE changes. Choose appropriate reviewer(s)
- [ ] Produce screen shot of each lyr file to provide in commit or later pull request for reviewer (include legend)
- [ ] Author symbology files for WebRAVE and provide link in commit to webRAVE of project it can be tested on
- [ ] Make pull request for just WebRAVE changes. Choose appropriate reviewer(s)
- [ ] Author or Update any project type documentation
- [ ] Update or Add Project Views to Reflect Changes (if necc.)
