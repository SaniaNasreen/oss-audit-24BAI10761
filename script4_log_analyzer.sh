#!/bin/bash
LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0
echo "=============================================="
echo "           LOG FILE ANALYZER"
echo "       Student: Sania Nasreen | 24BAI10761"
echo "=============================================="
echo ""
if [ -z "$LOGFILE" ] || [ ! -f "$LOGFILE" ]; then
    echo "  Creating sample Firefox log for demo..."
    LOGFILE="/tmp/sample_firefox.log"
    cat > "$LOGFILE" << 'LOGEOF'
2026-03-21 10:01:01 INFO  Firefox started successfully
2026-03-21 10:01:02 INFO  Loading profile: default
2026-03-21 10:01:03 ERROR Failed to load extension: adblock
2026-03-21 10:01:04 WARNING Certificate mismatch on example.com
2026-03-21 10:01:05 INFO  Page loaded: google.com
2026-03-21 10:01:06 ERROR Network timeout on api.example.com
2026-03-21 10:01:07 INFO  Firefox update available: v124.0
2026-03-21 10:01:08 WARNING Low memory warning triggered
2026-03-21 10:01:09 ERROR Unable to write to cache directory
2026-03-21 10:01:10 INFO  Firefox session saved
LOGEOF
fi
echo "  Log file : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo ""
ATTEMPT=0
while true; do
    ATTEMPT=$((ATTEMPT + 1))
    if [ -s "$LOGFILE" ]; then
        break
    else
        echo "  [ATTEMPT $ATTEMPT] File empty, retrying..."
        if [ $ATTEMPT -ge 3 ]; then
            echo "  [ABORT] File remained empty."
            exit 1
        fi
        sleep 1
    fi
done
echo "----------------------------------------------"
echo "  Scanning for keyword: '$KEYWORD' ..."
echo "----------------------------------------------"
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"
echo ""
echo "  Total lines matching '$KEYWORD' : $COUNT"
echo ""
echo "----------------------------------------------"
echo "  LAST 5 MATCHING LINES:"
echo "----------------------------------------------"
grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r M; do
    echo "  >> $M"
done
echo ""
echo "----------------------------------------------"
echo "  FIREFOX CRASH LOG CHECK"
echo "----------------------------------------------"
CRASH_DIR="$HOME/.mozilla/firefox/Crash Reports/submitted"
if [ -d "$CRASH_DIR" ]; then
    echo "  Crash reports: $(ls "$CRASH_DIR" | wc -l)"
else
    echo "  No crash directory found — Firefox not crashed here!"
fi
echo ""
echo "=============================================="
echo "  Log analysis complete."
echo "=============================================="
