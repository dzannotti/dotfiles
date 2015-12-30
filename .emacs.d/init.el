;; ************************************
;; INIT
;; ************************************

;;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

(defvar current-user
      (getenv
       (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(message "Hummingbird is powering up... Be patient, Master %s!" current-user)

(when (version< emacs-version "24.1")
  (error "Hummingbird requires at least GNU Emacs 24.1, but you're running %s" emacs-version))

;; Always load newest byte code
(setq load-prefer-newer t)

(defvar hummingbird-dir (file-name-directory load-file-name))
(defvar hummingbird-core-dir (expand-file-name "core" hummingbird-dir))
(defvar hummingbird-modules-dir (expand-file-name  "modules" hummingbird-dir))
(defvar hummingbird-vendor-dir (expand-file-name "vendor" hummingbird-dir))
(defvar hummingbird-themes-dir (expand-file-name "themes" hummingbird-dir))

(add-to-list 'load-path hummingbird-core-dir)
(add-to-list 'load-path hummingbird-modules-dir)
(add-to-list 'load-path hummingbird-vendor-dir)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

(message "Loading Hummingbird's core...")

;; the core stuff
(require 'hummingbird-theme) ;; theme first
(require 'hummingbird-packages)
(require 'hummingbird-core)
(require 'hummingbird-ui)
(require 'hummingbird-programmer)

;; OSX specific settings
(when (eq system-type 'darwin)
  (require 'hummingbird-osx))

(message "Loading Hummingbird's modules...")
(require 'hummingbird-modules)

(message "Hummingbird is ready to do thy bidding, Master %s!" current-user)
