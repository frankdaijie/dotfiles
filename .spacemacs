;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     (c-c++ :variables
            c-c++-enable-clang-support t
            c-c++-default-mode-for-headers 'c++-mode)
     emacs-lisp
     eyebrowse
     deft
     fasd
     git
     latex
     markdown
     python
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-enable-smart-eshell t
            shell-default-shell 'eshell)
     spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro for Powerline"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
  ;; Also in visual mode
  (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  (define-key evil-visual-state-map "k" 'evil-previous-visual-line)
  ;; (setq-default evil-cross-lines t)

  ;; (eval-after-load 'company
  ;;   '(lambda ()
  ;;      (setq company-idle-delay 0.1)))
  ;; (setq company-quickhelp-max-lines 10)
  ;; (global-set-key (kbd "s-i") 'company-complete-common)
  ;; (global-set-key (kbd "C-k") 'company-complete-common)
  ;; (define-key evil-insert-state-map (kbd "C-l") 'company-complete)

  ;; (setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
  ;; (setq tab-always-indent 'complete)

  ;; (exec-path-from-shell-initialize)
  ;; (when (memq window-system '(mac ns))
  ;;   (exec-path-from-shell-initialize))

  ;; (toggle-word-wrap)
  (setq powerline-default-separator 'arrow)
  (set-face-attribute 'region nil :foreground "white" :background "#Aa7941")

  (global-set-key (kbd "C-c \\")  'align-regexp)
  (global-set-key (kbd "M-x")     'helm-M-x)
  (global-set-key (kbd "C-x C-m") 'helm-M-x)
  (global-set-key (kbd "C-x m")   'eshell)
  (global-set-key (kbd "M-y")     'helm-show-kill-ring)
  (global-set-key (kbd "C-x b")   'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-h f")   'helm-apropos)
  (global-set-key (kbd "C-h r")   'helm-info-emacs)
  (global-set-key (kbd "C-h C-l") 'helm-locate-library)
  (global-set-key (kbd "C-c n")   'prelude-cleanup-buffer-or-region)
  (eval-after-load 'evil
    '(progn
       (define-key evil-ex-map "e" 'helm-find-files)
       (evil-ex-define-cmd "b" 'helm-buffers-list)
       (evil-ex-define-cmd "q" 'ido-kill-buffer)))
  (evil-leader/set-key
    "&" 'async-shell-command)

  ;; semantic
  ;; (eval-after-load 'semantic
  ;;   '(global-semantic-idle-summary-mode 0))

  ;; (defun my-enable-semantic-mode (ori-func &rest args)
  ;;   (let ((hook (intern (concat (symbol-name mode) "-hook"))))
  ;;     (add-hook hook (lambda ()
  ;;                      (require 'semantic)
  ;;                      (add-to-list 'semantic-default-submodes
  ;;                                   'global-semantic-stickyfunc-mode)
  ;;                      (global-semantic-idle-summary-mode 0)
  ;;                      (semantic-mode 1)))))

  ;; (advice-add 'semantic/enable-semantic-mode :around #'my-enable-semantic-mode)

  ;; yasnippet
  (eval-after-load 'yasnippet
    '(add-hook 'yas/prompt-functions 'shk-yas/helm-prompt))

  ;; zshell
  ;;; Use 'native' vim keybinding in zshell
  (setq multi-term-program "/bin/zsh")
  (setq multi-term-buffer-name "zshell")
  (setq multi-term-scroll-to-bottom-on-output 't)
  (setq multi-term-scroll-show-maximum-output 't)

  (global-set-key (kbd "s-t") 'multi-term)
  (global-set-key (kbd "s-}") 'multi-term-next)
  (global-set-key (kbd "s-{") 'multi-term-prev)

  (defun term-send-towards-end-of-line ()
    "Towards the end of line"
    (interactive)
    (term-send-raw-string "\C-e"))

  (evil-define-key 'insert term-raw-map
    "\C-e" 'term-send-towards-end-of-line
    (kbd "s-v")  'term-paste
    "\C-y" 'term-paste
    "\C-w" 'term-send-backward-kill-word
    "\C-]" 'term-send-esc)

  (add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

  ;; Lang
  ;;; c++
  (setq comment-auto-fill-only-comments t)
  ;; (eval-after-load 'flycheck
  ;;   '(progn
  ;;      (setq flycheck-clang-args '("-stdlib=libstdc++"))))


  (add-hook 'c-mode-hook
            (lambda ()
              (auto-fill-mode 1)))

  (add-hook 'c++-mode-hook
            (lambda ()
              (auto-fill-mode 1)
              (setq flycheck-clang-args '("-stdlib=libstdc++"))
              (setq flycheck-clang-language-standard "c++11")))

  ;;; python
  ;; (defun python/auto-fill-mode ()
  ;;   (interactive)
  ;;   (auto-fill-mode))
  ;; (add-hook 'python-mode-hook 'auto-fill-mode)
  (add-hook 'python-mode-hook
            (lambda ()
              (auto-fill-mode)))
  ;; (defun python3-anaconda-mode (orig-fun &rest args)
  ;;   "Replace python2 to python3"
  ;;   (let ((python (if (eq system-type 'windows-nt) "pythonw" "python3"))
  ;;         (bin-dir (if (eq system-type 'windows-nt) "Scripts" "bin")))
  ;;     (--if-let anaconda-mode-virtualenv-variable
  ;;         (f-join it bin-dir python)
  ;;       python)))

  ;; (defun python2-anaconda-mode (orig-fun &rest args)
  ;;   (let ((python (if (eq system-type 'windows-nt) "pythonw" "python"))
  ;;         (bin-dir (if (eq system-type 'windows-nt) "Scripts" "bin")))
  ;;     (--if-let anaconda-mode-virtualenv-variable
  ;;         (f-join it bin-dir python)
  ;;       python)))

  ;; (defvar anaconda-mode-is-python2 t)

  ;; (defun switch-anaconda-python2-python3 ()
  ;;   (interactive)
  ;;   (if anaconda-mode-is-python2
  ;;       (progn
  ;;         (setq anaconda-mode-is-python2 nil)
  ;;         (advice-add 'anaconda-mode-python :around #'python3-anaconda-mode)
  ;;         (message "anaconda mode: python 3"))
  ;;     (progn
  ;;       (setq anaconda-mode-is-python2 t)
  ;;       (advice-add 'anaconda-mode-python :around #'python2-anaconda-mode)
  ;;       (message "anaconda mode: python 2"))))

  ;; (advice-add 'anaconda-mode-python :around #'my-anaconda-mode-python)

  ;; (add-hook 'python-mode-hook
  ;;           (lambda ()
  ;;             (define-key python-mode-map (kbd "s->") 'anaconda-mode-goto)
  ;;             (define-key python-mode-map (kbd "s-<") 'anaconda-nav-pop-marker)))

  ;;; latex
  (setq latex-run-command "pdflatex")
  (setq bibtex-align-at-equal-sign t)
  (evil-leader/set-key-for-mode 'latex-mode
    "m_" 'TeX-master-file-ask)

  ;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  ;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)

  ;; Use Skim as viewer, enable source <-> PDF sync
  ;; make latexmk available via C-c C-c
  ;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (push
                                '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
                                  :help "Run latexmk on file")
                                TeX-command-list)))
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

  ;; use Skim as default pdf viewer
  ;; Skim's displayline is used for forward search (from .tex to .pdf)
  ;; option -b highlights the current line; option -g opens Skim in the background
  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  (setq TeX-view-program-list
        '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

  ;; (setq TeX-view-program-list
  ;;       '(("Skim" "/Applications/Skim.app/Contents/MacOS/Skim %q")))
  ;; (add-hook 'TeX-mode-hook '(lambda ()
  ;;                          (spacemacs/toggle-visual-line-navigation)))
  ;; (add-hook 'LaTeX-mode-hook '(lambda ()
  ;;                          (spacemacs/toggle-visual-line-navigation)))

  ;; (add-hook 'text-mode-hook
  ;;           (lambda ()
  ;;             (smartparens-mode 1)
  ;;             (auto-fill-mode 1)))

  ;; whilte-space cleanup
  (require 'whitespace)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; org
  (add-hook 'org-mode-hook '(lambda ()
                              (auto-fill-mode 1)
                              (set-fill-column 75)))
  (setq org-src-fontify-natively t)
  (setq org-fontify-quote-and-verse-blocks t)
  (evil-define-key 'normal evil-org-mode-map
    "O" 'evil-open-above)

  ;; (desktop-save-mode)
  (evil-leader/set-key
    "ods" 'desktop-save-in-desktop-dir
    "odr" 'desktop-read)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
