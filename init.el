;; This file was generated my config.org. If you're using this, please go modify it

;; default is 800 kilobytes. Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Defer loading most packages for quickier startup times
(setq use-package-always-defer t)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			   ("org" . "https://orgmode.org/elpa/")
			   ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; install use-package if not installed yet 
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Initialize use-package
(require 'use-package)
(setq use-package-always-ensure t)

(use-package auto-package-update
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
	(setq dashboard-banner-logo-title "Hello, master. How can I serve you?")
	(setq dashboard-startup-banner "/home/murilo/.emacs.d/dashboardimg/Sakuya.png")
	(setq dashboard-set-footer nil)
	(setq dashboard-center-content t)
	(setq dashboard-set-heading-icons t)
	(setq dashboard-set-file-icons t)

	(setq dashboard-items '((recents . 5)
													(bookmarks . 5))))
   (dashboard-setup-startup-hook)

(defun efs/set-font-faces ()
  (message "Setting Faces.")
  (set-face-attribute 'default nil :font "envypn 13")
  (set-face-attribute 'fixed-pitch nil :font "envypn 13"))
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (efs/set-font-faces))))
  (efs/set-font-faces))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	    doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))
  :init
  (load-theme 'doom-gruvbox-light t)

(defun my/org-mode/load-prettify-symbols ()
	(interactive)
	(setq prettify-symbols-alist
				(mapcan (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
								'(("#+begin_src" . ?)
									("#+end_src" . ?)))
	      (global-prettify-symbols-mode t)))

(add-hook 'org-mode-hook 'my/org-mode/load-prettify-symbols)

(global-prettify-symbols-mode t)

(use-package simple-modeline
	:hook (after-init . simple-modeline-mode))

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

(add-hook 'org-mode-hook (lambda ()
			       (org-bullets-mode 1)
			       (require 'org-tempo) ;; activating some cool shortcuts
			       (setq tempo-interactive t)
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
