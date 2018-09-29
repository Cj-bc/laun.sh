#!/usr/bin/env bash

# @(#) laun.sh  -- a CLI launchpad-like instrument
#
# @(#) copyright (c) 2018 Cj-bc
# @(#) this software is released under MIT License
#
# @(#) ver: 0.0.1

base_dir=$(cd $(dirname ${BASH_SOURCE[0]:-$0}); pwd)
lib_dir=${base_dir}/lib

source ${lib_dir}/config.sh
source ${lib_dir}/key.sh
source ${lib_dir}/util.sh

# the main loop
#  by executing this, laun.sh app will start
function launsh.main {
  echo -e 'laun.sh: a CLI Launchpad-like instrument.\n[A-Za-z0-9]: play clip\n@: exit\n\n'
  while read -N 1 key; do
    case $key in
      "@" ) break;;
      [A-Za-z0-9] ) launsh.playclip $key || echo "Oops, something went wrong: key ${key}" >&2;;
      * ) :;;
    esac
  done
}
# play one clip assgined to given key
# @param <str key>
# @return $EX_OK(0) clip successfully played
function launsh.playclip {
  local key=$1
  local src=$(launsh.key.src.get $key)
  local attr=$(launsh.key.attr.get $key)
  declare -a launsh_value_keys=('' '')

  case $attr in
    'shot' )
      # if clip is played, kill it
      for i in ${!launsh_value_keys[@]}; do
        if [[ ${launsh_value_keys[$i]} =~ ${key}:([0-9]+) ]]; then
          kill ${BASH_REMATCH[1]} >/dev/null 2>&1
          unset ${launsh_value_keys[$i]}
          launsh_value_keys=(${launsh_value_keys[@]})
          break;
        fi
      done
      # now time to play
      afplay src/$src &
      pid=$!
      launsh_value_keys=(${launsh_value_keys[@]} "${key}:${pid}")
  esac
}


launsh.main
