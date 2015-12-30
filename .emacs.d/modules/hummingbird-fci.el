(require 'fill-column-indicator)
(setq fci-rule-width 2)
(setq fci-rule-color "#41535B")
(setq fci-rule-column 100)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

(provide 'hummingbird-fci)
