#!/bin/bash

# https://github.com/whydoineedausernamebro/authcrack

RED='[2;91m'
CYAN='[2;96m'
GREEN='[0;32m'
NC='[0m'

echo -e "${RED}                                         ╔══════════════════════════════════════════════════╗ ${NC}"                                                
echo -e "${RED}                                         ║ ▄▄▄· ▄• ▄▌▄▄▄▄▄ ▄ .▄     ▄▄· ▄▄▄   ▄▄▄·  ▄▄· ▄ •▄║ ${NC}"
echo -e "${RED}                                         ║▐█ ▀█ █▪██▌•██  ██▪▐█    ▐█ ▌▪▀▄ █·▐█ ▀█ ▐█ ▌▪█▌▄ ║ ${NC}"
echo -e "${RED}                                         ║▄█▀▀█ █▌▐█▌ ▐█.▪██▀▐█    ██ ▄▄▐▀▀▄ ▄█▀▀█ ██ ▄▄▐▀▀▄║ ${NC}"
echo -e "${RED}                                         ║▐█ ▪▐▌▐█▄█▌ ▐█▌·██▌▐▀    ▐███▌▐█•█▌▐█ ▪▐▌▐███▌▐█.█║ ${NC}"
echo -e "${RED}                                         ║ ▀  ▀  ▀▀▀  ▀▀▀ ▀▀▀ ·    ▀▀▀ .▀  ▀ ▀  ▀ ·▀▀▀ ·▀   ║ ${NC}"
echo -e "${RED}                                         ╚══════════════════════════════════════════════════╝ ${NC}"
echo -e "${GREEN}                                        Generates 100 codes per second. ${NC}"
echo -e "${GREEN} made by the imperial tolleist empire of robloxia ${NC}"

read -p "${CYAN}Select number of 2FA codes you want to see. might take some time. ${NC}" count

if ! [[ "$count" =~ ^[0-9]+$ ]] || [ "$count" -le 0 ]; then
echo -e "${RED}Invalid input. Please enter a number greater than 0.${NC}"
exit 1
fi

read -p "${CYAN}Enter the filename containing codes to exclude: ${NC}" excludeFile

if [ ! -f "$excludeFile" ]; then
echo -e "${RED}The file $excludeFile does not exist.${NC}"
exit 1
fi

mapfile -t exclude < "$excludeFile"
for ((i=1; i<=count; i++)); do
while :; do
number=$(shuf -i 100000-999999 -n 1)

isExcluded=false
for excludedNumber in "${exclude[@]}"; do
if [ "$number" -eq "$excludedNumber" ]; then
isExcluded=true
break
fi
done

[ "$isExcluded" = false ] && break
done

echo -e "${GREEN}2FA code $i: $number${NC}"
done
