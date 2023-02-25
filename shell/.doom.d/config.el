;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
 (setq doom-font (font-spec :family "Iosevka" :width 'expanded :size 14)
       doom-variable-pitch-font (font-spec :family "SF Pro Text" :size 14))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-github-light)

(setq doom-themes-treemacs-theme "doom-colors")

;; org-mode
(after! org
  (setq org-image-actual-width (list 300)
        org-startup-with-inline-images t
        org-directory "~/notes/"
        org-log-done 'time
        org-todo-keywords '((sequence "TODO" "|" "DONE" "CANCELED"))))

(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; Disable hl-line in all buffers. See https://github.com/doomemacs/doomemacs/issues/4206#issuecomment-734414502
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; org-download
(use-package org-download
  :custom
  (org-download-method 'directory)
  (org-download-image-dir "~/notes/.assets"))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.1))))
)

(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

(setq org-ellipsis "⬎")
