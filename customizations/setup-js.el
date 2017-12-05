;; javascript
(add-hook 'js-mode-hook 'subword-mode)
(setq js-indent-level 4)
(setq js-switch-indent-offset 4)

;; HTML
(add-hook
 'html-mode-hook
 (lambda ()
   ;; Default indentation is usually 2 spaces, changing to 4.
   (set (make-local-variable 'sgml-basic-offset) 4)))

(add-hook 'html-mode-hook 'subword-mode)
(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))))
