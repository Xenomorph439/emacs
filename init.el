;;; init.el --- emacs configuration
;;; Commentary:
;;; Code:
(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(global-display-line-numbers-mode 1)

;; Full screen
(setq frame-resize-pixelwise t)

;; Disable backup
(setq make-backup-files nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(require 'theme)
(require 'orgmode)
(require 'completion)
(require 'ocaml)

(add-to-list 'default-frame-alist
			 '(font . "Comic Code-13"))

(use-package format-all
  :ensure t
  :init (format-all-mode))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))


(setq-default
 indent-tabs-mode nil
 tab-width 2
 tab-stop-list (quote (2 4))
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(catppuccin))
 '(custom-safe-themes
   '("61526419f6ffee91cae16a75bfc0f39f7e9621280cc405edeae15699091e7c73" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012" "b6dfff5118856529d9a410023eaa6afb825fdbf5f1bc72cda3f6f187a132de16" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" default))
 '(go-ts-mode-indent-offset 2)
 '(package-selected-packages
   '(ace-window all-the-icons doom-themes catppuccin-theme gruvbox-theme zenburn-theme lsp-ui vscode-dark-plus-theme ivy use-package))
 '(tab-stop-list '(4))
 '(treesit-font-lock-level 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
