;;; orgmode.el --- Org mode configuration
;;; Commentary:
;;; Code:
(use-package org-appear
  :ensure t
  :hook (org-mode . org-appear-mode))

;; Nice bullets
(use-package org-superstar
  :ensure t
  :config
    (setq org-superstar-special-todo-items t)
    (add-hook 'org-mode-hook (lambda ()
                               (org-superstar-mode 1))))


(provide 'orgmode)
;;; orgmode.el ends here
