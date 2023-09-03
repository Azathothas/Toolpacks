#!/usr/bin/env bash

# For debug
#set -x

#A bit of Styling
RED='\033[31m'
GREEN='\033[32m'
DGREEN='\033[38;5;28m'
GREY='\033[37m'
BLUE='\033[34m'
YELLOW='\033[33m'
PURPLE='\033[35m'
PINK='\033[38;5;206m'
VIOLET='\033[0;35m'
RESET='\033[0m'
NC='\033[0m'

#----------------------------------------------------------------------------#
# Deps: curl + dos2unix + sponge (moreutils)
#----------------------------------------------------------------------------#
#Banner
echo -e "${PURPLE}"
cat << "EOF"
                _____  _   _  _____ 
               |  __ \| \ | |/ ____|
  _ __ ___  ___| |  | |  \| | (___  
 | '__/ _ \/ __| |  | | . ` |\___ \ 
 | | |  __/\__ \ |__| | |\  |____) |
 |_|  \___||___/_____/|_| \_|_____/ 
EOF
echo -e "${NC}"   
#----------------------------------------------------------------------------#
# Opts
#Help / Usage
if [[ "$*" == *"-h"* ]] || [[ "$*" == *"--help"* ]] || [[ "$*" == *"help"* ]] ; then
    echo "Usage: $0 [-i | --input {UN_RESOLVED_DOMAINS_FILE}] [-o | --output {OUTPUT_RESOLVED_FILE}]"
    echo "Resolve a list of raw domains using dnsx (-d) | puredns (-p) | shuffledns (-s)"
    echo ""
    echo "Options:"
    echo "-a,  --all              {DOMAINS_FILE}  Use dnsx (Noisy) + PureDNS + ShuffleDNS"    
    echo "-b,  --base             {/path/to/your/root/domains/file}"
    echo "-d,  --dnsx             {DOMAINS_FILE}  Use dnsX to Resolve (Fast But Very Noisy)"
    echo "-e,  --extensive        Runs PureDNS + ShuffleDNS Multiple (2x) Times"
    echo "-i,  --input            {/path/to/your/unresolved/domains/file}"
    echo "-nr, --no-rate-limit    Unlimited Rate Limit for PureDNS | ShuffleDNS"
    echo "-nv, --no-validation    Skips Cleaning, Filtering & Validation of Input"
    echo "-o,  --output           {/path/to/output/file/after/resolving}"
    echo "-p,  --puredns          {DOMAINS_FILE}  Use PureDNS to Resolve (All Domains at Once)"
    echo "-r,  --rate             Rate Limit (DNS Requests (Queries)/Second) [Default: 5000]"
    echo "-s,  --shuffledns       {DOMAINS_FILE}  Use ShuffleDNS to Resolve (Per Domain | Recommended)"
    echo "-w,  --wildcard         Wildcard Limit (How many checks to perform) [Default: 100]"
    echo "-h,  --help             Show this Help Message"                 
 exit 0      
fi   
# Unset 
base_domains=
domains_file=
output_file=
rate_limit=
no_rate_limit=
wildcard_limit=
be_extensive=
skip_validation=
use_all=
use_dnsx=
use_puredns=
use_shuffledns=
# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -a|--all)
            use_all=1
            shift
            ;;
        -b|--base)
            if [ -z "$2" ]; then
                echo -e "${RED}Error: ${YELLOW}Base Domain File${NC} is missing for option ${BLUE}'-b | --base'${NC}"
                exit 1
            fi
            base_domains="$(realpath "$2")" && export base_domains="$base_domains"
            shift
            shift
            ;;
        -d|--dnsx)
            use_dnsx=1
            shift
            ;;
        -e|--extensive)
            be_extensive=1
            shift
            ;;            
        -i|--input)
            if [ -z "$2" ]; then
                echo -e "${RED}Error: ${YELLOW}Input Domain File${NC} is missing for option ${BLUE}'-i | --input'${NC}"
                exit 1
            fi
            domains_file="$(realpath "$2")" && export domains_file="$domains_file"
            shift
            shift
            ;;
        -nv|--no-validation)
            skip_validation=1
            shift
            ;;
        -nr|--no-rate-limit)
            no_rate_limit=1
            shift
            ;;            
        -o|--output)
            if [ -z "$2" ]; then
                echo -e "${RED}Error: ${YELLOW}Output File${NC} is missing for option ${BLUE}'-o | --output'${NC}"
                exit 1
            fi
            output_file="$(realpath "$2")"
            shift
            shift
            ;;
        -r|--rate)
            if [ -z "$2" ]; then
                echo -e "${RED}Error: ${YELLOW}Rate Limit Value${NC} is missing for option ${BLUE}'-r | --rate'${NC}"
                exit 1
            fi
            rate_limit="$2"
            shift
            shift
            ;;
        -p|--puredns)
            use_puredns=1
            shift
            ;;
        -s|--shuffledns)
            use_shuffledns=1
            shift
            ;;
        -w|--wildcard)
            if [ -z "$2" ]; then
                echo -e "${RED}Error: ${YELLOW}Wildcard Limit Value${NC} is missing for option ${BLUE}'-w | --wildcard'${NC}"
                exit 1
            fi
            wildcard_limit="$2"
            shift
            shift
            ;;
        *)
            echo -e "${RED}Error: Invalid option ${YELLOW}'$key'${NC}, try ${BLUE}--help${NC} for Usage"
            exit 1
            ;;
    esac
