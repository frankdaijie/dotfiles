;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.dotfiles/spacemacs/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; better default
     better-defaults
     ;; chinese-pyim
     osx

     ;; languages
     (c-c++ :variables
            c-c++-enable-clang-support t
            c-c++-default-mode-for-headers 'c++-mode)
     c-c++-irony
     emacs-lisp
     ;; (latex :variables
     ;;        latex-enable-auto-fill t)
     latex
     markdown
     org
     python
     ruby
     (shell :variables
            shell-default-shell 'multi-term)
     thrift

     ;; tools
     auto-completion
     evernote
     fasd
     gtags
     semantic
     syntax-checking
     ;; visual-fill-column

     ;; source-control
     git
     version-control

     ;; windows management
     ;; (perspectives :variables
     ;;               perspective-enable-persp-projectile t)
     eyebrowse
     )
   ;; List of additional packages that will be installed wihout being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t)
  )

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         zenburn
                         ;; solarized-light
                         ;; solarized-dark
                         leuven
                         ;; monokai
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font (if (string-equal system-type "gnu/linux")
                                  '("Source Code Pro for Powerline"
                                    :size 13
                                    :weight normal
                                    :width normal
                                    :powerline-scale 1.1)
                                '("Source Code Pro for Powerline"
                                  :size 13
                                  :weight normal
                                  :width normal
                                  :powerline-scale 1.1))
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  (setq-default line-spacing 3)
  (setq-default c-default-style "linux"
                c-toggle-hungry-state 1
                c-toggle-auto-newline -1)
  )


(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."

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

  (evil-define-key 'insert term-raw-map
    "\C-y" 'term-paste
    "\C-w" 'term-send-backward-kill-word
    "\C-]" 'term-send-esc)

  (add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

  ;; Lang
  ;;; c++
  (setq comment-auto-fill-only-comments t)
  (eval-after-load 'flycheck
    '(progn
       (setq flycheck-clang-args '("-stdlib=libstdc++"))
       (setq flycheck-clang-language-standard '("c++11"))))
  ;; (setq flycheck-clang-language-standard "c++11")
  (add-hook 'c-mode-hook
            (lambda ()
              (auto-fill-mode 1)))
  (add-hook 'c++-mode-hook
            (lambda ()
              (auto-fill-mode 1)))

  ;;; python
  (defun python3-anaconda-mode (orig-fun &rest args)
    "Replace python2 to python3"
    (let ((python (if (eq system-type 'windows-nt) "pythonw" "python3"))
          (bin-dir (if (eq system-type 'windows-nt) "Scripts" "bin")))
      (--if-let anaconda-mode-virtualenv-variable
          (f-join it bin-dir python)
        python)))

  (defun python2-anaconda-mode (orig-fun &rest args)
    (let ((python (if (eq system-type 'windows-nt) "pythonw" "python"))
          (bin-dir (if (eq system-type 'windows-nt) "Scripts" "bin")))
      (--if-let anaconda-mode-virtualenv-variable
          (f-join it bin-dir python)
        python)))

  (defvar anaconda-mode-is-python2 t)

  (defun switch-anaconda-python2-python3 ()
    (interactive)
    (if anaconda-mode-is-python2
        (progn
          (setq anaconda-mode-is-python2 nil)
          (advice-add 'anaconda-mode-python :around #'python3-anaconda-mode)
          (message "anaconda mode: python 3"))
      (progn
        (setq anaconda-mode-is-python2 t)
        (advice-add 'anaconda-mode-python :around #'python2-anaconda-mode)
        (message "anaconda mode: python 2"))))

  ;; (advice-add 'anaconda-mode-python :around #'my-anaconda-mode-python)

  (add-hook 'python-mode-hook
            (lambda ()
              (define-key python-mode-map (kbd "s->") 'anaconda-mode-goto)
              (define-key python-mode-map (kbd "s-<") 'anaconda-nav-pop-marker)))

  ;;; latex
  (setq latex-run-command "pdflatex")
  (setq bibtex-align-at-equal-sign t)
  (evil-leader/set-key-for-mode 'latex-mode
    "m_" 'TeX-master-file-ask)
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
  (setq org-src-fontify-natively t)
  (setq org-fontify-quote-and-verse-blocks t)
  (evil-define-key 'normal evil-org-mode-map
    "O" 'evil-open-above)

  ;; (desktop-save-mode)
  (evil-leader/set-key
    "ods" 'desktop-save-in-desktop-dir
    "odr" 'desktop-read)
  )

;; OSX
(defun mac-switch-meta nil
  "switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn
        (setq mac-option-modifier 'meta)
        (setq mac-command-modifier 'super))
    (progn
      (setq mac-option-modifier nil)
      (setq mac-command-modifier 'meta))))

;; org
(defun dj-org-mode-defaults ()
  "DJ's hook for org-mode"
  (turn-on-auto-fill)
  (turn-on-org-cdlatex))

;; Copied from prelude to clear whitespace
(defun prelude-cleanup-maybe ()
  "Invoke `whitespace-cleanup' if `prelude-clean-whitespace-on-save' is not nil."
  (when prelude-clean-whitespace-on-save
    (whitespace-cleanup)))

(defun prelude-enable-whitespace ()
  "Enable `whitespace-mode' if `prelude-whitespace' is not nil."
  (when prelude-whitespace
    ;; keep the whitespace decent all the time (in this buffer)
    (add-hook 'before-save-hook 'prelude-cleanup-maybe nil t)
    (whitespace-mode +1)))

(defcustom prelude-indent-sensitive-modes
  '(conf-mode coffee-mode haml-mode python-mode slim-mode yaml-mode)
  "Modes for which auto-indenting is suppressed."
  :type 'list
  :group 'prelude)

(defun prelude-cleanup-buffer-or-region ()
  "Cleanup a region if selected, otherwise the whole buffer."
  (interactive)
  (call-interactively 'untabify)
  (unless (member major-mode prelude-indent-sensitive-modes)
    (call-interactively 'indent-region))
  (whitespace-cleanup))

(defun shk-yas/helm-prompt (prompt choices &optional display-fn)
    "Use helm to select a snippet. Put this into `yas/prompt-functions.'"
    (interactive)
    (setq display-fn (or display-fn 'identity))
    (if (require 'helm-config)
        (let (tmpsource cands result rmap)
          (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
          (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
          (setq tmpsource
                (list
                 (cons 'name prompt)
                 (cons 'candidates cands)
                 '(action . (("Expand" . (lambda (selection) selection))))
                 ))
          (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
          (if (null result)
              (signal 'quit "user quit!")
            (cdr (assoc result rmap))))
      nil))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list
   (quote
    (("skim"
      ("")
      "/Applications/Skim.app/Contents/MacOS/Skim"))))
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(flycheck-clang-language-standard "c++11")
 '(paradox-github-token t)
 '(preview-TeX-style-dir "/Users/DJ/.emacs.d/elpa/auctex-11.88.6/latex")
 '(pyim-dicts
   (quote
    ((:name "BigDict-01" :file "/Users/DJ/.emacs.d/pyim/dicts/pyim-bigdict.pyim" :coding utf-8-unix))))
 ;; '(python-shell-interpreter "ipython3")
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(eldoc-highlight-function-argument ((t (:inherit bold :foreground "light salmon")))))
