#!/bin/bash
#══════════════════════════════════════════════════════════════════════════════
#  ███╗   ███╗██████╗ ██╗  ██╗     ██████╗ ██████╗ ███╗   ███╗██████╗ 
#  ████╗ ████║██╔══██╗██║  ██║    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗
#  ██╔████╔██║██║  ██║███████║    ██║     ██║   ██║██╔████╔██║██████╔╝
#  ██║╚██╔╝██║██║  ██║██╔══██║    ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ 
#  ██║ ╚═╝ ██║██████╔╝██║  ██║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     
#  ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     
#══════════════════════════════════════════════════════════════════════════════
#  MDH_COMPRESSER - World's Most Powerful Compression Suite
#  Version: 1.0.0
#  Author: MDHojayfa
#  GitHub: https://github.com/MDHojayfa/MDH_Compresser
#  Telegram: @Urniggar
#  License: MIT
#══════════════════════════════════════════════════════════════════════════════

set -e

#══════════════════════════════════════════════════════════════════════════════
# SECTION 1: COLORS & VARIABLES
#══════════════════════════════════════════════════════════════════════════════

# Neon Colors
RED='\033[0;91m'
GREEN='\033[0;92m'
YELLOW='\033[0;93m'
BLUE='\033[0;94m'
PURPLE='\033[0;95m'
CYAN='\033[0;96m'
WHITE='\033[0;97m'
BOLD='\033[1m'
DIM='\033[2m'
BLINK='\033[5m'
RESET='\033[0m'

# Bright/Neon variants
NEON_GREEN='\033[1;92m'
NEON_PURPLE='\033[1;95m'
NEON_CYAN='\033[1;96m'
NEON_RED='\033[1;91m'
NEON_YELLOW='\033[1;93m'
GOLD='\033[1;33m'

# Paths
INSTALL_DIR="$HOME/.mdhcompresser"
LIB_DIR="$INSTALL_DIR/lib"
CONFIG_DIR="$INSTALL_DIR/config"
BIN_DIR="$HOME/.local/bin"
MAIN_EXEC="$BIN_DIR/mdhcompresser"

# URLs
GITHUB_URL="https://github.com/MDHojayfa/MDH_Compresser"
GITHUB_PROFILE="https://github.com/MDHojayfa"
KEY_URL="https://mdhojayfa.github.io/key.html"
TELEGRAM="@Urniggar"

# Crypto Wallets
BTC_WALLET="bc1q24yndamzynl8afdmy52heclglk79ucu4jqn638"
ETH_WALLET="0xcb99db7464669a52513fae435f7a59e18e8d89f1"
SOL_WALLET="2hbHyZa4deyS12spqo14CPSKFH9dBGYYBLjjHN57x94P"

# Ad Links (70% exe.io, 20% linkvertise, 10% link-hub)
AD_LINK_1="https://exe.io/KGhnFMQ"
AD_LINK_2="https://linkvertise.com/2020139/42UOOrQBhJrw"
AD_LINK_3="https://link-hub.net/2020139/42UOOrQBhJrw"

# Version
VERSION="1.0.0"

#══════════════════════════════════════════════════════════════════════════════
# SECTION 2: UTILITY FUNCTIONS FOR INSTALLER
#══════════════════════════════════════════════════════════════════════════════

print_colored() {
    echo -e "${1}${2}${RESET}"
}

print_banner() {
    clear
    echo -e "${NEON_GREEN}"
    cat << 'EOF'

    ███╗   ███╗██████╗ ██╗  ██╗     ██████╗ ██████╗ ███╗   ███╗██████╗ ██████╗ ███████╗███████╗███████╗███████╗██████╗ 
    ████╗ ████║██╔══██╗██║  ██║    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔══██╗
    ██╔████╔██║██║  ██║███████║    ██║     ██║   ██║██╔████╔██║██████╔╝██████╔╝█████╗  ███████╗███████╗█████╗  ██████╔╝
    ██║╚██╔╝██║██║  ██║██╔══██║    ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██╔══██╗██╔══╝  ╚════██║╚════██║██╔══╝  ██╔══██╗
    ██║ ╚═╝ ██║██████╔╝██║  ██║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ██║  ██║███████╗███████║███████║███████╗██║  ██║
    ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
                                                                                                            
EOF
    echo -e "${RESET}"
    echo -e "${NEON_PURPLE}                              ☠️  COMPRESSION BEYOND LIMITS  ☠️${RESET}"
    echo -e "${CYAN}                                    Version ${VERSION} | By MDHojayfa${RESET}"
    echo ""
}

print_step() {
    echo -e "${NEON_CYAN}[*]${RESET} ${WHITE}$1${RESET}"
}

print_success() {
    echo -e "${NEON_GREEN}[✓]${RESET} ${GREEN}$1${RESET}"
}

print_error() {
    echo -e "${NEON_RED}[✗]${RESET} ${RED}$1${RESET}"
}

print_warning() {
    echo -e "${NEON_YELLOW}[!]${RESET} ${YELLOW}$1${RESET}"
}

spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " ${NEON_PURPLE}[%c]${RESET}  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

#══════════════════════════════════════════════════════════════════════════════
# SECTION 3: OS DETECTION
#══════════════════════════════════════════════════════════════════════════════

detect_os() {
    if [ -f /data/data/com.termux/files/usr/bin/bash ]; then
        echo "termux"
    elif [ -f /etc/debian_version ]; then
        echo "debian"
    elif [ -f /etc/arch-release ]; then
        echo "arch"
    elif [ -f /etc/fedora-release ]; then
        echo "fedora"
    elif [ -f /etc/redhat-release ]; then
        echo "rhel"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif grep -q Microsoft /proc/version 2>/dev/null; then
        echo "wsl"
    else
        echo "unknown"
    fi
}

#══════════════════════════════════════════════════════════════════════════════
# SECTION 4: DEPENDENCY INSTALLATION
#══════════════════════════════════════════════════════════════════════════════

install_dependencies() {
    local os_type=$(detect_os)
    print_step "Detected OS: ${NEON_YELLOW}${os_type}${RESET}"
    echo ""

    case $os_type in
        termux)
            print_step "Updating Termux packages..."
            pkg update -y 2>/dev/null || apt update -y
            pkg upgrade -y 2>/dev/null || apt upgrade -y
            
            print_step "Installing compression tools..."
            pkg install -y p7zip xz-utils zstd lz4 brotli pv bc jq curl termux-api 2>/dev/null || \
            apt install -y p7zip xz-utils zstd lz4 brotli pv bc jq curl termux-api
            
            # Try to install lrzip if available
            pkg install -y lrzip 2>/dev/null || print_warning "lrzip not available, will use fallback"
            ;;
            
        debian|wsl)
            print_step "Updating package lists..."
            sudo apt update -y
            
            print_step "Installing compression tools..."
            sudo apt install -y p7zip-full xz-utils zstd lz4 brotli pv bc jq curl lrzip xclip 2>/dev/null || \
            sudo apt install -y p7zip-full xz-utils zstd lz4 brotli pv bc jq curl
            ;;
            
        arch)
            print_step "Updating packages..."
            sudo pacman -Sy --noconfirm
            
            print_step "Installing compression tools..."
            sudo pacman -S --noconfirm p7zip xz zstd lz4 brotli pv bc jq curl lrzip xclip
            ;;
            
        fedora|rhel)
            print_step "Installing compression tools..."
            sudo dnf install -y p7zip p7zip-plugins xz zstd lz4 brotli pv bc jq curl lrzip xclip
            ;;
            
        macos)
            if ! command -v brew &> /dev/null; then
                print_error "Homebrew not found. Please install it first:"
                echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
                exit 1
            fi
            
            print_step "Installing compression tools via Homebrew..."
            brew install p7zip xz zstd lz4 brotli pv bc jq curl lrzip
            ;;
            
        *)
            print_warning "Unknown OS. Please install manually:"
            echo "  - p7zip / 7zip"
            echo "  - xz-utils"
            echo "  - zstd"
            echo "  - lz4"
            echo "  - brotli"
            echo "  - pv"
            echo "  - bc"
            echo "  - jq"
            echo "  - curl"
            echo "  - lrzip (optional)"
            ;;
    esac
    
    print_success "Dependencies installed!"
}

#══════════════════════════════════════════════════════════════════════════════
# SECTION 5: CREATE DIRECTORY STRUCTURE
#══════════════════════════════════════════════════════════════════════════════

create_directories() {
    print_step "Creating directory structure..."
    
    mkdir -p "$INSTALL_DIR"
    mkdir -p "$LIB_DIR"
    mkdir -p "$CONFIG_DIR"
    mkdir -p "$BIN_DIR"
    
    print_success "Directories created!"
}

#══════════════════════════════════════════════════════════════════════════════
# SECTION 6: CREATE LIBRARY FILES
#══════════════════════════════════════════════════════════════════════════════

