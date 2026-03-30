#!/bin/bash
STUDENT_NAME="Sania Nasreen"
ROLL_NUMBER="24BAI10761"
SOFTWARE_CHOICE="Mozilla Firefox"
LICENSE="Mozilla Public License 2.0 (MPL 2.0)"
KERNEL=$(uname -r)
ARCH=$(uname -m)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%d %B %Y')
CURRENT_TIME=$(date '+%H:%M:%S')
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -oP '(?<=^PRETTY_NAME=").*(?=")' /etc/os-release)
else
    DISTRO="Unknown Distribution"
fi
if command -v firefox &>/dev/null; then
    FF_STATUS="Installed $(firefox --version 2>/dev/null)"
else
    FF_STATUS="Not installed on this system"
fi
echo "=============================================="
echo "   OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT"
echo "=============================================="
echo "  Student   : $STUDENT_NAME ($ROLL_NUMBER)"
echo "  Project   : $SOFTWARE_CHOICE"
echo "----------------------------------------------"
echo "  OS        : $DISTRO"
echo "  Kernel    : $KERNEL"
echo "  Arch      : $ARCH"
echo "  User      : $USER_NAME"
echo "  Home Dir  : $HOME_DIR"
echo "  Uptime    : $UPTIME"
echo "  Date      : $CURRENT_DATE"
echo "  Time      : $CURRENT_TIME"
echo "  Firefox   : $FF_STATUS"
echo "----------------------------------------------"
echo "  LICENSE   : $LICENSE"
echo "=============================================="
echo "  'The web must remain open and accessible.'"
echo "         — Mozilla Manifesto"
echo "=============================================="
