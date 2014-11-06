#
# Copyright (C) 2014 Paul Beeler
# Copyright (C) 2014 The SaberMod Project
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

# begin generic MODULAR customizations
# Here will contain modular customizations for various ROM features or fixes.
# Most if not all of these features are disabled by default unless envoked elsewhere.
# This will act as a generic configuration.
# Adding more modules here (device specific or not), will remain compatible accrossed all devices.
# 

# begin pthread support
# Bug fix for saber linux ART and other modules that may need it.
# Use when having building errors related to "pthread".
# The last "error" in the build will tell you which module has an issue by having a name *****_intermidates.
# Here will be the module name excluding "_intermidates".
THREADS_MODULE_LIST := oatdump dex2oat
THREAD_FLAGS := -pthread
# end pthread support

# begin graphite support
# Enabled by default when "ENABLE_GRAPHITE := true" is used.
# ADD more modules here if needed.
# Examples of graphite needing to be disabled is if the build fails with a internal compiler error.
# The last "error" in the build will tell you which module has an issue by having a name *****_intermidates.
# Here will be the module name excluding "_intermidates".

DISABLE_GRAPHITE := \
       libstagefright_amrwbenc \
       libFFTEm \
       libwebviewchromium \
       libstagefright_mp3dec \
       libjni_filtershow_filters \
       libwebrtc_spl \
       mdnsd

GRAPHITE_FLAGS := -fgraphite -floop-flatten -floop-parallelize-all -ftree-loop-linear -floop-interchange -floop-strip-mine -floop-block
# end graphite support

# begin unused-parameter warning fix
# This is a example of a unused-parameter error
# error: unused parameter 'len' [-Werror=unused-parameter]
NO_ERROR_UP := \
	libbt-brcm_gki \
	bluetooth.default
# end unused-parameter warning fix

DISABLE_GNU11 := libLLVMSelectionDAG

## end unused-arguments fix

# end generic MODULAR customizations