done
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Sanity Checks
tmp_bin="$(mktemp -d)" && export tmp_bin="$tmp_bin"
export PATH="$tmp_bin:$PATH"
#anew
if ! command -v anew >/dev/null 2>&1; then
   curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/anew" -o "$tmp_bin/anew"
   chmod +xwr "$tmp_bin/anew"
fi
if ! command -v dos2unix >/dev/null 2>&1; then
   echo "dos2unix is not installed"
   echo "Install: sudo apt install dos2unix -y"
   exit 1
fi
#dnsx
if ! command -v dnsx >/dev/null 2>&1; then
   curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/dnsx" -o "$tmp_bin/dnsx"
   chmod +xwr "$tmp_bin/dnsx"
fi
#massdns
if ! command -v massdns >/dev/null 2>&1; then
   curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/massdns" -o "$tmp_bin/massdns"
   chmod +xwr "$tmp_bin/massdns"
else
   #Just in case, sometool do not accept non-standard path
   cp $(which massdns) "$tmp_bin/massdns" ; chmod +xwr "$tmp_bin/massdns" 
fi
#puredns
if ! command -v puredns >/dev/null 2>&1; then
   curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/puredns" -o "$tmp_bin/puredns"
   chmod +xwr "$tmp_bin/puredns"
fi
#shuffledns
if ! command -v shuffledns >/dev/null 2>&1; then
   curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/shuffledns" -o "$tmp_bin/shuffledns"
   chmod +xwr "$tmp_bin/shuffledns"
fi
#sponge
if ! command -v sponge >/dev/null 2>&1; then
   echo "sponge is not installed"
   echo "Install: sudo apt install moreutils -y"
   exit 1
fi
#subxtract
if ! command -v subxtract >/dev/null 2>&1; then
   curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/subxtract" -o "$tmp_bin/subxtract"
   chmod +xwr "$tmp_bin/subxtract"
fi
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
#Check & Parse Domains
parse_domains()
{
  #Ensures proper \r\n
   dos2unix --quiet "$domains_file" 
  #Remove comments, whitespaces and bad chars
   sed -e 's/\s*$//' -e 's/http[s]*:\/\/\|www.//g' -e 's/\s//g' -i "$domains_file" 
  #Filter out *. & output only domains 
   grep -iv "^*" "$domains_file" | grep -Eo '[a-zA-Z0-9]+([.-][a-zA-Z0-9]+)*\.[a-zA-Z]{2,}' | sponge "$domains_file"
  #Do one final cleaning
   sed -e 's/\s*$//' -e '/^$/d'  -i "$domains_file"
}
export -f parse_domains
# #Options
# if [[ -z "$be_extensive" || -z "$use_all" || -z "$use_dnsx" || -z "$use_puredns" || -z "$use_shuffledns" ]]; then
#    echo -e "${RED}\u2717${NC} ${YELLOW} No ${PINK}Resolver Tool ${YELLOW}Specified ${BLUE} [ -h | --help ]${NC}"
#  exit 1  
# fi
#Output
if [ -z "$output_file" ]; then 
   echo -e "${RED}\u2717${NC} ${YELLOW} No ${BLUE}Output File ${YELLOW}Specified ${BLUE} [ -o | --output ]${NC}"
 exit 1 
