;;; The Zeitgeist Emacs Script -- integrates Emacs with Zeitgeist.
;;; Copyright (C) 2010, Patrick M. Niedzielski <PatrickNiedzielski@gmail.com>
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;
;;; For more information about the Zeitgeist Project, see
;;; <http://zeitgeist-project.com/>.

(require 'dbus)


(defun zeitgeist-call (method &rest args)
  "Call the zeitgeist method METHOD with ARGS over dbus"
  (apply 'dbus-call-method 
    :session                            ; use the session (not system) bus
    "org.gnome.zeitgeist.Engine"        ; service name
    "/org/gnome/zeitgeist/log/activity" ; path name
    "org.gnome.zeitgeist.Log"           ; interface name
    method args))

(defun zeitgeist-event-timestamp ()
  "Get the timestamp in zeitgeist format."
  (let* ((now-time (current-time))
         (hi       (car now-time))
         (lo       (car (cdr now-time)))
         (msecs    (car (cdr (cdr now-time))))) ; This is *micro*seconds. 

  (substring (number-to-string (+ (/ msecs 1000)
             (* (+ lo (* hi 65536.0))     1000))) 0 -2))) ; Convert system time to milliseconds.

(defun zeitgeist-get-mime-type ()
  "Get the mime type from the extension."
  (let ((ext (file-name-extension (buffer-file-name))))
   ; Maybe use file mode later...
   (cond ((eq "el" ext)      "text/x-script.elisp")

         ((eq "cpp" ext)     "text/x-c++src")
         ((eq "C" ext)       "text/x-c++src")
         ((eq "c++" ext)     "text/x-c++src")
         ((eq "cxx" ext)     "text/x-c++src")
         ((eq "cc" ext)      "text/x-c++src")

         ((eq "hpp" ext)     "text/x-c++hdr")
         ((eq "h++" ext)     "text/x-c++hdr")
         ((eq "hxx" ext)     "text/x-c++hdr")
         ((eq "hh" ext)      "text/x-c++hdr")

         ((eq "csv" ext)     "text/comma-separated-values")

         ((eq "h" ext)       "text/x-chdr")

         ((eq "c" ext)       "text/x-csrc")

         ((eq "java" ext)    "text/x-java")

         ((eq "p" ext)       "text/x-pascal")
         ((eq "pas" ext)     "text/x-pascal")

         ((eq "tcl" ext)     "text/x-tcl")
         ((eq "tk" ext)      "text/x-tcl")

         ((eq "tex" ext)     "text/x-tex")
         ((eq "sty" ext)     "text/x-tex")
         ((eq "cls" ext)     "text/x-tex")

         ((eq "html" ext)    "text/html")
         ((eq "htm" ext)     "text/html")

         ((eq "latex" ext)   "application/x-latex")
         ((eq "ltx" ext)     "application/x-latex")

         ((eq "sh" ext)      "application/x-sh")

         ((eq "pl" ext)      "application/x-perl")
         ((eq "pm" ext)      "application/x-perl")

         ((eq "texinfo" ext) "application/x-texinfo")
         ((eq "texi" ext)    "application/x-texinfo")

         ((eq "t" ext)       "application/x-troff")
         ((eq "tr" ext)      "application/x-troff")
         ((eq "roff" ext)    "application/x-troff")

         ((eq "xml" ext)     "text/xml")
         ((eq "xsd" ext)     "text/xml")

         ((eq "xslt" ext)    "application/xslt+xml")
         ((eq "xsl"  ext)    "application/xslt+xml")

         ((eq "txt" ext)   "text/plain")
         (t                "text/plain"))))

(defun zeitgeist-event-interpretation (event)
  "Get the Event Interpretation of EVENT."
  (cond
    ((eq event 'zeitgeist-open-event)
       "http://www.zeitgeist-project.com/ontologies/2010/01/27/zg#AccessEvent")
    ((eq event 'zeitgeist-close-event)
       "http://www.zeitgeist-project.com/ontologies/2010/01/27/zg#LeaveEvent")
    ((eq event 'zeitgeist-create-event)
       "http://www.zeitgeist-project.com/ontologies/2010/01/27/zg#CreateEvent")
    ((eq event 'zeitgeist-modify-event)
       "http://www.zeitgeist-project.com/ontologies/2010/01/27/zg#ModifyEvent")
    (t nil)))

(defun zeitgeist-send (event fileurl filemime)
  "Send zeitgeist an event EVENT using the list FILEINFO."
  (let ((event-interpretation (zeitgeist-event-interpretation event)))
    (if (eq nil event-interpretation)
      (message "YOU FAIL")
      (zeitgeist-call "InsertEvents"
        (list (list :struct (list ""
              (zeitgeist-event-timestamp)
              event-interpretation
              "http://www.zeitgeist-project.com/ontologies/2010/01/27/zg#UserActivity"
              "application://emacs23.desktop")
        (list (list (concat "file://" fileurl)
           "http://www.semanticdesktop.org/ontologies/2007/03/22/nfo#Document"
           "http://www.semanticdesktop.org/ontologies/nfo#FileDataObject"
           (concat "file://" (file-name-directory fileurl))
           filemime
           (file-name-nondirectory (file-name-sans-versions fileurl))
           "")) ; Some black magic later?
        '(:array :byte 0)))))))

(defun zeitgeist-open-file ()
  "Tell zeitgeist we opened a file!"
  (if (eq nil (buffer-file-name))
      (message "You are not on a file.")
    (zeitgeist-send 'zeitgeist-open-event
                    buffer-file-name
                    (zeitgeist-get-mime-type))))
(defun zeitgeist-close-file ()
  "Tell zeitgeist we closed a file!"
  (if (eq nil (buffer-file-name))
      (message "You are not on a file.")
    (zeitgeist-send 'zeitgeist-close-event
                    buffer-file-name
                    (zeitgeist-get-mime-type))))
(defun zeitgeist-create-file ()
  "Tell zeitgeist we created a file!"
    (zeitgeist-send 'zeitgeist-create-event
                    buffer-file-name
                    (zeitgeist-get-mime-type)))
(defun zeitgeist-modify-file ()
  "Tell zeitgeist we modified a file!"
    (zeitgeist-send 'zeitgeist-modify-event
                     buffer-file-name
                     (zeitgeist-get-mime-type)))

(defun zeitgeist-find-file-hook ()
  "Call zeitgeist-open-file if the file exists."
  (if (file-exists-p (buffer-file-name))
      (zeitgeist-open-file)))
(defun zeitgeist-kill-buffer-hook ()
  "Call zeitgeist-close-file if the file exists."
  (if (and (not (eq nil (buffer-file-name)))
            (file-exists-p (buffer-file-name)))
      (zeitgeist-close-file)))
(defun zeitgeist-kill-emacs-hook ()
  "Call zeitgeist-close-file on all files that exist."
  (mapc '(lambda (buffer)
	   (set-buffer buffer)
	   (zeitgeist-close-file))
	  (buffer-list)))
(defun zeitgeist-before-save-hook ()
  "Call zeitgeist-modify-file or zeitgeist-create-file."
  (if (and (not (eq nil (buffer-file-name)))
            (file-exists-p (buffer-file-name)))
      (zeitgeist-modify-file)
      (zeitgeist-create-file)))

(add-hook 'find-file-hook   'zeitgeist-find-file-hook)
(add-hook 'kill-buffer-hook 'zeitgeist-kill-buffer-hook)
(add-hook 'kill-emacs-hook  'zeitgeist-kill-emacs-hook)
(add-hook 'before-save-hook 'zeitgeist-before-save-hook)

;;; zeitgeist.el ends here
