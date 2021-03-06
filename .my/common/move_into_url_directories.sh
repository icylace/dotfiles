#!/usr/bin/env bash

move_into_url_directories() {
  local -a origins path_parts urls
  local dir_path file_entry origin path_part url
  for file_entry in "$@" ; do
    if [ -f "$file_entry" ] ; then
      origins=($(mdls -name kMDItemWhereFroms -nullMarker '' -raw "$file_entry"))
      if [ -n "$origins" ] ; then

        path_parts=()

        for origin in "${origins[@]}" ; do
          if [ -n "$origin" ] && [[ $origin =~ '[^()"]' ]] ; then
            url="${origin#\"}"
            url="${url%\"}"
            url="${url%\",}"
            # https://stackoverflow.com/a/20048220
            url="$(echo $url | grep -iIohE 'https?://[^[:space:]]+')"
            url="${url#http://}"
            url="${url#https://}"
            # https://stackoverflow.com/a/13298479
            url="${url//:/::}"        # Handle URLs that use colons.
            url="${url//\//:}"
            if [ -n "$url" ] ; then
              path_parts+=("$url")
            fi
          fi
        done

        # https://stackoverflow.com/a/17758600
        path_parts=($(printf "%q\n" "${path_parts[@]}" | sort --unique))

        dir_path=''

        for path_part in "${path_parts[@]}" ; do
          dir_path="$path_part/$dir_path"
        done

        if [ -n "$dir_path" ] ; then
          mkdir -pv "$dir_path"
          mv "$file_entry" "$dir_path"
        fi

      fi
    fi
  done
}









# TODO:

# folder_name_from_url() {
#   local -a origins path_parts urls
#   local dir_path file_entry origin path_part url

#   if [ ! -f "$1" ] ; then
#     return
#   fi

#   origins=($(mdls -name kMDItemWhereFroms -nullMarker '' -raw "$1"))

#   if [ -z "$origins" ] ; then
#     return
#   fi


#   local origin="#1"

#   path_parts=()

#   for origin in "${origins[@]}" ; do
#     if [ -n "$origin" ] && [[ $origin =~ '[^()"]' ]] ; then
#       url="${origin#\"}"
#       url="${url%\"}"
#       url="${url%\",}"
#       # https://stackoverflow.com/a/20048220
#       url="$(echo $url | grep -iIohE 'https?://[^[:space:]]+')"
#       url="${url#http://}"
#       url="${url#https://}"
#       # https://stackoverflow.com/a/13298479
#       url="${url//:/::}"        # Handle URLs that use colons.
#       url="${url//\//:}"
#       if [ -n "$url" ] ; then
#         path_parts+=("$url")
#       fi
#     fi
#   done

#   # https://stackoverflow.com/a/17758600
#   path_parts=($(printf "%q\n" "${path_parts[@]}" | sort --unique))

#   dir_path=''

#   for path_part in "${path_parts[@]}" ; do
#     dir_path="$path_part/$dir_path"
#   done

#   if [ -n "$dir_path" ] ; then
#     # TODO:
#     echo "$dir_path"
#     echo "$1"
#     # mkdir -pv "$dir_path"
#     # mv "$1" "$dir_path"
#   fi

# }
