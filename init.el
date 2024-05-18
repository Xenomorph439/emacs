;;; init.el --- emacs configuration base
;;; Commentary:
;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(global-display-line-numbers-mode 1)

;; Disable backup
(setq make-backup-files nil)

;; Setup packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; intall use package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

;; Autoformatting
(use-package format-all
  :ensure t
  :init (format-all-mode))

;; Icons
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; Ace Window
(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))

;; Load Color Scheme
(use-package catppuccin-theme
  :ensure t
  :config (setq catppuccin-flavor 'mocha)
  :init (load-theme 'catppuccin :no-confirm))

;; set default indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-stop-list '(4 8))
(setq-default standard-indent 4)

;; Go Major Mode
(use-package go-mode
  :ensure t
  :custom
  (go-ts-mode-indent-offset 4))
;;; Completions

;; Ivy (Counsel) -> emacs commands remade for ivy
(use-package counsel
  :ensure t
  :after ivy
  :config (counsel-mode))

;; Ivy - Vertical Completion Backend
(use-package ivy
  :ensure t
  :bind
  (("C-c C-r" . ivy-resume)
   ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (setq ivy-use-virtual-buffers t)
  (steq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :ensure t
  :after ivy
  :ensure t
  :init (ivy-rich-mode 1) ;; this gets us descriptions in M-x.
 )

;; Auto Complete Parenthesis
(use-package smartparens
  :ensure t
  :diminish smartparens-mode ;; Do not show in modeline
  :init
  (require 'smartparens-config)
  :config
  (smartparens-global-mode t) ;; These options can be t or nil.
  (show-smartparens-global-mode t)
  (setq sp-show-pair-from-inside t))

;; Completions
(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0)
  (global-company-mode))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l" )
  :hook
  (c-ts-mode . lsp)
  (c++-ts-mode .lsp)
  (python-ts-mode . lsp)
  (zig-mode . lsp)
  (go-ts-mode . lsp)
  :commands
  lsp)

;; treesitter
(require 'treesit)
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
	(cpp "https://github.com/tree-sitter/tree-sitter-cpp")
	(cmake "https://github.com/uyha/tree-sitter-cmake")
	(css "https://github.com/tree-sitter/tree-sitter-css")
	(elisp "https://github.com/Wilfred/tree-sitter-elisp")
	(go "https://github.com/tree-sitter/tree-sitter-go")
	(html "https://github.com/tree-sitter/tree-sitter-html")
	(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
    (c "https://github.com/tree-sitter/tree-sitter-c")
    (json "https://github.com/tree-sitter/tree-sitter-json")
	(make "https://github.com/alemuller/tree-sitter-make")
	(markdown "https://github.com/ikatyang/tree-sitter-markdown")
	(python "https://github.com/tree-sitter/tree-sitter-python")
	(toml "https://github.com/tree-sitter/tree-sitter-toml")
	(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(yaml "https://github.com/ikatyang/tree-sitter-yaml")
    (gomod "https://github.com/camdencheek/tree-sitter-go-mod")))

(setq major-mode-remap-alist
      '((yaml . yaml-ts-mode)
	(bash . bash-ts-mode)
	(c++-mode . c++-ts-mode)
	(c-mode . c-ts-mode)
	(python-mode . python-ts-mode)
	(css-mode . css-ts-mode)
	(json-mode . json-ts-mode)
	(typescript-mode . typescript-ts-mode)))

(add-hook 'go-mode-hook #'go-ts-mode)

;;; Zig language mode
(use-package zig-mode :ensure t)

(use-package flycheck :ensure t :init (global-flycheck-mode))

(use-package lsp-ui :ensure t :commands lsp-ui-mode)

;; The greatest git GUI ever

;; set font
(add-to-list 'default-frame-alist
              '(font . "FantasqueSansM Nerd Font-13"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ace-window all-the-icons-ivy-rich catppuccin-theme company counsel
                flycheck format-all go-mode lsp-ui smartparens
                zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
