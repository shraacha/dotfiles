;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Anish Racharla"
      user-mail-address "racharlaanish@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
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
(setq doom-font (font-spec :name "JetBrainsMono Nerd Font Mono" :size 13 :weight 'regular))

(setq doom-unicode-font (font-spec :name "JetBrainsMono Nerd Font Mono" :size 13 :weight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'ef-bio)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Local_Documents/Org/")


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

;; fullscreen on startup
(add-to-list 'default-frame-alist `(fullscreen . maximized))

;; theme stuff
;; modus stuff
(setq modus-themes-bold-constructs t)

;; from https://protesilaos.com/emacs/modus-themes#h:df1199d8-eaba-47db-805d-6b568a577bf3
(setq modus-themes-common-palette-overrides
      '(
        ;; colours for the modeline
        (bg-mode-line-active bg-blue-subtle)
        (fg-mode-line-active fg-main)
        (border-mode-line-active bg-blue-subtle)

        ;; makes highlighting background less dark
        (bg-region bg-dim)

        ;; makes highlighting still show colour
        (fg-region unspecified)

        ;; intense (more contrast) numbers for line numbers
        (fg-line-number-inactive fg-main)
        (fg-line-number-active fg-main)

        ;; invisible background for line numbers
        (bg-line-number-inactive unspecified)
        (bg-line-number-active unspecified)

        ;; invisible fringe:
        (fringe unspecified)
        ))

;; gives org-mode blocks a coloured background
(setq modus-themes-org-blocks 'tinted-background)

(setq modus-vivendi-tritanopia-palette-overrides
      '(
        ;; make every background pitch black
        ;; (bg-dim  "#000000")  ; default is #f8f8f8
        ;; (bg-alt  "#000000")  ; default is #f0f0f0
        (comment fg-dim)
        ))

(setq ef-night-palette-overrides
      '(
        (comment "#4f5e57") ; default is #cf9f7
        ))

(setq ef-bio-palette-overrides
      '(
        (bg-main "#010101") ; default is #111111
        (comment "#786a59") ; default is #cf9f7
        ))

(setq ef-themes-to-toggle '(ef-bio ef-elea-light))

;; treemacs
(use-package! treemacs
  :defer t
  :config
  ;; alters file icons to be more vscode-esque (better 😼)
  ;; https://github.com/doomemacs/themes/wiki/Extension:-Treemacs
  (setq doom-themes-treemacs-theme "doom-colors")
  )

;; latex stuff


(use-package! latex-preview-pane-mode
  :defer t
  :config
  (setq shell-escape-mode "-shell-escape")
  ;; (add-hook 'latex-mode-hook (lambda () 'TeX-clean))
  )

;; ~~ BEGINNING of org stuff ~~
;; org roam stuff
(use-package! org-roam
  :config
  ;; (setq org-roam-directory (file-truename "~/Local_Documents/Org-CS350"))
  )

;; org mode tweaks
(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-todo nil)
  (setq org-modern-checkbox nil)
  (setq org-modern-todo-faces nil)
  (setq org-modern-star '("◉" "○" "◈" "◇" "⊡" "□" "*"))
  )

(defun dw/org-mode-setup ()
  (setq visual-fill-column-center-text t)
  (setq visual-fill-column-width 110)
  (visual-fill-column-mode 1)
  (org-indent-mode)
  (visual-line-mode)
  (setq evil-auto-indent nil))

(use-package! org
  :hook (org-mode . dw/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq org-src-fontify-natively t)
  (setq org-latex-src-block-backend 'engraved)
  ;; makes latex preview bigger
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  ;; lualatex preview
  (setq org-latex-pdf-process
        '("lualatex -shell-escape -interaction nonstopmode %f"
          "lualatex -shell-escape -interaction nonstopmode %f"))

  ;;; stolen from somewhere
  (setq luamagick '(luamagick :programs ("lualatex" "convert")
                    :description "pdf > png"
                    :message "you need to install lualatex and imagemagick."
                    :use-xcolor t
                    :image-input-type "pdf"
                    :image-output-type "png"
                    :image-size-adjust (1.0 . 1.0)
                    :latex-compiler ("lualatex -interaction nonstopmode -output-directory %o %f")
                    :image-converter ("convert -density %D -trim -antialias %f -quality 100 %O")))

  (add-to-list 'org-preview-latex-process-alist luamagick)
  (setq org-preview-latex-default-process 'luamagick) ;; lowkey no idea
  )

;; org agenda stuff
;; based on (mostly stolen from) jethro's config

;; using this rather than org-agenda-bulk-mark-regexp since it did not correctly match the caterogory
;;   of item, and tried to match the text of the item
;; stolen from https://emacs.stackexchange.com/questions/59657/how-to-bulk-mark-agenda-items-based-on-file-name
(defun custom/org-agenda-bulk-mark-regexp-category (regexp)
  "Mark entries whose category matches REGEXP for future agenda bulk action."
  (interactive "sMark entries with category matching regexp: ")
  (let ((entries-marked 0) txt-at-point)
    (save-excursion
      (goto-char (point-min))
      (goto-char (next-single-property-change (point) 'org-hd-marker))
      (while (and (re-search-forward regexp nil t)
                  (setq category-at-point
                        (get-text-property (match-beginning 0) 'org-category)))
        (if (get-char-property (point) 'invisible)
            (beginning-of-line 2)
          (when (string-match-p regexp category-at-point)
            (setq entries-marked (1+ entries-marked))
            (call-interactively 'org-agenda-bulk-mark)))))
    (unless entries-marked
      (message "No entry matching this regexp."))))

(defvar custom/org-current-effort "1:00"
  "Current effort for agenda items.")

(defun custom/my-org-agenda-set-effort (effort)
  "Set the effort property for the current headline."
  (interactive
   (list (read-string (format "Effort [%s]: " custom/org-current-effort) nil nil custom/org-current-effort)))
  (setq custom/org-current-effort effort)
  (org-agenda-check-no-diary)
  (let* ((hdmarker (or (org-get-at-bol 'org-hd-marker)
                       (org-agenda-error)))
         (buffer (marker-buffer hdmarker))
         (pos (marker-position hdmarker))
         (inhibit-read-only t)
         newhead)
    (org-with-remote-undo buffer
      (with-current-buffer buffer
        (widen)
        (goto-char pos)
        (org-fold-show-context 'agenda)
        (funcall-interactively 'org-set-effort nil custom/org-current-effort)
        (end-of-line 1)
        (setq newhead (org-get-heading)))
      (org-agenda-change-all-lines newhead hdmarker))))

(defun custom/org-agenda-process-inbox-item ()
  "Process a single item in the org-agenda."
  (org-with-wide-buffer
   (org-agenda-set-tags)
   (org-agenda-priority)
   (call-interactively 'custom/my-org-agenda-set-effort)
   (org-agenda-refile nil nil t)
   ))

(defun custom/bulk-process-entries ()
  (interactive)
  (let ())
  (if (not (null org-agenda-bulk-marked-entries))
      (let ((entries (reverse org-agenda-bulk-marked-entries))
            (processed 0)
            (skipped 0))
        (dolist (e entries)
          (let ((pos (text-property-any (point-min) (point-max) 'org-hd-marker e)))
            (if (not pos)
                (progn (message "Skipping removed entry at %s" e)
                       (cl-incf skipped))
              (goto-char pos)
              (let (org-loop-over-headlines-in-active-region) (funcall 'custom/org-agenda-process-inbox-item))
              ;; `post-command-hook' is not run yet.  We make sure any
              ;; pending log note is processed.
              (when (or (memq 'org-add-log-note (default-value 'post-command-hook))
                        (memq 'org-add-log-note post-command-hook))
                (org-add-log-note))
              (cl-incf processed))))
        (org-agenda-redo)
        (unless org-agenda-persistent-marks (org-agenda-bulk-unmark-all))
        (message "Acted on %d entries%s%s"
                 processed
                 (if (= skipped 0)
                     ""
                   (format ", skipped %d (disappeared before their turn)"
                           skipped))
                 (if (not org-agenda-persistent-marks) "" " (kept marked)")))))

(defun custom/org-process-inbox ()
  "Called in org-agenda-mode, processes all inbox items."
  (interactive)
  (custom/org-agenda-bulk-mark-regexp-category "inbox")
  (custom/bulk-process-entries))

(defun custom/org-inbox-capture ()
  "Capture a task in agenda mode."
  (interactive)
  (org-capture nil "i"))

(map! :map org-agenda-mode-map
      "i" #'org-agenda-clock-in
      ;; "I" #'custom/clock-in-and-advance
      "r" #'custom/org-process-inbox
      "R" #'org-agenda-refile
      "c" #'custom/org-inbox-capture)

(require 'find-lisp)
(setq custom/org-agenda-directory
      (expand-file-name "OrgTodo/" org-directory))
(setq org-agenda-files
      (find-lisp-find-files custom/org-agenda-directory "\.org$"))

(setq org-capture-templates
      `(("i" "Inbox" entry  (file "OrgTodo/inbox.org")
         ,(concat "* TODO %?\n"
                  "/Entered on/ %U"))
        ;; ("s" "Slipbox" entry  (file "braindump/org/inbox.org")
        ;;  "* %?\n")
        ))

(setq org-enable-priority-commands t
      org-highest-priority ?A
      org-default-priority ?D
      org-lowest-priority ?D)

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "HOLD(h)" "|" "DONE(d)" "|" "Cancelled(c)")))

(setq org-tag-alist '(("@errand" . ?e)
                      ("@office" . ?o)
                      ("@school" . ?s)
                      ("@home" . ?h)))

(setq org-fast-tag-selection-single-key nil)
(setq org-refile-use-outline-path 'file
      org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)

(use-package! org-agenda
  :init
  (setq org-agenda-start-with-log-mode t)
  :defer t
  :config
  (setq org-columns-default-format "%40ITEM(Task) %TODO %3PRIORITY(Priority) %Effort(EE){:} %CLOCKSUM(Time Spent) %SCHEDULED(Scheduled) %DEADLINE(Deadline)")
  (setq org-agenda-custom-commands
        `(
          (" " "today and this week's agenda"
           ((alltodo ""
                     ((org-agenda-overriding-header "Inbox")
                      (org-agenda-files `(,(expand-file-name "OrgTodo/inbox.org" org-directory)))))
            (agenda ""
                    ((org-agenda-start-on-weekday nil)
                     (org-agenda-start-day "0d")
                     (org-agenda-span 'day)
                     (org-deadline-warning-days 7)))
            (agenda ""
                    ((org-agenda-span 'week)
                     (org-deadline-warning-days 14)))
            (todo "NEXT"
                  ((org-agenda-overriding-header "In Progress")
                   (org-agenda-files `(,(expand-file-name "OrgTodo/projects.org" org-directory)) )
                   ))
            (todo "TODO"
                  ((org-agenda-overriding-header "Active Projects")
                   (org-agenda-files `(,(expand-file-name "OrgTodo/projects.org" org-directory)))
                   ;; (org-agenda-skip-function #'custom/skip-projects)
                   ))))
          ("n" "next week's agenda"
           ((alltodo ""
                     ((org-agenda-overriding-header "Inbox")
                      (org-agenda-files `(,(expand-file-name "OrgTodo/inbox.org" org-directory)))))
            (agenda ""
                    ((org-agenda-start-day "Sat")
                     (org-agenda-span 'week)
                     (org-deadline-warning-days 365)))
            (todo "NEXT"
                  ((org-agenda-overriding-header "In Progress")
                   (org-agenda-files `(,(expand-file-name "OrgTodo/projects.org" org-directory)) )
                   ))
            (todo "TODO"
                  ((org-agenda-overriding-header "Active Projects")
                   (org-agenda-files `(,(expand-file-name "OrgTodo/projects.org" org-directory)))
                   ;; (org-agenda-skip-function #'custom/skip-projects)
                   ))))
          )
        ))

(setq org-agenda-prefix-format '((agenda . " %i %-20:c%?-12t%-6e% s")
                                 (todo . " %i %-20:c %-6e")
                                 (tags . " %i %-12:c")
                                 (search . " %i %-12:c")))

(use-package! org-journal
  :init
  (setq org-journal-dir "~/Local_Documents/Org/OrgJournal/")
  :config
  (map! :map calendar-mode-map
        "<normal-state> d m" #'org-journal-mark-entries
        "<normal-state> d r" #'org-journal-read-entry
        "<normal-state> d d" #'org-journal-display-entry
        "<normal-state> d ]" #'org-journal-next-entry
        "<normal-state> d [" #'org-journal-previous-entry
        "<normal-state> d n" #'org-journal-new-date-entry
        "<normal-state> d s f" #'org-journal-search-forever
        "<normal-state> d s F" #'org-journal-search-future
        "<normal-state> d s w" #'org-journal-search-calendar-week
        "<normal-state> d s m" #'org-journal-search-calendar-month
        "<normal-state> d s y" #'org-journal-search-calendar-year))

;; ~~ END of org stuff ~~

;; spices up latex code blocks
(use-package! engrave-faces-latex
  :after ox-latex
  :config
  (add-to-list 'org-latex-engraved-options '("linenos" "true"))
  ;; (setq org-latex-engraved-theme "t") REVIEW: doesn't work atm
  )

;; orderless
(use-package! orderless
  :defer t
  :config
  (setq orderless-component-separator #'orderless-escapable-split-on-space)
  )

;; latex preview pane
(require 'latex-preview-pane)
(latex-preview-pane-enable)

;; lsp stuff
(use-package! cpp-mode
  :defer t
  :config
  )

                                        ; lsp mode stuff
(after! lsp-mode
  (setq lsp-inlay-hint-enable t)
  (set-face-attribute 'lsp-inlay-hint-face nil :slant 'italic)
  ;; (custom-set-faces lsp-inlay-hint-face
  ;;                   :height 0.8)
  )

;; elcord for discord rich presesce
;; (require 'elcord)
;; (elcord-mode)

;; hydra for windows stuff
(defhydra doom-window-resize-hydra (:hint nil)
  "
             _k_ increase height
_h_ decrease width    _l_ increase width
             _j_ decrease height
"
  ("h" evil-window-decrease-width)
  ("j" evil-window-decrease-height)
  ("k" evil-window-increase-height)
  ("l" evil-window-increase-width)

  ("q" nil))

;; misc keybindings
(map! :leader
      (:prefix ("t")
       :desc "ef-themes-toggle" "t" #'ef-themes-toggle
       ))

;; frame keybindings
(map! :leader
      (:prefix ("e" . "frame")
       :desc "clone frames" "c" #'clone-frame
       :desc "switch frames" "<tab>" #'other-frame
       ))

(map! :leader
      (:prefix ("w")
       :desc "Hydra resize" :n "a" #'doom-window-resize-hydra/body))

(use-package! doom-modeline
  :defer t
  :config
  (display-time-mode 1)
  ;; (setq doom-modeline-time-icon nil)
  (setq doom-modeline-height 37)
  )

(map! :leader
      (:desc "find other file" "<backtab>" #'ff-find-other-file))

;; obsidian stuff
(use-package! obsidian
  :ensure t
  :demand t
  :config
  (obsidian-specify-path "~/Local_Documents/Obsidian-Main")
  (global-obsidian-mode t)
  ;; :custom
  ;; ;; This directory will be used for `obsidian-capture' if set.
  ;; (obsidian-inbox-directory "Inbox")
  :bind (:map obsidian-mode-map
              ;; Replace C-c C-o with Obsidian.el's implementation. It's ok to use another key binding.
              ("C-c C-o" . obsidian-follow-link-at-point)
              ;; Jump to backlinks
              ("C-c C-b" . obsidian-backlink-jump)
              ;; If you prefer you can use `obsidian-insert-link'
              ("C-c C-l" . obsidian-insert-wikilink)))
