;;; ox-jekyll-md-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "ox-jekyll-md" "ox-jekyll-md.el" (0 0 0 0))
;;; Generated autoloads from ox-jekyll-md.el

(autoload 'org-jekyll-md-export-as-md "ox-jekyll-md" "\
Export current buffer as a Markdown buffer adding some YAML front matter.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY)" t nil)

(autoload 'org-jekyll-md-export-to-md "ox-jekyll-md" "\
Export current buffer to a Markdown file adding some YAML front matter.

\(fn &optional ASYNC SUBTREEP VISIBLE-ONLY)" t nil)

(autoload 'org-jekyll-md-publish-to-md "ox-jekyll-md" "\
Publish an org file to Markdown with YAML front matter.

FILENAME is the filename of the Org file to be published.  PLIST
is the property list for the given project.  PUB-DIR is the
publishing directory.

Return output file name.

\(fn PLIST FILENAME PUB-DIR)" nil nil)

(autoload 'org-jekyll-md-insert-export-options-template "ox-jekyll-md" "\
Insert a settings template for Jekyll exporter.

\(fn &optional TITLE DATE SETUPFILE CATEGORIES TAGS LAYOUT)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ox-jekyll-md" '("org-jekyll-md-")))

;;;***

(provide 'ox-jekyll-md-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ox-jekyll-md-autoloads.el ends here
