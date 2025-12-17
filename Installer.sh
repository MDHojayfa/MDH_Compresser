#!/usr/bin/env bash
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  MDH_COMPRESSER v3.0.0 | The World's Most Powerful Compression Suite
#  Author: MDHojayfa | GitHub: @MDHojayfa
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# ERROR HANDLING: Don't exit on simple errors, handle them gracefully
set +e 

# ══════════════════════════════════════════════════════════════════════════════════════
# 1. CONFIGURATION
# ══════════════════════════════════════════════════════════════════════════════════════
INSTALL_DIR="$HOME/.mdhcompresser"
BIN_DIR="$HOME/.local/bin"
COMMAND_NAME="mdhcompresser"
GITHUB_PROFILE="https://github.com/MDHojayfa"
GITHUB_REPO="https://github.com/MDHojayfa/MDH_Compresser"

# Crypto Addresses
BTC_ADDR="bc1q24yndamzynl8afdmy52heclglk79ucu4jqn638"
SOL_ADDR="2hbHyZa4deyS12spqo14CPSKFH9dBGYYBLjjHN57x94P"
ETH_ADDR="0xcb99db7464669a52513fae435f7a59e18e8d89f1"

# Ad Links
LINK_EXE="https://exe.io/KGhnFMQ"
LINK_VERT="https://linkvertise.com/2020139/42UOOrQBhJrw"
LINK_HUB="https://link-hub.net/2020139/42UOOrQBhJrw"

# Colors
R='\033[0;31m'; G='\033[0;32m'; C='\033[0;36m'; Y='\033[1;33m'; P='\033[0;35m'; NC='\033[0m'
NEON_G='\033[38;5;46m'; NEON_P='\033[38;5;201m'; NEON_C='\033[38;5;51m'
NEON_R='\033[38;5;196m'; NEON_Y='\033[38;5;226m'
DIM='\033[2m'; BOLD='\033[1m'
S1='░'; S2='▒'; S3='▓'; S4='█'

# ══════════════════════════════════════════════════════════════════════════════════════
# 2. ANIMATION ENGINE
# ══════════════════════════════════════════════════════════════════════════════════════

hide_cursor() { printf '\033[?25l'; }
show_cursor() { printf '\033[?25h'; }
clear_screen() { printf '\033[2J\033[H'; }

matrix_rain_heavy() {
    local duration=${1:-2}
    local end=$((SECONDS + duration))
    local chars="01アイウエオカキクケコ░▒▓█"
    local cols=$(tput cols 2>/dev/null || echo 80)
    local rows=$(tput lines 2>/dev/null || echo 24)
    
    hide_cursor
    clear_screen
    
    while [ $SECONDS -lt $end ]; do
        for ((i=0; i<10; i++)); do
            local col=$((RANDOM % cols + 1))
            local row=$((RANDOM % rows + 1))
            local char="${chars:RANDOM % ${#chars}:1}"
            printf "\033[%d;%dH${NEON_G}%s${NC}" "$row" "$col" "$char"
        done
        sleep 0.01
    done
    clear_screen
    show_cursor
}

cyber_glitch() {
    local text="$1"
    for ((i=0; i<3; i++)); do
        printf "\r${NEON_R}%s${NC}" "$(echo "$text" | tr 'a-zA-Z' '0-9@#$%')"
        sleep 0.05
        printf "\r${NEON_C}%s${NC}" "$text"
        sleep 0.05
    done
    printf "\r${NEON_G}%s${NC}\n" "$text"
}

