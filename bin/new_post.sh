#!/bin/bash


if [[ $# -ne 2 ]] ; then
  cat <<-END
	Needs two arguments: directory of parent section, and new post title, eg
	$0 ./blog big_news 
	END
  exit 1
fi

category=$1
title=$2

date=$(date +%Y-%m-%d)
file=$category/_posts/$date-$title.textile
cat > $file <<END
---
layout: default
---
END

exec ${EDITOR:-vim} $file 
