#!/bin/bash

#
# Created by Michael S Corigliano for Team AOSPAL (michael.s.corigliano@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE="$1"
 
# start
   echo -e "Building AOSPAL 'AOSPSM' for $DEVICE";
   echo -e "";
   echo -e ""
 
# make 'build-logs' directory if it doesn't already exist
   echo -e "Making a 'build-logs' directory if you haven't already...";
   mkdir -p build-logs
   clear
 
# fetch latest sources
   echo -e "Fetching latest sources...";
   echo "Please select how many threads you would like to use to sync source:
         1) -j4
         2) -j8
         3) -j16
         4) -j32
         5) Don't sync"
      read n
         case $n in
            1) repo sync -j4
               ;;
            2) repo sync -j8
               ;;
            3) repo sync -j16
               ;;
            4) repo sync -j32
               ;;
            5) echo -e "Not syncing"
               ;;
            *) invalid option
               ;;
         esac
         clear

# Decide whether to build clean or dirty
   echo "Build clean or dirty:
         1) clean
         2) dirty"
      read n
         case $n in
            1) make clean
               ;;
            2) echo -e "Building dirty..."
               ;;
            *) invalid option
               ;;
         esac
         clear
 
# invoke the environment setup script to start the building process
   echo -e "Setting up build environment..."
   . build/envsetup.sh
   clear

# decide to build odex or deodex
   echo -e "";
   echo -e "";
   echo "Build odex or deodex:
         1) odex
         2) deodex"
      read n
         case $n in
            1) lunch aospal_$DEVICE-user
               ;;
            2) lunch aospal_$DEVICE-userdebug
               ;;
            *) invalid option
               ;;
         esac
         clear
 
# execute the build while sending a log to 'build-logs'
   echo -e "Starting build...";
   echo "Please select how many threads you would like to use to build:
         1) -j4
         2) -j8
         3) -j18
         4) -j32"
      read n
         case $n in
            1) make -j4 bacon 2>&1 | tee build-logs/aospal_$DEVICE.txt
               ;;
            2) make -j8 bacon 2>&1 | tee build-logs/aospal_$DEVICE.txt
               ;;
            3) make -j18 bacon 2>&1 | tee build-logs/aospal_$DEVICE.txt
               ;;
            4) make -j32 bacon 2>&1 | tee build-logs/aospal_$DEVICE.txt
               ;;
            *) invalid option
               ;;
         esac
 
# we're done
   echo -e "Finished building.";
   echo -e "If for some reason your build failed,";
   echo -e "please check the 'build-logs' directory to figure out why.";
   echo -e "";
   echo -e ""
