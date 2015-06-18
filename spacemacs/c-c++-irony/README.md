# C/C++ enhancement layer for Spacemacs

## Prerequisite

- [CMake][]
- [libclang][]
- [GNU Global source code tagging system][GNU Global]

## Description

This layer adds code navigation and code completion for C/C++ language.
- Code navigation is supported by [helm-gtags][]. The configurations are copied
  from [tuhdo][].
- Code completion is supported by [irony-mode][], integrating with
  [company-irony][]

## Install

### Add this layer into Spacemacs

Add the layer into `~/.spacemacs`
```elisp
(setq-default dotspacemacs-configuration-layers '(c-c++-enhancement))
```

### Install `irony-mode` in Mac


[irony-mode]: https://github.com/Sarcasm/irony-mode
[helm-gtags]: https://github.com/syohex/emacs-helm-gtags
[company-irony]: https://github.com/Sarcasm/company-irony
[tuhdo]: http://tuhdo.github.io/c-ide.html
[CMake]: http://www.cmake.org
[libclang]: http://clang.llvm.org/doxygen/group__CINDEX.html
[GNU Global]: https://www.gnu.org/software/global/