fi
#RateLimit
if [ -z "$rate_limit" ]; then 
   if [ -z "$no_rate_limit" ]; then 
       echo -e "\n${YELLOW}Rate Limit wasn't Specified.${NC}\n${YELLOW}Using ${RED}5000${YELLOW} as Default Value${NC}\n"
       export rate_limit="5000"
   else
       export rate_limit="Unlimited"
   fi 
fi
#Wildcard
if [ -z "$wildcard_limit" ]; then 
   echo -e "\n${YELLOW}Wildcard Limit wasn't Specified.${NC}\n${YELLOW}Using ${RED}100${YELLOW} as Default Value${NC}\n"
   export wildcard_limit="100"
fi
# Base Domains
if [ -n "$base_domains" ] && [ -e "$base_domains" ]; then
    if [ -n "$skip_validation" ] ; then 
       echo -e "\n${YELLOW}ⓘ Skipping Input Validation for ${BLUE}$base_domains${NC}\n"
    else
        # Parse
         parse_domains
       #Filter root domains  
        #if command -v subxtract >/dev/null 2>&1; then 
        #   cat "$base_domains" | subxtract -s | sed -e '/^$/d' -e '/public[s ]*suffix[s ]*list[s ]*updated/Id' | sponge "$base_domains"
        #   sed -e '/^$/d' -e '/public[s ]*suffix[s ]*list[s ]*updated/Id' -i "$base_domains"
        #fi 
    fi 
else
    echo -e "${RED}\u2717${NC} ${YELLOW} No ${BLUE}Base Domains File ${YELLOW}Specified ${BLUE} [ -b | --base ]${NC}"
    exit 1     
fi
# Domains File
if [ -n "$domains_file" ] && [ -e "$domains_file" ]; then
    if [ -n "$skip_validation" ] ; then 
       echo -e "\n${YELLOW}ⓘ Skipping Input Validation for ${BLUE}$domains_file${NC}\n"
    else
       # Parse
       parse_domains
    fi   
else
    echo -e "${RED}\u2717${NC} ${YELLOW} No ${BLUE}Domains File ${YELLOW}Specified ${BLUE} [ -i | --input ]${NC}"
    exit 1 
