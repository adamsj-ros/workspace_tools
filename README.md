# workspace_tools
1. create new account `sudo useradd -m -s /usr/bin/zsh -G robot,sudo,docker jeremya`
2. update password `sudo passwd jeremya`
3. add key from local `ssh-copy-id jeremy@acon`
4. clone this repo `git clone https://github.com/adamsj-ros/workspace_tools.git`
5. `cd workspace_tools`
6. `./add_sh_symlinks.sh`
7. `mv ~/.zshrc ~/.zshrc.orig`
8. add symlinks again (TODO figure out why twice) `./add_sh_symlinks.sh`
