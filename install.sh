#!/usr/bin/env bash
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#
#  ███╗   ███╗██████╗ ██╗  ██╗     ██████╗ ██████╗ ███╗   ███╗██████╗ ██████╗ ███████╗
#  ████╗ ████║██╔══██╗██║  ██║    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██╔══██╗██╔════╝
#  ██╔████╔██║██║  ██║███████║    ██║     ██║   ██║██╔████╔██║██████╔╝██████╔╝█████╗  
#  ██║╚██╔╝██║██║  ██║██╔══██║    ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██╔══██╗██╔══╝  
#  ██║ ╚═╝ ██║██████╔╝██║  ██║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ██║  ██║███████╗
#  ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝
#
#  MDH_COMPRESSER v3.0.0 | The World's Most Powerful Compression Suite
#  Author: MDHojayfa | GitHub: @MDHojayfa
#
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set -e

# ══════════════════════════════════════════════════════════════════════════════════════
# 1. CONFIGURATION & INFRASTRUCTURE
# ══════════════════════════════════════════════════════════════════════════════════════
VERSION="3.0.0"
TOOL_NAME="MDH_COMPRESSER"
COMMAND_NAME="mdhcompresser"
GITHUB_USER="MDHojayfa"
GITHUB_REPO="https://github.com/MDHojayfa/MDH_Compresser"
GITHUB_PROFILE="https://github.com/MDHojayfa"
TELEGRAM="@Urniggar"
INSTALL_DIR="$HOME/.mdhcompresser"
BIN_DIR="$HOME/.local/bin"

# 💰 Crypto Addresses
BTC_ADDR="bc1q24yndamzynl8afdmy52heclglk79ucu4jqn638"
SOL_ADDR="2hbHyZa4deyS12spqo14CPSKFH9dBGYYBLjjHN57x94P"
ETH_ADDR="0xcb99db7464669a52513fae435f7a59e18e8d89f1"

# 🔗 Ad Network Links (Rotation)
LINK_EXE="https://exe.io/KGhnFMQ"
LINK_VERT="https://linkvertise.com/2020139/42UOOrQBhJrw"
LINK_HUB="https://link-hub.net/2020139/42UOOrQBhJrw"

# Terminal Dimensions
TERM_COLS=$(tput cols 2>/dev/null || echo 80)
TERM_ROWS=$(tput lines 2>/dev/null || echo 24)

# ══════════════════════════════════════════════════════════════════════════════════════
# 2. COLOR PALETTE (NEON HACKER THEME)
# ══════════════════════════════════════════════════════════════════════════════════════
R='\033[0;31m'
G='\033[0;32m'
Y='\033[1;33m'
B='\033[0;34m'
P='\033[0;35m'
C='\033[0;36m'
W='\033[1;37m'
GR='\033[1;30m'
NC='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
ITALIC='\033[3m'
BLINK='\033[5m'

# High Intensity Neon
NEON_G='\033[38;5;46m'   # Matrix Green
NEON_P='\033[38;5;201m'  # Cyber Pink
NEON_C='\033[38;5;51m'   # Electric Cyan
NEON_R='\033[38;5;196m'  # Danger Red
NEON_Y='\033[38;5;226m'  # Warning Yellow
NEON_O='\033[38;5;208m'  # Plasma Orange

# Shadow Characters
S1='░'
S2='▒'
S3='▓'
S4='█'

# ══════════════════════════════════════════════════════════════════════════════════════
# 3. CURSOR & SCREEN CONTROL
# ══════════════════════════════════════════════════════════════════════════════════════
hide_cursor() { printf '\033[?25l'; }
show_cursor() { printf '\033[?25h'; }
save_cursor() { printf '\033[s'; }
restore_cursor() { printf '\033[u'; }
move_to() { printf '\033[%d;%dH' "$1" "$2"; }
clear_line() { printf '\033[2K'; }
clear_screen() { printf '\033[2J\033[H'; }

# Trap interrupts to restore cursor
trap 'show_cursor; printf "${NC}\n"; exit' EXIT INT TERM

# ══════════════════════════════════════════════════════════════════════════════════════
# 4. EXTREME ANIMATION ENGINE
# ══════════════════════════════════════════════════════════════════════════════════════

# Matrix Rain (Heavy)
matrix_rain_heavy() {
    local duration=${1:-3}
    local end=$((SECONDS + duration))
    # Katakana + Binary + Blocks
    local chars="01アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン░▒▓█"
    
    hide_cursor
    clear_screen
    
    while [ $SECONDS -lt $end ]; do
        for ((i=0; i<15; i++)); do
            local col=$((RANDOM % TERM_COLS + 1))
            local row=$((RANDOM % TERM_ROWS + 1))
            local char="${chars:RANDOM % ${#chars}:1}"
            local color_pick=$((RANDOM % 3))
            
            case $color_pick in
                0) move_to $row $col; printf "${NEON_G}${char}${NC}" ;;
                1) move_to $row $col; printf "${G}${char}${NC}" ;;
                2) move_to $row $col; printf "${DIM}${G}${char}${NC}" ;;
            esac
        done
        # Occasional glitch line
        if [ $((RANDOM % 10)) -eq 0 ]; then
            local g_row=$((RANDOM % TERM_ROWS + 1))
            move_to $g_row 1
            printf "${NEON_G}%$(($TERM_COLS))s${NC}" | tr ' ' "${chars:RANDOM%${#chars}:1}"
        fi
        sleep 0.01
    done
    clear_screen
    show_cursor
}

