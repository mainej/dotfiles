(require 'midnight)

;; kill unused buffers every four hours, with a "midnight" of 4 am
(midnight-delay-set 'midnight-delay "4:00am")
(setq midnight-period 14400)

(provide 'customac-midnight)
