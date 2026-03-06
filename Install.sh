#!/bin/bash

# Directory for the CLI command
INSTALL_DIR="$HOME/QRGenCLI"
mkdir -p "$INSTALL_DIR"

TARGET="$INSTALL_DIR/qrgen"

echo "Downloading QRGen CLI..."

# Raw Python file URL (repo must be public)
RAW_URL="https://raw.githubusercontent.com/SebPng/QrGen/main/qrgen.py"

# Download the script
if curl -L -o "$TARGET" "$RAW_URL"; then
    echo "Download successful!"
else
    echo "Failed to download QRGen. Check your internet or URL."
    exit 1
fi

chmod +x "$TARGET"

# Install required Python modules
echo "Installing Python dependencies..."
pip3 install --user qrcode colorama

# Add to PATH if not already
if ! grep -q "$INSTALL_DIR" "$HOME/.bashrc"; then
    echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$HOME/.bashrc"
    echo "Added $INSTALL_DIR to PATH. Restart terminal or run: source ~/.bashrc"
fi

echo "QRGen CLI installation complete!"
echo "You can now run QRGen CLI from anywhere like this:"
echo "   qrgen 'Hello world!' --multi 2"