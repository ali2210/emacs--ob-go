# emacs--ob-go
This project helps you run a code in emacs with ob-go and ob-async

## init.el- 
  # 1.go-mode intailization
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
  # 2. go-mode compile
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

# 3. go code-block execute
(with-eval-after-load 'go-mode
(require 'go-autocomplete))


(require 'go-guru)

(require 'ob-go) 
(org-babel-do-load-languages
 'org-babel-load-languages
 '((go . t)))
 # 4. split-window
 (defun vsplit-last-buffer ()
  (interactive)
  (split-window-vertically)
  (other-window 1 nil)
  (switch-to-next-buffer))

(defun hsplit-last-buffer ()
  (interactive)
  (split-window-horizontally)
  (other-window 1 nil)
  (switch-to-next-buffer))

(global-set-key (kbd "C-x-2") 'vsplit-last-buffer)
(global-set-key (kbd "C-X-3") 'hsplit-last-buffer)

 # main.org
        create a file in emacs.d
        open main.org
        type s< then press tab 
        or you can open my code main.org
        press ctrl+c , ctrl+c [two times]
        then types yes
        
