(package-initialize)

(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'arduino-mode)
;;(require 'flycheck-arduino)
;;(add-hook 'arduino-mode-hook 'flycheck-arduino-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(column-number-mode t)
 '(cperl-clobber-lisp-bindings t)
 '(cperl-close-paren-offset -2)
 '(cperl-electric-keywords t)
 '(cperl-font-lock t)
 '(cperl-highlight-variables-indiscriminately t)
 '(cperl-indent-parens-as-block t)
 '(cperl-lazy-help-time 5)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(default-frame-alist (quote ((width . 125) (top . 170) (left . 646) (height . 50))))
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(global-flycheck-mode t nil (flycheck))
 '(global-linum-mode t)
 '(global-whitespace-mode t)
 '(ido-auto-merge-work-directories-length 3)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-filename-at-point (quote guess))
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries (quote right))
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(perl-continued-statement-offset 2)
 '(perl-indent-level 2)
 '(perl-tab-to-comment t)
 '(require-final-newline (quote ask))
 '(show-paren-mode t)
 '(show-paren-ring-bell-on-mismatch t)
 '(show-paren-style (quote expression))
 '(size-indication-mode t)
 '(standard-indent 2)
 '(tab-always-indent (quote complete))
 '(tool-bar-mode nil)
 '(whitespace-line-column 100)
 '(whitespace-style (quote (face tabs trailing lines space-before-tab newline empty space-after-tab tab-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "ivory" :weight normal :height 140 :family "Monaco"))))
 '(cperl-array-face ((t (:foreground "#ffff77"))))
 '(cperl-hash-face ((t (:foreground "tan"))))
 '(font-lock-comment-face ((t (:foreground "khaki4"))))
 '(font-lock-function-name-face ((t (:foreground "blue"))))
 '(font-lock-string-face ((t (:foreground "yellow green"))))
 '(font-lock-variable-name-face ((t (:foreground "lightblue"))))
 '(hl-line ((t (:background "#210"))))
 '(show-paren-match ((t (:background "darkblue"))))
 '(whitespace-empty ((t (:background "#1E2022"))))
 '(whitespace-line ((t (:foreground "tomato2"))))
 '(whitespace-tab ((t (:foreground "firebrick")))))

(defalias 'perl-mode 'cperl-mode)

(ido-mode 1)

;; This fixes line numbering to have a space after the number, but
;; still be right-justified
(defvar my-linum-format-string "%4d ")
(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)
(defun my-linum-get-format-string ()
  (let* ((width (length (number-to-string
                         (count-lines (point-min) (point-max)))))
         (format (concat "%" (number-to-string width) "d ")))
    (setq my-linum-format-string format)))
(setq linum-format 'my-linum-format)
(defun my-linum-format (line-number)
  (propertize (format my-linum-format-string line-number) 'face 'linum))

;;(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))
(add-hook 'arduino-mode-hook (lambda ()
                           (setq tab-width 4)
                           (setq c-basic-offset 4)
                           (auto-fill-mode)
                           (c-toggle-auto-hungry-state 1)
                           ))

(add-hook 'before-save-hook #'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") #'godef-jump)
                          (setq indent-tabs-mode t)
                          (setq tab-width 4)
                          ))

;; (add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")
;; (require 'go-flymake)
;; (require 'go-flycheck)

(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
