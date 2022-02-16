Started using the terminal more, here are my current dotfiles for **vim** and **zsh**

I'm using [this guide](https://mjones44.medium.com/storing-dotfiles-in-a-git-repository-53f765c0005d) (using the alias dotgit instead of config)

Terminal colourscheme from [here](https://github.com/mbadolato/iTerm2-Color-Schemes)



---
(Dimmed Monokai)
                                                                                                
Old method:                                                                              
- clone the repo to your home dir and symlink `.<dotfile>` using `ln -s ~/.dotfiles/<dotfile> ~/.<dotfile>` 
- manually move `vim` and `vimrc` to home dir (make sure to add a preceding `.`, i.e. `.vimrc`)
