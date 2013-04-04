#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function die()
{
  echo "${@}"
  exit 1
}

for i in .vimrc.after .vimrc.before .gvimrc.after .gvimrc.before; do
  file=$HOME/$i
  if [[ ( -e $file ) || ( -h $file ) ]]; then
    echo "${file} has been renamed to ${file}.old"
    mv "${file}" "${file}.old" || die "Could not move ${file} to ${file}.old"
  fi
  echo "linking ${file} to $DIR/$i"
  ln -s $DIR/$i $file
done

janus=$HOME/.janus
if [[ ( -e $janus ) || ( -h $janus ) ]]; then
  echo "${janus} has been renamed to ${janus}.old"
  mv "${janus}" "${janus}.old" || die "Could not move ${janus} to ${janus}.old"
fi

echo "linking ${janus} to $DIR"
ln -s $DIR $janus
