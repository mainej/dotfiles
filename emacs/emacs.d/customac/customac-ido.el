(customac-ensure-packages '(flx-ido smex))
(require 'flx-ido)
(require 'smex)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(smex-initialize)

(provide 'customac-ido)