hacker_type() {
    local text="$1"
    for ((i=0; i<${#text}; i++)); do
        printf "${NEON_G}%s${NC}" "${text:$i:1}"
        sleep 0.02
    done
    printf "\n"
}

boot_sequence() {
    matrix_rain_heavy 2
    echo ""
    echo -e "${NEON_P}  ███╗   ███╗██████╗ ██╗  ██╗${NC}"
    echo -e "${NEON_P}  ████╗ ████║██╔══██╗██║  ██║${NC}"
    echo -e "${NEON_P}  ██╔████╔██║██║  ██║███████║${NC}"
    echo -e "${NEON_P}  ██║╚██╔╝██║██║  ██║██╔══██║${NC}"
    echo -e "${NEON_P}  ██║ ╚═╝ ██║██████╔╝██║  ██║${NC}"
    echo -e "${NEON_P}  ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝${NC}"
    echo ""
    echo -e "${W}  THE WORLD'S MOST POWERFUL COMPRESSOR${NC}"
    echo -e "${GR}  v3.0.0 | FORBIDDEN EDITION${NC}"
    echo ""
    
    local msgs=("INITIALIZING CORE" "BYPASSING SECURITY" "LOADING ALGORITHMS" "SYSTEM READY")
    for msg in "${msgs[@]}"; do
        printf "  ${GR}[${NC}${NEON_C}SYS${NC}${GR}]${NC} "
        cyber_glitch "$msg"
        sleep 0.1
    done
    echo ""
}

# ══════════════════════════════════════════════════════════════════════════════════════
# 3. ROBUST INSTALLATION LOGIC
# ══════════════════════════════════════════════════════════════════════════════════════

detect_os() {
    if [ -d "/data/data/com.termux" ]; then echo "termux";
    elif [ -f /etc/debian_version ]; then echo "debian";
    elif [ -f /etc/arch-release ]; then echo "arch";
    else echo "unknown"; fi
}

install_dependencies() {
    local os=$(detect_os)
    echo -e "  ${NEON_Y}[PHASE 2]${NC} ${W}INSTALLING DEPENDENCIES${NC}"
    echo -e "  ${GR}─────────────────────────────────────────────────────────${NC}"
    echo -e "  ${DIM}(This may take time. Please wait...)${NC}"
    echo ""

    case "$os" in
        termux)
            echo -e "  ${NEON_C}[*]${NC} Configuring Termux environment..."
            export DEBIAN_FRONTEND=noninteractive
            echo -e "  ${NEON_C}[*]${NC} Updating repositories (Force Mode)..."
            yes | pkg update -y -o Dpkg::Options::="--force-confnew" || echo -e "  ${Y}[!] Update warning (continuing...)${NC}"
            echo -e "  ${NEON_C}[*]${NC} Installing tools..."
            yes | pkg install -y p7zip zip unzip tar xz-utils gzip bzip2 pv bc file lz4 zstd
            ;;
        debian)
            echo -e "  ${NEON_C}[*]${NC} Updating apt..."
            sudo apt-get update -y
            echo -e "  ${NEON_C}[*]${NC} Installing tools..."
            sudo apt-get install -y p7zip-full zip unzip tar xz-utils gzip bzip2 pv bc file lz4 zstd
            ;;
        arch)
            echo -e "  ${NEON_C}[*]${NC} Installing via pacman..."
            sudo pacman -Sy --noconfirm p7zip zip unzip tar xz gzip bzip2 pv bc file lz4 zstd
            ;;
        *)
            echo -e "  ${R}[!] Manual installation required for this OS.${NC}"
            ;;
    esac
    
    echo ""
    echo -e "  ${NEON_G}[✔] Dependencies Installed.${NC}"
}

create_dirs() {
    mkdir -p "$INSTALL_DIR"/{lib,config,data}
    mkdir -p "$BIN_DIR"
    echo -e "  ${NEON_G}[✔] Directory Structure Created.${NC}"
}
# ══════════════════════════════════════════════════════════════════════════════════════
# 4. FILE GENERATION
# ══════════════════════════════════════════════════════════════════════════════════════

