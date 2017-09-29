(setq js2-mode-show-strict-warnings nil)
(setq js2-mode-show-parse-errors nil)
(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq js2-strict-trailing-comma-warning nil)
(setq js2-strict-missing-semi-warning nil)

;; Use js2-jsx-mode for all js files
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))

;; Set jsx indentation offset to same as js js
(add-hook 'js2-jsx-mode-hook #'set-jsx-indentation)
(defun set-jsx-indentation ()
  (setq-local sgml-basic-offset js2-basic-offset))

(setq company-backends-js2-mode '((company-tern :with company-dabbrev)
                                  company-files
                                  company-dabbrev))

(with-eval-after-load 'js2-mode
  (modify-syntax-entry ?_ "w" js2-mode-syntax-table))

;; Set up flycheck for javascript
(with-eval-after-load 'flycheck
  (push 'javascript-jshint flycheck-disabled-checkers)
  (push 'json-jsonlint flycheck-disabled-checkers)
  (push 'js2-jsx-mode flycheck-global-modes)

  (flycheck-add-mode 'javascript-eslint 'web-mode))

;; Find eslint by walking up directory
(add-hook 'js-mode-hook 'eslint-set-closest-executable)
(defun eslint-set-closest-executable (&optional dir)
  (interactive)
  (let* ((dir (or dir default-directory))
         (eslint-executable (concat dir "/node_modules/.bin/eslint")))
    (if (file-exists-p eslint-executable)
        (progn
          (make-variable-buffer-local 'flycheck-javascript-eslint-executable)
          (setq flycheck-javascript-eslint-executable eslint-executable))
      (if (string= dir "/") nil
        (eslint-set-closest-executable (expand-file-name ".." dir))))))

;; Monkey patch to fix indentation for attributes in jsx
(load-file "~/.spacemacs.d/lisp/sgml-mode-patch.el")
(require 'sgml-mode)


(provide 'init-javascript)
