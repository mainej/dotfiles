(customac-ensure-package 'exec-path-from-shell)
(require 'exec-path-from-shell)

(exec-path-from-shell-initialize)
(setq mac-option-key-is-meta t
      mac-command-key-is-meta nil
      mac-option-modifier 'meta)

(provide 'customac-osx)
