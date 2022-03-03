#!/bin/bash

pathVersion='v6.7.0'

if [ $ARCH = arm64 ] || [ $ARCH = aarch64 ]
    then
        NAME=$(echo "$pathVersion" | grep -o '>node-v.*-linux-arm64.tar.gz' )
        VER=$(echo "$NAME" | grep -o 'node-v.*-linux-arm64.tar.gz')

    elif [ $ARCH = armv6l ]
    then
        NAME=$(echo "$pathVersion" | grep -o '>node-v.*-linux-armv6l.tar.gz' )
        VER=$(echo "$NAME" | grep -o 'node-v.*-linux-armv6l.tar.gz')

    elif [ $ARCH = armv7l ]
    then
        NAME=$(echo "$pathVersion" | grep -o '>node-v.*-linux-armv7l.tar.gz' )
        VER=$(echo "$NAME" | grep -o 'node-v.*-linux-armv7l.tar.gz')

    elif [ $ARCH = x86_64 ]
    then
        NAME=$(echo "$pathVersion" | grep -o '>node-v.*-linux-x64.tar.gz' )
        VER=$(echo "$NAME" | grep -o 'node-v.*-linux-x64.tar.gz')

    else
        NAME=$(echo "$pathVersion" | grep -o '>node-v.*-linux-x86.tar.gz' )
        VER=$(echo "$NAME" | grep -o 'node-v.*-linux-x86.tar.gz')
fi

echo "Downloading $pathVersion stable Version $VER..."
URL=http://nodejs.org/dist/$pathVersion/$VER
FILE_PATH=/tmp/node.tar.gz



curl -o $FILE_PATH $URL 2>/dev/null

cd /usr/local && sudo tar --strip-components 1 -xzf /tmp/node.tar.gz

#sudo ln -s /usr/local/node/bin/node /usr/bin/node
#sudo ln -s /usr/local/node/bin/npm /usr/bin/npm