;;init.el
;;Sometimes auto-installing not working, to investigate
(require 'package)
    (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
    (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)

(package-initialize)

(setq package-list '(auto-complete
                     autopair
                     multiple-cursors
                     web-mode
                     yasnippet
                     company
                     project-explorer
                     minimap
                     sqlup-mode
                     expand-region
                     monokai-theme
                     rainbow-mode ;; Color hexcodes
                     atom-one-dark-theme
                     aurora-theme
                     latex-preview-pane
                     flyspell-popup
                     smex ;; ido-mode for M-x
                     js2-mode ;; better mode for javascript
                     emmet-mode
                     sublime-themes
                     auto-yasnippet
                     aggressive-indent ;; auto indent
                     indent-guide ;; crazy indent line
                     impatient-mode ;; html live reload
                     pastelmac-theme
                     mark-multiple
                     cider
                     clojure-cheatsheet
                     clojure-snippets
                     paredit
                     smart-mode-line
                     ))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


(setq user-mail-address "kamil.galek@gmail.com"
      user-full-name    "Kamil Gałek")

;;Do not show welcome message
(setq inhibit-startup-message t)
(setq make-backup-files nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;;Hide all bars
(scroll-bar-mode -1)
(tool-bar-mode -1)
;;(menu-bar-mode -1) ;;Sometimes it's usefull

(set-face-attribute 'default nil :height 80)

(global-set-key [f7] 'linum-mode)
(setq linum-format " %4d ")

;;Uncomment for line highlighting
(global-hl-line-mode 1)

(global-visual-line-mode 1)


(setq sml/no-confirm-load-theme t)


(load-theme 'atom-one-dark t)
(set-default-font "Source Code Pro")

(smart-mode-line-enable)
(ws-butler-global-mode)

(global-set-key (kbd "C-x k") 'kill-buffer-and-window)

(add-hook 'css-mode-hook 'rainbow-mode)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'minimap)
(setq minimap-window-location 'right)
(global-set-key [f10] 'minimap-toggle)

;;Classic
(require 'ido)
(ido-mode t)

;;Ido like for M-x
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;;(require 'helm-config)
;;(global-set-key (kbd "M-x") 'helm-M-x)

(require 'autopair)
(autopair-global-mode)

(require 'auto-complete)
(global-auto-complete-mode 1)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-n") 'mc/mark-next-like-this)

;;Better buffer menu
(global-set-key (kbd "C-x C-b") 'buffer-menu)

(require 'project-explorer)
(global-set-key [f8] 'project-explorer-toggle)

(require 'emmet-mode)
(global-set-key (kbd "C-e") 'emmet-expand-line)

(require 'inline-string-rectangle)
(global-set-key (kbd "C-c C-r") 'rename-sgml-tag)

;;Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'yasnippet)
(yas-global-mode 1)
(global-set-key (kbd "C-q") 'company-yasnippet)

;;(require 'ace-jump-mode)
;;    (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(add-hook 'sql-mode-hook 'sqlup-mode)

(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)
(global-set-key (kbd "C-SPC") 'company-complete-common)

(require 'org)
(setq org-log-done t)

(setq org-agenda-files (list "~/Dropbox/org-mode/praca_inzynierska/main.org"
                             "~/Dropbox/org-mode/studia/wat.org"))

;;Set font settings for latex mode
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-0-face ((t (:inherit font-latex-sectioning-1-face))))
 '(font-latex-sectioning-1-face ((t (:inherit font-latex-sectioning-2-face))))
 '(font-latex-sectioning-2-face ((t (:inherit font-latex-sectioning-3-face))))
 '(font-latex-sectioning-3-face ((t (:inherit font-latex-sectioning-4-face))))
 '(font-latex-sectioning-4-face ((t (:inherit font-latex-sectioning-5-face))))
 '(font-latex-sectioning-5-face ((t (:foreground "#74CBC4" :weight bold))))
 '(font-latex-slide-title-face ((t (:inherit (variable-pitch font-lock-type-face) :weight bold)))))

(require 'ispell)
(flyspell-mode t)
(define-key flyspell-mode-map (kbd "C-t") 'flyspell-popup-correct)

(add-to-list 'ispell-local-dictionary-alist '("pl_PL"
                                              "[[:alpha:]]"
                                              "[^[:alpha:]]"
                                              "[']"
                                              t
                                              ("-d" "pl_PL")
                                              nil
                                              utf-8))

(setq ispell-program-name "hunspell"
      ispell-dictionary   "pl_PL")


(require 'auto-yasnippet)
(global-aggressive-indent-mode 1)

(require 'indent-guide)
(indent-guide-global-mode)

(require 'impatient-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("705f3f6154b4e8fac069849507fd8b660ece013b64a0a31846624ca18d6cf5e1" "c697b65591ba1fdda42fae093563867a95046466285459bd4e686dc95a819310" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))
