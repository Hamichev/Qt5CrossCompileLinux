#! /bin/bash

#Start Parameters
NAME_USER="user" #You must specify the name of the current user
PATH_QT_INSTALLER="/home/$NAME_USER" #You must specify the installation path of Qt5.14.2 and place the qt-everywhere-src-5.14.2 archive there.
QT_DIR_NAME="Qt5.14.2" #The name of the Qt folder
#End Parameters

echo "Create dir $QT_DIR_NAME"
cd /home/$NAME_USER
mkdir $QT_DIR_NAME

echo "Unarchive qt-everywhere-src-5.14.2"
cd $PATH_QT_INSTALLER
rm -r qt-everywhere-src-5.14.2
tar -xvf qt-everywhere-src-5.14.2.tar.xz

echo "Install Base packet"
sudo apt-get install python -y
sudo apt-get install perl -y
sudo apt-get install build-essential -y
sudo apt-get install ruby-full -y
sudo apt-get install libxcb-xfixes0-dev -y

sudo apt-get install libx11-* -y
sudo apt-get install libx11* -y
sudo apt-get install libxcb-* -y
sudo apt-get install libxcb* -y
sudo apt-get install libxkbcommon-dev -y
sudo apt-get install libxkbcommon-x11-dev -y
sudo apt-get install libfontconfig1-dev -y

sudo apt-get update
sudo apt-get upgrade -y

echo "Start configure"

QT_INSTALL_PATH="-prefix /home/$NAME_USER/$QT_DIR_NAME"     # Qt installation path (own modification)
QT_COMPLIER+="-platform linux-g++"  # translater

CONFIG_PARAM+="-v "               # Static compile
CONFIG_PARAM+="-no-opengl "               # Static compile
CONFIG_PARAM+="-static "               # Static compile
CONFIG_PARAM+="-release "             # Compile Release
CONFIG_PARAM+="-fontconfig -system-freetype "               # Fonts
CONFIG_PARAM+="-make libs "    # Do not compile EXAMPLES
CONFIG_PARAM+="-make tools "    # Do not compile EXAMPLES
CONFIG_PARAM+="-nomake examples "    # Do not compile EXAMPLES
CONFIG_PARAM+="-nomake tests "        # Do not compile Tests

CONFIG_PARAM+=" -qt-xcb -qt-zlib -qt-libpng -qt-libjpeg "

# Select the QT version (open source, business), and automatically confirm the license certification
CONFIG_PARAM+="-opensource "         # Compile open source version, -commercial commercial version
CONFIG_PARAM+="-confirm-license "      # Automatic confirmation license certification

cd $PATH_QT_INSTALLER/qt-everywhere-src-5.14.2

./configure $CONFIG_PARAM $QT_COMPLIER $QT_INSTALL_PATH

echo "Start make"
make -j8

echo "Start make install"
make install -j8
