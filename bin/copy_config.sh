TARGET_DIR=$HOME/Dropbox/x1_Config/office/

cp -f ~/copy_config.sh $TARGET_DIR
cp -af ~/Library/Application\ Support/TextMate/PlugIns ${TARGET_DIR}TextMate/
cp -af ~/Library/Application\ Support/TextMate/Pristine\ Copy ${TARGET_DIR}TextMate/
cp -af ~/Library/Application\ Support/TextMate/Bundles ${TARGET_DIR}TextMate/

cp -af ~/.autotest ${TARGET_DIR}conf/
cp -af ~/.bash_profile ${TARGET_DIR}conf/
cp -af ~/.bashrc ${TARGET_DIR}conf/
cp -af ~/.bash_history ${TARGET_DIR}conf/
cp -af ~/.config ${TARGET_DIR}conf/
cp -af ~/.gemrc ${TARGET_DIR}conf/
cp -af ~/.gitconfig ${TARGET_DIR}conf/
cp -af ~/.heroku ${TARGET_DIR}conf/
cp -af ~/.irbrc ${TARGET_DIR}conf/
cp -af ~/.profile ${TARGET_DIR}conf/
cp -af ~/.terminitor ${TARGET_DIR}conf/
cp -af ~/.viminfo ${TARGET_DIR}conf/
cp -af ~/.termtter ${TARGET_DIR}conf/




