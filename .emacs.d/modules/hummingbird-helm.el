(require 'helm) ; required for custamizations
(require 'helm-config)
(require 'helm-projectile)

(helm-mode 1)
(helm-projectile-on)
(define-key helm-map (kbd "ESC") 'helm-keyboard-quit)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(provide 'hummingbird-helm)
