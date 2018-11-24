#!/usr/bin/env bash

#
# Checks if a command or program is available.
#
# Example usage:
#
# ```shell
# if we_have foo ; then
#   # foo exists
# else
#   # foo doesn't exist
# if
# ```
#
we_have() {
  return $(type "$@" > /dev/null 2>&1)
}
