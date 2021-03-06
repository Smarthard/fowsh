# fowsh 
fowsh is a shell wrapper for instant opening files such as ascii text, images, movies, etc... It allows you to work with regular files without thinking what you need to open them.

## What fowsh can do

It just opens file for you. Look, here some examples of using:

```shell
$ fow Projects/fowsh/fow.sh # opens fowsh's shell scipt in your EDITOR
```

AVI file opening demo:

![demo mpv](https://github.com/Smarthard/fowsh/blob/master/images/demo_mpv.png)

Even `ls` output with changed opening command:

```shell
$ fow -o less `ls`
```

...or command pipelining:

```shell
$ ls | fow -o cat
```

## Installation

Clone this repository, place `fow.sh` somewhere you want to:
```shell
git clone https://github.com/Smarthard/fowsh
mv fowsh/fow.sh DIR/
```

For fast access make an alias to `fow.sh` in your `~/.bashrc`:
```shell
alias fow="DIR/fow.sh"
```

Also fowsh needs some specific environment variables to be set:
- BROWSER - default web browser
- EDITOR - default editor for text files
- FOWSH\_RIMAGE - default raster images viewer/editor
- FOWSH\_VIMAGE - default vector images viewer/editor
- FOWSH\_VIDEO - default multimedia viewer

Modify and copy these to your `~/.bashrc`:
```shell
export BROWSER=firefox
export EDITOR=vim
export FOWSH_RIMAGE=gimp
export FOWSH_VIMAGE=$FOWSH_RIMAGE
export FOWSH_VIDEO=mpv
```

Source your updated `~/.bashrc`
```shell
source ~/.bashrc
```

Now you ready to go!

## TODO
- [x] Text files support
- [x] Raster images support
- [x] Vector images support
- [x] Movies, video
- [x] Links
- [ ] Binaries?
- [ ] ???
- [ ] Logging
- [ ] Script options
   - [x] Forced opening with...
   - [ ] Ignore files by name
   - [ ] Ignore files by type
   - [ ] HELP!
   - [x] Usage
- [x] Preventing to open too many files

