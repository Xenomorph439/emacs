;;; completion.el --- Completions for my emacs configuration
;;; Commentary:
;;; Code:

;; Ivy (counsel)
(use-package counsel
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
  :after ivy
  :ensure t
  :init (ivy-rich-mode 1) ;; this gets us descriptions in M-x.
  :custom
  (ivy-virtual-abbreviate 'full
   ivy-rich-switch-buffer-align-virtual-buffer t
   ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

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
	     (c-mode . lsp)
	     (c++-mode .lsp)
	     (python-mode . lsp)
	     (zig-mode . lsp)
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


(provide 'completion)
;;; completion.el ends here
