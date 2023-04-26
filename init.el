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

(add-to-list 'default-frame-alist
	     '(font . "UbuntuMono Nerd Font Mono-12"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(vscode-dark-plus-theme ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