fi
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# fetch Resolvers
fetch_resolvers()
{
#Fetch from Sources  
echo -e "\n${GREEN}ⓘ Fetching ${BLUE}@latest ${PURPLE}Resolvers List${NC}\n"
resolvers_dir="$(mktemp -d)" && export resolvers_dir="$resolvers_dir"  
#https://github.com/proabiral/Fresh-Resolvers (Preferred)
  # ~ 200 (IPv6 only)
  curl -qfsSL "https://raw.githubusercontent.com/proabiral/Fresh-Resolvers/master/resolvers.ipv6" -o "$resolvers_dir/proabiral_ipv6.txt"
  # ~ 30K (IPv4 only)
  curl -qfsSL "https://raw.githubusercontent.com/proabiral/Fresh-Resolvers/master/resolvers.txt" -o "$resolvers_dir/proabiral_ipv4.txt"
#https://github.com/edoardottt/secfiles/tree/main/dns  (No IPv6)
  # ~ 300 (IPv4 only)
  curl -qfsSL "https://raw.githubusercontent.com/edoardottt/secfiles/main/dns/trusted-resolvers-small.txt" -o "$resolvers_dir/secfiles_trusted_ipv4.txt"
  # ~ 5K (IPv4 only)
  curl -qfsSL "https://raw.githubusercontent.com/edoardottt/secfiles/main/dns/trusted-resolvers-medium.txt" -o "$resolvers_dir/secfiles_mid_ipv4.txt"
  # ~ 20K (IPv4 only)
  curl -qfsSL "https://raw.githubusercontent.com/edoardottt/secfiles/main/dns/trusted-resolvers-big.txt" -o "$resolvers_dir/secfiles_big_ipv4.txt"
#https://github.com/trickest/resolvers/tree/main
  # ~ 50 (Trusted IPv4 Only)
  curl -qfsSL "https://raw.githubusercontent.com/trickest/resolvers/main/resolvers-trusted.txt" -o "$resolvers_dir/trickest_trusted_ipv4.txt"
  # ~ 50k (IPv4 Only)
  curl -qfsSL "https://raw.githubusercontent.com/trickest/resolvers/main/resolvers.txt" -o "$resolvers_dir/trickest_big_ipv4.txt"
#Merge  
resolvers_ipv4="$(mktemp)" && export resolvers_ipv4="$resolvers_ipv4"
resolvers_ipv6="$(mktemp)" && export resolvers_ipv6="$resolvers_ipv6"
  # IPv4
  find "$resolvers_dir" -type f -name '*ipv4*' -exec cat {} + | sort -u -o "$resolvers_ipv4"
  # IPv6
  find "$resolvers_dir" -type f -name '*ipv6*' -exec cat {} + | sort -u -o "$resolvers_ipv6"
}
#export this globally
export -f fetch_resolvers
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
#dnsX
resolve_with_dnsx(){
  # retry {default 2}
  # -rate-limit int  number of dns request/second to make (disabled as default) (default -1)
  # -threads int      number of concurrent threads to use (default 100)
  # wildcard-threshold int  wildcard filter threshold (default 5)
   # Fetch Resolvers
     fetch_resolvers
   # Run 
     dnsx_tmp_out="$(mktemp)" && export dnsx_tmp_out="$dnsx_tmp_out"
     echo -e "\n${YELLOW}ⓘ Rate Limit: ${RED} $rate_limit ${NC}"
     echo -e "\n${YELLOW}ⓘ Wildcard Limit: ${RED} $wildcard_limit ${NC}\n"
     if [ -n "$no_rate_limit" ] ; then
       #Run with Unlimited Queries/Second
        dnsx -disable-update-check -list "$domains_file" -resolver "$resolvers_ipv4" -wildcard-threshold "$wildcard_limit" -silent -output "$dnsx_tmp_out"
     else
       #Run With Specified Rate Limit
        dnsx -disable-update-check -list "$domains_file" -resolver "$resolvers_ipv4" -rate-limit "$rate_limit" -wildcard-threshold "$wildcard_limit" -silent -output "$dnsx_tmp_out"
     fi   
      # Filter 
     sort -u "$dnsx_tmp_out" | anew -q "$output_file"
     sort -u "$output_file" -o "$output_file"
     echo -e "\nTotal Resolved Domains : $(wc -l < $output_file)"     
}
export -f resolve_with_dnsx
#----------------------------------------------------------------------------#
#PureDNS
resolve_with_puredns(){
   # Fetch Resolvers
     fetch_resolvers
   # Run      
     echo -e "\n${YELLOW}ⓘ Rate Limit: ${RED} $rate_limit ${NC}"
     echo -e "\n${YELLOW}ⓘ Wildcard Limit: ${RED} $wildcard_limit ${NC}\n"
     puredns_tmp_out="$(mktemp)" && export puredns_tmp_out="$puredns_tmp_out"
     if [ -n "$no_rate_limit" ] ; then
       #Run with Unlimited Queries/Second
        puredns resolve "$domains_file" --resolvers "$resolvers_ipv4" --skip-sanitize --wildcard-tests "$wildcard_limit" --write "$puredns_tmp_out"
     else
       #Run With Specified Rate Limit
       puredns resolve "$domains_file" --resolvers "$resolvers_ipv4" --skip-sanitize --rate-limit "$rate_limit" --wildcard-tests "$wildcard_limit" --write "$puredns_tmp_out"
     fi  
   # Filter 
     sort -u "$puredns_tmp_out" | anew -q "$output_file"
     sort -u "$output_file" -o "$output_file"
     echo -e "\nTotal Resolved Domains : $(wc -l < $output_file)" 
}
export -f resolve_with_puredns
#----------------------------------------------------------------------------#
#ShuffleDNS
resolve_with_shuffledns(){
  # -retries {by default retries each sub 5 times}
  # -strict-wildcard {performs strict wildcard on all found subdomains}
  # -t {threads} is 10,000/Sec
  # -wt {Number of concurrent wildcard checks (default 25)}
   # Fetch Resolvers
     fetch_resolvers
   # Run for each domain
    echo -e "${YELLOW}ⓘ Generating Workers for each ShuffleDNS Instance ${NC}\n"
    echo -e "\n${YELLOW}ⓘ Rate Limit: ${RED} $rate_limit ${NC}"
    echo -e "\n${YELLOW}ⓘ Wildcard Limit: ${RED} $wildcard_limit ${NC}\n"
    tmp_shuff_dir="$(mktemp -d)" && export tmp_shuff_dir="$tmp_shuff_dir"
    for shuff_domains in $(cat "$base_domains"); do
     #Filter matching subs  
       tmp_shuff_base="$(mktemp)"
       echo -e "\n-----------------------------\n${YELLOW}ⓘ Base Domain : ${BLUE}${shuff_domains}${NC}"
       grep -i "${shuff_domains}" "$domains_file" > "$tmp_shuff_base"
       echo -e "${YELLOW}ⓘ Domains To Resolve : ${PINK}$(wc -l < $tmp_shuff_base)${NC}\n"
      #Run 
        #For some reason, fails to find massdns path
        if [ -n "$no_rate_limit" ] ; then
          #Run with Unlimited Queries/Second
           shuffledns -disable-update-check -domain "${shuff_domains}" -list "$tmp_shuff_base" -resolver "$resolvers_ipv4" -strict-wildcard -wt "$wildcard_limit" -m "$tmp_bin/massdns" -output "$tmp_shuff_dir/${shuff_domains}.txt"
        else
          #Run With Specified Rate Limit
           shuffledns -disable-update-check -domain "${shuff_domains}" -list "$tmp_shuff_base" -resolver "$resolvers_ipv4" -strict-wildcard -t "$rate_limit" -wt "$wildcard_limit" -m "$tmp_bin/massdns" -output "$tmp_shuff_dir/${shuff_domains}.txt"
        fi
    done
   # Filter 
     find "$tmp_shuff_dir" -type f -name '*.txt' -exec cat {} + | sort -u | anew -q "$output_file"
     sort -u "$output_file" -o "$output_file"
     echo -e "\nTotal Resolved Domains : $(wc -l < $output_file)"    
}
export -f resolve_with_shuffledns
#----------------------------------------------------------------------------#

