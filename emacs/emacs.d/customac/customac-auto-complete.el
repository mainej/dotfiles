(customac-ensure-package 'company)

(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'clojure-mode-hook #'company-mode)

(provide 'customac-auto-complete)
