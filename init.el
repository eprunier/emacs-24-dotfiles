(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default))))
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
(setq-default truncate-lines t)

;;
;; UTF-8 configuration
;;
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)


;;
;; Disable mouse features
;;
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))


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

(defvar my-packages '(paredit ido-ubiquitous smex
			      rainbow-delimiters highlight-parentheses
			      clojure-mode clojure-test-mode
			      nrepl ac-nrepl nrepl-ritz
			      magit
			      linum-off hlinum
			      markdown-mode
			      haskell-mode ghc ghci-completion))

(dolist (package my-packages)
  (when (not (package-installed-p package))
    (package-install package)))


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
(require 'custom-clojure)
(require 'custom-nrepl)
(require 'custom-groovy)
(require 'custom-octave)
(require 'custom-html)

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

;; Enable ido
(setq ido-everywhere t)
(ido-mode 1)
(ido-ubiquitous 1)

;; Enable smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Show line numbers in margin
(require 'linum-off)
(require 'hlinum)

;; For non ascii characters
(require 'iso-transl)
