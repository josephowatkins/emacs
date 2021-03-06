;;;;
;; Helm
;;;;

;; initialize helm (+ extras)
(require 'helm-config)
(helm-mode 1)
(setq helm-mode-fuzzy-match t)

(helm-flx-mode +1)
(helm-fuzzier-mode 1)

;; enable helm-flx
(setq helm-flx-for-helm-find-files t ;; t by default
      helm-flx-for-helm-locate t) ;; nil by default

;; Set up key bindings
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(global-set-key [remap execute-extended-command] #'helm-smex)
(global-set-key (kbd "M-X") #'helm-smex-major-mode-commands)

;; (setq helm-projectile-fuzzy-match nil)
(helm-projectile-on)

;; Make helm behave more like ido - WIP
;; https://github.com/compunaut/helm-ido-like-guide

(defun helm-ido-like-load-ido-like-bottom-buffer ()
  ;; popup helm-buffer at the bottom
  (setq helm-split-window-in-side-p t)
  (add-to-list 'display-buffer-alist
               '("\\`\\*helm.*\\*\\'"
                 (display-buffer-in-side-window)
                 (window-height . 0.4)))
  (add-to-list 'display-buffer-alist
               '("\\`\\*helm help\\*\\'"
                 (display-buffer-pop-up-window)))

  ;; dont display the header line
  (setq helm-display-header-line nil)
  ;; input in header line
  (setq helm-echo-input-in-header-line t)
  (add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe))

(helm-ido-like-load-ido-like-bottom-buffer)

;; remove the helm modeline
(defun helm-ido-like-hide-helm-modeline-1 ()
  "Hide mode line in `helm-buffer'."
  (with-helm-buffer
    (setq-local mode-line-format nil)))

(defun helm-ido-like-hide-helm-modeline ()
  (fset 'helm-display-mode-line #'ignore)
  (add-hook 'helm-after-initialize-hook 'helm-ido-like-hide-helm-modeline-1))

(helm-ido-like-hide-helm-modeline)

;; file navigation like ido
(defun helm-ido-like-find-files-up-one-level-maybe ()
  (interactive)
  (if (looking-back "/" 1)
    (call-interactively 'helm-find-files-up-one-level)
    (delete-char -1)))

(defun helm-ido-like-find-files-navigate-forward (orig-fun &rest args)
  "Adjust how helm-execute-persistent actions behaves, depending on context."
  (let ((sel (helm-get-selection)))
    (if (file-directory-p sel)
        ;; the current dir needs to work to
        ;; be able to select directories if needed
        (cond ((and (stringp sel)
                    (string-match "\\.\\'" (helm-get-selection)))
               (helm-maybe-exit-minibuffer))
              (t
               (apply orig-fun args)))
      (helm-maybe-exit-minibuffer))))

(defun helm-ido-like-load-file-nav ()
  (advice-add 'helm-execute-persistent-action :around #'helm-ido-like-find-files-navigate-forward)
  ;; <return> is not bound in helm-map by default
  (define-key helm-map (kbd "<return>") 'helm-maybe-exit-minibuffer)
  (with-eval-after-load 'helm-files
    (define-key helm-read-file-map (kbd "<backspace>") 'helm-ido-like-find-files-up-one-level-maybe)
    (define-key helm-read-file-map (kbd "DEL") 'helm-ido-like-find-files-up-one-level-maybe)
    (define-key helm-find-files-map (kbd "<backspace>") 'helm-ido-like-find-files-up-one-level-maybe)
    (define-key helm-find-files-map (kbd "DEL") 'helm-ido-like-find-files-up-one-level-maybe)

    (define-key helm-find-files-map (kbd "<return>") 'helm-execute-persistent-action)
    (define-key helm-read-file-map (kbd "<return>") 'helm-execute-persistent-action)
    (define-key helm-find-files-map (kbd "RET") 'helm-execute-persistent-action)
    (define-key helm-read-file-map (kbd "RET") 'helm-execute-persistent-action)))

(helm-ido-like-load-file-nav)