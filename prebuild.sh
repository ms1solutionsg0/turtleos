#!/bin/bash -e

sgr() {
    local codes=${1:-0}; shift
    for c in "$@"; do codes="$codes;$c"; done
    echo -n -e "\e[${codes}m"
}
# Font styles
BOLD=$(sgr 1)
RED=$(sgr 31)
GREEN=$(sgr 38 5 2)
RST=$(sgr 0)

export IMG_NAME='TurtleOS'
export IMG_DATE="$(date +%Y%m%d)"
export DEBIAN_FRONTEND='noninteractive'
export LC_ALL='C.UTF-8'

if [ -n "${GIT_TAG:-}" ]; then
    export IMG_FILENAME="${IMG_NAME}-${GIT_TAG}-${IMG_DATE}"
else
    export IMG_FILENAME="${IMG_NAME}-${IMG_DATE}"
fi

export ZIP_FILENAME=$IMG_FILENAME

if ! [ -n "${GITHUB_TOKEN:-}" ]; then
    . GITHUB_TOKEN
    export GITHUB_TOKEN="$GITHUB_TOKEN"
fi

cd "$(dirname "$0")"
mkdir -p build
cd build

merge () {
    # Merge overlay with the original pi-gen
    echo -e " Merging overlay with the original pi-gen"
    cp -rf ../pi-gen/* .
    rm -rf stage2/EXPORT_NOOBS stage2/EXPORT_IMAGE stage3 stage4 stage5
    cp -rf ../pi-gen-overlay/* .
}

case "$1" in
    -s) echo -e "$BOLD Performing build of $GREEN$IMG_NAME$RST..."
        echo -e " Skipping all stages except stage3"

        merge

        for STAGE_DIR in "stage"*; do
            if [ "$STAGE_DIR" != stage3 ]; then
                echo " + Adding SKIP file to $STAGE_DIR"
                touch $STAGE_DIR/SKIP
            fi
        done
        echo -en " "
        echo "-------------------------"

        CLEAN=1 ./build.sh
        ;;
    *) echo -e "$BOLD Performing build of $GREEN$IMG_NAME$RST..."
       echo -e "$BOLD Building all stages$RST"

        merge

        for STAGE_DIR in "stage"*; do
            echo "- Removing SKIP* file in $STAGE_DIR"
            rm -f $STAGE_DIR/SKIP*
        done

        ./build.sh
        ;;
esac
