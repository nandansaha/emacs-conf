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


;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-create-new-buffer 'always) ; don't prompt if buffer doesn't exist

;;;;;;;;;;;;;;;;;;
;; key bindings ;;
;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-o") 'other-window)

;; smex https://github.com/nonsequitur/smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; markdown-mode customisation
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

(setenv "GOPATH" "/Users/nandan/Dropbox/code/go/")
;; exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH")
  )

;;(add-hook 'before-save-hook 'gofmt-before-save)

(defun my-go-mode-hook ()
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Call Gofmt before saving                                                    
  ;;  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Go oracle
  (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
  ; Godef jump key binding                                                      
  (local-set-key (kbd "M-.") 'godef-jump)
  ; autocomplete 
  (auto-complete-mode 1)
  ;go-eldoc
  (go-eldoc-setup)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

