;; show the name of the current function definition in the modeline
(require 'which-func)
(which-function-mode 1)

;; Highlight a bunch of well known comment annotations.
(font-lock-add-keywords
   nil '(("\\<\\(\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):\\)"
          1 font-lock-warning-face t)))

(provide 'hummingbird-programmer)
