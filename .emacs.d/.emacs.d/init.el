(setq tramp-verbose 10)
(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))
(setq tramp-auto-save-directory temporary-file-directory)
(setq tramp-default-method "ssh")
(require 'tramp)
;; 设置我们自有插件目录
;;******************************************************************
(add-to-list 'load-path "~/.emacs.d/")
;自动换行缩进
;(defun set-newline-and-indent()
;  (local-set-key (kbd "RET") 'newline-and-indent))
;(add-hook 'lisp-mode-hook 'set-newline-and-indent)
(add-hook 'c-mode-common-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))

;;*****************************************************************
;mode-compile
(autoload 'mode-compile "mode-compile"
"Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
 (global-set-key "\C-ck" 'mode-compile-kill)

(fset 'ecb-gdb
   [?\M-x ?e ?c ?b ?- ?d ?e ?a ?c ?t ?i ?v ?a ?t ?e return ?\M-x ?g ?d ?b])

(fset 'gdb-ecb
   [?q return ?\M-x ?e ?c ?b ?- ?a ?c ?t ?i ?v ?a ?t ?e return])


(global-set-key (kbd "C-c a") 'ecb-gdb)
(global-set-key (kbd "C-c s") 'gdb-ecb)



(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; 加载常用功能库
;;******************************************************************
;(require 'column-marker)
;(require 'pair-mode)
;(require 'align)
;(require 'linum)
;(require 'auto-complete)
;(global-auto-complete-mode t)
;(load-library "align")

;; 文件选择或查找
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(require 'ido)
(ido-mode t)
(load-file "~/cs4235/emacs-for-python/epy-init.el")
;; 加入标签功能
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;(require 'tabbar)
;(require 'tabbar-extension)
;(tabbar-mode)
;(global-set-key (kbd "C-,") 'tabbar-backward)
;(global-set-key (kbd "C-.") 'tabbar-forward)
;(global-set-key (kbd "C-=") 'tabbar-backward-group)
;(global-set-key (kbd "C--") 'tabbar-forward-group)
;; 设置tabbar字体
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;(set-face-attribute 'tabbar-default-face
;  nil :family "Monospace")
(setq-default highlight-trailing-whitespace)
;; 高亮风格，color-theme插件
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
;(setq color-theme-is-global t)
(color-theme-initialize) 
;(color-theme-robin-hood)
;(setq theme-default 'color-theme-dirk-sh)
(color-theme-charcoal-black)

;(require 'php-mode)
;(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;(load-file "~/.emacs.d/multi-mode.el")
;(provide 'multi-mode)
;(load-file "~/.emacs.d/html-php.el")
;(require 'html-php-mode)
(load "~/.emacs.d/nxhtml/autostart.el")
(setq mumamo-background-colors nil)
(setq mumamo-chunk-coloring 'no-chunks-colored)
;; 高亮显示代码
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;(autoload 'python-mode "python-mode" "Python Mode." t)
;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(autoload 'php-mode "php-mode" "PHP editing mode." t)
(setq auto-mode-alist (append (list '("\\.html$" . php-mode)) auto-mode-alist))
;(add-hook 'lisp-mode-hook (lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
;(add-hook 'emacs-lisp-mode-hook (lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

;; Shell mode
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(setq ansi-color-names-vector ; better contrast colors
  ["black" "red4" "green4" "yellow4"
   "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; Make the prompt read only
(setq comint-prompt-read-only t)


;; 加入cedet插件
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))
(load-file "~/.emacs.d/cedet-1.0/speedbar/speedbar.el")
(load-file "~/.emacs.d/cedet-1.0/common/cedet.el")
(semantic-load-enable-code-helpers)
(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
(define-key-after (lookup-key global-map [menu-bar tools])
  [speedbar]
  '("Speedbar" . speedbar-frame-mode)
  [calendar])
(setq semanticdb-search-system-databases t)
;; make all the 'semantic.cache' files go somewhere sane
(setq semanticdb-default-save-directory "~/.emacs-meta/semantic.cache/")


;; ECB设置
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
;---(require 'ecb)
(custom-set-variables
  '(ecb-auto-activate t)     ; 自动加载ECB子窗口
  '(ecb-layout-name "left14")
  '(ecb-layout-window-sizes (quote (("left2" (0.25 . 0.75) (0.25 . 0.25)))))
  '(ecb-tip-of-the-day nil)
  '(ecb-windows-height 0.5)
  '(ecb-windows-width 0.25)
  '(ecb-source-path (quote (("/" "/"))))
;; 由于semantic idle反常占用CPU，所以添加以下设置
;---  '(global-semantic-idle-scheduler-mode nil nil (semantic-idle))
;---  '(global-semantic-idle-summary-mode nil nil (semantic-idle))
;---  '(semantic-idle-scheduler-idle-time -1))
)

(setq interpreter-mode-alist
  (cons '("python" . python-mode)
    interpreter-mode-alist)
  python-mode-hook
  '(lambda () (progn
      (set-variable 'py-indent-offset 4)
      (set-variable 'py-smart-indentation nil)
      (set-variable 'indent-tabs-mode nil) 
      ;;(highlight-beyond-fill-column)
      ;;(pabbrev-mode)
      (abbrev-mode)
    )
  )
)
;;Session.el

(require 'session)
  (add-hook 'after-init-hook 'session-initialize)

;C/C++ 相关设置
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;(add-hook 'c-mode-common-hook '(lambda ()
;      (local-set-key (kbd "RET") 'newline-and-indent)))

;Python相关设置，由于使用了python-mode的东西，必须放到cedet后面
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;(ac-config-default)
;(require 'ac-python)
;(require 'python-mode)
;(require 'pymacs)
;(require 'auto-complete)
;(require 'auto-complete-python)
;(global-auto-complete-mode t)
;(define-key ac-complete-mode-map "\C-n" 'ac-next)
;(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;(define-key ac-complete-mode-map "\t" 'ac-complete)
;(define-key ac-complete-mode-map "\r" nil)
;(setq ac-auto-start 2)
;(ac-ropemacs-init)

;(require 'yasnippet)
;(require 'yasnippet-bundle)
;(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
;(yas/initialize)
;(yas/load-directory "~/elisp/yasnippet/snippets")



;; 自定义按键
;;******************************************************************
(global-set-key [C-f1] 'shell)                     ; F1进入shell
(global-set-key [C-f2] 'split-window-horizontally) ; F2水平分割窗口
(global-set-key [C-f3] 'delete-other-windows)      ; F3关闭其他窗口
(global-set-key [C-f4] 'delete-window)             ; F4关闭当前窗口
(global-set-key [C-f5] 'gdb)                       ; F5调试程序
(global-set-key [C-f6] 'split-window-vertically)   ; F6垂直分割窗口
(global-set-key [C-f7] 'python-shell)              ; F7开启Python shell
(global-set-key [C-f8] 'other-window)              ; F8窗口间跳转
(global-set-key [C-f9] 'ecb-activate)              ; F9打开ecb
(global-set-key [C-f10] 'ecb-deactivate)           ; F10关闭ecb
(global-set-key [C-f11] 'speedbar)                 ; F11打开／关闭speedbar
;(global-set-key [C-f12] 'menu-bar-mode)            ; F12显示／隐藏菜单
(global-set-key [C-return] 'kill-this-buffer)      ; C-Return关闭当前buffer
;(global-set-key (kbd "C-SPC") 'nil)                ; 把C-Space留给中文输入法
;(global-hl-line-mode 1)                            ; 高亮当前行



;; 普通开关设置
;;******************************************************************
(global-font-lock-mode t)            ; 语法高亮
(auto-image-file-mode t)             ; 打开图片显示功能
(column-number-mode t)               ; 显示列号
(setq-default fill-column 81)        ; 81列显示提示线
(setq auto-fill-mode 1)
(show-paren-mode t)                  ; 显示括号匹配
;(menu-bar-mode -1)                  ; 隐藏菜单栏
;(tool-bar-mode -1)                   ; 隐藏工具栏
;(scroll-bar-mode -1)                ; 隐藏滚动条，因为可以使用鼠标滚轮了
(mouse-avoidance-mode 'animate)      ; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(transient-mark-mode t)              ; 允许临时设置标记，See C-h f transient-mark-mode
(setq mouse-yank-at-point t)         ; 支持中键粘贴
(setq inhibit-startup-message t)     ; 关闭启动时闪屏
(setq visible-bell t)                ; 关闭出错时的提示声
(setq default-major-mode 'text-mode) ; 一打开就起用 text 模式
(setq display-time-mode 1)           ; 显示时间，格式如下：
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq x-select-enable-clipboard t)   ; 支持emacs和外部程序的粘贴
(setq frame-title-format '("" buffer-file-name )) ; 在标题栏提示你目前在什么位置
(setq default-fill-column 80)        ; 默认显示 80列就换行
(setq load-home-init-file t)
(fset 'yes-or-no-p 'y-or-n-p)        ; 以 y/n代表 yes/no
;(setq-default tab-width 100)           ; Tab缩进2个字符
(setq-default indent-tabs-mode nil)
(setq-default make-backup-files nil) ; 默认不要生成临时文件
(custom-set-variables 
  '(ecb-options-version "2.40")
  '(size-indication-mode t)
  '(scroll-bar-mode (quote right)))

;; shell,gdb退出后，自动关闭该buffer
;;******************************************************************
(add-hook 'shell-mode-hook 'mode-hook-func)
(add-hook 'gdb-mode-hook 'mode-hook-func)
(defun mode-hook-func ()
  (set-process-sentinel (get-buffer-process (current-buffer))
    #'kill-buffer-on-exit))
(defun kill-buffer-on-exit (process state)
  (message "%s" state)
  (if (or
       (string-match "exited abnormally with code.*" state)
       (string-match "finished" state))
      (kill-buffer (current-buffer))))


;; 其他自定义设置：行移动
;;******************************************************************
(global-set-key [(meta up)] 'move-line-up)
(global-set-key [(meta down)] 'move-line-down) 

(defun move-line (&optional n)
  "Move current line N (1) lines up/down leaving point in place."
  (interactive "p")
  (when (null n)
    (setq n 1))
  (let ((col (current-column)))
    (beginning-of-line)
    (next-line 1)
    (transpose-lines n)
    (previous-line 1)
    (forward-char col)))
(defun move-line-up (n)
  "Moves current line N (1) lines up leaving point in place."
  (interactive "p")
  (move-line (if (null n) -1 (- n)))) 
(defun move-line-down (n)
  "Moves current line N (1) lines down leaving point in place."
  (interactive "p")
  (move-line (if (null n) 1 n)))

;; Reload .emacs on the fly
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(defun reload-dot-emacs()
  (interactive)
  (if(bufferp (get-file-buffer ".emacs"))
    (save-buffer(get-buffer ".emacs")))
  (load-file "~/.emacs")
  (message ".emacs reloaded successfully"))
;; Place all backup copies of files in a common location
;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(defconst use-backup-dir t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs-meta/backups/")))
  version-control t                ; Use version numbers for backups
  kept-new-versions 16             ; Number of newest versions to keep
  kept-old-versions 2              ; Number of oldest versions to keep
  delete-old-versions t            ; Ask to delete excess backup versions?
  backup-by-copying-when-linked t) ; Copy linked files, don't rename.


;; Mac OSX customizations
;;******************************************************************
;(normal-erase-is-backspace-mode t)


;;; 编码设置
;;******************************************************************
(set-language-environment 'UTF-8)


;; 字体设置
;;******************************************************************
;(set-default-font "Monospace-12")
;(set-default-font "Bitstream Vera Sans Mono-12")
;(set-fontset-font (frame-parameter nil 'font)
;  'unicode '("wenquanyi bitmap song" . "unicode-bmp") 'nil 'append)

(set-frame-height (selected-frame) 50)

(set-frame-width (selected-frame) 120)

(setq auto-save-default nil)
