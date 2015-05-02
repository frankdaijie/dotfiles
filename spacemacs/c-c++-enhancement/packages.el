;;; packages.el --- c-c++-enhancement Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar c-c++-enhancement-packages
  '(
    irony
    company-irony
    helm-gtags
    company-c-headers
    google-c-style
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar c-c++-enhancement-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function c-c++-enhancement/init-<package-c-c++-enhanement>
;;
;; (defun c-c++-enhancement/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun c-c++-enhancement/init-irony ()
  (use-package irony
    :config
    (progn
      (add-hook 'c++-mode-hook 'irony-mode)
      (add-hook 'c-mode-hook 'irony-mode)
      (add-hook 'objc-mode-hook 'irony-mode)

      ;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
      (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))))

(defun c-c++-enhancement/init-company-irony ()
  (use-package company-irony
    :config
    (progn
      (eval-after-load 'company
        '(progn
          (add-to-list 'company-backends 'company-irony)
          (add-hook 'c++-mode-hook
                    (lambda ()
                      (set (make-local-variable 'company-backends)
                           '(company-c-headers :with company-irony)
                             )))

          (add-hook 'c-mode-hook
                    (lambda ()
                      (set (make-local-variable 'company-backends)
                           '(company-c-headers :with company-irony))))
          )))))

(defun c-c++-enhancement/init-company-c-headers ()
  (use-package company-c-headers
    :defer t
    :config
    (add-to-list 'company-c-headers-path-system
                 (cond
                  ((system-is-mac) "/usr/include/c++/4.2.1/")
                  ((system-is-linux) "/usr/include/c++/4.8/")))
    ))

(defun c-c++-enhancement/init-helm-gtags ()
  (use-package helm-gtags
    :config
    ;; The following configuration are mostly based on tuhdo:
    ;; https://github.com/tuhdo/emacs-c-ide-demo/blob/master/custom/setup-helm-gtags.el
    (setq helm-gtags-ignore-case t
          helm-gtags-auto-update t
          helm-gtags-use-input-at-cursor t
          helm-gtags-pulse-at-cursor t
          helm-gtags-prefix-key "\C-cg"
          helm-gtags-suggested-key-mapping t)

    ;; Enable helm-gtags-mode in Dired so you can jump to any tag
    ;; when navigate project tree with Dired
    (add-hook 'dired-mode-hook 'helm-gtags-mode)

    ;; Enable helm-gtags-mode in Eshell for the same reason as above
    (add-hook 'eshell-mode-hook 'helm-gtags-mode)

    ;; Enable helm-gtags-mode in languages that GNU Global supports
    (add-hook 'c-mode-hook 'helm-gtags-mode)
    (add-hook 'c++-mode-hook 'helm-gtags-mode)
    (add-hook 'java-mode-hook 'helm-gtags-mode)
    (add-hook 'asm-mode-hook 'helm-gtags-mode)

    ;; key bindings
    (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
    (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
    (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
    (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
    (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
    (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

    (evil-leader/set-key-for-mode 'c-mode
      "og" 'helm-gtags-tags-in-this-function
      "oc" 'helm-gtags-create-tags
      "o." 'helm-gtags-dwim
      "o," 'helm-gtags-pop-stack
      "o<" 'helm-gtags-previous-history
      "o>" 'helm-gtags-next-history)

    (evil-leader/set-key-for-mode 'c++-mode
      "og" 'helm-gtags-tags-in-this-function
      "oc" 'helm-gtags-create-tags
      "o." 'helm-gtags-dwim
      "o," 'helm-gtags-pop-stack
      "o<" 'helm-gtags-previous-history
      "o>" 'helm-gtags-next-history)
    ))

(defun c-c++-enhancement/init-google-c-style ()
  (use-package google-c-style
    :config
    (progn
      (add-hook 'c-mode-hook 'google-set-c-style)
      (add-hook 'c++-mode-hook 'google-set-c-style)
      )
    ))

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
