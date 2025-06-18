#!/usr/bin/env bash

# Colors
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)

echo "${CYAN}${BOLD}📁 Organizing files in the current directory...${RESET}"
sleep 1

# Mapping extensions to folders
declare -A folders
folders=( 
  ["jpg"]="Pictures" ["jpeg"]="Pictures" ["png"]="Pictures" ["gif"]="Pictures"
  ["mp4"]="Videos" ["mkv"]="Videos" ["avi"]="Videos"
  ["pdf"]="Documents" ["doc"]="Documents" ["docx"]="Documents" ["txt"]="Documents"
  ["zip"]="Archives" ["tar"]="Archives" ["gz"]="Archives"
  ["mp3"]="Audio" ["wav"]="Audio"
)

# Create folders if needed and move files
for file in *.*; do
  [[ -f "$file" ]] || continue  # skip if not a regular file

  ext="${file##*.}"            # get extension (after last dot)
  ext="${ext,,}"               # convert to lowercase

  folder="${folders[$ext]}"

  if [[ -n "$folder" ]]; then
    mkdir -p "$folder"
    mv "$file" "$folder/"
    echo "${GREEN}✔ Moved $file to $folder/${RESET}"
  fi
done

echo ""
echo "${CYAN}✅ Done organizing!${RESET}"

