setq buffer-auto-save-file-name nil)
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

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes


;; (require 'find-file-in-project)

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


;; (defun forward-word-to-beginning (&optional n)
;;   "Move point forward n words and place cursor at the beginning."
;;   (interactive "p")
;;   (let (myword)
;;     (setq myword
;;       (if (and transient-mark-mode mark-active)
;;         (buffer-substring-no-properties (region-beginning) (region-end))
;;         (thing-at-point 'symbol)))
;;     (if (not (eq myword nil))
;;       (forward-word n))
;;     (forward-word n)
;;     (backward-word n)))

(require 'misc)
(global-set-key (kbd "M-C-f") 'forward-to-word)
(global-set-key (kbd "M-C-b") 'backward-to-word)

(global-set-key (kbd "C-c 3") 'comment-region)
(global-set-key (kbd "C-c 4") 'uncomment-region)
(global-set-key (kbd "C--") 'undo)
(global-set-key (kbd "C-q") 'query-replace)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark))
 '(inhibit-startup-screen t)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control))))))

(if (featurep 'ns)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#070606" :foreground "#eadbcd" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "apple" :family "Monaco"))))
 '(cursor ((t (:background "#ff0099"))))
 '(font-lock-comment-face ((t (:foreground "#5f7189"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "#ff9966"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "#6699ff"))))
 '(font-lock-string-face ((t (:foreground "#92d170"))))
 '(link ((nil (:foreground "blue"))))
 '(region ((nil (:background "#550022"))))
 '(secondary-selection ((((class color) (min-colors 88) (background light)) (:background "pink" :foreground "black"))))))

;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "C-]") 'org-todo)
(global-font-lock-mode 1)

(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
    "Kill up to the ARG'th occurence of CHAR, and leave CHAR.
  The CHAR is replaced and the point is put before CHAR."
    (insert char)
    (forward-char -1))

(when window-system          ; start speedbar if we're using a window system
    (speedbar t))

 (setq speedbar-mode-hook '(lambda ()
    (interactive)
    (other-frame 0)))
(when window-system
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#070606" :foreground "#eadbcd" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "apple" :family "Monaco"))))
 '(cursor ((t (:background "#ff0099"))))
 '(font-lock-comment-face ((t (:foreground "#5f7189"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "#ff9966"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "#6699ff"))))
 '(font-lock-string-face ((t (:foreground "#92d170"))))
 '(link ((nil (:foreground "blue"))))
 '(region ((nil (:background "#550022"))))
 '(secondary-selection ((((class color) (min-colors 88) (background light)) (:background "pink" :foreground "black")))))
)
