#! /bin/bash

NAME_USER=user
QT_DIR_NAME=Qt5.14.2
NAME_PROJECT=MainWindow

PATH_QMAKE=/home/$NAME_USER/$QT_DIR_NAME/bin/qmake #It is relevant if the installation was performed using Qt_installer.sh
PATH_BIN=../$NAME_PROJECT/$NAME_PROJECT.pro

mkdir Debug_$NAME_PROJECT

cd ./Debug_$NAME_PROJECT
$PATH_QMAKE $PATH_BIN -spec linux-g++ "CONFIG+=debug" "CONFIG+=qml_debug"
make -f Makefile qmake_all
make -j8