#!/bin/bash
#
# change to qconsole directory
# load J with qconsole script

cd ~/q/qconsole
~/j701/bin/jconsole -jprofile lib/qconsole.ijs "$@"