create_lib_files() {
    print_step "Generating core libraries..."
    
    #──────────────────────────────────────────────────────────────────────────
    # LIB: ascii_art.sh
    #──────────────────────────────────────────────────────────────────────────
    cat > "$LIB_DIR/ascii_art.sh" << 'ASCIIEOF'
#!/bin/bash
# MDH_COMPRESSER - ASCII Art Library

show_main_logo() {
    echo -e "\033[1;92m"
    cat << 'EOF'
    ███╗   ███╗██████╗ ██╗  ██╗     ██████╗ ██████╗ ███╗   ███╗██████╗ ██████╗ ███████╗███████╗███████╗███████╗██████╗ 
    ████╗ ████║██╔══██╗██║  ██║    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔══██╗
    ██╔████╔██║██║  ██║███████║    ██║     ██║   ██║██╔████╔██║██████╔╝██████╔╝█████╗  ███████╗███████╗█████╗  ██████╔╝
    ██║╚██╔╝██║██║  ██║██╔══██║    ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██╔══██╗██╔══╝  ╚════██║╚════██║██╔══╝  ██╔══██╗
    ██║ ╚═╝ ██║██████╔╝██║  ██║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ██║  ██║███████╗███████║███████║███████╗██║  ██║
    ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
EOF
    echo -e "\033[0m"
}

show_small_logo() {
    echo -e "\033[1;92m"
    cat << 'EOF'
    ╔╦╗╔╦╗╦ ╦  ╔═╗╔═╗╔╦╗╔═╗╦═╗╔═╗╔═╗╔═╗╔═╗╦═╗
    ║║║ ║║╠═╣  ║  ║ ║║║║╠═╝╠╦╝║╣ ╚═╗╚═╗║╣ ╠╦╝
    ╩ ╩═╩╝╩ ╩  ╚═╝╚═╝╩ ╩╩  ╩╚═╚═╝╚═╝╚═╝╚═╝╩╚═
EOF
    echo -e "\033[0m"
}

show_skull() {
    echo -e "\033[1;95m"
    cat << 'EOF'
                      ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
                      ░░░░░░░░░░▄▄▄▄▄▄▄▄▄▄▄▄▄▄░░░░░░░░░░░
                      ░░░░░░░▄█████████████████▄░░░░░░░░░
                      ░░░░░░██████████████████████░░░░░░░
                      ░░░░░████████████████████████░░░░░░
                      ░░░░░████████▀░░░░░░▀████████░░░░░░
                      ░░░░░████████░░░░░░░░████████░░░░░░
                      ░░░░░░▀████░░░▀░░░▀░░░████▀░░░░░░░░
                      ░░░░░░░░░▀▀█▄░░░░░░░▄█▀▀░░░░░░░░░░░
                      ░░░░░░░░░░░░░▀▀▀▀▀▀▀░░░░░░░░░░░░░░░
EOF
    echo -e "\033[0m"
}

show_dragon() {
    echo -e "\033[1;91m"
    cat << 'EOF'
                                  ______________
                             ,===:'.,            `-._
                                  `:.`---.__         `-._
                                    `:.     `--.         `.
                                      \.        `.         `.
                              (,,(,    \.         `.   ____,-`.,
                           (,'     `/   \.   ,--.___`.'
                       ,  ,'  ,--.  `,   \.;'         `
                        `{D, {    \  :    \;
                          V,,'    /  /    //
                          j;;    /  ,' ,-//.    ,---.      ,
                          \;'   /  ,' /  _  \  /  _  \   ,'/
                                \   `'  / \  `'  / \  `.' /
                                 `.___,'   `googol'   `googol'  
EOF
    echo -e "\033[0m"
}

show_fire_border() {
    echo -e "\033[1;91m"
    echo "  🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
    echo -e "\033[0m"
}

show_box() {
    local title="$1"
    local width=60
    echo -e "\033[1;96m"
    echo "  ╔$(printf '═%.0s' $(seq 1 $width))╗"
    printf "  ║ %-${width}s ║\n" "$title"
    echo "  ╚$(printf '═%.0s' $(seq 1 $width))╝"
    echo -e "\033[0m"
}

show_mode_header() {
    local mode_name="$1"
    local mode_icon="$2"
    echo ""
    echo -e "\033[1;95m  ┌────────────────────────────────────────────────────────────┐\033[0m"
    echo -e "\033[1;95m  │\033[0m  ${mode_icon} \033[1;97m${mode_name}\033[0m"
    echo -e "\033[1;95m  └────────────────────────────────────────────────────────────┘\033[0m"
    echo ""
}
ASCIIEOF

    #──────────────────────────────────────────────────────────────────────────
    # LIB: quotes.sh
    #──────────────────────────────────────────────────────────────────────────
    cat > "$LIB_DIR/quotes.sh" << 'QUOTESEOF'
#!/bin/bash
# MDH_COMPRESSER - Quotes Library (40+ quotes)

QUOTES=(
    "We don't just compress files. We compress them to the theoretical limit.|MDHojayfa"
    "In the realm of bytes, the wise compress. The foolish bloat.|MDHojayfa"
    "Every megabyte saved is a victory against chaos.|MDHojayfa"
    "Compression is not just a technique. It's digital alchemy.|MDHojayfa"
    "The strongest warriors know when to make things smaller.|MDHojayfa"
    "Size doesn't matter. Compression ratio does.|MDHojayfa"
    "In a world of bloated files, be the one who compresses.|MDHojayfa"
    "True power lies not in expansion, but in compression.|MDHojayfa"
    "A compressed file is a disciplined file.|MDHojayfa"
    "The path to efficiency is paved with smaller bytes.|MDHojayfa"
    "Compress today, save storage forever.|MDHojayfa"
    "Where others see data, I see compression potential.|MDHojayfa"
    "The forbidden zone awaits those brave enough to enter.|MDHojayfa"
    "MDH_ZONE: Where files go to become legends.|MDHojayfa"
    "Every byte compressed is a byte earned.|MDHojayfa"
    "Patience in compression leads to excellence in ratio.|MDHojayfa"
    "The journey of a terabyte begins with a single compress.|MDHojayfa"
    "Fear not the large file, for MDH_COMPRESSER is with you.|MDHojayfa"
    "In compression we trust.|MDHojayfa"
    "Your files called. They want to be smaller.|MDHojayfa"
    "Bloat is the enemy. Compression is the answer.|MDHojayfa"
    "A true digital warrior masters the art of compression.|MDHojayfa"
    "The best file is a compressed file.|MDHojayfa"
    "When life gives you large files, compress them.|MDHojayfa"
    "Entropy is just a challenge, not a limit.|MDHojayfa"
    "The forbidden protocol exists for those who dare.|MDHojayfa"
    "Small files, big dreams.|MDHojayfa"
    "Compress like nobody's watching.|MDHojayfa"
    "The compression gods smile upon you today.|MDHojayfa"
    "May your ratios be high and your files be small.|MDHojayfa"
    "In the land of storage, the compressor is king.|MDHojayfa"
    "Every master was once a novice who kept compressing.|MDHojayfa"
    "The art of compression is the art of efficiency.|MDHojayfa"
    "Let your files breathe... in compressed form.|MDHojayfa"
    "A compressor's work is never done.|MDHojayfa"
    "Today's compression is tomorrow's freedom.|MDHojayfa"
    "The zone between files and legends is called MDH.|MDHojayfa"
    "Bits and bytes bow before the compressor.|MDHojayfa"
    "Why store when you can compress?|MDHojayfa"
    "The secret to life: good compression ratios.|MDHojayfa"
    "Digital warriors compress. Digital legends use MDH_ZONE.|MDHojayfa"
    "Keep calm and compress on.|MDHojayfa"
    "Your disk space thanks you.|MDHojayfa"
    "Compression: The final frontier.|MDHojayfa"
)

get_random_quote() {
    local total=${#QUOTES[@]}
    local index=$((RANDOM % total))
    echo "${QUOTES[$index]}"
}

display_quote() {
    local quote_data=$(get_random_quote)
    local quote=$(echo "$quote_data" | cut -d'|' -f1)
    local author=$(echo "$quote_data" | cut -d'|' -f2)
    
    echo ""
    echo -e "\033[3;37m  \"${quote}\"\033[0m"
    echo -e "\033[1;95m                                        — ${author}\033[0m"
    echo ""
}

display_quote_slow() {
    local quote_data=$(get_random_quote)
    local quote=$(echo "$quote_data" | cut -d'|' -f1)
    local author=$(echo "$quote_data" | cut -d'|' -f2)
    
    echo ""
    echo -ne "\033[3;37m  \""
    for ((i=0; i<${#quote}; i++)); do
        echo -n "${quote:$i:1}"
        sleep 0.02
    done
    echo -e "\"\033[0m"
    echo -e "\033[1;95m                                        — ${author}\033[0m"
    echo ""
    sleep 3
}
QUOTESEOF

    #──────────────────────────────────────────────────────────────────────────
    # LIB: utils.sh
    #──────────────────────────────────────────────────────────────────────────
    cat > "$LIB_DIR/utils.sh" << 'UTILSEOF'
#!/bin/bash
# MDH_COMPRESSER - Utility Functions

# Colors
RED='\033[0;91m'
GREEN='\033[0;92m'
YELLOW='\033[0;93m'
BLUE='\033[0;94m'
PURPLE='\033[0;95m'
CYAN='\033[0;96m'
WHITE='\033[0;97m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'
NEON_GREEN='\033[1;92m'
NEON_PURPLE='\033[1;95m'
NEON_CYAN='\033[1;96m'
NEON_RED='\033[1;91m'
NEON_YELLOW='\033[1;93m'
GOLD='\033[1;33m'

# Paths
MDH_DIR="$HOME/.mdhcompresser"
LIB_DIR="$MDH_DIR/lib"
CONFIG_DIR="$MDH_DIR/config"
STATS_FILE="$MDH_DIR/stats.json"
KEY_FILE="$MDH_DIR/today.key"
USER_ID_FILE="$MDH_DIR/user_id.txt"

# URLs
AD_LINK_1="https://exe.io/KGhnFMQ"
AD_LINK_2="https://linkvertise.com/2020139/42UOOrQBhJrw"
AD_LINK_3="https://link-hub.net/2020139/42UOOrQBhJrw"
KEY_URL="https://mdhojayfa.github.io/key.html"

# Crypto
BTC_WALLET="bc1q24yndamzynl8afdmy52heclglk79ucu4jqn638"
ETH_WALLET="0xcb99db7464669a52513fae435f7a59e18e8d89f1"
SOL_WALLET="2hbHyZa4deyS12spqo14CPSKFH9dBGYYBLjjHN57x94P"

print_colored() {
    echo -e "${1}${2}${RESET}"
}

print_success() {
    echo -e "${NEON_GREEN}[✓]${RESET} ${GREEN}$1${RESET}"
}

print_error() {
    echo -e "${NEON_RED}[✗]${RESET} ${RED}$1${RESET}"
}

print_warning() {
    echo -e "${NEON_YELLOW}[!]${RESET} ${YELLOW}$1${RESET}"
}

print_info() {
    echo -e "${NEON_CYAN}[*]${RESET} ${WHITE}$1${RESET}"
}

# Format bytes to human readable
format_size() {
    local bytes=$1
    if [ $bytes -ge 1073741824 ]; then
        echo "$(echo "scale=2; $bytes/1073741824" | bc) GB"
    elif [ $bytes -ge 1048576 ]; then
        echo "$(echo "scale=2; $bytes/1048576" | bc) MB"
    elif [ $bytes -ge 1024 ]; then
        echo "$(echo "scale=2; $bytes/1024" | bc) KB"
    else
        echo "$bytes B"
    fi
}

# Format seconds to human readable
format_time() {
    local seconds=$1
    if [ $seconds -ge 3600 ]; then
        echo "$(($seconds/3600))h $(($seconds%3600/60))m $(($seconds%60))s"
    elif [ $seconds -ge 60 ]; then
        echo "$(($seconds/60))m $(($seconds%60))s"
    else
        echo "${seconds}s"
    fi
}

# Get file size in bytes
get_file_size() {
    local file="$1"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        stat -f%z "$file" 2>/dev/null || echo 0
    else
        stat -c%s "$file" 2>/dev/null || echo 0
    fi
}

# Check internet connectivity
check_internet() {
    if ping -c 1 google.com &> /dev/null || ping -c 1 8.8.8.8 &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Detect OS
detect_os() {
    if [ -f /data/data/com.termux/files/usr/bin/bash ]; then
        echo "termux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif grep -q Microsoft /proc/version 2>/dev/null; then
        echo "wsl"
    else
        echo "linux"
    fi
}

# Copy to clipboard
copy_to_clipboard() {
    local text="$1"
    local os_type=$(detect_os)
    
    case $os_type in
        termux)
            echo -n "$text" | termux-clipboard-set 2>/dev/null && return 0
            ;;
        macos)
            echo -n "$text" | pbcopy 2>/dev/null && return 0
            ;;
        *)
            if command -v xclip &> /dev/null; then
                echo -n "$text" | xclip -selection clipboard 2>/dev/null && return 0
            elif command -v xsel &> /dev/null; then
                echo -n "$text" | xsel --clipboard 2>/dev/null && return 0
            fi
            ;;
    esac
    return 1
}

# Open URL in browser
open_url() {
    local url="$1"
    local os_type=$(detect_os)
    
    case $os_type in
        termux)
            termux-open-url "$url" 2>/dev/null || am start -a android.intent.action.VIEW -d "$url" 2>/dev/null
            ;;
        macos)
            open "$url" 2>/dev/null
            ;;
        wsl)
            cmd.exe /c start "$url" 2>/dev/null
            ;;
        *)
            xdg-open "$url" 2>/dev/null || sensible-browser "$url" 2>/dev/null
            ;;
    esac
}

# Get random ad link (70% exe.io, 20% linkvertise, 10% link-hub)
get_ad_link() {
    local rand=$((RANDOM % 100))
    if [ $rand -lt 70 ]; then
        echo "$AD_LINK_1"
    elif [ $rand -lt 90 ]; then
        echo "$AD_LINK_2"
    else
        echo "$AD_LINK_3"
    fi
}

# Progress bar
show_progress() {
    local current=$1
    local total=$2
    local width=50
    local percentage=$((current * 100 / total))
    local filled=$((current * width / total))
    local empty=$((width - filled))
    
    # Color gradient based on progress
    local color
    if [ $percentage -lt 33 ]; then
        color="${NEON_GREEN}"
    elif [ $percentage -lt 66 ]; then
        color="${NEON_YELLOW}"
    else
        color="${NEON_PURPLE}"
    fi
    
    printf "\r  ${color}["
    printf "%${filled}s" | tr ' ' '█'
    printf "%${empty}s" | tr ' ' '░'
    printf "]${RESET} ${WHITE}%3d%%${RESET}" $percentage
}

# Animated spinner
show_spinner() {
    local pid=$1
    local message="$2"
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local delay=0.1
    
    while kill -0 $pid 2>/dev/null; do
        local temp=${spinstr#?}
        printf "\r  ${NEON_PURPLE}[%c]${RESET} ${WHITE}%s${RESET}" "$spinstr" "$message"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
    done
    printf "\r  ${NEON_GREEN}[✓]${RESET} ${WHITE}%s${RESET}\n" "$message"
}

# Matrix rain effect
matrix_rain() {
    local duration=${1:-3}
    local cols=$(tput cols)
    local lines=$(tput lines)
    local end_time=$((SECONDS + duration))
    
    # Hide cursor
    tput civis
    
    # Characters to use
    local chars="MDH_COMPRESSER01アイウエオカキクケコサシスセソ"
    local char_len=${#chars}
    
    # Initialize drops
    declare -a drops
    for ((i=0; i<cols; i++)); do
        drops[$i]=$((RANDOM % lines))
    done
    
    while [ $SECONDS -lt $end_time ]; do
        for ((i=0; i<cols; i+=2)); do
            local y=${drops[$i]}
            local char_idx=$((RANDOM % char_len))
            local char="${chars:$char_idx:1}"
            
            # Draw character
            tput cup $y $i
            echo -ne "\033[1;92m${char}\033[0m"
            
            # Fade previous
            local prev_y=$((y - 1))
            if [ $prev_y -ge 0 ]; then
                tput cup $prev_y $i
                echo -ne "\033[0;32m${chars:$((RANDOM % char_len)):1}\033[0m"
            fi
            
            # Move drop
            drops[$i]=$((y + 1))
            if [ ${drops[$i]} -ge $lines ]; then
                drops[$i]=0
            fi
        done
        sleep 0.05
    done
    
    # Show cursor
    tput cnorm
    clear
}

# BIOS-style boot messages
bios_message() {
    local message="$1"
    local status="${2:-OK}"
    local status_color
    
    case $status in
        OK) status_color="${NEON_GREEN}" ;;
        WARN) status_color="${NEON_YELLOW}" ;;
        FAIL) status_color="${NEON_RED}" ;;
        *) status_color="${NEON_CYAN}" ;;
    esac
    
    echo -ne "  ${DIM}${message}${RESET}"
    sleep 0.3
    for i in {1..3}; do
        echo -n "."
        sleep 0.1
    done
    echo -e " [${status_color}${status}${RESET}]"
}
UTILSEOF

    #──────────────────────────────────────────────────────────────────────────
    # LIB: key_system.sh
    #──────────────────────────────────────────────────────────────────────────
    cat > "$LIB_DIR/key_system.sh" << 'KEYSYSEOF'
#!/bin/bash
# MDH_COMPRESSER - Key Verification System

# Secret salt (obfuscated in pieces)
_S1="MDH"
_S2="ZONE"
_S3="2024"
_S4="SECRET"

# Get the secret salt
_get_salt() {
    echo "${_S1}${_S2}${_S3}${_S4}"
}

# Generate today's key (MUST MATCH key.html algorithm!)
generate_today_key() {
    local date=$(date -u +"%Y-%m-%d")
    local salt=$(_get_salt)
    
    # Layer 1: Primary hash
    local hash1=$(echo -n "${date}${salt}" | md5sum | cut -d' ' -f1)
    
    # Layer 2: Secondary hash (hybrid layer)
    local date_clean=$(echo "$date" | tr -d '-')
    local hash2=$(echo -n "${hash1:0:8}${date_clean}" | md5sum | cut -d' ' -f1)
    
    # Layer 3: Combine
    local raw="${hash1:0:8}${hash2:0:8}"
    
    # Format: MDH-XXXX-XXXX-XXXX (uppercase)
    echo "MDH-${raw:0:4}-${raw:4:4}-${raw:8:4}" | tr '[:lower:]' '[:upper:]'
}

# Check if we have a valid stored key for today
check_stored_key() {
    local key_file="$HOME/.mdhcompresser/today.key"
    
    if [ ! -f "$key_file" ]; then
        return 1
    fi
    
    local stored_data=$(cat "$key_file")
    local stored_date=$(echo "$stored_data" | cut -d'|' -f1)
    local stored_key=$(echo "$stored_data" | cut -d'|' -f2)
    local today=$(date -u +"%Y-%m-%d")
    
    if [ "$stored_date" == "$today" ]; then
        local expected_key=$(generate_today_key)
        if [ "$stored_key" == "$expected_key" ]; then
            return 0
        fi
    fi
    
    return 1
}

# Save valid key
save_key() {
    local key="$1"
    local key_file="$HOME/.mdhcompresser/today.key"
    local today=$(date -u +"%Y-%m-%d")
    echo "${today}|${key}" > "$key_file"
}

# Validate user-provided key
validate_key() {
    local user_key="$1"
    local expected_key=$(generate_today_key)
    
    # Normalize: uppercase, trim whitespace
    user_key=$(echo "$user_key" | tr '[:lower:]' '[:upper:]' | tr -d ' ')
    
    if [ "$user_key" == "$expected_key" ]; then
        return 0
    else
        return 1
    fi
}

# Display key prompt
show_key_prompt() {
    source "$HOME/.mdhcompresser/lib/utils.sh"
    source "$HOME/.mdhcompresser/lib/ascii_art.sh"
    
    local max_retries=3
    local retry_count=0
    
    echo ""
    echo -e "${NEON_PURPLE}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON_PURPLE}  ║${RESET}            🔐 ${BOLD}DAILY ACCESS KEY REQUIRED${RESET} 🔐               ${NEON_PURPLE}║${RESET}"
    echo -e "${NEON_PURPLE}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    echo -e "  ${DIM}Get your free daily key at:${RESET}"
    echo -e "  ${NEON_CYAN}${KEY_URL}${RESET}"
    echo ""
    
    while [ $retry_count -lt $max_retries ]; do
        local remaining=$((max_retries - retry_count))
        echo -ne "  ${WHITE}Enter your key (${remaining} attempts remaining): ${NEON_GREEN}"
        read -r user_key
        echo -ne "${RESET}"
        
        if validate_key "$user_key"; then
            save_key "$(generate_today_key)"
            echo ""
            print_success "Key accepted! Welcome, Digital Warrior! 🐉"
            echo ""
            sleep 1
            return 0
        else
            retry_count=$((retry_count + 1))
            if [ $retry_count -lt $max_retries ]; then
                print_error "Invalid key. Please try again."
            fi
        fi
    done
    
    # Max retries exceeded
    echo ""
    print_error "Maximum attempts exceeded!"
    echo ""
    echo -e "  ${YELLOW}Get your key here:${RESET}"
    
    # Show ad link
    local ad_link=$(get_ad_link)
    echo -e "  ${NEON_CYAN}${ad_link}${RESET}"
    echo ""
    echo -e "  ${DIM}Opening in browser...${RESET}"
    sleep 2
    open_url "$ad_link"
    
    return 1
}

# Main key check function
require_key() {
    # First check if we have a valid stored key
    if check_stored_key; then
        return 0
    fi
    
    # Check internet
    if ! check_internet; then
        echo ""
        print_warning "No internet connection detected!"
        echo -e "  ${YELLOW}Running in RESTRICTED MODE (modes 1-3 only)${RESET}"
        echo ""
        return 2  # Special code for offline/restricted mode
    fi
    
    # Show key prompt
    show_key_prompt
    return $?
}
KEYSYSEOF

    #──────────────────────────────────────────────────────────────────────────
    # LIB: compressor.sh
    #──────────────────────────────────────────────────────────────────────────
    cat > "$LIB_DIR/compressor.sh" << 'COMPEOF'
#!/bin/bash
# MDH_COMPRESSER - Compression Engine (9 Modes)

source "$HOME/.mdhcompresser/lib/utils.sh"
source "$HOME/.mdhcompresser/lib/ascii_art.sh"
source "$HOME/.mdhcompresser/lib/quotes.sh"
source "$HOME/.mdhcompresser/lib/gamification.sh"

# Check if file is already compressed
is_already_compressed() {
    local file="$1"
    local ext="${file##*.}"
    ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
    
    case "$ext" in
        jpg|jpeg|png|gif|webp|mp3|mp4|mkv|avi|mov|zip|rar|7z|gz|xz|bz2|zst|lz4|mdh|mdhz)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# Get output filename
get_output_name() {
    local input="$1"
    local mode="$2"
    local base="${input%.*}"
    
    # Remove any existing compression extensions
    base=$(echo "$base" | sed 's/\.tar$//')
    
    if [ "$mode" == "9" ]; then
        echo "${base}.mdhz"
    else
        echo "${base}.mdh"
    fi
}

# Show compression result
show_result() {
    local original_size=$1
    local compressed_size=$2
    local elapsed=$3
    local output_file="$4"
    local mode="$5"
    
    local saved=$((original_size - compressed_size))
    local ratio=0
    if [ $original_size -gt 0 ]; then
        ratio=$(echo "scale=2; (1 - $compressed_size / $original_size) * 100" | bc)
    fi
    
    echo ""
    echo -e "${NEON_GREEN}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}              ✅ ${BOLD}COMPRESSION COMPLETE!${RESET} ✅                  ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    printf "${NEON_GREEN}  ║${RESET}  📁 Original:   %-40s ${NEON_GREEN}║${RESET}\n" "$(format_size $original_size)"
    printf "${NEON_GREEN}  ║${RESET}  📦 Compressed: %-40s ${NEON_GREEN}║${RESET}\n" "$(format_size $compressed_size)"
    printf "${NEON_GREEN}  ║${RESET}  💾 Saved:      %-40s ${NEON_GREEN}║${RESET}\n" "$(format_size $saved)"
    printf "${NEON_GREEN}  ║${RESET}  📊 Ratio:      %-40s ${NEON_GREEN}║${RESET}\n" "${ratio}%"
    printf "${NEON_GREEN}  ║${RESET}  ⏱️  Time:       %-40s ${NEON_GREEN}║${RESET}\n" "$(format_time $elapsed)"
    printf "${NEON_GREEN}  ║${RESET}  📄 Output:     %-40s ${NEON_GREEN}║${RESET}\n" "$(basename "$output_file")"
    echo -e "${NEON_GREEN}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    
    # Update stats
    update_compression_stats $original_size $compressed_size $mode
    
    # Random quote
    display_quote
}

# MODE 1: FLASH ⚡
compress_flash() {
    local input="$1"
    local output=$(get_output_name "$input" "1")
    
    show_mode_header "FLASH MODE" "⚡"
    print_info "Using LZ4 ultra-fast compression..."
    
    local start_time=$SECONDS
    local original_size=$(get_file_size "$input")
    
    if [ -d "$input" ]; then
        tar -cf - "$input" | lz4 -1 -f - "${output}"
    else
        lz4 -1 -f "$input" "${output}"
    fi
    
    local elapsed=$((SECONDS - start_time))
    local compressed_size=$(get_file_size "$output")
    
    show_result $original_size $compressed_size $elapsed "$output" "1"
}

# MODE 2: LITTLE FLOWER 🌸
compress_flower() {
    local input="$1"
    local output=$(get_output_name "$input" "2")
    
    show_mode_header "LITTLE FLOWER MODE" "🌸"
    print_info "Using Zstd fast compression..."
    
    local start_time=$SECONDS
    local original_size=$(get_file_size "$input")
    
    if [ -d "$input" ]; then
        tar -cf - "$input" | zstd -3 -f -o "${output}"
    else
        zstd -3 -f "$input" -o "${output}"
    fi
    
    local elapsed=$((SECONDS - start_time))
    local compressed_size=$(get_file_size "$output")
    
    show_result $original_size $compressed_size $elapsed "$output" "2"
}

# MODE 3: ASIAN 🍜
compress_asian() {
    local input="$1"
    local output=$(get_output_name "$input" "3")
    
    show_mode_header "ASIAN MODE" "🍜"
    print_info "Using 7-Zip balanced compression..."
    
    local start_time=$SECONDS
    local original_size=$(get_file_size "$input")
    
    7z a -mx=5 -mfb=64 -md=32m "${output}" "$input" > /dev/null 2>&1
    
    local elapsed=$((SECONDS - start_time))
    local compressed_size=$(get_file_size "$output")
    
    show_result $original_size $compressed_size $elapsed "$output" "3"
}

# MODE 4: TASTY DRUNK 🍺
compress_drunk() {
    local input="$1"
    local output=$(get_output_name "$input" "4")
    
    show_mode_header "TASTY DRUNK MODE" "🍺"
    print_info "Using 7-Zip high compression..."
    
    local start_time=$SECONDS
    local original_size=$(get_file_size "$input")
    
    7z a -mx=7 -mfb=128 -md=64m "${output}" "$input" > /dev/null 2>&1
    
    local elapsed=$((SECONDS - start_time))
    local compressed_size=$(get_file_size "$output")
    
    show_result $original_size $compressed_size $elapsed "$output" "4"
}

# MODE 5: BEAST 🦁
compress_beast() {
    local input="$1"
    local output=$(get_output_name "$input" "5")
    
    show_mode_header "BEAST MODE" "🦁"
    print_info "Using 7-Zip ultra compression..."
    
    local start_time=$SECONDS
    local original_size=$(get_file_size "$input")
    
    7z a -mx=9 -mfb=256 -md=128m -ms=on "${output}" "$input" > /dev/null 2>&1
    
    local elapsed=$((SECONDS - start_time))
    local compressed_size=$(get_file_size "$output")
    
    show_result $original_size $compressed_size $elapsed "$output" "5"
}

# MODE 6: GODLY 👑
compress_godly() {
    local input="$1"
    local output=$(get_output_name "$input" "6")
    
    show_mode_header "GODLY MODE" "👑"
    print_info "Using XZ extreme compression..."
    
    local start_time=$SECONDS
    local original_size=$(get_file_size "$input")
    
    if [ -d "$input" ]; then
        tar -cf - "$input" | xz -9 -e -f > "${output}"
    else
        xz -9 -e -k -f "$input"
        mv "${input}.xz" "${output}"
    fi
    
    local elapsed=$((SECONDS - start_time))
    local compressed_size=$(get_file_size "$output")
    
    show_result $original_size $compressed_size $elapsed "$output" "6"
}

# MODE 7: LEGENDARY 🐉
compress_legendary() {
    local input="$1"
    local output=$(get_output_name "$input" "7")
    
    show_mode_header "LEGENDARY MODE" "🐉"
    print_info "Using maximum compression algorithms..."
    
    local start_time=$SECONDS
    local original_size=$(get_file_size "$input")
    
    # Try lrzip with zpaq first, fallback to xz
    if command -v lrzip &> /dev/null; then
        print_info "Using LRZIP ZPAQ mode..."
        if [ -d "$input" ]; then
            tar -cf - "$input" | lrzip -z -L 9 -o "${output}" 2>/dev/null
        else
            lrzip -z -L 9 "$input" -o "${output}" 2>/dev/null
        fi
    else
        print_warning "LRZIP not available, using XZ extreme..."
        if [ -d "$input" ]; then
            tar -cf - "$input" | xz -9 -e --memlimit=50% > "${output}"
        else
            xz -9 -e -k --memlimit=50% "$input"
            mv "${input}.xz" "${output}"
        fi
    fi
    
    local elapsed=$((SECONDS - start_time))
    local compressed_size=$(get_file_size "$output")
    
    show_result $original_size $compressed_size $elapsed "$output" "7"
}

# MODE 8: MYTHIC 💀
compress_mythic() {
    local input="$1"
    local output=$(get_output_name "$input" "8")
    
    show_mode_header "MYTHIC MODE" "💀"
    print_info "Multi-pass compression pipeline..."
    print_warning "This may take a while..."
    
    local start_time=$SECONDS
    local original_size=$(get_file_size "$input")
    local temp_file="/tmp/mdh_mythic_$$"
    
    # Pass 1: Tar and Zstd
    print_info "Pass 1: Initial compression..."
    if [ -d "$input" ]; then
        tar -cf - "$input" | zstd -19 -f -o "${temp_file}.zst"
    else
        zstd -19 -f "$input" -o "${temp_file}.zst"
    fi
    
    # Pass 2: XZ extreme on top
    print_info "Pass 2: Secondary compression..."
    xz -9 -e -f "${temp_file}.zst"
    mv "${temp_file}.zst.xz" "${output}"
    
    local elapsed=$((SECONDS - start_time))
    local compressed_size=$(get_file_size "$output")
    
    show_result $original_size $compressed_size $elapsed "$output" "8"
}

# MODE 9: MDH_ZONE ☠️ (THE FORBIDDEN PROTOCOL)
compress_mdhzone() {
    local input="$1"
    local output=$(get_output_name "$input" "9")
    local os_type=$(detect_os)
    
    show_mode_header "☠️  MDH_ZONE - THE FORBIDDEN PROTOCOL  ☠️" "☠️"
    echo ""
    echo -e "${NEON_RED}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON_RED}  ║${RESET}                    ⚠️  ${BOLD}WARNING${RESET} ⚠️                           ${NEON_RED}║${RESET}"
    echo -e "${NEON_RED}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON_RED}  ║${RESET}  This mode uses MAXIMUM resources and may take HOURS.      ${NEON_RED}║${RESET}"
    echo -e "${NEON_RED}  ║${RESET}  Your system may become slow or unresponsive.              ${NEON_RED}║${RESET}"
    echo -e "${NEON_RED}  ║${RESET}  Recommended for OVERNIGHT compression only.               ${NEON_RED}║${RESET}"
    echo -e "${NEON_RED}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    
    # Termux special handling
    if [ "$os_type" == "termux" ]; then
        echo -e "${NEON_YELLOW}  📱 TERMUX DETECTED${RESET}"
        echo ""
        echo -e "  ${WHITE}[1]${RESET} Use memory-limited mode (safer)"
        echo -e "  ${WHITE}[2]${RESET} Unleash FULL POWER (risky)"
        echo -e "  ${WHITE}[0]${RESET} Cancel"
        echo ""
        echo -ne "  ${WHITE}Your choice: ${RESET}"
        read -r termux_choice
        
        case $termux_choice in
            1)
                local mem_limit="--memlimit=512MiB"
                print_info "Using memory-limited mode..."
                ;;
            2)
                echo ""
                echo -e "${NEON_RED}  ⚠️  FULL POWER MODE ⚠️${RESET}"
                echo -e "  ${YELLOW}This may crash your device. I am not responsible for any damage.${RESET}"
                echo ""
                echo -ne "  ${WHITE}Type 'I UNDERSTAND' to continue: ${RESET}"
                read -r confirm
                if [ "$confirm" != "I UNDERSTAND" ]; then
                    print_error "Cancelled."
                    return 1
                fi
                local mem_limit=""
                ;;
            *)
                print_info "Cancelled."
                return 1
                ;;
        esac
    else
        echo -ne "  ${WHITE}Continue? [y/N]: ${RESET}"
        read -r confirm
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            print_info "Cancelled."
            return 1
        fi
    fi
    
    echo ""
    local start_time=$SECONDS
    local original_size=$(get_file_size "$input")
    
    # Check if already compressed
    if is_already_compressed "$input"; then
        print_warning "File appears to be already compressed."
        print_warning "Results may not be optimal. Continuing anyway..."
        sleep 2
    fi
    
    # Stage 1: Prepare
    print_info "Stage 1/4: Preparing data..."
    local temp_dir="/tmp/mdh_zone_$$"
    mkdir -p "$temp_dir"
    
    # Stage 2: Create tar if directory
    if [ -d "$input" ]; then
        print_info "Stage 2/4: Creating solid archive..."
        tar -cf "$temp_dir/data.tar" "$input"
        local work_file="$temp_dir/data.tar"
    else
        local work_file="$input"
    fi
    
    # Stage 3: Maximum compression
    print_info "Stage 3/4: Applying MDH_ZONE compression..."
    echo ""
    
    # Try multiple methods, use best result
    if command -v lrzip &> /dev/null; then
        # LRZIP with ZPAQ mode (best compression)
        print_info "Using LRZIP ZPAQ (maximum power)..."
        lrzip -z -L 9 ${mem_limit:-"--unlimited"} -p $(nproc) "$work_file" -o "$temp_dir/compressed.lrz" 2>/dev/null &
        local compress_pid=$!
        
        # Show quotes while compressing
        while kill -0 $compress_pid 2>/dev/null; do
            display_quote
            sleep 5
        done
        wait $compress_pid
        
        mv "$temp_dir/compressed.lrz" "$output"
    else
        # Fallback to XZ extreme
        print_info "Using XZ extreme (LRZIP not available)..."
        xz -9 -e ${mem_limit:+"$mem_limit"} -T $(nproc) -k "$work_file" &
        local compress_pid=$!
        
        while kill -0 $compress_pid 2>/dev/null; do
            display_quote
            sleep 5
        done
        wait $compress_pid
        
        mv "${work_file}.xz" "$output"
    fi
    
    # Stage 4: Cleanup
    print_info "Stage 4/4: Cleaning up..."
    rm -rf "$temp_dir"
    
    local elapsed=$((SECONDS - start_time))
    local compressed_size=$(get_file_size "$output")
    
    echo ""
    echo -e "${NEON_PURPLE}  ☠️  THE FORBIDDEN PROTOCOL HAS BEEN EXECUTED  ☠️${RESET}"
    echo ""
    
    show_result $original_size $compressed_size $elapsed "$output" "9"
}