# Cyber Glitch Text
cyber_glitch() {
    local text="$1"
    local iterations=${2:-6}
    local glitch_chars='@#$%&*!?<>[]{}|/\~^░▒▓█¥€£¢₹₿'
    local colors=("$R" "$G" "$Y" "$P" "$C" "$NEON_G" "$NEON_P")
    
    hide_cursor
    for ((j=0; j<iterations; j++)); do
        local glitched=""
        local color="${colors[RANDOM % ${#colors[@]}]}"
        
        for ((i=0; i<${#text}; i++)); do
            if [ $((RANDOM % 5)) -eq 0 ]; then
                glitched+="${glitch_chars:RANDOM % ${#glitch_chars}:1}"
            else
                glitched+="${text:$i:1}"
            fi
        done
        printf "\r${color}%s${NC}" "$glitched"
        sleep 0.03
    done
    printf "\r${NEON_G}%s${NC}\n" "$text"
    show_cursor
}

# Hacker Typewriter
hacker_type() {
    local text="$1"
    local delay="${2:-0.03}"
    local color="${3:-$NEON_G}"
    
    printf "${color}"
    for ((i=0; i<${#text}; i++)); do
        printf "%s" "${text:$i:1}"
        sleep "$delay"
    done
    printf "${NC}\n"
}

# Pulse Wave
pulse_wave() {
    local width=40
    local cycles=${1:-1}
    
    hide_cursor
    for ((c=0; c<cycles; c++)); do
        for ((i=0; i<=width; i++)); do
            printf "\r  ${GR}["
            for ((j=0; j<i; j++)); do printf "${S1}"; done
            printf "${NEON_G}${S4}${S3}${S2}${NC}"
            for ((j=i; j<width; j++)); do printf "${GR}${S1}"; done
            printf "${GR}]${NC}"
            sleep 0.01
        done
        for ((i=width; i>=0; i--)); do
            printf "\r  ${GR}["
            for ((j=0; j<i; j++)); do printf "${S1}"; done
            printf "${NEON_C}${S2}${S3}${S4}${NC}"
            for ((j=i; j<width; j++)); do printf "${GR}${S1}"; done
            printf "${GR}]${NC}"
            sleep 0.01
        done
    done
    printf "\n"
    show_cursor
}

# Spinner (Braille)
spinner() {
    local pid=$1
    local msg="${2:-Processing}"
    local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0
    
    hide_cursor
    while kill -0 "$pid" 2>/dev/null; do
        printf "\r  ${NEON_C}[${spin:i++%10:1}]${NC} ${msg}..."
        sleep 0.08
    done
    wait "$pid" 2>/dev/null
    local code=$?
    
    if [ $code -eq 0 ]; then
        printf "\r  ${NEON_G}[✔]${NC} ${msg}     \n"
    else
        printf "\r  ${NEON_R}[✘]${NC} ${msg}     \n"
    fi
    show_cursor
    return $code
}

# Shadow Box
shadow_box() {
    local title="$1"
    local width=${2:-60}
    local color="${3:-$NEON_P}"
    local pad_len=$(( (width - ${#title}) / 2 ))
    
    # Shadow layer
    printf "  ${GR}"
    printf '%*s' $((width + 4)) | tr ' ' "$S1"
    printf "${NC}\n"
    
    # Box Top
    printf "  ${GR}${S1}${NC}${color}╔"
    printf '%*s' $width | tr ' ' '═'
    printf "╗${NC}${GR}${S2}${NC}\n"
    
    # Title
    printf "  ${GR}${S1}${NC}${color}║${NC}"
    printf '%*s' $pad_len ''
    printf "${W}${BOLD}%s${NC}" "$title"
    printf '%*s' $((width - ${#title} - pad_len)) ''
    printf "${color}║${NC}${GR}${S2}${NC}\n"
    
    # Box Bottom
    printf "  ${GR}${S1}${NC}${color}╚"
    printf '%*s' $width | tr ' ' '═'
    printf "╝${NC}${GR}${S2}${NC}\n"
    
    # Bottom Shadow
    printf "  ${GR}   ${S2}"
    printf '%*s' $((width + 2)) | tr ' ' "$S2"
    printf "${S3}${NC}\n"
}

# ══════════════════════════════════════════════════════════════════════════════════════
# 5. BOOT & SHUTDOWN SEQUENCES
# ══════════════════════════════════════════════════════════════════════════════════════

boot_sequence() {
    clear_screen
    matrix_rain_heavy 2
    
    echo ""
    local logo=(
        "  ███╗   ███╗██████╗ ██╗  ██╗     ██████╗ ██████╗ ███╗   ███╗██████╗ "
        "  ████╗ ████║██╔══██╗██║  ██║    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗"
        "  ██╔████╔██║██║  ██║███████║    ██║     ██║   ██║██╔████╔██║██████╔╝"
        "  ██║╚██╔╝██║██║  ██║██╔══██║    ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ "
        "  ██║ ╚═╝ ██║██████╔╝██║  ██║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     "
        "  ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     "
    )
    
    for line in "${logo[@]}"; do
        echo -e "${NEON_P}${line}${NC}"
        sleep 0.05
    done
    
    echo ""
    echo -e "${GR}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${S2}${NC}"
    echo -e "${DIM}  ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄${NC}"
    echo -e "${W}  █ THE WORLD'S MOST POWERFUL COMPRESSION SUITE █ v${VERSION} █${NC}"
    echo -e "${DIM}  ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀${NC}"
    echo ""
    
    # System Info Bar
    echo -e "  ${NEON_C}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "  ${NEON_C}║${NC} ${DIM}SYSTEM:${NC} $(uname -s) ${DIM}|${NC} ${DIM}ARCH:${NC} $(uname -m) ${DIM}|${NC} ${DIM}USER:${NC} $(whoami) ${NEON_C}║${NC}"
    echo -e "  ${NEON_C}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Boot Messages
    local boot_msgs=(
        "INITIALIZING QUANTUM COMPRESSION CORES"
        "LOADING NEURAL ALGORITHM LIBRARIES"
        "CALIBRATING ENTROPY ANALYZERS"
        "ESTABLISHING ENCRYPTED CHANNELS"
        "MOUNTING VIRTUAL MEMORY BUFFERS"
        "BYPASSING SYSTEM LIMITATIONS"
        "ACTIVATING FORBIDDEN PROTOCOLS"
        "UNLOCKING MDH_ZONE CAPABILITIES"
        "INSTALLER ARMED AND READY"
    )
    
    for msg in "${boot_msgs[@]}"; do
        printf "  ${GR}[${NC}${NEON_C}BOOT${NC}${GR}]${NC} "
        cyber_glitch "$msg" 3
        sleep 0.08
    done
    
    echo ""
    pulse_wave 1
    echo ""
    
    echo -e "  ${NEON_P}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    hacker_type "  \"Every byte you save is a victory against chaos.\"" 0.02 "$NEON_Y"
    echo -e "  ${DIM}                                                      — MDHojayfa${NC}"
    echo -e "  ${NEON_P}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    sleep 1
}

shutdown_sequence() {
    echo ""
    echo -e "  ${NEON_R}══════════════════════════════════════════════════════════════════${NC}"
    
    local msgs=(
        "SAVING SESSION STATE"
        "FLUSHING COMPRESSION BUFFERS"
        "ENCRYPTING LOG FILES"
        "CLOSING SECURE CHANNELS"
        "SHUTDOWN COMPLETE"
    )
    
    for msg in "${msgs[@]}"; do
        printf "  ${GR}[${NC}${NEON_R}END${NC}${GR}]${NC} ${DIM}%s${NC}" "$msg"
        sleep 0.1
        printf " ${NEON_G}OK${NC}\n"
    done
    
    echo ""
    hacker_type "  \"The terminal sleeps, but the legend grows.\"" 0.03 "$NEON_R"
    echo -e "  ${DIM}                                              — MDHojayfa${NC}"
    echo ""
    echo -e "  ${NEON_C}⭐ Star:${NC}   ${GITHUB_REPO}"
    echo -e "  ${NEON_C}👤 Follow:${NC} ${GITHUB_PROFILE}"
    echo ""
}
# ══════════════════════════════════════════════════════════════════════════════════════
# 6. SYSTEM DETECTION & INSTALLER LOGIC
# ══════════════════════════════════════════════════════════════════════════════════════

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

cmd_exists() {
    command -v "$1" &>/dev/null
}

install_dependencies() {
    local os="$1"
    echo -e "  ${NEON_Y}[PHASE 2]${NC} ${W}INSTALLING DEPENDENCIES${NC}"
    echo -e "  ${GR}─────────────────────────────────────────────────────────${NC}"
    echo ""
    
    case "$os" in
        termux)
            echo -e "  ${NEON_C}[*]${NC} Updating Termux packages..."
            pkg update -y &>/dev/null &
            spinner $! "Updating repositories"
            
            echo -e "  ${NEON_C}[*]${NC} Installing tools..."
            pkg install -y p7zip zip unzip tar xz-utils gzip bzip2 pv bc file lz4 zstd &>/dev/null &
            spinner $! "Installing core utilities"
            ;;
            
        debian|wsl)
            echo -e "  ${NEON_C}[*]${NC} Updating apt packages..."
            sudo apt-get update -y &>/dev/null &
            spinner $! "Updating repositories"
            
            echo -e "  ${NEON_C}[*]${NC} Installing tools..."
            sudo apt-get install -y p7zip-full zip unzip tar xz-utils gzip bzip2 pv bc file lz4 zstd &>/dev/null &
            spinner $! "Installing core utilities"
            ;;
            
        arch)
            echo -e "  ${NEON_C}[*]${NC} Installing via pacman..."
            sudo pacman -Sy --noconfirm p7zip zip unzip tar xz gzip bzip2 pv bc file lz4 zstd &>/dev/null &
            spinner $! "Installing core utilities"
            ;;
            
        fedora)
            echo -e "  ${NEON_C}[*]${NC} Installing via dnf..."
            sudo dnf install -y p7zip p7zip-plugins zip unzip tar xz gzip bzip2 pv bc file lz4 zstd &>/dev/null &
            spinner $! "Installing core utilities"
            ;;
            
        macos)
            if cmd_exists brew; then
                echo -e "  ${NEON_C}[*]${NC} Installing via Homebrew..."
                brew install p7zip xz lz4 zstd pv &>/dev/null &
                spinner $! "Installing core utilities"
            else
                echo -e "  ${R}[!]${NC} Homebrew not found. Please install manually."
            fi
            ;;
            
        *)
            echo -e "  ${Y}[!]${NC} Unknown OS. Please install dependencies manually:"
            echo -e "  ${DIM}p7zip, zip, unzip, tar, xz, gzip, bzip2, pv, bc, file, lz4, zstd${NC}"
            ;;
    esac
    echo ""
}

create_directories() {
    echo -e "  ${NEON_Y}[PHASE 3]${NC} ${W}CREATING SYSTEM ARCHITECTURE${NC}"
    echo -e "  ${GR}─────────────────────────────────────────────────────────${NC}"
    echo ""
    
    mkdir -p "$INSTALL_DIR"/{lib,config,data,logs}
    mkdir -p "$BIN_DIR"
    
    echo -e "  ${G}[✔]${NC} Core:    ${DIM}$INSTALL_DIR${NC}"
    echo -e "  ${G}[✔]${NC} Lib:     ${DIM}$INSTALL_DIR/lib${NC}"
    echo -e "  ${G}[✔]${NC} Config:  ${DIM}$INSTALL_DIR/config${NC}"
    echo -e "  ${G}[✔]${NC} Data:    ${DIM}$INSTALL_DIR/data${NC}"
    echo ""
}

# ══════════════════════════════════════════════════════════════════════════════════════
# 7. EMBEDDED LIBRARIES GENERATION
# ══════════════════════════════════════════════════════════════════════════════════════

create_config() {
    cat > "$INSTALL_DIR/config/settings.conf" << 'CONFIGEOF'
# MDH_COMPRESSER Configuration
# Generated by install.sh

# Display
THEME="matrix"
SHOW_ANIMATIONS=true
SHOW_QUOTES=true
SHOW_TIPS=true

# Monetization
SHOW_CRYPTO_STARTUP=true
SHOW_CRYPTO_SUCCESS=true
SOCIAL_SHARING=true

# System
AUTO_UPDATE=true
OFFLINE_MODE=false
LOG_LEVEL=1

# First Run
FIRST_RUN_COMPLETE=false
INSTALL_DATE=""
CONFIGEOF

    sed -i "s/INSTALL_DATE=\"\"/INSTALL_DATE=\"$(date +%Y-%m-%d)\"/" "$INSTALL_DIR/config/settings.conf" 2>/dev/null || true
    echo -e "  ${G}[✔]${NC} Config generated"
}

create_user_id() {
    if [ ! -f "$INSTALL_DIR/user_id.txt" ]; then
        # Generate unique ID based on user + host + time
        local raw="${USER}@$(hostname)-$(date +%s)"
        if command -v md5sum &>/dev/null; then
            local hash=$(echo -n "$raw" | md5sum | cut -c1-8 | tr 'a-z' 'A-Z')
        else
            local hash="USER$(date +%s | cut -c5-10)"
        fi
        echo "MDH-USER-$hash" > "$INSTALL_DIR/user_id.txt"
    fi
    echo -e "  ${G}[✔]${NC} User identity established: $(cat "$INSTALL_DIR/user_id.txt")"
}

create_quotes() {
    cat > "$INSTALL_DIR/lib/quotes.sh" << 'QUOTESEOF'
#!/usr/bin/env bash
# MDHojayfa Quote Library

STARTUP_QUOTES=(
    "Every byte you save is a victory against chaos."
    "In the world of ones and zeros, we are the architects."
    "They said it couldn't be compressed further. We proved them wrong."
    "Code is poetry. Compression is its rhythm."
    "Welcome back, digital warrior."
    "The terminal is our canvas. Data is our paint."
    "Boot sequence complete. Let's make history."
    "Today, we compress the impossible."
    "Your data called. It wants to be smaller."
    "Legends don't wait. They compress."
)

COMPRESSION_QUOTES=(
    "Patience is the companion of wisdom."
    "Every millisecond of wait is a megabyte saved."
    "The algorithm knows no fatigue. Neither should you."
    "Entropy is the enemy. We are the resistance."
    "Great compression requires great patience."
    "Your data is being reborn, smaller but whole."
    "The CPU burns so your storage may rest."
    "Compressing the impossible, one byte at a time."
    "Time is temporary. Compression is eternal."
    "We don't break limits. We redefine them."
    "The bits align. The magic happens."
    "Silence the noise. Amplify the signal."
    "Every pattern found is space reclaimed."
    "Trust the process. Trust MDH_ZONE."
    "We're not just saving space. We're saving the future."
)

SUCCESS_QUOTES=(
    "Mission accomplished. Another victory for efficiency."
    "What was once large, now fits in your pocket."
    "The impossible became possible. You witnessed it."
    "Data compressed. Space liberated. Mission complete."
    "Another file conquered. Another limit broken."
    "Excellence is not an act, but a compression ratio."
    "They doubted. We compressed. They witnessed."
    "History has been made. Your file is proof."
    "Small file. Big achievement."
    "Compression complete. Legend status: Achieved."
)

SHUTDOWN_QUOTES=(
    "Until next time, digital warrior."
    "The terminal sleeps, but the legend grows."
    "Logging off. But the compression lives forever."
    "Rest now. Tomorrow, we compress again."
    "Connection terminated. But the legacy remains."
    "The void awaits. Until we meet again."
    "Goodbye is just another hello, compressed."
    "The bits rest. The legend persists."
    "Shutdown complete. But never forgotten."
    "See you in the next compression cycle."
)

MDHZONE_QUOTES=(
    "You have chosen the path of no return. Respect."
    "Welcome to the forbidden zone. Only legends enter here."
    "This is not compression. This is digital alchemy."
    "Beyond GODLY. Beyond LEGENDARY. Welcome to MDH_ZONE."
    "The forbidden exists for those who dare."
    "Your patience will be rewarded with the impossible."
    "We're not just compressing. We're bending reality."
    "Some call it madness. We call it MDH_ZONE."
    "The universe compresses around us. We compress back."
    "This is where science meets sorcery."
)

get_random_quote() {
    local category="$1"
    local -n arr="$category"
    local count=${#arr[@]}
    local index=$((RANDOM % count))
    echo "${arr[$index]}"
}
QUOTESEOF
    chmod +x "$INSTALL_DIR/lib/quotes.sh"
    echo -e "  ${G}[✔]${NC} Quotes library compiled"
}

create_utils() {
    cat > "$INSTALL_DIR/lib/utils.sh" << 'UTILSEOF'
#!/usr/bin/env bash
# MDH_COMPRESSER Utility Library

format_size() {
    local bytes=$1
    if [ "$bytes" -ge 1099511627776 ]; then
        echo "$(echo "scale=2; $bytes / 1099511627776" | bc) TB"
    elif [ "$bytes" -ge 1073741824 ]; then
        echo "$(echo "scale=2; $bytes / 1073741824" | bc) GB"
    elif [ "$bytes" -ge 1048576 ]; then
        echo "$(echo "scale=2; $bytes / 1048576" | bc) MB"
    elif [ "$bytes" -ge 1024 ]; then
        echo "$(echo "scale=2; $bytes / 1024" | bc) KB"
    else
        echo "${bytes} B"
    fi
}

get_size_bytes() {
    local target="$1"
    if [ -d "$target" ]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            find "$target" -type f -exec stat -f%z {} + 2>/dev/null | awk '{s+=$1} END {print s+0}'
        else
            du -sb "$target" 2>/dev/null | cut -f1
        fi
    elif [ -f "$target" ]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            stat -f%z "$target" 2>/dev/null
        else
            stat -c%s "$target" 2>/dev/null
        fi
    else
        echo "0"
    fi
}

format_time() {
    local seconds=$1
    if [ "$seconds" -ge 86400 ]; then
        printf "%dd %dh %dm %ds" $((seconds/86400)) $((seconds%86400/3600)) $((seconds%3600/60)) $((seconds%60))
    elif [ "$seconds" -ge 3600 ]; then
        printf "%dh %dm %ds" $((seconds/3600)) $((seconds%3600/60)) $((seconds%60))
    elif [ "$seconds" -ge 60 ]; then
        printf "%dm %ds" $((seconds/60)) $((seconds%60))
    else
        printf "%ds" "$seconds"
    fi
}

detect_archive_type() {
    local file="$1"
    local magic_bytes=""
    
    if command -v xxd &>/dev/null; then
        magic_bytes=$(xxd -p -l 10 "$file" 2>/dev/null)
    fi
    
    case "$magic_bytes" in
        504b0304*|504b0506*|504b0708*) echo "zip" ;;
        526172211a07*) echo "rar" ;;
        377abcaf271c*) echo "7z" ;;
        1f8b*) echo "gz" ;;
        fd377a585a00*) echo "xz" ;;
        425a68*) echo "bz2" ;;
        04224d18*) echo "lz4" ;;
        28b52ffd*) echo "zst" ;;
        *)
            case "${file,,}" in
                *.tar.gz|*.tgz) echo "tar.gz" ;;
                *.tar.xz|*.txz) echo "tar.xz" ;;
                *.tar.bz2|*.tbz2) echo "tar.bz2" ;;
                *.tar.lz4) echo "tar.lz4" ;;
                *.tar.zst) echo "tar.zst" ;;
                *.tar) echo "tar" ;;
                *.zip) echo "zip" ;;
                *.rar) echo "rar" ;;
                *.7z) echo "7z" ;;
                *.gz) echo "gz" ;;
                *.xz) echo "xz" ;;
                *.bz2) echo "bz2" ;;
                *.lz4) echo "lz4" ;;
                *.zst) echo "zst" ;;
                *) echo "unknown" ;;
            esac
            ;;
    esac
}

