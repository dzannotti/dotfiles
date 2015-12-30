(provide 'hummingbird-evil)
;;; evil
(setq evil-shift-width 2)
(require 'evil)
(evil-mode t)

;;; evil-surround
(require 'evil-surround)

;; make evil use helm
(define-key evil-ex-map "b" 'helm-buffers-list)
(define-key evil-ex-map "e" 'find-file)

;; remap $ and ^ to something shiftless
(define-key evil-normal-state-map "9" 'evil-end-of-line)
(define-key evil-normal-state-map "8" 'evil-first-non-blank)

(global-evil-surround-mode 1)
