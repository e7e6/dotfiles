
;; ------------------------------------------------------------------------------------
;; Packages
(setq package-enable-at-startup nil)
(package-initialize)

;;(require 'package)
;;(push '("marmalade" . "http://marmalade-repo.org/packages/")
;;        package-archives )
;; (push '("melpa" . "http://melpa.milkbox.net/packages/")
;;        package-archives)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(package-initialize)

;; ------------------------------------------------------------------------------------
;; GUI Tweaks

(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 1)
;; (load-theme 'material-light t)

;; setting font
(set-frame-font "Iosevka-13" nil t)

;; Get rid of some [startup] messages
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; ------------------------------------------------------------------------------------
;; Cursor
(blink-cursor-mode 0)
(global-hl-line-mode 1)

(show-paren-mode t)



;; ------------------------------------------------------------------------------------
;; Tabulation
;; (setq-default tab-width 4 indent-tabs-mode nil)

;; ------------------------------------------------------------------------------------
;; Window settings
;; switch with M-o as much as possible
(global-set-key (kbd "M-o") 'other-window)

(add-hook 'term-load-hook
    (lambda ()
      (define-key term-raw-map (kbd "M-o") 'other-window)))

;; (winner-mode 1)

;; ------------------------------------------------------------------------------------
;; Dired
;;(require 'dired-x)




;; (put 'dired-find-alternate-file 'disabled nil)
;; 
;; (add-hook 'dired-mode-hook
;;  (lambda ()
;;   (define-key dired-mode-map (kbd "^")
;;     (lambda () (interactive) (find-alternate-file "..")))
;;   ; was dired-up-directory
;;  ))

;; ;; we want dired not not make always a new buffer if visiting a directory
;; ;; but using only one dired buffer for all directories.
;; (defadvice dired-advertised-find-file (around dired-subst-directory activate)
;;   "Replace current buffer if file is a directory."
;;   (interactive)
;;   (let ((orig (current-buffer))
;;         (filename (dired-get-filename)))
;;     ad-do-it
;;     (when (and (file-directory-p filename)
;;                (not (eq (current-buffer) orig)))
;;       (kill-buffer orig))))
;; 
;; (eval-after-load "dired"
;; ;; don't remove `other-window', the caller expects it to be there
;;     '(defun dired-up-directory (&optional other-window)
;;        "Run Dired on parent directory of current directory."
;;        (interactive "P")
;;        (let* ((dir (dired-current-directory))
;;   	    (orig (current-buffer))
;;   	    (up (file-name-directory (directory-file-name dir))))
;;          (or (dired-goto-file (directory-file-name dir))
;;   	   ;; Only try dired-goto-subdir if buffer has more than one dir.
;;   	   (and (cdr dired-subdir-alist)
;;   		(dired-goto-subdir up))
;;   	   (progn
;;   	     (kill-buffer orig)
;;   	     (dired up)
;;   	     (dired-goto-file dir))))))

;; disable omit mode, so we can keep on switching with M-o
 (setq dired-omit-mode nil)

;; sort directory before
;;(require 'dired-sort-map)
;;(setq dired-listing-switches "--group-directories-first -alh")


;; ------------------------------------------------------------------------------------
;; Shell

;; (setq tramp-default-method "ssh")
;; (global-set-key (kbd "C-=") 'cssh-term-remote-open)
;; 
;; (setq explicit-shell-file-name "/bin/zsh")
;; 
;; ;;(require 'multi-term)
;; (setq multi-term-program "/bin/zsh")
;; 
;; ; allow copy paste
;; (add-hook 'term-mode-hook (lambda ()
;;                             (define-key term-raw-map (kbd "C-y") 'term-paste)))
;; 
;; ;; don't ask which shell to start
;; (defvar my-term-shell "/bin/zsh")
;; (defadvice ansi-term (before force-bash)
;;   (interactive (list my-term-shell)))
;; (ad-activate 'ansi-term)


 ;; ------------------------------------------------------------------------------------
;; Buffer settings

; list buffers in other window and switch to it
(global-set-key (kbd "\C-x\C-b") 'ibuffer-other-window)
(autoload 'ibuffer "ibuffer" "List buffers." t)


;; ------------------------------------------------------------------------------------
;; Smooth scrolling
;; (require 'smooth-scrolling)

;; ------------------------------------------------------------------------------------
;; Improve ansi-term

;; ;; close terminal's buffer on end
;; (defun oleh-term-exec-hook ()
;;   (let* ((buff (current-buffer))
;;          (proc (get-buffer-process buff)))
;;     (set-process-sentinel
;;      proc
;;      `(lambda (process event)
;;         (if (string= event "finished\n")
;;             (kill-buffer ,buff))))))
;; 
;; (add-hook 'term-exec-hook 'oleh-term-exec-hook)

;; unlimited scrooling
(setq term-buffer-maximum-size 0) 

;; ------------------------------------------------------------------------------------
;; Imenu
(global-set-key (kbd "M-i") 'imenu)


;; ------------------------------------------------------------------------------------
;; IDO

(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; Don't ask for confirmation to create a new buffer
(setq ido-create-new-buffer 'always)

;; ------------------------------------------------------------------------------------
;; Helm

;; (require 'helm-config)
;; (helm-mode 1)
;; 
;; (global-set-key (kbd "M-x") 'helm-M-x)
;; ------------------------------------------------------------------------------------
;; Change zap to char to exclude char with package zop
;; (global-set-key [remap zap-to-char] 'zop-to-char)

;; ------------------------------------------------------------------------------------
;; pdf viewing

;;(pdf-tools-install)

;; ------------------------------------------------------------------------------------
;; Org

(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/Documents/Notes/refile.org")
(setq org-directory "~/Documents/Notes")

;; have the main org file easily accessible
(global-set-key (kbd "C-c o") 
                (lambda () (interactive) (find-file "~/Documents/Notes/refile.org")))

;; using org-refile and change the default depth
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

;; use ido with org
(setq org-completion-use-ido t)

;; ;;Execute sql commands from org-mode
;; (require 'sql)
;; (require 'ob-sql)
;; (require 'shell)
;; 
;; 
;; (require 'org-bullets)
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; 
;; (require 'sql)
;; (require 'ob-sql)
;; (require 'ob-sh)
;; 
;; ;;(require 'evil-org)

;; ------------------------------------------------------------------------------------
;; Powerline 

;;(require 'powerline)
;;(powerline-default-theme)
;;(powerline-evil-vim-color-theme)
;;(display-time-mode t)

;; ------------------------------------------------------------------------------------
;; Window management

;;(eyebrowse-mode t)
;;(eyebrowse-setup-opinionated-keys)

;; ------------------------------------------------------------------------------------
;; Special file types

;; markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))



;; ------------------------------------------------------------------------------------
;; Backups and autosave

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;------------------------------------------------------------------------------------
;; Encoding

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;;------------------------------------------------------------------------------------
;; Enable vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )
;; optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))



;;------------------------------------------------------------------------------------
;; marginalia

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))  
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be actived in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

;;------------------------------------------------------------------------------------
;; others
;; show the keybindings after 1s
(which-key-mode)
;; focused writing with olivetti, centering text
;; TODO: get rid of fringes and more
(require 'olivetti)
(use-package olivetti
  :ensure
  :defer
  :diminish
  :config
  (setq olivetti-body-width 0.65)
  (setq olivetti-minimum-body-width 72)
  (setq olivetti-recall-visual-line-mode-entry-state t))

  
;; hide the icons that pop up in the title bar
(setq ns-use-proxy-icon nil)
(set-fringe-mode 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(olivetti-body-width 100)
 '(package-selected-packages
   '(magit olivetti which-key orderless use-package marginalia vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
