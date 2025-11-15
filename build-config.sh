#!/bin/sh

# Define the hardware configuration file path
HARDWARE_CONFIG="hardware-configuration.nix"

# Check if the hardware configuration file exists
if [ ! -f "$HARDWARE_CONFIG" ]; then
    echo "[INFO] $HARDWARE_CONFIG not found. Generating a new one..."
    nixos-generate-config --hardware-config >"$HARDWARE_CONFIG"
    if [ $? -ne 0 ]; then
        echo "[ERROR] Failed to generate $HARDWARE_CONFIG. Exiting."
        exit 1
    fi
    git add "$HARDWARE_CONFIG"
    echo "[INFO] Successfully generated $HARDWARE_CONFIG."
fi

nixos-rebuild switch --flake .#desktop
if [ $? -eq 0 ]; then
    echo "[INFO] Build completed successfully."
else
    echo "[ERROR] Build failed. Check the configuration and try again."
    exit 1
fi
