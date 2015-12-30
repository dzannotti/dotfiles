;; ************************************
;; Packages
;; ************************************

(require 'package)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                          ("org" . "http://orgmode.org/elpa/")
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")
                          ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

(defvar package-list
  '(
    anzu
    avy
    auto-complete
    diminish
    evil
    evil-surround
    exec-path-from-shell
    flycheck
    helm
    helm-projectile
    highlight-leading-spaces
    js2-mode
    js2-refactor
    key-chord
    magit
    projectile
    spaceline
    undo-tree
    tern
    tern-auto-complete
    web-mode
    which-func
))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'hummingbird-packages)