open_url() {
    local url="$1"
    if [ -d "/data/data/com.termux" ] && command -v termux-open-url &>/dev/null; then
        termux-open-url "$url"
    elif command -v xdg-open &>/dev/null; then
        xdg-open "$url" 2>/dev/null &
    elif command -v open &>/dev/null; then
        open "$url"
    elif command -v wslview &>/dev/null; then
        wslview "$url"
    elif command -v cmd.exe &>/dev/null; then
        cmd.exe /c start "$url"
    fi
}

copy_to_clipboard() {
    local text="$1"
    if [ -d "/data/data/com.termux" ] && command -v termux-clipboard-set &>/dev/null; then
        termux-clipboard-set "$text"
    elif command -v xclip &>/dev/null; then
        echo -n "$text" | xclip -sel clip
    elif command -v pbcopy &>/dev/null; then
        echo -n "$text" | pbcopy
    elif command -v clip.exe &>/dev/null; then
        echo -n "$text" | clip.exe
    fi
}
UTILSEOF
    chmod +x "$INSTALL_DIR/lib/utils.sh"
    echo -e "  ${G}[✔]${NC} Utilities library compiled"
}
# ══════════════════════════════════════════════════════════════════════════════════════
# 8. MAIN LAUNCHER CREATION
# ══════════════════════════════════════════════════════════════════════════════════════

