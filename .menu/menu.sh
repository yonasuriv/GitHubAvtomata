menu () {
echo "$greybgwhite Menu $end"
echo
echo "  1) Credentials Configurator (GitHub & SSH Key)"
echo "  2) Clone a repository"
echo "  3) Exit"
echo
echo -n "Choose one of the above options: "
}

main_menu  () {
read selection
echo
case $selection in
  1) credscfg;;
  2) git_clone ; menu_return;;
  3) credits;;
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

