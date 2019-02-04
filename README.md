# fowsh 
fowsh is a shell wrapper for instant opening files such as ascii text, images, movies, etc...

## Installation

Clone this repository, place `fow.sh` somewhere you want to:
```shell
git clone https://github.com/Smarthard/fowsh
move fowsh/fow.sh DIR/
```

For fast access make an alias to `fow.sh` in your `~/.bashrc`:
```shell
alias fow="DIR/fow.sh"
```

Also fowsh needs some specific environment variables to be set:
- EDITOR - default editor for text files
- RIMAGE - default raster images viewer/editor

## TODO
- [x] Text files support
- [x] Raster images support
- [ ] Vector images support
- [ ] Movies
- [ ] Links
- [ ] Binaries?
- [ ] ???
- [ ] Logging
- [ ] Script options
   - [ ] Forced opening with...
   - [ ] Ignore files by name
   - [ ] Ignore files by type
   - [ ] HELP!
- [ ] Preventing to open too many files

