#! /bin/bash

NAME_USER=user
NAME_PROJECT=MainWindow
PATH_BIN=../Debug_$NAME_PROJECT/$NAME_PROJECT

PATH_APPIMAGE=.


$PATH_APPIMAGE/linuxdeployqt-continuous-x86_64.AppImage $PATH_BIN -bundle-non-qt-libs -unsupported-allow-new-glibc
$PATH_APPIMAGE/linuxdeployqt-continuous-x86_64.AppImage $PATH_BIN -appimage -unsupported-allow-new-glibc

#If you get the error when building: Categories entry not found in desktop file .desktop file is missing a Categories= key, then add default.desktop - Categories=Qt;Utility; to the end.
