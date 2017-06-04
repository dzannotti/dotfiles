# Daniele’s dotfiles

![Screenshot of my shell prompt](http://i.imgur.com/EkEtphC.png)

## Installation

### Pre-Requisites
You need to install
* XCode from app store
* [Homebrew] (https://brew.sh/)
* [Dropbox] (https://www.dropbox.com)


### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/projects/dotfiles`, with `~/dotfiles` as a symlink.) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/dzannotti/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/dzannotti/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE-MIT.txt}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

```bash
./.osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

## Apps not on brew
* [Alfred](https://www.alfredapp.com/)
* [Chrome](https://www.google.co.uk/chrome/browser/desktop/index.html)
* [Chromme Canary](https://www.google.co.uk/chrome/browser/canary.html)
* [Firefox](https://www.mozilla.org/en-GB/firefox/new/)
* [Github Desktop](https://desktop.github.com/)
* [iTerm2] (https://www.iterm2.com/downloads.html)
* [Licecap] (http://www.cockos.com/licecap/)
* [Spectacle] (https://www.spectacleapp.com/)
* [Skype] (https://www.skype.com/en/download-skype/skype-for-mac/downloading/)
* [Slack] (https://slack.com/downloads/osx)
* [Visual Studio Code] (https://code.visualstudio.com/docs/?dv=osx)


## Credits
* This is an opinionated fork of https://github.com/mathiasbynens/dotfiles