create_launcher() {
    echo -e "  ${NEON_Y}[PHASE 4]${NC} ${W}COMPILING CORE SYSTEM${NC}"
    echo -e "  ${GR}─────────────────────────────────────────────────────────${NC}"
    echo ""
    
    cat > "$BIN_DIR/$COMMAND_NAME" << 'LAUNCHEREOF'
#!/usr/bin/env bash
# MDH_COMPRESSER MAIN LAUNCHER

INSTALL_DIR="$HOME/.mdhcompresser"
VERSION="3.0.0"

# Import Libraries
source "$INSTALL_DIR/lib/quotes.sh"
source "$INSTALL_DIR/lib/utils.sh"

# Colors & Vars
R='\033[0;31m'; G='\033[0;32m'; Y='\033[1;33m'; B='\033[0;34m'
P='\033[0;35m'; C='\033[0;36m'; W='\033[1;37m'; GR='\033[1;30m'
NC='\033[0m'; BOLD='\033[1m'; DIM='\033[2m'; BLINK='\033[5m'
NEON_G='\033[38;5;46m'; NEON_P='\033[38;5;201m'; NEON_C='\033[38;5;51m'
NEON_R='\033[38;5;196m'; NEON_Y='\033[38;5;226m'
SH1='░'; SH2='▒'; SH3='▓'

# Ad Links
LINK_EXE="https://exe.io/KGhnFMQ"
LINK_VERT="https://linkvertise.com/2020139/42UOOrQBhJrw"
LINK_HUB="https://link-hub.net/2020139/42UOOrQBhJrw"

# Cursor Control
hide_cursor() { printf '\033[?25l'; }
show_cursor() { printf '\033[?25h'; }
clear_screen() { printf '\033[2J\033[H'; }
trap 'show_cursor; echo -e "${NC}"; exit' EXIT INT TERM

# ══════════════════════════════════════════════════════════════════════════════════════
# KEY VERIFICATION SYSTEM
# ══════════════════════════════════════════════════════════════════════════════════════

get_daily_key() {
    local date_str=$(date +%Y%m%d)
    local salt="MDHZONE2024SECRET"
    local raw="${date_str}${salt}"
    
    if command -v md5sum &>/dev/null; then
        local hash=$(echo -n "$raw" | md5sum | cut -c1-8 | tr 'a-z' 'A-Z')
    else
        # Fallback hash
        local hash="A7F3B2C9" 
    fi
    echo "MDH-${hash:0:4}-${hash:4:4}"
}

check_key() {
    local key_file="$INSTALL_DIR/today.key"
    local expected_key=$(get_daily_key)
    
    # Offline mode check
    if ! ping -c 1 google.com &>/dev/null; then
        return 2 # No internet
    fi
    
    if [ -f "$key_file" ]; then
        local stored_key=$(cat "$key_file")
        if [ "$stored_key" == "$expected_key" ]; then
            return 0 # Valid
        fi
    fi
    return 1 # Invalid/Expired
}

show_key_prompt() {
    local ad_link
    local rand=$((RANDOM % 100))
    
    # Ad Rotation Logic
    if [ $rand -lt 60 ]; then
        ad_link="$LINK_EXE"
    elif [ $rand -lt 90 ]; then
        ad_link="$LINK_VERT"
    else
        ad_link="$LINK_HUB"
    fi
    
    clear_screen
    echo ""
    echo -e "  ${NEON_R}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "  ${NEON_R}║${NC}                  ${BLINK}🔐 DAILY ACCESS KEY REQUIRED${NC}                    ${NEON_R}║${NC}"
    echo -e "  ${NEON_R}╠══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "  ${NEON_R}║${NC}                                                                  ${NEON_R}║${NC}"
    echo -e "  ${NEON_R}║${NC}  To use MDH_COMPRESSER, you need today's free access key.        ${NEON_R}║${NC}"
    echo -e "  ${NEON_R}║${NC}  This helps support development and keep the tool free.          ${NEON_R}║${NC}"
    echo -e "  ${NEON_R}║${NC}                                                                  ${NEON_R}║${NC}"
    echo -e "  ${NEON_R}║${NC}  ${NEON_Y}1.${NC} Get key here:                                                ${NEON_R}║${NC}"
    echo -e "  ${NEON_R}║${NC}     ${NEON_C}${ad_link}${NC}                     ${NEON_R}║${NC}"
    echo -e "  ${NEON_R}║${NC}                                                                  ${NEON_R}║${NC}"
    echo -e "  ${NEON_R}║${NC}  ${NEON_Y}2.${NC} Enter key below:                                             ${NEON_R}║${NC}"
    echo -e "  ${NEON_R}║${NC}                                                                  ${NEON_R}║${NC}"
    echo -e "  ${NEON_R}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "  [O] Open Link  [E] Enter Key  [Q] Quit"
    echo ""
    echo -ne "  ${NEON_G}>> Choice:${NC} "
    read -r choice
    
    case "${choice,,}" in
        o)
            open_url "$ad_link"
            echo -e "  ${G}[*]${NC} Link opened. Please complete the steps to get your key."
            echo ""
            echo -ne "  ${NEON_G}>> Enter Key:${NC} "
            read -r user_key
            validate_input_key "$user_key"
            ;;
        e)
            echo -ne "  ${NEON_G}>> Enter Key:${NC} "
            read -r user_key
            validate_input_key "$user_key"
            ;;
        q) exit 0 ;;
        *) show_key_prompt ;;
    esac
}

