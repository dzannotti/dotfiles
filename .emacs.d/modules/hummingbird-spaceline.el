(require 'spaceline)
(require 'spaceline-config)

(spaceline-spacemacs-theme)
(setq powerline-default-separator 'slant)
(spaceline-toggle-minor-modes-off)
(spaceline-toggle-hud-off)

(spaceline-toggle-line-column-on)
(spaceline-toggle-window-number-on)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

(powerline-reset)

(provide 'hummingbird-spaceline)