# Main compression menu
show_compression_menu() {
    local key_status=$1  # 0 = valid key, 2 = offline/restricted
    
    echo ""
    echo -e "${NEON_PURPLE}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON_PURPLE}  ║${RESET}              🗜️  ${BOLD}SELECT COMPRESSION MODE${RESET} 🗜️                 ${NEON_PURPLE}║${RESET}"
    echo -e "${NEON_PURPLE}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON_PURPLE}  ║${RESET}  ${NEON_GREEN}[1]${RESET} ⚡ FLASH         - Instant speed, low ratio           ${NEON_PURPLE}║${RESET}"
    echo -e "${NEON_PURPLE}  ║${RESET}  ${NEON_GREEN}[2]${RESET} 🌸 LITTLE FLOWER - Fast, balanced ratio              ${NEON_PURPLE}║${RESET}"
    echo -e "${NEON_PURPLE}  ║${RESET}  ${NEON_GREEN}[3]${RESET} 🍜 ASIAN         - Daily driver, good ratio          ${NEON_PURPLE}║${RESET}"
    
    if [ "$key_status" -eq 0 ]; then
        echo -e "${NEON_PURPLE}  ║${RESET}  ${NEON_CYAN}[4]${RESET} 🍺 TASTY DRUNK   - Strong ratio, slower              ${NEON_PURPLE}║${RESET}"
        echo -e "${NEON_PURPLE}  ║${RESET}  ${NEON_CYAN}[5]${RESET} 🦁 BEAST         - Aggressive compression           ${NEON_PURPLE}║${RESET}"
        echo -e "${NEON_PURPLE}  ║${RESET}  ${NEON_CYAN}[6]${RESET} 👑 GODLY         - Extreme power                     ${NEON_PURPLE}║${RESET}"
        echo -e "${NEON_PURPLE}  ║${RESET}  ${NEON_YELLOW}[7]${RESET} 🐉 LEGENDARY     - Maximum ratio                     ${NEON_PURPLE}║${RESET}"
        echo -e "${NEON_PURPLE}  ║${RESET}  ${NEON_YELLOW}[8]${RESET} 💀 MYTHIC        - Multi-pass madness                ${NEON_PURPLE}║${RESET}"
        echo -e "${NEON_PURPLE}  ║${RESET}  ${NEON_RED}[9]${RESET} ☠️  MDH_ZONE      - THE FORBIDDEN PROTOCOL           ${NEON_PURPLE}║${RESET}"
    else
        echo -e "${NEON_PURPLE}  ║${RESET}  ${DIM}[4-9] 🔒 LOCKED - Requires daily key${RESET}                  ${NEON_PURPLE}║${RESET}"
    fi
    
    echo -e "${NEON_PURPLE}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON_PURPLE}  ║${RESET}  ${WHITE}[0]${RESET} ← Back to main menu                                  ${NEON_PURPLE}║${RESET}"
    echo -e "${NEON_PURPLE}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
}

