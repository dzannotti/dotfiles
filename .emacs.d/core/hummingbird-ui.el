;; ************************************
;; UI
;; ************************************

;; disable autowrap
(setq-default truncate-lines t)

;; display whitespace
(require 'whitespace)
(setq-default show-trailing-whitespace t)
(require 'highlight-leading-spaces)
(add-hook 'prog-mode-hook 'highlight-leading-spaces-mode)

;; display line numbers
(global-linum-mode t)
(setq linum-format "%4d ")

;; fonting
(set-default-font "Fira Mono 15")

;; Highlighting current line
(global-hl-line-mode 1)

;; delete the selection with a keypress
(delete-selection-mode t)

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; display nice stuff in bar
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
  '("Hummingbird - " (:eval (if (buffer-file-name)
                                 (abbreviate-file-name (buffer-file-name))
                                  "%b"))))

(provide 'hummingbird-ui)
