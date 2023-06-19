## - ASCII Banner Generators
## https://manytools.org/hacker-tools/ascii-banner/ -> Uses the excellent FIGlet JS by patorjk https://patorjk.com/software/taag/
##
## - Global Color Configuration
## To add an style, simply put $style before the desired text and finish with $end
## echo There are so many $negative negative $end people in the world, some of them wana see the world$red burn $end
##
## - Importing color variables
## Copy the code below to the beggining of your script. (both files have to be in the same directory)
## '. ./shcss.sh'
##
## - Showing colors in the terminal before putting them in your Script
## Just uncomment the line of code at the end of this script and run 'sh colors.sh' in the terminal

end="\033[0m"
bold="\033[1m"
underline="\033[4m"
blink="\033[5m"
negative="\033[7m"
striket="\033[9m"
grey="\033[0;30m"
white="\033[0;37m"
white2="\033[1;37m"
red="\033[0;31m"
red2="\033[1;31m"
green="\033[0;32m"
green2="\033[1;32m"
yellow="\033[0;33m"
yellow2="\033[1;33m"
blue="\033[0;34m"
blue2="\033[1;34m"
purple="\033[0;35m"
purple2="\033[1;35m"
cyan="\033[0;36m"
cyan2="\033[1;36m"
redbg="\033[1;37;41m"
greenbg="\033[1;37;42m"
yellowbg="\033[1;37;43m"
bluebg="\033[1;37;44m"
purplebg="\033[1;37;45m"
cyanbg="\033[1;37;46m"
whitebg="\033[1;37;47m"
greybgred="\033[1;31;40m"
greybggreen="\033[1;32;40m"
greybgyellow="\033[1;33;40m"
greybgblue="\033[1;34;40m"
greybgpurple="\033[1;35;40m"
greybgcyan="\033[1;36;40m"
greybgwhite="\033[1;37;40m"

show_colors () {
clear
echo """
 \033[1m Bold\033[0m
  \033[4mUnderline\033[0m
 \033[5m Blink \033[0m
 \033[7m Negative \033[0m
  \033[9mStrikethrough\033[0m
 \033[0;30m Text color Grey \033[0m
 \033[0;37m Text color White \033[0m
 \033[1;37m Text color White Bright \033[0m
 \033[0;31m Text color Red \033[0m
 \033[1;31m Text color Red Bright \033[0m
 \033[0;32m Text color Green \033[0m
 \033[1;32m Text color Green Bright \033[0m
 \033[0;33m Text color Yellow \033[0m
 \033[1;33m Text color Yellow Bright \033[0m
 \033[0;34m Text color Blue \033[0m
 \033[1;34m Text color Blue Bright \033[0m
 \033[0;35m Text color Purple \033[0m
 \033[1;35m Text color Purple Bright \033[0m
 \033[0;36m Text color Cyan \033[0m
 \033[1;36m Text color Cyan Bright \033[0m
 \033[1;37;41m Background Red \033[0m
 \033[1;37;42m Background Green \033[0m
 \033[1;37;43m Background Yellow \033[0m
 \033[1;37;44m Background Blue \033[0m
 \033[1;37;45m Background Magenta \033[0m
 \033[1;37;46m Background Cyan \033[0m
 \033[1;30;47m Background White \033[0m
 \033[1;31;40m Background Grey with Red Text \033[0m
 \033[1;32;40m Background Grey with Green Text \033[0m
 \033[1;33;40m Background Grey with Yellow Text \033[0m
 \033[1;34;40m Background Grey with Blue Text \033[0m
 \033[1;35;40m Background Grey with Purple Cyan Text \033[0m
 \033[1;36;40m Background Grey with Cyan Text \033[0m
 \033[1;37;40m Background Grey with White Text \033[0m
"""
}

## - Unmark the line below here to print all colors available in the console

#show_colors