# Handle compression selection
handle_compression() {
    local key_status=$1
    
    show_compression_menu $key_status
    
    echo -ne "  ${WHITE}Select mode: ${RESET}"
    read -r mode
    
    if [ "$mode" == "0" ]; then
        return 0
    fi
    
    # Check if mode requires key
    if [ "$key_status" -ne 0 ] && [ "$mode" -gt 3 ]; then
        print_error "This mode requires a valid daily key!"
        print_info "Get your key at: ${KEY_URL}"
        sleep 2
        return 1
    fi
    
    # Get file/folder
    echo ""
    echo -ne "  ${WHITE}Enter file or folder path: ${RESET}"
    read -r input_path
    
    # Expand ~ if used
    input_path="${input_path/#\~/$HOME}"
    
    if [ ! -e "$input_path" ]; then
        print_error "File or folder not found!"
        sleep 2
        return 1
    fi
    
    # Execute compression
    case $mode in
        1) compress_flash "$input_path" ;;
        2) compress_flower "$input_path" ;;
        3) compress_asian "$input_path" ;;
        4) compress_drunk "$input_path" ;;
        5) compress_beast "$input_path" ;;
        6) compress_godly "$input_path" ;;
        7) compress_legendary "$input_path" ;;
        8) compress_mythic "$input_path" ;;
        9) compress_mdhzone "$input_path" ;;
        *) print_error "Invalid mode!" ;;
    esac
    
    # Offer social share
    offer_social_share
    
    echo ""
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read -r
}
COMPEOF

    #──────────────────────────────────────────────────────────────────────────
    # LIB: extractor.sh
    #──────────────────────────────────────────────────────────────────────────
    cat > "$LIB_DIR/extractor.sh" << 'EXTRACTEOF'
