(defmacro command-loop (commands)
  (list 'progn))


; Source - https://stackoverflow.com/a
; Posted by Frank Shearar, modified by community. See post 'Timeline' for change history
; Retrieved 2025-12-19, License - CC BY-SA 2.5

(defun get-file (filename)
  (with-open-file (stream filename)
    (loop for line = (read-line stream nil)
          while line
          collect line)))