#----------------------------------------------------------------------------#
# Runners (Default)
#dnsx ( -d | --dnsx )
if [ -n "$use_dnsx" ] ; then
   # Run
    resolve_with_dnsx 
fi
#PureDNS ( -p | --PureDNS )
if [ -n "$use_puredns" ] ; then
  # Run
    resolve_with_puredns   
fi
#Shuffledns ( -s | --shuffledns )
if [ -n "$use_shuffledns" ] ; then
  # Run
    resolve_with_shuffledns   
fi
# Runners (dnsx + puredns + shuffledns)
if [ -n "$use_all" ] ; then
  # Run
  echo -e "${YELLOW}ⓘ Running ${PURPLE} dnsX ${YELLOW}+ ${PURPLE}PureDNS ${YELLOW}+ ${PURPLE}ShuffleDNS${NC}\n"
    resolve_with_dnsx ; resolve_with_puredns ; resolve_with_shuffledns
fi
# Runners (Extensive: Runs Twice)
if [ -n "$be_extensive" ] ; then
  # Run
  echo -e "${YELLOW}ⓘ Running ${PURPLE}PureDNS ${PURPLE}(2x) ${YELLOW}+ ${PURPLE}ShuffleDNS ${PURPLE}(2x) ${PINK}(EXTENSIVE)${NC}\n" 
    resolve_with_puredns ; resolve_with_shuffledns ; resolve_with_puredns ; resolve_with_shuffledns
fi
#----------------------------------------------------------------------------#
# Filter
echo -e "\n${YELLOW}ⓘ You Must Further ${PINK}Filter${YELLOW} your ${BLUE}$output_file ${NC}"
echo -e "${YELLOW}ⓘ Generate Scope ${DGREEN}--> ${BLUE} https://github.com/Azathothas/Arsenal/tree/main/scopegen${NC}"
echo -e "${YELLOW}ⓘ Filter Scope ${DGREEN}--> ${BLUE} https://github.com/Azathothas/Arsenal/tree/main/scopeview${NC}"
#----------------------------------------------------------------------------#
#EOF
