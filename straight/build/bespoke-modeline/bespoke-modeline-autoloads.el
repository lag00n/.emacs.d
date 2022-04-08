;;; bespoke-modeline-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "bespoke-modeline" "bespoke-modeline.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from bespoke-modeline.el

(autoload 'bespoke-modeline-visual-bell-fn "bespoke-modeline" "\
Blink the mode-line red briefly. Set `ring-bell-function' to this to use it." nil nil)

(autoload 'bespoke-modeline-visual-bell-config "bespoke-modeline" "\
Enable flashing the mode-line on error." nil nil)

(defvar bespoke-modeline-mode nil "\
Non-nil if Bespoke-Modeline mode is enabled.
See the `bespoke-modeline-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `bespoke-modeline-mode'.")

(custom-autoload 'bespoke-modeline-mode "bespoke-modeline" nil)

(autoload 'bespoke-modeline-mode "bespoke-modeline" "\
Toggle bespoke-modeline minor mode

If called interactively, enable Bespoke-Modeline mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'bespoke-modeline-reload-current-theme "bespoke-modeline" "\
Reloads the currently activated theme." nil nil)

(autoload 'bespoke-modeline-enable-theme "bespoke-modeline" "\
Enables the specified color-theme.
Pass `*default*' to select Emacs defaults.

\(fn THEME)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bespoke-modeline" '("bespoke-")))

;;;***

(provide 'bespoke-modeline-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; bespoke-modeline-autoloads.el ends here
