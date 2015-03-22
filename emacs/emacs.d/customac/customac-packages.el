(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(defvar customac-package-list '(projectile
                                smex
                                ag
                                ace-jump-mode
                                smooth-scrolling
                                browse-kill-ring
                                expand-region
                                iy-go-to-char
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
