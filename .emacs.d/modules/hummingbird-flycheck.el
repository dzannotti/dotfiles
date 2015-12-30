(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq flycheck-disabled-checkers '(javascript-jshint javascript-jscs))

;; use eslint with web-mode for jsx files
(setq flycheck-checkers '(javascript-eslint))
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'js2-mode)

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'hummingbird-flycheck)