generate_files() {
    echo -e "  ${NEON_Y}[PHASE 3]${NC} ${W}GENERATING CORE FILES${NC}"
    
    # 1. UTILS LIBRARY
    cat > "$INSTALL_DIR/lib/utils.sh" << 'EOF'
#!/usr/bin/env bash
format_size() {
    local b=$1
    if [ "$b" -ge 1073741824 ]; then echo "$(echo "scale=2; $b/1073741824"|bc) GB"
    elif [ "$b" -ge 1048576 ]; then echo "$(echo "scale=2; $b/1048576"|bc) MB"
    elif [ "$b" -ge 1024 ]; then echo "$(echo "scale=2; $b/1024"|bc) KB"
    else echo "${b} B"; fi
}
get_size() {
    if [[ "$OSTYPE" == "darwin"* ]]; then stat -f%z "$1"
    else stat -c%s "$1"; fi
}
open_url() {
    local u="$1"
    if command -v termux-open-url &>/dev/null; then termux-open-url "$u"
    elif command -v xdg-open &>/dev/null; then xdg-open "$u"
    elif command -v open &>/dev/null; then open "$u"
    fi
}
copy_to_clipboard() {
    local t="$1"
    if command -v termux-clipboard-set &>/dev/null; then termux-clipboard-set "$t"
    elif command -v xclip &>/dev/null; then echo -n "$t" | xclip -sel clip
    elif command -v pbcopy &>/dev/null; then echo -n "$t" | pbcopy
    fi
}
EOF

    # 2. QUOTES LIBRARY
    cat > "$INSTALL_DIR/lib/quotes.sh" << 'EOF'
#!/usr/bin/env bash
STARTUP_QUOTES=(
    "Every byte you save is a victory against chaos."
    "In the world of ones and zeros, we are the architects."
    "Code is poetry. Compression is its rhythm."
    "Welcome back, digital warrior."
    "Today, we compress the impossible."
)
COMPRESSION_QUOTES=(
    "Patience is the companion of wisdom."
    "Every millisecond of wait is a megabyte saved."
    "The algorithm knows no fatigue. Neither should you."
    "Entropy is the enemy. We are the resistance."
    "Trust the process. Trust MDH_ZONE."
)
get_random_quote() {
    local cat="$1"; local -n arr="$cat"
    echo "${arr[$((RANDOM % ${#arr[@]}))]}"
}
EOF

    # 3. COMPRESSOR ENGINE (9 MODES)
    cat > "$INSTALL_DIR/lib/compressor.sh" << 'EOF'
#!/usr/bin/env bash
INSTALL_DIR="$HOME/.mdhcompresser"
source "$INSTALL_DIR/lib/utils.sh"
source "$INSTALL_DIR/lib/quotes.sh"

R='\033[0;31m'; G='\033[0;32m'; C='\033[0;36m'; Y='\033[1;33m'; P='\033[0;35m'; NC='\033[0m'
NEON_G='\033[38;5;46m'; NEON_P='\033[38;5;201m'; NEON_C='\033[38;5;51m'
NEON_R='\033[38;5;196m'; NEON_Y='\033[38;5;226m'
DIM='\033[2m'; BOLD='\033[1m'

clear
echo ""
echo -e "  ${C}╔═══════════════════════════════════════════════════════════╗${NC}"
echo -e "  ${C}║${NC}               ${G}SELECT COMPRESSION PROTOCOL${NC}                 ${C}║${NC}"
echo -e "  ${C}╠═══════════════════════════════════════════════════════════╣${NC}"
echo -e "  ${C}║${NC}  ${Y}[1]${NC} FLASH ⚡        (LZ4 - Instant)                     ${C}║${NC}"
echo -e "  ${C}║${NC}  ${Y}[2]${NC} LITTLE FLOWER 🌸 (Zstd - Fast)                      ${C}║${NC}"
echo -e "  ${C}║${NC}  ${Y}[3]${NC} ASIAN 🍜        (7z - Balanced)                     ${C}║${NC}"
echo -e "  ${C}║${NC}  ${Y}[4]${NC} TASTY DRUNK 🍺  (7z - High)                         ${C}║${NC}"
echo -e "  ${C}║${NC}  ${Y}[5]${NC} BEAST 🦁        (7z - Ultra)                        ${C}║${NC}"
echo -e "  ${C}║${NC}  ${Y}[6]${NC} GODLY 👑        (XZ - Extreme)                      ${C}║${NC}"
echo -e "  ${C}║${NC}  ${Y}[7]${NC} LEGENDARY 🐉    (ZPAQ - Mighty)                     ${C}║${NC}"
echo -e "  ${C}║${NC}  ${Y}[8]${NC} MYTHIC 💀       (Multi-Pass)                        ${C}║${NC}"
echo -e "  ${C}║${NC}  ${P}[9]${NC} MDH_ZONE ☠️     (FORBIDDEN - MAX)                   ${C}║${NC}"
echo -e "  ${C}╚═══════════════════════════════════════════════════════════╝${NC}"
echo ""

if [ "$OFFLINE" = "true" ]; then
    echo -e "  ${NEON_R}⚠ OFFLINE MODE: Only modes 1-3 available${NC}"
fi

echo -ne "  ${G}>> Select Mode:${NC} "
read -r MODE

if [ "$OFFLINE" = "true" ] && [ "$MODE" -gt 3 ]; then
    echo -e "  ${R}[!] Feature locked in offline mode.${NC}"; exit 1
fi

echo -ne "  ${G}>> Enter File/Folder Path:${NC} "
read -e -r INPUT

if [ ! -e "$INPUT" ]; then echo -e "  ${R}[!] Not found.${NC}"; exit 1; fi

SIZE=$(get_size "$INPUT")
echo -e "  ${C}[*] Analyzing target... (${SIZE} bytes)${NC}"
sleep 1

case $MODE in
    1) CMD="tar cf - \"$INPUT\" | lz4 -1 -"; EXT="tar.lz4" ;;
    2) CMD="tar cf - \"$INPUT\" | zstd -3 -"; EXT="tar.zst" ;;
    3) CMD="7z a -t7z -mx=5 -mmt=on"; EXT="7z" ;;
    4) CMD="7z a -t7z -mx=7 -m0=LZMA2:d=64m -mmt=on"; EXT="7z" ;;
    5) CMD="7z a -t7z -mx=9 -m0=LZMA2:d=256m:fb=273 -ms=on"; EXT="7z" ;;
    6) CMD="tar cf - \"$INPUT\" | xz -9e"; EXT="tar.xz" ;;
    7) 
       if command -v zpaq >/dev/null; then CMD="zpaq a \"OUT\" \"$INPUT\" -m5"; EXT="zpaq"
       else echo -e "${Y}[!] ZPAQ missing, using XZ${NC}"; CMD="tar cf - \"$INPUT\" | xz -9e"; EXT="tar.xz"; fi 
       ;;
    8) CMD="7z a -t7z -mx=9 -m0=LZMA2:d=512m:fb=273:lc=4"; EXT="7z" ;;
    9) 
       echo -e "  ${P}☠ INITIATING MDH_ZONE...${NC}"; sleep 1
       CMD="7z a -t7z -mx=9 -m0=LZMA2:d=1024m:fb=273:lc=4 -ms=on -mmt=on"; EXT="mdh.7z" 
       ;;
    *) echo "Invalid"; exit 1 ;;
