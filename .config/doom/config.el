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
(setq doom-font (font-spec :name "JetBrainsMono Nerd Font Mono" :size 15 :weight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-henna)

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

;; treemacs
(use-package! treemacs
  :defer t
  :config
  ;; alters file icons to be more vscode-esque (better 😼)
  ;; https://github.com/doomemacs/themes/wiki/Extension:-Treemacs
  (setq doom-themes-treemacs-theme "doom-colors")
  )

;; org mode stuff
(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq org-modern-todo nil)
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
  (setq org-src-fontify-natively t)
  (setq org-latex-src-block-backend 'engraved)
  ;; makes latex preview bigger
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  ;; lualatex preview
  (setq org-latex-pdf-process
        '("lualatex -shell-escape -interaction nonstopmode %f"
          "lualatex -shell-escape -interaction nonstopmode %f"))

  ;;; stolen from somewhere🤷
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

; lsp stuff - don't work
; (setq flycheck-gcc-language-standard "c++20") ; did not work: still getting some irrellevant c++11 warnings
