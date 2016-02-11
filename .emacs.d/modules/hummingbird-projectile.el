(require 'projectile)

(projectile-global-mode)
(setq projectile-indexing-method 'alien)
(setq projectile-completion-system 'helm)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)

(require 'persp-projectile)
(add-to-list 'grep-find-ignored-directories "elpa")
(add-to-list 'grep-find-ignored-directories "node_modules")

(provide 'hummingbird-projectile)
