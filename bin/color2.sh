# bash

## Scheme 1
PS1='\n\[$bold\]\[$black\][\[$dk_blue\]\A\[$black\]]-[\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]\w\[$black\]]\[\033[0;33m\]$(__vcs_name) \[\033[00m\]\[$reset\]\n\[$reset\]\$ '

## Scheme 2
PS1='\[\e]0;\w\a\]\[\e[07;91m\]\u\[\e[00;91m\]@\h:\[\e[0m\]\w\$ '

## Scheme 3
PS1='\n[\[$bold\]\[$dk_blue\]\u\[$yellow\]@\[$bold\]\[$red\]\h\[$black\]\[$reset\]] \[$bold\]\[$pink\]\w \[\033[0;33m\]$(__vcs_name) \[\033[00m\]\[$reset\]\n\[$reset\]\$ '

# Основная строка приглашения
#   user@host:server and current_directory
# PS1='\[\e]0;\w\a\]\n\[\e[32m\]server \u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
#
# С переводом на новую строчку
# PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

# # Без перевода на новую строчку
# PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\$ '

# # Эффективно для рута, подсвечивает красным супераользователя
# PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[31;01m\]\u\[\e[0m\]@\h:\w\$ '
# #
# # Для самого рута
# PS1="\[\e[31m\]\u\[\e[0m\]@\h: \w\a# "
# #
# # Рут вошел через пользователя
PS1='\[\e]0;\w\a\]\n\[\e[31;01m\]\u\[\e[0m\]\[\e[32m\]@\h \[\e[33m\]\w\[\e[0m\]\n\[\e[31;01m\]\$\[\e[0m\] '
# # -----------------------------------------------------------------------------
# # Nicely formatted terminal prompt

export PS1