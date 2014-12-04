(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-mode nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" "f26516b49be03923e82549bd00c5075b9d4cb214b88100ca94aea95cbc4afd44" default)))
 '(doc-view-resolution 300)
 '(ergoemacs-ctl-c-or-ctl-x-delay 0.2)
 '(ergoemacs-handle-ctl-c-or-ctl-x (quote both))
 '(ergoemacs-ini-mode t)
 '(ergoemacs-keyboard-layout "bepo")
 '(ergoemacs-mode nil)
 '(ergoemacs-smart-paste nil)
 '(ergoemacs-theme "standard")
 '(ergoemacs-theme-options nil)
 '(ergoemacs-use-menus t)
 '(fci-rule-color "#eee8d5")
 '(global-linum-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors (--map (solarized-color-blend it "#fdf6e3" 0.25) (quote ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors (quote (("#eee8d5" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#69B7F0" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#eee8d5" . 100))))
 '(ido-enable-flex-matching t)
 '(inhibit-startup-echo-area-message t)
 '(initial-scratch-message "")
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode t)
 '(org-CUA-compatible nil)
 '(org-special-ctrl-a/e nil)
 '(org-support-shift-select nil)
 '(scroll-error-top-bottom nil)
 '(set-mark-command-repeat-pop nil)
 '(shift-select-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#dc322f") (40 . "#c85d17") (60 . "#be730b") (80 . "#b58900") (100 . "#a58e00") (120 . "#9d9100") (140 . "#959300") (160 . "#8d9600") (180 . "#859900") (200 . "#669b32") (220 . "#579d4c") (240 . "#489e65") (260 . "#399f7e") (280 . "#2aa198") (300 . "#2898af") (320 . "#2793ba") (340 . "#268fc6") (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (quote (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

;; ------------------------------------------------------------------------------------
;; Startup messages

(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message "e7e6")

;;(setq warning-minimum-level 'error)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


;; ------------------------------------------------------------------------------------
;; GUI Tweaks

(scroll-bar-mode 0)
(tool-bar-mode 0)


;(require 'powerline)


;; ------------------------------------------------------------------------------------
;; Files settings

;; put backup files in emacs directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(require 'cssh)

(add-to-list 'load-path "~/.emacs.d/vendor/")

;;Change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; ------------------------------------------------------------------------------------
;; Window settings


;; ------------------------------------------------------------------------------------
;; Shell

;;(setenv "PAGER" "/bin/cat")



;; ------------------------------------------------------------------------------------
;; Buffer settings

; list buffers in other window and switch to it
(global-set-key (kbd "\C-x\C-b") 'buffer-menu-other-window)


;; ------------------------------------------------------------------------------------
;; IDO

;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

 (defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
  (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
  (defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
    (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
  (add-hook 'ido-setup-hook 'ido-define-keys)

;; ------------------------------------------------------------------------------------
;; Tramp settings

(setq tramp-default-method "ssh")


;; ------------------------------------------------------------------------------------
;; Perl settings
(defalias 'perl-mode 'cperl-mode)


;; ------------------------------------------------------------------------------------
;; SQL Settings


;; ------------------------------------------------------------------------------------
;; Buffer switching

(require 'iflipb)
 (global-set-key (kbd "<C-tab>") 'iflipb-next-buffer)
(global-set-key
   (if (featurep 'xemacs) (kbd "<C-iso-left-tab>") (kbd "<C-S-iso-lefttab>"))
   'iflipb-previous-buffer)

(setq iflipb-wrap-around 1)

(define-key org-mode-map (kbd "<C-tab>") 'iflipb-next-buffer)

;;------------------------------------------------------------------------------------
;; Auto complete

(require 'auto-complete-config)
(ac-config-default)
