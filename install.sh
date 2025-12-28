#!/bin/bash
#===============================================================================
#
#    ███╗   ███╗██████╗ ██╗  ██╗     ██████╗ ██████╗ ███╗   ███╗██████╗ 
#    ████╗ ████║██╔══██╗██║  ██║    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗
#    ██╔████╔██║██║  ██║███████║    ██║     ██║   ██║██╔████╔██║██████╔╝
#    ██║╚██╔╝██║██║  ██║██╔══██║    ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ 
#    ██║ ╚═╝ ██║██████╔╝██║  ██║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     
#    ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     
#                                                                        
#    ██████╗ ███████╗███████╗███████╗███████╗██████╗                     
#    ██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔══██╗                    
#    ██████╔╝█████╗  ███████╗███████╗█████╗  ██████╔╝                    
#    ██╔══██╗██╔══╝  ╚════██║╚════██║██╔══╝  ██╔══██╗                    
#    ██║  ██║███████╗███████║███████║███████╗██║  ██║                    
#    ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝                    
#
#===============================================================================
#
#    MDH_COMPRESSER v6.0 STORM EDITION
#    The World's Most Powerful Compression Suite
#
#    Author:     MDHojayfa
#    Telegram:   @Urniggar
#    GitHub:     https://github.com/MDHojayfa/MDH_Compresser
#    Website:    https://mdhojayfa.github.io/
#
#    "We don't just compress files. We compress them to the theoretical limit."
#
#===============================================================================

set -e

#===============================================================================
# SECTION 1: GLOBAL VARIABLES & CONFIGURATION
#===============================================================================

VERSION="6.0"
EDITION="STORM EDITION"
AUTHOR="MDHojayfa"
TELEGRAM="@Urniggar"
GITHUB_REPO="https://github.com/MDHojayfa/MDH_Compresser"
GITHUB_README="https://github.com/MDHojayfa/MDH_Compresser#readme"
WEBSITE="https://mdhojayfa.github.io/"
KEY_PAGE="https://mdhojayfa.github.io/key.html"

# Installation directories
INSTALL_DIR="$HOME/.mdhcompresser"
LIB_DIR="$INSTALL_DIR/lib"
CONFIG_DIR="$INSTALL_DIR/config"
BIN_DIR="$HOME/.local/bin"
MAIN_BINARY="$BIN_DIR/mdhcompresser"

# Key system files
KEY_FILE="$INSTALL_DIR/today.key"
BYPASS_FILE="$INSTALL_DIR/bypass.key"
USER_ID_FILE="$INSTALL_DIR/user_id.txt"
STATS_FILE="$INSTALL_DIR/stats.json"

# Secret key salt (obfuscated)
_S1="MDH"
_S2="ZONE"
_S3="2024"
_S4="SECRET"

# Crypto wallets
BTC_WALLET="bc1q24yndamzynl8afdmy52heclglk79ucu4jqn638"
ETH_WALLET="0xcb99db7464669a52513fae435f7a59e18e8d89f1"
SOL_WALLET="2hbHyZa4deyS12spqo14CPSKFH9dBGYYBLjjHN57x94P"

# Ad links with distribution: Linkvertise 40%, Link-hub 40%, key.html 10%, homepage 10%
AD_LINKS=(
    "https://linkvertise.com/2020139/42UOOrQBhJrw"
    "https://linkvertise.com/2020139/42UOOrQBhJrw"
    "https://linkvertise.com/2020139/42UOOrQBhJrw"
    "https://linkvertise.com/2020139/42UOOrQBhJrw"
    "https://link-hub.net/2020139/42UOOrQBhJrw"
    "https://link-hub.net/2020139/42UOOrQBhJrw"
    "https://link-hub.net/2020139/42UOOrQBhJrw"
    "https://link-hub.net/2020139/42UOOrQBhJrw"
    "https://mdhojayfa.github.io/key.html"
    "https://mdhojayfa.github.io/"
)

#===============================================================================
# SECTION 2: COLOR DEFINITIONS & ESCAPE CODES
#===============================================================================

# Reset
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
REVERSE='\033[7m'
HIDDEN='\033[8m'

# Regular Colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Bold/Bright Colors
BBLACK='\033[1;30m'
BRED='\033[1;31m'
BGREEN='\033[1;32m'
BYELLOW='\033[1;33m'
BBLUE='\033[1;34m'
BPURPLE='\033[1;35m'
BCYAN='\033[1;36m'
BWHITE='\033[1;37m'

# High Intensity Colors (Neon)
NEON_GREEN='\033[1;92m'
NEON_RED='\033[1;91m'
NEON_YELLOW='\033[1;93m'
NEON_BLUE='\033[1;94m'
NEON_PURPLE='\033[1;95m'
NEON_CYAN='\033[1;96m'
NEON_WHITE='\033[1;97m'

# Background Colors
BG_BLACK='\033[40m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'
BG_PURPLE='\033[45m'
BG_CYAN='\033[46m'
BG_WHITE='\033[47m'

# Custom color aliases for MDH theme
PRIMARY="$NEON_GREEN"
SECONDARY="$NEON_PURPLE"
ACCENT="$NEON_CYAN"
DANGER="$NEON_RED"
WARNING="$NEON_YELLOW"
GOLD='\033[1;33m'
SHADOW="$DIM"

#===============================================================================
# SECTION 3: TERMINAL UTILITIES
#===============================================================================

# Get terminal dimensions
get_terminal_size() {
    TERM_COLS=$(tput cols 2>/dev/null || echo 80)
    TERM_ROWS=$(tput lines 2>/dev/null || echo 24)
}

# Move cursor
move_cursor() {
    echo -ne "\033[${1};${2}H"
}

# Clear screen
clear_screen() {
    echo -ne "\033[2J\033[H"
}

# Hide cursor
hide_cursor() {
    echo -ne "\033[?25l"
}

# Show cursor
show_cursor() {
    echo -ne "\033[?25h"
}

# Save cursor position
save_cursor() {
    echo -ne "\033[s"
}

# Restore cursor position
restore_cursor() {
    echo -ne "\033[u"
}

#===============================================================================
# SECTION 4: UI HELPER FUNCTIONS
#===============================================================================