esac

OUT="${INPUT}_compressed.${EXT}"
echo -e "  ${Y}[*] Compressing... Please wait.${NC}"
echo -e "  ${DIM}\"$(get_random_quote COMPRESSION_QUOTES)\"${NC}"

# Run Compression
if [[ "$MODE" == 1 || "$MODE" == 2 || "$MODE" == 6 ]]; then
    eval "$CMD > \"$OUT\""
else
    # 7z specific
    eval "$CMD \"$OUT\" \"$INPUT\" > /dev/null"
fi

if [ -f "$OUT" ]; then
    NEW_SIZE=$(get_size "$OUT")
    echo ""
    echo -e "  ${NEON_G}✔ SUCCESS!${NC}"
    echo -e "  Original: $(format_size $SIZE)"
    echo -e "  Final:    $(format_size $NEW_SIZE)"
    echo ""
    echo -e "  ${C}📢 Share your result?${NC}"
    echo -e "  [1] Copy to Clipboard  [2] Skip"
    echo -ne "  >> "
    read -r SHARE
    if [ "$SHARE" == "1" ]; then
        MSG="🔥 Just compressed $(format_size $SIZE) -> $(format_size $NEW_SIZE) with MDH_COMPRESSER! https://github.com/MDHojayfa/MDH_Compresser"
        copy_to_clipboard "$MSG"
        echo -e "  ${G}[✔] Copied!${NC}"
    fi
    echo -e "  ${P}💖 Support: bc1q24yndamzynl8afdmy52heclglk79ucu4jqn638${NC}"
