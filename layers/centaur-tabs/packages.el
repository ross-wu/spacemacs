;;; packages.el --- centaur-tabs Layer packages file for Spacemacs
;;
;;
;; save as ~/.emacs.d/private/centaur-tabs/packages.el
;; add to ~/.spacemacs layers `centaur-tabs`
;;
;; please feel free to make this nicer and contribute it back
;;
;; Original from: https://github.com/ema2159/centaur-tabs

(defvar centaur-tabs-packages
  '(
    centaur-tabs
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar centaur-tabs-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function tabbar/init-<package-tabbar>
;;
;; (defun tabbar/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun centaur-tabs/init-centaur-tabs ()
  "Initialize centaur-tabs"
  (use-package centaur-tabs
    :demand

    :config
    (progn
      (centaur-tabs-mode t)
      (setq centaur-tabs-style "slant"
            centaur-tabs-set-bar 'under
            centaur-tabs-set-icons nil
            centaur-tabs-close-button "x"
            centaur-tabs-set-modified-marker "*"))

    (defun centaur-tabs-buffer-groups ()
     "`centaur-tabs-buffer-groups' control buffers' group rules.

 Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
 All buffer name start with * will group to \"Emacs\".
 Other buffer group by `centaur-tabs-get-group-name' with project name."
     (list
      (cond
       ((string-equal "*" (substring (buffer-name) 0 1)) "Emacs")
       (t "Default")
       )
      )
     )

    :bind
    ("<C-S-left>" . centaur-tabs-backward)
    ("<C-S-right>" . centaur-tabs-forward)
    )

  (custom-set-faces
   '(centaur-tabs-active-bar-face ((t (:foreground "brightwhite"))))
   )
  )
