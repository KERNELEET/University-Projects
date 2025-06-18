#!/usr/bin/env bash

# Colors
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)
BOLD=$(tput bold)

clear
echo "${CYAN}${BOLD}🌤️  Weather Forecast CLI${RESET}"
echo ""

# Prompt for city
read -p "Enter city name (e.g. Karachi, London, Tokyo): " city

if [[ -z "$city" ]]; then
  echo "⚠️  City name cannot be empty."
  exit 1
fi

# Fetch and display weather
echo ""
echo "${CYAN}${BOLD}Fetching weather for $city...${RESET}"
echo ""

curl -s "wttr.in/$city?0" || echo "⚠️  Failed to fetch weather data."

echo ""
