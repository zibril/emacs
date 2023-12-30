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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

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


(require 'open-junk-file)
(global-set-key (kbd "C-x C-z") 'open-junk-file)

(require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)

(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(setq eldoc-idle-delay 0.2)
(setq eldoc-minor-mode-string "")
(show-paren-mode 1)
(global-set-key "\C-m" 'newline-and-indent)
(find-function-setup-keys)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "DaeHyeon Kim"
      user-mail-address "zibril@gmail.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)
(use-package doom-themes
    :custom
    (doom-themes-enable-italic t)
    (doom-themes-enable-bold t)
    :custom-face
    (doom-modeline-bar ((t (:background "#6272a4"))))
    :config
    (load-theme 'doom-dracula t)
    (doom-themes-neotree-config)
    (doom-themes-org-config))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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
;;
;;


(setq doom-font (font-spec :family "Monaco" :size 24))

(setq splashfiles (directory-files "~/.config/doom/splashes/" nil "\.png$" t))
(setq fancy-splash-image
    (concat doom-private-dir "splashes/"
        (nth (random (length splashfiles)) splashfiles)))

;(let ((alternatives '("cute-demon.png"
;                        "doom-emacs-color.png"
;                        "doom-emacs-color2.png"
;                        "doom-emacs-slant-out-bw.png"
;                        "doom-emacs-slant-out-color.png"
;                        "doomguy.png"
;                        "emacs-e-logo.png"
;                        "emacs-gnu-logo.png"
;                        "emacs-logo-vim.png"
;                        "emacs-sink.png"
;                        "gnu-head.png"
;                        "I-am-doom.png"
;                        "lion-head.png"
;                        "M-x_butterfly.png"
;                        "nuvola_emacs.png"
;                        "trancendent-gnu.png")))

(use-package org-roam :ensure t)

;(setq fancy-splash-image
;        (concat doom-private-dir "splashes/"
;                (nth (random (length alternatives)) alternatives))))

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 4)

;; Whether to use hud instead of default bar. It's only respected in GUI.
(setq doom-modeline-hud nil)

;; The limit of the window width.
;; If `window-width' is smaller than the limit, some information won't be displayed.
(setq doom-modeline-window-width-limit fill-column)

;; How to detect the project root.
;; nil means to use `default-directory'.
;; The project management packages have some issues on detecting project root.
;; e.g. `projectile' doesn't handle symlink folders well, while `project' is unable
;; to hanle sub-projects.
;; You can specify one if you encounter the issue.
(setq doom-modeline-project-detection 'auto)

;; Determines the style used by `doom-modeline-buffer-file-name'.
;;
;; Given ~/Projects/FOSS/emacs/lisp/comint.el
;;   auto => emacs/lisp/comint.el (in a project) or comint.el
;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
;;   truncate-with-project => emacs/l/comint.el
;;   truncate-except-project => ~/P/F/emacs/l/comint.el
;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
;;   truncate-all => ~/P/F/e/l/comint.el
;;   truncate-nil => ~/Projects/FOSS/emacs/lisp/comint.el
;;   relative-from-project => emacs/lisp/comint.el
;;   relative-to-project => lisp/comint.el
;;   file-name => comint.el
;;   buffer-name => comint.el<2> (uniquify buffer name)
;;
;; If you are experiencing the laggy issue, especially while editing remote files
;; with tramp, please try `file-name' style.
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
(setq doom-modeline-buffer-file-name-style 'auto)

;; Whether display icons in the mode-line.
;; While using the server mode in GUI, should set the value explicitly.
(setq doom-modeline-icon (display-graphic-p))

;; Whether display the icon for `major-mode'. It respects `doom-modeline-icon'.
;(setq doom-modeline-major-mode-icon t)

;; Whether display the colorful icon for `major-mode'.
;; It respects `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display the modification icon for the buffer.
;; It respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
(setq doom-modeline-unicode-fallback nil)

;; Whether display the minor modes in the mode-line.
(setq doom-modeline-minor-modes nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count nil)

;; Major modes in which to display word count continuously.
;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; remove the modes from `doom-modeline-continuous-word-count-modes'.
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

;; Whether display the buffer encoding.
(setq doom-modeline-buffer-encoding t)

;; Whether display the indentation information.
(setq doom-modeline-indent-info nil)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-checker-simple-format t)

;; The maximum number displayed for notifications.
(setq doom-modeline-number-limit 99)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 12)

;; Whether display the workspace name. Non-nil to display in the mode-line.
(setq doom-modeline-workspace-name t)

;; Whether display the perspective name. Non-nil to display in the mode-line.
(setq doom-modeline-persp-name t)

;; If non nil the default perspective name is displayed in the mode-line.
(setq doom-modeline-display-default-persp-name nil)

;; If non nil the perspective name is displayed alongside a folder icon.
(setq doom-modeline-persp-icon t)

;; Whether display the `lsp' state. Non-nil to display in the mode-line.
(setq doom-modeline-lsp t)

;; Whether display the GitHub notifications. It requires `ghub' package.
(setq doom-modeline-github nil)

;; The interval of checking GitHub.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display the modal state icon.
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal-icon t)

;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
;(setq doom-modeline-mu4e nil)
;; also enable the start of mu4e-alert
;(mu4e-alert-enable-mode-line-display)

;; Whether display the gnus notifications.
(setq doom-modeline-gnus t)

;; Wheter gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
(setq doom-modeline-gnus-timer 2)

;; Wheter groups should be excludede when gnus automatically being updated.
(setq doom-modeline-gnus-excluded-groups '("dummy.group"))

;; Whether display the IRC notifications. It requires `circe' or `erc' package.
(setq doom-modeline-irc t)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; Whether display the environment version.
(setq doom-modeline-env-version t)
;; Or for individual languages
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-ruby t)
(setq doom-modeline-env-enable-perl t)
(setq doom-modeline-env-enable-go t)
(setq doom-modeline-env-enable-elixir t)
(setq doom-modeline-env-enable-rust t)

;; Change the executables to use for the language version string
(setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
(setq doom-modeline-env-ruby-executable "ruby")
(setq doom-modeline-env-perl-executable "perl")
(setq doom-modeline-env-go-executable "go")
(setq doom-modeline-env-elixir-executable "iex")
(setq doom-modeline-env-rust-executable "rustc")

;; What to display as the version while a new one is being loaded
(setq doom-modeline-env-load-string "...")

;; Hooks that run before/after the modeline version string is updated
(setq doom-modeline-before-update-env-hook nil)
(setq doom-modeline-after-update-env-hook nil)

; (when window-system
  ; (setq initial-frame-alist
        ; '((top . 0)
          ; (left . 0)
          ; (width . 180)
          ; (height . 68))))

;; Use F11 to switch between windowed and full-screen modes
(global-set-key [f11] 'toggle-frame-fullscreen)

;; Switch to full-screen mode during startup
;;(toggle-frame-fullscreen)

(add-to-list 'exec-path "~/.local/bin")
(add-to-list 'exec-path "~/.cargo/bin")
(add-to-list 'exec-path "~/bin")

; line number
(setq display-line-numbers-type 'relative)

;scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 3) ((control)))
      scroll-conservatively 3
      scroll-margin 3
      maximum-scroll-margin 0.2)

(setq-hook! 'term-mode-hook scroll-margin 0)

; Theming
(setq doom-modeline-height 25
      nav-flash-delay 0.25
      which-key-idle-delay 0.4
      ;; The gray comments are hard to read in my terminal, although I rarely
      ;; use Emacs in a terminal
      doom-one-brighter-comments (not (or (display-graphic-p) (daemonp))))

(setq-default show-trailing-whitespace nil)

(add-hook! (prog-mode text-mode conf-mode)
  (defun doom-enable-show-trailing-whitespace-h ()
    (setq show-trailing-whitespace t)))

; flycheck
(after! flycheck
  (setq flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled)))

(map!
 (:after flycheck
   (:map flycheck-error-list-mode-map
     :m [M-return] #'flycheck-error-list-explain-erro)))

; hl-todo
(add-hook 'text-mode-hook #'hl-todo-mode)

; Hippie
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-line
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(after! yasnippet
  (add-to-list 'hippie-expand-try-functions-list 'yas-hippie-try-expand))

(map! [remap dabbrev-expand] #'hippie-expand)

; lsp
(setq +lsp-company-backends 'company-capf)
;; HACK: lsp-mode's flycheck integration got moved to `lsp-diagnostics', but
;;       the`actual checker is only created after lsp-mode is enabled. Because
;;       of this we can't use `flycheck-add-next-checker'.
;; FIXME: There's now a native way to do this
(defadvice! +robbert--lsp-flycheck-chain-a (&rest _)
  "Chain other checkers after lsp-mode's flycheck checker. Needed
  because the checker is created on demand."
  :after #'lsp-diagnostics-flycheck-enable
  ;; TODO: CHeck whether hls's hlint plugin works now
  ;; (flycheck-add-next-checker 'lsp '(warning . haskell-hlint))
  (flycheck-add-next-checker 'lsp '(warning . python-flake8))
  (flycheck-add-next-checker 'lsp '(warning . tex-chktex))
  (flycheck-add-next-checker 'lsp '(warning . sh-shellcheck)))

(after! lsp-mode
  ;; Don't highlight symbols automatically, I'll use `gh' to do this manually
  (setq lsp-enable-symbol-highlighting nil)

  ;; Ignore build artifact directories used in Meson projects
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]build$")
  ;; And output generated by Doxygen
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]html$")
  ;; Used by Cabal, I sometimes use multiple dist-newstyle directories to
  ;; quickly switch between configurations
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]dist-newstyle[^/\\\\]*$")

  ;; Doom disables a few LSP features by default, but some of them can be quite
  ;; useful especially in C++
  (setq lsp-enable-text-document-color t
        lsp-enable-semantic-highlighting t
        lsp-enable-file-watchers t
        ;; Not sure if these two are actually used and, if they are, what they
        ;; are used for. Might disable them later
        lsp-enable-indentation t
        lsp-enable-on-type-formatting t
        lsp-enable-folding t))

(after! lsp-ui
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-update-mode t)
  (setq lsp-ui-sideline-delay 0.1)
  ;; These tend to get in the way when I'm just looking at stuff. K also opens a
  ;; documentation popup.
  (setq lsp-ui-doc-enable nil))

(map!
 (:after lsp-mode
  (:map lsp-mode-map
   :nvi [M-return] #'lsp-execute-code-action
   :nv  "gh"       #'lsp-document-highlight)

  ;; TODO: Make sure these are not overwriting anything else
  (:map evilem-map
   "l"             #'lsp-avy-lens)
  (:map lsp-command-map
   "l"             #'lsp-lens-mode))
 (:after lsp-ui
  (:map lsp-ui-peek-mode-map
   [tab]           #'lsp-ui-peek--toggle-file
   "j"             #'lsp-ui-peek--select-next
   "C-j"           #'lsp-ui-peek--select-next
   "k"             #'lsp-ui-peek--select-prev
   "C-k"           #'lsp-ui-peek--select-prev
   "l"             #'lsp-ui-peek--goto-xref
   "C-l"           #'lsp-ui-peek--goto-xref
   "J"             #'lsp-ui-peek--select-next-file
   "K"             #'lsp-ui-peek--select-prev-file)))

(after! ccls
  (remove-hook 'lsp-lens-mode-hook #'ccls-code-lens-mode))

(after! flycheck
  (dolist (checker '(c/c++-clang
                     ;; NOTE: Without disabling this, clangd will
                     ;;       crash all the time when completing
                     ;;       things from the `std` namespace
                     c/c++-gcc
                     haskell-ghc
                     haskell-stack-ghc
                     python-mypy
                     python-pylint))
    (add-to-list 'flycheck-disabled-checkers checker)))

; Mgit
(after! ediff
  ;; Ancestor is already shown in buffer C
  (setq ediff-show-ancestor nil))

(after! magit
  (remove-hook 'git-commit-setup-hook #'+vc-start-in-insert-state-maybe-h)
  (magit-delta-mode +1))


(after! magit-todos
  ;; Ignore concatenated/minified files when searching for todos
  (setq magit-todos-rg-extra-args '("-M 512")))

(map!
 (:after diff-mode
  (:map diff-mode-map
   :nm "{" #'diff-hunk-prev
   :nm "}" #'diff-hunk-next)))

(use-package! magit-delta
  :after magit
  :config
  (setq magit-delta-default-dark-theme "Nord"
        magit-delta-default-light-theme "OneHalfLight")
  (magit-delta-mode))

; CC
(setq +cc-default-header-file-mode 'c++-mode)

(setq-hook! '(c-mode-hook c++-mode-hook) c-basic-offset 4)

;; Match the Chromium clang-format style
(add-hook! '(c-mode-hook c++-mode-hook) :append
  (add-to-list 'c-offsets-alist '(innamespace . 0))
  (add-to-list 'c-offsets-alist '(access-label . /))
  (add-to-list 'c-offsets-alist '(inclass . +)))

(setq lsp-clients-clangd-args '("-j=6"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))

;Org
(setq org-directory (expand-file-name "~/Documenten/notes/"))

(after! org
  (setq org-export-with-smart-quotes t
        org-imenu-depth 3
        org-highlight-latex-and-related '(latex script entities))

  (set-face-attribute
   'org-todo nil :foreground (doom-darken (face-foreground 'org-todo) 0.2))

  ;; Org mode should use komascript for LaTeX exports and code fragments should be colored
  (with-eval-after-load 'ox-latex
    (add-to-list 'org-latex-classes
                 '("koma-article"
                   "\\documentclass[parskip=half]{scrartcl}
                    [DEFAULT-PACKAGES] [PACKAGES]
                    \\setminted{frame=leftline,framesep=1em,linenos,numbersep=1em,style=friendly}
                    \\setminted[python]{python3}
                    [EXTRA]"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (add-to-list 'org-latex-packages-alist '("english" "babel"))
    (add-to-list 'org-latex-packages-alist '("newfloat" "minted"))
    (setq org-latex-default-class "koma-article"
          org-format-latex-options
          (plist-put org-format-latex-options
                     :scale (* 1.25 +scaling-ratio))
          org-latex-caption-above nil
          org-latex-listings 'minted
          ;; latexmk tends to play along nicer than pdflatex
          org-latex-pdf-process '("latexmk -f -pdf %f"))))

(after! evil-org
  (setq evil-org-use-additional-insert t)
  (add-to-list 'evil-org-key-theme 'additional)
  (evil-org--populate-additional-bindings)

  (map! :map evil-org-mode-map
        ;; Doom changes c-return to always create new list items when inside of a
        ;; list, but M-return already does this so I prefer the old behaviour
        [C-return] (evil-org-define-eol-command org-insert-heading-respect-content)
        :ni [M-return] #'+robbert/evil-org-always-open-below))

;Python
(setq-hook! 'python-mode-hook fill-column 79)

(add-to-list 'auto-mode-alist '("Pipfile$" . conf-toml-mode))
(add-to-list 'auto-mode-alist '("Pipfile\\.lock$" . json-mode))

(setq lsp-python-ms-nupkg-channel "daily")
(after! lsp-mode
  ;; FIXME: This doesn't work, and lsp-pyright will probably add something
  ;;        similar sooner pr ;ater
  (defvar +robbert/lsp-pyright-report-missing-type-stubs t)
  (lsp-register-custom-settings
   `(("pyright.reportMissingTypeStubs" +robbert/lsp-pyright-report-missing-type-stubs t))))

;; mypy is automaitcally run after flake8, this doesn't work with virtualenvs
;; without installing mypy to that virtualenv so I'll just disable it by
;; default
(setq-hook! 'python-mode-hook flycheck-disabled-checkers '(python-mypy python-pylint))
(add-hook 'python-mode-hook #'rainbow-delimiters-mode)
(after! python
  ;; Set this to `django' to force docstring to always be on multiple lines
  (setq python-fill-docstring-style 'onetwo)

  ;; Electric indent on `:' only really works for `else' clauses and makes
  ;; defining functions a lot harder than it should be
  (set-electric! 'python-mode ':words '("else:"))
  ;; FIXME: The above doesn't clear the list of electric indent characters
  ;;        anymore
  (setq-hook! 'python-mode-hook electric-indent-chars '())
  ;; Disable the default template, as we don't need a hashbang in every Python
  ;; file
  (set-file-template! 'python-mode :ignore t)

  (map! :map python-mode-map
        (:localleader
          (:prefix ("r" . "REPL send")
            :desc "Buffer"   "b" #'python-shell-send-buffer
            :desc "Function" "f" #'python-shell-send-defun
            :desc "Region"   "r" #'python-shell-send-region))))

; Rust
(setq-hook! 'rustic-mode-hook fill-column 100)
(add-hook 'rustic-mode-hook #'rainbow-delimiters-mode)

(setq rustic-indent-offset 2)
(setq rustic-lsp-server 'rust-analyzer
      lsp-rust-clippy-preference "on"
      lsp-rust-analyzer-cargo-watch-command "clippy"
      lsp-rust-analyzer-import-granularity "module"
      lsp-rust-analyzer-import-merge-behaviour "last"
      lsp-rust-analyzer-proc-macro-enable t
      lsp-rust-analyzer-experimental-proc-attr-macros t)

; dap-mode
;; Enabling only some features
(require 'dap-cpptools)
(require 'dap-lldb)
(require 'dap-gdb-lldb)
(setq dap-auto-configure-features '(sessions locals controls tooltip))

(dap-mode 1)

;; The modes below are optional

(dap-ui-mode 1)
;; enables mouse hover support
(dap-tooltip-mode 1)
;; use tooltips for mouse hover
;; if it is not enabled `dap-mode' will use the minibuffer.
(tooltip-mode 1)
;; displays floating panel with debug buttons
;; requies emacs 26+
(dap-ui-controls-mode 1)



(map! :map dap-mode-map
      :leader
      :prefix ("d" . "dap")
      ;; basics
      :desc "dap next"          "n" #'dap-next
      :desc "dap step in"       "i" #'dap-step-in
      :desc "dap step out"      "o" #'dap-step-out
      :desc "dap continue"      "c" #'dap-continue
      :desc "dap hydra"         "h" #'dap-hydra
      :desc "dap debug restart" "r" #'dap-debug-restart
      :desc "dap debug"         "s" #'dap-debug

      ;; debug
      :prefix ("dd" . "Debug")
      :desc "dap debug recent"  "r" #'dap-debug-recent
      :desc "dap debug last"    "l" #'dap-debug-last

      ;; eval
      :prefix ("de" . "Eval")
      :desc "eval"                "e" #'dap-eval
      :desc "eval region"         "r" #'dap-eval-region
      :desc "eval thing at point" "s" #'dap-eval-thing-at-point
      :desc "add expression"      "a" #'dap-ui-expressions-add
      :desc "remove expression"   "d" #'dap-ui-expressions-remove

      :prefix ("db" . "Breakpoint")
      :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
      :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
      :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
      :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)

(dap-register-debug-template "Rust::GDB Run Configuration"
                             (list :type "gdb"
                                   :request "launch"
                                   :name "GDB::Run"
                           :gdbpath "rust-gdb"
                                   :target nil
                                   :cwd nil))
								   
								   
;; Custom functions/hooks for persisting/loading frame geometry upon save/load
(defun save-frameg ()
	"Gets the current frame's geometry and saves to ~/.emacs.frameg."
	(let ((frameg-font (frame-parameter (selected-frame) 'font))
	(frameg-left (frame-parameter (selected-frame) 'left))
	(frameg-top (frame-parameter (selected-frame) 'top))
	(frameg-width (frame-parameter (selected-frame) 'width))
	(frameg-height (frame-parameter (selected-frame) 'height))
	(frameg-file (expand-file-name "~/.emacs.frameg")))
	(with-temp-buffer
	;; Turn off backup for this file
	(make-local-variable 'make-backup-files)
	(setq make-backup-files nil)
	(insert
	";;; This file stores the previous emacs frame's geometry.\n"
	";;; Last generated " (current-time-string) ".\n"
	"(setq initial-frame-alist\n"
	;; " '((font . \"" frameg-font "\")\n"
	" '("
	(format " (top . %d)\n" (max frameg-top 0))
	(format " (left . %d)\n" (max frameg-left 0))
	(format " (width . %d)\n" (max frameg-width 0))
	(format " (height . %d)))\n" (max frameg-height 0)))
	(when (file-writable-p frameg-file)
	(write-file frameg-file)))))

(defun load-frameg ()
	"Loads ~/.emacs.frameg which should load the previous frame's geometry."
	(let ((frameg-file (expand-file-name "~/.emacs.frameg")))
	(when (file-readable-p frameg-file)
	(load-file frameg-file))))

;; Special work to do ONLY when there is a window system being used
(if window-system
	(progn
	(add-hook 'after-init-hook 'load-frameg)
	(add-hook 'kill-emacs-hook 'save-frameg)))