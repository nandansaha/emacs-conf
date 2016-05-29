;; basic mac key bindings
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; package management using cask and pallet
;; see http://www.lambdacat.com/modern-emacs-package-management-with-cask-and-pallet/
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; basic config
(setq inhibit-startup-message t)  ; disable startup message, go directly to *scratch*
(menu-bar-mode -1) ; no menu bar
(tool-bar-mode -1) ; no tool bar
(fset 'yes-or-no-p 'y-or-n-p) ; `y' and `n' instead of `yes' and `no'
(show-paren-mode t) ; show matching brackets
(transient-mark-mode t)       ; make the current 'selection' visible
(delete-selection-mode t)     ; delete the selection area with a keypress
(global-font-lock-mode t)
(column-number-mode t)
(set-scroll-bar-mode 'nil)


