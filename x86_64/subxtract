#!/bin/bash

#A bit of Styling
RED='\033[31m'
GREEN='\033[32m'
DGREEN='\033[38;5;28m'
GREY='\033[37m'
BLUE='\033[34m'
YELLOW='\033[33m'
PURPLE='\033[35m'
PINK='\033[38;5;206m'
RESET='\033[0m'
NC='\033[0m'

# InstallationLess
# bash <(curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Utils/main/Binaries/Tools/Arsenal/subxtract/subxtract.sh") 

#Help / Usage
if [[ "$*" == *"-h"* ]] || [[ "$*" == *"--help"* ]] || [[ "$*" == *"help"* ]] ; then
#Banner
echo -e "${PURPLE}"
cat << "EOF"
                 _,--=--._
               ,'    _    `.
              -    _(_)_o   -
         ____'    /_  _/]    `____
  -=====::(+):::::::::::::::::(+)::=====-
           (+).""""""""""""",(+)
               . subXtract ,
                 `  -=-  '
EOF
echo -e "${NC}"
  echo -e "${YELLOW}➼ Usage${NC}: ${PURPLE}subxtract${NC} ${BLUE}-i${NC} ${GREEN}</path/to/domain/urls.txt> ${NC}"
  echo ""
  echo -e "${YELLOW}Extended Help${NC}:"
  echo -e "${BLUE}-i${NC},  ${BLUE}--input${NC}     Specify input file containing domains or urls (${YELLOW}Required${NC})\n                 else stdin: ${YELLOW}cat${NC} ${BLUE}domains.txt${NC} ${RED}| ${NC}${PURPLE}subxtract${NC}\n"
  echo -e "${BLUE}-s${NC},  ${BLUE}--subs${NC}      Extract ${BLUE}(ROOT.tld) Main Domains only${NC} (default: false)"  
  #echo -e "${BLUE}-up${NC}, ${BLUE}--update${NC}    ${GREEN}Update ${PURPLE}subxtract${NC}\n"
  exit 0
fi

#Dependency Checks
#fasttld
if ! command -v fasttld >/dev/null 2>&1; then
   fasttld_bin="$(mktemp)"
   export fasttld_bin="$fasttld_bin"
   curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/fasttld" -o "$fasttld_bin"
   chmod +xwr "$fasttld_bin"
fi

# Initialize variables
input_file=""
extract_subs=false

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -i|--input)
      input_file="$2"
      shift 
      shift 
      ;;
    -s|--subs)
      extract_subs=true
      shift 
      ;;
    *) 
      echo "Invalid: $key, use --help for help "
      exit 1
      ;;
  esac
done

# Read from file or stdin
declare -A seen_tlds=() #initialize associative array
if [[ -n "$input_file" ]]; then
  while read -r domain; do
    if $extract_subs; then
      # Refresh Public Suffix lists
      "$fasttld_bin" extract "test.com" >/dev/null 2>&1 ; "$fasttld_bin" extract "test.com" >/dev/null 2>&1 
      # Extract ROOTS
      subdomain_and_domain=$("$fasttld_bin" extract "$domain" | grep -E 'domain:|suffix:' | awk '{print $2}' | sed -n '2,3p' | sed -n '1p;2p' | tr '\n' '.' | sed 's/\.$//')
      if [[ -n "$subdomain_and_domain" && -z "${seen_tlds[$subdomain_and_domain]}" ]]; then
        echo "$subdomain_and_domain" | sed '/^$/d'
        seen_tlds[$subdomain_and_domain]=1
      fi
    else
      tld=$("$fasttld_bin" extract "$domain" | awk '/^ *domain:/ {print $NF}')
      if [[ -n "$tld" && -z "${seen_tlds[$tld]}" ]]; then
        echo "$tld" | sed '/^$/d'
        seen_tlds[$tld]=1
      fi
    fi
  done < "$input_file"
else
  while read -r domain; do
    if $extract_subs; then
      # Refresh Public Suffix lists
      "$fasttld_bin" extract "test.com" >/dev/null 2>&1 ; "$fasttld_bin" extract "test.com" >/dev/null 2>&1 
      # Extract ROOT.tld
      subdomain_and_domain=$("$fasttld_bin" extract "$domain" | grep -E 'domain:|suffix:' | awk '{print $2}' | sed -n '2,3p' | sed -n '1p;2p' | tr '\n' '.' | sed 's/\.$//')
      if [[ -n "$subdomain_and_domain" && -z "${seen_tlds[$subdomain_and_domain]}" ]]; then
        echo "$subdomain_and_domain" | sed '/^$/d'
        seen_tlds[$subdomain_and_domain]=1
      fi
    else
      tld=$("$fasttld_bin" extract "$domain" | awk '/^ *domain:/ {print $NF}')
      if [[ -n "$tld" && -z "${seen_tlds[$tld]}" ]]; then
        echo "$tld" | sed '/^$/d'
        seen_tlds[$tld]=1
      fi
    fi
  done
fi
#EOF
