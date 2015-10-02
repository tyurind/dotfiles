# bash
DIR=$( cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )

cd $DIR


_cp_home ()
{
	_src=$1
	_dist="${HOME}/.${_src}"

	if [ -f "${_dist}" ]; then
		echo "Error: '${_dist}' home file is exist"
		return 1
	fi

	cp "${_src}" "${_dist}"
}


cat bash/* > bash_functions
_cp_home bash_functions
rm bash_functions

_cp_home gitconfig
_cp_home gitignore
_cp_home vimrc


if grep '~/.bash_functions' ~/.bashrc &>/dev/null
then
	echo "Есть совпадения"
else
	echo ' ' >> ~/.bashrc
	echo 'if [ -f ~/.bash_functions ]; then source ~/.bash_functions; fi' >> ~/.bashrc
fi