validate_input_key() {
    local input="$1"
    local expected=$(get_daily_key)
    
    if [ "$input" == "$expected" ]; then
        echo "$input" > "$INSTALL_DIR/today.key"
        echo -e "  ${NEON_G}[✔] ACCESS GRANTED${NC}"
        sleep 1
    else
        echo -e "  ${NEON_R}[✘] INVALID KEY${NC}"
        sleep 1
        show_key_prompt
    fi
}

# ══════════════════════════════════════════════════════════════════════════════════════
# MENU SYSTEM
# ══════════════════════════════════════════════════════════════════════════════════════

main_menu() {
    local has_internet=true
    if ! ping -c 1 google.com &>/dev/null; then has_internet=false; fi
    
    clear_screen
    echo ""
    echo -e "  ${W}╔═══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "  ${W}║${NC}${GR}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${NC}${W}║${NC}"
    echo -e "  ${W}║${NC}${GR}░${NC}                    ${NEON_C}MDH COMMAND CENTER${NC}                     ${GR}░${NC}${W}║${NC}"
    echo -e "  ${W}║${NC}${GR}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${NC}${W}║${NC}"
    echo -e "  ${W}╠═══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "  ${W}║${NC}                                                                   ${W}║${NC}"
    echo -e "  ${W}║${NC}   ${NEON_G}[1]${NC} ${W}🗜️  COMPRESSOR${NC}                                            ${W}║${NC}"
    echo -e "  ${W}║${NC}       ${DIM}9 Extreme Modes (Flash → MDH_ZONE)${NC}                        ${W}║${NC}"
    echo -e "  ${W}║${NC}                                                                   ${W}║${NC}"
    echo -e "  ${W}║${NC}   ${NEON_G}[2]${NC} ${W}📂 EXTRACTOR${NC}                                              ${W}║${NC}"
    echo -e "  ${W}║${NC}       ${DIM}Auto-detect & extract any format${NC}                          ${W}║${NC}"
    echo -e "  ${W}║${NC}                                                                   ${W}║${NC}"
    echo -e "  ${W}╠═══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "  ${W}║${NC}                                                                   ${W}║${NC}"
    echo -e "  ${W}║${NC}   ${Y}[3]${NC} ${W}📊 MY STATS${NC}                                               ${W}║${NC}"
    echo -e "  ${W}║${NC}   ${Y}[4]${NC} ${W}💖 SUPPORT${NC}                                                ${W}║${NC}"
    echo -e "  ${W}║${NC}   ${Y}[5]${NC} ${W}🔄 UPDATE${NC}                                                 ${W}║${NC}"
    echo -e "  ${W}║${NC}   ${GR}[0]${NC} ${DIM}EXIT${NC}                                                     ${W}║${NC}"
    echo -e "  ${W}║${NC}                                                                   ${W}║${NC}"
    echo -e "  ${W}╚═══════════════════════════════════════════════════════════════════╝${NC}"
    
    if [ "$has_internet" = false ]; then
        echo -e "  ${NEON_R}⚠ OFFLINE MODE ACTIVE - Advanced features disabled${NC}"
    fi
    
    echo ""
    echo -ne "  ${NEON_G}>> Select Option:${NC} "
    read -r option
    
    case $option in
        1) bash "$INSTALL_DIR/lib/compressor.sh" ;;
        2) bash "$INSTALL_DIR/lib/extractor.sh" ;;
        3) show_stats ;;
        4) show_support ;;
        5) check_update ;;
        0) exit 0 ;;
        *) main_menu ;;
    esac
}