#!/bin/bash
# MDH_COMPRESSER - Universal Extraction Engine

source "$HOME/.mdhcompresser/lib/utils.sh"
source "$HOME/.mdhcompresser/lib/ascii_art.sh"
source "$HOME/.mdhcompresser/lib/gamification.sh"

# Detect file type by magic bytes
detect_file_type() {
    local file="$1"
    local magic=$(xxd -p -l 4 "$file" 2>/dev/null | tr '[:lower:]' '[:upper:]')
    
    case "$magic" in
        504B0304|504B0506) echo "zip" ;;
        377ABCAF) echo "7z" ;;
        1F8B*) echo "gz" ;;
        FD377A58) echo "xz" ;;
        425A68*) echo "bz2" ;;
        04224D18) echo "lz4" ;;
        28B52FFD) echo "zst" ;;
        526172*) echo "rar" ;;
        4C5A4950) echo "lrzip" ;;
        *)
            # Fallback to extension
            local ext="${file##*.}"
            echo "$ext" | tr '[:upper:]' '[:lower:]'
            ;;
    esac
}

# Extract any supported format
extract_file() {
    local input="$1"
    local output_dir="${2:-$(dirname "$input")}"
    
    show_mode_header "UNIVERSAL EXTRACTOR" "📦"
    
    if [ ! -f "$input" ]; then
        print_error "File not found: $input"
        return 1
    fi
    
    local file_type=$(detect_file_type "$input")
    local base_name=$(basename "$input")
    local extract_dir="$output_dir/${base_name%.*}_extracted"
    
    mkdir -p "$extract_dir"
    
    print_info "Detected format: ${NEON_CYAN}${file_type}${RESET}"
    print_info "Extracting to: ${extract_dir}"
    echo ""
    
    local start_time=$SECONDS
    
    case "$file_type" in
        zip)
            unzip -o "$input" -d "$extract_dir" 2>/dev/null || 7z x "$input" -o"$extract_dir" -y
            ;;
        7z|mdh)
            7z x "$input" -o"$extract_dir" -y
            ;;
        mdhz|lrzip)
            if command -v lrzip &> /dev/null; then
                lrzip -d "$input" -o "$extract_dir/extracted"
            else
                print_error "LRZIP not installed. Cannot extract .mdhz files."
                return 1
            fi
            ;;
        gz|tgz)
            if [[ "$input" == *.tar.gz ]] || [[ "$input" == *.tgz ]]; then
                tar -xzf "$input" -C "$extract_dir"
            else
                gunzip -c "$input" > "$extract_dir/${base_name%.gz}"
            fi
            ;;
        xz)
            if [[ "$input" == *.tar.xz ]]; then
                tar -xJf "$input" -C "$extract_dir"
            else
                xz -dk "$input"
                mv "${input%.xz}" "$extract_dir/"
            fi
            ;;
        bz2)
            if [[ "$input" == *.tar.bz2 ]]; then
                tar -xjf "$input" -C "$extract_dir"
            else
                bunzip2 -k "$input"
                mv "${input%.bz2}" "$extract_dir/"
            fi
            ;;
        zst)
            if [[ "$input" == *.tar.zst ]]; then
                tar --zstd -xf "$input" -C "$extract_dir"
            else
                zstd -d "$input" -o "$extract_dir/${base_name%.zst}"
            fi
            ;;
        lz4)
            lz4 -d "$input" "$extract_dir/${base_name%.lz4}"
            ;;
        tar)
            tar -xf "$input" -C "$extract_dir"
            ;;
        rar)
            if command -v unrar &> /dev/null; then
                unrar x "$input" "$extract_dir/"
            elif command -v 7z &> /dev/null; then
                7z x "$input" -o"$extract_dir" -y
            else
                print_error "No RAR extractor found. Install unrar or p7zip."
                return 1
            fi
            ;;
        *)
            # Try 7z as universal fallback
            print_warning "Unknown format. Trying 7z..."
            7z x "$input" -o"$extract_dir" -y 2>/dev/null || {
                print_error "Could not extract file."
                return 1
            }
            ;;
    esac
    
    local elapsed=$((SECONDS - start_time))
    
    echo ""
    print_success "Extraction complete!"
    echo -e "  ${WHITE}Time: $(format_time $elapsed)${RESET}"
    echo -e "  ${WHITE}Location: ${NEON_CYAN}${extract_dir}${RESET}"
    echo ""
    
    # Update stats
    update_extraction_stats
}

