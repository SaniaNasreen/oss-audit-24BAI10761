#!/bin/bash
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")
echo "=============================================="
echo "        DISK AND PERMISSION AUDITOR"
echo "       Student: Sania Nasreen | 24BAI10761"
echo "=============================================="
echo ""
printf "  %-25s %-22s %-10s\n" "DIRECTORY" "PERMS/USER/GROUP" "SIZE"
echo "  ---------------------------------------------------------------"
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        printf "  %-25s %-22s %-10s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"
    else
        printf "  %-25s %-22s\n" "$DIR" "[DOES NOT EXIST]"
    fi
done
echo ""
echo "----------------------------------------------"
echo "  FIREFOX — CONFIG DIRECTORY AUDIT"
echo "----------------------------------------------"
echo ""
FIREFOX_DIRS=("$HOME/.mozilla/firefox" "$HOME/.cache/mozilla/firefox" "/usr/lib/firefox" "/etc/firefox")
for FDIR in "${FIREFOX_DIRS[@]}"; do
    if [ -d "$FDIR" ]; then
        FPERMS=$(ls -ld "$FDIR" | awk '{print $1, $3, $4}')
        FSIZE=$(du -sh "$FDIR" 2>/dev/null | cut -f1)
        echo "  [FOUND]     $FDIR"
        echo "              Permissions : $FPERMS"
        echo "              Size        : ${FSIZE:-N/A}"
    else
        echo "  [NOT FOUND] $FDIR"
    fi
done
echo ""
echo "----------------------------------------------"
echo "  FIREFOX PROFILE COUNT"
echo "----------------------------------------------"
PROFILE_DIR="$HOME/.mozilla/firefox"
if [ -d "$PROFILE_DIR" ]; then
    PROFILE_COUNT=$(find "$PROFILE_DIR" -maxdepth 1 -type d | tail -n +2 | wc -l)
    echo "  Firefox profiles found : $PROFILE_COUNT"
else
    echo "  No Firefox profiles found (not launched here)"
fi
echo ""
echo "=============================================="
echo "  Audit complete."
echo "=============================================="
