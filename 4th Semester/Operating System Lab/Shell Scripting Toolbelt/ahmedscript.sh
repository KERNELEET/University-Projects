#!/usr/bin/env bash

# Check shell
SHELL_NAME=$(ps -p $$ -o comm=)

# Colors
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)
BOLD=$(tput bold)

# Welcome Message
clear
while(true);do
echo "${CYAN}${BOLD}"
echo "======================================="
echo "       Shell Scripting Toolbelt        "
echo "======================================="
echo "${RESET}"
echo "Shell: $SHELL_NAME"
echo ""

# Menu
echo "${BOLD}Choose an option:${RESET}"
echo "1) System Info Dashboard"
echo "2) File Organizer"
echo "3) Weather Info"
echo "4) Exit"
echo ""

read -p "Enter your choice [1-3]: " choice
echo ""

case $choice in
  1)
    # System Info Dashboard
    echo "${CYAN}${BOLD}SYSTEM INFO DASHBOARD${RESET}"
    echo "---------------------------------------"
    echo "${GREEN}Hostname      :${RESET} $(hostname)"
    echo "${GREEN}OS            :${RESET} $(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')"
    echo "${GREEN}Kernel        :${RESET} $(uname -r)"
    echo "${GREEN}Uptime        :${RESET} $(uptime -p)"
    echo "${GREEN}CPU Load      :${RESET} $(uptime | awk -F'load average:' '{ print $2 }' | sed 's/ //g')"
    echo "${GREEN}Memory Usage  :${RESET} $(free -h | awk '/Mem:/ {print $3 " / " $2}')"
    echo "${GREEN}Disk Usage    :${RESET} $(df -h / | awk '/\// {print $3 " / " $2 " (" $5 ")"}')"
    echo "${GREEN}IP Address    :${RESET} $(hostname -I | awk '{print $1}')"
    echo "${GREEN}Logged Users  :${RESET} $(who | awk '{print $1}' | sort | uniq | xargs)"
    echo "${GREEN}Date & Time   :${RESET} $(date)"
    echo ""

    echo "${CYAN}${BOLD}Top 5 Memory-Hungry Processes:${RESET}"
    printf "${GREEN}  %-8s %-8s %-8s %-8s %-s${RESET}\n" "PID" "USER" "%MEM" "%CPU" "COMMAND"
    ps -eo pid,user,%mem,%cpu,comm --sort=-%mem | head -n 6 | awk 'NR>1 {printf "  %-8s %-8s %-8s %-8s %s\n", $1, $2, $3, $4, $5}'
    echo ""
    ;;
  2)
 ./fileorg.sh
  ;;
  3)
  ./weather.sh
  ;;
  4)
    echo "Goodbye!"
    exit 0
    ;;
  *)
    echo "${RED}Invalid choice. Exiting.${RESET}"
    exit 1
    ;;
esac
done
