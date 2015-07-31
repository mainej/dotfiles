(customac-ensure-packages '(diminish))
(require 'diminish)

(defvar diminish-minor-modes
  '(company-mode
    undo-tree-mode
    evil-smartparens-mode
    evil-snipe-mode
    smartparens-mode
    clojure-refactor-mode))
(mapc 'diminish diminish-minor-modes)

(provide 'customac-diminish)
