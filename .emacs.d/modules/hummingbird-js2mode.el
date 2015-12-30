(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js?\\'" . js2-jsx-mode))

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq-default js2-basic-offset 2)

(add-hook 'js2-mode-hook #'setup-js2-mode)

(provide 'hummingbird-js2mode)
