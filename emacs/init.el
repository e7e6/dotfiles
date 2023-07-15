
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
;; 
(setq use-short-answers t)

;; backups
(setq make-backup-files nil)
(setq backup-inhibited nil)

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

(setq dired-auto-revert-buffer t)

;; to emulate midnite commander when using two dired windows
;;(setq dired-dwim-target next) 

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

;; hide details. Toggle with '('
;;(add-hook 'dired-mode-hook #'dired-hide-details-mode)

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

;;(ido-mode 1)
;;(setq ido-everywhere t)
;;(setq ido-enable-flex-matching t)

;; Don't ask for confirmation to create a new buffer
;;(setq ido-create-new-buffer 'always)

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


(setq org-default-notes-file "~/Documents/Notes/inbox.org")
(setq org-directory "~/Documents/Notes")
(setq org-agenda-files  '("inbox.org" "gtd.org" "resources.org" "meetings.org"))


;; have the main org file easily accessible
(global-set-key (kbd "C-c o") 
                (lambda () (interactive) (find-file "~/Documents/Notes/inbox.org")))

;; using org-refile and change the default depth
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

;; use ido with org
;;(setq org-completion-use-ido t)

;; put notes by default at the top instead of at the end
(setq org-reverse-note-order t)

;;(setq org-todo-keywords
;;      '((sequence "TODO" "WAITING" "|" "DONE" "CANCELED")))
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w!)" "SOMEDAY(s)" "PROJECT(p)" "|" "DONE(d!)" "CANCELED(c@)")))

;(setq org-agenda-files (directory-files-recursively "~/Documents/Notes/" "\\.org$"))

(setq org-startup-indented t
;;      org-pretty-entities t 
      org-hide-emphasis-markers t
      org-agenda-start-on-weekday 1  ;; start the week on monday
      org-agenda-window-setup 'other-window ;; prevent default frame reorganization
      org-startup-with-inline-images t
      org-image-actual-width '(400))

;; let's use visual lines 
(add-hook 'org-mode-hook 'visual-line-mode)

;; org-capture settings
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

;; use speed commands - available at the start of the line
(setq org-use-speed-commands t)

(setq org-capture-templates
      `(("t" "Simple task" entry
         (file+headline org-default-notes-file "Tasks")
         "* TODO %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n"
         :prepend t)
	("m" "Meeting" entry
         (file+datetree "meetings.org")
         "* %^{Meeting name} %^G\n\nDate: %T \n\nParticipants: \n- \n- \n\n** Agenda: \n\n\n\n** Discussion\n\n\n\n** Actions")
        ("q" "Quick note" item
         (file+headline org-default-notes-file "Quick notes"))
 ("c" "Contacts" entry (file "contacts.org")
         "* %(org-contacts-template-name)
:PROPERTIES:
:EMAIL: %(org-contacts-template-email)
:PHONE:
:SOCIALNETWORK:
:COMPANY:
:NOTE:
:ADDRESS:
:BIRTHDAY:
:CREATED: %U
:END:")
	))

;; prettify the fonts to have mixed case

;;(add-hook 'org-mode-hook 'variable-pitch-mode)
;;    mac-ct:-*-Iosevka-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1 (#x56)
;;    mac-ct:-*-Helvetica-normal-normal-normal-*-13-*-*-*-p-0-iso10646-1 (#x51) variable pitch


;; (set-face-attribute 'default nil :font "Iosevka-13")
;; (set-face-attribute 'fixed-pitch nil :font "Iosevka-13")
;; (set-face-attribute 'variable-pitch nil :font "Helvetica-14")
;; 
;; (dolist (face '(default fixed-pitch))
;;   (set-face-attribute `,face nil :font "Iosevka-13"))

;;
;;Execute sql commands from org-mode
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
;; corfu completion popup
(use-package corfu
  ;; Optional customizations
   :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  (corfu-popupinfo-delay '(0.5 . 0.2))
  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-exclude-modes'.
  :init
  (global-corfu-mode)) 


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

(setq bookmark-save-flag 1)
(setq sentence-end-double-space nil)

;; delete text when selected and typing in
(setq delete-selection-mode t)

;; hide the icons that pop up in the title bar
(setq ns-use-proxy-icon nil)
(set-fringe-mode 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes
   '(gruvbox-light-hard gruvbox-dark-soft gruvbox-dark-hard gruvbox-light-soft zenburn ef-winter ef-symbiosis ef-bio ef-day ef-deuteranopia-light ef-duo-dark ef-duo-light ef-frost ef-kassio spacemacs-light ef-light modus-vivendi))
 '(custom-safe-themes
   '("ba323a013c25b355eb9a0550541573d535831c557674c8d59b9ac6aa720c21d3" "98ef36d4487bf5e816f89b1b1240d45755ec382c7029302f36ca6626faf44bbd" "a5270d86fac30303c5910be7403467662d7601b821af2ff0c4eb181153ebfc0a" "871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8" "046a2b81d13afddae309930ef85d458c4f5d278a69448e5a5261a5c78598e012" "d445c7b530713eac282ecdeea07a8fa59692c83045bf84dd112dd738c7bcad1d" "f5f3921b9cec1b37758ba865127d773f8f5e4816e63712af7582b447acfa5326" "41bbaed6a17405ee6929c7e1f8035cffd05d0ebf3f08ce388da0e92c63fb6cef" "02790c735d32ad3b28c630329fdfc503ea62077d088b0c52302ab61e5a3b037e" "aee4c6b492ad130f13868464e4d7f2b2846de9b7f0d2933499c907f47dc010f4" "032426ec19e515fd3a54b38016a1c5e4ec066be3230198cb3df82d05630a02ed" "d47e82e61cffed27dd2aef3b614f6dd727776f6bcb92e738e89056b325a5aeab" "5ccda8419d11dec4afc7d5afc71de75e76f2d0ce6e845bf6831582c67ee79086" "f126b518f12b4f6bd50808143f7bd26c1d47de25d90170d3d632a46c2a08a1af" "471b78fcfb7a535680b1a9773870d1525389fd2c5559d5707940d0ecc181eb69" "2141b59c9b098b476a7e20f7a621985b5d89544ae22a8d4b79b574f1203b6496" "1781e8bccbd8869472c09b744899ff4174d23e4f7517b8a6c721100288311fa5" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "68b35e92f9daa37685218bd11aa5307140a0ec4c8fd17142a83457619e7b1240" "13f343f7d098365848ba4366801a9ae91c35faea85b017818fd4d07dfd18de61" "e5a748cbefd483b74b183d7da4fca6228207a6bf9be9792dc85403a186724e1f" "e0aaf54e0194bd9f452ae36f0012b23d3f82d2092e2b800cc07e0e73f4ac131f" "d13b6ae136b853bc69c036009b6290f546e6c9c7ad026f60b0ce2a4f9a943d5f" "8294b451ffe0575fcccd1a447f56efc94d9560787cd5ff105e620e5f5771427d" "910b36cacb8486580842582661ab2f16d8e05e6ec081dcaa141e0ca98ee5e9c2" "c6b317b294f9e0ecf7290a6d76b4c96ffd52213cdcb3fdad5db29141c63866cf" "20d3ce5f5cb95716edca608ef7bbc27d9f8d66c9a51200f7be3f08c107810f3e" "49887e6f0c666dfc10fad4c23c7a83a176cb296968648c02b85deec25bb11103" "c06aa0ddb649e4e45f36dd95de98263672864074373937e65a23c8338f52c6af" "bcfeecf5f2ee0bbc64450f7c5155145d8d2c590b1310a898c505f48b4b5f4c75" "de8f2d8b64627535871495d6fe65b7d0070c4a1eb51550ce258cd240ff9394b0" "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "eab123a5ed21463c780e17fc44f9ffc3e501655b966729a2d5a2072832abd3ac" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default))
 '(olivetti-body-width 120)
 '(package-selected-packages
   '(docker gruvbox-theme org-contacts ef-themes csv-mode nano-theme corfu markdown-mode spacemacs-theme color-theme-sanityinc-tomorrow zenburn-theme magit olivetti which-key orderless use-package marginalia vertico)))


;;   (custom-set-variables
;;    ;; custom-set-variables was added by Custom.
;;    ;; If you edit it by hand, you could mess it up, so be careful.
;;    ;; Your init file should contain only one such instance.
;;    ;; If there is more than one, they won't work right.
;;    '(custom-enabled-themes '(modus-operandi))
;;    '(custom-safe-themes
;;      '("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "eab123a5ed21463c780e17fc44f9ffc3e501655b966729a2d5a2072832abd3ac" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default))
;;    '(modus-themes-italic-constructs t)
;;    '(modus-themes-links '(neutral-underline))
;;    '(modus-themes-mixed-fonts t)
;;    '(modus-themes-org-agenda
;;      '((header-block variable-pitch 1.6)
;;        (header-date bold-today)
;;        (scheduled . rainbow)))
;;    '(modus-themes-org-blocks 'gray-background)
;;    '(modus-themes-vivendi-color-overrides
;;      '((bg-main . "#24242d")
;;        (bg-inactive . "#2f2f3b")
;;        (bg-hl-line . "#2f2f3b")))
;;    '(olivetti-body-width 120)
;;    '(package-selected-packages
;;      '(spacemacs-theme color-theme-sanityinc-tomorrow zenburn-theme magit olivetti which-key orderless use-package marginalia vertico)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)


