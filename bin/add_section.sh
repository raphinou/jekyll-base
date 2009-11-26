#!/bin/bash

if [[ $# -ne 2 ]] ; then
  cat <<-END
	Needs to argument: directory of parent section, and new section name, eg
	$0 ./projects my_new_project
	END
  exit 1
fi

base_dir=$1
section=$2

mkdir $base_dir/$section
mkdir $base_dir/$section/_posts
cat > $base_dir/$section/index.textile <<END
---
layout: index
subsections: []
categories: [$section]
---
END

# if sections already set
sed -i -e "s/subsections: \[\(.*\)\]/subsections: [\1, $section]/" $base_dir/index.textile
# if sections empty
sed -i -e "s/subsections: \[\(\)\]/subsections: [$section]/" $base_dir/index.textile
