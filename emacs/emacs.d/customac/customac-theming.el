(customac-ensure-package 'color-theme-sanityinc-tomorrow)
(require 'color-theme-sanityinc-tomorrow)

(load-theme 'sanityinc-tomorrow-night t)
(set-face-attribute 'default nil :height 160)

(let ((font "PragmataPro 18"))
  (when (find-font (font-spec :name font))
    (set-frame-font font)))

(provide 'customac-theming)
