#!/bin/bash
MAX_TO_UNINSTALL=10;

function list_installed {
	adb shell pm list packages | grep "$1" | sed s/package://g | tr -d '\r'
}

function count_installed {
	echo $1 | wc -w
}

function uninstall {
    PACKAGES=$(list_installed $1)
    INSTALLED=$(echo $PACKAGES | wc -w)

    echo Found $INSTALLED matching apps:
    list_installed $1 | sed "s/^/    /"

    echo ""
    if [ $INSTALLED -gt $MAX_TO_UNINSTALL ]; then
        echo "For security reasons cannot uninstall more than $MAX_TO_UNINSTALL apps"
        exit
    fi

	echo "Are you sure you want to uninstall these? (y/n)"
	read ANSWER
    echo ""
	if [ "$ANSWER" = "y" ]; then
		echo $PACKAGES | xargs -n 1 adb uninstall
	else
		echo "Did not uninstall anything"
	fi
}

function check_devices {
    CONNECTED=$(adb devices | wc -l)

    if [ $CONNECTED -le 2 ]; then
        echo "No devices connected"
        echo "Did not uninstall any apps"
        exit
    elif [ $CONNECTED -gt 3 ]; then
        echo "Too many devices connected ($(($CONNECTED-1)))"
        echo "Did not uninstall any apps"
        exit
    fi
}

function check_input {
    if [ -z "$1" ]; then
        echo "You need to specify a package to uninstall"
        exit
    fi
}

echo ""
check_input $1
check_devices
uninstall $1