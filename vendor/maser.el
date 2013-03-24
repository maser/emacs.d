;; some things that don’d deserve to have their own package

(defun maser-vim-o ()
  "insert new line below current line and move there"
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun maser-vim-O ()
  "insert new line above current line and move there"
  (interactive)
  (move-beginning-of-line nil)
  (open-line 1)
  (indent-according-to-mode))

(defun maser-delete-line-above ()
  "Delete the line above the current line"
  (interactive)
  (save-excursion
    (move-beginning-of-line nil)
    (if (< 1 (count-lines (point-min) (point)))
        (progn
          (previous-line)
          (kill-line)))))

(defun maser-delete-line-below ()
  "Delete the line below the current line"
  (interactive)
  (save-excursion
    (move-beginning-of-line nil)
    (if (< 1 (count-lines (point) (point-max)))
        (progn
          (next-line)
          (kill-line)))))

(defun maser-add-line-above () 
  "Add an empty line above the current line"
  (interactive)
  ; save-excursion does not restore point correctly when it is at the
  ; beginning of the line
  (let ((at-beginning-of-line (= (line-beginning-position) (point))))
    (if at-beginning-of-line
        (forward-char))
    (save-excursion
      (maser-vim-O))
    (if at-beginning-of-line
        (backward-char))))

(defun maser-add-line-below ()
  "Add an empty line below the current line"
  (interactive)
  (save-excursion
    (maser-vim-o)))

(defun maser-add-semicolon-below ()
  "Add a ; at the end of the line below"
  (interactive)
  (maser-add-string-below ";"))
(defun maser-add-comma-below ()
  "Add a , at the end of the line below"
  (interactive)
  (maser-add-string-below ","))

(defun maser-add-string-below (string)
  "Add the string at the end of the line below"
  (save-excursion
    (move-beginning-of-line nil)
    (if (< 1 (count-lines (point) (point-max)))
        (progn
          (next-line)
          (end-of-line)
          (insert string)))))
