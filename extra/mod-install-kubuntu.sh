#!/bin/bash
#
# This script only installs the required Perl modules.
#
# You will need to install the Ubuntu restricted extras package
# to use MP3.  This can be done using the following steps:
#
# 1) Click on "Add/Remove Programs" in the main menu
# 2) Click on the "Others" category
# 3) Scroll down and check the box next to Ubuntu restricted extras
# 4) Click on "Apply Changes"
#
# After completing the above steps you can install the required encoders
# and decoders using Adept Manager or in a terminal via 'sudo apt-get'
#
# It is suggested (and probably necessary) to complete the above steps
# before installing the below modules.
#
# run this script using: sh mod-install-kubuntu.sh

sudo apt-get install libogg-vorbis-header-perl \
                     libcddb-get-perl \
                     libaudio-musepack-perl \
                     libaudio-wma-perl \
                     libmp3-tag-perl \
                     libmp4-info-perl \
                     libaudio-flac-header-perl

