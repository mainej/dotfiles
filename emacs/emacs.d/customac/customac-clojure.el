(customac-ensure-packages '(rainbow-delimiters ac-cider clojure-mode smartparens clj-refactor))
(require 'rainbow-delimiters)
(require 'ac-cider)
(require 'clojure-mode)
(require 'smartparens-config)
(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-v")))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "λ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\){"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∈")
                               nil))))))

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-log-messages t)
(setq nrepl-hide-special-buffers nil)
(setq cider-prefer-local-resources t)

(smartparens-global-mode t)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(defun cider-run-all-tests ()
  "Runs all tests in a project. Assumes in a namespace that has run-all-tests."
  (interactive)
  (cider-tooling-eval
   "(require 'clojure.test) (clojure.test/run-all-tests)"
   (cider-interactive-eval-handler (current-buffer))))

(defun cider-reset-system ()
  "Calls (reset) in a project. Assumes a user namespace that has reset."
  (interactive)
  (cider-tooling-eval
   "(require 'user)(user/reset)"
   (cider-interactive-eval-handler (current-buffer))))

(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(provide 'customac-clojure)
