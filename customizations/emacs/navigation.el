;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; projectile everywhere!
(projectile-global-mode)
(setq projectile-indexing-method 'alien)

;; send up windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
