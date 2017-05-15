;; Package initialization
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;
;; Regular settings
;;

;; disable cursor blinking
(blink-cursor-mode 0)

;; remove annoying bell sound
(setq visible-bell 1)

;; indentation
(setq standard-indent 4)

;; line by line scrolling
(setq scroll-step 1)

;; only spaces indentation
(setq-default indent-tabs-mode nil)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; Enable backup files.
(setq-default fill-column 72)

;; automatically wrap lines
(setq auto-fill-mode 1)

;; text mode is default for new buffers
(setq default-major-mode 'text)

;; GUI Options
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(fringe-mode 0)

;; PDF viewing options
(setq doc-view-continuous t)

;; temp/backup files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq backup-directory-alist `(("." . "~/.saves")))

(set-face-attribute 'region nil :background "#666") ;; set highlight colour

(setq tab-always-indent 'complete)

;; Correct path needed for pdflatex
(exec-path-from-shell-initialize)

(require 'diminish)

;;
;; PLUGIN OPTIONS
;;

(use-package evil
  :init (evil-mode +1))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook
          (lambda ()
              (org-bullets-mode t))))

(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40))

(use-package helm-projectile
  :commands (helm-projectile helm-projectile-switch-project)
  :ensure t)

(use-package projectile
  :ensure t
  :defer 1
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package ido
  :ensure t
  :config
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10
        ido-default-file-method 'selected-window
        ido-auto-merge-work-directories-length -1)
  (ido-mode +1))

(use-package ido-ubiquitous
  :ensure t
  :config
  (ido-ubiquitous-mode +1))

(use-package flx-ido
  :ensure t
  :config
  (flx-ido-mode +1)
  ;; disable ido faces to see flx highlights
  (setq ido-use-faces nil))

(use-package smex
  :ensure t
  :bind ("M-x" . smex))

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox t))

(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0.2)
  (setq company-selection-wrap-around t)
  (define-key company-active-map (kbd "ESC") 'company-abort)
  (define-key company-active-map [tab] 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package company-go
  :ensure t
  :init
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-go)))

(use-package flycheck
  :ensure t
  :commands flycheck-mode)

;; For some reason, GOPATH is not set in Emacs.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "GOPATH")

(use-package go-mode
  :ensure t
  :init
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save))
  :config
  (add-hook 'go-mode-hook 'electric-pair-mode))

(use-package ag
  :ensure t
  :commands (ag ag-project)
  :config
  (setq ag-highlight-search t)
  (setq ag-reuse-buffers t)
  (setq ag-reuse-window t))

;;
;; GLOBAL KEY BINDINGS
;;

(defun end-of-line-and-indented-new-line ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

;; Equivalent of 'o' in Vim
(global-set-key (kbd "M-0") 'end-of-line-and-indented-new-line)

(global-set-key [(control h)] 'delete-backward-char)


(global-set-key (kbd "M-9") 'kill-whole-line)

(global-set-key (kbd "M-p") 'ace-window)

(global-set-key (kbd "C-x g") 'magit-status)

;; Font size (GUI only)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" default)))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(package-selected-packages
   (quote
    (haskell-mode zenburn-theme use-package spacemacs-theme solarized-theme smex powerline org-bullets monokai-theme molokai-theme material-theme magit latex-preview-pane ido-ubiquitous helm-projectile helm-ag gruvbox-theme flx-ido exec-path-from-shell evil dracula-theme doom-themes cyberpunk-theme company-go base16-theme auto-complete arjen-grey-theme ample-theme ag ace-window)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
