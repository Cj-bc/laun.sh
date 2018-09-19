#!/usr/bin/env bash

# @(#) laun.sh.key  -- key related library for laun.sh
#
# @(#) copyright (c) 2018 Cj-bc
# @(#) this software is released under MIT License
#
# @(#) ver: 0.0.1


# return error code based on error name
# @param <str error_name>
# @return <int error_code>
function launsh.util.error {
  case $1 in
    'EX_OK') echo 0;;
    'EX_USAGE') echo 64;;
    'EX_DATAERR') echo 65;;
    'EX_NOINPUT') echo 66;;
    'EX_NOUSER') echo 67;;
    'EX_NOHOST') echo 68;;
    'EX_UNAVAILABLE') echo 69;;
    'EX_SOFTWARE') echo 70;;
    'EX_OSERR') echo 71;;
    'EX_OSFILE') echo 72;;
    'EX_CANTCREAT') echo 73;;
    'EX_IOERR') echo 74;;
    'EX_TEMPFAIL') echo 75;;
    'EX_PROTOCOL') echo 76;;
    'EX_NOPERM') echo 77;;
    'EX_CONFIG') echo 78;;
    'LAUNSH.EX_NOTFOUND') echo 44;;
    * ) echo 255;;
  esac
}
