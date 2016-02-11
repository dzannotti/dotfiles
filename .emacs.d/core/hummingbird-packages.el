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
    auto-complete
    avy
    diminish
    evil
    evil-surround
    exec-path-from-shell
    eyebrowse
    flycheck
    git-gutter
    helm
    helm-projectile
    highlight-leading-spaces
    js2-mode
    js2-refactor
    key-chord
    magit
    persp-mode
    persp-projectile
    projectile
    spaceline
    tern
    tern-auto-complete
    undo-tree
    web-mode
    which-func
    window-numbering
))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'hummingbird-packages)
