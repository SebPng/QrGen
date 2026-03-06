#!/usr/bin/env python3
import argparse
import qrcode
import os
from datetime import datetime
from colorama import Fore, Style, init

init(autoreset=True)

SAVE_DIR = os.path.expanduser("~/QRGen")
os.makedirs(SAVE_DIR, exist_ok=True)

def generate_qr(text, index=1):
    qr = qrcode.QRCode(
        version=1,
        box_size=10,
        border=4
    )
    qr.add_data(text)
    qr.make(fit=True)

    img = qr.make_image(fill_color="black", back_color="white")
    timestamp = datetime.now().strftime("%Y%m%d%H%M%S")
    filename = f"qr_{index}_{timestamp}.png"
    path = os.path.join(SAVE_DIR, filename)
    img.save(path)
    print(Fore.GREEN + f"QR code saved: {path}")

def main():
    parser = argparse.ArgumentParser(description="QR Code Generator CLI")
    parser.add_argument("text", nargs="+", help="Text(s) to generate QR code for")
    parser.add_argument("--multi", type=int, default=1, help="Generate each QR code N times")
    parser.add_argument("--helpme", action="help", help="Show this help message")
    args = parser.parse_args()

    for i in range(args.multi):
        for idx, txt in enumerate(args.text, start=1):
            generate_qr(txt, idx)

if __name__ == "__main__":
    main()