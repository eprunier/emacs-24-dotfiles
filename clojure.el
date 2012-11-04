;; Useful global settings as Emacs is used predominantely for Clojure development
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;; Colour mach parens and other structure characters to make code easy to follow
(global-rainbow-delimiters-mode)

;; Enable paredit
(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)


(provide 'clojure)
