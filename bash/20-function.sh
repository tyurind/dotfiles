
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
cd_func ()
{
  local x2 the_new_dir adir index
  local -i cnt

  if [[ $1 ==  "--" ]]; then
    dirs -v
    return 0
  fi

  the_new_dir=$1
  [[ -z $1 ]] && the_new_dir=$HOME

  if [[ ${the_new_dir:0:1} == '-' ]]; then
    #
    # Extract dir N from dirs
    index=${the_new_dir:1}
    [[ -z $index ]] && index=1
    adir=$(dirs +$index)
    [[ -z $adir ]] && return 1
    the_new_dir=$adir
  fi

  #
  # '~' has to be substituted by ${HOME}
  [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

  #
  # Now change to the new dir and add to the top of the stack
  pushd "${the_new_dir}" > /dev/null
  [[ $? -ne 0 ]] && return 1
  the_new_dir=$(pwd)

  #
  # Trim down everything beyond 11th entry
  popd -n +20 2>/dev/null 1>/dev/null

  #
  # Remove any other occurence of this dir, skipping the top of the stack
  for ((cnt=1; cnt <= 20; cnt++)); do
    x2=$(dirs +${cnt} 2>/dev/null)
    [[ $? -ne 0 ]] && return 0
    [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
    if [[ "${x2}" == "${the_new_dir}" ]]; then
      popd -n +$cnt 2>/dev/null 1>/dev/null
      cnt=cnt-1
    fi
  done

  return 0
}
alias cd=cd_func


_www_cd ()
{
    if [[ $1 != "" ]]; then
        cd /var/www/$1*
        # cd $1*
    else
        cd /var/www && return
    fi
}
alias www=_www_cd


_pear_cd_dir ()
{
    if [[ $1 == "dir" ]]; then
        cd $(pear config-get php_dir)
        return 0
    fi

    pear $*
    return 0
}
alias pear=_pear_cd_dir
# ---------------------

function fs()
{
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh;
  else
    local arg=-sh;
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@";
  else
    du $arg .[^.]* ./*;
  fi;
}

dockerps() {
  # echo "CONTAINER\tNAMES\tCOMMAND\tSTATUS\tPORTS\n$(docker ps --format '[{{.ID}}\t{{.Names}}\t{{.Command}}\t{{.Status}}\t{{.Ports}}')" | column -t -s $'\t'

  docker ps --format '[{{.ID}}]> {{.Names}}\t >> {{.Command}}\n\t\t{{.Ports}} \n --------------'
}

dockerip()
{
    docker inspect -f '{{range .NetworkSettings.Networks}} {{.IPAddress}}{{end}} ' "$@"
}

dockerips()
{
    local arg="$@";
    if [[ "$#" -eq 0 ]]; then
      arg=$(docker ps -q)
    fi
    docker inspect --format='{{.Config.Hostname}} {{index (split .Name "/") 1}} {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $arg
    # "$@"
    #  {{range $p, $conf := .NetworkSettings.Ports}}{{range $i, $j := $conf}}{{$j.HostIp}}:{{$j.HostPort}}->{{$p}} {{end}} {{end}}' $(docker ps -q)
    
    # Full
    # docker inspect --format='{{println}}{{.Config.Hostname}} {{index (split .Name "/") 1}} {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{range $p, $conf := .NetworkSettings.Ports}}{{range $i, $j := $conf}}{{println}}        {{$j.HostIp}}:{{$j.HostPort}}->{{$p}} {{end}} {{end}}' $(docker ps -q)
    # for dock in $(docker ps|tail -n +2|cut -d" " -f1)
    # do
    #     local dock_ip=$(dockerip $dock)
    #     regex="s/$dock\s\{4\}/${dock:0:4}  ${dock_ip:-local.host}/g;$regex"
    # done
    # docker ps -a | sed -e "$regex"
}
alias _id_='docker ps -l -q'


_git_diff_files()
{
    local ARGS="$@"
    if [ "${1}" = "" ]; then
      ARGS="origin/master"
    fi

    git cherry $ARGS | cut -d " " -f 2 | xargs -I {} git diff-tree --no-commit-id --name-only -r {} | sort | uniq | while read f; do test -f "$f" && echo "$f"; done
}
alias git-diff-files=_git_diff_files
