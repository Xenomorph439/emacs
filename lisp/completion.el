;;; completion.el --- Completions for my emacs configuration
;;; Commentary:
;;; Code:

;; Ivy (counsel)
(use-package counsel
  :ensure t
  :after ivy
  :config (counsel-mode))

(use-package ivy
  :bind
  ;; ivy-resume resumes the last Ivy-based completion.
  (("C-c C-r" . ivy-resume)
   ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
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

;;; Zig language mode
(use-package zig-mode :ensure t)

(use-package flycheck :ensure t :init (global-flycheck-mode))

;;; LSP setup
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

(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)

(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0)
  (global-company-mode))

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

(provide 'completion)
;;; completion.el ends here
