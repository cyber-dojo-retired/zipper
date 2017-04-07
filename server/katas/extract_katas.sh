#!/bin/bash
set -e

# I want zipper to be decoupled from web for its testing so
# I'm unable to create new katas in the storer.
# So I
#  o) extract known katas from a private cyber-dojo (this file)
#  o) create a new storer-data-container from them (in docker-compose.yml)
#  o) mount the volumes from this container (in docker-compose.yml)
#
# DADD67B4EF is an empty kata
# F6986222F0 is a kata with one avatar and no traffic-lights
# 1D1B0BE42D is a kata with one avatar and one traffic-lights
# 697C14EDF4 is a kata with one avatar and three traffic-lights
# 7AF23949B7 is a kata with three avatar each with three traffic-lights
# 9EEBD21136 is a kata using CppUTest (has progress_regexs)
# 3FAFDE61E4 is a kata with nested sub-dirs

my_dir="$( cd "$( dirname "${0}" )" && pwd )"
cd ${my_dir}

CONTAINER_NAME=cyber-dojo-katas-DATA-CONTAINER
VOLUME_PATH=/usr/src/cyber-dojo/katas

docker run --rm \
  --volumes-from ${CONTAINER_NAME} \
  --volume $(pwd):/extract \
  cyberdojo/ruby \
  tar cvf /extract/extract.tar ${VOLUME_PATH}

tar -xvf extract.tar

rm -rf DA
mkdir DA
mv usr/src/cyber-dojo/katas/DA/DD67B4EF DA

rm -rf F6
mkdir F6
mv usr/src/cyber-dojo/katas/F6/986222F0 F6

rm -rf 1D
mkdir 1D
mv usr/src/cyber-dojo/katas/1D/1B0BE42D 1D

rm -rf 69
mkdir 69
mv usr/src/cyber-dojo/katas/69/7C14EDF4 69

rm -rf 7A
mkdir 7A
mv usr/src/cyber-dojo/katas/7A/F23949B7 7A

rm -rf 9E
mkdir 9E
mv usr/src/cyber-dojo/katas/9E/EBD21136 9E

rm -rf 3F
mkdir 3F
mv usr/src/cyber-dojo/katas/3F/AFDE61E4 3F

rm -rf usr
rm extract.tar
