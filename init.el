(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Berkeley Mono" :foundry "UKWN" :slant normal :weight normal :height 120 :width normal)))))

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-prettify-symbols-mode 1)

(put 'dired-find-alternate-file 'disabled nil)
(setq make-backup-files nil)
(global-set-key (kbd "C-z") nil)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package haskell-mode
  :ensure t)

(use-package racket-mode
  :ensure t)

(use-package geiser
  :ensure t
  :config
  (setq geiser-active-implementations '(mit)))

(use-package geiser-mit
  :ensure t
  :config
  (setq geiser-mit-binary "/usr/bin/scheme"))

(use-package sly
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl"))

(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode .         enable-paredit-mode)
	 (lisp-mode .               enable-paredit-mode)
	 (lisp-interaction-mode .   enable-paredit-mode)
	 (scheme-mode .             enable-paredit-mode)
	 (racket-mode .             enable-paredit-mode)))

(use-package rainbow-delimiters
  :ensure t
  :hook ((emacs-lisp-mode .         rainbow-delimiters-mode)
	 (lisp-mode .               rainbow-delimiters-mode)
	 (lisp-interaction-mode .   rainbow-delimiters-mode)
	 (slime-repl-mode .         rainbow-delimiters-mode)
	 (scheme-mode .             rainbow-delimiters-mode)
	 (geiser-repl-mode .        rainbow-delimiters-mode)
	 (racket-mode .             rainbow-delimiters-mode)
	 (racket-repl-mode .        rainbow-delimiters-mode)))

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t)
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :config
  (setq yas-snippet-dirs (list (concat user-emacs-directory "snippets"))))

;; (use-package helm
;;   :ensure t
;;   :config
;;   (unless (> -1 0)
;;     (setq default-frame-alist '((vertical-scroll-bars . nil)
;; 				(tool-bar-lines . 0)
;; 				(menu-bar-lines . 0)
;; 				(fullscreen . nil))))
;;   (blink-cursor-mode -1)
;;   (load "helm-autoloads" nil t)
;;   (helm-mode 1)
;;   (with-eval-after-load 'tramp-cache (setq tramp-cache-read-persistent-data t))
;;   (with-eval-after-load 'auth-source (setq auth-source-save-behavior nil))
;;   (define-key global-map [remap find-file] 'helm-find-files)
;;   (define-key global-map [remap occur] 'helm-occur)
;;   (define-key global-map [remap list-buffers] 'helm-buffers-list)
;;   (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
;;   (define-key global-map [remap execute-extended-command] 'helm-M-x)
;;   (define-key global-map [remap apropos-command] 'helm-apropos)
;;   (unless (boundp 'completion-in-region-function)
;;     (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
;;     (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)))

;; (use-package undo-tree
;;  :ensure t
;;  :config
;;  (global-undo-tree-mode)
;;  (setq undo-tree-history-directory-alist '(("." . "~/.undotree"))))

;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; (setq inferior-lisp-program "/usr/bin/sbcl")

;; (add-hook 'org-mode-hook '(lambda () (setq bidi-paragraph-direction 'nil)))

;; (use-package magit
;;   :ensure t)
