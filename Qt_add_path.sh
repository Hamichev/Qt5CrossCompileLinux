#! /bin/bash

NAME_USER=user
QT_DIR_NAME=Qt5.14.2 #No need to change if you installed Qt using Qt_installer.sh
QTDIR=/home/$NAME_USER/$QT_DIR_NAME #No need to change if you installed Qt using Qt_installer.sh

PATH=$QTDIR/bin:$PATH     
MANPATH=$QTDIR/doc/man:$MANPATH     
LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH     

export QTDIR PATH MANPATH LD_LIBRARY_PATH
