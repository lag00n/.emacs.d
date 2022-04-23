;; This file was generated my config.org. If you're using this, please go modify it

;; default is 800 kilobytes. Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Defer loading most packages for quickier startup times
(setq use-package-always-defer t)

(unless (featurep 'straight)
	;; Bootstrap straight.el
	(defvar bootstrap-version)
	(let ((bootstrap-file
				 (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
				(bootstrap-version 5))
		(unless (file-exists-p bootstrap-file)
			(with-current-buffer
					(url-retrieve-synchronously
					 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
					 'silent 'inhibit-cookies)
				(goto-char (point-max))
				(eval-print-last-sexp)))
		(load bootstrap-file nil 'nomessage)))

;; Use straight.el for use-package expressions
(straight-use-package 'use-package)

;; Disabling package.el completely
(setq package-enable-at-startup nil)

(setq straight-use-package-by-default t)

(use-package auto-package-update
  :straight t 
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "12:35"))

(setq-default tab-width 2)
(setq-default standard-indent 2)
(setq c-basic-offset tab-width)
(setq-default eletric-indent-inhibit t)
(setq-default indent-tabs-mode t)
(setq backward-delete-char-untabify-method 'nil)

(setq eletric-pair-pairs '(
	    										 (?\{ . ?\})
													 (?\( . ?\))
													 (?\[ . ?\])
													 (?\" . ?\")
													 ))
(electric-pair-mode t)

(use-package which-key
	:init (which-key-mode))

(use-package yasnippet
	:config
	(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
	(yas-global-mode 1))

(setq x-select-enable-clipboard t)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(use-package ace-window
  :init (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l) ;; switching keys to home row
	  aw-char-position 'left
	  aw-ignore-current nil
	  aw-leading-char-style 'char
		aw-scope 'frame)
  :bind (("M-o" . ace-window)
				 ("M-O" . ace-swap-window)))

(defun split-and-follow-horizontally ()
 (interactive)
 (split-window-below)
 (balance-windows)
 (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
 (interactive)
 (split-window-right)
 (balance-windows)
 (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "s-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "s-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-C-<down>") 'shrink-window)
(global-set-key (kbd "s-C-<up>") 'enlarge-window)

(global-hl-line-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)

(scroll-bar-mode -1) ;; disable visible scrollbar
 (tool-bar-mode -1) ;; disable toolbar
 (tooltip-mode -1) ;; disable tooltips
 (menu-bar-mode -1) ;; disable menubar
 (set-fringe-mode 10) ;; give some breathing room

;; visual bell setup
 (setq visible-bell t)

 (column-number-mode 1)
 (global-display-line-numbers-mode t)

 ;; Disable line numbers for some modes
 (dolist (mode '(org-mode-hook
                 term-mode-hook
                 shell-mode-hook
                 treemacs-mode-hook
                 eshell-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))

 ;; show parent parentheses
 (show-paren-mode 1)

(use-package dashboard
	:after page-break-lines
	:config
	(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
	(setq dashboard-page-separator "\n\f\n")
	(setq dashboard-banner-logo-title "Hello, master. How can I serve you?")
	(setq dashboard-startup-banner "~/.emacs.d/dashboardimg/Sakuya.png")
	(setq dashboard-set-footer nil)
	(setq dashboard-center-content t)
	(setq dashboard-set-heading-icons t)
	(setq dashboard-set-file-icons t)
	(setq dashboard-items '((recents . 5) (bookmarks . 5))))
  (dashboard-setup-startup-hook)

(use-package all-the-icons)

(use-package page-break-lines
	:demand t)

(defun efs/set-font-faces ()
  (message "Setting Faces.")
  (set-face-attribute 'default nil :font "envypn 13")
  (set-face-attribute 'fixed-pitch nil :font "envypn 13")
	(set-fontset-font t 'symbol "Symbola" nil))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (efs/set-font-faces))))
  (efs/set-font-faces))

(use-package doom-themes
	:straight t 
  :config
  (setq doom-themes-enable-bold t
	    doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))
  (load-theme 'doom-wilmersdorf t)

(defun my/org-mode/load-prettify-symbols ()
	(interactive)
	(setq prettify-symbols-alist
				(mapcan (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
								'(("#+begin_src" . ?)
									("#+end_src" . ?))))
	      (global-prettify-symbols-mode t))

(add-hook 'org-mode-hook 'my/org-mode/load-prettify-symbols)

(global-prettify-symbols-mode t)

(use-package rainbow-delimiters
	:init
	(add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package rainbow-mode)

(use-package bespoke-modeline
	:demand t 
	:straight (:type git :host github :repo "mclear-tools/bespoke-modeline")
	:hook (after-init . bespoke-modeline-mode)
	:init
	;; Set header line (modeline on top)
	(setq bespoke-modeline-position 'top)
	;; Modeline height
	(setq bespoke-modeline-size 10)
	;; Modeline spacing
	(setq bespoke-modeline-space-bottom -2)
	;; Use visual bell
	(setq bespoke-modeline-visual-bell t)
  :config
  (bespoke-modeline-mode))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

(use-package org-bullets)

(add-hook 'org-mode-hook (lambda ()
			       (org-bullets-mode 1)
			       (require 'org-tempo) ;; activating some cool shortcuts
			       (setq tempo-interactive t)
						 (setq org-startup-folded t)
						 (org-toggle-inline-images)
						 (org-indent-mode)))

(use-package ox-jekyll-md
  :init
  (setq org-jekyll-md-include-yaml-front-matter nil
	    org-jekyll-md-use-todays-date nil))

(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0)

(setq org-publish-project-alist
      '(
	    ("lag00n.github.io"
	     ;; path to org files
	     :base-directory "~/github/lag00n.github.io/_org"
	     :base-extension "org"
	     ;; path to jekyll posts
	     :publishing-directory "~/github/lag00n.github.io/_cool_posts"
	     :recursive t
	     :publishing-function org-jekyll-md-publish-to-md
	     :toc nil
	     )))

(defun my-org-screenshot ()
	"Take a screenshot into a time stamped unique-named
file in the same directory as the org-buffer and insert a link to this file."
	(interactive)
	(setq filename
				(concat
				 (make-temp-name
					(concat (buffer-file-name)
									"_"
									(format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
	(call-process "import" nil nil nil filename)
	(insert (concat "[[" filename "]]"))
	(org-display-inline-images))

(use-package elfeed
	:config
	(setq elfeed-feeds
		'("https://www.reddit.com/r/emacs/.rss"
			"https://www.reddit.com/r/unixporn/new/.rss?sort=new")))

(add-to-list 'load-path "~/.local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
;;(require 'smtpmail)
(setq user-mail-address "lxg00n@paranoid.email"
			user-full-name "lxg00n"
			;;mbsync command to update mail
			mu4e-get-email-command "mbsync -c ~/.config/mbsync/.mbsyncrc -a"
			mu4e-update-interval 300
			send-mail-function 'smtpmail-send-it
			smtpmail-smtp-server "smtp.paranoid.email"
			smtpmail-smtp-service "25"
			smtpmail-stream-type 'starttls
      mu4e-sent-folder "/lxg00n-paranoid/Sent"
      mu4e-drafts-folder "/lxg00n-paranoid/Drafts"
      mu4e-trash-folder "/lxg00n-paranoid/Trash"
			mu4e-decryption-policy 'ask
      mu4e-maildir-shortcuts
      '(("/lxg00n-paranoid/Inbox"      . ?i)
        ("/lxg00n-paranoid/Sent Items" . ?s)
        ("/lxg00n-paranoid/Drafts"     . ?d)
        ("/lxg00n-paranoid/Trash"      . ?t)))
