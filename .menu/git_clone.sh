git_clone_repeat (){
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
# mkdir -p ~/Projects/Git/
# cd ~/Projects/Git/
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
echo
git_clone_repeat
done
}
