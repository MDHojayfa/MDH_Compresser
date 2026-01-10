#!/bin/bash
#===============================================================================
#
#    ██████╗██╗  ██╗ █████╗  ██████╗ ███████╗    ███████╗██████╗ ██╗████████╗██╗ ██████╗ ███╗   ██╗
#   ██╔════╝██║  ██║██╔══██╗██╔═══██╗██╔════╝    ██╔════╝██╔══██╗██║╚══██╔══╝██║██╔═══██╗████╗  ██║
#   ██║     ███████║███████║██║   ██║███████╗    █████╗  ██║  ██║██║   ██║   ██║██║   ██║██╔██╗ ██║
#   ██║     ██╔══██║██╔══██║██║   ██║╚════██║    ██╔══╝  ██║  ██║██║   ██║   ██║██║   ██║██║╚██╗██║
#   ╚██████╗██║  ██║██║  ██║╚██████╔╝███████║    ███████╗██████╔╝██║   ██║   ██║╚██████╔╝██║ ╚████║
#    ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝    ╚══════╝╚═════╝ ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
#
#    ███╗   ███╗██████╗ ██╗  ██╗     ██████╗ ██████╗ ███╗   ███╗██████╗ ██████╗ ███████╗███████╗███████╗███████╗██████╗ 
#    ████╗ ████║██╔══██╗██║  ██║    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔══██╗
#    ██╔████╔██║██║  ██║███████║    ██║     ██║   ██║██╔████╔██║██████╔╝██████╔╝█████╗  ███████╗███████╗█████╗  ██████╔╝
#    ██║╚██╔╝██║██║  ██║██╔══██║    ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██╔══██╗██╔══╝  ╚════██║╚════██║██╔══╝  ██╔══██╗
#    ██║ ╚═╝ ██║██████╔╝██║  ██║    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ██║  ██║███████╗███████║███████║███████╗██║  ██║
#    ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
#
#===============================================================================
#
#    MDH_COMPRESSER v7.0 ULTIMATE CHAOS EDITION
#    ═══════════════════════════════════════════
#    THE MOST POWERFUL COMPRESSION SUITE EVER CREATED
#    
#    "We don't just compress files. We compress them to the theoretical limit.
#     This is not software. This is DIGITAL ALCHEMY."
#
#    ⚡ STORM ⚡ LIGHTNING ⚡ THUNDER ⚡ CHAOS ⚡ POWER ⚡
#
#    Author:     MDHojayfa
#    Telegram:   @Urniggar
#    GitHub:     https://github.com/MDHojayfa/MDH_Compresser
#    Website:    https://mdhojayfa.github.io/
#
#===============================================================================

# NOTE: Removed 'set -e' as it causes script to exit on any command failure
# which breaks compression operations silently

#===============================================================================
# SECTION 1: GLOBAL VARIABLES & CONFIGURATION
#===============================================================================

VERSION="7.0"
EDITION="ULTIMATE CHAOS EDITION"
CODENAME="STORM DRAGON"
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

# Ad links: Linkvertise 40%, Link-hub 40%, key.html 10%, homepage 10%
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

# Animation settings
ANIMATION_SPEED="fast"
CHAOS_MODE=true
ENABLE_SOUND=true

# Cross-platform temp directory
get_temp_dir() {
    local tmp="${TMPDIR:-/tmp}"
    [[ ! -d "$tmp" ]] && tmp="$HOME/.cache"
    [[ ! -d "$tmp" ]] && tmp="$HOME"
    mkdir -p "$tmp" 2>/dev/null
    echo "$tmp"
}
TEMP_DIR="$(get_temp_dir)"

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
STRIKE='\033[9m'

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

# High Intensity Colors (NEON)
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

# High Intensity Backgrounds
BG_NEON_GREEN='\033[102m'
BG_NEON_RED='\033[101m'
BG_NEON_YELLOW='\033[103m'
BG_NEON_BLUE='\033[104m'
BG_NEON_PURPLE='\033[105m'
BG_NEON_CYAN='\033[106m'
BG_NEON_WHITE='\033[107m'

# Custom Theme Colors
PRIMARY="$NEON_GREEN"
SECONDARY="$NEON_PURPLE"
ACCENT="$NEON_CYAN"
DANGER="$NEON_RED"
WARNING="$NEON_YELLOW"
GOLD='\033[1;33m'
FIRE='\033[1;91m'
ICE='\033[1;96m'
SHADOW="$DIM"
ELECTRIC='\033[1;93m'

# Rainbow array for effects
RAINBOW=("$NEON_RED" "$NEON_YELLOW" "$NEON_GREEN" "$NEON_CYAN" "$NEON_BLUE" "$NEON_PURPLE")

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

# Terminal bell (beep)
beep() {
    [[ "$ENABLE_SOUND" == true ]] && echo -ne "\007"
}

# Double beep for achievements
achievement_sound() {
    if [[ "$ENABLE_SOUND" == true ]]; then
        echo -ne "\007"
        sleep 0.15
        echo -ne "\007"
    fi
}

# Screen flash effect
screen_flash() {
    local color="${1:-$BG_WHITE}"
    echo -ne "${color}"
    clear_screen
    sleep 0.08
    echo -ne "${RESET}"
    clear_screen
}

# Screen shake effect (simulated)
screen_shake() {
    local intensity="${1:-3}"
    for (( i=0; i<intensity; i++ )); do
        echo -ne "\033[1;1H"  # Move to top
        sleep 0.02
        echo -ne "\033[2;1H"  # Shift down
        sleep 0.02
    done
}

# Random color from rainbow
random_rainbow() {
    echo "${RAINBOW[$((RANDOM % ${#RAINBOW[@]}))]}"
}

#===============================================================================
# SECTION 4: ADVANCED UI HELPER FUNCTIONS
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

# Typewriter effect
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

# Typewriter effect (centered)
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

