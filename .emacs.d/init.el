(package-initialize)
(elpy-enable)
(eldoc-mode)
(setq elpy-rpc-backend "jedi")
(company-quickhelp-mode 1)
(setq tramp-verbose 10)
(setq require-final-newline t)
(require 'tramp)
(setq tramp-default-method "ssh")
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;(add-to-list 'package-archives
;             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
;; Fixing a key binding bug in elpy
;;(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;; Fixing another key binding bug in iedit mode
;;(define-key global-map (kbd "C-c o") 'iedit-mode)
(require 'ido)
(ido-mode t)
;(require 'auto-complete)
;(global-auto-complete-mode t)
(setq backup-directory-alist `(("." . "~/.saves")))
(global-set-key (kbd "RET") 'newline-and-indent)
