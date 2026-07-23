# NSCOUT
# 📡 NSCOUT – Professional Network Inventory Scanner

**NSCOUT** is a professional, menu‑driven network scanner built as a Bash script around `nmap`. It simplifies host discovery, port scanning, service detection, and OS fingerprinting – all from a clean, colourful terminal interface.

---

## ✨ Features

- **Interactive menu** with live target and status display.
- **Host discovery** – ping sweep and ARP discovery (requires root for ARP).
- **Multiple scanning profiles** – quick, common services, all TCP, all TCP/UDP, version detection, OS detection, traceroute, and IPv6.
- **Full & deep inventory** – comprehensive multi‑step scans.
- **Smart target handling** – automatically detects your local subnet.
- **Session‑based file management** – temporary files are cleaned up on exit.
- **Optional sudo integration** – uses root privileges when available for SYN scans and UDP accuracy.
- **Colourful output** – clear, readable terminal feedback.

---

## 📋 Requirements

- **Bash** 4.0 or later (most Linux/macOS systems have it).
- **nmap** – the actual scanning engine. The installer can help install it.
- **Root privileges** (optional) – required for SYN scans (`-sS`), ARP discovery, and accurate UDP scans.

---

## 🚀 One‑Line Installation

Copy and paste this command into your terminal:

```bash
git clone https://github.com/AhmedEmad-AEM/NSCOUT.git && cd NSCOUT && bash install.sh
