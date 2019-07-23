GPG:

$ gpg --full-generate-key
accept the default RSA and RSA
maximum key size of 4096
key doesn't expire
Enter your user ID information
Type a secure passphrase

gpg --list-secret-keys

PASS:

pass init 619895C338F428BB17966188C5F65BCCA1B5C265
pass insert builder
pass -c builder

MULTIPLE GITHUB ACCOUNTS:

we default to work config

git config --global user.name "Yourname Surname"
git config --global user.email "yourname.surname@bolt.eu"
git config --global push.default current

$ ssh-keygen -t rsa (work + home)

override stuff to work on personal stuff

edit ~/.gitconfig

[includeIf "gitdir:~/toyhaskeller/"]
  path = .git-toyhaskeller
[includeIf "gitdir:~/repos/"]
  path = .git-work

where an example of .git-toyhaskeller is:
    [user]
        email = "toyhaskeller@gmail.com"
    [core]
        sshCommand = "ssh -i ~/.ssh/id_rsa_toyhaskeller"


./install.sh ->
  installs stuff:
    Brewfile
    macos defaults
    neovim
    fish shell


TODO manually:
  CoC plugins
    coc-tsserver
    coc-tslint
    coc-css
    coc-json
  Escape to caps lock
  ITerm2 oceanic theme
    https://github.com/mhartington/oceanic-next-iterm




TODO: ~/.local/share/nvim/backup folder creation in install.sh
TODO: cp neovim/space.vim neovim/plugged/vim-airline-themes/autoload/airline/themes/space.vim after everything has been installed for neovim
TODO: try catch in init.vim so that when initial install happens there isn't a flood of errors

:CocInstall coc-phpls --- for php language server
haskell-ide-engine guide from github page should be used to install hie to support haskell lsp
TODO: coc-settings should be added for haskell ide engine in readme
