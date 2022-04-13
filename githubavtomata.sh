#!/bin/bash
. ./.shcss.sh

menu () {
echo "\033[1;37;40m Menu \033[0m"
echo
echo "  1) Terminal Credentials Configure"
echo "  2) SSH Configure"
echo "  3) Clone a repository"
echo "  4) Exit"
echo
echo -n "Choose one of the above options: "
}

main_menu  () {
read selection
echo
case $selection in
  1) terminal_config ; ssh_config_jump;;
  2) ssh_config ; git_clone_jump;;
  3) git_clone ; menu_return;;
  4) credits;;
  *) incorrect_selection_number ; menu_return;;
esac
}

menu_return (){
while true; do
    read -p "Would you like to go back to the main menu? [y/n] "  input
    case $input in
        [yY]*)
            clear
            logo 
            menu
            main_menu
            break
            ;;
        [nN]*)
            credits
            exit 1
            ;;
         *)
            echo
            incorrect_selection_letter
            echo
            main_menu
    esac
done
}

terminal_config () {
clear
logo
echo "\033[1;37;40m Terminal Credentials Configuration \033[0m"
echo
echo "\033[0;33m By what name should do you want to be recognized in the repositories?\033[0m"
echo
read name
echo
echo "\033[0;33m What's your email adress?\033[0m"
echo
read email
echo
git config --global user.name "$name"
git config --global user.email "$email"
git config --global color.ui true
git config --global core.editor emacs
git config --global color.ui true
git config --global core.editor emacs
echo "\033[0;30m Saving credentials...\033[0m"
sleep 1
echo
git config --list
echo
}

ssh_config_jump (){
while true; do
    read -p "Would you like to set an SSH key? [y/n] "  input
    case $input in
        [yY]*)
            clear
            logo 
            ssh_config
            break
            ;;
        [nN]*)
            clear
            logo
            menu
            main_menu
            exit 1
            ;;
         *)
            echo
            incorrect_selection_letter
            echo
            main_menu
    esac
done
}

ssh_config () {
clear
logo
echo "\033[1;37;40m SSH Key Configuration \033[0m"
echo
echo "\033[0;30m Generating SSH Key...\033[0m"
echo
sleep 1
yes "" | ssh-keygen -t rsa -C "diricojonathan@gmail.com"
sleep 1
echo 
echo
echo "\033[0;32m A file called 'id_rsa.pub will' be opened alongside with the web browser in the GitHub SSH Key Creation directory to create the key. \033[0m"
sleep 2
echo "\033[0;32m Have in mind that the .pub file may take a few seconds longer to open depending on your computer specs. \033[0m"
sleep 1
echo
echo Starting in a 3 seconds...
sleep 3
echo
echo "\033[0;33m Press [ENTER] to continue ONLY after you've done setting up your SSH key: \033[0m"
sleep 3
cd ~/.ssh/
open id_rsa.pub
sensible-browser https://github.com/settings/keys
read enter_continue;
echo "\033[0;30m Setting up host authenticator...\033[0m"
sleep 1
echo
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
echo
echo "\033[0;30m Authenticating...\033[0m"
echo "\033[0;37m"
ssh -T git@github.com
echo "\033[0m"
git_clone_jump
}

git_clone_jump (){
while true; do
    read -p "Would you like to clone a repository? [y/n] "  input
    case $input in
        [yY]*)
            clear
            logo 
            git_clone
            break
            ;;
        [nN]*)
            clear
            logo
            menu
            main_menu
            exit 1
            ;;
         *)
            echo
            incorrect_selection_letter
            echo
            main_menu
    esac
done
}

git_clone () {
mkdir -p ~/Web\ Servers/
cd ~/Web\ Servers/
clear
logo
echo "\033[1;37;40m Advanced GitHub Cloner \033[0m" 
echo
echo For reference: https://github.com/USERNAME/REPOSITORY
echo
while true; do
echo "\033[0;33m Enter the username that owns the repository: \033[0m \033[0m"
echo
read username
echo
echo "\033[0;33m Enter the repository name: \033[0m"
echo
read repo
echo
echo "\033[0;32m If the repository is succesfully created, it will be saved in: `pwd`  \033[0m"
echo
git clone git@github.com:$username/$repo.git
git_cloner_loop
done
}

git_cloner_loop () {
echo
while true; do
    read -p "Would you like to go clone another repository? [y/n] "  input
    case $input in
        [yY]*)
            git_clone
            break
            ;;
        [nN]*)
            clear
            logo
            menu
            main_menu
            exit 1
            ;;
         *)
            echo
            incorrect_selection_letter
            main_menu
    esac
done
}

incorrect_selection_number() {
  echo -n "\033[0;31m Incorrect selection, try again: \033[0m"
  main_menu
  echo
}

incorrect_selection_letter() {
  echo -n "\033[0;31m Incorrect selection, try again: \033[0m"
  while true; do
    read -p ""  input
    case $input in
        [yY]*)
            clear
            logo
            menu
            main_menu
            break
            ;;
        [nN]*)
            clear
            credits
            exit 1
            ;;
         *)
            echo
            incorrect_selection_letter
            main_menu
    esac
done
  echo
}

logo () {
echo "  ________.__  __     ___ ___      ___.        _____          __                         __          ";
echo " /  _____/|__|/  |_  /   |   \ __ _\_ |__     /  _  \___  ___/  |_  ____   _____ _____ _/  |______   ";
echo "/   \  ___|  \   __\/    ~    \  |  \ __ \   /  /_\  \  \/ /\   __\/  _ \ /     \\__  \\   __\__  \  ";
echo "\    \_\  \  ||  |  \    Y    /  |  / \_\ \ /    |    \   /  |  | (  <_> )  Y Y  \/ __ \|  |  / __ \_";
echo " \______  /__||__|   \___|_  /|____/|___  / \____|__  /\_/   |__|  \____/|__|_|  (____  /__| (____  /";
echo "        \/                 \/           \/          \/                         \/     \/          \/ ";
echo
}

loader () {
clear
echo 
credits
sleep 1
echo Starting..
sleep 2
clear
}

credits () {
clear
echo 
echo Script created by: Jonathan Di Rico
echo https://yonasuriv.github.io/
echo
}

# Script Start

clear
loader
logo
menu
main_menu

