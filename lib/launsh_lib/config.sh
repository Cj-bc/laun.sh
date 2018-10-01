#!/usr/bin/env bash

# @(#) laun.sh.config  -- config library for laun.sh
#
# @(#) copyright (c) 2018 Cj-bc
# @(#) this software is released under MIT License
#
# @(#) ver: 0.0.1

# bash-oo-framework

import util/log util/exception util/tryCatch util/namedParameters util/class

namespace Launsh/Config

Log::AddOutput Launsh/Config DEBUG

class:LaunshConfig() {
  public string conf_path

  # initialize configs.
  # load launsh.yaml and set values for Key
  LaunshConfig.__init__() {
    [string] conf_path

    for key in {A..Z}; do
      src=$(cat $conf_path | shyaml get-value binds.${key}.src)
      attr=$(cat $conf_path | shyaml get-value binds.${key}.attr)
      Key $key
      var: $key __init__ $src $attr
      success=$?
      subject="gen_key" Log "Key generated($success): $key"
    done
  }
}

Type::Initialize LaunshConfig
