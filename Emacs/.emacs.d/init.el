;;加载自定义info目录
(add-to-list 'Info-default-directory-list "~/.info")

;; 设置evil模式
(add-to-list 'load-path "~/.emacs.d/vendor/evil")
(require 'evil)
(evil-mode 0)
(global-set-key [f4] 'evil-mode)

;; 设置neotree模式
(add-to-list 'load-path "~/.emacs.d/vendor/neotree")
(require 'neotree)
(global-set-key [f3] 'neotree)

;; 设置Powerline
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(require 'cl)

;; Set Web-Mode
(add-to-list 'load-path "~/.emacs.d/vendor/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; 设置smart-comment
(add-to-list 'load-path "~/.emacs.d/vendor/smart-comment")
(require 'smart-comment)
(global-set-key (kbd "M-;") 'smart-comment)

;;设置窗口启动后的位置及大小
(setq initial-frame-alist '((top . 0) (left . 0) (width . 808) (height . 58)))

;;定制scratch buffer内容
(setq initial-scratch-message "")

;;设置时间显示模式
(display-time-mode 1)
(setq display-time-24hr-format 1)
(setq display-time-day-and-date 1)

;; 设置缺省模式为text
(setq default-major-mode 'text-mode)

;;关闭窗口默认欢迎界面
(setq inhibit-startup-message 1)

;;启动时窗口分为2个
;;(split-window-horizontally)

;;设置Emacs根目录
;;(setq command-line-default-directory "~/code/")

;;设置默认字体及大小
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")
;;(set-default-font "Consolas 10")
(set-default-font "ubuntu mono 10")
(if (and (fboundp 'daemonp) (daemonp))
(add-hook 'after-make-frame-functions
(lambda (frame)
(with-selected-frame frame
(set-fontset-font "fontset-default"
'unicode "WenQuanyi Micro Hei Mono 9"))))
(set-fontset-font "fontset-default" 'unicode "WenQuanYi Micro Hei Mono 9"))

;;设置标题栏显示内容
(setq frame-title-format "emacs")

;;设置光标样式
(set-default 'cursor-type 'hbar)

;;防止屏幕滚动时闪烁
(setq scroll-margin 3 scroll-conservatively 10000)

;;不显示滚动条
(scroll-bar-mode -1)

;;不显示菜单栏
(menu-bar-mode -1)
(global-set-key [f10] 'menu-bar-mode)

;;不显示工具栏
(tool-bar-mode -1)

;;全局显示行号
(global-linum-mode)
(global-set-key [f2] 'global-linum-mode)
(setq linum-format "%d ")

;;以行号、列号模式显示光标位置
(column-number-mode 1)

;;设置自动换行
(toggle-truncate-lines 1)
(setq default-fill-column 80)

;;把c语言风格设置为k&r风格
(add-hook 'c-mode-hook
'(lambda ()
(c-set-style "k&r")))

;;设置缩进模式
(setq tab-width 4
indent-tabs-mode 1
c-basic-offset 4)

;;设置回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>")
'newline)

;;设置括号自动匹配且光标不来回跳动
(show-paren-mode 1)
(setq show-paren-style 'parentheses)

;;全局语法加亮
(global-font-lock-mode 1)

;;不产生备份文件
(setq make-backup-files nil)

;;不生成临时文件
(setq-default make-backup-files nil)

;;自动保存模式
(setq auto-save-mode 1)

;;打开speedbar
;;(global-set-key [f8] 'speedbar)

;;在其他buffer打开shell
;;(global-set-key [f9] 'eshell) 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
