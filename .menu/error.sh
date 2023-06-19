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

incorrect_selection_number() {
  echo -n "$red  Incorrect selection, try again: $end"
  main_menu
  echo
}

