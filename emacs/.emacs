;; -*- lexical-binding: t; -*-

;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; Disable tool bar, menu bar, scroll bar.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; show-paren-mode allows one to see matching pairs of parentheses
;; and other characters. When point is on the opening character of
;; one of the paired characters, the other is highlighted. When the
;; point is after the closing character of one of the paired
;; characters, the other is highlighted.
(show-paren-mode 1)

;; By default, there’s a small delay before showing a matching
;; parenthesis. It can be deactivated with the following (which you have
;; to do before activating show-paren-mode in your .emacs):
(setq show-paren-delay 0)



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(recentf-mode winner-mode exec-path-from-shell cider yasnippet-snippets paredit orderless vertico smex snails yasnippet multiple-cursors sly all-the-icons markdown-mode web-mode use-package magit helm-dash dash-at-point)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package company
  :ensure t
  :bind
  ("M-TAB" . company-complete) ;; ALT-TAB
  (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :hook
  ((cider-repl-mode . company-mode)
   (cider-mode . company-mode))
  :config
  (setq company-idle-delay 0.3))


(use-package yasnippet
  :ensure t
  :bind
  ("C-c y s" . yas-insert-snippet)
  ("C-c y v" . yas-visit-snippet-file)
  :config
  (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
  (yas-global-mode 1))

(use-package magit
  :ensure t)

(use-package smex
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;; Enable vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure t
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; paredit

(use-package paredit
  :ensure t
  :config
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  :init
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook          #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode))

;; sly
(use-package sly
  :ensure t
  :config
  (setq inferior-lisp-program "/opt/homebrew/bin/sbcl"))

;; (use-package clojure-mode
;;   :ensure t
;;   :mode (("\\.clj\\'" . clojure-mode)
;;          ("\\.edn\\'" . clojure-mode))
;;   :init
;;   ; (add-hook 'clojure-mode-hook #'yas-minor-mode)         
;;   ; (add-hook 'clojure-mode-hook #'linum-mode)             
;;   ;; (add-hook 'clojure-mode-hook #'subword-mode)           
;;   ;; (add-hook 'clojure-mode-hook #'smartparens-mode)       
;;   ;; (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
;;   ;; (add-hook 'clojure-mode-hook #'eldoc-mode)             
;;   ;; (add-hook 'clojure-mode-hook #'idle-highlight-mode)
;;   )

(use-package cider
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package winner
  :ensure t
  :init
  (winner-mode 1))

(use-package recentf
  :ensure t
  :init
  (recentf-mode 1))
