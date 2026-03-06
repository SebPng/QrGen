#!/bin/bash

INSTALL_DIR="$HOME/QRGenCLI"
mkdir -p "$INSTALL_DIR"

TARGET="$INSTALL_DIR/qrgen"

echo "Downloading QRGen CLI..."

# Use your raw file URL here
RAW_URL="https://raw.githubusercontent.com/SebPng/QrGen/refs/heads/main/qrgen.py?token=GHSAT0AAAAAADW5SYCC6NGQA2URH73D6W6U2NLLXKQ"

if curl -L -o "$TARGET" "$RAW_URL"; then
    echo "Download successful!"
else
    echo "❌ Failed to download QRGen. Check your internet or URL."
    exit 1
fi

chmod +x "$TARGET"

# Add to PATH if not already
if ! grep -q "$INSTALL_DIR" "$HOME/.bashrc"; then
    echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$HOME/.bashrc"
    echo "Added $INSTALL_DIR to PATH. Restart terminal or run: source ~/.bashrc"
fi

echo "✅ Installation complete!"
echo "You can now run QRGen CLI like this:"
echo "   qrgen 'Hello world!' --multi 2"