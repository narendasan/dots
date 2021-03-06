;; -*- mode: emacs-lisp -*-

;;;;;;;;;;;;;;;;;;;;
;;HELPER FUNCTIONS;;
;;;;;;;;;;;;;;;;;;;;
;; (defconst user-init-dir
;;   (cond ((boundp 'user-emacs-directory)
;;          user-emacs-directory)
;;         ((boundp 'user-init-directory)
;;          user-init-directory)
;;         (t "~/.spacemacs.d/")))

;; (defun load-user-file (file)
;;   (interactive "f")
;;   "Load a file in current user dir"
;;   (load-file (expand-file-name file user-init-dir)))



(defun dotspacemacs/layers () "Configuration Layers declaration. You should not put any user code in this function besides modifying the variable values"
                              (setq-default ;; Base distribution to use. This is a layer contained in the directory
                                            ;; `+distribution'. For now available distributions are `spacemacs-base'
                                            ;; or `spacemacs'. (default 'spacemacs)
                                            dotspacemacs-distribution 'spacemacs
                                            ;; If non-nil layers with lazy install support are lazy installed.
                                            ;; (default nil)
                                            dotspacemacs-enable-lazy-installation nil
                                            ;; List of additional paths where to look for configuration layers.
                                            ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
                                            dotspacemacs-configuration-layer-path '()
                                            ;; List of configuration layers to load. If it is the symbol `all' instead
                                            ;; of a list then all discovered layers will be installed.
                                            dotspacemacs-configuration-layers '(;; spacemacs-ivy
                                                                                '((auto-completion :variables
                                                                                                   auto-completion-enable-sort-by-usage t
                                                                                                   auto-completion-enable-snippets-in-popup t))
                                                                                '((org :variables
                                                                                       org-enable-github-support t))
                                                                                ;; vinegar
                                                                                '((shell :variables
                                                                                         shell-default-shell 'ansi-term
                                                                                         shell-default-height 30
                                                                                         shell-default-position 'bottom))
                                                                                '((syntax-checking :variables
                                                                                                   syntax-checking-enable-tooltips nil))
                                                                                ;; TheBB's layers
                                                                                ;; https://github.com/TheBB/spacemacs-layers
                                                                                ;; no-dots
                                                                                evil-little-word
                                                                                ;; Personal layers
                                                                                auto-correct
                                                                                frame-geometry
                                                                                cleverparens-lispy
                                                                                better-defaults
                                                                                '((c-c++ :variables
                                                                                         c-c++-default-mode-for-headers 'c++-mode
                                                                                         c-c++-enable-clang-support t))
                                                                                chrome
                                                                                '((colors :variables
                                                                                          colors-enable-rainbow-identifiers t))
                                                                                command-log
                                                                                deft
                                                                                dockerfile
                                                                                elfeed
                                                                                erlang
                                                                                emacs-lisp
                                                                                emoji
                                                                                evil-cleverparens
                                                                                evil-commentary
                                                                                evil-snipe
                                                                                extra-langs
                                                                                finance
                                                                                floobits
                                                                                games
                                                                                git
                                                                                github
                                                                                go
                                                                                haskell
                                                                                html
                                                                                jabber
                                                                                java
                                                                                javascript
                                                                                latex
                                                                                org
                                                                                osx
                                                                                pandoc
                                                                                prodigy
                                                                                python-mode
                                                                                racket
                                                                                ranger
                                                                                rcirc
                                                                                react
                                                                                ruby-mode
                                                                                rust
                                                                                shell-scripts
                                                                                spacemacs
                                                                                spacemacs-base
                                                                                spacemacs-layouts
                                                                                speed-reading
                                                                                spell-checking
                                                                                spotify
                                                                                swift
                                                                                terraform
                                                                                themes-megapack
                                                                                theming
                                                                                tmux
                                                                                typography
                                                                                vagrant
                                                                                version-control
                                                                                vim-powerline
                                                                                xkcd)
                                            ;; List of additional packages that will be installed without being-mode
                                            ;; wrapped in a layer. If you need some configuration for these
                                            ;; packages then consider to create a layer, you can also put the
                                            ;; configuration in `dotspacemacs/config'.
                                            dotspacemacs-additional-packages '(shackle
                                                                               dtrt-indent
                                                                               company-flx
                                                                               graphviz-dot-mode)
                                            ;; A list of packages and/or extensions that will not be install and loaded.
                                            dotspacemacs-excluded-packages'()
                                            ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
                                            ;; are declared in a layer which is not a member of
                                            ;; the list `dotspacemacs-configuration-layers'. (default t)
                                            dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init () "Initialization function. This function is called at the very startup of Spacemacs initialization before layers configuration.You should not put any user code in there besides modifying the variable values."
                            ;; This setq-default sexp is an exhaustive list of all the supported
                            ;; spacemacs settings.
                            (setq-default ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
                                          ;; possible. Set it to nil if you have no way to use HTTPS in your
                                          ;; environment, otherwise it is strongly recommended to let it set to t.
                                          ;; This variable has no effect if Emacs is launched with the parameter
                                          ;; `--insecure' which forces the value of this variable to nil.
                                          ;; (default t)
                                          dotspacemacs-elpa-https t
                                          ;; Maximum allowed time in seconds to contact an ELPA repository.
                                          dotspacemacs-elpa-timeout 5
                                          ;; If non nil then spacemacs will check for updates at startup
                                          ;; when the current branch is not `develop'. (default t)
                                          dotspacemacs-check-for-update t
                                          ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
                                          ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
                                          ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
                                          ;; unchanged. (default 'vim)
                                          dotspacemacs-editing-style '(hybrid :variables
                                                                              hybrid-mode-default-state 'normal
                                                                              hybrid-mode-enable-evilified-state t
                                                                              hybrid-mode-enable-hjkl-bindings nil)
                                          ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
                                          dotspacemacs-verbose-loading nil
                                          ;; Specify the startup banner. Default value is `official', it displays
                                          ;; the official spacemacs logo. An integer value is the index of text
                                          ;; banner, `random' chooses a random text banner in `core/banners'
                                          ;; directory. A string value must be a path to an image format supported
                                          ;; by your Emacs build.
                                          ;; If the value is nil then no banner is displayed. (default 'official)
                                          dotspacemacs-startup-banner 'official
                                          ;; List of items to show in the startup buffer. If nil it is disabled.
                                          ;; Possible values are: `recents' `bookmarks' `projects' `agenda' `todos'.
                                          ;; (default '(recents projects))
                                          dotspacemacs-startup-lists '(recents projects agenda todos)
                                          ;; Number of recent files to show in the startup buffer. Ignored if
                                          ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
                                          dotspacemacs-startup-recent-list-size 5
                                          ;; Default major mode of the scratch buffer (default `text-mode')
                                          dotspacemacs-scratch-mode 'text-mode
                                          ;; List of themes, the first of the list is loaded when spacemacs starts.
                                          ;; Press <SPC> T n to cycle to the next theme in the list (works great
                                          ;; with 2 themes variants, one dark and one light)
                                          dotspacemacs-themes '(gruvbox
                                                                jazz
                                                                spacegray
                                                                twilight-anti-bright
                                                                zen-and-art
                                                                solarized-dark
                                                                solarized-light
                                                                sanityinc-tomorrow-blue
                                                                sanityinc-tomorrow-eighties
                                                                sanityinc-tomorrow-night
                                                                seti
                                                                misterioso
                                                                material
                                                                deeper-blue
                                                                darktooth
                                                                colorsarenice-dark
                                                                brin
                                                                birds-of-paradise
                                                                ample-zen
                                                                monokai
                                                                solarized-light)
                                          ;; If non nil the cursor color matches the state color.
                                          dotspacemacs-colorize-cursor-according-to-state t
                                          ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
                                          ;; size to make separators look not too crappy.
                                          dotspacemacs-default-font '("Inconsolatag"
                                                                      :size 14
                                                                      :weight normal
                                                                      :width normal
                                                                      :powerline-scale 1.1)
                                          ;; The leader key
                                          dotspacemacs-leader-key "SPC"
                                          ;; The leader key accessible in `emacs state' and `insert state'
                                          ;; (default "M-m")
                                          dotspacemacs-emacs-leader-key "M-m"
                                          ;; Major mode leader key is a shortcut key which is the equivalent of
                                          ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
                                          dotspacemacs-major-mode-leader-key ","
                                          ;; Major mode leader key accessible in `emacs state' and `insert state'.
                                          ;; (default "C-M-m)
                                          dotspacemacs-major-mode-emacs-leader-key "C-M-m"
                                          ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
                                          ;; (default "SPC")
                                          dotspacemacs-emacs-command-key "SPC"
                                          ;; These variables control whether separate commands are bound in the GUI to
                                          ;; the key pairs C-i, TAB and C-m, RET.
                                          ;; Setting it to a non-nil value, allows for separate commands under <C-i>
                                          ;; and TAB or <C-m> and RET.
                                          ;; In the terminal, these pairs are generally indistinguishable, so this only
                                          ;; works in the GUI. (default nil)
                                          dotspacemacs-distinguish-gui-tab t
                                          ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
                                          dotspacemacs-remap-Y-to-y$ t
                                          ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
                                          ;; (default nil)
                                          dotspacemacs-ex-substitute-global nil
                                          ;; Name of the default layout (default "Default")
                                          dotspacemacs-default-layout-name "Default"
                                          ;; If non nil the default layout name is displayed in the mode-line.
                                          ;; (default nil)
                                          dotspacemacs-display-default-layout nil
                                          ;; If non nil then the last auto saved layouts are resume automatically upon
                                          ;; start. (default nil)
                                          dotspacemacs-auto-resume-layouts t
                                          ;; Size (in MB) above which spacemacs will prompt to open the large file
                                          ;; literally to avoid performance issues. Opening a file literally means that
                                          ;; no major mode or minor modes are active. (default is 1)
                                          dotspacemacs-large-file-size 1
                                          ;; Location where to auto-save files. Possible values are `original' to
                                          ;; auto-save the file in-place, `cache' to auto-save the file to another
                                          ;; file stored in the cache directory and `nil' to disable auto-saving.
                                          ;; (default 'cache)
                                          dotspacemacs-auto-save-file-location 'cache
                                          ;; Maximum number of rollback slots to keep in the cache. (default 5)
                                          dotspacemacs-max-rollback-slots 5
                                          ;; If non nil then `ido' replaces `helm' for some commands.
                                          dotspacemacs-use-ido nil
                                          ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
                                          dotspacemacs-helm-resize nil
                                          ;; if non nil, the helm header is hidden when there is only one source.
                                          ;; (default nil)
                                          dotspacemacs-helm-no-header nil
                                          ;; define the position to display `helm', options are `bottom', `top',
                                          ;; `left', or `right'. (default 'bottom)
                                          dotspacemacs-helm-position 'bottom
                                          ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
                                          ;; several times cycle between the kill ring content. (default nil)
                                          dotspacemacs-enable-paste-transient-state nil
                                          ;; Which-key delay in seconds. The which-key buffer is the popup listing
                                          ;; the commands bound to the current keystroke sequence. (default 0.4)
                                          dotspacemacs-which-key-delay 0.4
                                          ;; Which-key frame position. Possible values are `right', `bottom' and
                                          ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
                                          ;; right; if there is insufficient space it displays it at the bottom.
                                          ;; (default 'bottom)
                                          dotspacemacs-which-key-position 'bottom
                                          ;; If non nil a progress bar is displayed when spacemacs is loading. This
                                          ;; may increase the boot time on some systems and emacs builds, set it to
                                          ;; nil to boost the loading time. (default t)
                                          dotspacemacs-loading-progress-bar t
                                          ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
                                          ;; (Emacs 24.4+ only)
                                          dotspacemacs-fullscreen-at-startup nil
                                          ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
                                          ;; Use to disable fullscreen animations in OSX. (default nil)
                                          dotspacemacs-fullscreen-use-non-native t
                                          ;; If non nil the frame is maximized when Emacs starts up.
                                          ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
                                          ;; (default nil) (Emacs 24.4+ only)
                                          dotspacemacs-maximized-at-startup nil
                                          ;; A value from the range (0..100), in increasing opacity, which describes
                                          ;; the transparency level of a frame when it's active or selected.
                                          ;; Transparency can be toggled through `toggle-transparency'. (default 90)
                                          dotspacemacs-active-transparency 90
                                          ;; A value from the range (0..100), in increasing opacity, which describes
                                          ;; the transparency level of a frame when it's inactive or deselected.
                                          ;; Transparency can be toggled through `toggle-transparency'. (default 90)
                                          dotspacemacs-inactive-transparency 90
                                          ;; If non nil show the titles of transient states. (default t)
                                          dotspacemacs-show-transient-state-title t
                                          ;; If non nil show the color guide hint for transient state keys. (default t)
                                          dotspacemacs-show-transient-state-color-guide t
                                          ;; If non nil unicode symbols are displayed in the mode line. (default t)
                                          dotspacemacs-mode-line-unicode-symbols nil
                                          ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
                                          ;; scrolling overrides the default behavior of Emacs which recenters point
                                          ;; when it reaches the top or bottom of the screen. (default t)
                                          dotspacemacs-smooth-scrolling t
                                          ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
                                          ;; derivatives. If set to `relative', also turns on relative line numbers.
                                          ;; (default nil)
                                          dotspacemacs-line-numbers t
                                          ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
                                          ;; (default nil)
                                          dotspacemacs-smartparens-strict-mode nil
                                          ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
                                          ;; over any automatically added closing parenthesis, bracket, quote, etc…
                                          ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
                                          dotspacemacs-smart-closing-parenthesis t
                                          ;; Select a scope to highlight delimiters. Possible values are `any',
                                          ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
                                          ;; emphasis the current one). (default 'all)
                                          dotspacemacs-highlight-delimiters 'all
                                          ;; If non nil advises quit functions to keep server open when quitting.
                                          ;; (default nil)
                                          dotspacemacs-persistent-server nil
                                          ;; List of search tool executable names. Spacemacs uses the first installed
                                          ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
                                          ;; (default '("ag" "pt" "ack" "grep"))
                                          dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
                                          ;; The default package repository used if no explicit repository has been
                                          ;; specified with an installed package.
                                          ;; Not used for now. (default nil)
                                          dotspacemacs-default-package-repository nil
                                          ;; Delete whitespace while saving buffer. Possible values are `all'
                                          ;; to aggressively delete empty line and long sequences of whitespace,
                                          ;; `trailing' to delete only the whitespace at end of lines, `changed'to
                                          ;; delete only whitespace for changed lines or `nil' to disable cleanup.
                                          ;; (default nil)
                                          dotspacemacs-whitespace-cleanup 'changed))

(defun dotspacemacs/user-init () "Initialization function for user code. It is called immediately after `dotspacemacs/init'.  You are free to put almost any user code here.  The exception is org related code, which should be placed in `dotspacemacs/user-config'."
                                 (add-to-list 'load-path (expand-file-name "lisp" dotspacemacs-directory))

                                 ;; ivy
                                 ;; Use fuzzy finder
                                 (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
                                 ;; Do not insert ^
                                 (setq ivy-initial-inputs-alist nil)
                                 (setq flycheck-display-errors-delay 0.5)
                                 ;; Ruby
                                 ;; Treat _ as a word character
                                 (with-eval-after-load 'ruby-mode
                                   (modify-syntax-entry ?_ "w" ruby-mode-syntax-table))

                                 ;; Company
                                 ;; Fuzzy completion
                                 ;; (with-eval-after-load 'company
                                 ;;   (company-flx-mode +1))
                                 ;; Speed up autocomplete popup
                                 (setq company-idle-delay 0.1)

                                 ;; RCIRC
                                 ;;; Keep line at margin-bottom: ...
                                 (add-hook 'rcirc-mode-hook
                                           (lambda () (set (make-local-variable 'scroll-conservatively) 8192))))

(defun dotspacemacs/user-config () "Configuration function for user code. This function is called at the very end of Spacemacs initialization after layers configuration. You are free to put any user code."
                                   (require 'init-deft)
                                   (require 'init-elixir)
                                   (require 'init-evil)
                                   (require 'init-html)
                                   (require 'init-javascript)
                                   (require 'init-magit)
                                   (require 'init-org)
<<<<<<< Updated upstream
                                   ;;(require 'init-terminal-cursor)
=======
>>>>>>> Stashed changes

                                   (require 'company-simple-complete)
                                   (require 'fix-bracketed-paste)
                                   (require 'eval-overlay)

                                   (setq powerline-default-separator 'arrow)

                                   ;; auto-correct
                                   (setq abbrev-file-name "~/.spacemacs.d/abbrev_defs")
                                   (if (file-exists-p abbrev-file-name)
                                       (quietly-read-abbrev-file))

                                   (setq ;; Use bash because it's faster
                                         shell-file-name "/bin/zsh"

                                         ;; Enable sudo:server:
                                         tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:")))

                                         ;; Spaceline
                                         spaceline-toggle-minor-modes-on t
                                         spaceline-toggle-workspace-number-on t
                                         spaceline-toggle-window-number-on t
                                         spaceline-toggle-evil-state-on t
                                         spaceline-toggle-anzu-on t
                                         spaceline-toggle-auto-compile-on t
                                         spaceline-toggle-buffer-modified-on t
                                         spaceline-toggle-buffer-id-on t
                                         spaceline-toggle-major-mode-on t
                                         spaceline-toggle-flycheck-error-on t
                                         spaceline-toggle-flycheck-warning-on t
                                         spaceline-toggle-flycheck-info-on t
                                         spaceline-toggle-erc-track-on t
                                         spaceline-toggle-version-control-on t
                                         spaceline-toggle-org-pomodoro-on t
                                         spaceline-toggle-org-clock-on t
                                         spaceline-toggle-battery-on t
                                         spaceline-toggle-selection-info-on t
                                         spaceline-toggle-buffer-encoding-abbrev-on t
                                         spaceline-toggle-line-column-on t
                                         spaceline-toggle-hud-on t

                                         ;; File name completion
                                         read-file-name-completion-ignore-case t
                                         read-buffer-completion-ignore-case t

                                         ;; Miscellaneous
                                         vc-follow-symlinks t
                                         require-final-newline t

                                         ;; Shell-script mode
                                         sh-basic-offset 2

                                         ;; dtrt-indent-mode
                                         dtrt-indent-mode t)

                                   (spacemacs/set-leader-keys "SPC" 'avy-goto-char-timer)
                                   (setq avy-timeout-seconds 0.2)

                                   ;; Profiler bindings
                                   (spacemacs/set-leader-keys "ops" 'profiler-start)
                                   (spacemacs/set-leader-keys "opr" 'profiler-report)
                                   (spacemacs/set-leader-keys "opt" 'profiler-stop)
                                   (spacemacs/set-leader-keys "oper" 'elp-results)

                                   ;; Use C-j in place of C-x
                                   ;; (define-key key-translation-map "\C-j" "\C-x")
                                   (global-set-key (kbd "<s-return>") 'spacemacs/toggle-fullscreen-frame)

                                   ;; Word wrap in text buffers
                                   (add-hook 'text-mode-hook 'auto-fill-mode)

                                   ;; Enable midnight-mode to clean old buffers every day
                                   '(midnight-mode t nil (midnight))

                                   (shackle-mode)

                                   ;; (setq gnus-posting-styles
                                   ;;       '(("gmail.com" (address "narendasan@gmail.com"))
                                   ;;         ("narendasan.com" (address "naren@narendasan.com"))
                                   ;;         ("illinois.edu" (address "sivagna2@illinois.edu"))
                                   ;;         ("hackillinois.org" (address "naren.sivagnanadasan@hackillinois.org"))))

                                 
                                   ;; load private settings
                                   (when (file-exists-p "~/.emacs-private.el")
                                     (load-file "~/.emacs-private.el")))
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(header-line ((t (:background "#3E3D31" :foreground "#F8F8F0" :box nil)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(max-specpdl-size 2000)
 '(package-selected-packages
   (quote
    (projectile smartparens helm helm-core avy package-build evil eyebrowse column-enforce-mode clojure-snippets clj-refactor inflections edn peg cider-eval-sexp-fu cider queue clojure-mode evil-cleverparens paredit xterm-color web-mode web-beautify toc-org tagedit stickyfunc-enhance srefactor spaceline powerline smeargle slim-mode shell-pop shackle scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder rcirc-notify rcirc-color rbenv ranger rake rainbow-mode rainbow-identifiers pbcopy osx-trash orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets multi-term mmm-mode markdown-toc markdown-mode magit-gitflow magit-gh-pulls macrostep livid-mode skewer-mode simple-httpd lispy swiper less-css-mode launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jade-mode htmlize helm-gitignore request helm-flyspell helm-dash helm-css-scss helm-company helm-c-yasnippet haml-mode graphviz-dot-mode gnuplot gitignore-mode github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh logito pcache gh-md flycheck-pos-tip flycheck floobits evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help erlang emmet-mode elisp-slime-nav dtrt-indent diff-hl deft dash-at-point company-web web-completion-data company-tern dash-functional tern company-statistics company-quickhelp pos-tip company-flx coffee-mode chruby bundler inf-ruby auto-yasnippet yasnippet auto-dictionary auto-compile packed alchemist company elixir-mode ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package spacemacs-theme smooth-scrolling restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el paradox page-break-lines open-junk-file neotree move-text monokai-theme lorem-ipsum linum-relative link-hint leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery f expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu define-word clean-aindent-mode buffer-move bracketed-paste auto-highlight-symbol aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
