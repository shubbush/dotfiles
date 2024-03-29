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
  :init
  (setq evil-want-C-u-scroll t
        evil-want-C-i-jump nil
        evil-respect-visual-line-mode t)
  :config
  (evil-mode t))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)
(global-hl-line-mode)
(menu-bar-mode -1) 
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(global-auto-revert-mode)

(add-to-list 'default-frame-alist
	     '(font . "IBM Plex Mono-12:style=Text"))

;; follow symlinks
(setq vc-follow-symlinks t)

;; rainbow-mode
(use-package rainbow-mode)

;; modus theme
(use-package modus-themes
  :config
  (setq modus-operandi-palette-overrides
      '((red "#DB3155")
        (blue "#00387b")
        (blue-warmer "#00387b")
	(green "#00605f")
	(magenta "#724d8d")
	(yellow-warmer "#E25303")
        (org-checkbox magenta)
        (fg-heading-2 blue)
        (fg-heading-3 magenta)
	(fg-heading-4 green)
	))
  (load-theme 'modus-operandi :no-confirm))

;; org-mode
(use-package org :straight (:type built-in)
  :config
  (setq org-fontify-done-headline t
      org-image-actual-width (list 300)
      org-startup-folded 'show2levels
      org-adapt-indentation t
      org-log-done 'time
      org-startup-with-inline-images t
      org-hide-leading-start t
      org-ellipsis "⬎"
      org-agenda-files '("~/todo")
      org-refile-targets '((org-agenda-files :maxlevel . 1))
      org-refile-use-outline-path 'file
      calendar-week-start-day 1)

  (add-hook 'org-agenda-mode-hook
          (lambda ()
            (local-set-key (kbd "j") 'org-agenda-next-line)
	    (local-set-key (kbd "k") 'org-agenda-previous-line)))

  (global-set-key (kbd "C-c a") #'org-agenda)
  (setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "CANCELED"))
      org-todo-keyword-faces
      '(("DONE" . (:foreground "#000000" ))
        ("TODO" . (:foreground "#00605f" :weight semi-bold )))
      )
  (setq org-agenda-custom-commands
      '(("c" "Today"
         ((agenda ""
		  ((org-agenda-span 'day)
		   (org-agenda-overriding-header "Today")))
          (tags "inbox"
                   ((org-agenda-skip-function
                     (lambda nil
                       (org-agenda-skip-entry-if 'deadline 'scheduled 'todo 'done)))
                    (org-agenda-overriding-header "Inbox")
                    ))))
	("u" "Upcoming"
	 ((agenda ""
	    ((org-agenda-span 90)
             (org-agenda-show-all-dates nil)
	     (org-agenda-overriding-header "Upcoming"))))))))

(custom-set-faces
 '(line-number ((t (:foreground "#babbbd" :background "#ffffff"))))
 '(org-checkbox ((t (:foreground "#724d8d" :weight semibold))))
 '(org-checkbox-statistics-todo ((t (:foreground "#724d8d"))))
 '(org-checkbox-statistics-done ((t (:foreground "#2f4858"))))
 ;; org mode
 '(org-headline-done ((t (:weight bold :foreground "#000000"))))
 '(org-headline-todo ((t (:weight bold))))
 '(org-scheduled ((t (:foreground "#000000")))))




;; treemacs
(use-package treemacs
 :config
  (treemacs))

(use-package treemacs-evil
  :after (treemacs evil))

;; org-download
(use-package org-download
  :custom
  (org-download-method 'directory)
  (org-download-image-dir "~/notes/.assets"))

(use-package org-cliplink)

;; org-capture
(global-set-key (kbd "C-c c") #'org-capture)
(setq org-default-notes-file "~/todo/inbox.org")
(setq org-capture-templates
      '(("i" "Inbox"  entry (file org-default-notes-file)
         "* TODO %?" )
        ("p" "Pocket" entry (file "~/todo/pocket.org")
         "* TODO %(org-cliplink-capture)")
				("w" "Wolt" entry (file "~/todo/wolt.org")
         "* TODO %?")))

