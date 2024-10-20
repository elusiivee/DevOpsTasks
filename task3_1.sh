#!/bin/bash
create_usergroup() {
	local groupname="$1"
	local username="$2"

	if getent group "$groupname"; then
		echo "Group '$groupname' is already created."
	else groupadd "$groupname"
		echo "Group '$groupname' is created."
	fi

	if getent passwd "$username"; then
                echo "User '$username' is already created."
        else useradd -g "$groupname" "$username"
                echo "User '$username' is created."
	fi
}
read -p "Input a group name: " groupname
read -p "Input a user name: " username

create_usergroup "$groupname" "$username"


