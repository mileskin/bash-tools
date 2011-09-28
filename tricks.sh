#!/bin/bash

# Separating argument lists

fun1() {
  local arguments=$@
  local list1=${arguments% -- *}
  local list2=${arguments#* -- }
  echo "list1: '${list1}', list2: '${list2}'"
}

fun1 "aaa" "bbb" "ccc" -- "ddd" "eee"
# => list1: 'aaa bbb ccc', list2: 'ddd eee'

