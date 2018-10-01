#!/usr/bin/env bash

# @(#) laun.sh.key  -- key related library for laun.sh
#
# @(#) copyright (c) 2018 Cj-bc
# @(#) this software is released under MIT License
#
# @(#) ver: 0.0.1

import util/log util/exception util/tryCatch util/namedParameters util/class

class:Key() {
  private string src
  private string attr
  private integer prev_pid

  Key.__init__() {
    [string] src
    [string] attr

    this attr = $attr
    this src = $src
    this played = false
  }
  # get attribute for <key>.
  # could be ['clip', 'shot']
  # @return <str attr>
  Key.get_attr() {
    @return this attr
  }

  # get clip file path binded to <key>
  # @param <str key>
  # @return <str clip_path>
  Key.get_src() {
    @return this src
  }

  key.get_prevPid() {
    @return this prev_pid
  }

  # set prev_pid
  # @param <int pid>
  key.set_prePid() {
    [integer] pid
    this prev_pid = $pid
    subject="key event" Log "Prev_pid is updated for $(this)"
  }

  # return available attributes
  # @return $EX_OK(0) list of available attributes
  Key::available_attr() {
    array attrs=( "trigger" "shot" )

    @return attrs
  }
}

Type::Initialize Key
