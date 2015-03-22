(defvar customac-package-list '(smartparens
                                magit
                                projectile
                                flx-ido
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
                                popwin
                                multiple-cursors))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (p customac-package-list)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'customac-packages)
