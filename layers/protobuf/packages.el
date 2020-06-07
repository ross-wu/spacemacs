;;; packages.el --- Protocol Buffers Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Amol Mandhane <https://github.com/amol-mandhane>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst protobuf-packages
      '(
        company
        flycheck
        protobuf-mode
        smartparens
        ))

(defun protobuf/post-init-company ()
  (spacemacs|add-company-hook protobuf-mode))

(defun protobuf/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'protobuf-mode))

(defun protobuf/init-protobuf-mode ()
  (use-package protobuf-mode
    :init (add-hook 'protobuf-mode-hook 'spacemacs//setup-protobuf-imenu)))

(defun protobuf/post-init-smartparens ()
  (add-hook 'protobuf-mode-hook
            (if dotspacemacs-smartparens-strict-mode
                #'smartparens-strict-mode
              #'smartparens-mode)))
