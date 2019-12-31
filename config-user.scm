;
; This file is released under the terms of the GNU General Public License
; as they appear in http://www.gnu.org/licenses/gpl.txt.
;
; Copyright 2007-2015 erwin.rieger@ibrieger.de
;

; Enable stack backtraces
; (debug-enable 'debug)
; (turn-on-debugging)

; (debug-enable 'trace)
; (debug-enable 'backtrace)

(display "Start config-user.scm\n")

(define ibr-menu-created #f)
(define ibr-debug #t)

; (display "Debug options: %s\n" (debug-options 'full))

;
; Betriebssystem-unterscheidung.
; Falls environment variable "USERPROFILE" gesetzt ist, dann gehen wir davon aus,
; dass wir unter windows laufen.
;
(define (running-on-windows)
    (getenv "USERPROFILE")
)

;
; Seit GnuCash 2.6 fehlt die "build-path" funktion, desshalb hier selbst definieren:
;
(define (build-path . elements)
    (if (running-on-windows)
        (string-join elements "\\")
        (string-join elements "/")
    )
)

(define (load-ibr-module run-on-windows)
    (let (
            (tmpdir (or (or (getenv "TMP") (getenv "TEMP")) (getenv "USERPROFILE")))
            (path (build-path (or (getenv "HOME") (getenv "USERPROFILE")) ".gnucash" "ibr-gnc-module.scm"))
        )

        ; 
        ; Unter windows eine eigene logdatei oeffnen und ausgaben
        ; (printf, backtrace) umleiten:
        ; 
        (if run-on-windows
            (begin
                (gnc:warn "IBR: logging to: " (build-path tmpdir "ibr-gnc-module.log"))
                (set-current-output-port (open-output-file (build-path tmpdir "ibr-gnc-module.log")))
                (set-current-error-port (current-output-port))
            )
        )

        (display (format #f "config-user.scm: loading %s ...\n" path))
        (load path)
        (display "config-user.scm: running ibr-init ...\n")
        (ibr-init)
    )
)

(display "Definition of 'load-ibr-module' done ...\n")

(let (
        ; (userprofile (getenv "USERPROFILE"))
    )

    (with-throw-handler #t

        (lambda ()
            (load-ibr-module (running-on-windows))
        )

        (lambda (key . parameters)
            (display "config-user.scm: Catch-Handler called, exception raised:\n")

            (display "Error '")
            (display key)

            (display "' while running load-ibr-module\nParameters: ")
            (display parameters)
            (display "\n")

            (display "config-user.scm: backtrace:\n")
            (display-backtrace (make-stack #t) (current-error-port))
            (display "config-user.scm: backtrace done.\n")
        )
    )
)

(display "End config-user.scm\n")
