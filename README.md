## Instructions
This is a set of my dotfiles and scripts to bootstrap a new system (MacOS/Linux).  
First install [Homebrew](https://brew.sh/) and clone the repo:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone https://github.com/dmfigol/dotfiles.git
```
Homebrew installs not only homebrew itself, but also xcode dev tools, which are required for using git and some other programs.  
You might want to modify some scripts in the repo. For example, `~/dotfiles/homebrew/Brewfile` (contains packages to be installed with homebrew and cask) or `~/dotfiles/scripts/node/default-packages` (packages to be installed with Node.js).  
Lastly, run `bootstrap.sh` which comes with this repo:  
```bash
~/dotfiles/scripts/bootstrap.sh
```  

## Older
Previously it was suggested to use this [gist](https://gist.github.com/dmfigol/104ac3637c1a29a97c4beb5c953dbe99) like this:  
```bash
curl -SL https://gist.githubusercontent.com/dmfigol/104ac3637c1a29a97c4beb5c953dbe99/raw/b550a86077721296f942a8b978db55f925b2f079/bootstrap-mac | bash
```  
This was required because on MacOS git doesn't work until you install Xcode dev tools. However, I have recently discovered that homebrew install devtools.
