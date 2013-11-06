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

;;; Cider configuration
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)

;;; nREPL configuration
(setq nrepl-hide-special-buffers t)

;;; Some default eldoc facilities
;;(add-hook 'nrepl-connected-hook
;;(defun pnh-clojure-mode-eldoc-hook ()
;;  (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
;;  (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
    ;;; Enable nRepl minor-mode for existing clojure buffers when nRepl connection is established
;;    (nrepl-enable-on-existing-clojure-buffers))

;;; Auto completion for NREPL
(require 'ac-nrepl)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)

;; Refresh nrepl-namespace ([org.clojure/tools.namespace] is required in project.clj)
(defun nrepl-refresh ()
  (interactive)
  (set-buffer "*nrepl*")
  (goto-char (point-max))
  (insert "(require 'clojure.tools.namespace.repl)")
  (nrepl-return)
  (goto-char (point-max))
  (insert "(clojure.tools.namespace.repl/refresh)")
  (nrepl-return))

(provide 'custom-clojure)
