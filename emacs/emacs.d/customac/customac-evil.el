(customac-ensure-package 'undo-tree)
(customac-ensure-package 'evil)
(customac-ensure-package 'evil-snipe)
(customac-ensure-package 'evil-smartparens)

;; not really sure why, but we actually have to load undo-tree
;; or I don't seem to be able to require it...
(load "undo-tree.el")

;; activate evil mode
(require 'evil)

;; disable evil's space and enter bindings
(define-key evil-motion-state-map
  (kbd "RET") nil)
(define-key evil-motion-state-map
  " " nil)

;; evil-snipe, which makes s a two-character f
(require 'evil-snipe)
(evil-snipe-mode 1)
(evil-snipe-override-mode 1)

;; bind space to C-x for non-chording joy
(define-key key-translation-map " "
  (lambda (_)
    (if (evil-normal-state-p) (kbd "C-x")
      " ")))

;; and C-c is just comma now
(define-key key-translation-map ","
  (lambda (_)
    (if (evil-normal-state-p) (kbd "C-c")
      ",")))

;; smart-parens evil-mode
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

(provide 'customac-evil)
