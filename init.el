;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     octave
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t)
     better-defaults
     emacs-lisp
     (mu4e :variables
           mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e/"
           )
     git
     python
     (org :variables
          org-enable-github-support t
          org-projectile-file "TODO.org"
          )
     pandoc
     ess
     deft
     (latex :variables
            latex-enable-folding t
            latex-enable-auto-fill t
            )
     ; ipython-notebook
     (markdown :variables
               markdown-live-preview-engine 'vmd)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     bibtex
     osx
     ; org-projectile
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(jupyter) ;; (ob-ipython)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
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
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
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
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
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
   dotspacemacs-enable-paste-micro-state nil
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
   dotspacemacs-fullscreen-use-non-native nil
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
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
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (add-to-list 'load-path "~/.spacemacs.d/scimax/ox-ipynb")
  ;;(add-to-list 'load-path "~/.spacemacs.d/scimax/")
  ;;(add-to-list 'load-path "~/.spacemacs.d/scimax/ob-ipython-upstream")
  ;;(add-to-list 'load-path "/Users/sschober/git/emacs-jupyter")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;;
  (setq password-cache-expiry 120)

  ;; MaxOS Keybinding
  ;; osx layer sets
  ;; - command to super (s)
  ;; - and option to meta (M)
  ;; further I use
  ;; - right command to hyper (H)
  (when (spacemacs/system-is-mac)
    (setq mac-right-command-modifier 'hyper)  ; right cmd = meta
    (setq-default mac-right-option-modifier nil)
    ;;(setq ns-function-modifier 'hyper)
    ;; (setq mac-command-modifier 'meta) ; make cmd key do Meta
    ;; (setq mac-option-modifier 'super) ; make opt key do Super
    ;; (setq mac-control-modifier 'control) ; make Control key do Control
    ;; (setq ns-function-modifier 'hyper)  ; make Fn key do Hyper
    (global-set-key (kbd "M-ß") (kbd "\\"))
    (global-set-key (kbd "M-ä") (kbd "}"))
    (global-set-key (kbd "M-ö") (kbd "{"))
    (global-set-key (kbd "M-p") (kbd "["))
    (global-set-key (kbd "M-ü") (kbd "]"))
    (global-set-key (kbd "M-+") (kbd "~"))
    (global-set-key (kbd "M-´") (kbd "|"))
    (setq org-download-screenshot-method "/usr/sbin/screencapture -i %s")
    (setq epa-pinentry-mode 'loopback)
    ;; see https://colinxy.github.io/software-installation/2016/09/24/emacs25-easypg-issue.html
  )
  ;; Org mode
  (with-eval-after-load 'org
    (setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar")
    (require 'ox-latex)
    (add-to-list 'org-latex-packages-alist '("" "tikz" t))

    (setq reftex-default-bibliography '("~/Dropbox/bibliography/MyLibrary.bib"))
    ;; see org-ref for use of these variables
    (setq org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
          org-ref-default-bibliography '("~/Dropbox/bibliography/MyLibrary.bib"))

    ;; PREVIEW
    ;;(eval-after-load "preview"
    ;;   '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))
    (setq org-preview-latex-default-process 'imagemagick)
    ;; see org-preview-latex-process-alist
    ;; avail are: dvipng, dvisvgm, imagemagick

    ;; (add-to-list 'org-latex-packages-alist '("" "minted" nil)) ;; this should not be loaded by default
    (setq org-latex-listings 'minted)
    (setq org-latex-minted-options
          '(("frame" "lines") ("linenos=true")))

    (add-to-list 'org-latex-minted-langs '(ipython "python"))

    (setq org-latex-pdf-process
          '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


    ;; JUPYTER AND OBIPYTHON
    ;; (require 'ob-ipython)
    ;; (require 'scimax-org-babel-ipython-upstream)
    ;; (require 'scimax-ob)
    (require 'ox-ipynb)
    (require 'simple-httpd)
    (setq httpd-root "~/www")
    (require 'jupyter)

    (org-babel-do-load-languages 'org-babel-load-languages
                                 '((dot . t)
                                   (ditaa . t)
                                   (latex . t)
                                   (maxima . t)
                                   (jupyter . t)
                                   (python . t)))

    ;; https://github.com/dzop/emacs-jupyter/issues/41
    (with-eval-after-load 'ob-jupyter
      (defalias 'org-babel-execute:ipython 'org-babel-execute:jupyter-python)
      (defalias 'org-babel-ipython-initiate-session 'org-babel-jupyter-python-initiate-session)
      (setq org-babel-default-header-args:ipython '((:session . "py")
                                                    (:kernel . "python")))
      )

    (setq org-babel-python-command "python3")
    (setq org-confirm-babel-evaluate nil)

     ;;; display/update images in the buffer after I evaluate
    (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
    (defun org-babel-execute:yaml (body params) body)
    ;;
    (eval-after-load 'ox
      '(require 'ox-koma-letter))

    ;; ox-latex stuff
    (with-eval-after-load 'ox-latex
      (add-to-list 'org-latex-classes
                   '("koma-article"
                     "\\documentclass{scrartcl}"
                     ("\\section{%s}" . "\\section*{%s}")
                     ("\\subsection{%s}" . "\\subsection*{%s}")
                     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                     ("\\paragraph{%s}" . "\\paragraph*{%s}")
                     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
      (add-to-list 'org-latex-classes
                   '("beamer"
                     "\\documentclass\[presentation\]\{beamer\}"
                     ("\\section\{%s\}" . "\\section*\{%s\}")
                     ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                     ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}"))))
    (setq org-latex-default-class "koma-article")

    ;; https://stackoverflow.com/questions/10295177/is-there-an-equivalent-of-org-modes-b-ignoreheading-for-non-beamer-documents
    (defun sa-ignore-headline (contents backend info)
      "Ignore headlines with tag `ignoreheading'."
      (when (and (org-export-derived-backend-p backend 'latex 'html 'ascii)
                 (string-match "\\`.*ignoreheading.*\n"
                               (downcase contents)))
        (replace-match "" nil nil contents)))

    (add-to-list 'org-export-filter-headline-functions 'sa-ignore-headline)

    ) ;; end org setup
    (with-eval-after-load 'ox-beamer
      (add-to-list 'org-beamer-environments-extra '("PresentationMode" "P" "\\mode<presentation>" "\\mode\n<all>"))
      (add-to-list 'org-beamer-environments-extra '("ArticleMode" "a" "\\mode<article>" "\\mode\n<all>"))
      (add-to-list 'org-beamer-environments-extra '("onlyenv" "O" "\\begin{onlyenv}%a" "\\end{onlyenv}"))
      )
  ;; mu4e setup
  (with-eval-after-load 'mu4e
    (setq mu4e-compose-context-policy nil
          mu4e-maildir "~/.mail"
          mu4e-get-mail-command "offlineimap"
          mu4e-update-interval 300)

    ;; Mail config is stored in a separate file
    (load "~/.mail.el"))

  ;; Custom file
  (setq custom-file "~/.spacemacs.d/custom.el")
  (load custom-file)
  ;; misc
  )
;; end user-config

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (xterm-color winum which-key web-mode use-package toc-org spaceline powerline sass-mode pyvenv persp-mode paradox pandoc-mode orgit org-ref pdf-tools ivy tablist org-projectile org-pomodoro org-mime org-download org-bullets multi-term mu4e-alert alert lorem-ipsum live-py-mode link-hint hydra lv hy-mode hl-todo helm-swoop helm-projectile projectile helm-make helm-descbinds helm-company helm-bibtex haml-mode google-translate git-timemachine git-link eyebrowse expand-region exec-path-from-shell evil-visual-mark-mode evil-surround evil-nerd-commenter evil-mc evil-matchit evil-magit eval-sexp-fu ess-smart-equals eshell-z eshell-prompt-extras esh-help dumb-jump diff-hl deft cython-mode biblio biblio-core auto-yasnippet auto-compile aggressive-indent ace-window ace-link avy anaconda-mode auctex company ess julia-mode anzu iedit smartparens evil goto-chg flycheck flyspell-correct yasnippet request helm helm-core magit-popup magit transient git-commit with-editor async markdown-mode ht org-plus-contrib yapfify ws-butler volatile-highlights vmd-mode vi-tilde-fringe uuidgen unfill undo-tree treepy tagedit spinner smeargle slim-mode shell-pop scss-mode reveal-in-osx-finder restart-emacs rainbow-delimiters pytest pyenv-mode py-isort pug-mode popwin pkg-info pip-requirements pcre2el pbcopy parsebib packed ox-pandoc ox-gfm osx-trash osx-dictionary org-present org-category-capture open-junk-file neotree mwim mu4e-maildirs-extension move-text mmm-mode markdown-toc magit-gitflow macrostep log4e linum-relative launchctl key-chord indent-guide hungry-delete htmlize highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-pydoc helm-mode-manager helm-gitignore helm-flx helm-css-scss helm-c-yasnippet helm-ag graphql golden-ratio gnuplot gntp gitconfig-mode gitattributes-mode git-messenger git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery evil-visualstar evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu ess-R-data-view emmet-mode elisp-slime-nav diminish dash-functional company-web company-statistics company-auctex company-anaconda column-enforce-mode clean-aindent-mode bind-key auto-highlight-symbol auto-dictionary auctex-latexmk adaptive-wrap ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
