;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
(setq doom-font (font-spec :family "monospace" :size 33))
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nano-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/todo/")
(setq org-archive-location "~/todo/archive/%s::")
(after! org
  (print "setup org")
  (setq
   ;; org-fontify-done-headline t
   org-startup-folded 'show2levels
   org-adapt-indentation t
   org-log-done 'time
   org-ellipsis "⬎"
   org-refile-targets '((org-agenda-files :tag . "project"))
   org-refile-use-outline-path 'file
   org-outline-path-complete-in-steps nil
   calendar-week-start-day 1
  org-default-notes-file "~/todo/inbox.org"
   org-todo-keywords '((sequence "TODO" "|" "DONE" "CANCELED")))
  (setq org-capture-templates
        '(("i" "Inbox"  entry (file org-default-notes-file)
           "* TODO %?" )
          ("w" "Work"  entry (file "~/todo/work.org")
           "* TODO %?" )
          ("p" "Pocket" entry (file "~/todo/pocket.org")
           "* TODO %(org-cliplink-capture)"))))

(after! org-agenda
  (setq
   org-agenda-start-day "+0d"
   org-agenda-custom-commands
   '(("s" "Super Today"
      ((agenda "" ((org-agenda-overriding-header "")
                   (org-agenda-span 'day)
                   (org-super-agenda-groups
                    '(
                      (:name "Today"
                       :time-grid t
                       :not (:tag "work"))
                      (:name "Work"
                       :time-grid t
                       :tag "work")
                      ))))
       (tags "inbox"
             ((org-agenda-skip-function
               (lambda nil
                 (org-agenda-skip-entry-if 'deadline 'scheduled 'todo 'done)))
              (org-agenda-overriding-header "Inbox")
              ))
       ))
     ("u" "Upcoming"
      ((agenda ""
               ((org-agenda-span 90)
                (org-agenda-show-all-dates nil)
                (org-agenda-overriding-header "Upcoming"))))))))

(map! :after evil-org-agenda
      :map evil-org-agenda-mode-map
      :leader
      "o r" #'org-refile ;; doesn't work
      "o s" #'org-save-all-org-buffers)

(map! :after org-super-agenda
      :map org-super-agenda-header-map
      "j" #'org-agenda-next-line
      "k" #'org-agenda-previous-line)

(setq initial-frame-alist '((top . 10) (left . 10) (width . 90) (height . 35)))

(defun emacs-startup-screen ()
  "Display the today org-agenda."
  (org-super-agenda-mode)
  (org-agenda nil "s"))
(add-hook 'emacs-startup-hook #'emacs-startup-screen)

(after! projectile
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/todo/"))
  (defvar projectile-main-project "~/todo/")

  (defun use-main-project (&rest args)
    "Skip calling `projectile-project-root' when there is a main project defined."
    (when projectile-main-project
      projectile-main-project))

  (advice-add #'projectile-project-root :before-until #'use-main-project)
  )

;; autosave files
(setq auto-save-default t
      auto-save-visited-mode t
      auto-save-visited-interval 3)
(auto-save-visited-mode +1)

(defadvice switch-to-buffer (before save-buffer-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice evil-window-left (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice evil-window-right (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice evil-window-up(before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice evil-window-down (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(advice-add 'org-refile :after
    (lambda (&rest _)
      (save-some-buffers t)))

(add-function :after after-focus-change-function (lambda () (save-some-buffers t)))


(setq confirm-kill-emacs nil)
(global-auto-revert-mode)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; local overrides
(let ((personal-settings "~/.doom.d/config-local.el"))
 (when (file-exists-p personal-settings)
   (load-file personal-settings))
)

;; Fixes org-capture after opening agenda
;; See https://github.com/doomemacs/doomemacs/issues/5714
(after! org
  (defadvice! dan/org-capture-prevent-restart (fn &rest args)
    :around #'+org--restart-mode-h
    (unless (bound-and-true-p org-capture-mode)
      (apply fn args)))
  (add-hook! 'org-capture-after-finalize-hook
             (let ((buffer (org-capture-get :buffer)))
               (when (buffer-live-p buffer)
                 (with-current-buffer buffer
                   (+org--restart-mode-h)))))
  (map! :leader
      "a" #'org-agenda
      "o x" #'org-capture
      "o ," #'org-switchb
      "o /" #'consult-org-agenda
      "o r" #'org-refile))



;; preserve structure when archiving
(defadvice org-archive-subtree (around my-org-archive-subtree activate)
  (let ((org-archive-location
         (if (save-excursion (org-back-to-heading)
                             (> (org-outline-level) 1))
             (concat (car (split-string org-archive-location "::"))
                     "::* "
                     (car (org-get-outline-path)))
           org-archive-location)))
    ad-do-it))
