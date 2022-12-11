;; base init.el
;; by kgr
;; see config.org for main configuration

(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)
