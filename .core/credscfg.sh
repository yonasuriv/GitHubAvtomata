

credscfg () {
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
echo "$grey Adding terminal credentials for $name...$end"
sleep 2
git config --global user.name "$name"
git config --global user.email "$email"
git config --global color.ui true
git config --global core.editor emacs
git config --global color.ui true
git config --global core.editor emacs
echo
echo "$grey Saving credentials...$end"
sleep 1
echo
git config --list
echo
echo "$greybgwhite Starting SSH Key Configuration $white"
echo
echo "$grey Generating SSH Key...$end"
echo
yes "" | ssh-keygen -t rsa -C "$email" > /dev/null 2>&1
sleep 1
echo """$negative A file called 'id_rsa.pub' will be opened alongside with your browser.$end 

	1 -$green Copy the content of the file opened.$end
	2 -$green Create a new SSH key in the your GitHub SSH Key Directory.$end
	3 -$green Paste the content of the file opened.$end"""
sleep 1
echo 
echo -n " Press [ENTER] to proceed: " && read enter_continue;
echo "\033[2A\033[2K" # removes 2 lines up
echo -n "$red Press [ENTER] to continue ONLY after you've done setting up your SSH key: $end"
sleep 3
open ~/.ssh/id_rsa.pub && open https://github.com/settings/keys
read enter_continue;
echo "\033[2A\033[2K" && echo "$grey Setting up host authenticator...                                                       $end"
sleep 1
echo
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts 2>/dev/null
echo "$grey Authenticating...$end"
echo "$negative"
ssh -T git@github.com
echo "$end"
git_clone_repeat
}
