# Darchivist
**A dotfiles management tool (made with Elixir).**

> This is just a playground app to learn Elixir, but feel free to use it.
> (I'm using it on my own dotfiles [here](https://github.com/victor-am/dotfiles))

## Commands
- help
- init
- install

## Installation
**Requirements:** Erlang VM

Just type in:
```
$ mix escript.install github victor-am/darchivist
```

## Usage
You can see the command list using:

```
$ darchivist help
```

### Init
The init command will create a sample `darchivist.yaml` manifest in the current directory so you can configure it according to your own dotfiles.
```
$ darchivist init
```

### Install
The install command will use the information in the `darchivist.yaml` from the current directory to create the dotfiles symlinks in the locations specified on the manifest.
```
$ darchivist install
```
