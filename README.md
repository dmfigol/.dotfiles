## Instructions
This is a set of my dotfiles and scripts to bootstrap a new macOS.  
It comes along with this [gist](https://gist.github.com/dmfigol/104ac3637c1a29a97c4beb5c953dbe99), which installs macOS dev tools (they are necessary to be able to do `git clone`) and creates a shell script. The gist can be run using:  
```bash
curl -SL https://gist.githubusercontent.com/dmfigol/104ac3637c1a29a97c4beb5c953dbe99/raw/b550a86077721296f942a8b978db55f925b2f079/bootstrap-mac | bash
```  
This will create `~/bootstrap.sh`, which will download this repo. Inspect it, modify if needed (e.g. change git repo path to your fork) and run:  
```bash
bash ~/boostrap.sh
```  
This will clone the repo and check again if dev tools are installed.  
Check the repo files, you might want to modify any files. For example, `~/dotfiles/Brewfile` (contains packages to be installed with homebrew and cask) and `~/dotfiles/scripts/bootstrap.sh` (modify Python, Node, Ruby versions to be installed).  
Lastly, run `bootstrap.sh` which comes with this repo:  
```bash
bash ~/dotfiles/scripts/bootstrap.sh
```  