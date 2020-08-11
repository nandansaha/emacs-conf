;; basic mac key bindings

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

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
(desktop-save-mode 1)

;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always) ; don't prompt if buffer doesn't exist

;;;;;;;;;;;;;;;;;;
;; key bindings ;;
;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-o") 'other-window)

;; markdown-mode customisation
; multimarkdown is installed via homebrew
(setq markdown-command "/usr/local/bin/multimarkdown")

;; from https://github.com/feoh/dotfiles/blob/master/home/.emacs.d/init.el
;; Configure backups in a sane way
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;;--------------------
;; packaging related
;;--------------------
(require 'package)
; add melpa
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; tramp
(setq tramp-default-method "ssh")

;; PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; imenu-list
(setq imenu-list-position 'left)

;; golang
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(set-default-font "Monaco 13")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(package-selected-packages (quote (imenu-list markdown-mode go-mode magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
