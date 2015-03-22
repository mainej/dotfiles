DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f ~/.emacs
rm -rf ~/.emacs.d
ln -s "${DIR}/emacs.d" ~/.emacs.d

written_emacs_alias=`grep emacsclient ~/.bash_profile`
if [ $? -ne 0 ]; then
    echo "alias e='emacsclient -n -c -a \"\"'" >> ~/.bash_profile
    echo "alias et='emacsclient -nw -a \"\"'" >> ~/.bash_profile
fi
