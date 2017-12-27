;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; Packages to install
(setq package-selected-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; haskell-mode
    haskell-mode

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;; company-mode text completion
    company

    ;; base16-themes
    base16-theme

    ;; yaml-mode
    yaml-mode

    ;; terraform-mode
    terraform-mode

    ;; helm setup
    helm helm-projectile helm-smex helm-fuzzier helm-flx
    ))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'package-selected-packages 'exec-path-from-shell))

;; can this be automatic?
(package-install-selected-packages)


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; emacs stuff

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "emacs/shell-integration.el")

(load "emacs/ui.el")

(load "emacs/buffer-editing.el")

(load "emacs/navigation.el")

(load "emacs/misc.el")

;; languages / packages

;; editing lisps
(load "lisps-setup.el")

;; Helm
(load "helm-setup.el")

;; Langauages
(load "clojure-setup.el")
(load "javascript-setup.el")

;; tidal setup
;;(load "tidal-setup.el")