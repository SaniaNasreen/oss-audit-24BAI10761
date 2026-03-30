#!/bin/bash
today() {
    date '+%d %B %Y'
}
greet() {
    echo "  Welcome, $(whoami)! Let's write your manifesto."
}
OUTPUT="manifesto_$(whoami).txt"
echo "=============================================="
echo "     OPEN SOURCE MANIFESTO GENERATOR"
echo "     Student : Sania Nasreen | 24BAI10761"
echo "     Audited : Mozilla Firefox"
echo "=============================================="
echo ""
greet
echo ""
echo "  Answer 3 questions below:"
echo "----------------------------------------------"
echo ""
read -p "  1. One open-source tool you use every day: " TOOL
echo ""
read -p "  2. In one word, what does freedom mean to you: " FREEDOM
echo ""
read -p "  3. One thing you would build and share freely: " BUILD
echo ""
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  [ERROR] All answers required. Please re-run."
    exit 1
fi
DATE=$(today)
> "$OUTPUT"
echo "==============================================" >> "$OUTPUT"
echo "  OPEN SOURCE MANIFESTO"                       >> "$OUTPUT"
echo "  Author : Sania Nasreen (24BAI10761)"        >> "$OUTPUT"
echo "  Date   : $DATE"                              >> "$OUTPUT"
echo "  Audit  : Mozilla Firefox"                    >> "$OUTPUT"
echo "----------------------------------------------" >> "$OUTPUT"
echo ""                                              >> "$OUTPUT"
echo "I am a developer who believes in the open web." >> "$OUTPUT"
echo ""                                              >> "$OUTPUT"
echo "Every day, I use $TOOL — a tool that exists"  >> "$OUTPUT"
echo "because someone chose to share it freely."    >> "$OUTPUT"
echo ""                                              >> "$OUTPUT"
echo "To me, freedom means $FREEDOM."               >> "$OUTPUT"
echo "Firefox embodies that — open, nonprofit,"     >> "$OUTPUT"
echo "and licensed under MPL 2.0 for everyone."     >> "$OUTPUT"
echo ""                                              >> "$OUTPUT"
echo "One day I will build $BUILD and share it"     >> "$OUTPUT"
echo "openly, just like those who came before me."  >> "$OUTPUT"
echo ""                                              >> "$OUTPUT"
echo "'The web is for everyone.'"                   >> "$OUTPUT"
echo "  — Mozilla Manifesto"                         >> "$OUTPUT"
echo ""                                              >> "$OUTPUT"
echo "This is my open source manifesto."            >> "$OUTPUT"
echo "==============================================" >> "$OUTPUT"
echo ""
echo "  Manifesto saved to: $OUTPUT"
echo ""
cat "$OUTPUT"
echo "=============================================="
