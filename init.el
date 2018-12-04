
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require  'package)
(add-to-list 'package-archives'
  ("melpa" . "http://melpa.milkbox.net/packages/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-selected-packages
   (quote
    (ob-go org-babel-eval-in-repl ob-async spacemacs-theme neotree flymake-go go-autocomplete auto-complete go-gopath go-projectile exec-path-from-shell go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path"~/emacs.d/")

(when(memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq gofmt-command "goimports")
  (if(not(string-match "go" compile-command))
      (set(make-local-variable 'compile-command)
	  "go build -v && go test-v && go vet"))

  (go-guru-h1-identifier-mode)
  
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (local-set-key (kbd "M-p") 'compile)
  (local-set-key (kbd "M-P") 'recompile)
  (local-set-key (kbd "M-]") 'next-error)
  (local-set-key (kbd "M-[") 'prev-error)
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'my-go-mode-hook)



(with-eval-after-load 'go-mode
(require 'go-autocomplete))

(require 'go-guru)

(require 'ob-go)
(org-babel-do-load-languages
 'org-babel-load-lAnguages
 '((go . t)))
