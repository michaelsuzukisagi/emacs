(setq-default inhibit-startup-screen t)
;; Of course, don't uncomment the line below -- doing so would
;; stop Emacs from helpfully leaving "foo~" (backup) files all
;; over the place.
;;(setq make-backup-files nil)

;; Use only spaces (no tabs at all).
(setq-default indent-tabs-mode nil)
;;Set line number
(require 'linum)
;; Always show column numbers.
(setq-default column-number-mode t)

;; Display full pathname for files.
(add-hook 'find-file-hooks
          '(lambda ()
             (setq mode-line-buffer-identification 'buffer-file-truename)))

;; Package.el customization
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Adding repositories
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))

;; rainbow delimiters
(global-rainbow-delimiters-mode)

;; paredit
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(global-set-key [f7] 'paredit-mode)

;; clojure-mode
(global-set-key [f9] 'nrepl-jack-in)

;; nrepl
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")
(add-hook 'nrepl-mode-hook 'paredit-mode)

;; Auto complete
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-completing-map "\M-/" 'ac-stop)

;; ac-nrepl
(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'nrepl-mode))

;; Jade 
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; Set the theme
(load-theme 'deeper-blue)
;;(set-background-color "#383838")
