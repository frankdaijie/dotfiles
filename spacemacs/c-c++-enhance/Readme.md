# Personal C/C++ enhancement layer for Spacemacs

## Description

This layer adds code navigation and code completion for C/C++ language.
- Code navigation is supported by `helm-gtags`. The configurations are copied
  from [tuhdo](http://tuhdo.github.io/c-ide.html).
- Code completion is supported by
  (`irony-mode`)[https://github.com/Sarcasm/irony-mode], integrating with
  `company-irony`

## Install

Add the layer into `~/.spacemacs`

```elisp
(setq-default dotspacemacs-configuration-layers '(c-c++-enhance))
```
