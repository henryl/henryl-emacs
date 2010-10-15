
(setq buffer-auto-save-file-name nil)
(setq make-backup-files nil)

(add-to-list 'load-path "~/Sync")
(autoload 'python-mode "python-mode" "Python Mode." t)
(require 'whitespace)

(require 'autopair)
(autopair-global-mode) ;; enable autopair 

(require 'textmate)
(textmate-mode)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(setq-default truncate-lines t)

;; (fset 'html-mode 'nxml-mode)
(load "~/Sync/nxhtml/autostart.el")
(setq mumamo-background-colors nil) 
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;; Set up initialization parameters for python mode:
(setq python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'py-smart-indentation nil)
                    (set-variable 'indent-tabs-mode nil) )))

(defun hl-shell-setup()
  (local-set-key (kbd "TAB") '(lambda () (interactive)(progn
                                           (shell-resync-dirs)
                                           (comint-dynamic-complete)
                                           ) ))
  )
(setq shell-mode-hook 'hl-shell-setup)

(defun scroll-down-keep-cursor () 
   ;; Scroll the text one line down while keeping the cursor 
   (interactive) 
   (scroll-down 2)) 

(defun scroll-up-keep-cursor () 
   ;; Scroll the text one line up while keeping the cursor 
   (interactive) 
   (scroll-up 2))

(global-set-key (kbd "M-P") 'scroll-down-keep-cursor)
(global-set-key (kbd "M-N") 'scroll-up-keep-cursor)


(defun forward-word-to-beginning (&optional n)
  "Move point forward n words and place cursor at the beginning."
  (interactive "p")
  (let (myword)
    (setq myword
      (if (and transient-mark-mode mark-active)
        (buffer-substring-no-properties (region-beginning) (region-end))
        (thing-at-point 'symbol)))
    (if (not (eq myword nil))
      (forward-word n))
    (forward-word n)
    (backward-word n)))

(require 'misc)
(global-set-key (kbd "M-C-f") 'forward-to-word)
(global-set-key (kbd "M-C-b") 'backward-to-word)

;; (defun next-word (p)
;;    "Move point to the beginning of the next word, past any spaces"
;;    (interactive "d")
;;    (forward-word)
;;    (forward-word)
;;    (backward-word))
;; (global-set-key "\M-f" 'next-word)

;; (add-hook 'dired-mode-hook
;;  (lambda ()
;;   (define-key dired-mode-map (kbd "<return>")
;;     'dired-find-alternate-file) ; was dired-advertised-find-file
;;   (define-key dired-mode-map (kbd "^")
;;     (lambda () (interactive) (find-alternate-file "..")))
;;   ; was dired-up-directory
;;  ))
;; (put 'dired-find-alternate-file 'disabled nil)
