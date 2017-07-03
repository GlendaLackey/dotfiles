#!/bin/bash
# Script to easily modify Compbiz plugin settings for current profile
# Copyright (C) 2017 Glenda Lackey - All Rights Reserved
# Permission to copy and modify is granted under the MIT license
# Created: February 1, 2107
# Revised: Never

get_compiz_plugin_nickname(){
  local name="$1"
  local nick=$(echo $name| cut -d'.' -f 3)
  echo "$nick"
}
get_compiz_plugin_name(){
  local nick=$(get_compiz_plugin_nickname $1)
  local name="org.compiz.$nick"
  echo "$name"
}
is_value_numeric(){
  local re="^-?[0-9]+([.][0-9]+)?$"
  if [ -z $1 ]; then
    echo false
  elif [[ $1 =~ $re ]] ; then
    echo true
  else
    echo false
  fi
}
is_value_boolean(){
  if [ -z $1 ]; then
    echo false
  elif [ "$1" = "true" ] || [ "$1" = "false" ] ; then
    echo true
  else
    echo false
  fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

get_compiz_available_plugins(){
  local result=$(gsettings list-relocatable-schemas | grep org.compiz)
  echo "$result"
}
print_compiz_available_plugins(){
  local items=( $(get_compiz_available_plugins) )
	for item in "${items[@]}"
	do
    echo "available: $item"
	done
}
is_compiz_plugin_available(){
  local name=$(get_compiz_plugin_name $1)
  local items=( $(get_compiz_available_plugins) )
  local result=false
  for item in "${items[@]}"
	do
    if [ "$item" = "$name" ]; then
      result=true
    fi
	done
  echo "${result}"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

get_compiz_profile_name(){
	local result=( $(gsettings get org.compiz current-profile | tr -d "[",",","]","\'") )
	echo "${result}"
}
get_compiz_profile_path(){
  local profile_name=( $(get_compiz_profile_name) )
  local result="/org/compiz/profiles/$profile_name/"
  echo "${result}"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

get_compiz_active_plugins(){
  local profile_path=( $(get_compiz_profile_path) )
  local schema_path="${profile_path}plugins/core/"
	local result=$(gsettings get org.compiz.core:${schema_path} active-plugins | tr -d "[",",","]","\'")
  echo "$result"
}
print_compiz_active_plugins(){
  local items=( $(get_compiz_active_plugins) )
	for item in "${items[@]}"
	do
    echo "active: $item"
	done
}
is_compiz_plugin_active(){
  local name=$(get_compiz_plugin_nickname $1)
  local items=( $(get_compiz_active_plugins) )
  local result=false
  for item in "${items[@]}"
	do
    if [ "$item" = "$name" ]; then
      result=true
    fi
	done
  echo "${result}"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

get_compiz_inactive_plugins(){
  local actives=( $(get_compiz_active_plugins) )
  local availables=( $(get_compiz_available_plugins) )
  local inactive=()
  local result=""
  local isMatch="no"

  for a in "${availables[@]}"
  do

    isMatch="no"

    for b in "${actives[@]}"
    do

      if [ "$a" = "org.compiz.""$b" ]; then
        isMatch="yes"
      fi

    done

    if [ "$isMatch" = "no" ]; then
      inactive=("${inactive[@]}" "$a")
      result="$result"" ""$a"
    fi

  done

  result="$(echo -e "${result}" | sed -e 's/^[[:space:]]*//')"

  echo "$result"
}
print_compiz_inactive_plugins(){
  local items=( $(get_compiz_inactive_plugins) )
	for item in "${items[@]}"
	do
    echo "inactive: $item"
	done
}
is_compiz_plugin_inactive(){
  local name=$(get_compiz_plugin_name $1)
  local items=( $(get_compiz_inactive_plugins) )
  local result=false
  for item in "${items[@]}"
	do
    if [ "$item" = "$name" ]; then
      result=true
    fi
	done
  echo "${result}"
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

get_compiz_plugin_status_detailed(){
  local name="$1"
  local isAvailable=$(is_compiz_plugin_available $name)
  local isActive=$(is_compiz_plugin_active $name)
  local isInactive=$(is_compiz_plugin_inactive $name)
  local status="$isAvailable""|""$isActive""|""$isInactive"
  echo "$status"
}
get_compiz_plugin_status(){
  local usage=$'\n\n'"USAGE:"$'\n'"enable_compiz_plugin %PLUGIN_NAME%"

  if [ -z $1 ]; then
    echo "plugin name not supplied ${usage}"
  elif [ ! -z $2 ]; then
    echo "unexpected extra data supplied: $2 ${usage}"
  else

    local name="$1"
    local status=$(get_compiz_plugin_status_detailed $name)

    case "$status" in
      "true|true|false")
        echo "enabled"
        ;;
      "true|false|true")
        echo "disabled"
        ;;
      "false|false|false")
        echo "not installed"
        ;;
      *)
        echo "error"
        ;;
    esac

  fi
}

enable_compiz_plugin(){

  local name=$(get_compiz_plugin_name $1)
  local nick=$(get_compiz_plugin_nickname $1)
  local status=$(get_compiz_plugin_status $1)

  local usage=$'\n\n'"USAGE:"$'\n'"enable_compiz_plugin %PLUGIN_NAME%"

  if [ -z $1 ]; then
    echo "plugin name not supplied ${usage}"
  elif [ ! -z $2 ]; then
    echo "unexpected extra data supplied: $2 ${usage}"

  elif [ "$status" = "enabled" ]; then
    echo "$name is already enabled"
  elif [ "$status" = "not installed" ]; then
    echo "$name is not installed"
  elif [ "$status" = "error" ]; then
    echo "status of $name cannot be determined"
  else

    local profile_path=( $(get_compiz_profile_path) )
    local schema_path="${profile_path}plugins/core/"
    local active=( $(get_compiz_active_plugins) )
    active=("${active[@]}" "$nick")
    local newActive="";
    for item in "${active[@]}"
  	do
      if [ "$newActive" = "" ]; then
        newActive="'""$item""'"
      else
        newActive="$newActive, '""$item""'"
      fi
  	done

    # local cmd="gsettings doit org.compiz.core:$schema_path active-plugins \"[$newActive]\""
    # echo "next command: $cmd"

    local result=$(gsettings doit org.compiz.core:$schema_path active-plugins \"[$newActive]\")
    echo "$result"
  fi
}
disable_compiz_plugin(){

  local name=$(get_compiz_plugin_name $1)
  local nick=$(get_compiz_plugin_nickname $1)
  local status=$(get_compiz_plugin_status $1)

  local usage=$'\n\n'"USAGE:"$'\n'"disable_compiz_plugin %PLUGIN_NAME%"

  if [ -z $1 ]; then
    echo "plugin name not supplied ${usage}"
  elif [ ! -z $2 ]; then
    echo "unexpected extra data supplied: $2 ${usage}"
  elif [ "$status" = "disabled" ]; then
    echo "$name is already disabled"
  elif [ "$status" = "not installed" ]; then
    echo "$name is not installed"
  elif [ "$status" = "error" ]; then
    echo "status of $name cannot be determined"
  else

    local profile_path=( $(get_compiz_profile_path) )
    local schema_path="${profile_path}plugins/core/"
    local active=( $(get_compiz_active_plugins) )
    local newActive="";

    for item in "${active[@]}"
  	do
      if [ "$item" != "$nick" ]; then
        if [ "$newActive" = "" ]; then
          newActive="'""$item""'"
        else
          newActive="$newActive, '""$item""'"
        fi
      fi
  	done

    # local cmd="gsettings doit org.compiz.core:$schema_path active-plugins \"[$newActive]\""
    # echo "next command: $cmd"

    local result=$(gsettings doit org.compiz.core:$schema_path active-plugins \"[$newActive]\")
    echo "$result"
  fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

get_compiz_plugin_default_settings(){

  local name=$(get_compiz_plugin_name $1)
  local nick=$(get_compiz_plugin_nickname $1)
  local isAvailable=$(is_compiz_plugin_available $name)

  local usage=$'\n\n'"USAGE:"$'\n'"get_compiz_plugin_default_settings %PLUGIN_NAME%"

  if [ -z $1 ]; then
    echo "plugin name not supplied ${usage}"
  elif [ ! -z $2 ]; then
    echo "unexpected extra data supplied: $2 ${usage}"
  elif [ "$isAvailable" = "false" ]; then
    echo "plugin is not installed: $name"
  else
    local result=$(gsettings list-recursively ${name}:/org/compiz/profiles/Default/plugins/${nick}/)
    echo "$result"
  fi
}
get_compiz_plugin_active_settings(){

  local name=$(get_compiz_plugin_name $1)
  local nick=$(get_compiz_plugin_nickname $1)
  local isActive=$(is_compiz_plugin_active $name)
  local profilePath=$(get_compiz_profile_path)

  local usage=$'\n\n'"USAGE:"$'\n'"get_compiz_plugin_active_settings %PLUGIN_NAME%"

  if [ -z $1 ]; then
    echo "plugin name not supplied ${usage}"
  elif [ ! -z $2 ]; then
    echo "unexpected extra data supplied: $2 ${usage}"
  elif [ "$isActive" = "false" ]; then
    echo "plugin is not active: $name"
  else
    local result=$(gsettings list-recursively ${name}:${profilePath}plugins/${nick}/)
    echo "$result"
  fi
}

get_compiz_plugin_setting(){

  local name=$(get_compiz_plugin_name $1)
  local nick=$(get_compiz_plugin_nickname $1)
  local isActive=$(is_compiz_plugin_active $name)
  local profilePath=$(get_compiz_profile_path)
  local setting="$2"

  local usage=$'\n\n'"USAGE:"$'\n'"get_compiz_plugin_setting %PLUGIN_NAME% %SETTING_NAME%"

  if [ -z $1 ]; then
    echo "plugin name not supplied ${usage}"
  elif [ -z $2 ] || [ "$setting" = "" ]; then
    echo "setting name not supplied ${usage}"
  elif [ ! -z $3 ]; then
    echo "unexpected extra data supplied: $3 ${usage}"
  elif [ "$isActive" = "false" ]; then
    echo "plugin is not active: $name"
  else

    local result=$(gsettings get ${name}:${profilePath}plugins/${nick}/ ${setting})
    echo "$result"

  fi
}

set_compiz_plugin_setting(){

  local name=$(get_compiz_plugin_name $1)
  local nick=$(get_compiz_plugin_nickname $1)
  local isActive=$(is_compiz_plugin_active $name)
  local profilePath=$(get_compiz_profile_path)
  local setting="$2"
  local value="$3"

  local usage=$'\n\n'"USAGE:"$'\n'"set_compiz_plugin_setting %PLUGIN_NAME% %SETTING_NAME% \"%NEW_VALUE%\""

  if [ -z $1 ] || [ "$nick" = "" ]; then
    echo "plugin name not supplied ${usage}"
  elif [ -z $2 ] || [ "$setting" = "" ]; then
    echo "setting name not supplied ${usage}"
  elif [ -z $3 ] || [ "$value" = "" ]; then
    echo "new value not supplied supplied ${usage}"
  elif [ ! -z $4 ]; then
    echo "unexpected extra data supplied: $4 ${usage}"
  elif [ "$isActive" = "false" ]; then
    echo "plugin is not active: $name"
  else

    local isNumeric=$(is_value_numeric $value)
    local isBoolean=$(is_value_boolean $value)

    local newValue=""

    if [ "$isNumeric" = "true" ] || [ "$isBoolean" = "true" ]; then
      newValue="${value}"
    else
      newValue="\"${value}\""
    fi

    local result=$(gsettings set ${name}:${profilePath}plugins/${nick}/ ${setting} ${newValue})
    echo "$result"

  fi
}
