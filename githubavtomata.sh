#!/bin/bash
. ./.shcss.sh

menu () {
echo "$greybgwhite Menu $end"
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
echo "$greybgwhite Terminal Credentials Configuration $end"
echo
echo "$purple2 Enter your name with which you want to be recognized: $end"
echo
read name
echo
echo "$purple2 Enter your email address: $end"
echo
read email
echo
git config --global user.name "$name"
git config --global user.email "$email"
git config --global color.ui true
git config --global core.editor emacs
git config --global color.ui true
git config --global core.editor emacs
echo "$grey Saving credentials...$end"
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
echo "$greybgwhite SSH Key Configuration $white"
echo
echo "$grey Generating SSH Key... $end"
echo
sleep 1
yes "" | ssh-keygen -t rsa -C "diricojonathan@gmail.com"
sleep 1
echo 
echo
echo "$green2 A file called 'id_rsa.pub will' be opened alongside with the web browser in the GitHub SSH Key Creation directory to create the key. $end"
sleep 2
echo "$green2 Have in mind that the .pub file may take a few seconds longer to open depending on your computer specs. $end"
sleep 1
echo
echo Starting in a 3 seconds...
sleep 3
echo
echo "$green Press [ENTER] to continue ONLY after you've done setting up your SSH key: $end"
sleep 3
cd ~/.ssh/
open id_rsa.pub
sensible-browser https://github.com/settings/keys
read enter_continue;
echo "$grey Setting up host authenticator...$end"
sleep 1
echo
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
echo
echo "$grey Authenticating...$end"
echo "$negative"
ssh -T git@github.com
echo "$end"
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
mkdir -p ~/Projects/Git/
cd ~/Projects/Git/
clear
logo
echo "$greybgwhite Advanced GitHub Cloner $end" 
echo
echo "$grey For reference: https://github.com/USERNAME/REPOSITORY $end"
echo
while true; do
echo "$purple2 Enter the username that owns the repository: $end"
echo
read username
echo
echo "$purple2 Enter the repository name: $end"
echo
read repo
echo
echo "$cyan If the repository is succesfully created, it will be saved in: `pwd`  $end"
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
  echo -n "$red  Incorrect selection, try again: $end"
  main_menu
  echo
}

incorrect_selection_letter() {
  echo -n "$red Incorrect selection, try again: $end"
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
echo """$cyan
  ██████╗ ██╗████████╗██╗  ██╗██╗   ██╗██████╗      █████╗ ██╗   ██╗████████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗ █████╗ 
 ██╔════╝ ██║╚══██╔══╝██║  ██║██║   ██║██╔══██╗    ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗████╗ ████║██╔══██╗╚══██╔══╝██╔══██╗
 ██║  ███╗██║   ██║   ███████║██║   ██║██████╔╝    ███████║██║   ██║   ██║   ██║   ██║██╔████╔██║███████║   ██║   ███████║
 ██║   ██║██║   ██║   ██╔══██║██║   ██║██╔══██╗    ██╔══██║╚██╗ ██╔╝   ██║   ██║   ██║██║╚██╔╝██║██╔══██║   ██║   ██╔══██║
 ╚██████╔╝██║   ██║   ██║  ██║╚██████╔╝██████╔╝    ██║  ██║ ╚████╔╝    ██║   ╚██████╔╝██║ ╚═╝ ██║██║  ██║   ██║   ██║  ██║
  ╚═════╝ ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝     ╚═╝  ╚═╝  ╚═══╝     ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝
$end"""
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

