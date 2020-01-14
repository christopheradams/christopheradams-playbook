#!/bin/bash
dconfdir=/org/gnome/terminal/legacy/profiles:

create_new_profile() {
    local profile_ids=($(dconf list $dconfdir/ | grep ^: |\
                        sed 's/\///g' | sed 's/://g'))
    local profile_name="$1"
    local profile_ids_old="$(dconf read "$dconfdir"/list | tr -d "]")"
    local profile_id="$(uuidgen)"

    dconf write "$dconfdir/:$profile_id"/visible-name "'$profile_name'"
    echo $profile_id
}

# Create profile
id=$(create_new_profile TEST)
