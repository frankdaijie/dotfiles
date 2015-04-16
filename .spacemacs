;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Configuration Layers
;; --------------------

(setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '("~/.dotfiles/spacemacs/")
 ;; List of configuration layers to load.
 dotspacemacs-configuration-layers '(auctex
                                     auto-completion
                                     chinese-pyim
                                     c-c++
                                     evernote
                                     git
                                     markdown
                                     osx
                                     org
                                     python
                                     ruby
                                     syntax-checking
                                     vagrant)
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '()

 dotspacemacs-themes '(zenburn)
)

;; Settings
;; --------

(setq-default
 ;; Default theme applied at startup
 dotspacemacs-default-theme 'monokai
 ;; The leader key
 dotspacemacs-leader-key "SPC"
 ;; The command key used for Evil commands (ex-commands) and
 ;; Emacs commands (M-x).
 ;; By default the command key is `:' so ex-commands are executed like in Vim
 ;; with `:' and Emacs commands are executed with `<leader> :'.
 dotspacemacs-command-key ":"
 ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
 ;; the commands bound to the current keystrokes.
 dotspacemacs-guide-key-delay 0.4
 ;; If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).
 dotspacemacs-fullscreen-at-startup nil
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
 ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
 dotspacemacs-maximized-at-startup nil
 ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
 ;; overrides the default behavior of Emacs which recenters the point when
 ;; it reaches the top or bottom of the screen
 dotspacemacs-smooth-scrolling t
 ;; If non nil pressing 'jk' in insert state, ido or helm will activate the
 ;; evil leader.
 dotspacemacs-feature-toggle-leader-on-jk nil
 ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
 dotspacemacs-smartparens-strict-mode t
 ;; If non nil advises quit functions to keep server open when quitting.
 dotspacemacs-persistent-server nil
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil
)

;; Initialization Hooks
;; --------------------

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."
  (spacemacs/set-font "Source Code Pro for Powerline" 14)
  (setq-default line-spacing 3)
  (setq-default c-default-style "linux"
                c-basic-offset 4
                c-toggle-hungry-state 1
                c-toggle-auto-newline -1)
)


;; (defun term-send-tab ()
;;   "Send tab in term mode."
;;   (interactive
;;   (term-send-raw-string "\t")))

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."

  ;; (eval-after-load 'flycheck
  ;;   '(setq flycheck-check-syntax-automatically '(save
  ;;                                                idle-change
  ;;                                                mode-enabled
  ;;                                                new-line)))
  ;; (eval-after-load 'company
  ;;   '(lambda ()
  ;;      (setq company-idle-delay 0.1)))
  ;; (setq company-quickhelp-max-lines 10)
  ;; (global-set-key (kbd "s-i") 'company-complete-common)
  ;; (global-set-key (kbd "C-k") 'company-complete-common)
  (define-key evil-insert-state-map (kbd "C-p") 'company-complete-common)

  (setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
  (setq tab-always-indent 'complete)

  ;; (smartparens-global-mode 1)

  (setq powerline-default-separator 'arrow)
  (set-face-attribute 'region nil :foreground "white" :background "#Aa7941")

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

  ;; zshell
  (setq multi-term-program "/bin/zsh")
  (setq multi-term-buffer-name "zshell")
  (setq multi-term-scroll-to-bottom-on-output 't)
  (setq multi-term-scroll-show-maximum-output 't)

  (global-set-key (kbd "s-t") 'multi-term)
  (global-set-key (kbd "s-}") 'multi-term-next)
  (global-set-key (kbd "s-{") 'multi-term-prev)

  (evil-define-key 'insert term-raw-map
    "\C-y" 'term-paste
    "\C-w" 'term-send-backward-kill-word)

  (evil-define-key 'normal term-raw-map
    "p" 'term-paste)

  ;; yasnippet
  (require 'yasnippet)
  (yas/global-mode t)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "C-k") 'yas-expand)
  (evil-define-key 'insert yas-minor-mode-map
    (kbd "C-k") 'yas-expand)

  ;; Reload all the snippets at startup
  (yas/reload-all)
  (add-hook 'prog-mode-hook
            '(lambda ()
               (yas-minor-mode)))

  (add-hook 'yas/prompt-functions 'shk-yas/helm-prompt)

  ;;; Lang
  (setq comment-auto-fill-only-comments t)
  (add-hook 'c-mode-hook
            (lambda ()
              (auto-fill-mode 1)))

  ;; python
  ;; (define-key python-mode-map (kbd "s->") 'anaconda-mode-goto)
  ;; (define-key python-mode-map (kbd "s-<") 'anaconda-nav-pop-marker)

  ;; latex
  (setq latex-run-command "pdflatex")
  (add-hook 'text-mode-hook
            (lambda ()
              (smartparens-mode 1)
              (auto-fill-mode 1)))

  ;; whilte-space cleanup
  (require 'whitespace)
  ;; (add-hook 'text-mode-hook 'prelude-enable-whitespace)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;;; Notes
  ;; org
  ;; (eval-after-load 'org
  ;;   (progn
  ;;     ;; (setq org-adapt-indentation nil)
  ;;     (setq org-src-fontify-natively t)
  ;;     ;; (setq org-startup-indented t)
  ;;     (setq org-fontify-quote-and-verse-blocks t)
  ;;     (setq org-use-speed-commands t)))

  (setq org-src-fontify-natively t)
  (setq org-fontify-quote-and-verse-blocks t)
  (evil-define-key 'normal evil-org-mode-map
    "O" 'evil-open-above)

  ;; (setq dj-org-mode-hook 'dj-org-mode-defaults)
  ;; (add-hook 'org-mode-hook
  ;;           (lambda ()
  ;;             (run-hooks 'dj-org-mode-hook)))

  )

;; org
(defun dj-org-mode-defaults ()
  "DJ's hook for org-mode"
  (turn-on-auto-fill)
  (turn-on-org-cdlatex))

;; Ausillary functions
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

;; Custom variables
;; ----------------

;; Do not write anything in this section. This is where Emacs will
;; auto-generate custom variable definitions.


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 ;; '(company-backends
 ;;   (quote
 ;;    ((company-tern :with company-yasnippet)
 ;;     company-c-headers
 ;;     (company-anaconda :with company-yasnippet)
 ;;     (company-bbdb :with company-yasnippet)
 ;;     (company-nxml :with company-yasnippet)
 ;;     (company-css :with company-yasnippet)
 ;;     (company-eclim :with company-yasnippet)
 ;;     (company-clang :with company-yasnippet)
 ;;     ;; (company-clang)
 ;;     (company-xcode :with company-yasnippet)
 ;;     (company-cmake :with company-yasnippet)
 ;;     (company-capf :with company-yasnippet)
 ;;     (company-dabbrev-code company-gtags company-etags company-keywords :with company-yasnippet)
 ;;     (company-oddmuse :with company-yasnippet)
 ;;     (company-files :with company-yasnippet)
 ;;     (company-dabbrev :with company-yasnippet))))
 '(paradox-github-token t)
 '(pyim-dicts
   (quote
    ((:name "BigDict-01" :file "/Users/DJ/.emacs.d/pyim/dicts/pyim-bigdict.pyim" :coding utf-8-unix))))
 '(pyim-use-tooltip nil)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