fi
EOF

    # 4. EXTRACTOR ENGINE
    cat > "$INSTALL_DIR/lib/extractor.sh" << 'EOF'
#!/usr/bin/env bash
INSTALL_DIR="$HOME/.mdhcompresser"
source "$INSTALL_DIR/lib/utils.sh"
G='\033[0;32m'; C='\033[0;36m'; NC='\033[0m'; R='\033[0;31m'

echo -e "  ${C}[INPUT]${NC} Enter archive path:"
read -e -r FILE
[ ! -f "$FILE" ] && echo -e "${R}File not found${NC}" && exit 1

DIR="${FILE%.*}_extracted"
mkdir -p "$DIR"
echo -e "  ${G}[*]${NC} Extracting to $DIR..."

if [[ "$FILE" == *.zip ]]; then unzip "$FILE" -d "$DIR"
elif [[ "$FILE" == *.tar ]]; then tar xf "$FILE" -C "$DIR"
elif [[ "$FILE" == *.7z ]]; then 7z x "$FILE" -o"$DIR"
elif [[ "$FILE" == *.rar ]]; then 7z x "$FILE" -o"$DIR"
elif [[ "$FILE" == *.tar.gz ]]; then tar xzf "$FILE" -C "$DIR"
elif [[ "$FILE" == *.tar.xz ]]; then tar xJf "$FILE" -C "$DIR"
else 7z x "$FILE" -o"$DIR"; fi

echo -e "  ${G}✔ Done.${NC}"
EOF

    chmod +x "$INSTALL_DIR/lib/"*.sh
    echo -e "  ${NEON_G}[✔] Core Files Generated.${NC}"
}
# ══════════════════════════════════════════════════════════════════════════════════════
# 5. MAIN LAUNCHER & KEY SYSTEM
# ══════════════════════════════════════════════════════════════════════════════════════

