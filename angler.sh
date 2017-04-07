#!/bin/bash
#
# Copyright (C) 2015-2017, OwnDroid <owndroid26@gmail.com>
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# Please maintain this if you use this script or any part of it
#
 
# source envsetup
echo Start envsetup.sh
. build/envsetup.sh

# breakfast
echo Preparing Device: angler
breakfast angler

# Make UNOFFICIAL
echo Set Build Type to UNOFFICIAL
export OWNROM_BUILDTYPE=UNOFFICIAL

# Check breakfast again
echo Check OWNROM_VERSION= to be sure!
breakfast angler

# Turn on CCACHE
echo Turning on CCACHE
export USE_CCACHE=1

# fix jack server heap size error
echo Fixing jack server heap size error
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx8g"
 
# restart jack to apply updates
echo Restartig jack server to apply updates! 
./prebuilts/sdk/tools/jack-admin kill-server
./prebuilts/sdk/tools/jack-admin start-server

echo Finished!