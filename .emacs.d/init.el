;;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq url-http-attempt-keepalives nil)
(setq inhibit-startup-message t)

(require 'package)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                          ("org" . "http://orgmode.org/elpa/")
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))

; Apparently needed for the package auto-complete (why?)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
;; set window size
(when window-system (set-frame-size (selected-frame) 200 1000))

;; define auto install utils
;; This bootstraps us if we don't have anything
(when (not package-archive-contents)
  (package-refresh-contents))

;; This installs elpa packages if we haven't done that yet
(defun maybe-install-and-require (p)
  (when (not (package-installed-p p))
    (package-install p))
  (require p))

;; spaces are default mode
(setq-default indent-tabs-mode nil)

;; tabs are 2 spaces
(setq tab-width 2)

;; line nums
(global-linum-mode t)
(setq linum-format (quote "%4d "))

;; disable autosave and #backups
(setq auto-save-default nil)

;;; backups: off
;; http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files#answer-151946
(setq make-backup-files nil)
(setq backup-inhibited t)

;; disable autowrap
(setq-default truncate-lines t)

;; whitespace-mode
;; http://stackoverflow.com/questions/6378831/emacs-globally-enable-whitespace-mode
(global-whitespace-mode 1)

;; http://ergoemacs.org/emacs/whitespace-mode.html
;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Useless-Whitespace.html
;; http://ergoemacs.org/emacs/emacs_delete_trailing_whitespace.html
(setq whitespace-style (quote
  (face tabs trailing empty)))

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(setq custom-safe-themes t)
(load-theme 'base16-oceanicnext-dark t)

;; adding line at end of file
(setq mode-require-final-newline t)

;; fonting
;; Load the customizations after an emacsclient startsup.
(setq current-font-size 14)
(setq current-font-name "Fira Mono")

;; Highlighting current line
(global-hl-line-mode 1)

;; ***********
;; Packages
;; ***********

;; window number
(maybe-install-and-require 'window-number)
(window-number-mode)

;; autocomplete
(maybe-install-and-require 'auto-complete)
(global-auto-complete-mode t)

;; evil-mode
(maybe-install-and-require 'evil)
(evil-mode t)

;; helm
(maybe-install-and-require 'helm)
(helm-mode 1)

;; projectile
(maybe-install-and-require 'projectile)
(setq projectile-completion-system 'helm)
(projectile-global-mode)

;; magit
(maybe-install-and-require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; flycheck
(maybe-install-and-require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; powerline and theme
(maybe-install-and-require 'powerline)
(maybe-install-and-require 'airline-themes)
(load-theme 'airline-wombat)

;; ************
;; File Modes
;; ************

;; javscript
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-mode))
(setq js2-basic-offset 2)

;; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
   (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
   (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
   (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; ***********
;; Keybinds
;; ***********
(global-set-key (kbd "C-c C-c") 'comment-line)
(global-set-key (kbd "C-c r") (lambda ()
                                (interactive)
                                (revert-buffer t t t)
                                (message "buffer is reverted")))