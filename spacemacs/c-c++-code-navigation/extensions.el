;;; extensions.el --- c-c++-code-navigation Layer extensions File for Spacemacs
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

(defvar c-c++-code-navigation-pre-extensions
  '(
    ;; pre extension c-c++-code-navigations go here
    )
  "List of all extensions to load before the packages.")

(defvar c-c++-code-navigation-post-extensions
  '(
    ;; post extension c-c++-code-navigations go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function c-c++-code-navigation/init-<extension-c-c++-code-navigation>
;;
;; (defun c-c++-code-navigation/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
