;;; completion.el --- Completions for my emacs configuration
;;; Commentary:
;;; Code:


;; Helm configuration
(use-package helm
  :init
  (helm-mode 1)
  :bind
  (("M-x"     . helm-M-x) ;; Evaluate functions
   ("C-x C-f" . helm-find-files) ;; Open or create files
   ("C-x b"   . helm-mini) ;; Select buffers
   ("C-x C-r" . helm-recentf) ;; Select recently saved files
   ("C-c i"   . helm-imenu) ;; Select document heading
   ("M-y"     . helm-show-kill-ring) ;; Show the kill ring
   :map helm-map
   ("C-z" . helm-select-action)
   ("<tab>" . helm-execute-persistent-action)))

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


(use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)

(use-package company
	     :ensure t
	     :config
	     (setq company-minimum-prefix-length 1)
	     (setq company-idle-delay 0)
	     (global-company-mode))


(provide 'completion)
;;; completion.el ends here
