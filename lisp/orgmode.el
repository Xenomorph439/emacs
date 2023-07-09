;;; orgmode.el --- Org mode configuration
;;; Commentary:
;;; Code:
(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'org-tempo)

(use-package rainbow-mode
  :ensure t
  :hook org-mode prog-mode)

(provide 'orgmode)
;;; orgmode.el endds here
