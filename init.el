;;;
;;; custom
;;; 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("baed08a10ff9393ce578c3ea3e8fd4f8c86e595463a882c55f3bd617df7e5a45" "54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" "01c5758d2d383c53dbfbae8c9a0bf78cd46e589ce83ae15b97c3147461408efa" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;
;; General
;;
(setq make-backup-files nil)
(setq-default truncate-lines nil)

;;
;; UTF-8 configuration
;;
(setq-default buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;;
;; Disable mouse features
;;
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Add Marmalade package archive for Emacs starter kit and other Emacs packages

(require 'package)
(add-to-list 'package-archives
	'("marmalade" . "http://marmalade-repo.org/packages/") )
(package-initialize)


;; Add Clojure and other supporting packages to the Emacs environment
;; Packages are installed if they are not already present
;; The list includes packages for the starter kit, Clojure and markdown files (used by github)

(when (not package-archive-contents)
 	(package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell starter-kit-bindings
	clojure-mode clojure-test-mode
        rainbow-delimiters
        ac-slime slime slime-repl
	markdown-mode
        haskell-mode ghc ghci-completion
        groovy-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;
;; customizing
;;
(add-to-list 'load-path user-emacs-directory)
(require 'custom-bindings)
(require 'custom-functions)
(require 'clojure)
(require 'groovy)

;;
;; default theme
;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn)

