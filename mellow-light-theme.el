;; -*- eval: (rainbow-mode); lexical-binding: t -*-
;;; mellow-theme-light.el --- An emacs theme based on vim-mellow, using autothemer
;;; Created by lxg00n
;;; Github: https://github.com/lag00n

(require 'autothemer)

(autothemer-deftheme
 mellow-light "a emacs theme based on vim-mellow"

 ((((class color) (min-colors #xFFFFFF))) ;; We're covering just graphical emacs for now

	;; Define our color palette
	(mellow-light-black "#0f0908")
	(mellow-light-brightblack "#3d241f")

	(mellow-light-red "#af0032")
	(mellow-light-brightred "#ff7477") 

	(mellow-light-green "#4c6325")
	(mellow-light-brightgreen "#84bf40")

	(mellow-light-yellow "#a67458")
	(mellow-light-brightyellow "#f3ae72")

	(mellow-light-blue "#573e55")
	(mellow-light-brightblue "#8a7b85")

	(mellow-light-magenta "#66292f")
	(mellow-light-brightmagenta "#8a4b53")

	(mellow-light-cyan "#bf472c")
  (mellow-light-brightcyan "#d47d49")
		
	(mellow-light-white "#e0ccae")
	(mellow-light-brightwhite "#f2ddbc"))

 ;; Customize faces
  ;; Basic stuff  
 ((default                      (:foreground mellow-light-black :background mellow-light-brightwhite))
	(cursor                       (:background mellow-light-black))
	(region                       (:background mellow-light-white :box (:line-width -1 :color mellow-light-cyan :style nil)))
	(hl-line                      (:background mellow-light-white))
	(lazy-highlight               (:background mellow-light-white))
	(mode-line                    (:background mellow-light-white))
	(lambda-line-active-status-RW (:background mellow-light-brightred))
	(line-number                  (:foreground mellow-light-brightblack :background mellow-light-white :bold nil)) ;; Bold looks a little awful ngl 
	(line-number-current-line     (:foreground mellow-light-red :bold t))
	(fringe                       (:background mellow-light-brightwhite))
	;; Font-lock related
	(font-lock-constant-face      (:foreground mellow-light-magenta))
	(font-lock-keyword-face       (:foreground mellow-light-red))
	(font-lock-constant-face      (:foreground mellow-light-brightred))
	(font-lock-string-face        (:foreground mellow-light-brightcyan))
	(font-lock-builtin-face       (:foreground mellow-light-cyan))
	;; Rainbow Delimiters colors
	(rainbow-delimiters-depth-1-face (:foreground mellow-light-magenta))
	;; Org-mode related
	(org-level-1                  (:foreground mellow-light-red))
	(org-block                    (:background mellow-light-white))
	))

(provide-theme 'mellow-light)
