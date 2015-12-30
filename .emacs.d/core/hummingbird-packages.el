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
    diminish
    evil
    evil-surround
    flycheck
    helm
    helm-projectile
    highlight-leading-spaces
    js2-mode
    key-chord
    magit
    projectile
    spaceline
    undo-tree
    web-mode
    which-func
))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'hummingbird-packages)
