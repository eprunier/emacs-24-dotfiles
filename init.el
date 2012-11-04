(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;
;; General
;;
(setq inhibit-startup-message t
      make-backup-files nil)
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


;;
;; Add default packages to the Emacs environment
;; Packages are installed if they are not already present
;;
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") )
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(paredit rainbow-delimiters highlight-parentheses
			      clojure-mode clojure-test-mode
			      ac-slime slime slime-repl nrepl
			      markdown-mode
			      haskell-mode ghc ghci-completion))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;;
;; Default theme
;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn)


;;
;; Customizing
;;
(add-to-list 'load-path user-emacs-directory)
(require 'custom-bindings)
(require 'custom-functions)
(require 'clojure)
(require 'groovy)

;; Enable highlight-parentheses-mode on all buffers
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;; Enable paredit for Elisp
(add-hook 'emacs-lisp-mode-hook 'turn-on-paredit)

;; Show matching parentheses
(show-paren-mode 1)
