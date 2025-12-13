#!/usr/bin/env bash
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  ███╗   ███╗██████╗ ██╗  ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     
#  ████╗ ████║██╔══██╗██║  ██║    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     
#  ██╔████╔██║██║  ██║███████║    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     
#  ██║╚██╔╝██║██║  ██║██╔══██║    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     
#  ██║ ╚═╝ ██║██████╔╝██║  ██║    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗
#  ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝
#  INSTALLER v2.0 | Author: @MDHojayfa | License: MIT
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# SAVE AS: install.sh
# RUN: chmod +x install.sh && ./install.sh
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set -e

# ═══════════════════════════════════════════════════════════════════════════
# COLOR DEFINITIONS
# ═══════════════════════════════════════════════════════════════════════════
R='\033[0;31m'      # Red
G='\033[0;32m'      # Green
Y='\033[1;33m'      # Yellow
B='\033[0;34m'      # Blue
P='\033[0;35m'      # Purple
C='\033[0;36m'      # Cyan
W='\033[1;37m'      # White Bold
GR='\033[1;30m'     # Gray
NC='\033[0m'        # No Color
BG_R='\033[41m'     # Background Red
BG_G='\033[42m'     # Background Green
BG_B='\033[44m'     # Background Blue
BOLD='\033[1m'
DIM='\033[2m'
BLINK='\033[5m'

# ═══════════════════════════════════════════════════════════════════════════
# GLOBAL VARIABLES
# ═══════════════════════════════════════════════════════════════════════════
INSTALL_DIR="$HOME/.mdh_zone"
BIN_DIR="$HOME/.local/bin"
VERSION="2.0.0"
GITHUB_USER="MDHojayfa"
TERM_WIDTH=$(tput cols 2>/dev/null || echo 80)

# ═══════════════════════════════════════════════════════════════════════════
# UTILITY FUNCTIONS
# ═══════════════════════════════════════════════════════════════════════════

# Hide cursor
hide_cursor() { printf '\033[?25l'; }

# Show cursor
show_cursor() { printf '\033[?25h'; }

# Trap to restore cursor on exit
trap 'show_cursor; echo -e "${NC}"' EXIT INT TERM

# Clear screen properly
cls() { printf '\033[2J\033[H'; }

# Move cursor
move_cursor() { printf '\033[%d;%dH' "$1" "$2"; }

