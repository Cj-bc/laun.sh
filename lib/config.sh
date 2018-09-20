#!/usr/bin/env bash

# @(#) laun.sh.config  -- config library for laun.sh
#
# @(#) copyright (c) 2018 Cj-bc
# @(#) this software is released under MIT License
#
# @(#) ver: 0.0.1


base_dir=$(cd $(dirname ${BASH_SOURCE[0]:-$0}); pwd)
lib_dir=${base_dir}/lib


function launsh.config.yaml {
  [ -f launsh.yaml ] || echo 'launsh.yaml: not found' >2 && return $(launsh.util.error EX_NOTFOUND)
  cat launsh.yaml
  return $(launsh.util.error EX_OK))
}

# return path to the 'src' dir
# @return $EX_OK(0) <str path_to_src>
function launsh.config.path.src {
  local yaml=$(launsh.config.yaml) || return $?
}
