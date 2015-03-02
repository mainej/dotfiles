DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f ~/.emacs
mkdir -p ~/.emacs.d
ln -s "${DIR}/emacs.d/init.el" ~/.emacs.d/init.el
