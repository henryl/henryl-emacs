
(setq buffer-auto-save-file-name nil)
(setq make-backup-files nil)

(add-to-list 'load-path "~/Sync")
(autoload 'python-mode "python-mode" "Python Mode." t)
(require 'whitespace)

(require 'autopair)
(autopair-global-mode) ;; enable autopair 

(require 'textmate)
(textmate-mode)

(setq-default truncate-lines t)

;; (fset 'html-mode 'nxml-mode)
(load "~/Sync/nxhtml/autostart.el")
(setq mumamo-background-colors nil) 
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))