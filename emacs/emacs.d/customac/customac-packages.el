(defvar customac-package-list '(smartparens
                                magit
                                projectile
                                smex
                                ag
                                ace-jump-mode
                                smooth-scrolling
                                browse-kill-ring
                                expand-region
                                iy-go-to-char
                                rainbow-delimiters
                                clojure-mode
                                cider
                                auto-complete
                                ac-cider
                                color-theme-sanityinc-tomorrow
                                window-number
                                exec-path-from-shell
                                multiple-cursors))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun customac-ensure-package (p)
  (unless (package-installed-p p)
    (package-install p)))

(defun customac-ensure-packages (packages)
  (mapc #'customac-ensure-package packages))

(customac-ensure-packages customac-package-list)

(provide 'customac-packages)
