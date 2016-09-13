#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TITLE="Affdex Android SDK Java Documentation"

javadoc -d $DIR -doctitle "$TITLE" -windowtitle "$TITLE" -header '<img src="{@docRoot}/affectiva.png">' -sourcepath $DIR/../../affdexsdk/src/main/java/ -subpackages com.affectiva.android.affdex.sdk.detector com.affectiva.android.affdex.sdk