# Center text on screen
center_text() {
    local text="$1"
    local text_len=${#text}
    local padding=$(( (TERM_COLS - text_len) / 2 ))
    printf "%*s%s\n" $padding "" "$text"
}

# Print colored centered text
print_center() {
    local color="$1"
    local text="$2"
    get_terminal_size
    local text_clean=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local text_len=${#text_clean}
    local padding=$(( (TERM_COLS - text_len) / 2 ))
    printf "%*s" $padding ""
    echo -e "${color}${text}${RESET}"
}

# Print with typewriter effect
typewriter() {
    local text="$1"
    local delay="${2:-0.03}"
    local color="${3:-$PRIMARY}"
    echo -ne "$color"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo -e "$RESET"
}

# Print with typewriter effect (centered)
typewriter_center() {
    local text="$1"
    local delay="${2:-0.03}"
    local color="${3:-$PRIMARY}"
    get_terminal_size
    local text_len=${#text}
    local padding=$(( (TERM_COLS - text_len) / 2 ))
    printf "%*s" $padding ""
    echo -ne "$color"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo -e "$RESET"
}

# Glitch text effect
glitch_text() {
    local text="$1"
    local iterations="${2:-5}"
    local glitch_chars='!@#$%^&*<>?/\|{}[]~`'
    
    for (( iter=0; iter<iterations; iter++ )); do
        local glitched=""
        for (( i=0; i<${#text}; i++ )); do
            if (( RANDOM % 3 == 0 )); then
                local idx=$(( RANDOM % ${#glitch_chars} ))
                glitched+="${glitch_chars:$idx:1}"
            else
                glitched+="${text:$i:1}"
            fi
        done
        
        local colors=("$NEON_GREEN" "$NEON_PURPLE" "$NEON_CYAN" "$NEON_RED")
        local color_idx=$(( RANDOM % 4 ))
        
        echo -ne "\r"
        printf "%*s" $(( (TERM_COLS - ${#text}) / 2 )) ""
        echo -ne "${colors[$color_idx]}${glitched}${RESET}"
        sleep 0.08
    done
    
    echo -ne "\r"
    printf "%*s" $(( (TERM_COLS - ${#text}) / 2 )) ""
    echo -e "${PRIMARY}${text}${RESET}"
}

# Print horizontal line
print_line() {
    local char="${1:-═}"
    local color="${2:-$PRIMARY}"
    get_terminal_size
    echo -ne "$color"
    printf '%*s\n' "$TERM_COLS" '' | tr ' ' "$char"
    echo -ne "$RESET"
}

# Print box
print_box() {
    local text="$1"
    local color="${2:-$PRIMARY}"
    local width="${3:-60}"
    local padding=$(( (width - ${#text} - 2) / 2 ))
    
    echo -e "${color}  ┌$(printf '─%.0s' $(seq 1 $width))┐${RESET}"
    echo -e "${color}  │$(printf ' %.0s' $(seq 1 $padding))${text}$(printf ' %.0s' $(seq 1 $((width - padding - ${#text}))))│${RESET}"
    echo -e "${color}  └$(printf '─%.0s' $(seq 1 $width))┘${RESET}"
}

# Print double-line box
print_double_box() {
    local title="$1"
    local color="${2:-$PRIMARY}"
    local width="${3:-60}"
    
    echo -e "${color}  ╔$(printf '═%.0s' $(seq 1 $width))╗${RESET}"
    if [[ -n "$title" ]]; then
        local padding=$(( (width - ${#title}) / 2 ))
        echo -e "${color}  ║$(printf ' %.0s' $(seq 1 $padding))${title}$(printf ' %.0s' $(seq 1 $((width - padding - ${#title}))))║${RESET}"
        echo -e "${color}  ╠$(printf '═%.0s' $(seq 1 $width))╣${RESET}"
    fi
}

print_double_box_line() {
    local text="$1"
    local color="${2:-$PRIMARY}"
    local width="${3:-60}"
    local text_clean=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local padding=$((width - ${#text_clean}))
    echo -e "${color}  ║${RESET} ${text}$(printf ' %.0s' $(seq 1 $padding))${color}║${RESET}"
}

print_double_box_end() {
    local color="${1:-$PRIMARY}"
    local width="${2:-60}"
    echo -e "${color}  ╚$(printf '═%.0s' $(seq 1 $width))╝${RESET}"
}

# Print shadow box (with ASCII shadow)
print_shadow_box() {
    local text="$1"
    local color="${2:-$PRIMARY}"
    local width="${3:-60}"
    local padding=$(( (width - ${#text} - 2) / 2 ))
    
    echo -e "${color}  ┌$(printf '─%.0s' $(seq 1 $width))┐${RESET}"
    echo -e "${color}  │$(printf ' %.0s' $(seq 1 $padding))${text}$(printf ' %.0s' $(seq 1 $((width - padding - ${#text}))))│${RESET}${DIM}░${RESET}"
    echo -e "${color}  └$(printf '─%.0s' $(seq 1 $width))┘${RESET}${DIM}░${RESET}"
    echo -e "${DIM}   $(printf '░%.0s' $(seq 1 $((width + 1))))${RESET}"
}

# Animated loading bar
loading_bar() {
    local duration="${1:-3}"
    local text="${2:-Loading}"
    local width=50
    local steps=$((duration * 10))
    local sleep_time=$(echo "scale=3; $duration / $steps" | bc 2>/dev/null || echo "0.05")
    
    echo -ne "  ${PRIMARY}${text} ${RESET}"
    echo -ne "${DIM}░░${RESET}"
    echo -ne "${PRIMARY}[${RESET}"
    
    for (( i=0; i<=steps; i++ )); do
        local progress=$((i * width / steps))
        local percent=$((i * 100 / steps))
        
        echo -ne "\r  ${PRIMARY}${text} ${RESET}"
        echo -ne "${DIM}░░${RESET}"
        echo -ne "${PRIMARY}[${RESET}"
        
        # Gradient color based on progress
        if (( percent < 33 )); then
            echo -ne "${NEON_GREEN}"
        elif (( percent < 66 )); then
            echo -ne "${NEON_YELLOW}"
        else
            echo -ne "${NEON_CYAN}"
        fi
        
        printf '█%.0s' $(seq 1 $progress)
        echo -ne "${DIM}"
        printf '░%.0s' $(seq 1 $((width - progress)))
        echo -ne "${RESET}"
        
        echo -ne "${PRIMARY}]${RESET}"
        echo -ne "${DIM}▓▓${RESET}"
        printf " %3d%%" $percent
        
        sleep "$sleep_time"
    done
    echo ""
}

# Multi-style loading bar
fancy_loading_bar() {
    local duration="${1:-2}"
    local text="${2:-Processing}"
    local style="${3:-1}"
    local width=40
    local steps=$((duration * 10))
    
    local bar_chars_1=('▏' '▎' '▍' '▌' '▋' '▊' '▉' '█')
    local bar_chars_2=('⣀' '⣄' '⣤' '⣦' '⣶' '⣷' '⣿')
    local bar_chars_3=('░' '▒' '▓' '█')
    
    for (( i=0; i<=steps; i++ )); do
        local progress=$((i * width / steps))
        local percent=$((i * 100 / steps))
        
        echo -ne "\r  ${ACCENT}${text}${RESET} "
        echo -ne "${PRIMARY}["
        
        for (( j=0; j<width; j++ )); do
            if (( j < progress )); then
                echo -ne "${NEON_CYAN}█"
            elif (( j == progress )); then
                local anim_idx=$(( (i * 2) % 8 ))
                echo -ne "${NEON_GREEN}${bar_chars_1[$anim_idx]}"
            else
                echo -ne "${DIM}░"
            fi
        done
        
        echo -ne "${PRIMARY}]${RESET} "
        printf "${NEON_YELLOW}%3d%%${RESET}" $percent
        
        sleep 0.05
    done
    echo -e " ${NEON_GREEN}✓${RESET}"
}

# Spinner animation
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    
    while kill -0 "$pid" 2>/dev/null; do
        for (( i=0; i<${#spinstr}; i++ )); do
            echo -ne "\r  ${PRIMARY}${spinstr:$i:1}${RESET} "
            sleep $delay
        done
    done
    echo -ne "\r  ${NEON_GREEN}✓${RESET} "
}

# Print success message
print_success() {
    echo -e "  ${NEON_GREEN}[✓]${RESET} $1"
}

# Print error message with GitHub reference
print_error() {
    echo -e "  ${NEON_RED}[✗]${RESET} $1"
    echo -e "  ${DIM}    For help, visit: ${ACCENT}${GITHUB_README}${RESET}"
}

# Print warning message
print_warning() {
    echo -e "  ${NEON_YELLOW}[!]${RESET} $1"
}

# Print info message
print_info() {
    echo -e "  ${NEON_CYAN}[*]${RESET} $1"
}

# Print step message
print_step() {
    echo -e "  ${NEON_PURPLE}[→]${RESET} $1"
}

#===============================================================================
# SECTION 5: ASCII ART LIBRARY
#===============================================================================

# Main MDH_COMPRESSER Logo
print_logo() {
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
}

# Compact logo for menus
print_logo_compact() {
    echo -e "${NEON_GREEN}"
    cat << 'EOF'
    ╔╦╗╔╦╗╦ ╦   ╔═╗╔═╗╔╦╗╔═╗╦═╗╔═╗╔═╗╔═╗╔═╗╦═╗
    ║║║ ║║╠═╣   ║  ║ ║║║║╠═╝╠╦╝║╣ ╚═╗╚═╗║╣ ╠╦╝
    ╩ ╩═╩╝╩ ╩   ╚═╝╚═╝╩ ╩╩  ╩╚═╚═╝╚═╝╚═╝╚═╝╩╚═
EOF
    echo -e "${RESET}"
}

# Skull ASCII art for warnings
print_skull() {
    echo -e "${NEON_RED}"
    cat << 'EOF'
                      ██████████████████                      
                  ████░░░░░░░░░░░░░░░░░░████                  
                ██░░░░░░░░░░░░░░░░░░░░░░░░░░██                
              ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██              
            ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██            
            ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██            
          ██░░░░░░████░░░░░░░░░░░░░░░░████░░░░░░░░██          
          ██░░░░██    ██░░░░░░░░░░░░██    ██░░░░░░██          
          ██░░░░██    ██░░░░░░░░░░░░██    ██░░░░░░██          
          ██░░░░░░████░░░░░░████░░░░░░████░░░░░░░░██          
            ██░░░░░░░░░░░░██    ██░░░░░░░░░░░░░░██            
            ██░░░░░░░░░░░░░░████░░░░░░░░░░░░░░░░██            
              ██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██              
              ██░░██░░██░░██░░██░░██░░██░░██░░██              
                ██░░██░░██░░██░░██░░██░░██░░██                
                  ████████████████████████████                  
EOF
    echo -e "${RESET}"
}

# Dragon ASCII art for legendary modes
print_dragon() {
    echo -e "${NEON_PURPLE}"
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
                                                 `.___,'   `googl.__googl.'
EOF
    echo -e "${RESET}"
}

# Small dragon for inline use
print_dragon_small() {
    echo -e "${NEON_PURPLE}"
    cat << 'EOF'
            ____ __
           { --.\  |          .)%%%)%%
            '-._\\ | (\___   %)%%(%%(%%%
                `\\|{/ ^ _)-%(%%%%)%%;%%%
            .'^^^^^^^  /`    %%)%%%%)%%%'
           //\   ) ,  /       '%%%%(googl.'
     ,googl-;__/googl googl.googl._googl_googl--._
EOF
    echo -e "${RESET}"
}

# Lightning bolt for storm animation
print_lightning() {
    echo -e "${NEON_YELLOW}"
    cat << 'EOF'
        ⚡    ██
           ████
          ██████
         ████
        ██████
       ████
      ██████████
         ████
        ████
       ████
      ██
EOF
    echo -e "${RESET}"
}

# Version badge
print_version_badge() {
    echo -e ""
    echo -e "${DIM}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${RESET}"
    echo -e "${DIM}░░${RESET} ${NEON_CYAN}╔═══════════════════════════════════════════════════════╗${RESET} ${DIM}░░${RESET}"
    echo -e "${DIM}░░${RESET} ${NEON_CYAN}║${RESET}  ${NEON_GREEN}v${VERSION}${RESET} ${NEON_PURPLE}${EDITION}${RESET}                ${NEON_CYAN}by ${GOLD}${AUTHOR}${RESET}  ${NEON_CYAN}║${RESET} ${DIM}░░${RESET}"
    echo -e "${DIM}░░${RESET} ${NEON_CYAN}╚═══════════════════════════════════════════════════════╝${RESET} ${DIM}░░${RESET}"
    echo -e "${DIM}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${RESET}"
}

#===============================================================================
# SECTION 6: STORM & CYCLONE ANIMATION
#===============================================================================

# Thunder storm with lightning animation
storm_animation() {
    local duration="${1:-4}"
    local end_time=$((SECONDS + duration))
    
    get_terminal_size
    hide_cursor
    clear_screen
    
    # Rain characters
    local rain_chars=('│' '┃' '║' '|' '¦' '┆' '┇' '┊' '┋')
    local heavy_rain=('█' '▓' '▒' '░')
    
    # Initialize rain drops
    declare -a drops_x
    declare -a drops_y
    declare -a drops_speed
    declare -a drops_char
    local num_drops=$((TERM_COLS / 2))
    
    for (( i=0; i<num_drops; i++ )); do
        drops_x[$i]=$((RANDOM % TERM_COLS))
        drops_y[$i]=$((RANDOM % TERM_ROWS))
        drops_speed[$i]=$((RANDOM % 3 + 1))
        drops_char[$i]=${rain_chars[$((RANDOM % ${#rain_chars[@]}))]}
    done
    
    local flash_counter=0
    local last_flash=0
    
    while (( SECONDS < end_time )); do
        # Random lightning flash
        if (( RANDOM % 15 == 0 )) && (( SECONDS - last_flash > 1 )); then
            # Flash screen white
            echo -ne "${BG_WHITE}"
            clear_screen
            sleep 0.05
            echo -ne "${RESET}"
            clear_screen
            
            # Draw lightning bolt
            local bolt_x=$((RANDOM % (TERM_COLS - 20) + 10))
            move_cursor 2 $bolt_x
            echo -e "${NEON_YELLOW}${BOLD}⚡${RESET}"
            move_cursor 3 $((bolt_x - 1))
            echo -e "${NEON_YELLOW}${BOLD}██${RESET}"
            move_cursor 4 $((bolt_x - 2))
            echo -e "${NEON_YELLOW}${BOLD}████${RESET}"
            move_cursor 5 $((bolt_x))
            echo -e "${NEON_YELLOW}${BOLD}███${RESET}"
            move_cursor 6 $((bolt_x + 1))
            echo -e "${NEON_YELLOW}${BOLD}████${RESET}"
            move_cursor 7 $((bolt_x + 2))
            echo -e "${NEON_YELLOW}${BOLD}██${RESET}"
            move_cursor 8 $((bolt_x + 3))
            echo -e "${NEON_YELLOW}${BOLD}█${RESET}"
            
            sleep 0.1
            last_flash=$SECONDS
            clear_screen
        fi
        
        # Draw rain
        for (( i=0; i<num_drops; i++ )); do
            # Clear old position
            move_cursor ${drops_y[$i]} ${drops_x[$i]}
            echo -n " "
            
            # Update position
            drops_y[$i]=$((drops_y[$i] + drops_speed[$i]))
            
            # Reset if off screen
            if (( drops_y[$i] >= TERM_ROWS )); then
                drops_y[$i]=1
                drops_x[$i]=$((RANDOM % TERM_COLS))
                drops_speed[$i]=$((RANDOM % 3 + 1))
            fi
            
            # Draw new position
            move_cursor ${drops_y[$i]} ${drops_x[$i]}
            
            # Color based on position (creates depth)
            if (( drops_speed[$i] == 3 )); then
                echo -ne "${NEON_CYAN}${drops_char[$i]}${RESET}"
            elif (( drops_speed[$i] == 2 )); then
                echo -ne "${CYAN}${drops_char[$i]}${RESET}"
            else
                echo -ne "${DIM}${CYAN}${drops_char[$i]}${RESET}"
            fi
        done
        
        # Add some wind effect (horizontal rain)
        for (( w=0; w<5; w++ )); do
            local wx=$((RANDOM % TERM_COLS))
            local wy=$((RANDOM % TERM_ROWS))
            move_cursor $wy $wx
            echo -ne "${DIM}${CYAN}─${RESET}"
        done
        
        sleep 0.03
    done
    
    # Final dramatic flash
    echo -ne "${BG_WHITE}"
    clear_screen
    sleep 0.1
    echo -ne "${RESET}"
    clear_screen
    
    show_cursor
}

# Cyclone/spiral animation
cyclone_animation() {
    local duration="${1:-3}"
    local end_time=$((SECONDS + duration))
    
    get_terminal_size
    hide_cursor
    clear_screen
    
    local center_x=$((TERM_COLS / 2))
    local center_y=$((TERM_ROWS / 2))
    local spiral_chars=('◐' '◓' '◑' '◒' '●' '○' '◉' '◎')
    local angle=0
    
    while (( SECONDS < end_time )); do
        clear_screen
        
        # Draw spiral arms
        for (( arm=0; arm<4; arm++ )); do
            local arm_angle=$((angle + arm * 90))
            
            for (( r=2; r<15; r++ )); do
                local rad_angle=$(echo "scale=4; ($arm_angle + $r * 20) * 3.14159 / 180" | bc 2>/dev/null || echo "0")
                local x=$(echo "scale=0; $center_x + $r * 2 * c($rad_angle)" | bc -l 2>/dev/null || echo "$center_x")
                local y=$(echo "scale=0; $center_y + $r * s($rad_angle)" | bc -l 2>/dev/null || echo "$center_y")
                
                x=${x%.*}
                y=${y%.*}
                
                if (( x > 0 && x < TERM_COLS && y > 0 && y < TERM_ROWS )); then
                    move_cursor $y $x
                    local char_idx=$(( (r + arm) % ${#spiral_chars[@]} ))
                    
                    if (( r < 5 )); then
                        echo -ne "${NEON_RED}${spiral_chars[$char_idx]}${RESET}"
                    elif (( r < 10 )); then
                        echo -ne "${NEON_PURPLE}${spiral_chars[$char_idx]}${RESET}"
                    else
                        echo -ne "${NEON_CYAN}${spiral_chars[$char_idx]}${RESET}"
                    fi
                fi
            done
        done
        
        # Draw eye of storm
        move_cursor $center_y $((center_x - 1))
        echo -ne "${NEON_GREEN}◉${RESET}"
        
        angle=$((angle + 15))
        sleep 0.05
    done
    
    show_cursor
    clear_screen
}

#===============================================================================
# SECTION 7: BOOT SEQUENCE & GAME INTRO
#===============================================================================

# BIOS-style system check
bios_check() {
    local checks=(
        "Initializing compression matrix"
        "Loading quantum algorithms"
        "Calibrating entropy analyzers"
        "Mounting virtual filesystems"
        "Syncing with MDH servers"
        "Preparing forbidden protocols"
        "Awakening the dragon"
        "Connecting to MDH_ZONE"
    )
    
    echo ""
    echo -e "  ${DIM}────────────────────────────────────────────────────${RESET}"
    echo -e "  ${NEON_GREEN}MDH_COMPRESSER BIOS v${VERSION}${RESET}"
    echo -e "  ${DIM}Copyright (C) 2024 MDHojayfa. All rights reserved.${RESET}"
    echo -e "  ${DIM}────────────────────────────────────────────────────${RESET}"
    echo ""
    
    for check in "${checks[@]}"; do
        echo -ne "  ${NEON_CYAN}[    ]${RESET} ${check}"
        
        # Animated dots
        for (( d=0; d<3; d++ )); do
            sleep 0.1
            echo -n "."
        done
        
        # Random delay for realism
        sleep $(echo "scale=2; $RANDOM % 30 / 100 + 0.1" | bc 2>/dev/null || echo "0.2")
        
        # Success indicator
        echo -ne "\r  ${NEON_GREEN}[ OK ]${RESET} ${check}..."
        echo ""
    done
    
    echo ""
    echo -e "  ${NEON_GREEN}All systems operational.${RESET}"
    echo -e "  ${DIM}────────────────────────────────────────────────────${RESET}"
    sleep 0.5
}

# Game-style intro with version
game_intro() {
    clear_screen
    get_terminal_size
    hide_cursor
    
    # Build up effect
    local logo_lines=(
        "███╗   ███╗██████╗ ██╗  ██╗"
        "████╗ ████║██╔══██╗██║  ██║"
        "██╔████╔██║██║  ██║███████║"
        "██║╚██╔╝██║██║  ██║██╔══██║"
        "██║ ╚═╝ ██║██████╔╝██║  ██║"
        "╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝"
    )
    
    local start_row=$(( (TERM_ROWS - 15) / 2 ))
    
    # Glitch in logo line by line
    for (( l=0; l<${#logo_lines[@]}; l++ )); do
        local line="${logo_lines[$l]}"
        move_cursor $((start_row + l)) $(( (TERM_COLS - 27) / 2 ))
        
        # Glitch effect for each line
        for (( g=0; g<3; g++ )); do
            local glitched=""
            local glitch_chars='!@#$%^&*<>?/\|{}[]~`░▒▓█'
            
            for (( i=0; i<${#line}; i++ )); do
                if (( RANDOM % 4 == 0 )); then
                    local idx=$(( RANDOM % ${#glitch_chars} ))
                    glitched+="${glitch_chars:$idx:1}"
                else
                    glitched+="${line:$i:1}"
                fi
            done
            
            local colors=("$NEON_GREEN" "$NEON_PURPLE" "$NEON_CYAN" "$NEON_RED")
            echo -ne "${colors[$((RANDOM % 4))]}${glitched}${RESET}"
            sleep 0.04
            move_cursor $((start_row + l)) $(( (TERM_COLS - 27) / 2 ))
        done
        
        echo -e "${NEON_GREEN}${line}${RESET}"
    done
    
    sleep 0.3
    
    # Version text fades in
    local version_text="v${VERSION} ${EDITION}"
    move_cursor $((start_row + 7)) $(( (TERM_COLS - ${#version_text}) / 2 ))
    
    for (( i=0; i<${#version_text}; i++ )); do
        echo -ne "${NEON_PURPLE}${version_text:$i:1}${RESET}"
        sleep 0.05
    done
    
    sleep 0.3
    
    # Tagline types out
    local tagline="The World's Most Powerful Compression Suite"
    move_cursor $((start_row + 9)) $(( (TERM_COLS - ${#tagline}) / 2 ))
    
    echo -ne "${DIM}"
    for (( i=0; i<${#tagline}; i++ )); do
        echo -n "${tagline:$i:1}"
        sleep 0.02
    done
    echo -e "${RESET}"
    
    sleep 0.5
    
    # Author credit
    local credit="by ${AUTHOR}"
    move_cursor $((start_row + 11)) $(( (TERM_COLS - ${#credit}) / 2 ))
    echo -e "${GOLD}${credit}${RESET}"
    
    sleep 1
    show_cursor
}

# Full boot sequence
boot_sequence() {
    clear_screen
    
    # Phase 1: Storm animation
    storm_animation 3
    
    # Phase 2: Game intro with glitch
    game_intro
    
    sleep 0.5
    clear_screen
    
    # Phase 3: BIOS checks
    bios_check
    
    sleep 0.5
    clear_screen
    
    # Phase 4: Loading bars
    echo ""
    print_logo_compact
    echo ""
    
    loading_bar 1 "Loading core modules"
    fancy_loading_bar 1 "Initializing compressors"
    loading_bar 1 "Preparing extraction engine"
    fancy_loading_bar 1 "Loading gamification"
    loading_bar 0.5 "Finalizing setup"
    
    echo ""
    print_success "All systems ready!"
    sleep 0.5
    
    clear_screen
}

# The plea message (MUST show every startup)
show_plea_message() {
    echo ""
    echo -e "${DIM}  ╭────────────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${DIM}  │${RESET}                                                                ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${NEON_CYAN}I've worked hard to keep MDH_COMPRESSER completely free.${RESET}      ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${NEON_CYAN}The daily key helps me earn a small amount to keep${RESET}            ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${NEON_CYAN}developing. Please don't try to crack or modify this system.${RESET} ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}                                                                ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${GOLD}If this project succeeds, I have bigger dreams I want to${RESET}     ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${GOLD}build for this community... all free.${RESET}                        ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}                                                                ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${NEON_GREEN}Thank you for understanding, warrior. 🐉${RESET}                    ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}                                            ${DIM}— ${GOLD}MDHojayfa${RESET}       ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}                                                                ${DIM}│${RESET}"
    echo -e "${DIM}  ╰────────────────────────────────────────────────────────────────╯${RESET}"
    echo ""
    sleep 3
}

#===============================================================================
# SECTION 8: QUOTES LIBRARY (42+ Quotes)
#===============================================================================

QUOTES=(
    "We don't just compress files. We compress them to the theoretical limit."
    "In the realm of bytes, the wise compress. The foolish bloat."
    "Every megabyte saved is a victory against chaos."
    "Compression is not just a technique. It's digital alchemy."
    "The strongest warriors know when to make things smaller."
    "Size doesn't matter. Compression ratio does."
    "In a world of bloated files, be the one who compresses."
    "True power lies not in expansion, but in compression."
    "A compressed file is a disciplined file."
    "The path to efficiency is paved with smaller bytes."
    "Compress today, save storage forever."
    "Where others see data, I see compression potential."
    "The forbidden zone awaits those brave enough to enter."
    "MDH_ZONE: Where files go to become legends."
    "Every byte compressed is a byte earned."
    "Patience in compression leads to excellence in ratio."
    "The journey of a terabyte begins with a single compress."
    "Fear not the large file, for MDH_COMPRESSER is with you."
    "In compression we trust."
    "Your files called. They want to be smaller."
    "Bloat is the enemy. Compression is the answer."
    "A true digital warrior masters the art of compression."
    "The best file is a compressed file."
    "When life gives you large files, compress them."
    "Entropy is just a challenge, not a limit."
    "The forbidden protocol exists for those who dare."
    "Small files, big dreams."
    "Compress like nobody's watching."
    "The compression gods smile upon you today."
    "May your ratios be high and your files be small."
    "In the land of storage, the compressor is king."
    "Every master was once a novice who kept compressing."
    "The art of compression is the art of efficiency."
    "Let your files breathe... in compressed form."
    "A compressor's work is never done."
    "Today's compression is tomorrow's freedom."
    "The zone between files and legends is called MDH."
    "Bits and bytes bow before the compressor."
    "Why store when you can compress?"
    "The secret to life: good compression ratios."
    "Digital warriors compress. Digital legends use MDH_ZONE."
    "Keep calm and compress on."
)

# Display a random quote
show_quote() {
    local quote="${QUOTES[$((RANDOM % ${#QUOTES[@]}))]}"
    echo ""
    echo -e "  ${DIM}\"${RESET}${ACCENT}${quote}${RESET}${DIM}\"${RESET}"
    echo -e "  ${DIM}                                        — ${GOLD}MDHojayfa${RESET}"
    echo ""
    sleep 5
}

# Display a specific quote
show_quote_index() {
    local idx="$1"
    local quote="${QUOTES[$idx]}"
    echo ""
    echo -e "  ${DIM}\"${RESET}${ACCENT}${quote}${RESET}${DIM}\"${RESET}"
    echo -e "  ${DIM}                                        — ${GOLD}MDHojayfa${RESET}"
    echo ""
}

#===============================================================================
# SECTION 9: SYSTEM DETECTION & DEPENDENCIES
#===============================================================================

# Detect operating system
detect_os() {
    OS_TYPE="unknown"
    PKG_MANAGER=""
    PKG_INSTALL=""
    PKG_UPDATE=""
    
    # Check for Termux first
    if [[ -d "/data/data/com.termux" ]]; then
        OS_TYPE="termux"
        PKG_MANAGER="pkg"
        PKG_INSTALL="pkg install -y"
        PKG_UPDATE="pkg update -y && pkg upgrade -y"
        return
    fi
    
    # Check for macOS
    if [[ "$(uname)" == "Darwin" ]]; then
        OS_TYPE="macos"
        PKG_MANAGER="brew"
        PKG_INSTALL="brew install"
        PKG_UPDATE="brew update"
        return
    fi
    
    # Check for WSL
    if grep -qi microsoft /proc/version 2>/dev/null; then
        OS_TYPE="wsl"
    fi
    
    # Detect Linux distribution
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        
        case "$ID" in
            debian|ubuntu|linuxmint|pop|elementary|kali|parrot|mx)
                OS_TYPE="${OS_TYPE:-debian}"
                PKG_MANAGER="apt"
                PKG_INSTALL="sudo apt install -y"
                PKG_UPDATE="sudo apt update"
                ;;
            arch|manjaro|endeavouros|garuda|artix)
                OS_TYPE="${OS_TYPE:-arch}"
                PKG_MANAGER="pacman"
                PKG_INSTALL="sudo pacman -S --noconfirm"
                PKG_UPDATE="sudo pacman -Sy"
                ;;
            fedora|rhel|centos|rocky|alma)
                OS_TYPE="${OS_TYPE:-fedora}"
                PKG_MANAGER="dnf"
                PKG_INSTALL="sudo dnf install -y"
                PKG_UPDATE="sudo dnf check-update || true"
                ;;
            opensuse*|sles)
                OS_TYPE="${OS_TYPE:-opensuse}"
                PKG_MANAGER="zypper"
                PKG_INSTALL="sudo zypper install -y"
                PKG_UPDATE="sudo zypper refresh"
                ;;
            alpine)
                OS_TYPE="${OS_TYPE:-alpine}"
                PKG_MANAGER="apk"
                PKG_INSTALL="sudo apk add"
                PKG_UPDATE="sudo apk update"
                ;;
            void)
                OS_TYPE="${OS_TYPE:-void}"
                PKG_MANAGER="xbps"
                PKG_INSTALL="sudo xbps-install -y"
                PKG_UPDATE="sudo xbps-install -S"
                ;;
        esac
    fi
    
    # Fallback detection
    if [[ -z "$PKG_MANAGER" ]]; then
        if command -v apt &>/dev/null; then
            PKG_MANAGER="apt"
            PKG_INSTALL="sudo apt install -y"
            PKG_UPDATE="sudo apt update"
        elif command -v pacman &>/dev/null; then
            PKG_MANAGER="pacman"
            PKG_INSTALL="sudo pacman -S --noconfirm"
            PKG_UPDATE="sudo pacman -Sy"
        elif command -v dnf &>/dev/null; then
            PKG_MANAGER="dnf"
            PKG_INSTALL="sudo dnf install -y"
            PKG_UPDATE="sudo dnf check-update || true"
        elif command -v yum &>/dev/null; then
            PKG_MANAGER="yum"
            PKG_INSTALL="sudo yum install -y"
            PKG_UPDATE="sudo yum check-update || true"
        elif command -v zypper &>/dev/null; then
            PKG_MANAGER="zypper"
            PKG_INSTALL="sudo zypper install -y"
            PKG_UPDATE="sudo zypper refresh"
        elif command -v apk &>/dev/null; then
            PKG_MANAGER="apk"
            PKG_INSTALL="sudo apk add"
            PKG_UPDATE="sudo apk update"
        fi
    fi
}

# Get package names for each OS
get_package_names() {
    case "$PKG_MANAGER" in
        pkg)  # Termux
            PKGS_7Z="p7zip"
            PKGS_XZ="xz-utils"
            PKGS_ZSTD="zstd"
            PKGS_LZ4="lz4"
            PKGS_LRZIP="lrzip"
            PKGS_BROTLI="brotli"
            PKGS_PV="pv"
            PKGS_BC="bc"
            PKGS_JQ="jq"
            PKGS_CURL="curl"
            PKGS_UNRAR="unrar"
            PKGS_CLIP=""
            ;;
        apt)  # Debian/Ubuntu
            PKGS_7Z="p7zip-full"
            PKGS_XZ="xz-utils"
            PKGS_ZSTD="zstd"
            PKGS_LZ4="lz4"
            PKGS_LRZIP="lrzip"
            PKGS_BROTLI="brotli"
            PKGS_PV="pv"
            PKGS_BC="bc"
            PKGS_JQ="jq"
            PKGS_CURL="curl"
            PKGS_UNRAR="unrar"
            PKGS_CLIP="xclip"
            ;;
        pacman)  # Arch
            PKGS_7Z="p7zip"
            PKGS_XZ="xz"
            PKGS_ZSTD="zstd"
            PKGS_LZ4="lz4"
            PKGS_LRZIP="lrzip"
            PKGS_BROTLI="brotli"
            PKGS_PV="pv"
            PKGS_BC="bc"
            PKGS_JQ="jq"
            PKGS_CURL="curl"
            PKGS_UNRAR="unrar"
            PKGS_CLIP="xclip"
            ;;
        dnf|yum)  # Fedora/RHEL
            PKGS_7Z="p7zip p7zip-plugins"
            PKGS_XZ="xz"
            PKGS_ZSTD="zstd"
            PKGS_LZ4="lz4"
            PKGS_LRZIP="lrzip"
            PKGS_BROTLI="brotli"
            PKGS_PV="pv"
            PKGS_BC="bc"
            PKGS_JQ="jq"
            PKGS_CURL="curl"
            PKGS_UNRAR="unrar"
            PKGS_CLIP="xclip"
            ;;
        brew)  # macOS
            PKGS_7Z="p7zip"
            PKGS_XZ="xz"
            PKGS_ZSTD="zstd"
            PKGS_LZ4="lz4"
            PKGS_LRZIP="lrzip"
            PKGS_BROTLI="brotli"
            PKGS_PV="pv"
            PKGS_BC="bc"
            PKGS_JQ="jq"
            PKGS_CURL="curl"
            PKGS_UNRAR="unrar"
            PKGS_CLIP=""
            ;;
        zypper)  # openSUSE
            PKGS_7Z="p7zip-full"
            PKGS_XZ="xz"
            PKGS_ZSTD="zstd"
            PKGS_LZ4="lz4"
            PKGS_LRZIP="lrzip"
            PKGS_BROTLI="brotli"
            PKGS_PV="pv"
            PKGS_BC="bc"
            PKGS_JQ="jq"
            PKGS_CURL="curl"
            PKGS_UNRAR="unrar"
            PKGS_CLIP="xclip"
            ;;
        apk)  # Alpine
            PKGS_7Z="p7zip"
            PKGS_XZ="xz"
            PKGS_ZSTD="zstd"
            PKGS_LZ4="lz4"
            PKGS_LRZIP=""
            PKGS_BROTLI="brotli"
            PKGS_PV="pv"
            PKGS_BC="bc"
            PKGS_JQ="jq"
            PKGS_CURL="curl"
            PKGS_UNRAR="unrar"
            PKGS_CLIP="xclip"
            ;;
        *)
            print_error "Unsupported package manager!"
            exit 1
            ;;
    esac
}

# Install dependencies
install_dependencies() {
    echo ""
    print_double_box "INSTALLING DEPENDENCIES" "$NEON_CYAN" 60
    echo ""
    
    print_info "Detected OS: ${NEON_GREEN}${OS_TYPE}${RESET}"
    print_info "Package Manager: ${NEON_GREEN}${PKG_MANAGER}${RESET}"
    echo ""
    
    # Update package lists
    print_step "Updating package lists..."
    
    if [[ "$OS_TYPE" == "termux" ]]; then
        # Termux needs special handling - visible and non-interactive
        pkg update -y
        pkg upgrade -y --force-confnew
    else
        eval "$PKG_UPDATE" >/dev/null 2>&1 || true
    fi
    
    print_success "Package lists updated"
    
    # Get package names for this OS
    get_package_names
    
    # Install each dependency
    local deps=(
        "$PKGS_7Z:7z:7-Zip compression"
        "$PKGS_XZ:xz:XZ compression"
        "$PKGS_ZSTD:zstd:Zstandard compression"
        "$PKGS_LZ4:lz4:LZ4 compression"
        "$PKGS_BROTLI:brotli:Brotli compression"
        "$PKGS_PV:pv:Progress viewer"
        "$PKGS_BC:bc:Calculator"
        "$PKGS_JQ:jq:JSON processor"
        "$PKGS_CURL:curl:Network requests"
    )
    
    for dep in "${deps[@]}"; do
        local pkg="${dep%%:*}"
        local rest="${dep#*:}"
        local cmd="${rest%%:*}"
        local desc="${rest#*:}"
        
        if [[ -z "$pkg" ]]; then
            continue
        fi
        
        if ! command -v "$cmd" &>/dev/null; then
            print_step "Installing ${desc}..."
            if eval "$PKG_INSTALL $pkg" >/dev/null 2>&1; then
                print_success "${desc} installed"
            else
                print_warning "${desc} installation failed (may not be available)"
            fi
        else
            print_success "${desc} already installed"
        fi
    done
    
    # Try to install lrzip (optional, for LEGENDARY mode)
    if [[ -n "$PKGS_LRZIP" ]] && ! command -v lrzip &>/dev/null; then
        print_step "Installing LRZIP (optional)..."
        if eval "$PKG_INSTALL $PKGS_LRZIP" >/dev/null 2>&1; then
            print_success "LRZIP installed"
        else
            print_warning "LRZIP not available (LEGENDARY mode will use fallback)"
        fi
    fi
    
    # Try to install unrar (optional)
    if ! command -v unrar &>/dev/null; then
        print_step "Installing UnRAR (optional)..."
        if eval "$PKG_INSTALL $PKGS_UNRAR" >/dev/null 2>&1; then
            print_success "UnRAR installed"
        else
            print_warning "UnRAR not available (RAR extraction limited)"
        fi
    fi
    
    # Try to install clipboard tool (optional)
    if [[ -n "$PKGS_CLIP" ]] && ! command -v xclip &>/dev/null && ! command -v xsel &>/dev/null; then
        print_step "Installing clipboard support (optional)..."
        eval "$PKG_INSTALL $PKGS_CLIP" >/dev/null 2>&1 || true
    fi
    
    echo ""
    print_success "All dependencies processed!"
    echo ""
}

#===============================================================================
# SECTION 10: KEY SYSTEM & VALIDATION
#===============================================================================

# Generate today's key (HYBRID MD5 DOUBLE-HASH)
generate_today_key() {
    # Get UTC date
    local date=$(date -u +"%Y-%m-%d")
    
    # Reconstruct salt from obfuscated pieces
    local salt="${_S1}${_S2}${_S3}${_S4}"
    
    # Layer 1: Primary hash
    local hash1=$(echo -n "${date}${salt}" | md5sum | cut -d' ' -f1)
    
    # Layer 2: Secondary hash (hybrid layer)
    local date_clean=$(echo "$date" | tr -d '-')
    local hash2=$(echo -n "${hash1:0:8}${date_clean}" | md5sum | cut -d' ' -f1)
    
    # Layer 3: Combine and format
    local raw="${hash1:0:8}${hash2:0:8}"
    echo "MDH-${raw:0:4}-${raw:4:4}-${raw:8:4}" | tr '[:lower:]' '[:upper:]'
}

# Get random ad link based on distribution
get_ad_link() {
    local idx=$((RANDOM % ${#AD_LINKS[@]}))
    echo "${AD_LINKS[$idx]}"
}

# Check if key is valid for today
is_key_valid() {
    local user_key="$1"
    local expected_key=$(generate_today_key)
    
    # Convert both to uppercase for comparison
    user_key=$(echo "$user_key" | tr '[:lower:]' '[:upper:]')
    
    [[ "$user_key" == "$expected_key" ]]
}

# Check for bypass key
check_bypass_key() {
    if [[ -f "$BYPASS_FILE" ]]; then
        local bypass_data=$(cat "$BYPASS_FILE" 2>/dev/null)
        local bypass_key=$(echo "$bypass_data" | cut -d'|' -f1)
        local expiry_date=$(echo "$bypass_data" | cut -d'|' -f2)
        
        # Check if bypass key is valid format
        if [[ "$bypass_key" =~ ^MDH-BYPASS- ]]; then
            # Check if expired
            local today=$(date -u +"%Y%m%d")
            if [[ "$expiry_date" -ge "$today" ]]; then
                return 0  # Valid bypass
            fi
        fi
    fi
    return 1  # No valid bypass
}

# Check cached key
check_cached_key() {
    if [[ -f "$KEY_FILE" ]]; then
        local cached_key=$(cat "$KEY_FILE" 2>/dev/null)
        local cached_date=$(echo "$cached_key" | cut -d'|' -f1)
        local cached_value=$(echo "$cached_key" | cut -d'|' -f2)
        
        local today=$(date -u +"%Y-%m-%d")
        
        if [[ "$cached_date" == "$today" ]]; then
            if is_key_valid "$cached_value"; then
                return 0  # Valid cached key
            fi
        fi
    fi
    return 1  # No valid cached key
}

# Cache valid key
cache_key() {
    local key="$1"
    local today=$(date -u +"%Y-%m-%d")
    echo "${today}|${key}" > "$KEY_FILE"
}

# Open browser with ad link
open_browser() {
    local url="$1"
    
    if [[ "$OS_TYPE" == "termux" ]]; then
        termux-open-url "$url" 2>/dev/null || am start -a android.intent.action.VIEW -d "$url" 2>/dev/null || xdg-open "$url" 2>/dev/null
    elif [[ "$OS_TYPE" == "macos" ]]; then
        open "$url" 2>/dev/null
    elif [[ "$OS_TYPE" == "wsl" ]]; then
        cmd.exe /c start "" "$url" 2>/dev/null || explorer.exe "$url" 2>/dev/null
    else
        xdg-open "$url" 2>/dev/null || sensible-browser "$url" 2>/dev/null || x-www-browser "$url" 2>/dev/null || gnome-open "$url" 2>/dev/null
    fi
}

# Key verification prompt
verify_key() {
    local mode_requires_key="$1"
    
    # Check bypass first
    if check_bypass_key; then
        print_success "Bypass key active! Full access granted."
        return 0
    fi
    
    # Check cached key
    if check_cached_key; then
        return 0
    fi
    
    # If mode doesn't require key (modes 1-3), allow
    if [[ "$mode_requires_key" != "true" ]]; then
        return 0
    fi
    
    echo ""
    print_shadow_box "🔑 DAILY KEY REQUIRED" "$NEON_YELLOW" 60
    echo ""
    
    echo -e "  ${NEON_CYAN}Get your free daily key at:${RESET}"
    
    local ad_link=$(get_ad_link)
    echo -e "  ${NEON_GREEN}${ad_link}${RESET}"
    echo ""
    
    echo -ne "  ${DIM}Press Enter to open in browser...${RESET}"
    read
    
    open_browser "$ad_link"
    
    echo ""
    print_info "Complete the short verification, then enter your key below."
    echo ""
    
    local attempts=3
    while (( attempts > 0 )); do
        echo -ne "  ${NEON_CYAN}Enter your key (${attempts} attempts remaining): ${RESET}"
        read -r user_key
        
        if is_key_valid "$user_key"; then
            cache_key "$user_key"
            echo ""
            print_success "Key verified! Full access granted."
            echo ""
            sleep 1
            return 0
        else
            attempts=$((attempts - 1))
            if (( attempts > 0 )); then
                echo -e "  ${NEON_RED}[✗] Invalid key. Please try again.${RESET}"
            fi
        fi
    done
    
    echo ""
    print_error "Maximum attempts exceeded."
    echo -e "  ${DIM}You can still use basic modes (1-3) without a key.${RESET}"
    echo ""
    return 1
}

# Check internet connection
check_internet() {
    if ping -c 1 -W 2 8.8.8.8 &>/dev/null || ping -c 1 -W 2 1.1.1.1 &>/dev/null; then
        return 0
    fi
    return 1
}

# Offline mode warning
show_offline_warning() {
    echo ""
    print_shadow_box "⚠️  OFFLINE MODE" "$NEON_YELLOW" 60
    echo ""
    echo -e "  ${NEON_YELLOW}No internet connection detected.${RESET}"
    echo -e "  ${DIM}Only basic modes (1-3) are available in offline mode.${RESET}"
    echo -e "  ${DIM}Advanced modes require online key verification.${RESET}"
    echo ""
}

#===============================================================================
# SECTION 11: LIVE STATS & DISPLAY
#===============================================================================

# Get current RAM usage
get_ram_usage() {
    if [[ "$OS_TYPE" == "macos" ]]; then
        # macOS
        local total=$(sysctl -n hw.memsize 2>/dev/null)
        local used=$(vm_stat 2>/dev/null | awk '/Pages active/ {print $3}' | tr -d '.')
        local page_size=$(vm_stat 2>/dev/null | awk '/page size/ {print $8}')
        
        total=$((total / 1024 / 1024))
        used=$((used * page_size / 1024 / 1024))
    else
        # Linux/Termux
        local mem_info=$(cat /proc/meminfo 2>/dev/null)
        local total=$(echo "$mem_info" | awk '/MemTotal/ {print $2}')
        local available=$(echo "$mem_info" | awk '/MemAvailable/ {print $2}')
        
        total=$((total / 1024))
        local used=$((total - available / 1024))
    fi
    
    local percent=$((used * 100 / total))
    echo "${used}|${total}|${percent}"
}

# Get disk free space
get_disk_free() {
    local path="${1:-$HOME}"
    local free=$(df -BM "$path" 2>/dev/null | awk 'NR==2 {print $4}' | tr -d 'M')
    echo "$free"
}

# Get live clock
get_clock() {
    date +"%H:%M:%S"
}

# Display live stats bar
show_stats_bar() {
    local ram_data=$(get_ram_usage)
    local ram_used=$(echo "$ram_data" | cut -d'|' -f1)
    local ram_total=$(echo "$ram_data" | cut -d'|' -f2)
    local ram_percent=$(echo "$ram_data" | cut -d'|' -f3)
    
    local disk_free=$(get_disk_free)
    local clock=$(get_clock)
    
    # Color based on RAM usage
    local ram_color="$NEON_GREEN"
    if (( ram_percent > 85 )); then
        ram_color="$NEON_RED"
    elif (( ram_percent > 60 )); then
        ram_color="$NEON_YELLOW"
    fi
    
    echo -e "${DIM}┌─────────────────────────────────────────────────────────────────┐${RESET}"
    echo -e "${DIM}│${RESET} ${NEON_CYAN}🕐 ${clock}${RESET} ${DIM}│${RESET} ${ram_color}💾 RAM: ${ram_used}MB/${ram_total}MB (${ram_percent}%)${RESET} ${DIM}│${RESET} ${NEON_GREEN}💿 Free: ${disk_free}MB${RESET} ${DIM}│${RESET}"
    echo -e "${DIM}└─────────────────────────────────────────────────────────────────┘${RESET}"
}

# Format file size
format_size() {
    local bytes="$1"
    
    if (( bytes >= 1073741824 )); then
        echo "$(echo "scale=2; $bytes / 1073741824" | bc) GB"
    elif (( bytes >= 1048576 )); then
        echo "$(echo "scale=2; $bytes / 1048576" | bc) MB"
    elif (( bytes >= 1024 )); then
        echo "$(echo "scale=2; $bytes / 1024" | bc) KB"
    else
        echo "$bytes B"
    fi
}

# Get file/folder size in bytes
get_size_bytes() {
    local path="$1"
    if [[ -d "$path" ]]; then
        du -sb "$path" 2>/dev/null | cut -f1
    else
        stat -c%s "$path" 2>/dev/null || stat -f%z "$path" 2>/dev/null
    fi
}

# Format time duration
format_time() {
    local seconds="$1"
    
    if (( seconds >= 3600 )); then
        printf "%dh %dm %ds" $((seconds/3600)) $((seconds%3600/60)) $((seconds%60))
    elif (( seconds >= 60 )); then
        printf "%dm %ds" $((seconds/60)) $((seconds%60))
    else
        printf "%ds" $seconds
    fi
}

#===============================================================================
# SECTION 12: FILE PATH UTILITIES
#===============================================================================

# Smart path resolution
resolve_path() {
    local input="$1"
    
    # If absolute path, use as-is
    if [[ "$input" == /* ]]; then
        echo "$input"
        return
    fi
    
    # Check current directory
    if [[ -e "./$input" ]]; then
        echo "$(pwd)/$input"
        return
    fi
    
    # Check home directory
    if [[ -e "$HOME/$input" ]]; then
        echo "$HOME/$input"
        return
    fi
    
    # Check ~/Downloads
    if [[ -e "$HOME/Downloads/$input" ]]; then
        echo "$HOME/Downloads/$input"
        return
    fi
    
    # Check /sdcard (Termux)
    if [[ "$OS_TYPE" == "termux" ]]; then
        if [[ -e "/sdcard/$input" ]]; then
            echo "/sdcard/$input"
            return
        fi
        if [[ -e "/sdcard/Download/$input" ]]; then
            echo "/sdcard/Download/$input"
            return
        fi
    fi
    
    # Return as-is (may not exist)
    echo "$input"
}

# Read path with autocomplete
read_path() {
    local prompt="$1"
    local var_name="$2"
    
    echo -ne "  ${NEON_CYAN}${prompt}: ${RESET}"
    read -e -r input_path
    
    # Resolve the path
    local resolved=$(resolve_path "$input_path")
    
    eval "$var_name='$resolved'"
}

# Validate file exists
validate_file() {
    local path="$1"
    
    if [[ ! -e "$path" ]]; then
        print_error "File or folder not found: $path"
        return 1
    fi
    return 0
}

# Get output path with options
select_output_path() {
    local input_path="$1"
    local extension="$2"
    local default_name
    
    # Generate default output name
    if [[ -d "$input_path" ]]; then
        default_name="$(basename "$input_path")${extension}"
    else
        default_name="$(basename "$input_path" | sed 's/\.[^.]*$//')${extension}"
    fi
    
    local input_dir=$(dirname "$input_path")
    
    echo ""
    echo -e "  ${NEON_CYAN}Where to save compressed file?${RESET}"
    echo -e "  ${DIM}[1]${RESET} Same folder as input ${DIM}(${input_dir}/${default_name})${RESET}"
    echo -e "  ${DIM}[2]${RESET} Current directory ${DIM}($(pwd)/${default_name})${RESET}"
    echo -e "  ${DIM}[3]${RESET} Custom path"
    echo ""
    echo -ne "  ${NEON_CYAN}Choice [1]: ${RESET}"
    read -r choice
    
    case "$choice" in
        2)
            echo "$(pwd)/${default_name}"
            ;;
        3)
            echo -ne "  ${NEON_CYAN}Enter custom path: ${RESET}"
            read -e -r custom_path
            
            if [[ -d "$custom_path" ]]; then
                echo "${custom_path}/${default_name}"
            else
                echo "$custom_path"
            fi
            ;;
        *)
            echo "${input_dir}/${default_name}"
            ;;
    esac
}

#===============================================================================
# SECTION 13: COMPRESSION ENGINE (9 MODES)
#===============================================================================

# Pre-compression analysis
analyze_file() {
    local path="$1"
    local size_bytes=$(get_size_bytes "$path")
    local size_human=$(format_size "$size_bytes")
    local file_type
    
    if [[ -d "$path" ]]; then
        file_type="Directory"
        local file_count=$(find "$path" -type f 2>/dev/null | wc -l)
        echo ""
        print_double_box "📁 FILE ANALYSIS" "$NEON_CYAN" 60
        print_double_box_line "Path: $(basename "$path")" "$NEON_CYAN" 60
        print_double_box_line "Type: ${file_type}" "$NEON_CYAN" 60
        print_double_box_line "Files: ${file_count}" "$NEON_CYAN" 60
        print_double_box_line "Total Size: ${size_human}" "$NEON_CYAN" 60
        print_double_box_end "$NEON_CYAN" 60
    else
        file_type=$(file -b "$path" 2>/dev/null | cut -c1-40)
        echo ""
        print_double_box "📄 FILE ANALYSIS" "$NEON_CYAN" 60
        print_double_box_line "Name: $(basename "$path")" "$NEON_CYAN" 60
        print_double_box_line "Type: ${file_type}" "$NEON_CYAN" 60
        print_double_box_line "Size: ${size_human}" "$NEON_CYAN" 60
        print_double_box_end "$NEON_CYAN" 60
    fi
    
    echo ""
    echo "$size_bytes"
}

# Show compression mode menu
show_compression_menu() {
    clear_screen
    echo ""
    print_logo_compact
    echo ""
    show_stats_bar
    echo ""
    
    print_double_box "🗜️  COMPRESSION MODES" "$NEON_GREEN" 60
    echo ""
    
    echo -e "  ${DIM}FREE MODES (No Key Required):${RESET}"
    echo -e "  ${NEON_GREEN}[1]${RESET} ⚡ ${NEON_CYAN}FLASH${RESET}         ${DIM}│${RESET} Instant speed, basic ratio"
    echo -e "  ${NEON_GREEN}[2]${RESET} 🌸 ${NEON_CYAN}LITTLE FLOWER${RESET}  ${DIM}│${RESET} Fast speed, decent ratio"
    echo -e "  ${NEON_GREEN}[3]${RESET} 🍜 ${NEON_CYAN}ASIAN${RESET}         ${DIM}│${RESET} Balanced, daily use"
    echo ""
    
    echo -e "  ${DIM}PRO MODES (Key Required):${RESET}"
    echo -e "  ${NEON_YELLOW}[4]${RESET} 🍺 ${NEON_YELLOW}TASTY DRUNK${RESET}   ${DIM}│${RESET} Better ratio, slower"
    echo -e "  ${NEON_YELLOW}[5]${RESET} 🦁 ${NEON_YELLOW}BEAST${RESET}         ${DIM}│${RESET} Aggressive compression"
    echo -e "  ${NEON_YELLOW}[6]${RESET} 👑 ${NEON_YELLOW}GODLY${RESET}         ${DIM}│${RESET} High memory, very compact"
    echo -e "  ${NEON_PURPLE}[7]${RESET} 🐉 ${NEON_PURPLE}LEGENDARY${RESET}     ${DIM}│${RESET} Extreme archiving"
    echo -e "  ${NEON_PURPLE}[8]${RESET} 💀 ${NEON_PURPLE}MYTHIC${RESET}        ${DIM}│${RESET} Multi-pass pipeline"
    echo ""
    
    echo -e "  ${DIM}FORBIDDEN PROTOCOL:${RESET}"
    echo -e "  ${NEON_RED}[9]${RESET} ☠️  ${NEON_RED}MDH_ZONE${RESET}      ${DIM}│${RESET} ${BLINK}THEORETICAL LIMIT${RESET}"
    echo ""
    
    echo -e "  ${DIM}[0] Back to Main Menu${RESET}"
    echo ""
}

# Mode 1: FLASH (LZ4)
compress_flash() {
    local input="$1"
    local output="$2"
    
    print_shadow_box "⚡ FLASH MODE" "$NEON_GREEN" 60
    echo ""
    print_info "Algorithm: LZ4 (Fastest)"
    echo ""
    
    if [[ -d "$input" ]]; then
        tar -C "$(dirname "$input")" -cf - "$(basename "$input")" | pv -N "Compressing" | lz4 -1 -f > "$output"
    else
        pv "$input" | lz4 -1 -f > "$output"
    fi
}

# Mode 2: LITTLE FLOWER (Zstd)
compress_flower() {
    local input="$1"
    local output="$2"
    
    print_shadow_box "🌸 LITTLE FLOWER MODE" "$NEON_PURPLE" 60
    echo ""
    print_info "Algorithm: Zstandard (Level 3)"
    echo ""
    
    if [[ -d "$input" ]]; then
        tar -C "$(dirname "$input")" -cf - "$(basename "$input")" | pv -N "Compressing" | zstd -3 -f -o "$output"
    else
        pv "$input" | zstd -3 -f -o "$output"
    fi
}

# Mode 3: ASIAN (7z Balanced)
compress_asian() {
    local input="$1"
    local output="$2"
    
    print_shadow_box "🍜 ASIAN MODE" "$NEON_CYAN" 60
    echo ""
    print_info "Algorithm: 7-Zip (Balanced)"
    echo ""
    
    local temp_tar=""
    if [[ -d "$input" ]]; then
        temp_tar="/tmp/mdh_asian_$$.tar"
        tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")"
        7z a -mx=5 -mfb=64 -md=32m -bsp1 "$output" "$temp_tar"
        rm -f "$temp_tar"
    else
        7z a -mx=5 -mfb=64 -md=32m -bsp1 "$output" "$input"
    fi
}

# Mode 4: TASTY DRUNK (7z High)
compress_drunk() {
    local input="$1"
    local output="$2"
    
    print_shadow_box "🍺 TASTY DRUNK MODE" "$NEON_YELLOW" 60
    echo ""
    print_info "Algorithm: 7-Zip (High)"
    echo ""
    
    local temp_tar=""
    if [[ -d "$input" ]]; then
        temp_tar="/tmp/mdh_drunk_$$.tar"
        tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")"
        7z a -mx=7 -mfb=128 -md=64m -bsp1 "$output" "$temp_tar"
        rm -f "$temp_tar"
    else
        7z a -mx=7 -mfb=128 -md=64m -bsp1 "$output" "$input"
    fi
}

# Mode 5: BEAST (7z Ultra)
compress_beast() {
    local input="$1"
    local output="$2"
    
    print_shadow_box "🦁 BEAST MODE" "$NEON_YELLOW" 60
    echo ""
    print_info "Algorithm: 7-Zip (Ultra + Solid)"
    echo ""
    
    local temp_tar=""
    if [[ -d "$input" ]]; then
        temp_tar="/tmp/mdh_beast_$$.tar"
        tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")"
        7z a -mx=9 -mfb=256 -md=128m -ms=on -bsp1 "$output" "$temp_tar"
        rm -f "$temp_tar"
    else
        7z a -mx=9 -mfb=256 -md=128m -ms=on -bsp1 "$output" "$input"
    fi
}

# Mode 6: GODLY (XZ Extreme)
compress_godly() {
    local input="$1"
    local output="$2"
    
    print_shadow_box "👑 GODLY MODE" "$GOLD" 60
    echo ""
    print_info "Algorithm: XZ (Extreme)"
    print_warning "High memory usage!"
    echo ""
    
    if [[ -d "$input" ]]; then
        tar -C "$(dirname "$input")" -cf - "$(basename "$input")" | pv -N "Compressing" | xz -9 -e -c > "$output"
    else
        pv "$input" | xz -9 -e -c > "$output"
    fi
}

# Mode 7: LEGENDARY (LRZIP ZPAQ or fallback)
compress_legendary() {
    local input="$1"
    local output="$2"
    
    print_shadow_box "🐉 LEGENDARY MODE" "$NEON_PURPLE" 60
    print_dragon_small
    echo ""
    
    if command -v lrzip &>/dev/null; then
        print_info "Algorithm: LRZIP (ZPAQ Method)"
        echo ""
        
        local temp_tar=""
        if [[ -d "$input" ]]; then
            temp_tar="/tmp/mdh_legendary_$$.tar"
            tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")"
            lrzip -z -L 9 -p $(nproc 2>/dev/null || echo 4) "$temp_tar" -o "$output"
            rm -f "$temp_tar"
        else
            lrzip -z -L 9 -p $(nproc 2>/dev/null || echo 4) "$input" -o "$output"
        fi
    else
        print_warning "LRZIP not available, using XZ fallback"
        print_info "Algorithm: XZ (Extreme with memlimit)"
        echo ""
        
        if [[ -d "$input" ]]; then
            tar -C "$(dirname "$input")" -cf - "$(basename "$input")" | pv -N "Compressing" | xz -9 -e --memlimit=50% -c > "$output"
        else
            pv "$input" | xz -9 -e --memlimit=50% -c > "$output"
        fi
    fi
}

# Mode 8: MYTHIC (Multi-pass)
compress_mythic() {
    local input="$1"
    local output="$2"
    
    print_shadow_box "💀 MYTHIC MODE" "$NEON_RED" 60
    print_skull
    echo ""
    print_info "Multi-pass compression pipeline..."
    print_warning "This may take a while!"
    echo ""
    
    local temp_base="/tmp/mdh_mythic_$$"
    local temp_tar="${temp_base}.tar"
    local temp_zst="${temp_base}.zst"
    
    # Pass 1: Create tar and compress with zstd
    print_step "Pass 1: Initial compression..."
    if [[ -d "$input" ]]; then
        tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")"
    else
        tar -cf "$temp_tar" -C "$(dirname "$input")" "$(basename "$input")"
    fi
    
    pv "$temp_tar" | zstd -19 -f -o "$temp_zst"
    rm -f "$temp_tar"
    
    # Pass 2: XZ compression on top
    print_step "Pass 2: Secondary compression..."
    pv "$temp_zst" | xz -9 -e -c > "$output"
    rm -f "$temp_zst"
    
    print_success "Multi-pass compression complete!"
}

# Mode 9: MDH_ZONE (FORBIDDEN PROTOCOL)
compress_mdhzone() {
    local input="$1"
    local output="$2"
    
    clear_screen
    print_skull
    echo ""
    print_center "$NEON_RED" "☠️  WARNING: FORBIDDEN PROTOCOL ☠️"
    echo ""
    print_center "$NEON_RED" "═══════════════════════════════════════"
    echo ""
    
    echo -e "  ${NEON_RED}You are about to enter the ${BLINK}MDH_ZONE${RESET}${NEON_RED}.${RESET}"
    echo ""
    echo -e "  ${NEON_YELLOW}This mode will:${RESET}"
    echo -e "  ${DIM}• Use MAXIMUM dictionary sizes${RESET}"
    echo -e "  ${DIM}• Consume ALL available CPU cores${RESET}"
    echo -e "  ${DIM}• Require significant RAM${RESET}"
    echo -e "  ${DIM}• Take MUCH longer than other modes${RESET}"
    echo ""
    
    # Termux memory warning
    if [[ "$OS_TYPE" == "termux" ]]; then
        echo -e "  ${NEON_RED}⚠️  TERMUX DETECTED${RESET}"
        echo -e "  ${NEON_YELLOW}Android may kill this process if RAM is low.${RESET}"
        echo ""
        echo -e "  ${NEON_CYAN}[A]${RESET} Memory-limited mode (safer)"
        echo -e "  ${NEON_RED}[B]${RESET} Full power mode (risky)"
        echo ""
        echo -ne "  ${NEON_CYAN}Choice: ${RESET}"
        read -r power_choice
        
        if [[ "${power_choice^^}" == "B" ]]; then
            echo ""
            echo -e "  ${NEON_RED}Type 'I UNDERSTAND' to proceed: ${RESET}"
            read -r confirm
            if [[ "$confirm" != "I UNDERSTAND" ]]; then
                print_warning "Operation cancelled."
                return 1
            fi
            local mem_limit=""
        else
            local mem_limit="--memlimit=50%"
        fi
    else
        echo -ne "  ${NEON_YELLOW}Do you want to proceed? [y/N]: ${RESET}"
        read -r confirm
        if [[ "${confirm,,}" != "y" ]]; then
            print_warning "Operation cancelled."
            return 1
        fi
        local mem_limit=""
    fi
    
    echo ""
    print_shadow_box "☠️  MDH_ZONE ACTIVATED ☠️" "$NEON_RED" 60
    echo ""
    
    print_info "Algorithm: Maximum 7z + XZ Pipeline"
    print_info "This is the theoretical limit of compression."
    echo ""
    
    local temp_base="/tmp/mdh_zone_$$"
    local temp_tar="${temp_base}.tar"
    local temp_7z="${temp_base}.7z"
    local cores=$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
    
    # Step 1: Create tar
    print_step "Phase 1: Preparing archive..."
    if [[ -d "$input" ]]; then
        tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")"
    else
        tar -cf "$temp_tar" -C "$(dirname "$input")" "$(basename "$input")"
    fi
    
    # Step 2: 7z with maximum settings
    print_step "Phase 2: Primary compression (7z Ultra)..."
    7z a -mx=9 -mfb=273 -md=1536m -ms=on -mmt=$cores -bsp1 "$temp_7z" "$temp_tar" 2>/dev/null || \
    7z a -mx=9 -mfb=273 -md=512m -ms=on -mmt=$cores -bsp1 "$temp_7z" "$temp_tar" 2>/dev/null || \
    7z a -mx=9 -mfb=273 -md=128m -ms=on -mmt=$cores -bsp1 "$temp_7z" "$temp_tar"
    
    rm -f "$temp_tar"
    
    # Step 3: XZ on top
    print_step "Phase 3: Secondary compression (XZ Extreme)..."
    if [[ -n "$mem_limit" ]]; then
        pv "$temp_7z" | xz -9 -e $mem_limit -c > "$output"
    else
        pv "$temp_7z" | xz -9 -e -c > "$output"
    fi
    
    rm -f "$temp_7z"
    
    echo ""
    print_success "MDH_ZONE compression complete!"
    print_dragon_small
}

# Main compression handler
handle_compression() {
    clear_screen
    show_compression_menu
    
    echo -ne "  ${NEON_CYAN}Select mode [1-9]: ${RESET}"
    read -r mode
    
    case "$mode" in
        0) return ;;
        1|2|3) local requires_key=false ;;
        4|5|6|7|8|9) local requires_key=true ;;
        *) print_error "Invalid mode"; sleep 2; return ;;
    esac
    
    # Key verification for pro modes
    if [[ "$requires_key" == "true" ]]; then
        if ! check_internet; then
            show_offline_warning
            sleep 2
            return
        fi
        if ! verify_key "true"; then
            sleep 2
            return
        fi
    fi
    
    echo ""
    read_path "Enter file or folder path" input_path
    
    if ! validate_file "$input_path"; then
        sleep 2
        return
    fi
    
    # Analyze file
    local original_size=$(analyze_file "$input_path")
    
    # Get extension
    if [[ "$mode" == "9" ]]; then
        local ext=".mdhz"
    else
        local ext=".mdh"
    fi
    
    # Select output path
    local output_path=$(select_output_path "$input_path" "$ext")
    
    echo ""
    echo -e "  ${NEON_CYAN}Output: ${RESET}${output_path}"
    echo ""
    echo -ne "  ${NEON_YELLOW}Proceed with compression? [Y/n]: ${RESET}"
    read -r proceed
    
    if [[ "${proceed,,}" == "n" ]]; then
        print_warning "Compression cancelled."
        sleep 1
        return
    fi
    
    echo ""
    local start_time=$SECONDS
    
    # Run compression based on mode
    case "$mode" in
        1) compress_flash "$input_path" "$output_path" ;;
        2) compress_flower "$input_path" "$output_path" ;;
        3) compress_asian "$input_path" "$output_path" ;;
        4) compress_drunk "$input_path" "$output_path" ;;
        5) compress_beast "$input_path" "$output_path" ;;
        6) compress_godly "$input_path" "$output_path" ;;
        7) compress_legendary "$input_path" "$output_path" ;;
        8) compress_mythic "$input_path" "$output_path" ;;
        9) compress_mdhzone "$input_path" "$output_path" ;;
    esac
    
    local end_time=$SECONDS
    local elapsed=$((end_time - start_time))
    
    # Calculate results
    if [[ -f "$output_path" ]]; then
        local compressed_size=$(get_size_bytes "$output_path")
        local saved=$((original_size - compressed_size))
        
        if (( original_size > 0 )); then
            local ratio=$(echo "scale=2; (1 - $compressed_size / $original_size) * 100" | bc 2>/dev/null || echo "0")
        else
            local ratio="0"
        fi
        
        # Show results
        echo ""
        print_double_box "✅ COMPRESSION COMPLETE! ✅" "$NEON_GREEN" 60
        print_double_box_line "📁 Original:   $(format_size $original_size)" "$NEON_GREEN" 60
        print_double_box_line "📦 Compressed: $(format_size $compressed_size)" "$NEON_GREEN" 60
        print_double_box_line "💾 Saved:      $(format_size $saved)" "$NEON_GREEN" 60
        print_double_box_line "📊 Ratio:      ${ratio}%" "$NEON_GREEN" 60
        print_double_box_line "⏱️  Time:       $(format_time $elapsed)" "$NEON_GREEN" 60
        print_double_box_line "📄 Output:     $(basename "$output_path")" "$NEON_GREEN" 60
        print_double_box_end "$NEON_GREEN" 60
        
        # Get mode name for stats
        local mode_name=""
        case "$mode" in
            1) mode_name="flash" ;;
            2) mode_name="flower" ;;
            3) mode_name="asian" ;;
            4) mode_name="drunk" ;;
            5) mode_name="beast" ;;
            6) mode_name="godly" ;;
            7) mode_name="legendary" ;;
            8) mode_name="mythic" ;;
            9) mode_name="mdhzone" ;;
        esac
        
        # Update gamification stats
        update_stats "compression" "$original_size" "$saved" "$mode_name" "$ratio"
        
        # Show social share option
        echo ""
        echo -ne "  ${NEON_CYAN}Share your achievement? [y/N]: ${RESET}"
        read -r share_yn
        if [[ "${share_yn,,}" == "y" ]]; then
            show_share_menu "$original_size" "$compressed_size" "$ratio" "$mode_name"
        fi
        
        show_quote
    else
        print_error "Compression failed! Output file not created."
    fi
    
    echo ""
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read
}

#===============================================================================
# SECTION 14: UNIVERSAL EXTRACTION ENGINE
#===============================================================================

# Detect archive type by magic bytes
detect_archive_type() {
    local file="$1"
    local magic=$(xxd -p -l 10 "$file" 2>/dev/null | tr '[:lower:]' '[:upper:]')
    
    # Check magic bytes
    case "$magic" in
        377ABCAF271C*)     echo "7z" ;;
        504B0304*|504B0506*|504B0708*) echo "zip" ;;
        526172211A07*)     echo "rar" ;;
        1F8B08*)           echo "gz" ;;
        FD377A585A00*)     echo "xz" ;;
        425A68*)           echo "bz2" ;;
        04224D18*)         echo "lz4" ;;
        28B52FFD*)         echo "zstd" ;;
        4C5A4950*)         echo "lrzip" ;;
        *)
            # Fallback to extension
            local ext="${file##*.}"
            echo "${ext,,}"
            ;;
    esac
}

# Try multiple extractors for .mdh files
extract_mdh() {
    local input="$1"
    local output_dir="$2"
    
    print_info "Attempting multi-method extraction..."
    
    # Try 7z first (most common)
    if 7z x -y -o"$output_dir" "$input" &>/dev/null; then
        print_success "Extracted using 7-Zip"
        return 0
    fi
    
    # Try lz4
    if lz4 -d -f "$input" "$output_dir/extracted.tar" &>/dev/null; then
        tar -xf "$output_dir/extracted.tar" -C "$output_dir" 2>/dev/null
        rm -f "$output_dir/extracted.tar"
        print_success "Extracted using LZ4"
        return 0
    fi
    
    # Try zstd
    if zstd -d -f "$input" -o "$output_dir/extracted.tar" &>/dev/null; then
        tar -xf "$output_dir/extracted.tar" -C "$output_dir" 2>/dev/null
        rm -f "$output_dir/extracted.tar"
        print_success "Extracted using Zstandard"
        return 0
    fi
    
    # Try xz
    if xz -d -k -f "$input" -c > "$output_dir/extracted.tar" 2>/dev/null; then
        tar -xf "$output_dir/extracted.tar" -C "$output_dir" 2>/dev/null
        rm -f "$output_dir/extracted.tar"
        print_success "Extracted using XZ"
        return 0
    fi
    
    # Try lrzip
    if command -v lrzip &>/dev/null; then
        if lrzip -d -f "$input" -o "$output_dir/extracted.tar" &>/dev/null; then
            tar -xf "$output_dir/extracted.tar" -C "$output_dir" 2>/dev/null
            rm -f "$output_dir/extracted.tar"
            print_success "Extracted using LRZIP"
            return 0
        fi
    fi
    
    print_error "Could not extract file with any available method"
    return 1
}

# Extract .mdhz files (MDH_ZONE format)
extract_mdhz() {
    local input="$1"
    local output_dir="$2"
    
    print_info "Extracting MDH_ZONE format (multi-layer)..."
    
    local temp_dir="/tmp/mdhz_extract_$$"
    mkdir -p "$temp_dir"
    
    # Layer 1: XZ decompress
    print_step "Layer 1: XZ decompression..."
    if ! xz -d -k -f "$input" -c > "$temp_dir/layer1.7z" 2>/dev/null; then
        print_error "XZ decompression failed"
        rm -rf "$temp_dir"
        return 1
    fi
    
    # Layer 2: 7z extract
    print_step "Layer 2: 7z extraction..."
    if ! 7z x -y -o"$temp_dir" "$temp_dir/layer1.7z" &>/dev/null; then
        print_error "7z extraction failed"
        rm -rf "$temp_dir"
        return 1
    fi
    rm -f "$temp_dir/layer1.7z"
    
    # Layer 3: Tar extract if present
    local tar_file=$(find "$temp_dir" -name "*.tar" -type f 2>/dev/null | head -1)
    if [[ -n "$tar_file" ]]; then
        print_step "Layer 3: TAR extraction..."
        tar -xf "$tar_file" -C "$output_dir" 2>/dev/null
        rm -f "$tar_file"
    fi
    
    # Move remaining files
    find "$temp_dir" -mindepth 1 -maxdepth 1 -exec mv {} "$output_dir/" \; 2>/dev/null
    rm -rf "$temp_dir"
    
    print_success "MDH_ZONE extraction complete!"
    return 0
}

# Check for nested archives
check_nested_archives() {
    local dir="$1"
    local nested=()
    
    while IFS= read -r -d '' file; do
        local ext="${file##*.}"
        ext="${ext,,}"
        case "$ext" in
            zip|7z|rar|tar|gz|xz|bz2|lz4|zst|mdh|mdhz|tgz|tbz2|txz)
                nested+=("$file")
                ;;
        esac
    done < <(find "$dir" -type f -print0 2>/dev/null)
    
    if [[ ${#nested[@]} -gt 0 ]]; then
        echo ""
        print_warning "Nested archives detected!"
        echo ""
        for f in "${nested[@]}"; do
            echo -e "  ${DIM}•${RESET} $(basename "$f")"
        done
        echo ""
        echo -e "  ${NEON_CYAN}[A]${RESET} Extract ALL nested archives"
        echo -e "  ${NEON_CYAN}[S]${RESET} Select which to extract"
        echo -e "  ${NEON_CYAN}[N]${RESET} Skip (don't extract nested)"
        echo ""
        echo -ne "  ${NEON_CYAN}Choice: ${RESET}"
        read -r nest_choice
        
        case "${nest_choice^^}" in
            A)
                for f in "${nested[@]}"; do
                    echo ""
                    print_step "Extracting: $(basename "$f")"
                    local nest_out="${f%.*}_extracted"
                    mkdir -p "$nest_out"
                    extract_single_file "$f" "$nest_out"
                done
                ;;
            S)
                for f in "${nested[@]}"; do
                    echo -ne "  Extract $(basename "$f")? [y/N]: "
                    read -r yn
                    if [[ "${yn,,}" == "y" ]]; then
                        local nest_out="${f%.*}_extracted"
                        mkdir -p "$nest_out"
                        extract_single_file "$f" "$nest_out"
                    fi
                done
                ;;
            *)
                print_info "Skipping nested archives"
                ;;
        esac
    fi
}

# Extract single file based on type
extract_single_file() {
    local input="$1"
    local output_dir="$2"
    
    local archive_type=$(detect_archive_type "$input")
    local ext="${input##*.}"
    ext="${ext,,}"
    
    # Handle compound extensions
    if [[ "$input" == *.tar.gz ]] || [[ "$input" == *.tgz ]]; then
        archive_type="tar.gz"
    elif [[ "$input" == *.tar.xz ]] || [[ "$input" == *.txz ]]; then
        archive_type="tar.xz"
    elif [[ "$input" == *.tar.bz2 ]] || [[ "$input" == *.tbz2 ]]; then
        archive_type="tar.bz2"
    fi
    
    print_info "Detected format: $archive_type"
    
    case "$archive_type" in
        mdh)
            extract_mdh "$input" "$output_dir"
            ;;
        mdhz)
            extract_mdhz "$input" "$output_dir"
            ;;
        7z)
            7z x -y -o"$output_dir" "$input" -bsp1
            ;;
        zip)
            unzip -o "$input" -d "$output_dir"
            ;;
        rar)
            if command -v unrar &>/dev/null; then
                unrar x -o+ "$input" "$output_dir/"
            else
                print_error "UnRAR not installed. Install with: $PKG_INSTALL unrar"
                return 1
            fi
            ;;
        tar)
            pv "$input" | tar -xf - -C "$output_dir"
            ;;
        tar.gz|tgz|gz)
            if [[ "$archive_type" == "gz" ]] && [[ "$input" != *.tar.gz ]]; then
                pv "$input" | gunzip -c > "$output_dir/$(basename "${input%.gz}")"
            else
                pv "$input" | tar -xzf - -C "$output_dir"
            fi
            ;;
        tar.xz|txz|xz)
            if [[ "$archive_type" == "xz" ]] && [[ "$input" != *.tar.xz ]]; then
                pv "$input" | xz -d -c > "$output_dir/$(basename "${input%.xz}")"
            else
                pv "$input" | tar -xJf - -C "$output_dir"
            fi
            ;;
        tar.bz2|tbz2|bz2)
            if [[ "$archive_type" == "bz2" ]] && [[ "$input" != *.tar.bz2 ]]; then
                pv "$input" | bzip2 -d -c > "$output_dir/$(basename "${input%.bz2}")"
            else
                pv "$input" | tar -xjf - -C "$output_dir"
            fi
            ;;
        lz4)
            pv "$input" | lz4 -d -c > "$output_dir/$(basename "${input%.lz4}")"
            ;;
        zst|zstd)
            pv "$input" | zstd -d -c > "$output_dir/$(basename "${input%.zst}")"
            ;;
        lrzip|lrz)
            if command -v lrzip &>/dev/null; then
                lrzip -d "$input" -o "$output_dir/$(basename "${input%.lrz}")"
            else
                print_error "LRZIP not installed"
                return 1
            fi
            ;;
        *)
            # Try 7z as universal fallback
            print_warning "Unknown format, trying 7-Zip..."
            7z x -y -o"$output_dir" "$input" -bsp1 || return 1
            ;;
    esac
    
    return 0
}

# Main extraction handler
handle_extraction() {
    clear_screen
    echo ""
    print_logo_compact
    echo ""
    show_stats_bar
    echo ""
    
    print_double_box "📦 UNIVERSAL EXTRACTOR" "$NEON_CYAN" 60
    echo ""
    print_info "Supports: ZIP, RAR, 7Z, TAR, GZ, XZ, BZ2, LZ4, ZSTD, MDH, MDHZ"
    echo ""
    
    read_path "Enter archive path" input_path
    
    if ! validate_file "$input_path"; then
        sleep 2
        return
    fi
    
    # Analyze archive
    local size_bytes=$(get_size_bytes "$input_path")
    local size_human=$(format_size "$size_bytes")
    local archive_type=$(detect_archive_type "$input_path")
    
    echo ""
    print_double_box "📋 ARCHIVE INFO" "$NEON_CYAN" 60
    print_double_box_line "File: $(basename "$input_path")" "$NEON_CYAN" 60
    print_double_box_line "Size: $size_human" "$NEON_CYAN" 60
    print_double_box_line "Type: $archive_type" "$NEON_CYAN" 60
    print_double_box_end "$NEON_CYAN" 60
    
    # Select output directory
    local input_name=$(basename "$input_path")
    local input_base="${input_name%.*}"
    local input_dir=$(dirname "$input_path")
    local default_out="${input_dir}/${input_base}_extracted"
    
    echo ""
    echo -e "  ${NEON_CYAN}Extract to:${RESET}"
    echo -e "  ${DIM}[1]${RESET} ${default_out}"
    echo -e "  ${DIM}[2]${RESET} Current directory ($(pwd))"
    echo -e "  ${DIM}[3]${RESET} Custom path"
    echo ""
    echo -ne "  ${NEON_CYAN}Choice [1]: ${RESET}"
    read -r out_choice
    
    local output_dir
    case "$out_choice" in
        2) output_dir="$(pwd)/${input_base}_extracted" ;;
        3)
            echo -ne "  ${NEON_CYAN}Enter path: ${RESET}"
            read -e -r output_dir
            ;;
        *) output_dir="$default_out" ;;
    esac
    
    mkdir -p "$output_dir"
    
    echo ""
    print_step "Extracting to: $output_dir"
    echo ""
    
    local start_time=$SECONDS
    
    if extract_single_file "$input_path" "$output_dir"; then
        local end_time=$SECONDS
        local elapsed=$((end_time - start_time))
        
        echo ""
        print_success "Extraction complete!"
        echo -e "  ${DIM}Time: $(format_time $elapsed)${RESET}"
        echo -e "  ${DIM}Location: ${output_dir}${RESET}"
        
        # Check for nested archives
        check_nested_archives "$output_dir"
        
        # Update stats
        update_stats "extraction" 0 0
    else
        print_error "Extraction failed!"
    fi
    
    echo ""
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read
}

#===============================================================================
# SECTION 15: GAMIFICATION SYSTEM
#===============================================================================

# Achievement definitions
declare -A ACHIEVEMENTS=(
    ["FIRST_BLOOD"]="First compression|Complete your first compression"
    ["SPEED_DEMON"]="Speed Demon|Use FLASH mode 10 times"
    ["FLOWER_POWER"]="Flower Power|Use LITTLE FLOWER mode 10 times"
    ["ASIAN_MASTER"]="Asian Master|Use ASIAN mode 10 times"
    ["HAPPY_DRUNK"]="Happy Drunk|Use TASTY DRUNK mode 10 times"
    ["BEAST_TAMER"]="Beast Tamer|Use BEAST mode 10 times"
    ["GODLIKE"]="Godlike|Use GODLY mode 10 times"
    ["DRAGON_RIDER"]="Dragon Rider|Use LEGENDARY mode 10 times"
    ["DEATH_WISH"]="Death Wish|Use MYTHIC mode 10 times"
    ["FORBIDDEN_FRUIT"]="Forbidden Fruit|Enter MDH_ZONE for the first time"
    ["ZONE_MASTER"]="Zone Master|Use MDH_ZONE 10 times"
    ["UNPACKER"]="Unpacker|Extract 10 archives"
    ["UNPACK_KING"]="Unpack King|Extract 100 archives"
    ["MEGABYTE_WARRIOR"]="Megabyte Warrior|Compress 100MB total"
    ["GIGABYTE_SLAYER"]="Gigabyte Slayer|Compress 1GB total"
    ["TERABYTE_TITAN"]="Terabyte Titan|Compress 1TB total"
    ["SPACE_SAVER"]="Space Saver|Save 100MB of space"
    ["DISK_LIBERATOR"]="Disk Liberator|Save 1GB of space"
    ["STORAGE_GOD"]="Storage God|Save 10GB of space"
    ["RATIO_ROOKIE"]="Ratio Rookie|Achieve 50% compression ratio"
    ["RATIO_PRO"]="Ratio Pro|Achieve 70% compression ratio"
    ["RATIO_MASTER"]="Ratio Master|Achieve 85% compression ratio"
    ["RATIO_LEGEND"]="Ratio Legend|Achieve 95% compression ratio"
    ["PERFECTIONIST"]="Perfectionist|Achieve 99%+ compression ratio"
    ["DAILY_WARRIOR"]="Daily Warrior|Use 7 days in a row"
    ["WEEKLY_CHAMPION"]="Weekly Champion|Use 30 days total"
    ["MONTHLY_LEGEND"]="Monthly Legend|Use 100 days total"
    ["NIGHT_OWL"]="Night Owl|Compress after midnight"
    ["EARLY_BIRD"]="Early Bird|Compress before 6 AM"
    ["COMEBACK_KID"]="Comeback Kid|Return after 30 days"
    ["SUPPORTER"]="Supporter|Clicked donation link"
    ["SOCIAL_BUTTERFLY"]="Social Butterfly|Shared on social media"
    ["MODE_EXPLORER"]="Mode Explorer|Used all 9 compression modes"
    ["EXPERIMENTER"]="Experimenter|Compressed 50 different files"
    ["FOLDER_FANATIC"]="Folder Fanatic|Compressed 20 folders"
    ["HEAVY_LIFTER"]="Heavy Lifter|Compressed a file over 1GB"
    ["TINY_COMPRESSOR"]="Tiny Compressor|Compressed a file under 1KB"
    ["LIGHTNING_FAST"]="Lightning Fast|Compression under 1 second"
    ["PATIENCE_MASTER"]="Patience Master|Compression over 1 hour"
    ["LUCKY_SEVEN"]="Lucky Seven|Achieved exactly 77% ratio"
    ["KEY_MASTER"]="Key Master|50 successful key entries"
    ["TRANSFER_PRO"]="Transfer Pro|Transferred 10 files"
    ["SHARER"]="Sharer|Used file transfer feature"
)

# Level definitions
declare -A LEVELS=(
    [1]="Novice|0"
    [2]="Apprentice|100"
    [3]="Warrior|500"
    [4]="Master|1500"
    [5]="Grandmaster|5000"
    [6]="Legend|15000"
    [7]="Mythic|50000"
    [8]="MDH_ELITE|100000"
)

# Initialize stats file
init_stats() {
    if [[ ! -f "$STATS_FILE" ]]; then
        local user_id=$(cat /dev/urandom | tr -dc 'a-f0-9' | fold -w 32 | head -n 1)
        echo "$user_id" > "$USER_ID_FILE"
        
        cat > "$STATS_FILE" << EOF
{
    "user_id": "$user_id",
    "total_compressed": 0,
    "total_saved": 0,
    "compressions": 0,
    "extractions": 0,
    "transfers": 0,
    "xp": 0,
    "level": 1,
    "achievements": [],
    "first_use": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
    "last_use": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
    "streak_days": 0,
    "total_days": 0,
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
    "key_entries": 0
}
EOF
    fi
}

# Read stats value
get_stat() {
    local key="$1"
    jq -r ".$key // 0" "$STATS_FILE" 2>/dev/null || echo "0"
}

# Update stats
update_stats() {
    local action="$1"
    local bytes_compressed="${2:-0}"
    local bytes_saved="${3:-0}"
    local mode="${4:-}"
    local ratio="${5:-0}"
    
    init_stats
    
    # Read current stats
    local current_xp=$(get_stat "xp")
    local current_compressions=$(get_stat "compressions")
    local current_extractions=$(get_stat "extractions")
    local total_compressed=$(get_stat "total_compressed")
    local total_saved=$(get_stat "total_saved")
    local best_ratio=$(get_stat "best_ratio")
    
    local xp_earned=0
    local new_achievements=()
    
    case "$action" in
        compression)
            current_compressions=$((current_compressions + 1))
            total_compressed=$((total_compressed + bytes_compressed))
            total_saved=$((total_saved + bytes_saved))
            
            # XP based on mode
            case "$mode" in
                flash|flower) xp_earned=5 ;;
                asian|drunk) xp_earned=10 ;;
                beast|godly) xp_earned=25 ;;
                legendary|mythic) xp_earned=50 ;;
                mdhzone) xp_earned=100 ;;
            esac
            
            # Bonus XP for size
            xp_earned=$((xp_earned + bytes_compressed / 104857600))
            
            # Update best ratio
            if (( $(echo "$ratio > $best_ratio" | bc -l 2>/dev/null || echo 0) )); then
                best_ratio="$ratio"
            fi
            
            # Check achievements
            if [[ $current_compressions -eq 1 ]]; then
                new_achievements+=("FIRST_BLOOD")
            fi
            
            # Mode usage update and achievement check
            local mode_count=$(jq -r ".mode_usage.$mode // 0" "$STATS_FILE" 2>/dev/null || echo "0")
            mode_count=$((mode_count + 1))
            
            # Update JSON
            local tmp_file=$(mktemp)
            jq ".compressions = $current_compressions | 
                .total_compressed = $total_compressed | 
                .total_saved = $total_saved | 
                .best_ratio = $best_ratio |
                .mode_usage.$mode = $mode_count |
                .last_use = \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"" \
                "$STATS_FILE" > "$tmp_file" && mv "$tmp_file" "$STATS_FILE"
            ;;
            
        extraction)
            current_extractions=$((current_extractions + 1))
            xp_earned=3
            
            if [[ $current_extractions -eq 10 ]]; then
                new_achievements+=("UNPACKER")
            fi
            if [[ $current_extractions -eq 100 ]]; then
                new_achievements+=("UNPACK_KING")
            fi
            
            local tmp_file=$(mktemp)
            jq ".extractions = $current_extractions |
                .last_use = \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"" \
                "$STATS_FILE" > "$tmp_file" && mv "$tmp_file" "$STATS_FILE"
            ;;
            
        transfer)
            local transfers=$(get_stat "transfers")
            transfers=$((transfers + 1))
            xp_earned=5
            
            if [[ $transfers -eq 1 ]]; then
                new_achievements+=("SHARER")
            fi
            if [[ $transfers -eq 10 ]]; then
                new_achievements+=("TRANSFER_PRO")
            fi
            
            local tmp_file=$(mktemp)
            jq ".transfers = $transfers |
                .last_use = \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"" \
                "$STATS_FILE" > "$tmp_file" && mv "$tmp_file" "$STATS_FILE"
            ;;
    esac
    
    # Update XP and check level
    current_xp=$((current_xp + xp_earned))
    local current_level=$(get_stat "level")
    local new_level=$current_level
    
    for lvl in 8 7 6 5 4 3 2 1; do
        local req=$(echo "${LEVELS[$lvl]}" | cut -d'|' -f2)
        if (( current_xp >= req )); then
            new_level=$lvl
            break
        fi
    done
    
    # Save XP and level
    local tmp_file=$(mktemp)
    jq ".xp = $current_xp | .level = $new_level" "$STATS_FILE" > "$tmp_file" && mv "$tmp_file" "$STATS_FILE"
    
    # Show XP earned
    if (( xp_earned > 0 )); then
        echo -e "  ${GOLD}+${xp_earned} XP earned!${RESET}"
    fi
    
    # Check level up
    if (( new_level > current_level )); then
        local level_name=$(echo "${LEVELS[$new_level]}" | cut -d'|' -f1)
        echo ""
        print_double_box "🎉 LEVEL UP! 🎉" "$GOLD" 50
        echo -e "  ${NEON_GREEN}You are now a ${GOLD}${level_name}${NEON_GREEN}!${RESET}"
        print_double_box_end "$GOLD" 50
        sleep 2
    fi
    
    # Show new achievements
    for ach in "${new_achievements[@]}"; do
        unlock_achievement "$ach"
    done
}

# Unlock achievement
unlock_achievement() {
    local ach_id="$1"
    local ach_data="${ACHIEVEMENTS[$ach_id]}"
    local ach_name=$(echo "$ach_data" | cut -d'|' -f1)
    local ach_desc=$(echo "$ach_data" | cut -d'|' -f2)
    
    # Check if already unlocked
    local has_ach=$(jq -r ".achievements | index(\"$ach_id\") // -1" "$STATS_FILE" 2>/dev/null)
    if [[ "$has_ach" != "-1" ]] && [[ "$has_ach" != "null" ]]; then
        return
    fi
    
    # Add to achievements
    local tmp_file=$(mktemp)
    jq ".achievements += [\"$ach_id\"]" "$STATS_FILE" > "$tmp_file" && mv "$tmp_file" "$STATS_FILE"
    
    # Show achievement popup
    echo ""
    echo -e "  ${GOLD}╔══════════════════════════════════════════════╗${RESET}"
    echo -e "  ${GOLD}║${RESET}  🏆 ${NEON_GREEN}ACHIEVEMENT UNLOCKED!${RESET}                    ${GOLD}║${RESET}"
    echo -e "  ${GOLD}╠══════════════════════════════════════════════╣${RESET}"
    echo -e "  ${GOLD}║${RESET}  ${NEON_CYAN}${ach_name}${RESET}                                  ${GOLD}║${RESET}"
    echo -e "  ${GOLD}║${RESET}  ${DIM}${ach_desc}${RESET}                ${GOLD}║${RESET}"
    echo -e "  ${GOLD}╚══════════════════════════════════════════════╝${RESET}"
    sleep 2
}

# Show stats menu
show_stats_menu() {
    clear_screen
    init_stats
    
    echo ""
    print_logo_compact
    echo ""
    
    local xp=$(get_stat "xp")
    local level=$(get_stat "level")
    local level_name=$(echo "${LEVELS[$level]}" | cut -d'|' -f1)
    local compressions=$(get_stat "compressions")
    local extractions=$(get_stat "extractions")
    local transfers=$(get_stat "transfers")
    local total_compressed=$(get_stat "total_compressed")
    local total_saved=$(get_stat "total_saved")
    local best_ratio=$(get_stat "best_ratio")
    local ach_count=$(jq -r '.achievements | length' "$STATS_FILE" 2>/dev/null || echo "0")
    
    print_double_box "📊 YOUR STATS" "$GOLD" 60
    echo ""
    echo -e "  ${NEON_CYAN}Level:${RESET}          ${GOLD}$level${RESET} - ${NEON_GREEN}$level_name${RESET}"
    echo -e "  ${NEON_CYAN}XP:${RESET}             ${NEON_YELLOW}$xp${RESET}"
    echo -e "  ${NEON_CYAN}Compressions:${RESET}   $compressions"
    echo -e "  ${NEON_CYAN}Extractions:${RESET}    $extractions"
    echo -e "  ${NEON_CYAN}Transfers:${RESET}      $transfers"
    echo -e "  ${NEON_CYAN}Total Compressed:${RESET} $(format_size $total_compressed)"
    echo -e "  ${NEON_CYAN}Space Saved:${RESET}    $(format_size $total_saved)"
    echo -e "  ${NEON_CYAN}Best Ratio:${RESET}     ${best_ratio}%"
    echo -e "  ${NEON_CYAN}Achievements:${RESET}   ${ach_count}/${#ACHIEVEMENTS[@]}"
    echo ""
    
    # XP progress bar
    local next_level=$((level + 1))
    if [[ $next_level -le 8 ]]; then
        local current_req=$(echo "${LEVELS[$level]}" | cut -d'|' -f2)
        local next_req=$(echo "${LEVELS[$next_level]}" | cut -d'|' -f2)
        local progress=$(( (xp - current_req) * 100 / (next_req - current_req) ))
        
        echo -e "  ${DIM}Progress to next level:${RESET}"
        echo -ne "  ${PRIMARY}[${RESET}"
        local bar_width=40
        local filled=$((progress * bar_width / 100))
        for (( i=0; i<bar_width; i++ )); do
            if (( i < filled )); then
                echo -ne "${NEON_GREEN}█${RESET}"
            else
                echo -ne "${DIM}░${RESET}"
            fi
        done
        echo -e "${PRIMARY}]${RESET} ${progress}%"
    else
        echo -e "  ${GOLD}✨ MAX LEVEL REACHED ✨${RESET}"
    fi
    
    echo ""
    echo -e "  ${DIM}[A]${RESET} View Achievements"
    echo -e "  ${DIM}[0]${RESET} Back"
    echo ""
    echo -ne "  ${NEON_CYAN}Choice: ${RESET}"
    read -r choice
    
    if [[ "${choice^^}" == "A" ]]; then
        show_achievements
    fi
}

# Show achievements
show_achievements() {
    clear_screen
    echo ""
    print_double_box "🏆 ACHIEVEMENTS" "$GOLD" 60
    echo ""
    
    local unlocked=$(jq -r '.achievements[]' "$STATS_FILE" 2>/dev/null)
    
    for ach_id in "${!ACHIEVEMENTS[@]}"; do
        local ach_data="${ACHIEVEMENTS[$ach_id]}"
        local ach_name=$(echo "$ach_data" | cut -d'|' -f1)
        local ach_desc=$(echo "$ach_data" | cut -d'|' -f2)
        
        if echo "$unlocked" | grep -q "^${ach_id}$"; then
            echo -e "  ${NEON_GREEN}[✓]${RESET} ${GOLD}${ach_name}${RESET}"
            echo -e "      ${DIM}${ach_desc}${RESET}"
        else
            echo -e "  ${DIM}[✗] ${ach_name}${RESET}"
            echo -e "      ${DIM}${ach_desc}${RESET}"
        fi
    done | head -30
    
    echo ""
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read
}

#===============================================================================
# SECTION 16: FILE TRANSFER MODULE
#===============================================================================

# Verified transfer services
declare -A TRANSFER_SERVICES=(
    ["gofile"]="gofile.io|Unlimited|Forever"
    ["pixeldrain"]="pixeldrain.com|20GB|60 days"
    ["0x0"]="0x0.st|512MB|30 days"
    ["fileio"]="file.io|2GB|1 download"
    ["catbox"]="catbox.moe|200MB|Permanent"
)

# Upload to gofile
upload_gofile() {
    local file="$1"
    
    print_step "Getting upload server..."
    local server=$(curl -s "https://api.gofile.io/getServer" | jq -r '.data.server' 2>/dev/null)
    
    if [[ -z "$server" ]] || [[ "$server" == "null" ]]; then
        return 1
    fi
    
    print_step "Uploading to $server.gofile.io..."
    local response=$(curl -# -F "file=@$file" "https://${server}.gofile.io/uploadFile" 2>&1)
    local url=$(echo "$response" | jq -r '.data.downloadPage' 2>/dev/null)
    
    if [[ -n "$url" ]] && [[ "$url" != "null" ]]; then
        echo "$url"
        return 0
    fi
    return 1
}

# Upload to pixeldrain
upload_pixeldrain() {
    local file="$1"
    
    print_step "Uploading to pixeldrain.com..."
    local response=$(curl -# -T "$file" "https://pixeldrain.com/api/file/" 2>&1)
    local id=$(echo "$response" | jq -r '.id' 2>/dev/null)
    
    if [[ -n "$id" ]] && [[ "$id" != "null" ]]; then
        echo "https://pixeldrain.com/u/$id"
        return 0
    fi
    return 1
}

# Upload to 0x0
upload_0x0() {
    local file="$1"
    
    print_step "Uploading to 0x0.st..."
    local url=$(curl -# -F "file=@$file" "https://0x0.st" 2>&1)
    
    if [[ "$url" == http* ]]; then
        echo "$url"
        return 0
    fi
    return 1
}

# Upload to file.io
upload_fileio() {
    local file="$1"
    
    print_step "Uploading to file.io..."
    local response=$(curl -# -F "file=@$file" "https://file.io" 2>&1)
    local url=$(echo "$response" | jq -r '.link' 2>/dev/null)
    
    if [[ -n "$url" ]] && [[ "$url" != "null" ]]; then
        echo "$url"
        return 0
    fi
    return 1
}

# Upload to catbox
upload_catbox() {
    local file="$1"
    
    print_step "Uploading to catbox.moe..."
    local url=$(curl -# -F "reqtype=fileupload" -F "fileToUpload=@$file" "https://catbox.moe/user/api.php" 2>&1)
    
    if [[ "$url" == http* ]]; then
        echo "$url"
        return 0
    fi
    return 1
}

# Start local Python server
start_local_server() {
    local file="$1"
    local port="${2:-8888}"
    
    local file_dir=$(dirname "$file")
    local file_name=$(basename "$file")
    
    print_info "Starting local HTTP server on port $port..."
    print_warning "Keep this terminal open while sharing!"
    echo ""
    
    # Get local IP
    local local_ip=$(hostname -I 2>/dev/null | awk '{print $1}')
    [[ -z "$local_ip" ]] && local_ip=$(ifconfig 2>/dev/null | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | head -1)
    [[ -z "$local_ip" ]] && local_ip="localhost"
    
    echo -e "  ${NEON_GREEN}Local Network URL:${RESET}"
    echo -e "  ${NEON_CYAN}http://${local_ip}:${port}/${file_name}${RESET}"
    echo ""
    
    cd "$file_dir"
    python3 -m http.server "$port" 2>/dev/null || python -m SimpleHTTPServer "$port" 2>/dev/null
}

# Start SSH tunnel with serveo
start_serveo_tunnel() {
    local file="$1"
    local port="${2:-8888}"
    
    print_info "Creating public tunnel via Serveo.net..."
    print_warning "Requires SSH. Keep terminal open!"
    echo ""
    
    # Start local server in background
    local file_dir=$(dirname "$file")
    local file_name=$(basename "$file")
    
    cd "$file_dir"
    python3 -m http.server "$port" &>/dev/null &
    local server_pid=$!
    
    sleep 1
    
    echo -e "  ${NEON_YELLOW}Connecting to Serveo...${RESET}"
    ssh -R 80:localhost:$port serveo.net
    
    kill $server_pid 2>/dev/null
}

# Auto upload with fallback
auto_upload() {
    local file="$1"
    local services=("gofile" "pixeldrain" "0x0" "fileio" "catbox")
    
    for service in "${services[@]}"; do
        print_info "Trying $service..."
        
        local url
        case "$service" in
            gofile) url=$(upload_gofile "$file") ;;
            pixeldrain) url=$(upload_pixeldrain "$file") ;;
            0x0) url=$(upload_0x0 "$file") ;;
            fileio) url=$(upload_fileio "$file") ;;
            catbox) url=$(upload_catbox "$file") ;;
        esac
        
        if [[ -n "$url" ]]; then
            echo "$url"
            return 0
        fi
        
        print_warning "$service failed, trying next..."
    done
    
    return 1
}

# Copy to clipboard
copy_to_clipboard() {
    local text="$1"
    
    if [[ "$OS_TYPE" == "termux" ]]; then
        echo "$text" | termux-clipboard-set 2>/dev/null && return 0
    elif [[ "$OS_TYPE" == "macos" ]]; then
        echo "$text" | pbcopy 2>/dev/null && return 0
    elif command -v xclip &>/dev/null; then
        echo "$text" | xclip -selection clipboard 2>/dev/null && return 0
    elif command -v xsel &>/dev/null; then
        echo "$text" | xsel --clipboard 2>/dev/null && return 0
    fi
    
    return 1
}

# Main transfer handler
handle_transfer() {
    clear_screen
    echo ""
    print_logo_compact
    echo ""
    
    print_double_box "📤 FILE TRANSFER" "$NEON_PURPLE" 60
    echo ""
    
    echo -e "  ${NEON_CYAN}Choose transfer method:${RESET}"
    echo ""
    echo -e "  ${DIM}CLOUD UPLOAD (Upload once, share link):${RESET}"
    echo -e "  ${NEON_GREEN}[1]${RESET} 🚀 Auto (tries all services)"
    echo -e "  ${NEON_GREEN}[2]${RESET} 📁 GoFile.io ${DIM}(Unlimited, Forever)${RESET}"
    echo -e "  ${NEON_GREEN}[3]${RESET} 💎 Pixeldrain ${DIM}(20GB, 60 days)${RESET}"
    echo -e "  ${NEON_GREEN}[4]${RESET} ⚡ 0x0.st ${DIM}(512MB, 30 days)${RESET}"
    echo -e "  ${NEON_GREEN}[5]${RESET} 📨 File.io ${DIM}(2GB, 1 download)${RESET}"
    echo -e "  ${NEON_GREEN}[6]${RESET} 🐱 Catbox ${DIM}(200MB, Permanent)${RESET}"
    echo ""
    echo -e "  ${DIM}LOCAL/DIRECT (Device must stay ON):${RESET}"
    echo -e "  ${NEON_YELLOW}[7]${RESET} 🏠 Local Network (Python server)"
    echo -e "  ${NEON_YELLOW}[8]${RESET} 🌐 Public URL (Serveo SSH tunnel)"
    echo ""
    echo -e "  ${DIM}[0] Back${RESET}"
    echo ""
    echo -ne "  ${NEON_CYAN}Choice: ${RESET}"
    read -r method
    
    [[ "$method" == "0" ]] && return
    
    echo ""
    read_path "Enter file path" file_path
    
    if ! validate_file "$file_path"; then
        sleep 2
        return
    fi
    
    if [[ -d "$file_path" ]]; then
        print_warning "Folders must be compressed first!"
        echo -ne "  ${NEON_CYAN}Compress now? [Y/n]: ${RESET}"
        read -r compress_yn
        if [[ "${compress_yn,,}" != "n" ]]; then
            local temp_archive="/tmp/$(basename "$file_path").mdh"
            compress_flash "$file_path" "$temp_archive"
            file_path="$temp_archive"
        else
            return
        fi
    fi
    
    local file_size=$(get_size_bytes "$file_path")
    local file_human=$(format_size "$file_size")
    
    echo ""
    print_info "File: $(basename "$file_path")"
    print_info "Size: $file_human"
    echo ""
    
    local url=""
    
    case "$method" in
        1) url=$(auto_upload "$file_path") ;;
        2) url=$(upload_gofile "$file_path") ;;
        3) url=$(upload_pixeldrain "$file_path") ;;
        4) url=$(upload_0x0 "$file_path") ;;
        5) url=$(upload_fileio "$file_path") ;;
        6) url=$(upload_catbox "$file_path") ;;
        7) start_local_server "$file_path"; return ;;
        8) start_serveo_tunnel "$file_path"; return ;;
    esac
    
    if [[ -n "$url" ]]; then
        echo ""
        print_double_box "✅ UPLOAD COMPLETE!" "$NEON_GREEN" 60
        echo ""
        echo -e "  ${NEON_GREEN}Download URL:${RESET}"
        echo -e "  ${NEON_CYAN}${url}${RESET}"
        echo ""
        
        if copy_to_clipboard "$url"; then
            print_success "URL copied to clipboard!"
        fi
        
        # Update stats
        update_stats "transfer" 0 0
        
        echo ""
        echo -e "  ${DIM}Share this link with anyone to download the file.${RESET}"
    else
        print_error "All upload methods failed!"
    fi
    
    echo ""
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read
}

#===============================================================================
# SECTION 17: SOCIAL SHARING
#===============================================================================

# Generate share text
generate_share_text() {
    local original_size="$1"
    local compressed_size="$2"
    local ratio="$3"
    local mode="$4"
    
    local saved=$((original_size - compressed_size))
    
    cat << EOF
🗜️ Just compressed $(format_size $original_size) → $(format_size $compressed_size) using MDH_COMPRESSER!

📊 Compression Ratio: ${ratio}%
💾 Space Saved: $(format_size $saved)
⚡ Mode: $mode

🔥 The World's Most Powerful Compression Suite
🐉 Get it free: $GITHUB_REPO

#MDHCompresser #Compression #FreeTools
EOF
}

# Show social share menu
show_share_menu() {
    local original_size="$1"
    local compressed_size="$2"
    local ratio="$3"
    local mode="$4"
    
    local share_text=$(generate_share_text "$original_size" "$compressed_size" "$ratio" "$mode")
    
    echo ""
    print_double_box "📢 SHARE YOUR ACHIEVEMENT" "$NEON_PURPLE" 60
    echo ""
    echo -e "  ${NEON_CYAN}[1]${RESET} 🐦 Share on Twitter/X"
    echo -e "  ${NEON_CYAN}[2]${RESET} 📱 Share on Reddit"
    echo -e "  ${NEON_CYAN}[3]${RESET} 💼 Share on LinkedIn"
    echo -e "  ${NEON_CYAN}[4]${RESET} 📋 Copy to Clipboard"
    echo -e "  ${NEON_CYAN}[0]${RESET} Skip"
    echo ""
    echo -ne "  ${NEON_CYAN}Choice: ${RESET}"
    read -r share_choice
    
    case "$share_choice" in
        1)
            local twitter_text=$(echo "$share_text" | head -5 | tr '\n' ' ')
            local twitter_url="https://twitter.com/intent/tweet?text=$(echo "$twitter_text" | sed 's/ /%20/g' | sed 's/#/%23/g')"
            open_browser "$twitter_url"
            unlock_achievement "SOCIAL_BUTTERFLY"
            ;;
        2)
            local reddit_url="https://reddit.com/submit?title=Check%20out%20MDH_COMPRESSER&url=$GITHUB_REPO"
            open_browser "$reddit_url"
            unlock_achievement "SOCIAL_BUTTERFLY"
            ;;
        3)
            local linkedin_url="https://www.linkedin.com/sharing/share-offsite/?url=$GITHUB_REPO"
            open_browser "$linkedin_url"
            unlock_achievement "SOCIAL_BUTTERFLY"
            ;;
        4)
            if copy_to_clipboard "$share_text"; then
                print_success "Copied to clipboard!"
            else
                echo ""
                echo -e "$share_text"
                echo ""
            fi
            ;;
    esac
}

#===============================================================================
# SECTION 18: DONATION & SUPPORT
#===============================================================================

# Show donation menu
show_donation_menu() {
    clear_screen
    echo ""
    print_logo_compact
    echo ""
    
    print_double_box "💝 SUPPORT MDH_COMPRESSER" "$GOLD" 60
    echo ""
    echo -e "  ${NEON_CYAN}If you find this tool useful, consider supporting${RESET}"
    echo -e "  ${NEON_CYAN}the development with a small donation:${RESET}"
    echo ""
    
    echo -e "  ${GOLD}₿ Bitcoin (BTC):${RESET}"
    echo -e "  ${DIM}  ${BTC_WALLET}${RESET}"
    echo ""
    echo -e "  ${NEON_PURPLE}◈ Ethereum (ETH):${RESET}"
    echo -e "  ${DIM}  ${ETH_WALLET}${RESET}"
    echo ""
    echo -e "  ${NEON_GREEN}◎ Solana (SOL):${RESET}"
    echo -e "  ${DIM}  ${SOL_WALLET}${RESET}"
    echo ""
    
    print_line "─" "$DIM"
    echo ""
    echo -e "  ${NEON_CYAN}Other ways to support:${RESET}"
    echo -e "  ${DIM}• Star the repo on GitHub${RESET}"
    echo -e "  ${DIM}• Share with friends${RESET}"
    echo -e "  ${DIM}• Report bugs & suggest features${RESET}"
    echo ""
    echo -e "  ${NEON_CYAN}Contact:${RESET} ${NEON_GREEN}Telegram ${TELEGRAM}${RESET}"
    echo ""
    
    echo -e "  ${DIM}[1]${RESET} Copy BTC address"
    echo -e "  ${DIM}[2]${RESET} Copy ETH address"
    echo -e "  ${DIM}[3]${RESET} Copy SOL address"
    echo -e "  ${DIM}[4]${RESET} Open GitHub"
    echo -e "  ${DIM}[0]${RESET} Back"
    echo ""
    echo -ne "  ${NEON_CYAN}Choice: ${RESET}"
    read -r choice
    
    case "$choice" in
        1) copy_to_clipboard "$BTC_WALLET" && print_success "BTC address copied!" ;;
        2) copy_to_clipboard "$ETH_WALLET" && print_success "ETH address copied!" ;;
        3) copy_to_clipboard "$SOL_WALLET" && print_success "SOL address copied!" ;;
        4) open_browser "$GITHUB_REPO"; unlock_achievement "SUPPORTER" ;;
    esac
    
    sleep 1
}

#===============================================================================
# SECTION 19: UPDATE CHECKER
#===============================================================================

check_for_updates() {
    print_info "Checking for updates..."
    
    local latest=$(curl -s "https://api.github.com/repos/MDHojayfa/MDH_Compresser/releases/latest" 2>/dev/null | jq -r '.tag_name' 2>/dev/null)
    
    if [[ -z "$latest" ]] || [[ "$latest" == "null" ]]; then
        print_warning "Could not check for updates"
        return
    fi
    
    latest="${latest#v}"
    
    if [[ "$latest" != "$VERSION" ]]; then
        echo ""
        print_double_box "🆕 UPDATE AVAILABLE!" "$NEON_YELLOW" 50
        echo -e "  ${NEON_CYAN}Current:${RESET} v${VERSION}"
        echo -e "  ${NEON_GREEN}Latest:${RESET}  v${latest}"
        echo ""
        echo -e "  ${DIM}Run this command to update:${RESET}"
        echo -e "  ${NEON_GREEN}curl -sL ${GITHUB_REPO}/raw/main/install.sh | bash${RESET}"
        print_double_box_end "$NEON_YELLOW" 50
    else
        print_success "You have the latest version!"
    fi
}

#===============================================================================
# SECTION 20: MAIN MENU & ENTRY POINT
#===============================================================================

# Main menu
show_main_menu() {
    clear_screen
    echo ""
    print_logo_compact
    print_version_badge
    echo ""
    show_stats_bar
    echo ""
    
    print_double_box "🔥 MAIN MENU" "$NEON_GREEN" 60
    echo ""
    echo -e "  ${NEON_GREEN}[1]${RESET} 🗜️  ${NEON_CYAN}Compress${RESET}          ${DIM}│${RESET} 9 powerful modes"
    echo -e "  ${NEON_GREEN}[2]${RESET} 📦 ${NEON_CYAN}Extract${RESET}           ${DIM}│${RESET} Universal extractor"
    echo -e "  ${NEON_GREEN}[3]${RESET} 📤 ${NEON_CYAN}Transfer${RESET}          ${DIM}│${RESET} Share files instantly"
    echo -e "  ${NEON_GREEN}[4]${RESET} 📊 ${NEON_CYAN}Stats & Achievements${RESET}"
    echo -e "  ${NEON_GREEN}[5]${RESET} 💝 ${NEON_CYAN}Support/Donate${RESET}"
    echo -e "  ${NEON_GREEN}[6]${RESET} 🔄 ${NEON_CYAN}Check for Updates${RESET}"
    echo ""
    echo -e "  ${DIM}[0] Exit${RESET}"
    echo ""
    echo -ne "  ${NEON_CYAN}Select option: ${RESET}"
}

# Main program loop
main() {
    # Ensure directories exist
    mkdir -p "$INSTALL_DIR" "$LIB_DIR" "$CONFIG_DIR" "$BIN_DIR"
    
    # Initialize stats
    init_stats
    
    # Detect OS
    detect_os
    
    # Boot sequence (only on first run or fresh terminal)
    if [[ ! -f "/tmp/.mdh_booted_$$" ]]; then
        boot_sequence
        show_plea_message
        show_quote
        touch "/tmp/.mdh_booted_$$"
    fi
    
    # Main loop
    while true; do
        show_main_menu
        read -r choice
        
        case "$choice" in
            1) handle_compression ;;
            2) handle_extraction ;;
            3) handle_transfer ;;
            4) show_stats_menu ;;
            5) show_donation_menu ;;
            6) check_for_updates; sleep 2 ;;
            0|q|Q)
                clear_screen
                echo ""
                print_center "$NEON_GREEN" "Thank you for using MDH_COMPRESSER!"
                print_center "$DIM" "\"Keep calm and compress on.\""
                echo ""
                print_center "$GOLD" "— MDHojayfa"
                echo ""
                exit 0
                ;;
            *)
                print_error "Invalid option"
                sleep 1
                ;;
        esac
    done
}

#===============================================================================
# SECTION 21: INSTALLATION LOGIC
#===============================================================================

# Create the main executable
create_executable() {
    cat > "$MAIN_BINARY" << 'EXEC_EOF'
#!/bin/bash
# MDH_COMPRESSER Launcher
# This script sources the main library and runs the program

INSTALL_DIR="$HOME/.mdhcompresser"
source "$INSTALL_DIR/lib/main.sh"
main "$@"
EXEC_EOF
    
    chmod +x "$MAIN_BINARY"
}

# Install the tool
install_tool() {
    clear_screen
    echo ""
    print_logo
    print_version_badge
    echo ""
    
    print_double_box "🚀 INSTALLING MDH_COMPRESSER" "$NEON_GREEN" 60
    echo ""
    
    # Detect OS
    detect_os
    
    if [[ -z "$PKG_MANAGER" ]]; then
        print_error "Unsupported operating system!"
        exit 1
    fi
    
    # Install dependencies
    install_dependencies
    
    # Create directories
    print_step "Creating directories..."
    mkdir -p "$INSTALL_DIR" "$LIB_DIR" "$CONFIG_DIR" "$BIN_DIR"
    print_success "Directories created"
    
    # Write main library (this script becomes the library)
    print_step "Installing core modules..."
    
    # Copy this entire script as the main library
    cp "$0" "$LIB_DIR/main.sh"
    chmod +x "$LIB_DIR/main.sh"
    print_success "Core modules installed"
    
    # Create executable
    print_step "Creating executable..."
    create_executable
    print_success "Executable created"
    
    # Add to PATH
    print_step "Configuring PATH..."
    
    local shell_rc=""
    if [[ -f "$HOME/.bashrc" ]]; then
        shell_rc="$HOME/.bashrc"
    elif [[ -f "$HOME/.zshrc" ]]; then
        shell_rc="$HOME/.zshrc"
    elif [[ -f "$HOME/.profile" ]]; then
        shell_rc="$HOME/.profile"
    fi
    
    if [[ -n "$shell_rc" ]]; then
        if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$shell_rc" 2>/dev/null; then
            echo '' >> "$shell_rc"
            echo '# MDH_COMPRESSER' >> "$shell_rc"
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$shell_rc"
        fi
    fi
    
    export PATH="$HOME/.local/bin:$PATH"
    print_success "PATH configured"
    
    # Initialize stats
    print_step "Initializing gamification..."
    init_stats
    print_success "Gamification ready"
    
    # Complete!
    echo ""
    print_double_box "✅ INSTALLATION COMPLETE!" "$NEON_GREEN" 60
    echo ""
    echo -e "  ${NEON_GREEN}MDH_COMPRESSER v${VERSION} ${EDITION} is ready!${RESET}"
    echo ""
    echo -e "  ${NEON_CYAN}To start, run:${RESET}"
    echo -e "  ${NEON_GREEN}  mdhcompresser${RESET}"
    echo ""
    echo -e "  ${DIM}Or restart your terminal first if command not found.${RESET}"
    echo ""
    
    print_line "─" "$DIM"
    echo ""
    echo -e "  ${NEON_CYAN}Having issues? Check:${RESET}"
    echo -e "  ${NEON_GREEN}  ${GITHUB_README}${RESET}"
    echo ""
    echo -e "  ${NEON_CYAN}Contact:${RESET} ${NEON_GREEN}Telegram ${TELEGRAM}${RESET}"
    echo ""
    
    # Show plea message
    show_plea_message
    
    # Open GitHub
    echo -ne "  ${DIM}Opening GitHub profile...${RESET}"
    sleep 1
    open_browser "https://github.com/MDHojayfa"
    echo ""
    
    # Ask to run now
    echo ""
    echo -ne "  ${NEON_CYAN}Launch MDH_COMPRESSER now? [Y/n]: ${RESET}"
    read -r launch
    
    if [[ "${launch,,}" != "n" ]]; then
        main
    fi
}

#===============================================================================
# SCRIPT ENTRY POINT
#===============================================================================

# Check if being sourced or executed
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Being executed directly - run installer
    if [[ "$1" == "--run" ]] || [[ "$1" == "-r" ]]; then
        # Run main program directly
        main
    else
        # Run installer
        install_tool
    fi
fi
