;*******************************************************************************;
;                                                                               ;
;                                                          :::      ::::::::    ;
;    dotemacs                                            :+:      :+:    :+:    ;
;                                                      +:+ +:+         +:+      ;
;    by: thor <thor@42.fr>                           +#+  +:+       +#+         ;
;                                                  +#+#+#+#+#+   +#+            ;
;    Created: 2013/06/18 14:01:14 by thor               #+#    #+#              ;
;    Updated: 2015/06/15 14:40:21 by mle-roy          ###   ########.fr        ;
;                                                                               ;
;*******************************************************************************;

; Load general features files
;; (setq config_files "/usr/share/emacs/site-lisp/")
;; (setq load-path (append (list nil config_files) load-path))

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; (load "list.el")
;; (load "string.el")
;; (load "comments.el")
;; (load "header.el")

;active ibuffer qui permet de switcher plus facilement entre les buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;plus de couleurs pour js
;;	URL: https://github.com/mooz/js2-mode.git
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;couleurs pour les fichiers yml
;; Author: Yoshiki Kurihara <clouder@gmail.com>
;;         Marshall T. Vandegrift <llasram@gmail.com>
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
;(add-hook 'yaml-mode-hook)
;          '(lambda () (define-key yaml-modemap "\C-m" 'newline-and-indent))

;;chargement du php mode
;;; Author: Eric James Michael Ritz
;;; URL: https://github.com/ejmr/php-mode
(require 'php-mode)

;;chargement du mode smooth-scrolling
;; Author: Adam Spiers <emacs-ss@adamspiers.org>, Jeremy Bondeson <jbondeson@gmail.com>
;; URL: http://github.com/aspiers/smooth-scrolling/
(require 'smooth-scrolling)
(setq smooth-scrool-margin 5)

;;chargement du python mode
;; URL: https://launchpad.net/python-mode
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;tuareg mode for ocaml
;;URL : https://github.com/ocaml/tuareg

(add-to-list 'load-path "~/.emacs.d/lisp/tuareg-mode")
    (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
    (autoload 'camldebug "camldebug" "Run the Caml debugger" t)
    (autoload 'tuareg-imenu-set-imenu "tuareg-imenu"
      "Configuration of imenu for tuareg" t)
    (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
    (setq auto-mode-alist
        (append '(("\\.ml[ily]?$" . tuareg-mode)
	          ("\\.topml$" . tuareg-mode))
                  auto-mode-alist))

;; mode for Go language
;;URL: https://github.com/dominikh/go-mode.el
(require 'go-mode-autoloads)


; Set default emacs configuration
(set-language-environment "UTF-8")
(setq-default font-lock-global-modes nil)
(setq-default line-number-mode nil)
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(global-set-key (kbd "DEL") 'backward-delete-char)
(setq-default c-backspace-function 'backward-delete-char)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                             64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

(setq-default font-lock-global-modes t)   ;;fait marcher les couleurs
(setq-default font-lock-maximum-decoration t)   ;;encore plus de couleur
;;modifie la couleur des commentaires
(custom-set-faces
   '(font-lock-comment-face ((t (:blod nil :foreground "red"))) t)
)
;;couleur du curseur blanc
(set-cursor-color "#ffffff")

(column-number-mode t)       ;;affiche les numeros de ligne
(global-font-lock-mode t)    ;;affiche les couleurs doublon ?
(transient-mark-mode t)      ;;region selectionne en surbrillance

;(setq paren-dont-touch-blink t)
;(require 'mic-paren)
;(paren-activate)
;(setq paren-match-face 'highlight)
;(setq paren-sexp-mode t)

(require 'paren)             ;;affiche la paranthese correspondante
(show-paren-mode t)


;(defadvice show-paren-function
;  (after show-matching-paren-offscreen activate)
;	"If the matching paren is offscreen, show the matching line in the
;    echo area. Has no effect if the character before point is not of
;    the syntax class ')'."
;	(interactive)
;	(let* ((cb (char-before (point)))
;			(matching text (and cb
;									(char-equal (char-syntax cb) ?\) )
;									(blink-matching-open))))
;			(when matching-text (message matching-text))))

(column-number-mode 1)       ;;affiche les numeros de ligne sur une colonne
(line-number-mode 1)
(global-set-key (kbd "TAB") 'self-insert-command)   ;;fait marcher tab
(require 'linum)             ;;affiche les lignes
(global-linum-mode 1)


(add-hook 'html-mode-hook
  (lambda ()
  ;; Default indentation is usually 2 spaces, changing to 4.
	(set (make-local-variable 'sgml-basic-offset) 4)))

;; Raccourcis
(global-set-key "\M-g" 'goto-line)
;(global-set-key "C-<home>" "\M-<")
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>") "\M->")
(global-set-key (kbd "<f5>") 'goto-line)
(global-set-key (kbd "<f6>") 'indent-region)
(global-set-key (kbd "<f7>") 'save-buffer)
(global-set-key (kbd "<f8>") 'save-buffers-kill-emacs)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

; make characters after column 80 purple
;;(setq whitespace-style
;;  (quote (face trailing tab-mark lines-tail)))
;;(add-hook 'find-file-hook 'whitespace-mode)
;;(setq whitespace-style 'whitespace-line-column 80)
;;(setq whitespace-style 'lines-tail)


;; Rajoute des paranthese correspondante
;;(setq skeleton-pair t)
;;(setq skeleton-pair-on-word t)
;;(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;;(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)

;; show-trailing-whitespace
(setq show-trailing-whitespace t)
(setq-default show-trailing-whitespace t)

;; nuke trailing whitespaces when writing to a file
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; ajout un time stamp dans les fichier si "Time-stamp: <>" est écris dans les 8 premières lignes du fichier
(add-hook 'write-file-hooks 'time-stamp)

; Load user configuration
(if (file-exists-p "~/.myemacs") (load-file "~/.myemacs"))



;*******************************************************************************;
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;; ouvre les fichiers de systemd avec les bonnes couleurs
(add-to-list 'auto-mode-alist '("\\.service\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.timer\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.target\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.mount\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.automount\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.slice\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.socket\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.path\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.netdev\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.network\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.link\\'" . conf-unix-mode))
(add-to-list 'auto-mode-alist '("\\.automount\\'" . conf-unix-mode))
