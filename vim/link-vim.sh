DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f ~/.vimrc
rm -rf ~/.vim || true
ln -s "${DIR}/vimrc" ~/.vimrc
ln -s "${DIR}/dotvim" ~/.vim