create_launcher() {
    cat > "$BIN_DIR/$COMMAND_NAME" << 'EOF'
#!/usr/bin/env bash
INSTALL_DIR="$HOME/.mdhcompresser"
source "$INSTALL_DIR/lib/utils.sh"

# Colors
R='\033[0;31m'; G='\033[0;32m'; C='\033[0;36m'; Y='\033[1;33m'; P='\033[0;35m'; NC='\033[0m'
NEON_R='\033[38;5;196m'

# Ad Links Rotation
LINKS=("https://exe.io/KGhnFMQ" "https://linkvertise.com/2020139/42UOOrQBhJrw" "https://link-hub.net/2020139/42UOOrQBhJrw")
RAND_LINK=${LINKS[$RANDOM % ${#LINKS[@]}]}

get_daily_key() {
    # Generate simple daily hash based on date + salt
    local d=$(date +%Y%m%d)
    local raw="${d}MDHZONE2024SECRET"
    # Using md5sum if available, else a simple fallback
    if command -v md5sum >/dev/null; then
        echo "MDH-$(echo -n "$raw" | md5sum | cut -c1-8 | tr 'a-z' 'A-Z')"
    else
        # Fallback for systems without md5sum (rare)
        echo "MDH-KEY-${d}"
    fi
}

check_key() {
    # Check for internet
    if ! ping -c 1 google.com &>/dev/null; then return 2; fi # Offline
    
    local stored=""
    [ -f "$INSTALL_DIR/today.key" ] && stored=$(cat "$INSTALL_DIR/today.key")
    local expected=$(get_daily_key)
    
    if [ "$stored" == "$expected" ]; then return 0; fi
    return 1
}

show_key_prompt() {
    clear
    echo ""
    echo -e "  ${NEON_R}🔐 DAILY ACCESS KEY REQUIRED${NC}"
    echo -e "  To keep this tool free, please get today's key."
    echo ""
    echo -e "  ${Y}1. Visit:${NC} $RAND_LINK"
    echo -e "  ${Y}2. Enter Key below${NC}"
    echo ""
    echo -e "  [O] Open Link  [E] Enter Key  [Q] Quit"
    read -r choice
    if [[ "${choice,,}" == "o" ]]; then
        open_url "$RAND_LINK"
        echo -ne "  >> Enter Key: "
        read -r input
        if [ "$input" == "$(get_daily_key)" ]; then
            echo "$input" > "$INSTALL_DIR/today.key"
            echo -e "  ${G}✔ Access Granted${NC}"; sleep 1
        else
            echo -e "  ${R}✘ Invalid Key${NC}"; exit 1
        fi
    elif [[ "${choice,,}" == "e" ]]; then
        echo -ne "  >> Enter Key: "
        read -r input
        if [ "$input" == "$(get_daily_key)" ]; then
            echo "$input" > "$INSTALL_DIR/today.key"
            echo -e "  ${G}✔ Access Granted${NC}"; sleep 1
        else
            echo -e "  ${R}✘ Invalid Key${NC}"; exit 1
        fi
    else
        exit 0
    fi
}

main_menu() {
    clear
    echo ""
    echo -e "  ${C}MDH_COMPRESSER v3.0${NC}"
    echo -e "  ${P}1.${NC} Compressor"
    echo -e "  ${P}2.${NC} Extractor"
    echo -e "  ${P}3.${NC} Support / Donate"
    echo -e "  ${P}0.${NC} Exit"
    echo ""
    if [ "$OFFLINE" = "true" ]; then echo -e "  ${R}[!] Offline Mode (Restricted)${NC}"; fi
    echo -ne "  >> "
    read -r opt
    
    case $opt in
        1) bash "$INSTALL_DIR/lib/compressor.sh" ;;
        2) bash "$INSTALL_DIR/lib/extractor.sh" ;;
        3) 
           echo ""
           echo -e "  ${Y}BTC:${NC} bc1q24yndamzynl8afdmy52heclglk79ucu4jqn638"
           echo -e "  ${Y}SOL:${NC} 2hbHyZa4deyS12spqo14CPSKFH9dBGYYBLjjHN57x94P"
           echo -e "  ${Y}ETH:${NC} 0xcb99db7464669a52513fae435f7a59e18e8d89f1"
           echo ""
           read -p "  Press Enter..." 
           main_menu
           ;;
        0) exit ;;
        *) main_menu ;;
    esac
}

# STARTUP LOGIC
check_key
STATUS=$?

if [ $STATUS -eq 1 ]; then 
    show_key_prompt
elif [ $STATUS -eq 2 ]; then 
    export OFFLINE="true"
fi

main_menu
EOF

    chmod +x "$BIN_DIR/$COMMAND_NAME"
    
    # Path setup
    if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
        if [ -f "$HOME/.bashrc" ]; then echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"; fi
        if [ -f "$HOME/.zshrc" ]; then echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"; fi
    fi
}

# ══════════════════════════════════════════════════════════════════════════════════════
# MAIN INSTALLER LOGIC
# ══════════════════════════════════════════════════════════════════════════════════════

main() {
    boot_sequence
    install_dependencies
    create_dirs
    generate_files
    create_launcher
    
    echo ""
    echo -e "  ${NEON_G}🎉 INSTALLATION COMPLETE!${NC}"
    echo -e "  Run command: ${Y}${COMMAND_NAME}${NC}"
    echo ""
    echo -e "  Opening GitHub profile..."
    if command -v termux-open-url &>/dev/null; then termux-open-url "$GITHUB_PROFILE"; 
    elif command -v xdg-open &>/dev/null; then xdg-open "$GITHUB_PROFILE"; fi
}

main "$@"