# Extraction menu
handle_extraction() {
    echo ""
    echo -e "${NEON_CYAN}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}              📦 ${BOLD}UNIVERSAL EXTRACTOR${RESET} 📦                     ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  Supported: ZIP, 7Z, RAR, TAR, GZ, XZ, BZ2, LZ4, ZST       ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}             MDH, MDHZ, and compound formats               ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    
    echo -ne "  ${WHITE}Enter archive path: ${RESET}"
    read -r input_path
    
    input_path="${input_path/#\~/$HOME}"
    
    if [ ! -f "$input_path" ]; then
        print_error "File not found!"
        sleep 2
        return 1
    fi
    
    extract_file "$input_path"
    
    echo ""
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read -r
}
EXTRACTEOF

    #──────────────────────────────────────────────────────────────────────────
    # LIB: gamification.sh
    #──────────────────────────────────────────────────────────────────────────
    cat > "$LIB_DIR/gamification.sh" << 'GAMEEOF'
#!/bin/bash
# MDH_COMPRESSER - Gamification System

source "$HOME/.mdhcompresser/lib/utils.sh"

STATS_FILE="$HOME/.mdhcompresser/stats.json"

# Initialize stats if not exists
init_stats() {
    if [ ! -f "$STATS_FILE" ]; then
        cat > "$STATS_FILE" << 'STATSINIT'
{
    "user_id": "",
    "total_compressed": 0,
    "total_saved": 0,
    "compressions": 0,
    "extractions": 0,
    "xp": 0,
    "level": 1,
    "achievements": [],
    "first_use": "",
    "last_use": "",
    "mode_usage": {
        "flash": 0,
        "flower": 0,
        "asian": 0,
        "drunk": 0,
        "beast": 0,
        "godly": 0,
        "legendary": 0,
        "mythic": 0,
        "mdhzone": 0
    },
    "best_ratio": 0,
    "streak_days": 0
}
STATSINIT
        # Set user ID and first use
        local user_id=$(cat /proc/sys/kernel/random/uuid 2>/dev/null || echo "user_$(date +%s)")
        local today=$(date -u +"%Y-%m-%d")
        jq --arg uid "$user_id" --arg date "$today" '.user_id = $uid | .first_use = $date | .last_use = $date' "$STATS_FILE" > "${STATS_FILE}.tmp"
        mv "${STATS_FILE}.tmp" "$STATS_FILE"
    fi
}

# Get stat value
get_stat() {
    local key="$1"
    jq -r ".$key" "$STATS_FILE" 2>/dev/null || echo "0"
}

# Update stat value
update_stat() {
    local key="$1"
    local value="$2"
    jq ".$key = $value" "$STATS_FILE" > "${STATS_FILE}.tmp"
    mv "${STATS_FILE}.tmp" "$STATS_FILE"
}

# Increment stat
increment_stat() {
    local key="$1"
    local amount="${2:-1}"
    local current=$(get_stat "$key")
    local new_value=$((current + amount))
    update_stat "$key" "$new_value"
}

# Get mode name from number
get_mode_name() {
    case $1 in
        1) echo "flash" ;;
        2) echo "flower" ;;
        3) echo "asian" ;;
        4) echo "drunk" ;;
        5) echo "beast" ;;
        6) echo "godly" ;;
        7) echo "legendary" ;;
        8) echo "mythic" ;;
        9) echo "mdhzone" ;;
        *) echo "unknown" ;;
    esac
}

# Calculate XP for mode
get_mode_xp() {
    case $1 in
        1|2) echo 5 ;;
        3|4) echo 10 ;;
        5|6) echo 25 ;;
        7|8) echo 50 ;;
        9) echo 100 ;;
        *) echo 1 ;;
    esac
}

# Get level from XP
get_level_from_xp() {
    local xp=$1
    if [ $xp -ge 100000 ]; then echo 8
    elif [ $xp -ge 50000 ]; then echo 7
    elif [ $xp -ge 15000 ]; then echo 6
    elif [ $xp -ge 5000 ]; then echo 5
    elif [ $xp -ge 1500 ]; then echo 4
    elif [ $xp -ge 500 ]; then echo 3
    elif [ $xp -ge 100 ]; then echo 2
    else echo 1
    fi
}

# Get level name
get_level_name() {
    case $1 in
        1) echo "Novice" ;;
        2) echo "Apprentice" ;;
        3) echo "Warrior" ;;
        4) echo "Master" ;;
        5) echo "Grandmaster" ;;
        6) echo "Legend" ;;
        7) echo "Mythic" ;;
        8) echo "MDH_ELITE" ;;
        *) echo "Unknown" ;;
    esac
}

# Update compression stats
update_compression_stats() {
    local original=$1
    local compressed=$2
    local mode=$3
    
    local saved=$((original - compressed))
    local mode_name=$(get_mode_name $mode)
    local xp_earned=$(get_mode_xp $mode)
    
    # Bonus XP for size
    local size_bonus=$((original / 104857600))  # +1 XP per 100MB
    xp_earned=$((xp_earned + size_bonus))
    
    # Update totals
    increment_stat "total_compressed" $original
    increment_stat "total_saved" $saved
    increment_stat "compressions" 1
    increment_stat "xp" $xp_earned
    
    # Update mode usage
    local mode_count=$(jq ".mode_usage.$mode_name" "$STATS_FILE")
    mode_count=$((mode_count + 1))
    jq ".mode_usage.$mode_name = $mode_count" "$STATS_FILE" > "${STATS_FILE}.tmp"
    mv "${STATS_FILE}.tmp" "$STATS_FILE"
    
    # Update level
    local total_xp=$(get_stat "xp")
    local new_level=$(get_level_from_xp $total_xp)
    update_stat "level" $new_level
    
    # Update best ratio
    local ratio=0
    if [ $original -gt 0 ]; then
        ratio=$(echo "scale=0; (1 - $compressed / $original) * 100" | bc)
    fi
    local best=$(get_stat "best_ratio")
    if [ $ratio -gt $best ]; then
        update_stat "best_ratio" $ratio
    fi
    
    # Update last use
    jq --arg date "$(date -u +"%Y-%m-%d")" '.last_use = $date' "$STATS_FILE" > "${STATS_FILE}.tmp"
    mv "${STATS_FILE}.tmp" "$STATS_FILE"
    
    # Check achievements
    check_achievements
    
    # Show XP earned
    echo -e "  ${GOLD}+${xp_earned} XP${RESET} earned!"
}

# Update extraction stats
update_extraction_stats() {
    increment_stat "extractions" 1
    increment_stat "xp" 3
    
    local total_xp=$(get_stat "xp")
    local new_level=$(get_level_from_xp $total_xp)
    update_stat "level" $new_level
    
    check_achievements
}

# Achievement definitions
declare -A ACHIEVEMENTS=(
    ["FIRST_BLOOD"]="First compression|compressions|1"
    ["SPEED_DEMON"]="10 FLASH mode uses|mode_usage.flash|10"
    ["FLOWER_POWER"]="10 LITTLE FLOWER uses|mode_usage.flower|10"
    ["ASIAN_MASTER"]="10 ASIAN mode uses|mode_usage.asian|10"
    ["HAPPY_DRUNK"]="10 TASTY DRUNK uses|mode_usage.drunk|10"
    ["BEAST_TAMER"]="10 BEAST mode uses|mode_usage.beast|10"
    ["GODLIKE"]="10 GODLY mode uses|mode_usage.godly|10"
    ["DRAGON_RIDER"]="10 LEGENDARY uses|mode_usage.legendary|10"
    ["DEATH_WISH"]="10 MYTHIC mode uses|mode_usage.mythic|10"
    ["FORBIDDEN_FRUIT"]="First MDH_ZONE use|mode_usage.mdhzone|1"
    ["ZONE_MASTER"]="10 MDH_ZONE uses|mode_usage.mdhzone|10"
    ["UNPACKER"]="10 extractions|extractions|10"
    ["UNPACK_KING"]="100 extractions|extractions|100"
    ["MEGABYTE_WARRIOR"]="Compress 100MB total|total_compressed|104857600"
    ["GIGABYTE_SLAYER"]="Compress 1GB total|total_compressed|1073741824"
    ["TERABYTE_TITAN"]="Compress 1TB total|total_compressed|1099511627776"
    ["SPACE_SAVER"]="Save 100MB space|total_saved|104857600"
    ["DISK_LIBERATOR"]="Save 1GB space|total_saved|1073741824"
    ["STORAGE_GOD"]="Save 10GB space|total_saved|10737418240"
    ["MODE_EXPLORER"]="Used all 9 modes|special|all_modes"
    ["RATIO_MASTER"]="Achieve 85% compression|best_ratio|85"
    ["RATIO_LEGEND"]="Achieve 95% compression|best_ratio|95"
)

# Check and award achievements
check_achievements() {
    local unlocked=$(get_stat "achievements")
    
    for achievement in "${!ACHIEVEMENTS[@]}"; do
        # Skip if already unlocked
        if echo "$unlocked" | jq -e ". | index(\"$achievement\")" > /dev/null 2>&1; then
            continue
        fi
        
        local data="${ACHIEVEMENTS[$achievement]}"
        local desc=$(echo "$data" | cut -d'|' -f1)
        local stat_key=$(echo "$data" | cut -d'|' -f2)
        local threshold=$(echo "$data" | cut -d'|' -f3)
        
        local current_value
        if [ "$stat_key" == "special" ]; then
            # Special achievements
            if [ "$threshold" == "all_modes" ]; then
                local all_used=true
                for mode in flash flower asian drunk beast godly legendary mythic mdhzone; do
                    local count=$(jq ".mode_usage.$mode" "$STATS_FILE")
                    if [ "$count" -lt 1 ]; then
                        all_used=false
                        break
                    fi
                done
                if [ "$all_used" == "true" ]; then
                    current_value=1
                    threshold=1
                else
                    current_value=0
                fi
            fi
        elif [[ "$stat_key" == mode_usage.* ]]; then
            current_value=$(jq ".$stat_key" "$STATS_FILE")
        else
            current_value=$(get_stat "$stat_key")
        fi
        
        if [ "$current_value" -ge "$threshold" ]; then
            # Award achievement
            jq ".achievements += [\"$achievement\"]" "$STATS_FILE" > "${STATS_FILE}.tmp"
            mv "${STATS_FILE}.tmp" "$STATS_FILE"
            
            echo ""
            echo -e "${GOLD}  🏆 ACHIEVEMENT UNLOCKED: ${achievement}${RESET}"
            echo -e "  ${WHITE}${desc}${RESET}"
            echo ""
        fi
    done
}

