;;; packages.el --- chinese-pyim Layer packages File for Spacemacs
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

(setq chinese-pyim-packages
  '(
    ;; package chinese-pyims go here
    chinese-pyim
    ;; chinese-pyim-company
    ))

(setq chinese-pyim-excluded-packages '()
  )

(defun chinese-pyim/init-chinese-pyim ()
  ;; (use-package chinese-pyim
  ;;   :config

  ;;   (setq pyim-use-tooltip nil)
  ;;   (pyim-toggle-full-width-punctuation nil)
  ;;   )
  (require 'chinese-pyim)
  ;; (require 'chinese-pyim-company)

  ;; use the bottom bar to display the work
  (setq pyim-use-tooltip nil)

  ;; use half width punctuation (for english input convenience)
  ;; (pyim-toggle-full-width-punctuation nil)
  (eval-after-load 'chinese-pyim
    `(setq pyim-punctuation-trasnlate-p nil)
    )
  )
;; For each package, define a function chinese-pyim/init-<package-chinese-pyim>
;;
;; (defun chinese-pyim/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
