(require 'tern)
(require 'auto-complete)
(require 'tern-auto-complete)

(global-auto-complete-mode t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
 '(progn
    (require 'tern-auto-complete)
    (tern-ac-setup)))

(provide 'hummingbird-autocomplete)