# Print centered text
center_text() {
    local text="$1"
    local width=${2:-$TERM_WIDTH}
    local text_len=${#text}
    local padding=$(( (width - text_len) / 2 ))
    printf "%*s%s\n" $padding "" "$text"
}

# Typing effect with variable speed
type_text() {
    local text="$1"
    local delay="${2:-0.03}"
    local color="${3:-$G}"
    echo -ne "${color}"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo -e "${NC}"
}

# Spinner animation
spinner() {
    local pid=$1
    local message="${2:-Processing}"
    local spin_chars='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0
    
    hide_cursor
    while kill -0 "$pid" 2>/dev/null; do
        printf "\r${C}[${spin_chars:i++%10:1}]${NC} ${message}..."
        sleep 0.1
    done
    printf "\r${G}[✔]${NC} ${message}    \n"
    show_cursor
}

# Progress bar
progress_bar() {
    local current=$1
    local total=$2
    local width=50
    local percent=$((current * 100 / total))
    local filled=$((current * width / total))
    local empty=$((width - filled))
    
    printf "\r${C}["
    printf "%${filled}s" | tr ' ' '█'
    printf "%${empty}s" | tr ' ' '░'
    printf "]${NC} ${W}%3d%%${NC}" "$percent"
}

# Matrix rain effect (short burst)
matrix_rain() {
    local duration=${1:-2}
    local cols=$TERM_WIDTH
    local end_time=$((SECONDS + duration))
    
    hide_cursor
    cls
    
    while [ $SECONDS -lt $end_time ]; do
        local col=$((RANDOM % cols))
        local char_set="01アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン"
        local char="${char_set:RANDOM % ${#char_set}:1}"
        printf "\033[%d;%dH${G}%s${NC}" $((RANDOM % 20 + 1)) "$col" "$char"
        sleep 0.01
    done
    
    cls
    show_cursor
}

# Glitch text effect
glitch_text() {
    local text="$1"
    local iterations=${2:-5}
    local glitch_chars='@#$%&*!?<>[]{}|/\~^'
    
    for ((j=0; j<iterations; j++)); do
        local glitched=""
        for ((i=0; i<${#text}; i++)); do
            if [ $((RANDOM % 4)) -eq 0 ]; then
                glitched+="${glitch_chars:RANDOM % ${#glitch_chars}:1}"
            else
                glitched+="${text:$i:1}"
            fi
        done
        printf "\r${R}%s${NC}" "$glitched"
        sleep 0.05
    done
    printf "\r${G}%s${NC}\n" "$text"
}

# Boot sequence animation
boot_sequence() {
    cls
    hide_cursor
    
    # Matrix rain intro
    matrix_rain 1
    
    # Logo reveal with glitch
    local logo=(
        "███╗   ███╗██████╗ ██╗  ██╗    ███████╗ ██████╗ ███╗   ██╗███████╗"
        "████╗ ████║██╔══██╗██║  ██║    ╚══███╔╝██╔═══██╗████╗  ██║██╔════╝"
        "██╔████╔██║██║  ██║███████║      ███╔╝ ██║   ██║██╔██╗ ██║█████╗  "
        "██║╚██╔╝██║██║  ██║██╔══██║     ███╔╝  ██║   ██║██║╚██╗██║██╔══╝  "
        "██║ ╚═╝ ██║██████╔╝██║  ██║    ███████╗╚██████╔╝██║ ╚████║███████╗"
        "╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝    ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝"
    )
    
    echo ""
    for line in "${logo[@]}"; do
        echo -e "${P}$(center_text "$line")${NC}"
        sleep 0.1
    done
    
    echo ""
    center_text "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    # Boot messages
    local boot_msgs=(
        "INITIALIZING KERNEL MODULES"
        "LOADING ENCRYPTION PROTOCOLS"
        "ESTABLISHING SECURE CHANNELS"
        "MOUNTING VIRTUAL FILESYSTEMS"
        "CALIBRATING COMPRESSION ENGINES"
        "SYNCHRONIZING QUANTUM STATES"
        "ACTIVATING NEURAL NETWORKS"
        "BYPASSING SECURITY LAYERS"
    )
    
    for msg in "${boot_msgs[@]}"; do
        printf "${GR}[${NC}${C}BOOT${NC}${GR}]${NC} "
        glitch_text "$msg" 3
        sleep 0.2
    done
    
    echo ""
    printf "${Y}"
    type_text "» SYSTEM READY. WELCOME TO MDH_ZONE «" 0.02 "$Y"
    printf "${NC}"
    echo ""
    sleep 1
    show_cursor
}

# Shutdown sequence
shutdown_sequence() {
    echo ""
    echo -e "${Y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    
    local shutdown_msgs=(
        "SAVING SYSTEM STATE"
        "CLOSING SECURE CHANNELS"
        "FLUSHING MEMORY BUFFERS"
        "TERMINATING PROCESSES"
        "ENCRYPTING SESSION LOGS"
    )
    
    for msg in "${shutdown_msgs[@]}"; do
        printf "${GR}[${NC}${R}HALT${NC}${GR}]${NC} ${DIM}%s${NC}" "$msg"
        for i in {1..3}; do
            printf "."
            sleep 0.2
        done
        printf " ${G}OK${NC}\n"
    done
    
    echo ""
    type_text "» CONNECTION TERMINATED. GOODBYE. «" 0.03 "$R"
    echo ""
    sleep 1
}

# Detect OS
detect_os() {
    if [ -d "/data/data/com.termux" ]; then
        echo "termux"
    elif [ -f /etc/debian_version ]; then
        echo "debian"
    elif [ -f /etc/fedora-release ]; then
        echo "fedora"
    elif [ -f /etc/arch-release ]; then
        echo "arch"
    elif [ -f /etc/alpine-release ]; then
        echo "alpine"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif grep -qi microsoft /proc/version 2>/dev/null; then
        echo "wsl"
    else
        echo "unknown"
    fi
}

# Check if command exists
cmd_exists() {
    command -v "$1" &>/dev/null
}

# Install packages based on OS
install_packages() {
    local os="$1"
    shift
    local packages=("$@")
    
    case "$os" in
        termux)
            pkg update -y && pkg install -y "${packages[@]}"
            ;;
        debian|wsl)
            sudo apt-get update -y
            sudo apt-get install -y "${packages[@]}"
            ;;
        fedora)
            sudo dnf install -y "${packages[@]}"
            ;;
        arch)
            sudo pacman -Sy --noconfirm "${packages[@]}"
            ;;
        alpine)
            sudo apk add "${packages[@]}"
            ;;
        macos)
            if cmd_exists brew; then
                brew install "${packages[@]}"
            else
                echo -e "${R}[!] Homebrew not found. Install from https://brew.sh${NC}"
                return 1
            fi
            ;;
        *)
            echo -e "${R}[!] Unknown OS. Please install manually: ${packages[*]}${NC}"
            return 1
            ;;
    esac
}

