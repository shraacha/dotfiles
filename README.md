Started using the terminal more, here are my current dotfiles

New method for dotfile storage:
https://stegosaurusdormant.com/bare-git-repo/#fn:no-home-git-repo

Terminal colourscheme from:
https://github.com/mbadolato/iTerm2-Color-Schemes

(Dimmed Monokai / Doom One)
                                                                                                
Old method:                                                                              
- clone the repo to your home dir and symlink `.<dotfile>` using `ln -s ~/.dotfiles/<dotfile> ~/.<dotfile>` 
- manually move `vim` and `vimrc` to home dir (make sure to add a preceding `.`, i.e. `.vimrc`)
