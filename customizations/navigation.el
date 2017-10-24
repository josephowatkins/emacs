;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;; http://www.emacswiki.org/emacs/Smex
; (setq smex-save-file (concat user-emacs-directory ".smex-items"))
; (smex-initialize)
; (global-set-key (kbd "M-x") 'smex)

;; projectile everywhere!
(projectile-global-mode)
(setq projectile-indexing-method 'alien)

;; send up windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
