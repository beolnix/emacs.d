;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; key bindings
;;(server-start)
(global-set-key "≈" 'execute-extended-command)
;;(setq ns-function-modifier 'super)  ; make Fn key do Hyper
;;(setq mac-command-modifier 'super) ; make cmd modifier super
;;(setq ns-command-modifier 'super) ; test
;;(setq ns-right-alternate-modifier 'super)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; customisation
(defalias 'yes-or-no-p 'y-or-n-p)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; packages
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
;;(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; emacs settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("028b95ddc74a4cda16b51b04baf4007ac07a8728d5bfa58c0e738182aa7ce491" default))
 '(package-selected-packages
   '(magit git json-mode lsp-clangd lsp-ui lsp-rust company-lsp flycheck-rust cargo projectile company-c-headers company ggtags))
 '(projectile-keymap-prefix "C-c C-p"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight ultra-light :height 140 :width normal :foundry "Extra Light" :family "Input Mono"))))
 '(bold ((t (:weight semi-light :family "Input Mono"))))
 '(bold-italic ((t (:slant italic :weight semi-light :foundry "Bold Italic" :family "Input Mono"))))
 '(custom-group-subtitle ((t (:weight semi-light))))
 '(custom-variable-button ((t (:underline t :weight semi-light))))
 '(escape-glyph ((t (:foreground "#F0DFAF" :weight semi-light :foundry "Extra Light" :family "Input Mono"))))
 '(link ((t (:foreground "#F0DFAF" :underline t :weight semi-light :family "Input Mono"))))
 '(mode-line-buffer-id ((t (:foreground "#F0DFAF" :weight semi-light :family "Input Mono"))))
 '(mode-line-emphasis ((t (:weight semi-light :family "Input Mono"))))
 '(read-multiple-choice-face ((t (:inherit underline :weight semi-light :family "Input Mono"))))
 '(warning ((t (:foreground "#DFAF8F" :weight semi-light :family "Input Mono"))))
 '(widget-button ((t (:background "systemBrownColor" :foreground "labelColor" :overline nil :weight semi-light)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; look and feel
(menu-bar-mode -1) ;; disable meny
(tool-bar-mode -1) ;; disable tool bar
(toggle-scroll-bar -1) ;; disable scroll bar
(load-theme 'zenburn t) ;; load theme


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; navigation
;(require 'ggtags)
;(add-hook 'c-mode-common-hook
;          (lambda ()
;            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;              (ggtags-mode 1))))
;
;(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
;(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
;
;(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; auto completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))

;; TODO: uncomment this to add includes for c/c++
;; ((nil . ((company-clang-arguments . ("-I/home/<user>/project_root/include1/"
;;                                     "-I/home/<user>/project_root/include2/")))))

(add-to-list 'company-backends 'company-c-headers)
;; TODO: to autocomplete headers setup autocompletion paths here
;;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; coding meta info
;(require 'ede)
;(global-ede-mode)
;(projectile-global-mode)

;; (require 'semantic)
;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)
;; (semantic-mode 1)
;; (global-semantic-idle-summary-mode 1)

;;(setq projectile-keymap-prefix (kbd "C-c C-p"))
;;(define-key projectile-mode-map (kbd "C-c C-p f") 'projectile-find-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; editor

;(global-set-key (kbd "C-c w") 'whitespace-mode) ;; activate whitespace-mode to view all whitespace characters
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1))) ;; show unncessary whitespace that can mess up your diff
(setq-default indent-tabs-mode nil) ;; use space to indent by default
(setq-default tab-width 4) ;; set appearance of a tab that is represented by 4 spaces


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; rust
(with-eval-after-load 'rust-mode
      (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(setq rust-format-on-save t)
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'XXXXX-mode-hook 'flycheck-mode)

(with-eval-after-load 'lsp-mode
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  (require 'lsp-rust))
(add-hook 'rust-mode-hook #'lsp-rust-enable)
(add-hook 'rust-mode-hook #'flycheck-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; clang
(require 'cc-mode)
(with-eval-after-load 'lsp-mode
   (require 'lsp-clangd)
   (add-hook 'c-mode-hook #'lsp-clangd-c-enable)
   (add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)
   (add-hook 'objc-mode-hook #'lsp-clangd-objc-enable))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; clang
(require 'git)
