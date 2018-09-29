#!/usr/bin/env bash

# @(#) laun.sh.config  -- config library for laun.sh
#
# @(#) copyright (c) 2018 Cj-bc
# @(#) this software is released under MIT License
#
# @(#) ver: 0.0.1


lib_dir=$(cd $(dirname ${BASH_SOURCE[0]:-$0}); pwd)


function launsh.config.yaml {
#  [ -r 'launsh.yaml' ] || echo 'launsh.yaml: not found' >&2 && return $(launsh.util.error EX_NOTFOUND)
  echo 'launsh.yaml'
  return $(launsh.util.error EX_OK)
}

# return path to the 'src' dir
# @return $EX_OK(0) <str path_to_src>
function launsh.config.path.src {
  local yaml=$(launsh.config.yaml) || return $?
}
