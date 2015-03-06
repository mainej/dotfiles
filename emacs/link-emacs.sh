DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f ~/.emacs
mkdir -p ~/.emacs.d
ln -s "${DIR}/emacs.d/init.el" ~/.emacs.d/init.el

written_emacs_alias=`grep emacsclient ~/.bash_profile`
if [ $? -ne 0 ]; then
    echo "alias e='emacsclient -n -c -a \"\"'" >> ~/.bash_profile
    echo "alias e='emacsclient -nw -a \"\"'" >> ~/.bash_profile
fi
