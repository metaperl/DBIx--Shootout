#!/bin/bash -x

export TGZ=sampledb.tgz

wget http://sampledb.svn.sourceforge.net/viewvc/sampledb.tar.gz?view=tar
mv sampledb.tar.gz* $TGZ
tar xvfz $TGZ