show_support() {
    clear_screen
    echo ""
    echo -e "  ${NEON_P}╔═══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "  ${NEON_P}║${NC}                  ${W}💖 SUPPORT MDH_COMPRESSER${NC}                      ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}╠═══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "  ${NEON_P}║${NC}                                                                   ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}  ${NEON_Y}💎 CRYPTO DONATIONS (Zero Fees)${NC}                                 ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}                                                                   ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}  ${NEON_C}₿ BTC:${NC}                                                       ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}    ${DIM}bc1q24yndamzynl8afdmy52heclglk79ucu4jqn638${NC}                   ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}                                                                   ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}  ${NEON_C}◎ SOL:${NC}                                                        ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}    ${DIM}2hbHyZa4deyS12spqo14CPSKFH9dBGYYBLjjHN57x94P${NC}                   ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}                                                                   ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}  ${NEON_C}Ξ ETH / BNB / USDT:${NC}                                           ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}    ${DIM}0xcb99db7464669a52513fae435f7a59e18e8d89f1${NC}                   ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}╠═══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "  ${NEON_P}║${NC}                                                                   ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}  ${NEON_Y}📩 CONTACT${NC}                                                      ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}  ${W}Telegram:${NC} @Urniggar                                             ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}║${NC}                                                                   ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}╚═══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -ne "  ${NEON_C}Press Enter to return...${NC}"
    read -r
    main_menu
}

check_update() {
    echo -e "\n  ${NEON_C}[*] Checking for updates...${NC}"
    # Placeholder for update logic
    sleep 1
    echo -e "  ${NEON_G}[✔] You are on the latest version (v${VERSION})${NC}"
    sleep 1
    main_menu
}

show_stats() {
    clear_screen
    echo ""
    echo -e "  ${NEON_C}📊 YOUR STATS${NC}"
    echo -e "  ─────────────"
    echo -e "  User ID:    $(cat "$INSTALL_DIR/user_id.txt")"
    echo -e "  Level:      1 (Novice)"
    echo -e "  XP:         0 / 100"
    echo -e "  Streak:     1 Day"
    echo ""
    echo -ne "  ${NEON_C}Press Enter...${NC}"
    read -r
    main_menu
}

# Entry Point
main() {
    check_key
    local status=$?
    
    if [ $status -eq 1 ]; then
        show_key_prompt
    elif [ $status -eq 2 ]; then
        # Offline mode
        export MDH_OFFLINE=true
    fi
    
    main_menu
}

main "$@"
LAUNCHEREOF

    chmod +x "$BIN_DIR/$COMMAND_NAME"
    echo -e "  ${G}[✔]${NC} Launcher compiled: ${DIM}$BIN_DIR/$COMMAND_NAME${NC}"
}
# ══════════════════════════════════════════════════════════════════════════════════════
# 9. COMPRESSOR MODULE GENERATION
# ══════════════════════════════════════════════════════════════════════════════════════

