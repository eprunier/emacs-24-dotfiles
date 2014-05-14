(defun go-config (goroot)
  (add-to-list 'load-path (concat goroot "/misc/emacs"))
  (require 'go-mode-load)

  (add-hook 'go-mode-hook
	    (lambda ()
	      (setq tab-width 4)
	      (setq indent-tabs-mode 1)
	      (add-hook 'before-save-hook 'gofmt-before-save))))

(let ((goroot (or (getenv "GOROOT")
		  (getenv "GO_HOME"))))
  (when goroot
    (go-config goroot)))

(provide 'custom-go)
