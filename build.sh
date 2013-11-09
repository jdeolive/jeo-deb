#!/bin/bash

set -x
set -e

ver=0.1
zip=jeo-$ver-cli.zip

if [ -e $zip ]; then
  rm $zip
fi

if [ -e tmp ]; then
  rm -rf tmp 
fi

rm -rf *.txt bin lib 

if [ "$1" == "clean" ]; then
  exit
fi

unzip -d tmp $zip
pushd tmp/jeo-$ver
mv * ../../
popd

debuild clean
debuild -uc -us -b -i