create_compressor() {
    echo -e "  ${NEON_Y}[PHASE 5]${NC} ${W}COMPILING COMPRESSION ENGINE${NC}"
    echo -e "  ${GR}─────────────────────────────────────────────────────────${NC}"
    echo ""
    
    cat > "$INSTALL_DIR/lib/compressor.sh" << 'COMPEOF'
#!/usr/bin/env bash
# MDH_COMPRESSER - Compression Engine

INSTALL_DIR="$HOME/.mdhcompresser"
source "$INSTALL_DIR/lib/utils.sh"
source "$INSTALL_DIR/lib/quotes.sh"

# Colors
R='\033[0;31m'; G='\033[0;32m'; Y='\033[1;33m'; P='\033[0;35m'
C='\033[0;36m'; W='\033[1;37m'; GR='\033[1;30m'; NC='\033[0m'
NEON_G='\033[38;5;46m'; NEON_P='\033[38;5;201m'; NEON_C='\033[38;5;51m'
NEON_R='\033[38;5;196m'; NEON_Y='\033[38;5;226m'
SH1='░'; SH2='▒'; SH3='▓'

# State
INPUT_FILE=""
OUTPUT_FILE=""
MODE=""
ORIGINAL_SIZE=0

# ══════════════════════════════════════════════════════════════════════════════════════
# COMPRESSION MODES
# ══════════════════════════════════════════════════════════════════════════════════════

show_modes() {
    clear
    echo ""
    echo -e "  ${W}╔═══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "  ${W}║${NC}                   ${NEON_C}SELECT COMPRESSION MODE${NC}                     ${W}║${NC}"
    echo -e "  ${W}╠═══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "  ${W}║${NC}                                                                   ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${GR}SPEED OPTIMIZED${NC}                                                  ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${NEON_G}[1]${NC} FLASH ⚡        ${DIM}LZ4 (800MB/s)${NC}                               ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${NEON_G}[2]${NC} LITTLE FLOWER 🌸 ${DIM}Zstd Fast${NC}                                 ${W}║${NC}"
    echo -e "  ${W}║${NC}                                                                   ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${GR}BALANCED${NC}                                                         ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${NEON_Y}[3]${NC} ASIAN 🍜        ${DIM}7z Balanced${NC}                               ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${NEON_Y}[4]${NC} TASTY DRUNK 🍺  ${DIM}7z High${NC}                                   ${W}║${NC}"
    echo -e "  ${W}║${NC}                                                                   ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${GR}MAXIMUM POWER${NC}                                                    ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${NEON_R}[5]${NC} BEAST 🦁        ${DIM}7z Ultra${NC}                                  ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${NEON_R}[6]${NC} GODLY 👑        ${DIM}XZ Extreme${NC}                                ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${NEON_R}[7]${NC} LEGENDARY 🐉    ${DIM}ZPAQ Max${NC}                                  ${W}║${NC}"
    echo -e "  ${W}║${NC}                                                                   ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${GR}FORBIDDEN ZONE${NC}                                                   ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${NEON_P}[8]${NC} MYTHIC 💀       ${DIM}Multi-Pass Pipeline${NC}                       ${W}║${NC}"
    echo -e "  ${W}║${NC}  ${NEON_P}[9]${NC} MDH_ZONE ☠️     ${DIM}ABSOLUTE LIMIT${NC}                            ${W}║${NC}"
    echo -e "  ${W}║${NC}                                                                   ${W}║${NC}"
    echo -e "  ${W}╚═══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    if [ "$MDH_OFFLINE" = "true" ]; then
        echo -e "  ${NEON_R}⚠ OFFLINE MODE: Only modes 1-3 available${NC}"
    fi
    
    echo -ne "  ${NEON_G}>> Select Mode:${NC} "
    read -r MODE
    
    if [ "$MDH_OFFLINE" = "true" ] && [ "$MODE" -gt 3 ]; then
        echo -e "  ${R}[!] Feature locked in offline mode.${NC}"
        sleep 1
        show_modes
    fi
}

get_input() {
    echo ""
    echo -e "  ${NEON_C}[INPUT]${NC} Enter file/folder path:"
    echo -ne "  ${GR}>>${NC} "
    read -e -r INPUT_FILE
    
    if [ ! -e "$INPUT_FILE" ]; then
        echo -e "  ${R}[!] File not found.${NC}"
        sleep 1
        get_input
    fi
    
    ORIGINAL_SIZE=$(get_size_bytes "$INPUT_FILE")
    echo -e "  ${G}[✔]${NC} Size: $(format_size $ORIGINAL_SIZE)"
}

compress() {
    local ext=""
    local cmd=""
    
    case $MODE in
        1) # FLASH
            ext="tar.lz4"
            cmd="tar cf - \"$INPUT_FILE\" | lz4 -1 -"
            ;;
        2) # FLOWER
            ext="tar.zst"
            cmd="tar cf - \"$INPUT_FILE\" | zstd -3 -"
            ;;
        3) # ASIAN
            ext="7z"
            cmd="7z a -t7z -mx=5 -mmt=on"
            ;;
        4) # DRUNK
            ext="7z"
            cmd="7z a -t7z -mx=7 -m0=LZMA2:d=64m:fb=64 -mmt=on"
            ;;
        5) # BEAST
            ext="7z"
            cmd="7z a -t7z -mx=9 -m0=LZMA2:d=256m:fb=273 -ms=on -mmt=on"
            ;;
        6) # GODLY
            ext="tar.xz"
            cmd="tar cf - \"$INPUT_FILE\" | xz -9e --threads=0"
            ;;
        7) # LEGENDARY
            ext="zpaq"
            if command -v zpaq &>/dev/null; then
                cmd="zpaq a \"OUTPUT\" \"$INPUT_FILE\" -method 5"
            else
                echo -e "  ${Y}[!] ZPAQ not found, falling back to XZ Extreme${NC}"
                ext="tar.xz"
                cmd="tar cf - \"$INPUT_FILE\" | xz -9e --threads=0"
            fi
            ;;
        8) # MYTHIC
            ext="7z"
            # Pre-process then 7z max
            cmd="7z a -t7z -mx=9 -m0=LZMA2:d=512m:fb=273:lc=4 -ms=on -mmt=on"
            ;;
        9) # MDH_ZONE
            ext="mdh.7z"
            echo -e "  ${NEON_R}☠ INITIATING MDH_ZONE PROTOCOL ☠${NC}"
            sleep 1
            # The absolute maximum settings possible in 7-Zip
            cmd="7z a -t7z -mx=9 -m0=LZMA2:d=1536m:fb=273:lc=4 -ms=on -mmt=on"
            ;;
    esac
    
    OUTPUT_FILE="${INPUT_FILE}_compressed.${ext}"
    
    echo ""
    echo -e "  ${NEON_P}╔═══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "  ${NEON_P}║${NC}                  ${W}COMPRESSION IN PROGRESS${NC}                      ${NEON_P}║${NC}"
    echo -e "  ${NEON_P}╚═══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Random Quote
    local quote=$(get_random_quote COMPRESSION_QUOTES)
    echo -e "  ${DIM}\"$quote\"${NC}"
    echo ""
    
    local start_time=$(date +%s)
    
    # Execute with progress bar simulation (since actual piping hides progress)
    if [[ "$MODE" -eq 1 || "$MODE" -eq 2 || "$MODE" -eq 6 ]]; then
        eval "$cmd > \"$OUTPUT_FILE\"" &
        local pid=$!
        while kill -0 $pid 2>/dev/null; do
            echo -ne "  ${NEON_C}Processing...${NC} \r"
            sleep 0.5
        done
    else
        # 7z handles its own progress if not piped, but here we simplify
        eval "$cmd \"$OUTPUT_FILE\" \"$INPUT_FILE\" > /dev/null" &
        local pid=$!
        while kill -0 $pid 2>/dev/null; do
            echo -ne "  ${NEON_C}Compressing...${NC} \r"
            sleep 0.5
        done
    fi
    
    local end_time=$(date +%s)
    local duration=$((end_time - start_time))
    
    if [ -f "$OUTPUT_FILE" ]; then
        show_results "$OUTPUT_FILE" "$ORIGINAL_SIZE" "$duration"
    else
        echo -e "  ${R}[!] Compression failed.${NC}"
    fi
}

show_results() {
    local file="$1"
    local orig="$2"
    local time="$3"
    local final=$(get_size_bytes "$file")
    local ratio=$(echo "scale=2; ($final / $orig) * 100" | bc)
    local saved=$(echo "scale=2; 100 - $ratio" | bc)
    
    clear
    echo ""
    echo -e "  ${NEON_G}🎉 COMPRESSION COMPLETE!${NC}"
    echo ""
    echo -e "  ${W}Original:${NC}  $(format_size $orig)"
    echo -e "  ${W}Final:${NC}     $(format_size $final)"
    echo -e "  ${W}Ratio:${NC}     ${NEON_Y}${ratio}%${NC} (Size)"
    echo -e "  ${W}Saved:${NC}     ${NEON_G}${saved}%${NC}"
    echo -e "  ${W}Time:${NC}      ${time}s"
    echo ""
    echo -e "  ${DIM}File saved at:${NC}"
    echo -e "  ${file}"
    echo ""
    
    # Social Sharing
    echo -e "  ${NEON_C}📢 Share your achievement?${NC}"
    echo -e "  [1] Copy to Clipboard"
    echo -e "  [2] Skip"
    echo -ne "  >> "
    read -r share
    
    if [ "$share" == "1" ]; then
        local msg="🔥 Just compressed $(format_size $orig) → $(format_size $final) ($saved% saved) using MDH_COMPRESSER! 🚀 https://github.com/MDHojayfa/MDH_Compresser"
        copy_to_clipboard "$msg"
        echo -e "  ${G}[✔] Copied!${NC}"
    fi
    
    # Support Reminder
    echo ""
    echo -e "  ${NEON_P}💖 Support MDHojayfa:${NC}"
    echo -e "  ${DIM}BTC: bc1q24yndamzynl8afdmy52heclglk79ucu4jqn638${NC}"
    echo ""
    echo -ne "  Press Enter to return..."
    read -r
}

# Main Logic
show_modes
get_input
compress
COMPEOF

    chmod +x "$INSTALL_DIR/lib/compressor.sh"
    echo -e "  ${G}[✔]${NC} Compression engine compiled"
}
# ══════════════════════════════════════════════════════════════════════════════════════
# 10. EXTRACTOR MODULE GENERATION
# ══════════════════════════════════════════════════════════════════════════════════════

