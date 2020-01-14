#!/bin/bash
dconfdir=/org/gnome/terminal/legacy/profiles:

source scripts/get_gnome_terminal_profile_uuid.sh

id=$(get_profile_uuid "$1")

dconf write $dconfdir/:$id/use-theme-transparency false
dconf write $dconfdir/:$id/use-transparent-background true
dconf write $dconfdir/:$id/background-transparency-percent 0
dconf write $dconfdir/:$id/cursor-background-color "'rgb(171,70,66)'"
