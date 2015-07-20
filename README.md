# AndroidUninstall
Batch uninstall Android apps using this very convenient script. Just supply a package name (or part of it) and the script will take care of the uninstallation.

Interesting use cases:
* Uninstall all apps for your domain (e.g. *jmolsmobile*)
* Uninstall both the app and test apk
* Uninstall an apk for all users

# Usage
Simply invoke the script and supply (part of) a package name as an argument

```
./uninstall 'jmolsmobile'
```

The script will list all matching packages and prompt to confirm the action (y/n)

Sample output of the script:
```
Jeroens-MacBook-Pro:android_uninstall jmols$ ./uninstall.sh jmols

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
sudo chmod a+x ./uninstall.sh
```

This script requires adb to work and hence the Android SDK should be set up correctly in your PATH. To verify if that is the case, type `adb version` in your terminal. If this doesn't do anything, add the following lines to your `.bashrc`, `.bash_profile` or `.zshrc`:

```
export PATH=$PATH:<path to Android SDK>/platform-tools
export PATH=$PATH:<path to Android SDK>/tools
```

Optionally create an alias for the script in your your `.bashrc`, `.bash_profile` or `.zshrc`:
```
alias uninstall='<path from ~>/uninstall.sh'
```

# Next steps
* Mechanism to uninstall more than 10 apps at once (limitation is now there as a safety)
* Ruby bindings and gem for easier installation
* Distribute via Homebrew
