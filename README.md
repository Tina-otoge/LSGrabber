# LINE Stickers Grabber

```
Usage:
	./lsgrabber.sh id [,...]
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
```

## Tips

- Don't forget to make the script executable (`chmod +x ./lsgrabber.sh`)

- You can either move the script to a folder in your PATH like `~/.local/bin` or

- You can symlink this script as ̀`lsgrabber` in a folder in your PATH like so:
```
ln -s ~/Repositories/LSGrabber/lsgrabber.sh ~/.local/bin/lsgrabber
```
This unsures that the script is updated altogether when you run ̀`git pull`
