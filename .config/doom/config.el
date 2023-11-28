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
(setq org-directory "~/org/")


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
        (comment "#786a59") ; default is #cf9f7
        ))

(setq ef-themes-to-toggle '(ef-bio ef-elea-light))

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
  (setq org-roam-directory (file-truename "~/Local_Documents/Org-CS350"))
  )

(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-todo nil)
  (setq org-modern-checkbox nil)
  (setq org-modern-todo-faces nil)
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

; agenda stuff
(use-package! org-agenda
  :defer t
  :config
  ;; copied from prot
  ;; https://protesilaos.com/codelog/2021-12-09-emacs-org-block-agenda/
  (setq org-agenda-custom-commands
        `(("A" "Daily agenda and top priority tasks"
           ((tags-todo "*"
                       ((org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
                        (org-agenda-skip-function
                         `(org-agenda-skip-entry-if
                           'notregexp ,(format "\\[#%s\\]" (char-to-string org-priority-highest))))
                        (org-agenda-block-separator nil)
                        (org-agenda-overriding-header "Important tasks without a date\n")))
            (agenda "" ((org-agenda-overriding-header "Overdue")
                        (org-agenda-time-grid nil)
                        (org-agenda-start-on-weekday nil)
                        (org-agenda-show-all-dates nil)
                        (org-agenda-format-date "")  ;; Skip the date
                        (org-agenda-span 1)
                        (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                        (org-agenda-entry-types '(:deadline :scheduled))
                        (org-scheduled-past-days 999)
                        (org-deadline-past-days 999)
                        (org-deadline-warning-days 0)))
            (agenda "" ((org-agenda-overriding-header "\nToday's agenda\n")
                        (org-agenda-start-day "0d")
                        (org-agenda-span 1)
                        (org-deadline-warning-days 0)
                        (org-agenda-block-separator nil)
                        (org-scheduled-past-days 0)
                        ;; We don't need the `org-agenda-date-today'
                        ;; highlight because that only has a practical
                        ;; utility in multi-day views.
                        (org-agenda-day-face-function (lambda (date) 'org-agenda-date))
                        (org-agenda-format-date "%A %-e %B %Y")))
            (agenda "" ((org-agenda-overriding-header "\nNext seven days\n")
                        (org-agenda-start-on-weekday nil)
                        (org-agenda-start-day "+1d")
                        (org-agenda-span 7)
                        (org-deadline-warning-days 0)
                        (org-agenda-block-separator nil)
                                        ;(org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))  ;; skips if the TODO keyword marks a DONE state
                        ))
            (agenda "" ((org-agenda-overriding-header "\nUpcoming Deadlines/Schedules (+14d)\n")
                        (org-agenda-time-grid nil)
                        (org-agenda-start-on-weekday nil)
                        ;; We don't want to replicate the previous section's
                        ;; three days, so we start counting from the day after.
                        (org-agenda-start-day "+4d")
                        (org-agenda-span 14)
                        (org-agenda-show-all-dates nil)
                        (org-deadline-warning-days 0)
                        (org-agenda-block-separator nil)
                        (org-agenda-entry-types '(:deadline :scheduled))
                        (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done)))))))))

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
;; (setq flycheck-gcc-language-standard "c++20") ; did not work: still getting some irrellevant c++11 warnings
(use-package! cpp-mode
  :defer t
  :config
  (add-to-list 'lsp-clients-clangd-args "-std=c++14")
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
  ("j" evil-window-increase-height)
  ("k" evil-window-decrease-height)
  ("l" evil-window-increase-width)

  ("q" nil))

(map!
      (:prefix "w"
       :desc "Hydra resize" :n "SPC" #'doom-window-resize-hydra/body))

(use-package! doom-modeline
  :defer t
  :config
  (display-time-mode 1)
  ;; (setq doom-modeline-time-icon nil)
  (setq doom-modeline-height 37)
  )

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

