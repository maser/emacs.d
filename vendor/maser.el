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


;; http://emacs-fu.blogspot.de/2013/03/editing-with-root-privileges-once-more.html
(defun djcb-find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with
root-privileges (using tramp/sudo), if the file is not writable by
user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))

;; http://tuxicity.se/emacs/elisp/2010/11/16/delete-file-and-buffer-in-emacs.html
(defun delete-this-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

