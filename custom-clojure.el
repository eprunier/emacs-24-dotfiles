;; Modes for ClojureScript development
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;; Colour mach parens and other structure characters to make code easy to follow
(global-rainbow-delimiters-mode)

;; Enable nRepl minor-mode for existing clojure buffers when nRepl connection is established
(nrepl-enable-on-existing-clojure-buffers)

;; Enable paredit
(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

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