# Show stats menu
show_stats() {
    init_stats
    
    local total_compressed=$(get_stat "total_compressed")
    local total_saved=$(get_stat "total_saved")
    local compressions=$(get_stat "compressions")
    local extractions=$(get_stat "extractions")
    local xp=$(get_stat "xp")
    local level=$(get_stat "level")
    local level_name=$(get_level_name $level)
    local best_ratio=$(get_stat "best_ratio")
    local achievements=$(jq '.achievements | length' "$STATS_FILE")
    
    echo ""
    echo -e "${GOLD}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GOLD}  ║${RESET}                  📊 ${BOLD}YOUR STATS${RESET} 📊                          ${GOLD}║${RESET}"
    echo -e "${GOLD}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    printf "${GOLD}  ║${RESET}  🎖️  Level:        %-39s ${GOLD}║${RESET}\n" "$level - $level_name"
    printf "${GOLD}  ║${RESET}  ⭐ XP:           %-39s ${GOLD}║${RESET}\n" "$xp"
    printf "${GOLD}  ║${RESET}  📦 Compressions: %-39s ${GOLD}║${RESET}\n" "$compressions"
    printf "${GOLD}  ║${RESET}  📂 Extractions:  %-39s ${GOLD}║${RESET}\n" "$extractions"
    printf "${GOLD}  ║${RESET}  💾 Compressed:   %-39s ${GOLD}║${RESET}\n" "$(format_size $total_compressed)"
    printf "${GOLD}  ║${RESET}  🔥 Space Saved:  %-39s ${GOLD}║${RESET}\n" "$(format_size $total_saved)"
    printf "${GOLD}  ║${RESET}  📊 Best Ratio:   %-39s ${GOLD}║${RESET}\n" "${best_ratio}%"
    printf "${GOLD}  ║${RESET}  🏆 Achievements: %-39s ${GOLD}║${RESET}\n" "${achievements}/40+"
    echo -e "${GOLD}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read -r
}

# Show achievements
show_achievements() {
    init_stats
    
    local unlocked=$(jq -r '.achievements[]' "$STATS_FILE" 2>/dev/null)
    
    echo ""
    echo -e "${GOLD}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GOLD}  ║${RESET}                 🏆 ${BOLD}ACHIEVEMENTS${RESET} 🏆                          ${GOLD}║${RESET}"
    echo -e "${GOLD}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    
    for achievement in "${!ACHIEVEMENTS[@]}"; do
        local data="${ACHIEVEMENTS[$achievement]}"
        local desc=$(echo "$data" | cut -d'|' -f1)
        
        if echo "$unlocked" | grep -q "^${achievement}$"; then
            echo -e "  ${NEON_GREEN}✅ ${achievement}${RESET} - ${desc}"
        else
            echo -e "  ${DIM}🔒 ${achievement}${RESET} - ${DIM}${desc}${RESET}"
        fi
    done
    
    echo ""
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read -r
}

# Initialize on source
init_stats
GAMEEOF

    #──────────────────────────────────────────────────────────────────────────
    # LIB: social.sh
    #──────────────────────────────────────────────────────────────────────────
    cat > "$LIB_DIR/social.sh" << 'SOCIALEOF'
#!/bin/bash
# MDH_COMPRESSER - Social Sharing System

source "$HOME/.mdhcompresser/lib/utils.sh"

# Global variables for last compression
LAST_FILE=""
LAST_ORIGINAL=0
LAST_COMPRESSED=0
LAST_MODE=""

# Set last compression data
set_last_compression() {
    LAST_FILE="$1"
    LAST_ORIGINAL=$2
    LAST_COMPRESSED=$3
    LAST_MODE="$4"
}

# Generate share text
generate_share_text() {
    local file=$(basename "$LAST_FILE")
    local original=$(format_size $LAST_ORIGINAL)
    local compressed=$(format_size $LAST_COMPRESSED)
    local ratio=0
    if [ $LAST_ORIGINAL -gt 0 ]; then
        ratio=$(echo "scale=1; (1 - $LAST_COMPRESSED / $LAST_ORIGINAL) * 100" | bc)
    fi
    
    local mode_names=("" "FLASH ⚡" "LITTLE FLOWER 🌸" "ASIAN 🍜" "TASTY DRUNK 🍺" "BEAST 🦁" "GODLY 👑" "LEGENDARY 🐉" "MYTHIC 💀" "MDH_ZONE ☠️")
    local mode_name="${mode_names[$LAST_MODE]}"
    
    echo "🔥 Just compressed a file from ${original} to ${compressed} (${ratio}% reduction) using MDH_COMPRESSER by @MDHojayfa!

Mode: ${mode_name}

Get it FREE: github.com/MDHojayfa/MDH_Compresser

#compression #linux #termux #MDH_COMPRESSER"
}

# Offer social share
offer_social_share() {
    # Random chance to show (30%)
    if [ $((RANDOM % 100)) -gt 30 ]; then
        return
    fi
    
    echo ""
    echo -e "${NEON_CYAN}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}            📣 ${BOLD}SHARE YOUR ACHIEVEMENT?${RESET} 📣                  ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  ${WHITE}[1]${RESET} 🐦 Twitter/X                                        ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  ${WHITE}[2]${RESET} 🤖 Reddit                                           ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  ${WHITE}[3]${RESET} 💼 LinkedIn                                         ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  ${WHITE}[4]${RESET} 📋 Copy to clipboard                                ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  ${WHITE}[0]${RESET} Skip                                                ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    echo -ne "  ${WHITE}Choice: ${RESET}"
    read -r choice
    
    local share_text=$(generate_share_text)
    local encoded_text=$(echo "$share_text" | jq -sRr @uri)
    
    case $choice in
        1)
            open_url "https://twitter.com/intent/tweet?text=${encoded_text}"
            print_success "Opening Twitter..."
            ;;
        2)
            open_url "https://www.reddit.com/submit?title=MDH_COMPRESSER%20Achievement&text=${encoded_text}"
            print_success "Opening Reddit..."
            ;;
        3)
            open_url "https://www.linkedin.com/sharing/share-offsite/?url=https://github.com/MDHojayfa/MDH_Compresser"
            print_success "Opening LinkedIn..."
            ;;
        4)
            if copy_to_clipboard "$share_text"; then
                print_success "Copied to clipboard!"
            else
                echo ""
                echo "$share_text"
                echo ""
                print_warning "Could not copy. Text shown above."
            fi
            ;;
        *)
            ;;
    esac
}

# Show donation prompt (random chance)
show_donation_prompt() {
    # 20% chance
    if [ $((RANDOM % 100)) -gt 20 ]; then
        return
    fi
    
    echo ""
    echo -e "${GOLD}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GOLD}  ║${RESET}              💎 ${BOLD}SUPPORT MDH_COMPRESSER${RESET} 💎                   ${GOLD}║${RESET}"
    echo -e "${GOLD}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${WHITE}BTC:${RESET} ${CYAN}${BTC_WALLET}${RESET}  ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${WHITE}ETH:${RESET} ${CYAN}${ETH_WALLET}${RESET}  ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${WHITE}SOL:${RESET} ${CYAN}${SOL_WALLET}${RESET}  ${GOLD}║${RESET}"
    echo -e "${GOLD}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${WHITE}Telegram:${RESET} ${CYAN}@Urniggar${RESET}                                    ${GOLD}║${RESET}"
    echo -e "${GOLD}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
}
SOCIALEOF

    print_success "Library files created!"
}

#══════════════════════════════════════════════════════════════════════════════
# SECTION 7: CREATE MAIN EXECUTABLE
#══════════════════════════════════════════════════════════════════════════════