# ═══════════════════════════════════════════════════════════════════════════
# MAIN INSTALLATION
# ═══════════════════════════════════════════════════════════════════════════

main() {
    cls
    boot_sequence
    
    echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${W}                 MDH_ZONE INSTALLER v${VERSION}${NC}"
    echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    # ─────────────────────────────────────────────────────────────────────
    # PHASE 1: SYSTEM DETECTION
    # ─────────────────────────────────────────────────────────────────────
    echo -e "${Y}[PHASE 1]${NC} ${W}SYSTEM DETECTION${NC}"
    echo -e "${GR}─────────────────────────────────────────────────────${NC}"
    
    OS_TYPE=$(detect_os)
    ARCH=$(uname -m)
    KERNEL=$(uname -r)
    
    sleep 0.5
    echo -e "  ${C}├─${NC} Operating System : ${G}${OS_TYPE^^}${NC}"
    sleep 0.3
    echo -e "  ${C}├─${NC} Architecture     : ${G}${ARCH}${NC}"
    sleep 0.3
    echo -e "  ${C}├─${NC} Kernel           : ${G}${KERNEL}${NC}"
    sleep 0.3
    echo -e "  ${C}└─${NC} User             : ${G}$(whoami)${NC}"
    echo ""
    
    # ─────────────────────────────────────────────────────────────────────
    # PHASE 2: DEPENDENCY CHECK
    # ─────────────────────────────────────────────────────────────────────
    echo -e "${Y}[PHASE 2]${NC} ${W}DEPENDENCY VERIFICATION${NC}"
    echo -e "${GR}─────────────────────────────────────────────────────${NC}"
    
    REQUIRED_TOOLS=("7z" "zip" "unzip" "tar" "pv" "bc" "file" "gzip" "xz")
    MISSING_TOOLS=()
    
    for tool in "${REQUIRED_TOOLS[@]}"; do
        sleep 0.2
        if cmd_exists "$tool"; then
            echo -e "  ${G}[✔]${NC} $tool"
        else
            echo -e "  ${R}[✘]${NC} $tool ${DIM}(missing)${NC}"
            MISSING_TOOLS+=("$tool")
        fi
    done
    echo ""
    
    # ─────────────────────────────────────────────────────────────────────
    # PHASE 3: INSTALL MISSING TOOLS
    # ─────────────────────────────────────────────────────────────────────
    if [ ${#MISSING_TOOLS[@]} -gt 0 ]; then
        echo -e "${Y}[PHASE 3]${NC} ${W}INSTALLING MISSING DEPENDENCIES${NC}"
        echo -e "${GR}─────────────────────────────────────────────────────${NC}"
        
        # Map tool names to package names
        declare -A PKG_MAP
        PKG_MAP[7z]="p7zip-full"
        PKG_MAP[pv]="pv"
        PKG_MAP[bc]="bc"
        PKG_MAP[file]="file"
        PKG_MAP[gzip]="gzip"
        PKG_MAP[xz]="xz-utils"
        PKG_MAP[zip]="zip"
        PKG_MAP[unzip]="unzip"
        PKG_MAP[tar]="tar"
        
        # For Termux
        if [ "$OS_TYPE" = "termux" ]; then
            PKG_MAP[7z]="p7zip"
            PKG_MAP[xz]="xz-utils"
        fi
        
        # For Arch
        if [ "$OS_TYPE" = "arch" ]; then
            PKG_MAP[7z]="p7zip"
            PKG_MAP[xz]="xz"
        fi
        
        # For macOS
        if [ "$OS_TYPE" = "macos" ]; then
            PKG_MAP[7z]="p7zip"
            PKG_MAP[xz]="xz"
        fi
        
        PACKAGES_TO_INSTALL=()
        for tool in "${MISSING_TOOLS[@]}"; do
            pkg="${PKG_MAP[$tool]:-$tool}"
            PACKAGES_TO_INSTALL+=("$pkg")
        done
        
        echo -e "  ${C}[*]${NC} Installing: ${PACKAGES_TO_INSTALL[*]}"
        echo ""
        
        if install_packages "$OS_TYPE" "${PACKAGES_TO_INSTALL[@]}"; then
            echo -e "  ${G}[✔]${NC} All dependencies installed successfully!"
        else
            echo -e "  ${R}[!]${NC} Some packages failed. Manual installation required."
        fi
        echo ""
    else
        echo -e "${G}[✔]${NC} All dependencies already installed!"
        echo ""
    fi
    
    # ─────────────────────────────────────────────────────────────────────
    # PHASE 4: CREATE INSTALLATION DIRECTORY
    # ─────────────────────────────────────────────────────────────────────
    echo -e "${Y}[PHASE 4]${NC} ${W}CREATING MDH_ZONE ENVIRONMENT${NC}"
    echo -e "${GR}─────────────────────────────────────────────────────${NC}"
    
    mkdir -p "$INSTALL_DIR"
    mkdir -p "$BIN_DIR"
    
    sleep 0.3
    echo -e "  ${C}├─${NC} Install Dir : ${G}${INSTALL_DIR}${NC}"
    sleep 0.3
    echo -e "  ${C}└─${NC} Binary Dir  : ${G}${BIN_DIR}${NC}"
    echo ""
    
    # ─────────────────────────────────────────────────────────────────────
    # PHASE 5: CREATE SYMLINKS / PATH
    # ─────────────────────────────────────────────────────────────────────
    echo -e "${Y}[PHASE 5]${NC} ${W}CONFIGURING SYSTEM PATH${NC}"
    echo -e "${GR}─────────────────────────────────────────────────────${NC}"
    
    # Add to PATH if not already there
    SHELL_RC=""
    if [ -f "$HOME/.bashrc" ]; then
        SHELL_RC="$HOME/.bashrc"
    elif [ -f "$HOME/.zshrc" ]; then
        SHELL_RC="$HOME/.zshrc"
    elif [ -f "$HOME/.profile" ]; then
        SHELL_RC="$HOME/.profile"
    fi
    
    if [ -n "$SHELL_RC" ]; then
        if ! grep -q "MDH_ZONE" "$SHELL_RC" 2>/dev/null; then
            echo "" >> "$SHELL_RC"
            echo "# MDH_ZONE PATH" >> "$SHELL_RC"
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
            echo -e "  ${G}[✔]${NC} Updated ${SHELL_RC}"
        else
            echo -e "  ${G}[✔]${NC} PATH already configured"
        fi
    fi
    
    export PATH="$BIN_DIR:$PATH"
    echo ""
    
    # ─────────────────────────────────────────────────────────────────────
    # PHASE 6: INSTALLATION COMPLETE
    # ─────────────────────────────────────────────────────────────────────
    echo -e "${G}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${W}            ✔ INSTALLATION COMPLETE ✔${NC}"
    echo -e "${G}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    echo -e "${C}[NEXT STEPS]${NC}"
    echo -e "  ${W}1.${NC} Save ${G}compressor.sh${NC} and ${G}extractor.sh${NC} to this directory"
    echo -e "  ${W}2.${NC} Run: ${C}chmod +x compressor.sh extractor.sh${NC}"
    echo -e "  ${W}3.${NC} Execute: ${C}./compressor.sh${NC}"
    echo ""
    
    echo -e "${Y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${W}         FOLLOW THE DEVELOPER ON GITHUB${NC}"
    echo -e "${Y}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "           ${C}https://github.com/${GITHUB_USER}${NC}"
    echo ""
    
    # Open GitHub
    echo -ne "${Y}[?] Open GitHub profile in browser? [Y/n]: ${NC}"
    read -r OPEN_GH
    
    if [[ "$OPEN_GH" != "n" && "$OPEN_GH" != "N" ]]; then
        URL="https://github.com/${GITHUB_USER}"
        if [ "$OS_TYPE" = "termux" ] && cmd_exists termux-open-url; then
            termux-open-url "$URL"
        elif cmd_exists xdg-open; then
            xdg-open "$URL" 2>/dev/null &
        elif cmd_exists open; then
            open "$URL"
        else
            echo -e "${C}[*] Please visit: ${URL}${NC}"
        fi
        echo -e "${G}[✔]${NC} Opening GitHub profile..."
    fi
    
    echo ""
    shutdown_sequence
}

# ═══════════════════════════════════════════════════════════════════════════
# EXECUTE
# ═══════════════════════════════════════════════════════════════════════════
main "$@"
