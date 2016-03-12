# this Clojure-friendly emacs config

is a clone of [emacs-for-clojure](https://github.com/flyingmachine/emacs-for-clojure) with company-mode and a couple of minor tweaks.

## Installation

If you haven't already you will need to install [leiningen](http://leiningen.org/). Installing leiningen is easy with [brew](http://brew.sh/).

Then, navigate to your home directory & clone the repo into `~/.emacs.d`. On OSX, in the terminal write:

    $ cd ~
    $ git clone https://github.com/jwatki06/emacs.git .emacs.d


Finally add the following to your lein profile (usually found at `~/.lein/profiles.clj`).

	{:repl {:plugins [[cider/cider-nrepl "0.12.0-SNAPSHOT"]]}}

## Packages

This config will install the following packages:
  - `clojure-mode` key bindings and pretty colours for Clojure.
  - `cider` integration with a Clojure REPL and more.
  - `paredit` minor mode for structural editing of sexps, keeps parens balanced. 
  - `company` modular text completion.

`rainbow-delimiters`, `tagedit`, `magit`, `ido-ubiquitous`, `smex` & `projectile`

## TODO:
