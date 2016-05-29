; basic mac key bindings
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

; package management using cask and pallet
; see http://www.lambdacat.com/modern-emacs-package-management-with-cask-and-pallet/
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

