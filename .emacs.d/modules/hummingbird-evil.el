(provide 'hummingbird-evil)
;;; evil
(setq evil-shift-width 2)
(require 'evil)
(evil-mode t)

;;; evil-surround
(require 'evil-surround)

(define-key evil-ex-map "b" 'helm-buffers-list)
(define-key evil-ex-map "e" 'find-file)

(global-evil-surround-mode 1)
