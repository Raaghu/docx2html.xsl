
TESTDIR=$(dirname "$BASH_SOURCE")
STYLESHEET="$TESTDIR/../xsl/docx2html.xsl";

SAVEIFS=$IFS
IFS=$(echo -en "\n\b");

function handle_file() {
    SOURCE="$1"
    OUTPUT="$2"
    CSS="$3"
    TITLE="$4"
    echo "xslt transform for file: $SOURCE"
    java net.sf.saxon.Transform \
        -s:"$SOURCE" \
        -xsl:"$STYLESHEET" \
        -o:"$OUTPUT" \
        "css-path"="$CSS" \
        "page-title"="$TITLE" \
        "fabricate-css-classes"="1"
}

function doc_title() {
   FILE="$1";
   DIR=$(dirname $FILE);
   DIR=$(dirname $DIR);
   DIR=$(dirname $DIR);
   DIR=$(basename $DIR);
   echo $DIR;
}

rm -rf "working/*"
for SOURCE in `find "$TESTDIR/input" -name document.xml`
do
    OUTPUT_DIR=$( echo $SOURCE | sed 's!input!working!' | sed 's!/docx.*!!' )
    mkdir -p $OUTPUT_DIR;
    OUTPUT="$OUTPUT_DIR/out.html";
    TITLE="$( doc_title $SOURCE )";
    CSS="style.css"
    handle_file $SOURCE $OUTPUT $CSS $TITLE
done

opendiff "$TESTDIR/output" "$TESTDIR/working" & 

# cleanup
IFS=$SAVEIFS

