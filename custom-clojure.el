;;; Requirement
(require 'cider)

;;; Modes for ClojureScript development
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\.edn$" . clojure-mode))

;;; Colour mach parens and other structure characters to make code easy to follow
(global-rainbow-delimiters-mode)

;;; Enable paredit
(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;;; Hooks configuration
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode) ;; Enable eldoc in Clojure buffers
(add-hook 'cider-repl-mode-hook 'subword-mode) ;; Enable camelCase support
(add-hook 'cider-repl-mode-hook 'paredit-mode) ;; Enable paredit in the REPL
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode) ;; Enable RainbowDelimiters in the REPL

;;; Behaviour configuration
(setq nrepl-hide-special-buffers t) ;; Hide connection and server buffers from 'C-x b' command
(setq cider-repl-popup-stacktraces t) ;; Enable error buffer popping also in the REPL 
(setq cider-auto-select-error-buffer t) ;; Auto-select the error buffer when it's displayed
(setq cider-repl-display-in-current-window t) ;; 'C-c C-z' switch to the Cider REPL

;;; Auto completion for NREPL
(require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

(provide 'custom-clojure)
