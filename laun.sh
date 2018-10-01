#!/usr/bin/env bash

# @(#) laun.sh  -- a CLI launchpad-like instrument
#
# @(#) copyright (c) 2018 Cj-bc
# @(#) this software is released under MIT License
#
# @(#) ver: 0.0.1

# bash-oo-framework
source "$( cd "${BASH_SOURCE[0]%/*}" && pwd )/lib/oo-bootstrap.sh"

import util/log util/exception util/tryCatch util/namedParameters util/class
import launsh_lib/key
import launsh_lib/config

namespace launsh
Log::AddOutput launsh DEBUG
Log::AddOutput launsh/Launsh/main ERROR

class:Launsh() {

  # the main loop
  #  by executing this, laun.sh app will start
  Launsh.main() {
    try {
      echo -e 'laun.sh: a CLI Launchpad-like instrument.\n[A-Za-z0-9]: play clip\n@: exit\n\n'
      LaunshConfig launshcfg
      var: launshcfg __init__ 'launsh.yaml'
      while read -N 1 key; do
        case $key in
          "@" ) break;;
          [A-Za-z] )
            try {
              this playclip ${key^^}
            } catch {
              Log "Oops, something went wrong: key ${key^^}"
            };;
          * ) :;;
        esac
      done
    } catch {
      echo 'unknown error. exit.'
    }
  }

  # play one clip assgined to given key
  # @param <str key>
  Launsh.playclip() {
    [string] key

    try {
      local is_set=$(var: $key is_set?)
      local src=$(var: $key get_src)
      local attr=$(var: $key get_attr)
      local prevpid=$(var: $key get_prevPid)
    } catch {
      e="key not found" throw
    }

    [ $is_set ] || DEBUG Log "abording $key: not assigned" && return 0

    case $attr in
      'shot' )
        # if clip is played, kill it
        if [ -z ${#prevpid} ]; then
          kill $prevpid >/dev/null 2>&1 && Log "Key) $key: previous proccess killed successfully"
        fi

        # now time to play
        afplay src/$src &
        pid=$!
        var: $key set_prePid
    esac
  }
}

Type::Initialize Launsh

Launsh Launsh

$var:Launsh main
