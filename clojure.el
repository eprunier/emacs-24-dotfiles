(provide 'clojure)

;; Useful global settings as Emacs is used predominantely for Clojure development
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))

;; Launch the Clojure repl via Leiningen - M-x clojure-jack-in 
;; Global shortcut definition to fire up clojure repl and connect to it
(global-set-key (kbd "C-c C-j") 'clojure-jack-in)

;; Colour mach parens and other structure characters to make code easy to follow
(global-rainbow-delimiters-mode)