;; disable all bell and visual errors
;; (setq ring-bell-function 'ignore)





;;-----------------------------------------------------------------------------------------------------------
;; taken from https://www.reddit.com/r/emacs/comments/us8fx2/change_setfaceattribute_for_a_specific_theme/

    
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      modus-themes-variable-pitch-ui t
      modus-themes-mixed-fonts t)


(setq modus-themes-mode-line '(borderless)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-fringes 'subtle
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-prompts '(bold intense)
      modus-themes-completions 'opinionated
      modus-themes-org-blocks 'tinted-background
      modus-themes-scale-headings t
      modus-themes-region '(bg-only)
      ;;modus-themes-headings
      ;;'((1 . (rainbow overline background 1.4))
      ;;  (2 . (rainbow background 1.3))
      ;;  (3 . (rainbow bold 1.2))
      ;;  (t . (semilight 1.1)))
      )


;;(customize-set-variable
;; 'modus-themes-common-palette-overrides
;; `(
;;   ;; Make the mode-line borderless and stand out less
;;   (bg-mode-line-active bg-inactive)
;;   (fg-mode-line-active fg-main)
;;   (bg-mode-line-inactive bg-inactive)
;;   (fg-mode-line-active fg-dim)
;;   (border-mode-line-active bg-main)
;;   (border-mode-line-inactive bg-inactive)
;;
;;   ;; Inherit rest from faint style
;;;;   ,@modus-themes-preset-overrides-faint))
;;))

(defun disable-current-themes nil
  "Disables all currently enabled themes."
  (interactive)
  (if custom-enabled-themes
    (mapcar 'disable-theme custom-enabled-themes)))

(defun load-custom-modus-vivendi nil
;;   (custom-set-variables
;;    '(modus-themes-mode-line '(accented borderless))
;;    '(modus-themes-syntax '(yellow-comments faint)))
  (disable-current-themes)
  (modus-themes-load-vivendi))

(defun load-custom-modus-operandi nil
;;   (custom-set-variables
;;    '(modus-themes-mode-line nil)
;;    '(modus-themes-syntax nil))
  (disable-current-themes)
  (modus-themes-load-operandi))


;; have mouse3 instead of mouse2 for flycheck errors
;; (eval-after-load "flyspell"
;;     '(progn
;;        (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
;;        (define-key flyspell-mouse-map [mouse-3] #'undefined)))
