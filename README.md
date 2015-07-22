# this Clojure-friendly emacs config

is a clone of [emacs-for-clojure](https://github.com/flyingmachine/emacs-for-clojure) with some of the packages updated.

## Installation

First, navigate to the home directory & clone the repo into `~/.emacs.d`. On OSX:

    $ cd ~
    $ git clone https://github.com/jwatki06/emacs.git .emacs.d


Then add the following to your lein `:user` profile (usually found at `~/.lein/profiles.clj`).

	{:user {:plugins [[cider/cider-nrepl "0.10.0-SNAPSHOT"]]
	        :dependencies [[org.clojure/tools.nrepl "0.2.10"]]}

## TODO:

1. List packages and versions
2. List "opinionated" decision
2. How to fix common problems
