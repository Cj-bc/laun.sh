# laun.sh -- launch pad in bash

 *laun.sh* is launchpad-like music insturment written in shellscript.
This use keyboard to toggle each clips.

# requirepments

  * 0k/shyaml -- a yaml parser for shellscript


# usage

```bash
$ ls
.
├── launsh.yaml
└── src
    ├── base1.wav
    └── beat1.wav
$ cat launsh.yaml  # launsh.yaml is the config file for launsh
name: sample1
src: src
binds:
  A:
    src: base1.wav
    attr: clip
  L:
    src: beat1.wav
    attr: clip$ laun.sh
# when you push 'A', 'base1.wav' will start being played
# when you push 'A' again, 'base1.wav' will stop being played
```


# words

*
*launchpad*: a wonderful music instrument. Let's google if you don't know!!
*clip*: the music file which will be assinged to keys. Those files puts in 'src/'
*attribute(attr)*: type of action that will be occured when the key is pushed


# Thanks to

  * niieani/bash-oo-framework -- Bash Infinity is a modern boilerplate / framework / standard library for bash
    Used for many things...making class, error handling, etc..
  * 0k/shyaml -- a yaml parser for shellscript.
    Used for parsing launsh.yaml
