
########################
##  [Function cpy]
##   - backs up files using filename.yyyymmdd.bak on any file or directory
##   - shortcut to cp -pr for example: cp -pr .file{,.20190505.bak}
cpy() {

  if [[ -z $1 ]] ; then
    echo -e " "
    echo -e "   ${C_GN} Use to make a .bak file with date on any file or directory ${C_NC}"
    echo -e "    Usage: cpy MyDirectory "
    echo -e "      e.g. cpy myfile"
  elif [[ -f $1 ]] || [[ -d $1 ]] ; then
    cp -pr $1{,.$(eval date '+%Y%m%d').bak}
    ls -goaltr --color=always $1 $1*.bak | grep --color=always $1 | tail -2
  elif [[ ! -f $1 ]] || [[ ! -d $1 ]]; then
    echo -e "    $C_RD \"$1\" $C_YW file or directory not found! $C_NC"
  fi
}      ##### FUNCTION END : cpy
