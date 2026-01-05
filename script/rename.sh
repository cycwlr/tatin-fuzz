#!/bin/bash
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <name>"
    exit 1
fi

echo "Renaming project to '$1' ..."

# Renaming LibrePCB workspace and project name
cd ../librepcb/projects
mv new-project/new-project.lpp new-project/$1.lpp
mv new-project/ $1/
echo "LibrePCB files OK" 

# Renaming KiCad project
cd ../../kicad/new-project
mv new-project.kicad_pcb $1.kicad_pcb
mv new-project.kicad_pro $1.kicad_pro
mv new-project.kicad_prl $1.kicad_prl
mv new-project.kicad_sch $1.kicad_sch
mv new-project-backups/ $1-backups/
cd ..
mv new-project/ $1/
echo "KiCad files OK"

echo "Done !"