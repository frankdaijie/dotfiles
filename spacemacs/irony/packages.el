;;; packages.el --- irony Layer packages File for Spacemacs
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

(defvar irony-packages
  '(
    ;; package ironys go here
    irony
    company-irony
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar irony-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function irony/init-<package-irony>
;;
;; (defun irony/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun irony/init-irony ()
  (use-package irony
    :config
    (progn
      (add-hook 'c++-mode-hook 'irony-mode)
      (add-hook 'c-mode-hook 'irony-mode)
      (add-hook 'objc-mode-hook 'irony-mode)

      (add-hook 'irony-mode-hook 'my-irony-mode-hook)
      (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))))


(defun irony/init-company-irony ()
  (use-package company-irony
    :config
    (progn
      (eval-after-load 'company
        '(progn
          (add-to-list 'company-backends 'company-irony)
          ;; (setq company-backends (delete 'company-clang company-backends))
          (add-hook 'c++-mode-hook
                    (lambda ()
                      (set (make-local-variable 'company-backends)
                           '(company-irony company-gtags))))

          (add-hook 'c-mode-hook
                    (lambda ()
                      (set (make-local-variable 'company-backends)
                           '(company-irony company-gtags))))
          ;; (setq company-backends (delete 'company-semantic company-backends))

                                         )))))

    ;; (eval-after-load 'company
    ;;   (progn
    ;;     '(add-to-list 'copmany-backends 'company-irony)
    ;;     (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)))))


(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
