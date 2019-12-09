#!/bin/bash

TEMP_DIR=.lsgrabber

which jq >/dev/null 2>&1
has_jq=$?
curl_opts=''

print_help() {
	cat << EOF
Usage:
	$0 id [,...]
Download one or more LINE stickers set.
Stickers sets are downloaded in a folder named after the sticker set if the tool
"jq" is installed.

Arguments:
	id  The ID of the sticker set, can be found by looking at the URL in the
	    LINE shop.
	    Example:
	      https://store.line.me/stickershop/product/16049/en
	    16049 is the ID

Options:
	-h  Prints this message
	-v  Verbose mode
EOF
}

if [ $# -eq 0 ]; then
	print_help
	exit 1
fi

while getopts 'h?v?' flag; do
	case "${flag}" in
		h)
			print_help
			exit 0
			;;
		v)
			curl_opts=''
			;;
	esac
done

for id in "$@"; do
	mkdir -p "$TEMP_DIR"
	curl "http://dl.stickershop.line.naver.jp/products/0/0/1/$id/iphone/stickers@2x.zip" -s -o "$TEMP_DIR"/zip.zip
	(
		cd "$TEMP_DIR"
		unzip zip.zip
		if [ $has_jq ]; then
			name="$(cat productInfo.meta | jq -r .title.en)"
			author="$(cat productInfo.meta | jq -r .title.author)"
			output="$id - $name by $author"
		else
			output="$id"
		fi
		rm -f *key@2x.png productInfo.meta tab_off@2x.png zip.zip
		mv tab_on@2x.png folder.png
	)
	mv "$TEMP_DIR" "$output"
done
