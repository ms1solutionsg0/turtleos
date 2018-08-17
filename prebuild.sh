#!/bin/bash -e

export IMG_NAME='turtleos'
export DEBIAN_FRONTEND='noninteractive'
export LC_ALL='C.UTF-8'

if [ -n "${TRAVIS_TAG:-}" ]; then
	export IMG_DATE="$TRAVIS_TAG"
fi

cd "$(dirname "$0")"
mkdir -p build
cd build

merge () {
    # Merge overlay with original pi-gen
    cp -rf ../pi-gen/* .
    rm -rf stage2/EXPORT_NOOBS stage2/EXPORT_IMAGE stage3 stage4 stage5
    cp -rf ../pi-gen-overlay/* .
}

case "$1" in
    -s) echo "Skipping all stages except stage3"

        merge

        for STAGE_DIR in "stage"*; do
            if [ "$STAGE_DIR" != stage3 ]; then
                echo "+ Adding SKIP file to $STAGE_DIR"
                touch $STAGE_DIR/SKIP
            fi
        done
        CLEAN=1 ./build.sh
        ;;
    *) echo "Performing full build of $IMG_NAME..."

        merge

        for STAGE_DIR in "stage"*; do
            echo "- Removing SKIP* file in $STAGE_DIR"
            rm -f $STAGE_DIR/SKIP*
        done

        ./build.sh
        ;;
esac
