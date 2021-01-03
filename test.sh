#!/bin/sh
#
# Wrapper around `swift test' using config.sh and checking
# that the swift wrapper code exists
#
. ./config.sh
gtk=`echo $BUILD_DIR/checkouts/SwiftGtk*/Sources/Gtk/Gtk-?.0.swift`
[ -e $gtk ] || ./generate-wrapper.sh
exec swift test -build-path "$BUILD_DIR" "$@"