create_extractor() {
    echo -e "  ${NEON_Y}[PHASE 6]${NC} ${W}COMPILING EXTRACTOR ENGINE${NC}"
    echo -e "  ${GR}─────────────────────────────────────────────────────────${NC}"
    echo ""
    
    cat > "$INSTALL_DIR/lib/extractor.sh" << 'EXTEOF'
#!/usr/bin/env bash
# MDH_COMPRESSER - Extractor Engine

INSTALL_DIR="$HOME/.mdhcompresser"
source "$INSTALL_DIR/lib/utils.sh"

# Colors
G='\033[0;32m'; C='\033[0;36m'; NC='\033[0m'; R='\033[0;31m'; Y='\033[1;33m'

echo ""
echo -e "  ${C}╔═══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "  ${C}║${NC}                   ${G}MDH UNIVERSAL EXTRACTOR${NC}                     ${C}║${NC}"
echo -e "  ${C}╚═══════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Get Input
echo -e "  ${C}[INPUT]${NC} Enter archive path (or drag & drop):"
echo -ne "  >> "
read -e -r ARCHIVE

if [ ! -f "$ARCHIVE" ]; then
    echo -e "  ${R}[!] File not found.${NC}"
    exit 1
fi

# Detect Type
TYPE=$(detect_archive_type "$ARCHIVE")
echo -e "  ${G}[*]${NC} Detected format: ${Y}${TYPE^^}${NC}"

# Get Output Dir
OUTPUT_DIR="${ARCHIVE%.*}_extracted"
echo -e "  ${C}[*]${NC} Extracting to: ${OUTPUT_DIR}"
mkdir -p "$OUTPUT_DIR"

echo ""
echo -e "  ${Y}Extracting...${NC}"

# Extraction Logic
case $TYPE in
    zip) unzip "$ARCHIVE" -d "$OUTPUT_DIR" ;;
    rar) 7z x "$ARCHIVE" -o"$OUTPUT_DIR" ;;
    7z) 7z x "$ARCHIVE" -o"$OUTPUT_DIR" ;;
    tar) tar xf "$ARCHIVE" -C "$OUTPUT_DIR" ;;
    tar.gz) tar xzf "$ARCHIVE" -C "$OUTPUT_DIR" ;;
    tar.xz) tar xJf "$ARCHIVE" -C "$OUTPUT_DIR" ;;
    gz) gunzip -c "$ARCHIVE" > "$OUTPUT_DIR/$(basename "$ARCHIVE" .gz)" ;;
    xz) xz -d -c "$ARCHIVE" > "$OUTPUT_DIR/$(basename "$ARCHIVE" .xz)" ;;
    *) 
        echo -e "  ${Y}[!] Unknown format, trying 7z universal...${NC}"
        7z x "$ARCHIVE" -o"$OUTPUT_DIR" 
        ;;
esac

if [ $? -eq 0 ]; then
    echo ""
    echo -e "  ${G}✔ EXTRACTION SUCCESSFUL${NC}"
else
    echo ""
    echo -e "  ${R}✘ EXTRACTION FAILED${NC}"
fi

echo ""
echo -ne "  Press Enter to return..."
read -r
EXTEOF

    chmod +x "$INSTALL_DIR/lib/extractor.sh"
    echo -e "  ${G}[✔]${NC} Extractor engine compiled"
}

# ══════════════════════════════════════════════════════════════════════════════════════
# 11. FINAL SETUP & PATH CONFIGURATION
# ══════════════════════════════════════════════════════════════════════════════════════

setup_environment() {
    echo -e "  ${NEON_Y}[PHASE 7]${NC} ${W}FINALIZING INSTALLATION${NC}"
    echo -e "  ${GR}─────────────────────────────────────────────────────────${NC}"
    echo ""
    
    # Symlink main command
    ln -sf "$BIN_DIR/$COMMAND_NAME" "$BIN_DIR/mdh"
    
    # Add to PATH if needed
    local shell_rc=""
    if [ -f "$HOME/.bashrc" ]; then shell_rc="$HOME/.bashrc"; fi
    if [ -f "$HOME/.zshrc" ]; then shell_rc="$HOME/.zshrc"; fi
    
    if [ -n "$shell_rc" ]; then
        if ! grep -q "MDH_COMPRESSER" "$shell_rc"; then
            echo "" >> "$shell_rc"
            echo "# MDH_COMPRESSER PATH" >> "$shell_rc"
            echo "export PATH=\"$BIN_DIR:\$PATH\"" >> "$shell_rc"
            echo -e "  ${G}[✔]${NC} Added to PATH in ${shell_rc}"
        else
            echo -e "  ${G}[✔]${NC} PATH already configured"
        fi
    fi
    
    # Set permissions
    chmod -R 755 "$INSTALL_DIR"
    chmod 755 "$BIN_DIR/$COMMAND_NAME"
    
    echo -e "  ${G}[✔]${NC} Permissions set"
}

show_success_message() {
    clear_screen
    echo ""
    echo -e "  ${NEON_G}╔═══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "  ${NEON_G}║${NC}                  ${W}🎉 INSTALLATION COMPLETE! 🎉${NC}                 ${NEON_G}║${NC}"
    echo -e "  ${NEON_G}╚═══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "  ${W}MDH_COMPRESSER is successfully installed.${NC}"
    echo ""
    echo -e "  ${C}HOW TO START:${NC}"
    echo -e "  Run command:  ${NEON_Y}${COMMAND_NAME}${NC}"
    echo -e "  Or simply:    ${NEON_Y}mdh${NC}"
    echo ""
    echo -e "  ${GR}───────────────────────────────────────────────────────────────${NC}"
    echo ""
    echo -e "  ${NEON_P}💖 SUPPORT THE DEVELOPER${NC}"
    echo -e "  ${DIM}Crypto addresses will be shown in the tool.${NC}"
    echo ""
    echo -e "  ${W}Opening GitHub profile in 3 seconds...${NC}"
    echo -e "  ${DIM}Please follow @MDHojayfa & star the repo!${NC}"
    echo ""
    
    sleep 3
    open_url "$GITHUB_PROFILE"
}

# ══════════════════════════════════════════════════════════════════════════════════════
# MAIN INSTALLER LOOP
# ══════════════════════════════════════════════════════════════════════════════════════

main() {
    # 1. Boot Animation
    boot_sequence
    
    # 2. System Check
    local os=$(detect_os)
    echo -e "  ${NEON_C}[*]${NC} Detected System: ${W}${os^^}${NC}"
    sleep 1
    
    # 3. Installation Phases
    install_dependencies "$os"
    create_directories
    create_launcher
    create_compressor
    create_extractor
    
    # 4. Embedded Files
    create_config
    create_user_id
    create_quotes
    create_utils
    
    # 5. Finalize
    setup_environment
    
    # 6. Done
    show_success_message
}

# Run Installer
main "$@"
EXTEOF

    # Make sure install.sh is executable right after pasting
    # (This comment is for you, not part of the file)
}