# Rainbow typewriter effect
rainbow_typewriter() {
    local text="$1"
    local delay="${2:-0.03}"
    get_terminal_size
    local text_len=${#text}
    local padding=$(( (TERM_COLS - text_len) / 2 ))
    printf "%*s" $padding ""
    for (( i=0; i<${#text}; i++ )); do
        local color="${RAINBOW[$((i % ${#RAINBOW[@]}))]}"
        echo -ne "${color}${text:$i:1}${RESET}"
        sleep "$delay"
    done
    echo ""
}

# Glitch text effect - ULTRA ENHANCED with screen corruption
glitch_text() {
    local text="$1"
    local iterations="${2:-10}"
    local glitch_chars='!@#$%^&*<>?/\|{}[]~`░▒▓█▄▀■□▪▫╬╠╣╦╩'
    
    get_terminal_size
    hide_cursor
    
    for (( iter=0; iter<iterations; iter++ )); do
        local glitched=""
        local glitch_intensity=$((RANDOM % 4 + 2))
        
        for (( i=0; i<${#text}; i++ )); do
            if (( RANDOM % glitch_intensity == 0 )); then
                local idx=$(( RANDOM % ${#glitch_chars} ))
                glitched+="${glitch_chars:$idx:1}"
            else
                glitched+="${text:$i:1}"
            fi
        done
        
        local color=$(random_rainbow)
        
        # Clear line and print glitched text
        echo -ne "\r"
        printf "%*s" $TERM_COLS ""
        echo -ne "\r"
        printf "%*s" $(( (TERM_COLS - ${#text}) / 2 )) ""
        echo -ne "${color}${glitched}${RESET}"
        
        # Heavy screen corruption - multiple points
        for (( c=0; c<5; c++ )); do
            if (( RANDOM % 3 == 0 )); then
                local corrupt_row=$((RANDOM % TERM_ROWS + 1))
                local corrupt_col=$((RANDOM % TERM_COLS + 1))
                move_cursor $corrupt_row $corrupt_col
                echo -ne "$(random_rainbow)${glitch_chars:$((RANDOM % ${#glitch_chars})):1}${RESET}"
            fi
        done
        
        # Occasional screen flash
        if (( RANDOM % 8 == 0 )); then
            echo -ne "${REVERSE}"
            sleep 0.02
            echo -ne "${RESET}"
        fi
        
        sleep 0.05
    done
    
    # Clear screen of corruption
    clear_screen
    
    # Final reveal with electric effect
    get_terminal_size
    local row=$((TERM_ROWS / 2))
    local col=$(( (TERM_COLS - ${#text}) / 2 ))
    
    move_cursor $row $col
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${NEON_GREEN}${text:$i:1}${RESET}"
        if (( RANDOM % 3 == 0 )); then
            echo -ne "${ELECTRIC}⚡${RESET}"
            sleep 0.01
            echo -ne "\b "
            echo -ne "\b"
        fi
        sleep 0.02
    done
    echo ""
    
    show_cursor
}

# Massive glitch effect (full screen corruption)
chaos_glitch() {
    local duration="${1:-2}"
    local end_time=$((SECONDS + duration))
    local glitch_chars='!@#$%^&*░▒▓█▄▀╔╗╚╝║═╬╠╣╦╩■□'
    
    get_terminal_size
    hide_cursor
    
    while (( SECONDS < end_time )); do
        for (( g=0; g<10; g++ )); do
            local row=$((RANDOM % TERM_ROWS + 1))
            local col=$((RANDOM % TERM_COLS + 1))
            local color=$(random_rainbow)
            move_cursor $row $col
            echo -ne "${color}${glitch_chars:$((RANDOM % ${#glitch_chars})):1}${RESET}"
        done
        sleep 0.02
    done
    
    show_cursor
}

# Print horizontal line with style
print_line() {
    local char="${1:-═}"
    local color="${2:-$PRIMARY}"
    get_terminal_size
    echo -ne "$color"
    printf '%*s\n' "$TERM_COLS" '' | tr ' ' "$char"
    echo -ne "$RESET"
}

# Electric line (animated)
electric_line() {
    local color="${1:-$ELECTRIC}"
    get_terminal_size
    local chars=('─' '═' '━' '▬' '≡' '⚡')
    
    for (( i=0; i<TERM_COLS; i++ )); do
        local char="${chars[$((RANDOM % ${#chars[@]}))]}"
        echo -ne "${color}${char}${RESET}"
        sleep 0.005
    done
    echo ""
}

# Print box with shadow
print_shadow_box() {
    local text="$1"
    local color="${2:-$PRIMARY}"
    local width="${3:-60}"
    local padding=$(( (width - ${#text} - 2) / 2 ))
    
    echo ""
    echo -e "${color}  ┌$(printf '─%.0s' $(seq 1 $width))┐${RESET}"
    echo -e "${color}  │$(printf ' %.0s' $(seq 1 $padding))${text}$(printf ' %.0s' $(seq 1 $((width - padding - ${#text}))))│${RESET}${DIM}░░${RESET}"
    echo -e "${color}  └$(printf '─%.0s' $(seq 1 $width))┘${RESET}${DIM}░░${RESET}"
    echo -e "${DIM}    $(printf '░%.0s' $(seq 1 $((width))))${RESET}"
}

# Print double-line box - outputs go wherever the caller redirects
print_double_box() {
    local title="$1"
    local color="${2:-$PRIMARY}"
    local width="${3:-60}"
    
    echo -e "${color}  ╔$(printf '═%.0s' $(seq 1 $width))╗${RESET}"
    if [[ -n "$title" ]]; then
        local padding=$(( (width - ${#title}) / 2 ))
        echo -e "${color}  ║$(printf ' %.0s' $(seq 1 $padding))${NEON_WHITE}${title}${color}$(printf ' %.0s' $(seq 1 $((width - padding - ${#title}))))║${RESET}"
        echo -e "${color}  ╠$(printf '═%.0s' $(seq 1 $width))╣${RESET}"
    fi
}

print_double_box_line() {
    local text="$1"
    local color="${2:-$PRIMARY}"
    local width="${3:-60}"
    local text_clean=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local padding=$((width - ${#text_clean}))
    [[ $padding -lt 0 ]] && padding=0
    echo -e "${color}  ║${RESET} ${text}$(printf ' %.0s' $(seq 1 $padding))${color}║${RESET}"
}

print_double_box_end() {
    local color="${1:-$PRIMARY}"
    local width="${2:-60}"
    echo -e "${color}  ╚$(printf '═%.0s' $(seq 1 $width))╝${RESET}"
}

# Neon glow box
print_neon_box() {
    local text="$1"
    local color="${2:-$NEON_CYAN}"
    local glow="${3:-$DIM}"
    local width="${4:-50}"
    local padding=$(( (width - ${#text}) / 2 ))
    
    echo ""
    echo -e "${glow}  ▄$(printf '▄%.0s' $(seq 1 $width))▄${RESET}"
    echo -e "${color}  █$(printf ' %.0s' $(seq 1 $padding))${NEON_WHITE}${BOLD}${text}${RESET}${color}$(printf ' %.0s' $(seq 1 $((width - padding - ${#text}))))█${RESET}"
    echo -e "${glow}  ▀$(printf '▀%.0s' $(seq 1 $width))▀${RESET}"
    echo ""
}

# Fire box (for warnings)
print_fire_box() {
    local text="$1"
    local width="${2:-50}"
    local padding=$(( (width - ${#text}) / 2 ))
    
    echo ""
    echo -e "${FIRE}  🔥$(printf '═%.0s' $(seq 1 $((width-2))))🔥${RESET}"
    echo -e "${FIRE}  ║$(printf ' %.0s' $(seq 1 $padding))${BLINK}${text}${RESET}${FIRE}$(printf ' %.0s' $(seq 1 $((width - padding - ${#text}))))║${RESET}"
    echo -e "${FIRE}  🔥$(printf '═%.0s' $(seq 1 $((width-2))))🔥${RESET}"
    echo ""
}

#===============================================================================
# SECTION 5: LOADING BAR ANIMATIONS (5+ STYLES)
#===============================================================================

# Style 1: Classic progress bar
loading_bar_classic() {
    local duration="${1:-3}"
    local text="${2:-Loading}"
    local width=50
    local steps=$((duration * 10))
    
    for (( i=0; i<=steps; i++ )); do
        local progress=$((i * width / steps))
        local percent=$((i * 100 / steps))
        
        echo -ne "\r  ${PRIMARY}${text} ${RESET}["
        
        # Gradient color
        if (( percent < 33 )); then
            echo -ne "${NEON_RED}"
        elif (( percent < 66 )); then
            echo -ne "${NEON_YELLOW}"
        else
            echo -ne "${NEON_GREEN}"
        fi
        
        printf '█%.0s' $(seq 1 $progress 2>/dev/null) 2>/dev/null
        echo -ne "${DIM}"
        printf '░%.0s' $(seq 1 $((width - progress)) 2>/dev/null) 2>/dev/null
        echo -ne "${RESET}] ${NEON_CYAN}${percent}%%${RESET}"
        
        sleep 0.05
    done
    echo -e " ${NEON_GREEN}✓${RESET}"
}

# Style 2: Cyber loading bar with particles
loading_bar_cyber() {
    local duration="${1:-2}"
    local text="${2:-Processing}"
    local width=40
    local steps=$((duration * 10))
    local particles=('⣾' '⣽' '⣻' '⢿' '⡿' '⣟' '⣯' '⣷')
    
    for (( i=0; i<=steps; i++ )); do
        local progress=$((i * width / steps))
        local percent=$((i * 100 / steps))
        local particle="${particles[$((i % ${#particles[@]}))]}"
        
        echo -ne "\r  ${NEON_PURPLE}${particle}${RESET} ${ACCENT}${text}${RESET} "
        echo -ne "${PRIMARY}▐${RESET}"
        
        for (( j=0; j<width; j++ )); do
            if (( j < progress )); then
                if (( j == progress - 1 )); then
                    echo -ne "${NEON_CYAN}▓${RESET}"
                else
                    echo -ne "${NEON_GREEN}█${RESET}"
                fi
            else
                echo -ne "${DIM}░${RESET}"
            fi
        done
        
        echo -ne "${PRIMARY}▌${RESET} ${NEON_YELLOW}${percent}%%${RESET}"
        
        sleep 0.05
    done
    echo -e " ${NEON_GREEN}⚡${RESET}"
}

# Style 3: Matrix-style loading
loading_bar_matrix() {
    local duration="${1:-2}"
    local text="${2:-Hacking}"
    local width=35
    local steps=$((duration * 10))
    local matrix_chars=('0' '1' 'ア' 'イ' 'ウ' 'エ' 'オ' '力' 'キ' 'ク')
    
    for (( i=0; i<=steps; i++ )); do
        local progress=$((i * width / steps))
        local percent=$((i * 100 / steps))
        
        echo -ne "\r  ${NEON_GREEN}${text}${RESET} ║"
        
        for (( j=0; j<width; j++ )); do
            if (( j < progress )); then
                local char="${matrix_chars[$((RANDOM % ${#matrix_chars[@]}))]}"
                echo -ne "${NEON_GREEN}${char}${RESET}"
            else
                echo -ne "${DIM}·${RESET}"
            fi
        done
        
        echo -ne "║ ${NEON_GREEN}${percent}%%${RESET}"
        
        sleep 0.05
    done
    echo -e " ${NEON_GREEN}[DONE]${RESET}"
}

# Style 4: Fire loading bar
loading_bar_fire() {
    local duration="${1:-2}"
    local text="${2:-Igniting}"
    local width=40
    local steps=$((duration * 10))
    local fire_chars=('░' '▒' '▓' '█')
    
    for (( i=0; i<=steps; i++ )); do
        local progress=$((i * width / steps))
        local percent=$((i * 100 / steps))
        
        echo -ne "\r  ${FIRE}🔥 ${text}${RESET} ["
        
        for (( j=0; j<width; j++ )); do
            if (( j < progress )); then
                local intensity=$((RANDOM % 4))
                local colors=("$NEON_RED" "$NEON_YELLOW" "$GOLD" "$FIRE")
                echo -ne "${colors[$intensity]}${fire_chars[$intensity]}${RESET}"
            else
                echo -ne "${DIM}·${RESET}"
            fi
        done
        
        echo -ne "] ${FIRE}${percent}%%${RESET}"
        
        sleep 0.05
    done
    echo -e " ${FIRE}🔥${RESET}"
}

# Style 5: Electric/Thunder loading bar
loading_bar_electric() {
    local duration="${1:-2}"
    local text="${2:-Charging}"
    local width=40
    local steps=$((duration * 10))
    
    for (( i=0; i<=steps; i++ )); do
        local progress=$((i * width / steps))
        local percent=$((i * 100 / steps))
        
        echo -ne "\r  ${ELECTRIC}⚡ ${text}${RESET} ⟦"
        
        for (( j=0; j<width; j++ )); do
            if (( j < progress )); then
                if (( RANDOM % 5 == 0 )); then
                    echo -ne "${NEON_WHITE}⚡${RESET}"
                else
                    echo -ne "${ELECTRIC}▰${RESET}"
                fi
            else
                echo -ne "${DIM}▱${RESET}"
            fi
        done
        
        echo -ne "⟧ ${ELECTRIC}${percent}%%${RESET}"
        
        sleep 0.05
    done
    echo -e " ${ELECTRIC}⚡${RESET}"
}

# Spinner animation
spinner() {
    local pid=$1
    local delay=0.08
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    
    while kill -0 "$pid" 2>/dev/null; do
        for (( i=0; i<${#spinstr}; i++ )); do
            echo -ne "\r  ${NEON_CYAN}${spinstr:$i:1}${RESET} "
            sleep $delay
        done
    done
    echo -ne "\r  ${NEON_GREEN}✓${RESET} "
}

# Advanced spinner with text
spinner_text() {
    local text="$1"
    local duration="${2:-3}"
    local end_time=$((SECONDS + duration))
    local spinstr='⣾⣽⣻⢿⡿⣟⣯⣷'
    local i=0
    
    while (( SECONDS < end_time )); do
        echo -ne "\r  ${NEON_PURPLE}${spinstr:$((i % ${#spinstr})):1}${RESET} ${ACCENT}${text}${RESET}   "
        sleep 0.08
        ((i++))
    done
    echo -e "\r  ${NEON_GREEN}✓${RESET} ${text}      "
}

# Print status messages
print_success() {
    echo -e "  ${NEON_GREEN}[✓]${RESET} $1"
}

print_error() {
    echo -e "  ${NEON_RED}[✗]${RESET} $1"
    echo -e "  ${DIM}    For help, visit: ${ACCENT}${GITHUB_README}${RESET}"
}

print_warning() {
    echo -e "  ${NEON_YELLOW}[!]${RESET} $1"
}

print_info() {
    echo -e "  ${NEON_CYAN}[*]${RESET} $1"
}

print_step() {
    echo -e "  ${NEON_PURPLE}[→]${RESET} $1"
}

print_fire() {
    echo -e "  ${FIRE}[🔥]${RESET} $1"
}

print_electric() {
    echo -e "  ${ELECTRIC}[⚡]${RESET} $1"
}

#===============================================================================
# SECTION 6: MASSIVE ASCII ART LIBRARY
#===============================================================================

# Main MDH_COMPRESSER Logo - MASSIVE VERSION
print_logo_massive() {
    echo ""
    echo -e "${NEON_GREEN}"
    cat << 'EOF'
    ███╗   ███╗██████╗ ██╗  ██╗         ██████╗ ██████╗ ███╗   ███╗██████╗ ██████╗ ███████╗███████╗███████╗███████╗██████╗ 
    ████╗ ████║██╔══██╗██║  ██║        ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔══██╗
    ██╔████╔██║██║  ██║███████║        ██║     ██║   ██║██╔████╔██║██████╔╝██████╔╝█████╗  ███████╗███████╗█████╗  ██████╔╝
    ██║╚██╔╝██║██║  ██║██╔══██║        ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██╔══██╗██╔══╝  ╚════██���╚════██║██╔══╝  ██╔══██╗
    ██║ ╚═╝ ██║██████╔╝██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ██║  ██║███████╗███████║███████║███████╗██║  ██║
    ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
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

# Animated logo with glow
print_logo_animated() {
    local colors=("$NEON_GREEN" "$NEON_CYAN" "$NEON_PURPLE" "$NEON_GREEN")
    
    for color in "${colors[@]}"; do
        clear_screen
        echo ""
        echo -e "${color}"
        cat << 'EOF'
    ███╗   ███╗██████╗ ██╗  ██╗         ██████╗ ██████╗ ███╗   ███╗██████╗ 
    ████╗ ████║██╔══██╗██║  ██║        ██╔════╝██╔═══██╗████╗ ████║██╔══██╗
    ██╔████╔██║██║  ██║███████║        ██║     ██║   ██║██╔████╔██║██████╔╝
    ██║╚██╔╝██║██║  ██║██╔══██║        ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ 
    ██║ ╚═╝ ██║██████╔╝██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     
    ╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     
EOF
        echo -e "${RESET}"
        sleep 0.15
    done
}

# MASSIVE Skull ASCII art
print_skull_massive() {
    echo -e "${NEON_RED}"
    cat << 'EOF'
                            ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
                        ░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░░
                      ░░▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▓▓░░
                    ░░▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓░░
                  ░░▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓░░
                ░░▓▓░░░░░░████████░░░░░░░░░░░░░░░░░░░░████████░░░░░░░░░░▓▓░░
                ░░▓▓░░░░██        ██░░░░░░░░░░░░░░░░██        ██░░░░░░░░▓▓░░
                ░░▓▓░░░░██  ████  ██░░░░░░░░░░░░░░░░██  ████  ██░░░░░░░░▓▓░░
                ░░▓▓░░░░██  ████  ██░░░░░░░░░░░░░░░░██  ████  ██░░░░░░░░▓▓░░
                ░░▓▓░░░░██        ██░░░░░░████░░░░░░██        ██░░░░░░░░▓▓░░
                  ░░▓▓░░░░████████░░░░░░██    ██░░░░░░████████░░░░░░░░▓▓░░
                  ░░▓▓░░░░░░░░░░░░░░░░░░░░████░░░░░░░░░░░░░░░░░░░░░░▓▓░░
                    ░░▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓░░
                    ░░▓▓░░░░████░░████░░████░░████░░████░░████░░▓▓░░
                      ░░▓▓░░██░░░░██░░░░██░░░░██░░░░██░░░░██░░▓▓░░
                        ░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░
                            ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
                              ☠️  T H E   Z O N E  ☠️
EOF
    echo -e "${RESET}"
}

# Compact skull for inline
print_skull() {
    echo -e "${NEON_RED}"
    cat << 'EOF'
              ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
           ▄█░░░░░░░░░░░░░░░░░█▄
          █░░░░░░░░░░░░░░░░░░░░░█
         █░░░░░░░░░░░░░░░░░░░░░░░█
        █░░░████░░░░░░░░░░████░░░░█
        █░░█▀▀▀▀█░░░░░░░░█▀▀▀▀█░░░█
        █░░█░██░█░░░░░░░░█░██░█░░░█
        █░░░████░░░████░░░████░░░░█
         █░░░░░░░██    ██░░░░░░░░█
         █░░░░░░░░░████░░░░░░░░░░█
          █░██░██░░░░░░░░██░██░░█
           █░██░██░██░██░██░██░█
            ▀█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█▀
EOF
    echo -e "${RESET}"
}

# MASSIVE Dragon ASCII art
print_dragon_massive() {
    echo -e "${NEON_PURPLE}"
    cat << 'EOF'
                                                                           /===-_---~~~~~~~~~------____
                                                                          |===-~___                _,-'
                                           -==\\                          `//~\\   ~~~~`---.___.-~~
                                       ______-==|                          | |  \\           _-~`
                                  __--~~~  ,-/-==\\                        | |   `\        ,'
                              _-~       /'    |  \\                       / /      \      /
                            .'        /       |   \\                     /' /        \   /'
                           /  ____  /         |    \`._____/-~~~-.     /' /          \/'
                          /-'~    ~~~~~---__  |     ~-_/        /`-'_/' /           /
                                            \_|       \         \    ~\~`/          /
                                              '        \         ~\    \-'         /'
                                                        \         \\   /`\         /
                                              _. - ~ ~ -_\        \ \ /   `\     /`
                                           .-~            ~-.      \//      /\  /~`
                                           /                 \    .-~/     /  \/'
                                          {        }   /(   )  \  //~` /`\/
                                          |          /`  `--~   \~//  /`\/ 
                                           \       /            \//  /`\/
                                             `-.__/               \\/
                                               /_._          MDH   \\
                                              // \\  DRAGON   -    \}
                                             //   \\    ZONE   /~\  |
                                            (|     |)         {   } |
                                            |\\   /|          |   | |
                                            | \\_/ |          |   | |
                                             \_____/          |   | |
                                                             {    } {
                                                              \___/\)
EOF
    echo -e "${RESET}"
}

# Smaller dragon
print_dragon() {
    echo -e "${NEON_PURPLE}"
    cat << 'EOF'
                                   __      _
                                 .'  '-,_,-'  `.
                                (   .-'   '-.  )  
                               .'  /   MDH   \  '.
                              /   /   ZONE    \   \
                             /   /   DRAGON    \   \
                            |  .'  '-.___.-'  '.   |
                            |  |              |   |
                             \  \  ,-'¯'-.   /   /
                              \  \'        '/   /
                               '.  '-.__,-'   .'
                                 '-._    _.-'
                                     ''''
EOF
    echo -e "${RESET}"
}

# Lightning bolt
print_lightning() {
    echo -e "${ELECTRIC}"
    cat << 'EOF'
           ⚡⚡⚡
          ██████
         ████████
        ██████
       ████████
      ██████
     ████████████
        ████████
       ██████
      ████████
     ██████
    ████
   ██
EOF
    echo -e "${RESET}"
}

# Fire effect ASCII
print_fire_art() {
    echo -e "${FIRE}"
    cat << 'EOF'
                      (  .      )
                  )           (              )
                        .  '   .   '  .  '  .
               (    , )       (.   )  (   ',    )
                .' ) ( . )    ,  ( ,     )   ( .
             ). , ( .   (  ) ( , ')  .' (  ,    )
            (_,_._._._)_(._.__)_.__._)_._._)__._)
            ██████████████████████████████████████
EOF
    echo -e "${RESET}"
}

# Version badge - ENHANCED
print_version_badge() {
    echo ""
    echo -e "${DIM}  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${RESET}"
    echo -e "${DIM}  ░${RESET} ${NEON_CYAN}╔════════════════════════════════════════════════════════════════════════╗${RESET} ${DIM}░${RESET}"
    echo -e "${DIM}  ░${RESET} ${NEON_CYAN}║${RESET}  ${FIRE}🔥${RESET} ${NEON_GREEN}v${VERSION}${RESET} ${NEON_PURPLE}${BOLD}${EDITION}${RESET}             ${ELECTRIC}⚡${RESET} ${DIM}by${RESET} ${GOLD}${AUTHOR}${RESET} ${FIRE}🔥${RESET}  ${NEON_CYAN}║${RESET} ${DIM}░${RESET}"
    echo -e "${DIM}  ░${RESET} ${NEON_CYAN}║${RESET}  ${DIM}Codename: ${NEON_RED}${CODENAME}${RESET}                                              ${NEON_CYAN}║${RESET} ${DIM}░${RESET}"
    echo -e "${DIM}  ░${RESET} ${NEON_CYAN}╚════════════════════════════════════════════════════════════════════════╝${RESET} ${DIM}░${RESET}"
    echo -e "${DIM}  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${RESET}"
}

#===============================================================================
# SECTION 7: MATRIX RAIN ANIMATION
#===============================================================================

# Matrix rain - Classic hacker effect
matrix_rain() {
    local duration="${1:-5}"
    local end_time=$((SECONDS + duration))
    
    get_terminal_size
    hide_cursor
    clear_screen
    
    local chars='アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()'
    
    # Initialize drops
    declare -a drops
    for (( i=0; i<TERM_COLS; i++ )); do
        drops[$i]=$((RANDOM % TERM_ROWS))
    done
    
    while (( SECONDS < end_time )); do
        for (( i=0; i<TERM_COLS; i++ )); do
            local y=${drops[$i]}
            local char_idx=$((RANDOM % ${#chars}))
            local char="${chars:$char_idx:1}"
            
            # Draw character at current position
            move_cursor $y $i
            
            # Head of the drop is bright
            if (( RANDOM % 3 == 0 )); then
                echo -ne "${NEON_WHITE}${char}${RESET}"
            else
                echo -ne "${NEON_GREEN}${char}${RESET}"
            fi
            
            # Fade trail
            if (( y > 0 )); then
                move_cursor $((y - 1)) $i
                local trail_char="${chars:$((RANDOM % ${#chars})):1}"
                echo -ne "${GREEN}${trail_char}${RESET}"
            fi
            
            if (( y > 1 )); then
                move_cursor $((y - 2)) $i
                echo -ne "${DIM}${GREEN}${chars:$((RANDOM % ${#chars})):1}${RESET}"
            fi
            
            # Reset drop or move down
            if (( y >= TERM_ROWS )) || (( RANDOM % 20 == 0 )); then
                drops[$i]=0
            else
                drops[$i]=$((y + 1))
            fi
        done
        
        sleep 0.03
    done
    
    show_cursor
    clear_screen
}

#===============================================================================
# SECTION 8: ULTIMATE STORM ANIMATION WITH LIGHTNING
#===============================================================================

# Thunder storm with HEAVY rain and INTENSE lightning
storm_animation_ultimate() {
    local duration="${1:-5}"
    local end_time=$((SECONDS + duration))
    
    get_terminal_size
    hide_cursor
    clear_screen
    
    # Enhanced rain characters
    local rain_chars=('│' '┃' '║' '|' '¦' '┆' '┇' '┊' '┋' '╿' '╽')
    local splash_chars=('∙' '·' '.' '°' '˙' '✦' '✧')
    
    # Initialize HEAVY rain drops (more drops = heavier rain)
    local num_drops=$((TERM_COLS * 2))
    declare -a drops_x drops_y drops_speed drops_char drops_bright
    
    for (( i=0; i<num_drops; i++ )); do
        drops_x[$i]=$((RANDOM % TERM_COLS + 1))
        drops_y[$i]=$((RANDOM % TERM_ROWS))
        drops_speed[$i]=$((RANDOM % 4 + 2))
        drops_char[$i]=${rain_chars[$((RANDOM % ${#rain_chars[@]}))]}
        drops_bright[$i]=$((RANDOM % 2))
    done
    
    local lightning_cooldown=0
    local thunder_rumble=0
    
    while (( SECONDS < end_time )); do
        # INTENSE LIGHTNING - More frequent!
        if (( RANDOM % 8 == 0 )) && (( lightning_cooldown <= 0 )); then
            # MEGA FLASH - Multiple flashes
            for flash in 1 2; do
                echo -ne "${BG_NEON_WHITE}"
                clear_screen
                beep
                sleep 0.03
                echo -ne "${RESET}"
                clear_screen
                sleep 0.02
            done
            
            # Draw dramatic lightning bolt
            local bolt_x=$((RANDOM % (TERM_COLS - 30) + 15))
            local bolt_colors=("$NEON_WHITE" "$ELECTRIC" "$NEON_CYAN")
            
            for (( ly=1; ly<TERM_ROWS-5; ly++ )); do
                local color="${bolt_colors[$((RANDOM % 3))]}"
                local offset=$((RANDOM % 5 - 2))
                bolt_x=$((bolt_x + offset))
                [[ $bolt_x -lt 5 ]] && bolt_x=5
                [[ $bolt_x -gt $((TERM_COLS - 5)) ]] && bolt_x=$((TERM_COLS - 5))
                
                move_cursor $ly $bolt_x
                
                # Wider lightning
                if (( RANDOM % 2 == 0 )); then
                    echo -ne "${color}████${RESET}"
                else
                    echo -ne "${color}██${RESET}"
                fi
                
                # Branch lightning
                if (( RANDOM % 4 == 0 )); then
                    local branch_dir=$((RANDOM % 2 * 2 - 1))
                    move_cursor $ly $((bolt_x + branch_dir * 4))
                    echo -ne "${color}██${RESET}"
                fi
            done
            
            sleep 0.12
            lightning_cooldown=5
            thunder_rumble=3
            
            # Screen shake after lightning
            screen_shake 5
        fi
        
        lightning_cooldown=$((lightning_cooldown - 1))
        [[ $lightning_cooldown -lt 0 ]] && lightning_cooldown=0
        
        # Thunder rumble effect (screen dim flicker)
        if (( thunder_rumble > 0 )); then
            if (( RANDOM % 2 == 0 )); then
                echo -ne "${DIM}"
            fi
            thunder_rumble=$((thunder_rumble - 1))
        fi
        
        # Draw HEAVY rain
        for (( i=0; i<num_drops; i++ )); do
            # Clear old position
            if (( drops_y[$i] > 0 && drops_y[$i] < TERM_ROWS )); then
                move_cursor ${drops_y[$i]} ${drops_x[$i]}
                echo -n " "
            fi
            
            # Update position
            drops_y[$i]=$((drops_y[$i] + drops_speed[$i]))
            
            # Wind effect - push drops right
            if (( RANDOM % 10 == 0 )); then
                drops_x[$i]=$((drops_x[$i] + 1))
            fi
            
            # Reset if off screen
            if (( drops_y[$i] >= TERM_ROWS )) || (( drops_x[$i] > TERM_COLS )); then
                drops_y[$i]=1
                drops_x[$i]=$((RANDOM % TERM_COLS + 1))
                drops_speed[$i]=$((RANDOM % 4 + 2))
                
                # Add splash at bottom
                if (( RANDOM % 3 == 0 )); then
                    local splash_x=${drops_x[$i]}
                    local splash_char="${splash_chars[$((RANDOM % ${#splash_chars[@]}))]}"
                    move_cursor $((TERM_ROWS - 1)) $splash_x
                    echo -ne "${NEON_CYAN}${splash_char}${RESET}"
                fi
            fi
            
            # Draw new position
            if (( drops_y[$i] > 0 && drops_y[$i] < TERM_ROWS && drops_x[$i] > 0 && drops_x[$i] <= TERM_COLS )); then
                move_cursor ${drops_y[$i]} ${drops_x[$i]}
                
                # Depth-based color
                if (( drops_speed[$i] >= 4 )); then
                    echo -ne "${NEON_CYAN}${drops_char[$i]}${RESET}"
                elif (( drops_speed[$i] >= 3 )); then
                    echo -ne "${CYAN}${drops_char[$i]}${RESET}"
                else
                    echo -ne "${DIM}${CYAN}${drops_char[$i]}${RESET}"
                fi
            fi
        done
        
        # Add horizontal wind/rain streaks
        for (( w=0; w<8; w++ )); do
            local wx=$((RANDOM % (TERM_COLS - 5) + 1))
            local wy=$((RANDOM % TERM_ROWS + 1))
            move_cursor $wy $wx
            echo -ne "${DIM}${CYAN}──${RESET}"
        done
        
        echo -ne "${RESET}"
        sleep 0.02
    done
    
    # Final dramatic flash
    screen_flash "${BG_WHITE}"
    
    show_cursor
    clear_screen
}

#===============================================================================
# SECTION 9: CYCLONE VORTEX ANIMATION
#===============================================================================

# Cyclone spiral animation (simplified - no bc dependency)
cyclone_animation_ultimate() {
    local duration="${1:-4}"
    local end_time=$((SECONDS + duration))
    
    get_terminal_size
    hide_cursor
    clear_screen
    
    local center_x=$((TERM_COLS / 2))
    local center_y=$((TERM_ROWS / 2))
    local spiral_chars=('◐' '◓' '◑' '◒' '●' '○' '◉' '◎' '⊙' '⊚' '❂' '✺' '✹' '★')
    local frame=0
    
    # Pre-calculated spiral offsets (no bc needed)
    local offsets_x=(-2 -1 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
    local offsets_y=(-1 0 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9)
    
    while (( SECONDS < end_time )); do
        # Draw expanding rings
        for (( ring=1; ring<=8; ring++ )); do
            local radius=$((ring * 2 + frame % 3))
            
            # Draw points around the ring using simple patterns
            for (( p=0; p<12; p++ )); do
                # Simple circular approximation
                local px py
                case $((p % 12)) in
                    0)  px=$((center_x + radius)); py=$center_y ;;
                    1)  px=$((center_x + radius - radius/3)); py=$((center_y - radius/2)) ;;
                    2)  px=$((center_x + radius/3)); py=$((center_y - radius + radius/4)) ;;
                    3)  px=$center_x; py=$((center_y - radius)) ;;
                    4)  px=$((center_x - radius/3)); py=$((center_y - radius + radius/4)) ;;
                    5)  px=$((center_x - radius + radius/3)); py=$((center_y - radius/2)) ;;
                    6)  px=$((center_x - radius)); py=$center_y ;;
                    7)  px=$((center_x - radius + radius/3)); py=$((center_y + radius/2)) ;;
                    8)  px=$((center_x - radius/3)); py=$((center_y + radius - radius/4)) ;;
                    9)  px=$center_x; py=$((center_y + radius)) ;;
                    10) px=$((center_x + radius/3)); py=$((center_y + radius - radius/4)) ;;
                    11) px=$((center_x + radius - radius/3)); py=$((center_y + radius/2)) ;;
                esac
                
                # Add rotation offset
                px=$((px + (frame % 5) - 2))
                py=$((py + (frame % 3) - 1))
                
                if (( px > 0 && px < TERM_COLS && py > 0 && py < TERM_ROWS )); then
                    move_cursor $py $px
                    local char_idx=$(( (ring + p + frame/5) % ${#spiral_chars[@]} ))
                    local char="${spiral_chars[$char_idx]}"
                    
                    # Color gradient from center
                    if (( ring < 3 )); then
                        echo -ne "${NEON_RED}${char}${RESET}"
                    elif (( ring < 5 )); then
                        echo -ne "${NEON_YELLOW}${char}${RESET}"
                    elif (( ring < 7 )); then
                        echo -ne "${NEON_PURPLE}${char}${RESET}"
                    else
                        echo -ne "${NEON_CYAN}${char}${RESET}"
                    fi
                fi
            done
        done
        
        # Draw eye of storm (pulsing)
        local eye_size=$((frame % 4 + 1))
        for (( ey=-eye_size; ey<=eye_size; ey++ )); do
            for (( ex=-eye_size*2; ex<=eye_size*2; ex++ )); do
                if (( center_y + ey > 0 && center_y + ey < TERM_ROWS && center_x + ex > 0 && center_x + ex < TERM_COLS )); then
                    move_cursor $((center_y + ey)) $((center_x + ex))
                    echo -ne "${BG_BLACK} ${RESET}"
                fi
            done
        done
        
        # Pulsing eye center
        move_cursor $center_y $center_x
        if (( frame % 8 < 4 )); then
            echo -ne "${NEON_WHITE}◉${RESET}"
        else
            echo -ne "${NEON_GREEN}◉${RESET}"
        fi
        
        # Flying debris particles
        for (( d=0; d<8; d++ )); do
            local dx=$((RANDOM % TERM_COLS + 1))
            local dy=$((RANDOM % TERM_ROWS + 1))
            local debris=('*' '.' '·' '°' '×' '✧' '✦' '~')
            move_cursor $dy $dx
            echo -ne "${DIM}${debris[$((RANDOM % ${#debris[@]}))]}${RESET}"
        done
        
        frame=$((frame + 1))
        sleep 0.04
    done
    
    show_cursor
    clear_screen
}

#===============================================================================
# SECTION 10: HYPER GAME INTRO SEQUENCE
#===============================================================================

# Multi-phase game intro with maximum chaos
game_intro_ultimate() {
    get_terminal_size
    hide_cursor
    
    # PHASE 1: Screen corruption
    clear_screen
    chaos_glitch 1
    
    # PHASE 2: Static noise
    for (( s=0; s<30; s++ )); do
        for (( i=0; i<50; i++ )); do
            local x=$((RANDOM % TERM_COLS + 1))
            local y=$((RANDOM % TERM_ROWS + 1))
            move_cursor $y $x
            if (( RANDOM % 2 == 0 )); then
                echo -ne "${NEON_WHITE}█${RESET}"
            else
                echo -ne "${DIM}░${RESET}"
            fi
        done
        sleep 0.02
    done
    
    clear_screen
    beep
    
    # PHASE 3: Logo builds up character by character with glitch
    local logo_lines=(
        "███╗   ███╗██████╗ ██╗  ██╗"
        "████╗ ████║██╔══██╗██║  ██║"
        "██╔████╔██║██║  ██║███████║"
        "██║╚██╔╝██║██║  ██║██╔══██║"
        "██║ ╚═╝ ██║██████╔╝██║  ██║"
        "╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝"
    )
    
    local start_row=$(( (TERM_ROWS - 15) / 2 ))
    
    # Each line appears with glitch
    for (( l=0; l<${#logo_lines[@]}; l++ )); do
        local line="${logo_lines[$l]}"
        local row=$((start_row + l))
        local col=$(( (TERM_COLS - 27) / 2 ))
        
        # Glitch in from random characters
        for (( g=0; g<6; g++ )); do
            move_cursor $row $col
            
            local glitch_line=""
            local glitch_chars='█▓▒░!@#$%^&*<>?╬╠╣╦╩'
            
            for (( c=0; c<${#line}; c++ )); do
                if (( RANDOM % (g + 2) == 0 )); then
                    glitch_line+="${glitch_chars:$((RANDOM % ${#glitch_chars})):1}"
                else
                    glitch_line+="${line:$c:1}"
                fi
            done
            
            local color="${RAINBOW[$((RANDOM % ${#RAINBOW[@]}))]}"
            echo -ne "${color}${glitch_line}${RESET}"
            sleep 0.04
        done
        
        # Final correct line
        move_cursor $row $col
        echo -e "${NEON_GREEN}${line}${RESET}"
        
        # Electric spark at end of line
        echo -ne "${ELECTRIC}⚡${RESET}"
        sleep 0.02
    done
    
    beep
    sleep 0.2
    
    # PHASE 4: Underline draws with electricity
    local underline_row=$((start_row + 6))
    local underline_start=$(( (TERM_COLS - 50) / 2 ))
    
    move_cursor $underline_row $underline_start
    for (( i=0; i<50; i++ )); do
        if (( RANDOM % 3 == 0 )); then
            echo -ne "${ELECTRIC}═⚡${RESET}"
        else
            echo -ne "${NEON_PURPLE}═${RESET}"
        fi
        sleep 0.01
    done
    
    # PHASE 5: Version text fades in with rainbow
    local version_text="v${VERSION} ${EDITION}"
    local version_row=$((start_row + 8))
    local version_col=$(( (TERM_COLS - ${#version_text}) / 2 ))
    
    sleep 0.2
    
    # Rainbow reveal
    for (( i=0; i<${#version_text}; i++ )); do
        move_cursor $version_row $((version_col + i))
        local color="${RAINBOW[$((i % ${#RAINBOW[@]}))]}"
        echo -ne "${color}${version_text:$i:1}${RESET}"
        sleep 0.03
    done
    
    beep
    
    # PHASE 6: Tagline with typewriter
    local tagline="THE WORLD'S MOST POWERFUL COMPRESSION SUITE"
    local tagline_row=$((start_row + 10))
    local tagline_col=$(( (TERM_COLS - ${#tagline}) / 2 ))
    
    sleep 0.3
    move_cursor $tagline_row $tagline_col
    
    echo -ne "${DIM}"
    for (( i=0; i<${#tagline}; i++ )); do
        echo -n "${tagline:$i:1}"
        sleep 0.015
    done
    echo -e "${RESET}"
    
    # PHASE 7: Dragon icon with glow
    local dragon_row=$((start_row + 12))
    move_cursor $dragon_row $(( (TERM_COLS - 10) / 2 ))
    
    for glow in 1 2 3 2 1; do
        move_cursor $dragon_row $(( (TERM_COLS - 10) / 2 ))
        case $glow in
            1) echo -ne "${DIM}${NEON_PURPLE}🐉 STORM DRAGON 🐉${RESET}" ;;
            2) echo -ne "${NEON_PURPLE}🐉 STORM DRAGON 🐉${RESET}" ;;
            3) echo -ne "${BOLD}${NEON_PURPLE}🐉 STORM DRAGON 🐉${RESET}" ;;
        esac
        sleep 0.1
    done
    
    # PHASE 8: Author credit
    local author_row=$((start_row + 14))
    move_cursor $author_row $(( (TERM_COLS - 15) / 2 ))
    echo -ne "${GOLD}by ${AUTHOR}${RESET}"
    
    sleep 0.8
    
    # PHASE 9: Final flash
    screen_flash
    beep
    
    show_cursor
    sleep 0.3
}

#===============================================================================
# SECTION 11: ULTIMATE BIOS BOOT SEQUENCE
#===============================================================================

# Extended BIOS-style system check with 15+ messages
bios_boot_sequence() {
    clear_screen
    
    echo ""
    echo -e "  ${DIM}══════════════════════════════════════════════════════════════${RESET}"
    echo -e "  ${NEON_CYAN}MDH_COMPRESSER SYSTEM BIOS v${VERSION}${RESET}"
    echo -e "  ${DIM}Copyright (C) 2024 MDHojayfa. All rights reserved.${RESET}"
    echo -e "  ${DIM}══════════════════════════════════════════════════════════════${RESET}"
    echo ""
    
    local checks=(
        "Initializing quantum compression matrix"
        "Loading neural network algorithms"
        "Calibrating entropy analyzers"
        "Mounting virtual filesystems"
        "Establishing secure connection to MDH servers"
        "Decrypting forbidden protocols"
        "Loading chaos compression algorithms"
        "Initializing storm pattern generators"
        "Awakening the dragon core"
        "Syncing with MDH_ZONE"
        "Preparing mythic compression engines"
        "Loading legendary codecs"
        "Initializing gamification subsystem"
        "Connecting to achievement servers"
        "Preparing file transfer protocols"
        "Loading ASCII art database"
        "Initializing terminal effects"
        "Calibrating progress indicators"
        "System integrity check"
        "FINAL INITIALIZATION SEQUENCE"
    )
    
    for check in "${checks[@]}"; do
        echo -ne "  ${NEON_CYAN}[    ]${RESET} ${check}"
        
        # Animated dots
        for (( d=0; d<3; d++ )); do
            sleep 0.05
            echo -n "."
        done
        
        # Random delay for realism
        sleep 0.1
        
        # Random status
        if (( RANDOM % 20 == 0 )); then
            echo -ne "\r  ${NEON_YELLOW}[WARN]${RESET} ${check}... "
            echo -e "${NEON_YELLOW}FALLBACK${RESET}"
        else
            echo -ne "\r  ${NEON_GREEN}[ OK ]${RESET} ${check}... "
            echo -e "${NEON_GREEN}READY${RESET}"
        fi
    done
    
    echo ""
    echo -e "  ${DIM}══════════════════════════════════════════════════════════════${RESET}"
    echo -e "  ${NEON_GREEN}${BOLD}ALL SYSTEMS OPERATIONAL${RESET}"
    echo -e "  ${DIM}Press any key to unleash the chaos...${RESET}"
    echo -e "  ${DIM}══════════════════════════════════════════════════════════════${RESET}"
    
    sleep 0.5
}

# Multiple loading bar sequence
loading_sequence() {
    echo ""
    print_neon_box "LOADING MDH_COMPRESSER" "$NEON_CYAN"
    echo ""
    
    loading_bar_classic 1 "Loading core modules"
    loading_bar_cyber 1 "Initializing compressors"
    loading_bar_matrix 1 "Preparing extraction engine"
    loading_bar_fire 1 "Awakening MDH_ZONE"
    loading_bar_electric 1 "Finalizing chaos"
    
    echo ""
    print_success "All systems ready!"
    beep
}

#===============================================================================
# SECTION 12: PLEA MESSAGE & QUOTES
#===============================================================================

# The emotional plea - MUST show every startup
show_plea_message() {
    echo ""
    echo -e "${DIM}  ╭──────────────────────────────────────────────────────────────────────────╮${RESET}"
    echo -e "${DIM}  │${RESET}                                                                          ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${NEON_CYAN}I've worked incredibly hard to keep MDH_COMPRESSER completely FREE.${RESET}    ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}                                                                          ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${NEON_CYAN}The daily key helps me earn a small amount to keep developing this${RESET}     ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${NEON_CYAN}tool and bring you new features. Please don't try to crack or${RESET}          ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${NEON_CYAN}modify this system.${RESET}                                                    ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}                                                                          ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${GOLD}If this project succeeds, I have BIGGER DREAMS that I want to${RESET}          ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${GOLD}build for this community... and I promise to keep them ALL FREE.${RESET}       ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}                                                                          ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}  ${NEON_GREEN}Thank you for understanding, Digital Warrior. 🐉${RESET}                      ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}                                                                          ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}                                              ${DIM}— ${GOLD}${BOLD}${AUTHOR}${RESET}               ${DIM}│${RESET}"
    echo -e "${DIM}  │${RESET}                                                                          ${DIM}│${RESET}"
    echo -e "${DIM}  ╰──────────────────────────────────────────────────────────────────────────╯${RESET}"
    echo ""
    sleep 4
}

# 42+ Quotes Library
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
    "Chaos is just data waiting to be compressed."
    "The storm compresses all in its path."
    "From chaos, order. From bloat, compression."
    "Unleash the dragon. Compress the world."
)

# Display a random quote with style
show_quote() {
    local quote="${QUOTES[$((RANDOM % ${#QUOTES[@]}))]}"
    echo ""
    echo -e "  ${DIM}┌──────────────────────────────────────────────────────────────────────┐${RESET}"
    echo -e "  ${DIM}│${RESET}                                                                      ${DIM}│${RESET}"
    
    # Word wrap the quote if needed
    local max_width=68
    if (( ${#quote} > max_width )); then
        # Split into two lines
        local mid=$((${#quote} / 2))
        local split_point=$mid
        
        # Find nearest space
        for (( i=mid; i>0; i-- )); do
            if [[ "${quote:$i:1}" == " " ]]; then
                split_point=$i
                break
            fi
        done
        
        local line1="${quote:0:$split_point}"
        local line2="${quote:$((split_point + 1))}"
        
        local pad1=$(( (max_width - ${#line1}) / 2 ))
        local pad2=$(( (max_width - ${#line2}) / 2 ))
        
        echo -e "  ${DIM}│${RESET}  ${DIM}\"${ACCENT}$(printf '%*s' $pad1 '')${line1}${RESET}${DIM}\"$(printf '%*s' $((max_width - ${#line1} - pad1 - 4)) '')${RESET}  ${DIM}│${RESET}"
        echo -e "  ${DIM}│${RESET}  $(printf '%*s' $pad2 '')${ACCENT}${line2}${RESET}$(printf '%*s' $((max_width - ${#line2} - pad2)) '')  ${DIM}│${RESET}"
    else
        local padding=$(( (max_width - ${#quote} - 2) / 2 ))
        echo -e "  ${DIM}│${RESET}  ${DIM}\"${ACCENT}${quote}${RESET}${DIM}\"$(printf '%*s' $((max_width - ${#quote} - padding - 2)) '')${RESET}  ${DIM}│${RESET}"
    fi
    
    echo -e "  ${DIM}│${RESET}                                                                      ${DIM}│${RESET}"
    echo -e "  ${DIM}│${RESET}                                              ${DIM}— ${GOLD}${AUTHOR}${RESET}             ${DIM}│${RESET}"
    echo -e "  ${DIM}│${RESET}                                                                      ${DIM}│${RESET}"
    echo -e "  ${DIM}└──────────────────────────────────────────────────────────────────────┘${RESET}"
    echo ""
    sleep 5
}

#===============================================================================
# SECTION 13: COMPLETE BOOT SEQUENCE
#===============================================================================

# Full ultimate boot sequence with loading overlay
boot_sequence_ultimate() {
    clear_screen
    get_terminal_size
    
    # Show "BOOTING..." at bottom during all animations
    show_boot_status() {
        local msg="$1"
        move_cursor $((TERM_ROWS - 1)) 1
        echo -ne "${DIM}${NEON_GREEN}[BOOTING] ${msg}...${RESET}"
    }
    
    # Phase 1: Matrix rain with boot message
    show_boot_status "Initializing neural matrix"
    matrix_rain 2
    
    # Phase 2: Storm with boot message
    clear_screen
    show_boot_status "Generating storm patterns"
    storm_animation_ultimate 3
    
    # Phase 3: Game intro (skip cyclone - user found it lame)
    clear_screen
    show_boot_status "Loading MDH_COMPRESSER core"
    game_intro_ultimate
    
    sleep 0.3
    clear_screen
    
    # Phase 4: BIOS check
    bios_boot_sequence
    
    sleep 0.2
    clear_screen
    
    # Phase 5: Loading bars
    loading_sequence
    
    sleep 0.2
    clear_screen
    
    # Phase 6: Plea message
    print_logo_compact
    show_plea_message
    
    # Phase 7: Random quote
    show_quote
    
    clear_screen
}

# Quick boot (for subsequent runs) - streamlined
boot_sequence_quick() {
    clear_screen
    get_terminal_size
    
    # Quick glitch intro
    glitch_text "MDH_COMPRESSER" 5
    
    # Quick storm (shorter)
    storm_animation_ultimate 1
    
    # Show logo with version
    clear_screen
    print_logo_compact
    print_version_badge
    
    sleep 0.2
    
    # Plea and quote
    show_plea_message
    show_quote
    
    clear_screen
}

#===============================================================================
# SECTION 14: SYSTEM DETECTION & DEPENDENCIES
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
            ;;
        *)
            print_error "Unsupported package manager!"
            exit 1
            ;;
    esac
}

# Install dependencies with visual feedback
install_dependencies() {
    echo ""
    print_fire_box "INSTALLING DEPENDENCIES" 60
    echo ""
    
    print_electric "Detected OS: ${NEON_GREEN}${OS_TYPE}${RESET}"
    print_electric "Package Manager: ${NEON_GREEN}${PKG_MANAGER}${RESET}"
    echo ""
    
    # Update package lists
    print_step "Updating package lists..."
    
    if [[ "$OS_TYPE" == "termux" ]]; then
        # Termux: Run updates without --force-confnew (not supported)
        yes | pkg update -y 2>/dev/null || pkg update -y
        yes | pkg upgrade -y 2>/dev/null || pkg upgrade -y
    else
        eval "$PKG_UPDATE" >/dev/null 2>&1 || true
    fi
    
    print_success "Package lists updated"
    
    # Get package names
    get_package_names
    
    # Install each dependency with animation
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
        
        [[ -z "$pkg" ]] && continue
        
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
    
    # Optional: LRZIP for LEGENDARY mode
    if [[ -n "$PKGS_LRZIP" ]] && ! command -v lrzip &>/dev/null; then
        print_step "Installing LRZIP (optional)..."
        if eval "$PKG_INSTALL $PKGS_LRZIP" >/dev/null 2>&1; then
            print_success "LRZIP installed"
        else
            print_warning "LRZIP not available (LEGENDARY mode will use fallback)"
        fi
    fi
    
    # Optional: UnRAR
    if ! command -v unrar &>/dev/null; then
        print_step "Installing UnRAR (optional)..."
        eval "$PKG_INSTALL $PKGS_UNRAR" >/dev/null 2>&1 || true
    fi
    
    echo ""
    print_fire "All dependencies processed!"
    echo ""
}

#===============================================================================
# SECTION 15: KEY SYSTEM & VALIDATION
#===============================================================================

# Cross-platform MD5 function
get_md5() {
    local input="$1"
    if command -v md5sum &>/dev/null; then
        echo -n "$input" | md5sum | cut -d' ' -f1
    elif command -v md5 &>/dev/null; then
        # macOS
        echo -n "$input" | md5
    else
        # Fallback: use openssl
        echo -n "$input" | openssl md5 | awk '{print $NF}'
    fi
}

# Generate today's key (HYBRID MD5 DOUBLE-HASH)
generate_today_key() {
    local date=$(date -u +"%Y-%m-%d")
    local salt="${_S1}${_S2}${_S3}${_S4}"
    
    # Layer 1: Primary hash
    local hash1=$(get_md5 "${date}${salt}")
    
    # Layer 2: Secondary hash (hybrid layer)
    local date_clean=$(echo "$date" | tr -d '-')
    local hash2=$(get_md5 "${hash1:0:8}${date_clean}")
    
    # Layer 3: Combine and format
    local raw="${hash1:0:8}${hash2:0:8}"
    echo "MDH-${raw:0:4}-${raw:4:4}-${raw:8:4}" | tr '[:lower:]' '[:upper:]'
}

# Get random ad link based on distribution (40/40/10/10)
get_ad_link() {
    local idx=$((RANDOM % ${#AD_LINKS[@]}))
    echo "${AD_LINKS[$idx]}"
}

# Check if key is valid
is_key_valid() {
    local user_key="$1"
    local expected_key=$(generate_today_key)
    user_key=$(echo "$user_key" | tr '[:lower:]' '[:upper:]')
    [[ "$user_key" == "$expected_key" ]]
}

# Check bypass key
check_bypass_key() {
    if [[ -f "$BYPASS_FILE" ]]; then
        local bypass_data=$(cat "$BYPASS_FILE" 2>/dev/null)
        local bypass_key=$(echo "$bypass_data" | cut -d'|' -f1)
        local expiry_date=$(echo "$bypass_data" | cut -d'|' -f2)
        
        if [[ "$bypass_key" =~ ^MDH-BYPASS- ]]; then
            local today=$(date -u +"%Y%m%d")
            if [[ "$expiry_date" -ge "$today" ]]; then
                return 0
            fi
        fi
    fi
    return 1
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
                return 0
            fi
        fi
    fi
    return 1
}

# Cache valid key
cache_key() {
    local key="$1"
    local today=$(date -u +"%Y-%m-%d")
    echo "${today}|${key}" > "$KEY_FILE"
}

# Open browser
open_browser() {
    local url="$1"
    
    if [[ "$OS_TYPE" == "termux" ]]; then
        termux-open-url "$url" 2>/dev/null || am start -a android.intent.action.VIEW -d "$url" 2>/dev/null || xdg-open "$url" 2>/dev/null
    elif [[ "$OS_TYPE" == "macos" ]]; then
        open "$url" 2>/dev/null
    elif [[ "$OS_TYPE" == "wsl" ]]; then
        cmd.exe /c start "" "$url" 2>/dev/null || explorer.exe "$url" 2>/dev/null
    else
        xdg-open "$url" 2>/dev/null || sensible-browser "$url" 2>/dev/null || x-www-browser "$url" 2>/dev/null
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
    
    # If mode doesn't require key (modes 1-3)
    if [[ "$mode_requires_key" != "true" ]]; then
        return 0
    fi
    
    echo ""
    print_fire_box "🔑 DAILY KEY REQUIRED" 60
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
            beep
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
    return 1
}

# Check internet connection
check_internet() {
    if ping -c 1 -W 2 8.8.8.8 &>/dev/null || ping -c 1 -W 2 1.1.1.1 &>/dev/null; then
        return 0
    fi
    return 1
}

#===============================================================================
# SECTION 16: LIVE STATS DISPLAY
#===============================================================================

# Get current RAM usage
get_ram_usage() {
    if [[ "$OS_TYPE" == "macos" ]]; then
        local total=$(sysctl -n hw.memsize 2>/dev/null)
        total=$((total / 1024 / 1024))
        local used=$((total / 2))  # Approximate
    else
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
    
    echo -e "${DIM}┌───────────────────────────────────────────────────────────────────────────┐${RESET}"
    echo -e "${DIM}│${RESET} ${NEON_CYAN}🕐 ${clock}${RESET} ${DIM}│${RESET} ${ram_color}💾 RAM: ${ram_used}MB/${ram_total}MB (${ram_percent}%)${RESET} ${DIM}│${RESET} ${NEON_GREEN}💿 Free: ${disk_free}MB${RESET} ${DIM}│${RESET}"
    echo -e "${DIM}└───────────────────────────────────────────────────────────────────────────┘${RESET}"
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

# Get file/folder size in bytes (cross-platform)
get_size_bytes() {
    local path="$1"
    if [[ -d "$path" ]]; then
        # Try GNU du first, then BSD du
        du -sb "$path" 2>/dev/null | cut -f1 || \
        du -sk "$path" 2>/dev/null | awk '{print $1 * 1024}'
    else
        # Try GNU stat first, then BSD stat (macOS)
        stat -c%s "$path" 2>/dev/null || \
        stat -f%z "$path" 2>/dev/null || \
        wc -c < "$path" 2>/dev/null | tr -d ' '
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
# SECTION 17: FILE PATH UTILITIES
#===============================================================================

# Simple path resolution - checks common locations
resolve_path() {
    local input="$1"
    
    # If empty, return empty
    [[ -z "$input" ]] && echo "" && return
    
    # If absolute path, return as-is
    if [[ "$input" == /* ]]; then
        echo "$input"
        return
    fi
    
    # Check current directory first
    if [[ -e "$(pwd)/$input" ]]; then
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
    
    # Termux: Check /sdcard locations
    if [[ -d "/data/data/com.termux" ]]; then
        if [[ -e "/sdcard/$input" ]]; then
            echo "/sdcard/$input"
            return
        fi
        if [[ -e "/sdcard/Download/$input" ]]; then
            echo "/sdcard/Download/$input"
            return
        fi
    fi
    
    # Return original if nothing found
    echo "$input"
}

# Expand shell variables in path - CRITICAL FIX
expand_path() {
    local path="$1"
    
    # Handle empty
    [[ -z "$path" ]] && echo "" && return
    
    # Expand ~ to $HOME
    if [[ "$path" == "~"* ]]; then
        path="${HOME}${path:1}"
    fi
    
    # Expand $HOME variable (literal string)
    if [[ "$path" == *'$HOME'* ]]; then
        path="${path//\$HOME/$HOME}"
    fi
    
    # Expand ${HOME} variable (literal string)
    if [[ "$path" == *'${HOME}'* ]]; then
        path="${path//\$\{HOME\}/$HOME}"
    fi
    
    # Expand $PWD variable (literal string)
    if [[ "$path" == *'$PWD'* ]]; then
        path="${path//\$PWD/$(pwd)}"
    fi
    
    # Expand ${PWD} variable (literal string)
    if [[ "$path" == *'${PWD}'* ]]; then
        path="${path//\$\{PWD\}/$(pwd)}"
    fi
    
    # Expand $USER variable (literal string)
    if [[ "$path" == *'$USER'* ]]; then
        path="${path//\$USER/$USER}"
    fi
    
    echo "$path"
}

# Read path with autocomplete - SIMPLIFIED AND ROBUST
read_path() {
    local prompt="$1"
    local var_name="$2"
    local input_path=""
    
    echo "" >&2
    echo -e "  ${DIM}Tip: Use TAB for autocomplete, or paste full path${RESET}" >&2
    echo -e "  ${DIM}      Supports: ~, \$HOME, \$PWD, absolute paths${RESET}" >&2
    echo -ne "  ${NEON_CYAN}${prompt}: ${RESET}" >&2
    
    # Read with readline for TAB autocomplete
    read -e -r input_path
    
    # Handle empty input
    if [[ -z "$input_path" ]]; then
        eval "$var_name=''"
        return 1
    fi
    
    # Basic cleanup: trim whitespace
    input_path="${input_path#"${input_path%%[![:space:]]*}"}"
    input_path="${input_path%"${input_path##*[![:space:]]}"}"
    
    # Remove surrounding quotes if present
    input_path="${input_path//\"/}"
    input_path="${input_path//\'/}"
    
    # EXPAND ALL VARIABLES (~ $HOME $PWD etc)
    input_path=$(expand_path "$input_path")
    
    # Set the variable directly
    eval "$var_name=\"\$input_path\""
    return 0
}

# Validate file exists - SIMPLE AND ROBUST
validate_file() {
    local path="$1"
    
    # Empty check
    if [[ -z "$path" ]]; then
        echo "" >&2
        echo -e "  ${NEON_RED}[✗]${RESET} No path provided!" >&2
        return 1
    fi
    
    # Existence check
    if [[ ! -e "$path" ]]; then
        echo "" >&2
        echo -e "  ${NEON_RED}[✗]${RESET} File or folder not found!" >&2
        echo "" >&2
        echo -e "  ${NEON_CYAN}Path:${RESET} ${path}" >&2
        echo "" >&2
        echo -e "  ${DIM}Suggestions:${RESET}" >&2
        echo -e "  ${DIM}• Check if the path is correct${RESET}" >&2
        echo -e "  ${DIM}• Use TAB for autocomplete${RESET}" >&2
        echo -e "  ${DIM}• Use absolute path (starting with /)${RESET}" >&2
        
        # On Termux, remind about storage
        if [[ "$OS_TYPE" == "termux" ]]; then
            echo -e "  ${DIM}• For /sdcard access, run: termux-setup-storage${RESET}" >&2
        fi
        
        return 1
    fi
    
    # Readable check
    if [[ ! -r "$path" ]]; then
        echo -e "  ${NEON_RED}[✗]${RESET} Cannot read file: Permission denied" >&2
        echo -e "  ${DIM}Try: chmod +r \"$path\"${RESET}" >&2
        return 1
    fi
    
    return 0
}

# Select output path - ALL PROMPTS GO TO STDERR, ONLY PATH TO STDOUT
select_output_path() {
    local input_path="$1"
    local extension="$2"
    local default_name
    
    if [[ -d "$input_path" ]]; then
        default_name="$(basename "$input_path")${extension}"
    else
        default_name="$(basename "$input_path" | sed 's/\.[^.]*$//')${extension}"
    fi
    
    local input_dir=$(dirname "$input_path")
    
    # All prompts go to stderr so they don't pollute the return value
    echo "" >&2
    echo -e "  ${NEON_CYAN}Output will be saved as: ${NEON_GREEN}${default_name}${RESET}" >&2
    echo "" >&2
    echo -e "  ${NEON_CYAN}Where to save?${RESET}" >&2
    echo -e "  ${NEON_GREEN}[1]${RESET} Same folder as input" >&2
    echo -e "      ${DIM}→ ${input_dir}/${RESET}" >&2
    echo -e "  ${NEON_GREEN}[2]${RESET} Current directory" >&2
    echo -e "      ${DIM}→ $(pwd)/${RESET}" >&2
    echo -e "  ${NEON_GREEN}[3]${RESET} Custom location" >&2
    echo "" >&2
    echo -ne "  ${NEON_CYAN}Enter choice [1/2/3] (default=1): ${RESET}" >&2
    read -r choice
    
    # Trim whitespace and get only first character
    choice="${choice// /}"
    choice="${choice:0:1}"
    
    case "$choice" in
        1|"") 
            echo "${input_dir}/${default_name}" 
            ;;
        2) 
            echo "$(pwd)/${default_name}" 
            ;;
        3)
            echo "" >&2
            echo -ne "  ${NEON_CYAN}Enter full path (or folder): ${RESET}" >&2
            read -e -r custom_path
            custom_path="${custom_path/#\~/$HOME}"
            if [[ -z "$custom_path" ]]; then
                echo "${input_dir}/${default_name}"
            elif [[ -d "$custom_path" ]]; then
                echo "${custom_path}/${default_name}"
            else
                echo "$custom_path"
            fi
            ;;
        *) 
            # Default to same folder for any other input
            echo "${input_dir}/${default_name}" 
            ;;
    esac
}

#===============================================================================
# SECTION 18: THE 9 COMPRESSION MODES
#===============================================================================

# Pre-compression analysis - ALL UI TO STDERR, ONLY SIZE TO STDOUT
analyze_file() {
    local path="$1"
    local size_bytes=$(get_size_bytes "$path")
    local size_human=$(format_size "$size_bytes")
    
    # All display output goes to stderr so it doesn't pollute the return value
    {
        if [[ -d "$path" ]]; then
            local file_count=$(find "$path" -type f 2>/dev/null | wc -l)
            echo ""
            echo -e "${NEON_CYAN}  ╔════════════════════════════════════════════════════════════╗${RESET}"
            echo -e "${NEON_CYAN}  ║${RESET}                    ${NEON_WHITE}📁 FILE ANALYSIS${RESET}                       ${NEON_CYAN}║${RESET}"
            echo -e "${NEON_CYAN}  ╠════════════════════════════════════════════════════════════╣${RESET}"
            echo -e "${NEON_CYAN}  ║${RESET}  Path: $(basename "$path")                                      ${NEON_CYAN}║${RESET}"
            echo -e "${NEON_CYAN}  ║${RESET}  Type: Directory                                          ${NEON_CYAN}║${RESET}"
            echo -e "${NEON_CYAN}  ║${RESET}  Files: ${file_count}                                              ${NEON_CYAN}║${RESET}"
            echo -e "${NEON_CYAN}  ║${RESET}  Total Size: ${size_human}                                    ${NEON_CYAN}║${RESET}"
            echo -e "${NEON_CYAN}  ╚════════════════════════════════════════════════════════════╝${RESET}"
        else
            local file_type=$(file -b "$path" 2>/dev/null | cut -c1-40)
            echo ""
            echo -e "${NEON_CYAN}  ╔════════════════════════════════════════════════════════════╗${RESET}"
            echo -e "${NEON_CYAN}  ║${RESET}                    ${NEON_WHITE}📄 FILE ANALYSIS${RESET}                       ${NEON_CYAN}║${RESET}"
            echo -e "${NEON_CYAN}  ╠════════════════════════════════════════════════════════════╣${RESET}"
            echo -e "${NEON_CYAN}  ║${RESET}  Name: $(basename "$path")                                       ${NEON_CYAN}║${RESET}"
            echo -e "${NEON_CYAN}  ║${RESET}  Type: ${file_type}                            ${NEON_CYAN}║${RESET}"
            echo -e "${NEON_CYAN}  ║${RESET}  Size: ${size_human}                                        ${NEON_CYAN}║${RESET}"
            echo -e "${NEON_CYAN}  ╚════════════════════════════════════════════════════════════╝${RESET}"
        fi
    } >&2
    
    # ONLY the size goes to stdout (for capture)
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
    
    # Check key status
    local has_key=false
    if check_bypass_key 2>/dev/null || check_cached_key 2>/dev/null; then
        has_key=true
    fi
    
    print_double_box "🗜️  COMPRESSION MODES" "$NEON_GREEN" 70
    
    if [[ "$has_key" == "true" ]]; then
        echo -e "  ${NEON_GREEN}🔓 FULL ACCESS - All modes unlocked!${RESET}"
    else
        echo -e "  ${NEON_YELLOW}🔒 LIMITED - Enter key from menu for full access${RESET}"
    fi
    echo ""
    
    echo -e "  ${NEON_GREEN}━━━ FREE MODES (Always Available) ━━━${RESET}"
    echo ""
    echo -e "  ${NEON_GREEN}[1]${RESET} ⚡ ${BOLD}${NEON_CYAN}FLASH${RESET}          ${DIM}│${RESET} LZ4 - Instant speed, basic ratio"
    echo -e "  ${NEON_GREEN}[2]${RESET} 🌸 ${BOLD}${NEON_CYAN}LITTLE FLOWER${RESET}  ${DIM}│${RESET} Zstd - Fast speed, decent ratio"
    echo -e "  ${NEON_GREEN}[3]${RESET} 🍜 ${BOLD}${NEON_CYAN}ASIAN${RESET}          ${DIM}│${RESET} 7z Balanced - Daily use"
    echo ""
    
    if [[ "$has_key" == "true" ]]; then
        echo -e "  ${NEON_GREEN}━━━ PRO MODES (Unlocked!) ━━━${RESET}"
    else
        echo -e "  ${NEON_YELLOW}━━━ PRO MODES (🔒 Key Required) ━━━${RESET}"
    fi
    echo ""
    echo -e "  ${NEON_YELLOW}[4]${RESET} 🍺 ${BOLD}${NEON_YELLOW}TASTY DRUNK${RESET}    ${DIM}│${RESET} 7z High - Better ratio"
    echo -e "  ${NEON_YELLOW}[5]${RESET} 🦁 ${BOLD}${NEON_YELLOW}BEAST${RESET}          ${DIM}│${RESET} 7z Ultra - Aggressive compression"
    echo -e "  ${NEON_YELLOW}[6]${RESET} 👑 ${BOLD}${GOLD}GODLY${RESET}          ${DIM}│${RESET} XZ Extreme - High memory, very compact"
    echo -e "  ${NEON_PURPLE}[7]${RESET} 🐉 ${BOLD}${NEON_PURPLE}LEGENDARY${RESET}      ${DIM}│${RESET} ZPAQ - Extreme archiving"
    echo -e "  ${NEON_PURPLE}[8]${RESET} 💀 ${BOLD}${NEON_PURPLE}MYTHIC${RESET}         ${DIM}│${RESET} Multi-pass pipeline"
    echo ""
    
    if [[ "$has_key" == "true" ]]; then
        echo -e "  ${NEON_RED}━━━ THE FORBIDDEN PROTOCOL (Unlocked!) ━━━${RESET}"
    else
        echo -e "  ${NEON_RED}━━━ THE FORBIDDEN PROTOCOL (🔒 Key Required) ━━━${RESET}"
    fi
    echo ""
    echo -e "  ${NEON_RED}[9]${RESET} ☠️  ${BOLD}${BLINK}${NEON_RED}MDH_ZONE${RESET}       ${DIM}│${RESET} ${FIRE}THEORETICAL LIMIT${RESET}"
    echo ""
    echo -e "  ${DIM}[0] Back to Main Menu${RESET}"
    echo ""
}

# Mode 1: FLASH (LZ4)
compress_flash() {
    local input="$1"
    local output="$2"
    
    print_neon_box "⚡ FLASH MODE" "$NEON_GREEN"
    print_info "Algorithm: LZ4 (Fastest)"
    echo ""
    
    if [[ -d "$input" ]]; then
        if ! tar -C "$(dirname "$input")" -cf - "$(basename "$input")" 2>/dev/null | pv -N "Compressing" | lz4 -1 -f > "$output" 2>/dev/null; then
            print_error "Compression failed!"
            return 1
        fi
    else
        if ! pv "$input" 2>/dev/null | lz4 -1 -f > "$output" 2>/dev/null; then
            print_error "Compression failed!"
            return 1
        fi
    fi
    return 0
}

# Mode 2: LITTLE FLOWER (Zstd)
compress_flower() {
    local input="$1"
    local output="$2"
    
    print_neon_box "🌸 LITTLE FLOWER MODE" "$NEON_PURPLE"
    print_info "Algorithm: Zstandard (Level 3)"
    echo ""
    
    if [[ -d "$input" ]]; then
        if ! tar -C "$(dirname "$input")" -cf - "$(basename "$input")" 2>/dev/null | pv -N "Compressing" | zstd -3 -f > "$output" 2>/dev/null; then
            print_error "Compression failed!"
            return 1
        fi
    else
        if ! pv "$input" 2>/dev/null | zstd -3 -f > "$output" 2>/dev/null; then
            print_error "Compression failed!"
            return 1
        fi
    fi
    return 0
}

# Mode 3: ASIAN (7z Balanced)
compress_asian() {
    local input="$1"
    local output="$2"
    
    print_neon_box "🍜 ASIAN MODE" "$NEON_CYAN"
    print_info "Algorithm: 7-Zip (Balanced)"
    echo ""
    
    if [[ -d "$input" ]]; then
        local temp_tar="${TEMP_DIR}/mdh_asian_$$.tar"
        if ! tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")" 2>/dev/null; then
            print_error "Failed to create tar archive!"
            return 1
        fi
        if ! 7z a -mx=5 -mfb=64 -md=32m -bsp1 "$output" "$temp_tar"; then
            rm -f "$temp_tar"
            print_error "Compression failed!"
            return 1
        fi
        rm -f "$temp_tar"
    else
        if ! 7z a -mx=5 -mfb=64 -md=32m -bsp1 "$output" "$input"; then
            print_error "Compression failed!"
            return 1
        fi
    fi
    return 0
}

# Mode 4: TASTY DRUNK (7z High)
compress_drunk() {
    local input="$1"
    local output="$2"
    
    print_neon_box "🍺 TASTY DRUNK MODE" "$NEON_YELLOW"
    print_info "Algorithm: 7-Zip (High)"
    echo ""
    
    if [[ -d "$input" ]]; then
        local temp_tar="${TEMP_DIR}/mdh_drunk_$$.tar"
        tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")" 2>/dev/null || { print_error "Failed to create tar!"; return 1; }
        7z a -mx=7 -mfb=128 -md=64m -bsp1 "$output" "$temp_tar" || { rm -f "$temp_tar"; print_error "Compression failed!"; return 1; }
        rm -f "$temp_tar"
    else
        7z a -mx=7 -mfb=128 -md=64m -bsp1 "$output" "$input" || { print_error "Compression failed!"; return 1; }
    fi
    return 0
}

# Mode 5: BEAST (7z Ultra)
compress_beast() {
    local input="$1"
    local output="$2"
    
    print_neon_box "🦁 BEAST MODE" "$NEON_YELLOW"
    print_info "Algorithm: 7-Zip (Ultra + Solid)"
    echo ""
    
    if [[ -d "$input" ]]; then
        local temp_tar="${TEMP_DIR}/mdh_beast_$$.tar"
        tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")" 2>/dev/null || { print_error "Failed to create tar!"; return 1; }
        7z a -mx=9 -mfb=256 -md=128m -ms=on -bsp1 "$output" "$temp_tar" || { rm -f "$temp_tar"; print_error "Compression failed!"; return 1; }
        rm -f "$temp_tar"
    else
        7z a -mx=9 -mfb=256 -md=128m -ms=on -bsp1 "$output" "$input" || { print_error "Compression failed!"; return 1; }
    fi
    return 0
}

# Mode 6: GODLY (XZ Extreme)
compress_godly() {
    local input="$1"
    local output="$2"
    
    print_neon_box "👑 GODLY MODE" "$GOLD"
    print_info "Algorithm: XZ (Extreme)"
    print_warning "High memory usage!"
    echo ""
    
    if [[ -d "$input" ]]; then
        if ! tar -C "$(dirname "$input")" -cf - "$(basename "$input")" 2>/dev/null | pv -N "Compressing" | xz -9 -e -c > "$output" 2>/dev/null; then
            print_error "Compression failed!"
            return 1
        fi
    else
        if ! pv "$input" 2>/dev/null | xz -9 -e -c > "$output" 2>/dev/null; then
            print_error "Compression failed!"
            return 1
        fi
    fi
    return 0
}

# Mode 7: LEGENDARY (LRZIP ZPAQ or fallback)
compress_legendary() {
    local input="$1"
    local output="$2"
    
    print_neon_box "🐉 LEGENDARY MODE" "$NEON_PURPLE"
    print_dragon
    
    if command -v lrzip &>/dev/null; then
        print_info "Algorithm: LRZIP (ZPAQ Method)"
        echo ""
        
        if [[ -d "$input" ]]; then
            local temp_tar="${TEMP_DIR}/mdh_legendary_$$.tar"
            tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")"
            lrzip -z -L 9 -p $(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4) "$temp_tar" -o "$output"
            rm -f "$temp_tar"
        else
            lrzip -z -L 9 -p $(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4) "$input" -o "$output"
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
    
    print_neon_box "💀 MYTHIC MODE" "$NEON_RED"
    print_skull
    print_info "Multi-pass compression pipeline..."
    print_warning "This may take a while!"
    echo ""
    
    local temp_base="${TEMP_DIR}/mdh_mythic_$$"
    local temp_tar="${temp_base}.tar"
    local temp_zst="${temp_base}.zst"
    
    # Pass 1: Create tar and compress with zstd
    print_step "Pass 1: Initial compression..."
    if [[ -d "$input" ]]; then
        tar -C "$(dirname "$input")" -cf "$temp_tar" "$(basename "$input")"
    else
        tar -cf "$temp_tar" -C "$(dirname "$input")" "$(basename "$input")"
    fi
    
    pv "$temp_tar" | zstd -19 -f > "$temp_zst"
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
    print_skull_massive
    echo ""
    print_center "$NEON_RED" "☠️  WARNING: FORBIDDEN PROTOCOL ☠️"
    echo ""
    print_center "$FIRE" "═══════════════════════════════════════════════"
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
    screen_flash
    beep
    
    print_fire_box "☠️  MDH_ZONE ACTIVATED ☠️" 60
    echo ""
    
    print_fire "Algorithm: Maximum 7z + XZ Pipeline"
    print_fire "This is the theoretical limit of compression."
    echo ""
    
    local temp_base="${TEMP_DIR}/mdh_zone_$$"
    local temp_tar="${temp_base}.tar"
    local temp_7z="${temp_base}.7z"
    local cores=$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || getconf _NPROCESSORS_ONLN 2>/dev/null || echo 4)
    
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
    print_fire "MDH_ZONE compression complete!"
    print_dragon
    beep
    achievement_sound
}

#===============================================================================
# SECTION 19: UNIVERSAL EXTRACTION ENGINE
#===============================================================================

# Detect archive type by magic bytes (cross-platform)
detect_archive_type() {
    local file="$1"
    local magic=""
    
    # Try xxd first, then od as fallback
    if command -v xxd &>/dev/null; then
        magic=$(xxd -p -l 10 "$file" 2>/dev/null | tr '[:lower:]' '[:upper:]')
    elif command -v od &>/dev/null; then
        magic=$(od -A n -t x1 -N 10 "$file" 2>/dev/null | tr -d ' \n' | tr '[:lower:]' '[:upper:]')
    else
        # No hex dump available, fall back to extension
        local ext="${file##*.}"
        echo "${ext,,}"
        return
    fi
    
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
    
    # Try 7z first
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
    
    print_fire "Extracting MDH_ZONE format (multi-layer)..."
    
    local temp_dir="${TEMP_DIR}/mdhz_extract_$$"
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
        mdh) extract_mdh "$input" "$output_dir" ;;
        mdhz) extract_mdhz "$input" "$output_dir" ;;
        7z) 7z x -y -o"$output_dir" "$input" -bsp1 ;;
        zip) unzip -o "$input" -d "$output_dir" ;;
        rar)
            if command -v unrar &>/dev/null; then
                unrar x -o+ "$input" "$output_dir/"
            else
                print_error "UnRAR not installed"
                return 1
            fi
            ;;
        tar) pv "$input" | tar -xf - -C "$output_dir" ;;
        tar.gz|tgz|gz) pv "$input" | tar -xzf - -C "$output_dir" 2>/dev/null || gunzip -c "$input" > "$output_dir/$(basename "${input%.gz}")" ;;
        tar.xz|txz|xz) pv "$input" | tar -xJf - -C "$output_dir" 2>/dev/null || xz -d -k -c "$input" > "$output_dir/$(basename "${input%.xz}")" ;;
        tar.bz2|tbz2|bz2) pv "$input" | tar -xjf - -C "$output_dir" 2>/dev/null || bzip2 -d -k -c "$input" > "$output_dir/$(basename "${input%.bz2}")" ;;
        lz4) pv "$input" | lz4 -d -c > "$output_dir/$(basename "${input%.lz4}")" ;;
        zst|zstd) pv "$input" | zstd -d -c > "$output_dir/$(basename "${input%.zst}")" ;;
        lrzip|lrz)
            if command -v lrzip &>/dev/null; then
                lrzip -d "$input" -o "$output_dir/$(basename "${input%.lrz}")"
            else
                print_error "LRZIP not installed"
                return 1
            fi
            ;;
        *)
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
    
    print_double_box "📦 UNIVERSAL EXTRACTOR" "$NEON_CYAN" 70
    echo ""
    print_info "Supports: ZIP, RAR, 7Z, TAR, GZ, XZ, BZ2, LZ4, ZSTD, MDH, MDHZ"
    echo ""
    
    # Get file path with autocomplete
    local input_path=""
    echo ""
    echo -e "  ${DIM}Tip: Use TAB for autocomplete, or paste full path${RESET}"
    echo -ne "  ${NEON_CYAN}Enter archive path: ${RESET}"
    read -e -r input_path
    
    # Handle empty input
    if [[ -z "$input_path" ]]; then
        print_error "No path provided!"
        sleep 2
        return
    fi
    
    # Trim whitespace
    input_path="${input_path#"${input_path%%[![:space:]]*}"}"
    input_path="${input_path%"${input_path##*[![:space:]]}"}"
    
    # Remove quotes if present
    input_path="${input_path//\"/}"
    input_path="${input_path//\'/}"
    
    # EXPAND ALL VARIABLES (~ $HOME $PWD etc) - CRITICAL FIX
    input_path=$(expand_path "$input_path")
    
    # Try to resolve path if not found directly
    if [[ ! -e "$input_path" ]]; then
        local resolved=$(resolve_path "$input_path")
        if [[ -e "$resolved" ]]; then
            input_path="$resolved"
        fi
    fi
    
    # Final validation
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
        local elapsed=$((SECONDS - start_time))
        
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
# SECTION 20: GAMIFICATION SYSTEM
#===============================================================================

# Achievement definitions
declare -A ACHIEVEMENTS=(
    ["FIRST_BLOOD"]="First Blood|Complete your first compression"
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
    "mode_usage": {"flash":0,"flower":0,"asian":0,"drunk":0,"beast":0,"godly":0,"legendary":0,"mythic":0,"mdhzone":0},
    "best_ratio": 0
}
EOF
    fi
}

# Get stats value
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
    
    local current_xp=$(get_stat "xp")
    local xp_earned=0
    
    case "$action" in
        compression)
            case "$mode" in
                flash|flower) xp_earned=5 ;;
                asian|drunk) xp_earned=10 ;;
                beast|godly) xp_earned=25 ;;
                legendary|mythic) xp_earned=50 ;;
                mdhzone) xp_earned=100 ;;
            esac
            xp_earned=$((xp_earned + bytes_compressed / 104857600))
            
            local tmp_file=$(mktemp)
            jq ".compressions += 1 | .total_compressed += $bytes_compressed | .total_saved += $bytes_saved | .xp += $xp_earned | .last_use = \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"" "$STATS_FILE" > "$tmp_file" && mv "$tmp_file" "$STATS_FILE"
            ;;
        extraction)
            xp_earned=3
            local tmp_file=$(mktemp)
            jq ".extractions += 1 | .xp += $xp_earned | .last_use = \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"" "$STATS_FILE" > "$tmp_file" && mv "$tmp_file" "$STATS_FILE"
            ;;
        transfer)
            xp_earned=5
            local tmp_file=$(mktemp)
            jq ".transfers += 1 | .xp += $xp_earned | .last_use = \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"" "$STATS_FILE" > "$tmp_file" && mv "$tmp_file" "$STATS_FILE"
            ;;
    esac
    
    if (( xp_earned > 0 )); then
        echo -e "  ${GOLD}+${xp_earned} XP earned!${RESET}"
        beep
    fi
}

# Show stats menu
show_stats_menu() {
    clear_screen
    init_stats
    
    echo ""
    print_logo_compact
    echo ""
    
    local xp=$(get_stat "xp")
    local level=1
    for lvl in 8 7 6 5 4 3 2 1; do
        local req=$(echo "${LEVELS[$lvl]}" | cut -d'|' -f2)
        if (( xp >= req )); then
            level=$lvl
            break
        fi
    done
    local level_name=$(echo "${LEVELS[$level]}" | cut -d'|' -f1)
    local compressions=$(get_stat "compressions")
    local extractions=$(get_stat "extractions")
    local total_compressed=$(get_stat "total_compressed")
    local total_saved=$(get_stat "total_saved")
    
    print_double_box "📊 YOUR STATS" "$GOLD" 60
    echo ""
    echo -e "  ${NEON_CYAN}Level:${RESET}          ${GOLD}$level${RESET} - ${NEON_GREEN}$level_name${RESET}"
    echo -e "  ${NEON_CYAN}XP:${RESET}             ${NEON_YELLOW}$xp${RESET}"
    echo -e "  ${NEON_CYAN}Compressions:${RESET}   $compressions"
    echo -e "  ${NEON_CYAN}Extractions:${RESET}    $extractions"
    echo -e "  ${NEON_CYAN}Total Compressed:${RESET} $(format_size $total_compressed)"
    echo -e "  ${NEON_CYAN}Space Saved:${RESET}    $(format_size $total_saved)"
    echo ""
    
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read
}

#===============================================================================
# SECTION 21: FILE TRANSFER MODULE
#===============================================================================

# Upload to gofile - FIXED with better error handling
upload_gofile() {
    local file="$1"
    
    # Get server (output to stderr so it doesn't mix with return value)
    print_step "Getting upload server..." >&2
    local server_response=$(curl -s --max-time 15 "https://api.gofile.io/servers" 2>/dev/null)
    local server=""
    
    # Try new API format first
    server=$(echo "$server_response" | jq -r '.data.servers[0].name' 2>/dev/null)
    
    # Fallback to old API format
    if [[ -z "$server" ]] || [[ "$server" == "null" ]]; then
        server_response=$(curl -s --max-time 15 "https://api.gofile.io/getServer" 2>/dev/null)
        server=$(echo "$server_response" | jq -r '.data.server' 2>/dev/null)
    fi
    
    if [[ -z "$server" ]] || [[ "$server" == "null" ]]; then
        print_warning "Could not get server" >&2
        return 1
    fi
    
    print_step "Uploading to $server.gofile.io..." >&2
    local response=$(curl -s --max-time 600 -F "file=@$file" "https://${server}.gofile.io/contents/uploadfile" 2>/dev/null)
    
    # Try new API response format
    local url=$(echo "$response" | jq -r '.data.downloadPage' 2>/dev/null)
    
    # Fallback to checking for fileId
    if [[ -z "$url" ]] || [[ "$url" == "null" ]]; then
        local file_id=$(echo "$response" | jq -r '.data.fileId' 2>/dev/null)
        if [[ -n "$file_id" ]] && [[ "$file_id" != "null" ]]; then
            url="https://gofile.io/d/${file_id}"
        fi
    fi
    
    if [[ -n "$url" ]] && [[ "$url" != "null" ]] && [[ "$url" == http* ]]; then
        echo "$url"
        return 0
    fi
    return 1
}

# Upload to pixeldrain - FIXED
upload_pixeldrain() {
    local file="$1"
    
    print_step "Uploading to pixeldrain.com..." >&2
    local response=$(curl -s --max-time 300 -T "$file" "https://pixeldrain.com/api/file/" 2>/dev/null)
    local id=$(echo "$response" | jq -r '.id' 2>/dev/null)
    
    if [[ -n "$id" ]] && [[ "$id" != "null" ]]; then
        echo "https://pixeldrain.com/u/$id"
        return 0
    fi
    return 1
}

# Upload to 0x0 - FIXED
upload_0x0() {
    local file="$1"
    
    print_step "Uploading to 0x0.st..." >&2
    local url=$(curl -s --max-time 300 -F "file=@$file" "https://0x0.st" 2>/dev/null)
    
    # Clean up the response
    url=$(echo "$url" | tr -d '\n' | tr -d '\r')
    
    if [[ "$url" == http* ]]; then
        echo "$url"
        return 0
    fi
    return 1
}

# Upload to file.io (simple and reliable)
upload_fileio() {
    local file="$1"
    
    print_step "Uploading to file.io..." >&2
    local response=$(curl -s --max-time 300 -F "file=@$file" "https://file.io" 2>/dev/null)
    local url=$(echo "$response" | jq -r '.link' 2>/dev/null)
    
    if [[ -n "$url" ]] && [[ "$url" != "null" ]] && [[ "$url" == http* ]]; then
        echo "$url"
        return 0
    fi
    return 1
}

# Upload to catbox.moe (permanent)
upload_catbox() {
    local file="$1"
    
    print_step "Uploading to catbox.moe..." >&2
    local url=$(curl -s --max-time 300 -F "reqtype=fileupload" -F "fileToUpload=@$file" "https://catbox.moe/user/api.php" 2>/dev/null)
    
    # Clean up the response
    url=$(echo "$url" | tr -d '\n' | tr -d '\r')
    
    if [[ "$url" == http* ]]; then
        echo "$url"
        return 0
    fi
    return 1
}

# Upload using rstream.io (runs their bash script and captures URL)
upload_rstream() {
    local file="$1"
    
    print_step "Uploading via rstream.io..." >&2
    echo "" >&2
    echo -e "  ${DIM}━━━ Rstream.io Output ━━━${RESET}" >&2
    
    # Run the rstream command and capture full output
    local output=""
    output=$(bash -c "$(curl -fsSL https://rstream.io/tools/file-sharing.sh 2>/dev/null)" -- "$file" 2>&1)
    local exit_code=$?
    
    # Show the full output to user (on stderr so it doesn't mix with URL)
    echo "$output" >&2
    echo -e "  ${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}" >&2
    
    # Try to extract URL from output (look for http/https links)
    local url=""
    url=$(echo "$output" | grep -oE 'https?://[^ ]+' | tail -1)
    
    if [[ -n "$url" ]] && [[ "$url" == http* ]]; then
        echo "$url"
        return 0
    fi
    
    return 1
}

# Auto upload with fallback - ALL STATUS TO STDERR
auto_upload() {
    local file="$1"
    local services=("rstream" "gofile" "pixeldrain" "0x0" "fileio" "catbox")
    
    print_info "Auto-uploading with 6 service fallback..." >&2
    
    for service in "${services[@]}"; do
        print_info "Trying $service..." >&2
        
        local url=""
        case "$service" in
            rstream) url=$(upload_rstream "$file") ;;
            gofile) url=$(upload_gofile "$file") ;;
            pixeldrain) url=$(upload_pixeldrain "$file") ;;
            0x0) url=$(upload_0x0 "$file") ;;
            fileio) url=$(upload_fileio "$file") ;;
            catbox) url=$(upload_catbox "$file") ;;
        esac
        
        if [[ -n "$url" ]] && [[ "$url" == http* ]]; then
            echo "$url"
            return 0
        fi
        
        print_warning "$service failed, trying next..." >&2
    done
    
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
    
    local local_ip=$(hostname -I 2>/dev/null | awk '{print $1}')
    [[ -z "$local_ip" ]] && local_ip="localhost"
    
    echo -e "  ${NEON_GREEN}Local Network URL:${RESET}"
    echo -e "  ${NEON_CYAN}http://${local_ip}:${port}/${file_name}${RESET}"
    echo ""
    
    cd "$file_dir"
    python3 -m http.server "$port" 2>/dev/null || python -m SimpleHTTPServer "$port" 2>/dev/null
}

# Check Termux storage permission
check_termux_storage() {
    if [[ "$OS_TYPE" == "termux" ]]; then
        if [[ ! -d "/sdcard" ]] || [[ ! -r "/sdcard" ]]; then
            print_warning "Storage permission may be needed!"
            echo -e "  ${NEON_CYAN}Run this command first: ${NEON_GREEN}termux-setup-storage${RESET}"
            echo ""
            echo -ne "  ${DIM}Press Enter after granting permission...${RESET}"
            read
        fi
    fi
}

# Main transfer handler
handle_transfer() {
    clear_screen
    echo ""
    print_logo_compact
    echo ""
    
    # Check Termux storage first
    check_termux_storage
    
    print_double_box "📤 FILE TRANSFER" "$NEON_PURPLE" 70
    echo ""
    
    echo -e "  ${NEON_CYAN}Choose transfer method:${RESET}"
    echo ""
    echo -e "  ${DIM}═══ CLOUD UPLOAD (Upload once, share link) ═══${RESET}"
    echo -e "  ${NEON_GREEN}[1]${RESET} 🚀 ${BOLD}Auto${RESET} ${DIM}(6 services with auto-fallback)${RESET}"
    echo -e "  ${NEON_GREEN}[2]${RESET} 🌊 Rstream.io ${DIM}(Fast, shows full output)${RESET}"
    echo -e "  ${NEON_GREEN}[3]${RESET} 📁 GoFile.io ${DIM}(Unlimited size, Forever)${RESET}"
    echo -e "  ${NEON_GREEN}[4]${RESET} 💎 Pixeldrain ${DIM}(20GB max, 60 days)${RESET}"
    echo -e "  ${NEON_GREEN}[5]${RESET} ⚡ 0x0.st ${DIM}(512MB max, 30 days)${RESET}"
    echo -e "  ${NEON_GREEN}[6]${RESET} 📎 File.io ${DIM}(2GB max, 1 download)${RESET}"
    echo -e "  ${NEON_GREEN}[7]${RESET} 🐱 Catbox.moe ${DIM}(200MB max, Permanent)${RESET}"
    echo ""
    echo -e "  ${DIM}═══ LOCAL/DIRECT (Device must stay ON) ═══${RESET}"
    echo -e "  ${NEON_YELLOW}[8]${RESET} 🏠 Local Network ${DIM}(Python HTTP server)${RESET}"
    echo ""
    if [[ "$OS_TYPE" == "termux" ]]; then
        echo -e "  ${DIM}═══ TERMUX NATIVE ═══${RESET}"
        echo -e "  ${NEON_PURPLE}[9]${RESET} 📱 Termux Share ${DIM}(Use Android share menu)${RESET}"
        echo ""
    fi
    echo -e "  ${DIM}[0] Back${RESET}"
    echo ""
    echo -ne "  ${NEON_CYAN}Choice: ${RESET}"
    read -r method
    
    [[ "$method" == "0" ]] && return
    
    # Termux native share
    if [[ "$method" == "9" ]] && [[ "$OS_TYPE" == "termux" ]]; then
        # Get file path with autocomplete
        local file_path=""
        echo ""
        echo -e "  ${DIM}Tip: Use TAB for autocomplete, or paste full path${RESET}"
        echo -ne "  ${NEON_CYAN}Enter file or folder path: ${RESET}"
        read -e -r file_path
        
        # Handle empty input
        if [[ -z "$file_path" ]]; then
            print_error "No path provided!"
            sleep 2
            return
        fi
        
        # Trim whitespace
        file_path="${file_path#"${file_path%%[![:space:]]*}"}"
        file_path="${file_path%"${file_path##*[![:space:]]}"}"
        file_path="${file_path//\"/}"
        file_path="${file_path//\'/}"
        
        # EXPAND ALL VARIABLES (~ $HOME $PWD etc) - CRITICAL FIX
        file_path=$(expand_path "$file_path")
        
        # Try to resolve path
        if [[ ! -e "$file_path" ]]; then
            local resolved=$(resolve_path "$file_path")
            if [[ -e "$resolved" ]]; then
                file_path="$resolved"
            fi
        fi
        
        # Final validation
        if ! validate_file "$file_path"; then
            sleep 2
            return
        fi
        
        # Handle folders - compress first
        if [[ -d "$file_path" ]]; then
            print_warning "Folders need to be compressed first for sharing."
            echo -ne "  ${NEON_CYAN}Compress and share? [Y/n]: ${RESET}"
            read -r compress_yn
            if [[ "${compress_yn,,}" != "n" ]]; then
                local temp_archive="${TEMP_DIR}/$(basename "$file_path").mdh"
                echo ""
                print_step "Compressing folder..."
                compress_flash "$file_path" "$temp_archive"
                if [[ -f "$temp_archive" ]]; then
                    file_path="$temp_archive"
                    print_success "Folder compressed!"
                else
                    print_error "Compression failed!"
                    sleep 2
                    return
                fi
            else
                return
            fi
        fi
        
        if command -v termux-share &>/dev/null; then
            print_step "Opening Android share menu..."
            termux-share "$file_path"
            print_success "Share dialog opened!"
        else
            print_error "termux-share not found!"
            echo ""
            echo -e "  ${NEON_CYAN}Install it with:${RESET}"
            echo -e "  ${NEON_GREEN}pkg install termux-api${RESET}"
            echo ""
            echo -e "  ${DIM}Then install Termux:API app from F-Droid${RESET}"
        fi
        echo ""
        echo -ne "  ${DIM}Press Enter to continue...${RESET}"
        read
        return
    fi
    
    # Get file path with autocomplete
    local file_path=""
    echo ""
    echo -e "  ${DIM}Tip: Use TAB for autocomplete, or paste full path${RESET}"
    echo -ne "  ${NEON_CYAN}Enter file or folder path: ${RESET}"
    read -e -r file_path
    
    # Handle empty input
    if [[ -z "$file_path" ]]; then
        print_error "No path provided!"
        sleep 2
        return
    fi
    
    # Trim whitespace
    file_path="${file_path#"${file_path%%[![:space:]]*}"}"
    file_path="${file_path%"${file_path##*[![:space:]]}"}"
    file_path="${file_path//\"/}"
    file_path="${file_path//\'/}"
    
    # EXPAND ALL VARIABLES (~ $HOME $PWD etc) - CRITICAL FIX
    file_path=$(expand_path "$file_path")
    
    # Try to resolve path if not found directly
    if [[ ! -e "$file_path" ]]; then
        local resolved=$(resolve_path "$file_path")
        if [[ -e "$resolved" ]]; then
            file_path="$resolved"
        fi
    fi
    
    # Final validation
    if ! validate_file "$file_path"; then
        sleep 2
        return
    fi
    
    # Handle folders - compress first
    if [[ -d "$file_path" ]]; then
        print_warning "Folders must be compressed before upload!"
        echo -ne "  ${NEON_CYAN}Compress now? [Y/n]: ${RESET}"
        read -r compress_yn
        if [[ "${compress_yn,,}" != "n" ]]; then
            local temp_archive="${TEMP_DIR}/$(basename "$file_path").mdh"
            echo ""
            print_step "Compressing folder..."
            compress_flash "$file_path" "$temp_archive"
            if [[ -f "$temp_archive" ]]; then
                file_path="$temp_archive"
                print_success "Folder compressed!"
            else
                print_error "Compression failed!"
                sleep 2
                return
            fi
        else
            return
        fi
    fi
    
    echo ""
    print_step "Starting upload..."
    echo ""
    
    local url=""
    local upload_success=false
    
    case "$method" in
        1) 
            url=$(auto_upload "$file_path")
            [[ -n "$url" ]] && [[ "$url" == http* ]] && upload_success=true
            ;;
        2) 
            url=$(upload_rstream "$file_path")
            [[ -n "$url" ]] && [[ "$url" == http* ]] && upload_success=true
            ;;
        3) 
            url=$(upload_gofile "$file_path")
            [[ -n "$url" ]] && [[ "$url" == http* ]] && upload_success=true
            ;;
        4) 
            url=$(upload_pixeldrain "$file_path")
            [[ -n "$url" ]] && [[ "$url" == http* ]] && upload_success=true
            ;;
        5) 
            url=$(upload_0x0 "$file_path")
            [[ -n "$url" ]] && [[ "$url" == http* ]] && upload_success=true
            ;;
        6) 
            url=$(upload_fileio "$file_path")
            [[ -n "$url" ]] && [[ "$url" == http* ]] && upload_success=true
            ;;
        7) 
            url=$(upload_catbox "$file_path")
            [[ -n "$url" ]] && [[ "$url" == http* ]] && upload_success=true
            ;;
        8) 
            start_local_server "$file_path"
            return 
            ;;
    esac
    
    echo ""
    
    if [[ "$upload_success" == true ]] && [[ -n "$url" ]]; then
        echo -e "  ${NEON_GREEN}╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "  ${NEON_GREEN}║              ✅ UPLOAD SUCCESSFUL!                         ║${RESET}"
        echo -e "  ${NEON_GREEN}╚════════════════════════════════════════════════════════════╝${RESET}"
        echo ""
        echo -e "  ${NEON_CYAN}📎 Download URL:${RESET}"
        echo ""
        echo -e "  ${NEON_WHITE}${BOLD}${url}${RESET}"
        echo ""
        echo -e "  ${DIM}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
        echo ""
        
        # Copy to clipboard if possible
        if [[ "$OS_TYPE" == "termux" ]]; then
            if echo "$url" | termux-clipboard-set 2>/dev/null; then
                print_success "URL copied to clipboard!"
            fi
        elif command -v xclip &>/dev/null; then
            if echo "$url" | xclip -selection clipboard 2>/dev/null; then
                print_success "URL copied to clipboard!"
            fi
        elif command -v pbcopy &>/dev/null; then
            if echo "$url" | pbcopy 2>/dev/null; then
                print_success "URL copied to clipboard!"
            fi
        fi
        
        update_stats "transfer" 0 0
        beep
    else
        print_error "Upload failed! Please check your internet connection."
        echo ""
        echo -e "  ${DIM}Possible reasons:${RESET}"
        echo -e "  ${DIM}• No internet connection${RESET}"
        echo -e "  ${DIM}• File too large for selected service${RESET}"
        echo -e "  ${DIM}• Service temporarily unavailable${RESET}"
    fi
    
    echo ""
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read
}

#===============================================================================
# SECTION 22: DONATION & SUPPORT
#===============================================================================

show_donation_menu() {
    clear_screen
    echo ""
    print_logo_compact
    echo ""
    
    print_double_box "💝 SUPPORT MDH_COMPRESSER" "$GOLD" 70
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
    echo -e "  ${NEON_CYAN}Contact:${RESET} ${NEON_GREEN}Telegram ${TELEGRAM}${RESET}"
    echo ""
    
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read
}

#===============================================================================
# SECTION 23: UPDATE CHECKER
#===============================================================================

check_for_updates() {
    print_info "Checking for updates..."
    
    # Check internet first
    if ! check_internet; then
        print_warning "No internet connection. Cannot check for updates."
        echo -e "  ${DIM}Check manually at: ${NEON_CYAN}${GITHUB_REPO}${RESET}"
        return
    fi
    
    # Try to get latest version with timeout and proper headers
    local latest=""
    latest=$(curl -s --max-time 10 \
        -H "Accept: application/vnd.github.v3+json" \
        -H "User-Agent: MDH_COMPRESSER/${VERSION}" \
        "https://api.github.com/repos/MDHojayfa/MDH_Compresser/releases/latest" 2>/dev/null | \
        jq -r '.tag_name // empty' 2>/dev/null)
    
    # If releases API fails, try tags
    if [[ -z "$latest" ]]; then
        latest=$(curl -s --max-time 10 \
            -H "User-Agent: MDH_COMPRESSER/${VERSION}" \
            "https://api.github.com/repos/MDHojayfa/MDH_Compresser/tags" 2>/dev/null | \
            jq -r '.[0].name // empty' 2>/dev/null)
    fi
    
    if [[ -z "$latest" ]]; then
        print_warning "Could not check for updates automatically."
        echo -e "  ${DIM}Check manually at: ${NEON_CYAN}${GITHUB_REPO}/releases${RESET}"
        return
    fi
    
    # Remove 'v' prefix if present
    latest="${latest#v}"
    
    if [[ "$latest" != "$VERSION" ]]; then
        echo ""
        print_fire_box "🆕 UPDATE AVAILABLE!" 50
        echo -e "  ${NEON_CYAN}Current:${RESET} v${VERSION}"
        echo -e "  ${NEON_GREEN}Latest:${RESET}  v${latest}"
        echo ""
        echo -e "  ${DIM}Run this command to update:${RESET}"
        echo -e "  ${NEON_GREEN}curl -sL ${GITHUB_REPO}/raw/main/install.sh | bash${RESET}"
    else
        print_success "You have the latest version (v${VERSION})!"
    fi
}

#===============================================================================
# SECTION 24: MAIN COMPRESSION HANDLER
#===============================================================================

handle_compression() {
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
        if ! verify_key "true"; then
            sleep 2
            return
        fi
    fi
    
    # Get file path with autocomplete
    local input_path=""
    echo ""
    echo -e "  ${DIM}Tip: Use TAB for autocomplete, or paste full path${RESET}"
    echo -ne "  ${NEON_CYAN}Enter file or folder path: ${RESET}"
    read -e -r input_path
    
    # Handle empty input
    if [[ -z "$input_path" ]]; then
        print_error "No path provided!"
        sleep 2
        return
    fi
    
    # Trim whitespace
    input_path="${input_path#"${input_path%%[![:space:]]*}"}"
    input_path="${input_path%"${input_path##*[![:space:]]}"}"
    
    # Remove quotes if present
    input_path="${input_path//\"/}"
    input_path="${input_path//\'/}"
    
    # EXPAND ALL VARIABLES (~ $HOME $PWD etc) - CRITICAL FIX
    input_path=$(expand_path "$input_path")
    
    # Try to resolve path if not found directly
    if [[ ! -e "$input_path" ]]; then
        local resolved=$(resolve_path "$input_path")
        if [[ -e "$resolved" ]]; then
            input_path="$resolved"
        fi
    fi
    
    # Final validation
    if ! validate_file "$input_path"; then
        sleep 2
        return
    fi
    
    # Analyze file
    local original_size=$(analyze_file "$input_path")
    
    # Get extension
    local ext=".mdh"
    [[ "$mode" == "9" ]] && ext=".mdhz"
    
    # Select output path
    local output_path=$(select_output_path "$input_path" "$ext")
    
    echo ""
    echo -e "  ${NEON_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo -e "  ${NEON_GREEN}📄 Output file:${RESET} ${output_path}"
    echo -e "  ${NEON_CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    echo -ne "  ${NEON_YELLOW}Start compression? [Y/n]: ${RESET}"
    read -r proceed
    
    if [[ "${proceed,,}" == "n" ]]; then
        print_warning "Compression cancelled."
        sleep 1
        return
    fi
    
    echo ""
    local start_time=$SECONDS
    
    # Run compression
    local compress_result=0
    case "$mode" in
        1) compress_flash "$input_path" "$output_path" || compress_result=1 ;;
        2) compress_flower "$input_path" "$output_path" || compress_result=1 ;;
        3) compress_asian "$input_path" "$output_path" || compress_result=1 ;;
        4) compress_drunk "$input_path" "$output_path" || compress_result=1 ;;
        5) compress_beast "$input_path" "$output_path" || compress_result=1 ;;
        6) compress_godly "$input_path" "$output_path" || compress_result=1 ;;
        7) compress_legendary "$input_path" "$output_path" || compress_result=1 ;;
        8) compress_mythic "$input_path" "$output_path" || compress_result=1 ;;
        9) compress_mdhzone "$input_path" "$output_path" || compress_result=1 ;;
    esac
    
    local elapsed=$((SECONDS - start_time))
    
    # Calculate results
    if [[ -f "$output_path" ]]; then
        local compressed_size=$(get_size_bytes "$output_path")
        local saved=$((original_size - compressed_size))
        local ratio=$(echo "scale=2; (1 - $compressed_size / $original_size) * 100" | bc 2>/dev/null || echo "0")
        
        # Get mode name
        local mode_name=""
        case "$mode" in
            1) mode_name="flash" ;; 2) mode_name="flower" ;; 3) mode_name="asian" ;;
            4) mode_name="drunk" ;; 5) mode_name="beast" ;; 6) mode_name="godly" ;;
            7) mode_name="legendary" ;; 8) mode_name="mythic" ;; 9) mode_name="mdhzone" ;;
        esac
        
        echo ""
        print_double_box "✅ COMPRESSION COMPLETE!" "$NEON_GREEN" 60
        print_double_box_line "📁 Original:   $(format_size $original_size)" "$NEON_GREEN" 60
        print_double_box_line "📦 Compressed: $(format_size $compressed_size)" "$NEON_GREEN" 60
        print_double_box_line "💾 Saved:      $(format_size $saved)" "$NEON_GREEN" 60
        print_double_box_line "📊 Ratio:      ${ratio}%" "$NEON_GREEN" 60
        print_double_box_line "⏱️  Time:       $(format_time $elapsed)" "$NEON_GREEN" 60
        print_double_box_line "📄 Output:     $(basename "$output_path")" "$NEON_GREEN" 60
        print_double_box_end "$NEON_GREEN" 60
        
        # Update stats
        update_stats "compression" "$original_size" "$saved" "$mode_name" "$ratio"
        
        beep
        show_quote
    else
        print_error "Compression failed! Output file not created."
    fi
    
    echo ""
    echo -ne "  ${DIM}Press Enter to continue...${RESET}"
    read
}

#===============================================================================
# SECTION 25: MAIN MENU
#===============================================================================

show_main_menu() {
    clear_screen
    echo ""
    print_logo_compact
    print_version_badge
    echo ""
    show_stats_bar
    echo ""
    
    # Show key status
    local key_status=""
    if check_bypass_key 2>/dev/null || check_cached_key 2>/dev/null; then
        key_status="${NEON_GREEN}[🔓 FULL ACCESS]${RESET}"
    else
        key_status="${NEON_YELLOW}[🔒 FREE MODES ONLY]${RESET}"
    fi
    
    print_double_box "🔥 MAIN MENU" "$NEON_GREEN" 70
    echo -e "  ${DIM}Status:${RESET} $key_status"
    echo ""
    echo -e "  ${NEON_GREEN}[1]${RESET} 🗜️  ${BOLD}${NEON_CYAN}Compress${RESET}          ${DIM}│${RESET} 9 powerful modes"
    echo -e "  ${NEON_GREEN}[2]${RESET} 📦 ${BOLD}${NEON_CYAN}Extract${RESET}           ${DIM}│${RESET} Universal extractor"
    echo -e "  ${NEON_GREEN}[3]${RESET} 📤 ${BOLD}${NEON_CYAN}Transfer${RESET}          ${DIM}│${RESET} Share files instantly"
    echo -e "  ${NEON_GREEN}[4]${RESET} 🔑 ${BOLD}${NEON_CYAN}Enter Key${RESET}         ${DIM}│${RESET} Unlock all modes"
    echo -e "  ${NEON_GREEN}[5]${RESET} 📊 ${BOLD}${NEON_CYAN}Stats${RESET}             ${DIM}│${RESET} View your progress"
    echo -e "  ${NEON_GREEN}[6]${RESET} 💝 ${BOLD}${NEON_CYAN}Support/Donate${RESET}"
    echo -e "  ${NEON_GREEN}[7]${RESET} 🔄 ${BOLD}${NEON_CYAN}Check for Updates${RESET}"
    echo ""
    echo -e "  ${DIM}[0] Exit${RESET}"
    echo ""
    echo -ne "  ${NEON_CYAN}Select option: ${RESET}"
}

# Daily key check at startup
daily_key_check() {
    echo ""
    print_double_box "🔑 DAILY ACCESS CHECK" "$NEON_CYAN" 60
    echo ""
    
    # Check bypass first
    if check_bypass_key; then
        print_success "Bypass key active! Full access granted for today."
        sleep 2
        return 0
    fi
    
    # Check cached key
    if check_cached_key; then
        print_success "Welcome back, Digital Warrior! Key verified for today."
        sleep 2
        return 0
    fi
    
    # No valid key - prompt user
    echo -e "  ${NEON_YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    echo -e "  ${NEON_CYAN}To unlock ${NEON_GREEN}ALL 9 COMPRESSION MODES${NEON_CYAN}, you need a daily key.${RESET}"
    echo -e "  ${DIM}Without a key, only FREE modes (1-3) are available.${RESET}"
    echo ""
    echo -e "  ${NEON_YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    echo -e "  ${NEON_GREEN}[1]${RESET} 🔑 Get key now (opens browser)"
    echo -e "  ${NEON_GREEN}[2]${RESET} 📝 I have a key (enter it)"
    echo -e "  ${NEON_GREEN}[3]${RESET} ⏭️  Skip for now (FREE modes only)"
    echo ""
    echo -ne "  ${NEON_CYAN}Choice [1/2/3]: ${RESET}"
    read -r key_choice
    
    case "$key_choice" in
        1)
            # Open ad link
            local ad_link=$(get_ad_link)
            echo ""
            print_info "Opening browser..."
            print_info "Complete the verification to get your key."
            echo ""
            echo -e "  ${NEON_CYAN}Link: ${NEON_GREEN}${ad_link}${RESET}"
            echo ""
            open_browser "$ad_link"
            
            sleep 2
            echo ""
            echo -ne "  ${NEON_CYAN}Enter your key: ${RESET}"
            read -r user_key
            
            if [[ -n "$user_key" ]] && is_key_valid "$user_key"; then
                cache_key "$user_key"
                echo ""
                print_success "Key verified! Full access granted for today."
                achievement_sound
                sleep 2
                return 0
            else
                echo ""
                print_warning "Invalid key. You can still use FREE modes (1-3)."
                print_info "Select option 4 from menu to try again anytime."
                sleep 3
                return 1
            fi
            ;;
        2)
            echo ""
            echo -ne "  ${NEON_CYAN}Enter your key: ${RESET}"
            read -r user_key
            
            if [[ -n "$user_key" ]] && is_key_valid "$user_key"; then
                cache_key "$user_key"
                echo ""
                print_success "Key verified! Full access granted for today."
                achievement_sound
                sleep 2
                return 0
            else
                echo ""
                print_warning "Invalid key. You can still use FREE modes (1-3)."
                print_info "Select option 4 from menu to try again anytime."
                sleep 3
                return 1
            fi
            ;;
        3|*)
            echo ""
            print_info "Continuing with FREE modes (1-3)."
            print_info "Select option 4 from menu to enter key anytime."
            sleep 2
            return 1
            ;;
    esac
}

# Main program loop
main() {
    # Ensure directories exist
    mkdir -p "$INSTALL_DIR" "$LIB_DIR" "$CONFIG_DIR" "$BIN_DIR"
    
    # Initialize stats
    init_stats
    
    # Detect OS
    detect_os
    
    # Boot sequence (only on first run of this session)
    # Use a simpler approach - check if INSTALL_DIR exists with stats
    local boot_flag="${INSTALL_DIR}/.last_boot"
    local current_session="$$"
    local last_session=""
    
    [[ -f "$boot_flag" ]] && last_session=$(cat "$boot_flag" 2>/dev/null)
    
    if [[ "$last_session" != "$current_session" ]]; then
        boot_sequence_ultimate
        echo "$current_session" > "$boot_flag" 2>/dev/null || true
    fi
    
    # Daily key check - runs every session
    daily_key_check
    
    # Main loop
    while true; do
        show_main_menu
        read -r choice
        
        case "$choice" in
            1) handle_compression ;;
            2) handle_extraction ;;
            3) handle_transfer ;;
            4) 
                # Enter key menu option
                clear_screen
                echo ""
                print_logo_compact
                echo ""
                daily_key_check
                ;;
            5) show_stats_menu ;;
            6) show_donation_menu ;;
            7) check_for_updates; sleep 2 ;;
            0|q|Q)
                clear_screen
                echo ""
                print_center "$NEON_GREEN" "Thank you for using MDH_COMPRESSER!"
                print_center "$DIM" "\"Keep calm and compress on.\""
                echo ""
                print_center "$GOLD" "— ${AUTHOR}"
                echo ""
                echo -e "  ${NEON_CYAN}To run again, simply type:${RESET} ${NEON_GREEN}mdhcompresser${RESET}"
                echo ""
                show_cursor
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
# SECTION 26: INSTALLATION LOGIC
#===============================================================================

create_executable() {
    cat > "$MAIN_BINARY" << 'EXEC_EOF'
#!/bin/bash
INSTALL_DIR="$HOME/.mdhcompresser"
source "$INSTALL_DIR/lib/main.sh"
main "$@"
EXEC_EOF
    chmod +x "$MAIN_BINARY"
}

install_tool() {
    clear_screen
    echo ""
    print_logo_massive
    print_version_badge
    echo ""
    
    print_fire_box "🚀 INSTALLING MDH_COMPRESSER" 70
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
    
    # Copy this script as the main library
    print_step "Installing core modules..."
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
    [[ -f "$HOME/.bashrc" ]] && shell_rc="$HOME/.bashrc"
    [[ -f "$HOME/.zshrc" ]] && shell_rc="$HOME/.zshrc"
    [[ -z "$shell_rc" ]] && [[ -f "$HOME/.profile" ]] && shell_rc="$HOME/.profile"
    
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
    print_double_box "✅ INSTALLATION COMPLETE!" "$NEON_GREEN" 70
    echo ""
    echo -e "  ${NEON_GREEN}MDH_COMPRESSER v${VERSION} ${EDITION} is ready!${RESET}"
    echo ""
    echo -e "  ${FIRE}╔══════════════════════════════════════════════════════════╗${RESET}"
    echo -e "  ${FIRE}║${RESET}  ${NEON_CYAN}To launch the tool, type:${RESET}                              ${FIRE}║${RESET}"
    echo -e "  ${FIRE}║${RESET}                                                            ${FIRE}║${RESET}"
    echo -e "  ${FIRE}║${RESET}      ${NEON_GREEN}${BOLD}mdhcompresser${RESET}                                      ${FIRE}║${RESET}"
    echo -e "  ${FIRE}║${RESET}                                                            ${FIRE}║${RESET}"
    echo -e "  ${FIRE}╚══════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    echo -e "  ${NEON_YELLOW}⚠️  If 'command not found', restart your terminal first!${RESET}"
    echo -e "  ${DIM}   Or run: source ~/.bashrc${RESET}"
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
    print_info "Opening GitHub profile..."
    open_browser "https://github.com/MDHojayfa"
    
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

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    if [[ "$1" == "--run" ]] || [[ "$1" == "-r" ]]; then
        main
    else
        install_tool
    fi
fi
