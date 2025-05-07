#!/bin/bash
# ChatGPT wrote this garbage.... 

# Define the colors for the radial gradient (Red on the outside to Orange and White inside)
OUTER="\033[38;5;124m"  # Dark Red
MID1="\033[38;5;160m"   # Crimson
MID2="\033[38;5;196m"   # Bright Red
MID3="\033[38;5;202m"   # Orange
MID4="\033[38;5;208m"   # Bright Orange
INNER="\033[97m"        # White (Reflection in the center)
RESET="\033[0m"         # Reset to default color

# Define the original Eye of Sauron ASCII art in terms of rows and columns
art=(
    "                @    @"
    "           @@@@@      @@@@@"
    "         @@@@@     @    @@@@@"
    "       @@@@@@@          @@@@@@@"
    "     @@@@@@@@@          @@@@@@@@@"
    "        @@@@@@          @@@@@@"
    "          @@@@@        @@@@@"
    "              @@@    @@@"
    "                @    @"
)

# Hardcoded width (longest line)
WIDTH=33  # You can adjust this based on the longest row's length
HEIGHT=${#art[@]}  # Number of rows

# Function to determine the color based on column position (for radial effect)
get_color() {
    local x=$1
    local y=$2
    local cx=19
    local cy=$((HEIGHT / 2)) # center y
    local dist

    # Reflect x-coordinate if it's on the right half
    if ((x > cx)); then
        x=$((2 * cx - x))  # Reflect x-coordinate across the center
    fi
    dist=$(echo "scale=2; sqrt(($x - $cx)^2 + ($y - $cy)^2)" | bc)

    # Ensure the center is always white
    if (( $dist < 2 )); then
        echo -e "$INNER"  # Center should always be white
    elif (( $(echo "$dist < 6" | bc -l) )); then
        echo -e "$MID4"  # Bright Orange
    elif (( $(echo "$dist < 8" | bc -l) )); then
        echo -e "$MID3"  # Orange
    elif (( $(echo "$dist < 10" | bc -l) )); then
        echo -e "$MID2"  # Bright Red
    elif (( $(echo "$dist < 12" | bc -l) )); then
        echo -e "$MID1"  # Crimson
    else
        echo -e "$OUTER"  # Dark Red on the outermost layer
    fi
}

# Remove any previous sauron.ans file
rm -f sauron.ans  # Remove the file to prevent appending to an old file


echo "Checking the ASCII art (each row):"
for ((y=0; y<HEIGHT; y++)); do
    echo "Row $y: '${art[$y]}'"  # Ensure all rows are being printed
done

# Loop over the art's rows
for ((y=0; y<HEIGHT; y++)); do
    line=""
    # Loop over the art's columns in the current row
    for ((x=0; x<WIDTH; x++)); do
        # Only apply colors to characters that are part of the Eye (@)
        char="${art[$y]:$x:1}"

        if [[ "$char" == "@" ]]; then
            color=$(get_color $x $y)
            line+="${color}█$RESET"  # Append colored character and reset color
        else
            line+=" "  # Keep spaces empty
        fi
    done
    echo "Generated line $y: $line"

    # Append the colored line to sauron.ans file
    echo -e "$line" >> sauron.ans
done

# Done
echo "Eye of Sauron with radial gradient has been saved to sauron.ans"
