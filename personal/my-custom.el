;; Add hotkeys to change font size in the fly
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; set default font
(custom-set-faces
 '(default ((t (
                :family "Envy Code R"
                :foundry "unknown"
                :slant normal
                :weight normal
                :height 182
                :width normal)))))


;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Fixes mouse wheel scrolling for macOS/OS X
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; tune magit to auto pull new branches from origin
(setq magit-visit-ref-behavior '(checkout-any focus-on-ref))

;; disable highlighting of lines longer than 80 chars
(setq whitespace-style '(face empty tabs trailing))

;; expand-region from: http://emacsrocks.com/e09.html
(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)

;; add additional packages to prelude-packages to be installed
(setq my-packages '(smartscan clj-refactor))
(prelude-require-packages my-packages)

;; smartscan emacs style *,# serch/movment commands
;; from: https://github.com/mickeynp/smart-scan
;; (global-smartscan-mode 1) ;; Warning this may break stuff, specially M-p in REPLs, Shells
;(global-set-key (kbd "C-*") 'smartscan-symbol-go-forward)
;(global-set-key (kbd "C-#") 'smartscan-symbol-go-backward)

;; same as smartscan trying to emulate */# movements, but working nice!
(require 'highlight-symbol)
(global-set-key (kbd "M-*") 'highlight-symbol)
(global-set-key (kbd "C-*") 'highlight-symbol-next)
(global-set-key (kbd "C-#") 'highlight-symbol-prev)
;;(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; clj-refactor from:https://github.com/clojure-emacs/clj-refactor.el
(require 'clj-refactor)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(require 'cljr-helm)

;; fix word behaviour
(require 'misc)
(global-set-key (kbd "M-f") 'forward-to-word)
(global-set-key (kbd "M-n") 'forward-word)
(global-set-key (kbd "M-p") 'backward-to-word)
