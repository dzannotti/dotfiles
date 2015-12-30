(require 'key-chord)

;; avy allows us to effectively navigate to visible things
(require 'avy)
(setq avy-background t)
(setq avy-style 'at-full)

(key-chord-define-global "xx" 'execute-extended-command)
(key-chord-define-global "yy" 'browse-kill-ring)

(key-chord-mode +1)

(provide 'hummingbird-avy)
