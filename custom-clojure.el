;; Modes for ClojureScript development
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;; Colour mach parens and other structure characters to make code easy to follow
(global-rainbow-delimiters-mode)

;;
(nrepl-enable-on-existing-clojure-buffers)

;; Enable paredit
(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)


(provide 'custom-clojure)
