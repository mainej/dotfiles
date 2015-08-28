(customac-ensure-packages '(undo-tree
                            evil
                            evil-snipe))

;; not really sure why, but we actually have to load undo-tree
;; or I don't seem to be able to require it...
(load "undo-tree.el")

;; activate evil mode
(require 'evil)

(global-set-key (kbd "C-`") 'toggle-evil)

;; disable evil's space and enter bindings
(define-key evil-motion-state-map
  (kbd "RET") nil)
(define-key evil-motion-state-map
  " " nil)

;; evil-snipe, which makes s a two-character f
(require 'evil-snipe)
(evil-snipe-mode 1)

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

;;; toggles emacs mode slightly better in the following ways:
;;  when evil is turned *on*, smartparens-strict is *disabled*
;;  when evil is turned *off*, smartparens-strict mode is *enabled*
;;  furthermore, this is very careful to turn evil on and off *everywhere* if=
;;    at all possible
(defvar evil-state nil)

(defun toggle-evil ()
  (interactive)
  (if evil-state
      (cleanse-emacs)
    (corrupt-emacs))
  (set-powerline-color))

(defun corrupt-emacs ()
  (progn
    (setq evil-default-state 'normal)
    (smartparens-global-strict-mode -1)
    (evil-mode)
    (setq evil-state 1)))

(defun cleanse-emacs ()
  (progn
    (setq evil-default-state 'emacs)
    (smartparens-global-strict-mode 1)
    (evil-mode -1)
    (setq evil-state nil)
    (global-unset-key "\C-z")))

(defun set-powerline-color ()
  (let ((color (cond ((minibufferp) (face-foreground 'region))
                     ((evil-normal-state-p) (face-foreground 'rainbow-delimiters-depth-2-face))
                     ((evil-insert-state-p) (face-foreground 'rainbow-delimiters-depth-4-face))
                     ((evil-visual-state-p) (face-foreground 'rainbow-delimiters-depth-3-face)))))
    (set-face-foreground 'mode-line color)
    (set-face-foreground 'powerline-active1 color)
    (set-face-foreground 'powerline-active2 color)))

(add-hook 'post-command-hook
          'set-powerline-color)
(add-hook 'evil-mode-hook
          'set-powerline-color)

(provide 'customac-evil)
