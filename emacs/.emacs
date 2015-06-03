;; ------------------------------------------------------------------------------------
;; Packages
(setq package-enable-at-startup nil)
(package-initialize)

(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
 (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)

;; ------------------------------------------------------------------------------------
;; GUI Tweaks

(scroll-bar-mode 0)
(tool-bar-mode 0)

(load-theme 'flatui t)

;; setting font
(set-frame-font "PragmataPro-11" nil t)

;;Change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Startup messages
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; ------------------------------------------------------------------------------------
;; Cursor
(blink-cursor-mode 0)
(global-hl-line-mode 1)

;; ------------------------------------------------------------------------------------
;; Tabulation
(setq-default tab-width 4 indent-tabs-mode nil)

;; ------------------------------------------------------------------------------------
;; Window settings
;; switch with M-o as much as possible
(global-set-key (kbd "M-o") 'other-window)

(add-hook 'term-load-hook
    (lambda ()
      (define-key term-raw-map (kbd "M-o") 'other-window)))

(winner-mode 1)

;; ------------------------------------------------------------------------------------
;; Dired
;;(require 'dired-x)

(put 'dired-find-alternate-file 'disabled nil)

(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
 ))

;; we want dired not not make always a new buffer if visiting a directory
;; but using only one dired buffer for all directories.
(defadvice dired-advertised-find-file (around dired-subst-directory activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
        (filename (dired-get-filename)))
    ad-do-it
    (when (and (file-directory-p filename)
               (not (eq (current-buffer) orig)))
      (kill-buffer orig))))

(eval-after-load "dired"
;; don't remove `other-window', the caller expects it to be there
    '(defun dired-up-directory (&optional other-window)
       "Run Dired on parent directory of current directory."
       (interactive "P")
       (let* ((dir (dired-current-directory))
  	    (orig (current-buffer))
  	    (up (file-name-directory (directory-file-name dir))))
         (or (dired-goto-file (directory-file-name dir))
  	   ;; Only try dired-goto-subdir if buffer has more than one dir.
  	   (and (cdr dired-subdir-alist)
  		(dired-goto-subdir up))
  	   (progn
  	     (kill-buffer orig)
  	     (dired up)
  	     (dired-goto-file dir))))))

;; ------------------------------------------------------------------------------------
;; Shell
(setq tramp-default-method "ssh")
(global-set-key (kbd "C-=") 'cssh-term-remote-open)
(setq explicit-shell-file-name "/bin/bash")

;;(require 'multi-term)
(setq multi-term-program "/bin/bash")

; allow copy paste
(add-hook 'term-mode-hook (lambda ()
                            (define-key term-raw-map (kbd "C-y") 'term-paste)))

;; don't ask which shell to start
(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)


 ;; ------------------------------------------------------------------------------------
;; Buffer settings

; list buffers in other window and switch to it
(global-set-key (kbd "\C-x\C-b") 'ibuffer-other-window)
(autoload 'ibuffer "ibuffer" "List buffers." t)


;; ------------------------------------------------------------------------------------
;; Smooth scrolling
(require 'smooth-scrolling)

;; ------------------------------------------------------------------------------------
;; Improve ansi-term

;; close terminal's buffer on end
(defun oleh-term-exec-hook ()
  (let* ((buff (current-buffer))
         (proc (get-buffer-process buff)))
    (set-process-sentinel
     proc
     `(lambda (process event)
        (if (string= event "finished\n")
            (kill-buffer ,buff))))))

(add-hook 'term-exec-hook 'oleh-term-exec-hook)


;; ------------------------------------------------------------------------------------
;; Imenu
(global-set-key (kbd "M-i") 'imenu)


;; ------------------------------------------------------------------------------------
;; IDO

(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; ------------------------------------------------------------------------------------
;; Helm
(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
;; ------------------------------------------------------------------------------------
;; Change zap to char to exclude char with package zop
(global-set-key [remap zap-to-char] 'zop-to-char)

