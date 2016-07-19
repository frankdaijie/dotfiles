;;; packages.el --- c-c++-irony Layer packages File for Spacemacs
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

(setq c-c++-irony-packages
  '(
    irony
    company-irony
    company-c-headers
    irony-eldoc
    google-c-style
    )
)

(setq c-c++-irony-excluded-packages '()
  )

;; For each package, define a function c-c++-irony/init-<package-c-c++-enhanement>
;;
;; (defun c-c++-irony/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun c-c++-irony/init-irony ()
  (use-package irony
    :config
    (progn
      (add-hook 'c++-mode-hook 'irony-mode)
      (add-hook 'c-mode-hook 'irony-mode)
      (add-hook 'objc-mode-hook 'irony-mode)

      ;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
      (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))))

(defun c-c++-irony/init-company-irony ()
  (use-package company-irony
    :config
    (progn
      (eval-after-load 'company
        '(progn
          (add-to-list 'company-backends 'company-irony)
          (add-hook 'c++-mode-hook
                    (lambda ()
                      (set (make-local-variable 'company-backends)
                           '(company-c-headers company-irony))))

          (add-hook 'c-mode-hook
                    (lambda ()
                      (set (make-local-variable 'company-backends)
                           '(company-c-headers company-irony))))
          )))))

(defun c-c++-irony/init-company-c-headers ()
  (use-package company-c-headers
    :defer t
    :config
    (add-to-list 'company-c-headers-path-system
                 (cond
                  ((system-is-mac) "/usr/include/c++/4.2.1/")
                  ((system-is-linux) "/usr/include/c++/4.8/")))
    ))


(defun c-c++-irony/init-google-c-style ()
  (use-package google-c-style
    :config
    (progn
      (add-hook 'c-mode-hook 'google-set-c-style)
      (add-hook 'c++-mode-hook 'google-set-c-style)
      )
    ))

(defun c-c++-irony/init-irony-eldoc ()
  (use-package irony-eldoc))

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
