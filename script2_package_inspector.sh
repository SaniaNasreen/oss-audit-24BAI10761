#!/bin/bash
PACKAGE="firefox"
echo "=============================================="
echo "         FOSS PACKAGE INSPECTOR"
echo "       Student: Shristy Kumari | 24BAI10711"
echo "=============================================="
echo ""
echo "  Inspecting package : $PACKAGE"
echo ""
if command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
elif command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
else
    PKG_MANAGER="unknown"
fi
echo "  Package Manager : $PKG_MANAGER"
echo ""
if [ "$PKG_MANAGER" = "dpkg" ]; then
    if dpkg -l | grep -qw "$PACKAGE"; then
        echo "  [INSTALLED] Firefox found!"
        dpkg -l "$PACKAGE" 2>/dev/null | tail -1 | awk '{print "  Name:", $2, "\n  Version:", $3}'
    else
        echo "  [NOT FOUND] Firefox not installed here."
        echo "  Install: sudo apt install firefox"
    fi
elif [ "$PKG_MANAGER" = "rpm" ]; then
    if rpm -q "$PACKAGE" &>/dev/null; then
        echo "  [INSTALLED] Firefox found!"
        rpm -qi "$PACKAGE" | grep -E 'Name|Version|License' | sed 's/^/  /'
    else
        echo "  [NOT FOUND] Firefox not installed."
    fi
else
    echo "  [INFO] No standard package manager found."
fi
echo ""
if command -v firefox &>/dev/null; then
    echo "  Binary Path : $(which firefox)"
    echo "  Version     : $(firefox --version 2>/dev/null)"
else
    echo "  Firefox binary not in PATH (normal in this environment)"
fi
echo ""
echo "----------------------------------------------"
echo "  PHILOSOPHY NOTES (case statement)"
echo "----------------------------------------------"
case $PACKAGE in
    firefox)
        echo "  Mozilla Firefox (MPL 2.0):"
        echo "  Born 2002 from Netscape Navigator ashes."
        echo "  Nonprofit browser fighting for open web."
        ;;
    chromium)
        echo "  Chromium: Open base Google Chrome is built on."
        ;;
    git)
        echo "  Git: Linus built it when proprietary tools failed."
        ;;
    *)
        echo "  Every open-source tool has a story of sharing."
        ;;
esac
echo ""
echo "=============================================="
