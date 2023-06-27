#! /bin/bash

set -x

### Basic Packages
apt -qq -yy install equivs git devscripts lintian cmake --no-install-recommends

### Clone the source
git clone --depth=1 https://gitlab.freedesktop.org/hadess/power-profiles-daemon.git power-profiles-daemon
mv power-profiles-daemon/* . && rm -r power-profiles-daemon

### Install Dependencies
mk-build-deps -i -t "apt-get --yes" -r

### Build Deb
debuild -b -uc -us

### Move Deb to current directory because debuild decided
### that it was a GREAT IDEA TO PUT THE FILE ONE LEVEL ABOVE
mv ../*.deb .
