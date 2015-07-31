(customac-ensure-package 'undo-tree)
(customac-ensure-package 'evil)
(customac-ensure-package 'evil-leader)
(customac-ensure-package 'evil-snipe)
(customac-ensure-package 'evil-smartparens)

;; not really sure why, but we actually have to load undo-tree
;; or I don't seem to be able to require it...
(load "undo-tree.el")

;; activate evil mode
(require 'evil)
(evil-mode 1)

;; disable evil's space and enter bindings
(define-key evil-motion-state-map
  (kbd "RET") nil)
(define-key evil-motion-state-map
  " " nil)

;; evil-snipe, which makes s a two-character f
(require 'evil-snipe)
(evil-snipe-mode 1)
(evil-snipe-override-mode 1)

;; evil-leader, allowing a per-mode leader key
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

;; some global leader key combos
(evil-leader/set-key
  "e" 'find-file
  "b" 'ido-switch-buffer
  "k" 'kill-buffer)

;; smart-parens evil-mode
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

(provide 'customac-evil)