create_main_executable() {
    print_step "Creating main executable..."
    
    cat > "$MAIN_EXEC" << 'MAINEOF'
#!/bin/bash
#══════════════════════════════════════════════════════════════════════════════
# MDH_COMPRESSER - Main Executable
# World's Most Powerful Compression Suite
# By MDHojayfa | Telegram: @Urniggar
#══════════════════════════════════════════════════════════════════════════════

# Source libraries
MDH_DIR="$HOME/.mdhcompresser"
source "$MDH_DIR/lib/utils.sh"
source "$MDH_DIR/lib/ascii_art.sh"
source "$MDH_DIR/lib/quotes.sh"
source "$MDH_DIR/lib/key_system.sh"
source "$MDH_DIR/lib/compressor.sh"
source "$MDH_DIR/lib/extractor.sh"
source "$MDH_DIR/lib/gamification.sh"
source "$MDH_DIR/lib/social.sh"

VERSION="1.0.0"
KEY_STATUS=1  # 0=valid, 1=invalid, 2=offline

#──────────────────────────────────────────────────────────────────────────────
# BOOT SEQUENCE
#──────────────────────────────────────────────────────────────────────────────

boot_sequence() {
    clear
    
    # Matrix rain effect (3 seconds)
    matrix_rain 3
    
    # Show logo
    clear
    show_main_logo
    
    echo -e "${NEON_PURPLE}                        ☠️  COMPRESSION BEYOND LIMITS  ☠️${RESET}"
    echo -e "${CYAN}                              Version ${VERSION} | By MDHojayfa${RESET}"
    echo ""
    
    # BIOS-style boot messages
    sleep 0.3
    bios_message "Initializing compression matrix" "OK"
    bios_message "Loading quantum algorithms" "OK"
    bios_message "Calibrating entropy analyzers" "OK"
    bios_message "Connecting to MDH_ZONE" "OK"
    bios_message "Awakening the dragon" "OK"
    echo ""
    
    # Show plea message
    echo -e "${NEON_PURPLE}  ┌────────────────────────────────────────────────────────────┐${RESET}"
    echo -e "${NEON_PURPLE}  │${RESET}                                                            ${NEON_PURPLE}│${RESET}"
    echo -e "${NEON_PURPLE}  │${RESET}  ${WHITE}I've worked hard to keep MDH_COMPRESSER completely free.${RESET}  ${NEON_PURPLE}│${RESET}"
    echo -e "${NEON_PURPLE}  │${RESET}  ${WHITE}The daily key helps me earn a small amount to keep${RESET}       ${NEON_PURPLE}│${RESET}"
    echo -e "${NEON_PURPLE}  │${RESET}  ${WHITE}developing. Please don't try to crack or modify this${RESET}     ${NEON_PURPLE}│${RESET}"
    echo -e "${NEON_PURPLE}  │${RESET}  ${WHITE}system. If this project succeeds, I have bigger dreams${RESET}   ${NEON_PURPLE}│${RESET}"
    echo -e "${NEON_PURPLE}  │${RESET}  ${WHITE}I want to build for this community... all free.${RESET}          ${NEON_PURPLE}│${RESET}"
    echo -e "${NEON_PURPLE}  │${RESET}                                                            ${NEON_PURPLE}│${RESET}"
    echo -e "${NEON_PURPLE}  │${RESET}  ${WHITE}Thank you for understanding, warrior.${RESET}                    ${NEON_PURPLE}│${RESET}"
    echo -e "${NEON_PURPLE}  │${RESET}                                          ${CYAN}— MDHojayfa 🐉${RESET}   ${NEON_PURPLE}│${RESET}"
    echo -e "${NEON_PURPLE}  │${RESET}                                                            ${NEON_PURPLE}│${RESET}"
    echo -e "${NEON_PURPLE}  └────────────────────────────────────────────────────────────┘${RESET}"
    echo ""
    
    sleep 3
    
    # Random quote
    display_quote_slow
    
    sleep 1
}

#──────────────────────────────────────────────────────────────────────────────
# MAIN MENU
#──────────────────────────────────────────────────────────────────────────────

show_main_menu() {
    clear
    show_small_logo
    
    local level=$(get_stat "level")
    local level_name=$(get_level_name $level)
    local xp=$(get_stat "xp")
    
    echo -e "  ${DIM}Level: ${level_name} | XP: ${xp}${RESET}"
    echo ""
    echo -e "${NEON_GREEN}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}                    ${BOLD}MAIN MENU${RESET}                              ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${NEON_CYAN}[1]${RESET} 🗜️  COMPRESS                                         ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${NEON_CYAN}[2]${RESET} 📦 EXTRACT                                           ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${NEON_CYAN}[3]${RESET} 📊 MY STATS                                          ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${NEON_CYAN}[4]${RESET} 🏆 ACHIEVEMENTS                                      ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${NEON_CYAN}[5]${RESET} 💎 SUPPORT / DONATE                                  ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${NEON_CYAN}[6]${RESET} 🔑 ENTER NEW KEY                                     ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${NEON_CYAN}[7]${RESET} ❓ HELP                                              ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${WHITE}[0]${RESET} 🚪 EXIT                                              ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    
    if [ $KEY_STATUS -eq 0 ]; then
        echo -e "  ${NEON_GREEN}🔓 Full access unlocked${RESET}"
    elif [ $KEY_STATUS -eq 2 ]; then
        echo -e "  ${NEON_YELLOW}📵 Offline mode (restricted)${RESET}"
    else
        echo -e "  ${NEON_RED}🔒 Key required for advanced modes${RESET}"
    fi
    echo ""
}

show_help() {
    echo ""
    echo -e "${NEON_CYAN}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}                      ${BOLD}HELP${RESET}                                  ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  ${WHITE}MDH_COMPRESSER${RESET} - World's Most Powerful Compression Suite ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}                                                            ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  ${WHITE}COMPRESSION MODES:${RESET}                                       ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  1-3: Free modes (Flash, Flower, Asian)                   ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  4-9: Premium modes (require daily key)                   ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}                                                            ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  ${WHITE}GET YOUR KEY:${RESET}                                            ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  Visit: ${NEON_GREEN}mdhojayfa.github.io/key.html${RESET}                   ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}                                                            ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  ${WHITE}CONTACT:${RESET}                                                  ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  Telegram: @Urniggar                                       ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ║${RESET}  GitHub: github.com/MDHojayfa                              ${NEON_CYAN}║${RESET}"
    echo -e "${NEON_CYAN}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read -r
}

show_donate_menu() {
    echo ""
    echo -e "${GOLD}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GOLD}  ║${RESET}              💎 ${BOLD}SUPPORT MDH_COMPRESSER${RESET} 💎                   ${GOLD}║${RESET}"
    echo -e "${GOLD}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${GOLD}  ║${RESET}                                                            ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${WHITE}Bitcoin (BTC):${RESET}                                           ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${CYAN}${BTC_WALLET}${RESET}       ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}                                                            ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${WHITE}Ethereum (ETH):${RESET}                                          ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${CYAN}${ETH_WALLET}${RESET}             ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}                                                            ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${WHITE}Solana (SOL):${RESET}                                            ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${CYAN}${SOL_WALLET}${RESET}  ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}                                                            ${GOLD}║${RESET}"
    echo -e "${GOLD}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${WHITE}Telegram:${RESET} ${CYAN}@Urniggar${RESET}                                    ${GOLD}║${RESET}"
    echo -e "${GOLD}  ║${RESET}  ${WHITE}GitHub:${RESET} ${CYAN}github.com/MDHojayfa${RESET}                           ${GOLD}║${RESET}"
    echo -e "${GOLD}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    echo -e "  ${WHITE}[1]${RESET} Copy BTC address"
    echo -e "  ${WHITE}[2]${RESET} Copy ETH address"
    echo -e "  ${WHITE}[3]${RESET} Copy SOL address"
    echo -e "  ${WHITE}[0]${RESET} Back"
    echo ""
    echo -ne "  ${WHITE}Choice: ${RESET}"
    read -r choice
    
    case $choice in
        1) 
            copy_to_clipboard "$BTC_WALLET" && print_success "BTC address copied!" || print_error "Could not copy"
            ;;
        2)
            copy_to_clipboard "$ETH_WALLET" && print_success "ETH address copied!" || print_error "Could not copy"
            ;;
        3)
            copy_to_clipboard "$SOL_WALLET" && print_success "SOL address copied!" || print_error "Could not copy"
            ;;
    esac
    
    sleep 1
}

#──────────────────────────────────────────────────────────────────────────────
# MAIN LOOP
#──────────────────────────────────────────────────────────────────────────────

main() {
    # Boot sequence
    boot_sequence
    
    # Check key
    require_key
    KEY_STATUS=$?
    
    # Main loop
    while true; do
        show_main_menu
        
        echo -ne "  ${WHITE}Select option: ${RESET}"
        read -r option
        
        case $option in
            1)
                handle_compression $KEY_STATUS
                ;;
            2)
                handle_extraction
                ;;
            3)
                show_stats
                ;;
            4)
                show_achievements
                ;;
            5)
                show_donate_menu
                ;;
            6)
                show_key_prompt
                KEY_STATUS=$?
                ;;
            7)
                show_help
                ;;
            0)
                clear
                show_skull
                echo -e "${NEON_PURPLE}           Thank you for using MDH_COMPRESSER!${RESET}"
                echo -e "${CYAN}                    Until next time, warrior.${RESET}"
                echo ""
                display_quote
                show_donation_prompt
                exit 0
                ;;
            *)
                print_error "Invalid option!"
                sleep 1
                ;;
        esac
    done
}

# Run main
main "$@"
MAINEOF

    chmod +x "$MAIN_EXEC"
    print_success "Main executable created!"
}

#══════════════════════════════════════════════════════════════════════════════
# SECTION 8: CONFIGURE PATH
#══════════════════════════════════════════════════════════════════════════════

configure_path() {
    print_step "Configuring PATH..."
    
    local shell_rc=""
    local os_type=$(detect_os)
    
    if [ "$os_type" == "termux" ]; then
        shell_rc="$HOME/.bashrc"
    elif [ -f "$HOME/.zshrc" ]; then
        shell_rc="$HOME/.zshrc"
    elif [ -f "$HOME/.bashrc" ]; then
        shell_rc="$HOME/.bashrc"
    else
        shell_rc="$HOME/.profile"
    fi
    
    # Check if already in PATH
    if ! grep -q "$BIN_DIR" "$shell_rc" 2>/dev/null; then
        echo "" >> "$shell_rc"
        echo "# MDH_COMPRESSER" >> "$shell_rc"
        echo "export PATH=\"\$PATH:$BIN_DIR\"" >> "$shell_rc"
        print_success "Added to PATH in $shell_rc"
    else
        print_success "PATH already configured"
    fi
    
    # Export for current session
    export PATH="$PATH:$BIN_DIR"
}

#══════════════════════════════════════════════════════════════════════════════
# SECTION 9: POST-INSTALL
#══════════════════════════════════════════════════════════════════════════════

post_install() {
    echo ""
    echo -e "${NEON_GREEN}  ╔════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}                                                            ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}        ✅ ${BOLD}MDH_COMPRESSER INSTALLED SUCCESSFULLY!${RESET} ✅        ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}                                                            ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}                                                            ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${WHITE}To start, run:${RESET}  ${NEON_CYAN}mdhcompresser${RESET}                          ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}                                                            ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${WHITE}If command not found, restart your terminal or run:${RESET}     ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${CYAN}source ~/.bashrc${RESET}                                        ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}                                                            ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ╠════════════════════════════════════════════════════════════╣${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${WHITE}GitHub:${RESET}   ${CYAN}github.com/MDHojayfa${RESET}                           ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}  ${WHITE}Telegram:${RESET} ${CYAN}@Urniggar${RESET}                                      ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ║${RESET}                                                            ${NEON_GREEN}║${RESET}"
    echo -e "${NEON_GREEN}  ╚════════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    
    print_step "Opening GitHub profile..."
    sleep 2
    
    # Try to open GitHub profile
    local os_type=$(detect_os)
    case $os_type in
        termux)
            termux-open-url "$GITHUB_PROFILE" 2>/dev/null || am start -a android.intent.action.VIEW -d "$GITHUB_PROFILE" 2>/dev/null
            ;;
        macos)
            open "$GITHUB_PROFILE" 2>/dev/null
            ;;
        wsl)
            cmd.exe /c start "$GITHUB_PROFILE" 2>/dev/null
            ;;
        *)
            xdg-open "$GITHUB_PROFILE" 2>/dev/null || echo "  Visit: $GITHUB_PROFILE"
            ;;
    esac
}

#══════════════════════════════════════════════════════════════════════════════
# MAIN INSTALLATION
#══════════════════════════════════════════════════════════════════════════════

main_install() {
    print_banner
    
    echo ""
    print_step "Starting installation..."
    echo ""
    
    # Check if already installed
    if [ -f "$MAIN_EXEC" ]; then
        print_warning "MDH_COMPRESSER is already installed!"
        echo -ne "  ${WHITE}Reinstall? [y/N]: ${RESET}"
        read -r reinstall
        if [[ ! "$reinstall" =~ ^[Yy]$ ]]; then
            echo "  Installation cancelled."
            exit 0
        fi
        rm -rf "$INSTALL_DIR"
    fi
    
    install_dependencies
    echo ""
    
    create_directories
    echo ""
    
    create_lib_files
    echo ""
    
    create_main_executable
    echo ""
    
    configure_path
    echo ""
    
    post_install
}

# Run installation
main_install
