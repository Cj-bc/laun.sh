#!/usr/bin/env bash

# @(#) laun.sh.key  -- key related library for laun.sh
#
# @(#) copyright (c) 2018 Cj-bc
# @(#) this software is released under MIT License
#
# @(#) ver: 0.0.1

lib_dir=$(cd $(dirname ${BASH_SOURCE[0]:-$0}); pwd)
source ${lib_dir}/util.sh
source ${lib_dir}/config.sh


# return available attributes
# @return $EX_OK(0) list of available attributes
function launsh.key.attr {
  echo 'trigger shot'
  return $(launsh.util.error EX_OK)
}

# get clip file path binded to <key>
# @param <str key>
# @return $EX_OK(0) file path binded to <key>
# @return $EX_USAGE(64) usage
function launsh.key.src.get {
  local conf_file=$(launsh.config.yaml)
  [ $# -ne 1 ] && echo 'only 1 key is needed' >2 && return $(launsh.util.error EX_USAGE)
  echo $(cat $conf_file | shyaml get-value binds.${key}.src)
  return $(launsh.util.error EX_OK)
}


# get attribute for <key>.
# could be ['clip', 'shot']
# @return $EX_OK(0) attribute binded to <key>
# @return $EX_USAGE(64) usage
function launsh.key.attr.get {
  local conf_file=$(launsh.config.yaml)
  [ $# -ne 1 ] && echo 'only 1 key is needed' >2 && return $(launsh.util.error EX_USAGE)
  echo $(cat $conf_file | shyaml get-value binds.${key}.attr)
  return $(launsh.util.error EX_OK)
}
