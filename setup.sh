#!/bin/bash
# Theme setup

# Defaults
default_name="Avidly Static Block"
default_id="avidly-block-static"
default_prefix="avidly_block_static"
default_package="Avidly_Static_Block"
default_block_name="avidly-block/static"

# Directories
basedir="$( cd "$( dirname "$0" )" && pwd )"
languagedir="$basedir/languages"
basedir_all_files="$basedir/."
setup_script="$basedir/setup.sh"

# Text styles
bold=$(tput bold)
coral=$(tput setaf 210)
blue=$(tput setaf 12)
green=$(tput setaf 2)
txtreset=$(tput sgr0)

echo "1) Set name for your plugin. (Default: $default_name)"
read name
# use default if empty
if test -n "$name"; then
  echo ""
else
  id=$default_name
fi

echo "2) Set unique id for your plugin. Use only a-z and -. (Default: $default_id)"
read id

# use default if empty
if test -n "$id"; then
  echo ""
else
  id=$default_id
fi

echo "3) Set unique prefix for your plugin. Use only a-z and _. (Default: $default_prefix)"
read prefix

# use default if empty
if test -n "$prefix"; then
  echo ""
else
  prefix=$default_prefix
fi

echo "4) Set unique package for your plugin. It should be the block name, spaced with underscores. (Default: $default_package)"
read package

# use default if empty
if test -n "$package"; then
  echo ""
else
  prefix=$default_package
fi

echo "5) Set block name. Use only a-z, - and /. (Default: $default_block_name)"
read block_name

# use default if empty
if test -n "$block_name"; then
  echo ""
else
  prefix=$default_block_name
fi

while true; do
read -p "6) Is following information correct?

plugin name: ${bold}${coral}$name${txtreset} (Default: $default_name)
id: ${bold}${coral}$id${txtreset} (Default: $default_id)
prefix: ${bold}${coral}$prefix${txtreset} (Default: $default_prefix)
package: ${bold}${coral}$package${txtreset} (Default: $default_package)
block name: ${bold}${coral}$block_name${txtreset} (Default: $default_block_name)

Proceed to install? [y/N]
" yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please answer y or n.";;
  esac
done

echo "
Almost done! Running the setup:
=========="

# PHP files
find "$basedir_all_files" -name '*.php' -type f -exec perl -p -i -e "s|$default_name|$name|g" {} \;

# JSON files
find "$basedir_all_files" -name '*.json' -type f -exec perl -p -i -e "s|$default_name|$name|g" {} \;

# Language files
find "$languagedir" -name '*.pot' -type f -exec perl -p -i -e "s|$default_name|$name|g" {} \;
find "$languagedir" -name '*.po' -type f -exec perl -p -i -e "s|$default_name|$name|g" {} \;
find "$languagedir" -name '*.json' -type f -exec perl -p -i -e "s|$default_name|$name|g" {} \;

echo "--> Search & replace name ... ${blue}done${txtreset}"

# PHP files
find "$basedir_all_files" -name '*.php' -type f -exec perl -p -i -e "s|$default_id|$id|g" {} \;

# JS files
find "$basedir_all_files" -name '*.js' -type f -exec perl -p -i -e "s|$default_id|$id|g" {} \;

# CSS files
find "$basedir_all_files" -name '*.css' -type f -exec perl -p -i -e "s|$default_id|$id|g" {} \;

# SCSS files
find "$basedir_all_files" -name '*.scss' -type f -exec perl -p -i -e "s|$default_id|$id|g" {} \;

# JSON files
find "$basedir_all_files" -name '*.json' -type f -exec perl -p -i -e "s|$default_id|$id|g" {} \;

# Language files
find "$basedir_all_files" -name '*.pot' -type f -exec perl -p -i -e "s|$default_id|$id|g" {} \;
find "$basedir_all_files" -name '*.po' -type f -exec perl -p -i -e "s|$default_id|$id|g" {} \;
find "$languagedir" -type f -name "${default_id}.pot" -exec mv -f {} "${languagedir}/${id}.pot" \;
find "$languagedir" -type f -name "${default_id}-fi.po" -exec mv -f {} "${languagedir}/${id}-fi.po" \;
find "$languagedir" -type f -name "${default_id}-fi.mo" -exec mv -f {} "${languagedir}/${id}-fi.mo" \;
find "$languagedir" -type f -name "${default_id}-fi-${default_id}-editor-script.json" -exec mv -f {} "${languagedir}/${id}-fi-${id}-editor-script.json" \;

echo "--> Search & replace id from..... ${blue}done${txtreset}"

# PHP files
find "$basedir_all_files" -name '*.php' -type f -exec perl -p -i -e "s|$default_prefix|$prefix|g" {} \;

# JS files
find "$basedir_all_files" -name '*.js' -type f -exec perl -p -i -e "s|$default_prefix|$prefix|g" {} \;

echo "--> Search & replace prefix ..... ${blue}done${txtreset}"

# JS files
find "$basedir_all_files" -name '*.js' -type f -exec perl -p -i -e "s|$default_package|$package|g" {} \;

# PHP files
find "$basedir_all_files" -name '*.php' -type f -exec perl -p -i -e "s|$default_package|$package|g" {} \;

echo "--> Search & replace package ..... ${blue}done${txtreset}"

# JS files
find "$basedir_all_files" -name '*.js' -type f -exec perl -p -i -e "s|$default_block_name|$block_name|g" {} \;

# JSON files
find "$basedir_all_files" -name '*.json' -type f -exec perl -p -i -e "s|$default_block_name|$block_name|g" {} \;

echo "--> Search & replace block_name ..... ${blue}done${txtreset}"

echo "--> ${green}Setup complete. Have a great day!${txtreset}"

echo "--> setup.sh removed"
rm "$setup_script"