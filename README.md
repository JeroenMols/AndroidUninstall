# AndroidUninstall
Batch uninstall Android apps using this very convenient script. Just supply a package name (or part of it) and the script will take care of the uninstallation.

Very useful when:
* You pick a shared device and want to *clean* it from all your domains apps (e.g. *jmols*)
* You want to uninstall both the app and test apk at the same time
* You want to uninstall an apk for all users

<p align="center">
  <img src="https://raw.githubusercontent.com/JeroenMols/AndroidUninstall/master/screenrecord.gif" alt="Script in action" height="450"/>
</p>

# Usage
Simply invoke the script and supply (part of) a package name as an argument

```
./rmapps 'jmols'
```

The script will list all matching packages and prompt to confirm the action (y/n)

Sample output of the script:
```
Jeroens-MacBook-Pro:android_uninstall jmols$ ./rmapps.sh jmols

Found 6 matching apps:
    com.jmolsmobile.babydosis
    com.jmols.wi_filetransfer
    com.jmolsmobile.calleridmanager
    com.jmolsmobile.brittenjeroen
    com.jmolsmobile.jmmj
    com.jmolsmobile.landscapevideocapture_sample

Are you sure you want to uninstall these? (y/n)
n

Did not uninstall anything
```

# Installation
Make sure the script is executable:
```
sudo chmod a+x ./rmapps.sh
```

This script requires adb to work and hence the Android SDK should be set up correctly in your PATH. To verify if that is the case, type `adb version` in your terminal. If this doesn't do anything, add the following lines to your `.bashrc`, `.bash_profile` or `.zshrc`:

```
export PATH=$PATH:<path to Android SDK>/platform-tools
export PATH=$PATH:<path to Android SDK>/tools
```

Optionally create an alias for the script in your your `.bashrc`, `.bash_profile` or `.zshrc`:
```
alias rmapps='<path from ~>/rmapps.sh'
```

# Next steps
* Mechanism to uninstall more than 10 apps at once (limitation is now there as a safety)
* Ruby bindings and gem for easier installation
* Distribute via Homebrew
