;;; package: --- Summary
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;; code:
;;; commentary:

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(tool-bar-mode -1)
(menu-bar-mode -1)

(setq package-enable-at-startup nil)
(package-initialize)

(add-hook 'find-file-hook 'linum-mode)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package dracula-theme
  :ensure t)

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'prog-mode-hook (lambda () (rainbow-mode 1)))
  (add-hook 'c++-mode-hook (lambda () (rainbow-mode 0)))
  )

(use-package autopair
  :ensure t
  :config
  (add-hook 'prog-mode-hook (lambda () (autopair-mode))))

(use-package helm
  :ensure t)

(use-package evil
  :ensure t
  :config (evil-mode t))

(bind-key "C-u" 'evil-scroll-up evil-normal-state-map)
(bind-key "C-u" 'evil-scroll-up evil-visual-state-map)

;; Utilisation du web-mode pour le développement
(use-package web-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
      )

(setq-default indent-tabs-mode nil)
(setq web-mode-code-indent-offset 4)
(setq web-mode-indent-style 4)

;; Configuration de org-mode
(use-package org
  :ensure t
  :config
  (setq org-log-done t)
  (setq org-agenda-files (list "~/agenda.org")))

(use-package auto-dim-other-buffers
  :ensure t
  :config
  (auto-dim-other-buffers-mode t))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(define-key global-map "\C-ca" 'org-agenda)

(use-package org-bullets
  :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e2fd81495089dc09d14a88f29dfdff7645f213e2c03650ac2dd275de52a513de" "4757d7d892a38e2d0c9a86d9b83c1aa3e6f1a68ce7a370101ed91239b39e142b" "e08cf6a643018ccf990a099bcf82903d64f02e64798d13a1859e79e47c45616e" "8a9be13b2353a51d61cffed5123b157000da0347c252a7a308ebc43e16662de7" default)))
 '(package-selected-packages
   (quote
    (deadgrep flycheck company flycheck-rtags company-rtags helm-rtags cmake-ide rtags projectile compagny evil-org rainbow-mode ranger helm helm-spotify-plus multi evil-magit magit dumb-jump indent-guid indent-guide indent-guide-mode indent-guide-mmode aggressive-indent org-bullets neotree auto-complete web-mode evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-dim-other-buffers-face ((t (:background "gray8")))))

(use-package deadgrep
  :ensure t)
(bind-key "C-/" 'deadgrep evil-normal-state-map)

;;(use-package aggressive-indent
;;  :ensure t)
;;(add-hook 'prog-mode-hook 'aggressive-indent-mode)
;;(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; https://github.com/ggreer/the_silver_searcher#installing
;; ou ripgrep (rg)
;; Voir s'il n'y a pas d'alternative (l'installation me tanne)
(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'prog-mode-hook (lambda () (dumb-jump-mode 1)))
  )

(setq dumb-jump-selector 'helm)
(setq dumb-jump-force-searcher 'rg)

(bind-key "<f12>" 'dumb-jump-go evil-normal-state-map)
(bind-key "<f12>" 'dumb-jump-go evil-insert-state-map)

(bind-key "S-<f12>" 'dumb-jump-back evil-normal-state-map)
(bind-key "S-<f12>" 'dumb-jump-back evil-insert-state-map)

(use-package magit
  :ensure t)
(bind-key "g s" 'magit-status evil-normal-state-map)

(use-package ranger
  :ensure t)
(bind-key "C-N" 'ranger evil-normal-state-map)
(bind-key "C-N" 'ranger evil-visual-state-map)

(use-package evil-magit
  :ensure t)

(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "C-SPC") 'company-complete)
    (setq company-idle-delay 0)
    (setq company-backend "helm")))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (add-hook 'c++-mode-hook
            (lambda () (setq flycheck-clang-include-path
                             (list (expand-file-name "/usr/local/include"))))))

(use-package projectile
  :ensure t)
(bind-key "z" 'projectile--find-file evil-normal-state-map)


;;Montre les liens entre les (, [, {
(show-paren-mode t)

(modify-syntax-entry ?_ "w")

;; Make for C++
(require 'cc-mode)

(defun get-parent-directory (path)
  "Get the parent directory."
  (file-name-directory (directory-file-name path)))


(defun compile-make-ex (target)
  "Run make to compile. provide more arguments."
  (interactive "starget: ")
  (let ((default-directory (locate-dominating-file default-directory "Makefile")))
    (if default-directory
        (compilation-start (format "make %s" target))
        (message "cannot find Makefile"))))

(defun compile-make ()
  "Run make to compile."
  (interactive)
  (compile-make-ex ""))

(bind-key "<f4>" 'compile-make c++-mode-map)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; End Make for C++

;; store all backup and autosave files in the tmp dir
    (setq backup-directory-alist
          `((".*" . ,"~/emacs_bck")))

    (setq auto-save-file-name-transforms
          `((".*" ,"~/emacs_bck" t)))
	
(setq evil-insert-state-cursor '((hbar . 2) "yellow"))
(setq evil-normal-state-cursor '(box "purple"))

