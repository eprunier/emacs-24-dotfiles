(defun go-config (go-root)
  (add-to-list 'load-path (concat go-root "/misc/emacs"))
  (require 'go-mode-load)

  (add-hook 'go-mode-hook
	    (lambda ()
	      (setq tab-width 4)
	      (setq indent-tabs-mode 1)
	      (add-hook 'before-save-hook 'gofmt-before-save)
	      )))

(let ((go-root (getenv "GOROOT")))
  (when go-root
    (go-config go-root)))

(provide 'custom-go)
