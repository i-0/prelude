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

;; smartscan emacs style *,# serch/movment commands
;; from: https://github.com/mickeynp/smart-scan
;; (global-smartscan-mode 1)
(global-set-key (kbd "C-*") 'smartscan-symbol-go-forward)
(global-set-key (kbd "C-#") 'smartscan-symbol-go-backward)
