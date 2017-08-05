;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

(setenv "DYLD_LIBRARY_PATH" (concat (getenv "DYLD_LIBRARY_PATH") ":/opt/intel/compilers_and_libraries/mac/mkl/lib:/opt/intel/compilers_and_libraries/mac/lib"))
