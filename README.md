# Riverscapes Program XML

This repo contains all the master XML that controls the riverscapes warehouse

## Contents

`/Program.xsd` this is the main file that controls how all the programs are built. Be Very careful about changing it.

### `/Programs`

This is where the 'program.xml' files for each program live. Follow the pattern to create new programs.

### `/Projects`

This is where the project XSD lives. The XSD controls the rules for each project XML. It is separated from the programs because programs may share project definintions

## IMPORTANT!!! What to change

### AWS SSM Store

These urls are stored in the AWS System manager store for easy lookup by processes like lambda. In the Riverscapes warehouse repo there is a shell script to update this and a `.programs.json` file that is `.gitignore`'d 

`AWS Systems Manager --> Parameter Store`

You might also need to rebuild and redeploy any lambda works. Look for `PROGRAMS_DIR_JSON`