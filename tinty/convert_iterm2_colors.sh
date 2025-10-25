#!/usr/bin/env bash
#
# Convert iTerm2 AppleScript colors from sRGB to Generic RGB.
#
# Converts all color values in the file using pattern matching.

# set -euo pipefail

filepath="$HOME/Library/Application Support/iTerm2/Scripts/AutoLaunch.scpt"

if [[ ! -f "$filepath" ]]; then
    echo "Error: File not found: $filepath" >&2
    exit 1
fi

# Create temporary file
temp_file=$(mktemp)

awk '
function srgb_to_linear(value) {
    if (value <= 0.04045) {
        return value / 12.92
    } else {
        return ((value + 0.055) / 1.055) ^ 2.4
    }
}

function apply_generic_gamma(value) {
    return value ^ (1 / 1.8)
}

function convert_color(r, g, b) {
    # Convert to normalized 8-bit values
    r_8bit = r / 257 / 255
    g_8bit = g / 257 / 255
    b_8bit = b / 257 / 255

    # sRGB -> linear -> Generic RGB
    r_linear = srgb_to_linear(r_8bit)
    g_linear = srgb_to_linear(g_8bit)
    b_linear = srgb_to_linear(b_8bit)

    r_generic = apply_generic_gamma(r_linear)
    g_generic = apply_generic_gamma(g_linear)
    b_generic = apply_generic_gamma(b_linear)

    # Convert back to 16-bit (add 0.5 for rounding)
    r_final = int(r_generic * 255 * 257 + 0.5)
    g_final = int(g_generic * 255 * 257 + 0.5)
    b_final = int(b_generic * 255 * 257 + 0.5)

    return r_final ", " g_final ", " b_final
}

{
    # Build the output line by processsing matches from left to right
    result = ""
    remaining = $0

    # Keep matching and replacing until no more macthes
    while (match(remaining, /set [a-zA-Z ]+ color to \{[0-9]+, [0-9]+, [0-9]+\}$/)) {
        # Add everything before the match
        result = result substr(remaining, 1, RSTART - 1)

        # Extract the matched text
        matched_text = substr(remaining, RSTART, RLENGTH)

        # Extract numbers and prefix
        match(matched_text, /\{[0-9]+, [0-9]+, [0-9]+\}/)
        color_part = substr(matched_text, RSTART, RLENGTH)

        # Get the prefix before the brace
        prefix_part = substr(matched_text, 1, RSTART - 1)

        # Extract RGB values
        gsub(/[{}]/, "", color_part)
        split(color_part, rgb, ", ")

        # Convert and add to result
        converted = convert_color(rgb[1], rgb[2], rgb[3])
        result = result prefix_part "{" converted "}"

        # Move past this match in the remaining string
        remaining = ""
    }

    # Add any remaining text after the last match
    result = result remaining

    print result
}
' "$filepath" > "$temp_file"

# Move temp file to original
mv "$temp_file" "$filepath" || {
    echo "Error writing file" >&2
    rm -f "$temp_file"
    exit 1
}
