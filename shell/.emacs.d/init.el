(load "~/.emacs.d/init-straight.el")

;; set custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; location for backup and auto save files
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t))) 

;; use-package
(straight-use-package 'use-package)

(use-package evil
  :config
  (evil-mode t))

