;; ************************************
;; Core
;; ************************************

;; y-n everywhere
(defalias 'yes-or-no-p 'y-or-n-p)

;; disable autosave and #backups
(setq auto-save-default nil)

;; backups: off
(setq make-backup-files nil)
(setq backup-inhibited t)

;; tabs begone
(setq-default indent-tabs-mode nil)

;; 1 tab = 2 spaces
(setq tab-width 2)

;; Newline at end of file
(setq require-final-newline t)

;; disable the pesky alarm bel
(setq visible-bell t)

(provide 'hummingbird-core)
