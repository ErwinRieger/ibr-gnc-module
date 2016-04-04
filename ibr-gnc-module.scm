;
; This file is released under the terms of the GNU General Public License
; as they appear in http://www.gnu.org/licenses/gpl.txt.
;
; Copyright 2007-2016 erwin.rieger@ibrieger.de
;

;
; xxx todo:
; * csv export: output verzeichnis/path konfigurierbar (mit options machbar?)
;

;
; $Log: ibr-gnc-module.scm,v $
; Revision 1.60  2016-04-04 09:26:15  bh
; * Kontennummern kÃ¶nnen nun 4 bis 6 zeichen lang sein.
; * Warnungen werden im bericht nun in blauer farbe (statt rot) ausgegeben.
; * Einige debug-ausgaben entfernt.
;
; Revision 1.59  2015-02-13 14:45:32  bh
; Cleanup, removed unused code.
;
; Revision 1.58  2014-08-29 10:47:57  bh
; AFA buchungen, eigene build-path funktion.
;
; Revision 1.57  2013-11-19 21:10:00  bh
; Fehlerbehandlung beim vorbereiten der abschreibungen anlagen verbessert.
;
; Revision 1.56  2012/05/06 12:29:32  bh
;     * removed unused code
;     * cleanup date handling
;     * re-enabled "AFA" code
;     * changed "Pruefung Jahresabschluss"
;     * changed "CSV Export"
;
; Revision 1.55  2012-01-15 21:33:01  bh
; Umsatzsteuer- und Vorsteuerverprobung aus dem Jahresabschluss-check entfernt. Ist
; durch redundant durch die Buchungs-prüfung und lohnt desshalb den (programmier-)
; aufwand nicht.
;
; Revision 1.54  2012-01-05 12:24:05  bh
; Abschreibungen: cleanup code.
;
; Revision 1.53  2011-08-06 18:50:42  bh
; Komprimierung der Beschreibungstexte beim CSV Export ueberarbeitet.
;
; Revision 1.52  2011-08-06 15:50:56  bh
; Funktion get-brutto-split() geaendert, brutto-split ist nun der split 'der alleine
; auf einer seite der transaktion steht'.
;
; Revision 1.51  2011-08-06 13:52:04  bh
; Added new file "csvreader.py" to test/compare GNC CSV files.
;
; Revision 1.50  2011-06-13 15:50:25  bh
; * Cleanup Ausgabe Meldungen, Warnungen und Fehler.
; * CSV Export: Fehlermeldung falls ein Konto mit Kontonummer 99XX exportiert werden soll.
;   Das sind interne Konten (wie z.B. "Ausgleichskonto") die beim Abschluss keine Buchungen
;   enthalten sollten.
; * Automatik-Buchungen: Berechnung Brutto wert geaendert, nun mit Abzug von manuellen Buchungen.
;
; Revision 1.49  2011/04/09 18:32:14  bh
; Menuepunkt 'UST Pruefung' entfernt, wird nun durch 'Buchungen Pruefen' gemacht.
;
; Revision 1.48  2011/04/05 12:50:44  bh
; Erste Version der neuen buchungs-automatik (GK/Tara).
;
; Revision 1.47  2011/04/04 08:13:28  testing
; Import srfi-14 fuer charset funktionen.
;
; Revision 1.46  2011/04/03 13:27:41  testing
; CSV export funktion angepasst auf ms-windows.
;
; Revision 1.45  2011/03/03 17:48:52  bh
; Changed copyright message.
;
; Revision 1.44  2011/01/03 19:45:26  bh
; Anpassungen fuer GnuCash 2.3.15, guid's fuer gnc:make-menu-item und gnc:make-extension.
;
; Revision 1.43  2010/03/08 19:00:44  bh
; Rework CSV export, strip numbers, output full description.
;
; Revision 1.42  2010/02/14 15:17:57  bh
; Wieder-aktiveirung Test Jahres-Abschluss.
;
; Revision 1.41  2010/02/14 12:11:49  bh
; Dokumentation csv-export.
;
; Revision 1.40  2010/02/11 16:48:44  bh
; Anlagen Spiegel auf geaenderte konto-hierarchie angepasst.
;
; Revision 1.39  2010/02/10 16:07:12  bh
; CSV Nochmals NoExport Flag, Konto umbenennung mit ExportKNR Flag.
;
; Revision 1.38  2010/02/08 22:17:59  bh
; CSV Export ueberarbeitet, NoExport Flag wird nun beruecksichtigt.
;
; Revision 1.37  2010/02/08 14:57:31  bh
; Anlagen Spiegel reaktiviert
;
; Revision 1.36  2010/01/13 09:45:38  bh
; Dokumentation fuer buchungs-check.
;
; Revision 1.35  2010/01/10 17:33:50  bh
; Buchungscheck: UND-verknuepfung von konten (mehrere GK descvalues) nun moeglich.
;
; Revision 1.34  2010/01/10 15:34:06  bh
; Buchungscheck: oder-verknuepfung von konten (GK descvalue) nun moeglich.
;
; Revision 1.33  2010/01/10 14:28:53  bh
; Neuer bericht 'Buchungen Pruefen', cleanup.
;
; Revision 1.32  2009/07/27 15:44:28  bh
; Optionen Datumsbereich fuer UST Pruefung und UST Buchungen eingebaut.
;
; Revision 1.31  2009/05/08 15:56:32  bh
; save work
;
; Revision 1.30  2009/04/03 11:39:42  bh
; Test Jahresuebergaenge entfernt.
;
; Revision 1.29  2009/04/03 10:41:34  bh
; Test Jahresuebergaenge ok
;
; Revision 1.28  2009/03/10 19:23:28  bh
; Save before report-guid change for 2.2.8.
;
; Revision 1.27  2009/03/08 18:12:01  bh
; scheme-modul: test jahresabschluss
;
; Revision 1.26  2009/03/06 09:11:49  bh
; save work
;
; Revision 1.25  2009/01/02 19:02:50  bh
; Eigene string-replace-char funktion, ist in GC 2.2.0/2.2.4 nicht definiert.
;
; Revision 1.24  2009/01/01 09:44:06  bh
; Umstellung auf GC 2.2.6.; UST pruefung.
;
; Revision 1.23  2008/12/28 13:10:29  bh
; Umstellung auf GC 2.2.6.
;
; Revision 1.22  2008/11/30 11:52:28  bh
; Commit for umstellung auf GC 2.2.6
;
; Revision 1.21  2008/05/02 15:33:31  bh
; Descvalue USTK UST VSTK VST.
;
; Revision 1.20  2008/05/02 10:40:48  bh
; Umstellung speicherung kontonummer.
;
; Revision 1.19  2008/05/02 07:51:47  bh
; Umstellung speicherung kontonummer.
;
; Revision 1.18  2008/04/30 13:55:23  bh
; mwst berechnung
;
; Revision 1.17  2008/02/25 10:56:37  bh
; Umstellung speicherung kontonummer.
;
; Revision 1.16  2008/02/06 10:51:19  bh
; Umstellung auf Gnucash Kontonummer
;
; Revision 1.15  2008/02/06 04:14:35  bh
; Umstellung auf Gnucash Kontonummer
;
; Revision 1.14  2008/02/05 13:00:30  bh
; Cleanup
;
; Revision 1.13  2008/01/28 22:07:12  bh
; Save Work
;
; Revision 1.12  2008/01/22 13:11:16  bh
; Save Work
;
; Revision 1.11  2007/10/23 07:49:08  bh
; Added CVS header.
;
;

;
; Scheme tutorial: A guided tour - to get a flavor of what it is:
; http://www.drscheme.org/tour/tour-Z-H-2.html
;



;
; XXX Verwirrung verschiedene datums-typen:
;
; TIMEPAIR: 2-er tupel mit sekunden und nanosek, z.b.: (1356994799 . 0)
;
; TIMESPEC: ist die C-version des TIMEPAIR, eine struktur mit sekunden und nanosek:
;   struct timespec64
;   { gint64 tv_sec; glong tv_nsec; }
;
; --> Das erklaert, warum im gnucash (scheme-) code mal von timepair und mal von timespec
;     die rede ist. Um dies klar zu machen benutzen wir hier die endung " TPTS ".
;
; Wie kann der TPTS wert modifiziert werden?:
;   * gnc:timepair-get-year       -> int
;   * gnc:timepair-start-day-time -> TPTS 
;   * gnc:timepair-end-day-time   -> TPTS 
;
;
; Dann gibt es noch einen datentype "gnc-date" der die scheme-repraesentation eines
; "struct tm" darstellt, ein 11-er tupel, z.b.:  #(59 59 23 31 11 112 1 365 0 -3600 CET)
; Beachte: das jahr (112) zaehlt ab 1900! (1900 + 112 = 2012).
; Wir nennen diesen type TMDATE.
; Modifikation eines TMDATE datums mit hilfe der "set-tm:xxx" methoden.
;
; Umwandlung der datentypen:
;
;   * TPTS -> TMDATE: gnc:timepair->date
;
;   * TMDATE -> TPTS: gnc:date->timepair
;
; Weitere datums-datentypen: GDate
;
;
; Struktur konton anlagen/abschreibungen:
;
;
; * "U" Afa überkonto, z.b. PKW EUR, dieses dient der kontrolle, ob die buchungen in den unterkonten
;   die summe 0 ergeben (TotalNullSaldo)
;   + "E" PKW EUR: hier wird die einlage, abgang und eröffnungsbuchung (max. eine) gebucht 
;   + "A" PKW EUR Abschreibungen, von hier aus buchung der abschreibungen auf die ausgaben konten
;
;   Eröffungsbuchung:
;     * ist erst im jahr nach der einlage notwendig, ansonsten ist ja die einlage-buchung
;       selber die eröffnungsbuchung.
;     * Buchung vom abschreibungskonto "A" nach "E", dadurch wird die summe in "U" nicht
;       verändert.
;
;
;
;

(printf "Start ibr-gnc-module.scm\n")

(gnc:module-load "gnucash/business-utils" 0)

(use-modules (sw_report_system))
(gnc:module-load "gnucash/report/report-system" 0)

; Charset functions:
(use-modules (srfi srfi-14))

; Locale specific functions:
; XXX nicht in gnucash enthalten?
; (use-modules (ice-9 i18n))

(use-modules (oop goops))

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

;
; Report-Guid's created with gnucash-make-guids
;
(define ust-check-guid "83d4104ad149ee4301ea545b075d78ce")
(define ust-auto-guid "45bc8986b90ac8fdf4e12f48e8e7cbe8")
(define ja-guid "07c381b543f02d425cbe35d358db575b")
;;;;;;;(define ju-guid "4a1726e5b2d8be38af744366b11f4214")
(define csv-export-guid "8200c42352489524c776a1352d01c678")
(define afa-spiegel-guid "4dabd98eefb65f81efcbad5858962621")
(define afa-vorbereitung-guid "3e09c11f9506a4250c9e0523a1749d84")
(define afa-vorbereitung2-guid "3e09c11f9506a4250c9e0523a1749d85")
(define afa-uebernahme-guid "e3ac44ac1379a7f2126a90af13495b44")
; (define buchungs-check-guid "96b9e8a04f786e8b1f6bfd5101716775")

;
; Menu-Guid's
;
; (define buchungs-check-menu-guid "590c9f3f475af2cae8521b677f931c20")
(define ust-check-menu-guid "007a10721668e208086f08e9f897a2f6")
(define ja-menu-guid "c5ca2f905af8d00a2d7accff09fb5040")
(define csv-export-menu-guid "d951dfb02abc2a82f192c6f928f5ea5e")
(define afa-spiegel-menu-guid "9b28348edf9d912ed96f4c462e05586e")
(define afa-vorbereitung-menu-guid "c62419c2c00ce924c1edac28e1b8ed2d")
(define afa-vorbereitung2-menu-guid "c62419c2c00ce924c1edac28e1b8ed2e")
(define reload-ibr-gnc-module-menu-guid "d935555b873d42b8b8ce002ad9dd4674")

;
; Extension-Guid's
;
(define cc-sep-guid "f7bba99fb7c0daad88824044a637b98c")
(define dd-sep-guid "3b91ed5a95ba7eafb7fcc98851d9e628")
(define ff-sep-guid "f13a4f0d985d025ca42d613f3c55b8d7")

; 3d21c96fd340b0ff385fce6cf3fb22cc
; abc44b72077c1467baa406463fdd4f82
; 0e532714e80a90f9b9d62c17635beb4e
; cfebb451bab278813a389aaff655bbbc
; 44d8fb47693b254c63a8156ea97b6ef6
; a056a13127f45c8badbd7488a9f78d76
;
(define optname-from-date (N_ "From"))
(define optname-to-date (N_ "To"))
(define optname-enter-tax-splits (N_ "Fehlende Buchungsteile automatisch anlegen"))
(define optname-run-cvs-export (N_ "Daten im CSV Format exportieren"))
(define optname-run-afa-buchung (N_ "AFA Buchungen anlegen"))

; Drei verschiedene bank konten, 1800/1810 bank, 1600 kasse 
; xxx und 2199 einlagen
(define (is-bank-knr knr)
    (or (string=? (substring knr 0 2) "18") (string=? (substring knr 0 2) "16"))
)

; Verschiedene vorsteuer konten, 1401_7%, 1400_16% und 1400_15%
;,,,,,(define (is-vorsteuer-knr knr)
    ;,,,,,; (string=? (substring knr 0 3) "140")
    ;,,,,,(false-if-exception (string=? (substring knr 0 3) "140"))
;,,,,,)

; Verschiedene ust konten, 3800_16% und 3800_15%
; (define (is-ust-knr knr)
    ; (string=? (substring knr 0 3) "380")
; )
;
; Konto ueber kontonummer oder kontobeschreibung (datev nummer) suchen
; xxx find-acc-in-childs-by-code durch find-acc-in-acclist-by-code ersetzen
(define (find-acc-in-acclist-by-code accountlist accountcode)

  (if (null? accountlist)

    #f

    (let (
            (account (car accountlist))
        )

        ; (printf "find-acc-in-acclist-by-code search: %s, code: %s, desc: %s\n" accountcode (xaccAccountGetCode account) (xaccAccountGetDescription account))

        (if (or (string=? accountcode (xaccAccountGetCode account)) (string=? accountcode (xaccAccountGetDescription account)))
            account
            (find-acc-in-acclist-by-code (cdr accountlist) accountcode)
        )
    )
  )
)


; Liefert eur ust konto fuer steuersatz
(define (get-eur-ust-konto ustsatz)
    (find-acc-by-code (string-append "9994_" (number->string ustsatz) "%"))
)

; Zugehoeriges afa konto fuer gegebenes anlagen konto finden
(define (get-afa-account-knr doc account)
    (let (
            (splitted (string-split (get-account-knr doc account) #\|))
        )
        (if (> (length splitted) 1)
            (list-ref splitted 0)
            #f
        )
    )
)

;
; Zugehoeriges anfangs-bestands konto fuer gegebenes anlagen konto finden
;
; (define (get-anf-account-knr doc account)
    ; (let (
            ; (splitted (string-split (get-account-knr doc account) #\|))
        ; )
        ; (if (> (length splitted) 1)
            ; (list-ref splitted 1)
            ; #f
        ; )
    ; )
; )

(define (is-bank-split doc split)
    (is-bank-knr (get-split-knr doc split))
)

;,,,,,(define (is-vorsteuer-split doc split)
    ;,,,,,(is-vorsteuer-knr (get-split-knr doc split))
;,,,,,)

; (define (is-ust-split doc split)
    ; (is-ust-knr (get-split-knr doc split))
; )

; 0
(define numeric0 (gnc-numeric-zero))
; 1
(define numeric1 (double-to-gnc-numeric 1 100 GNC-RND-ROUND))
; 100
(define numeric100 (double-to-gnc-numeric 100 100 GNC-RND-ROUND))

;
; Liefert datev kontonummer zu account,
; die gnucash kontonummer falls vorhanden
;
(define (get-account-knr doc account)
    (let (
            (knr (xaccAccountGetCode account))
        )

        (if (and (> (string-length knr) 3) (< (string-length knr) 7))
            knr
            (if (= (length (xaccAccountGetSplitList account)) 0)
                knr
                (begin
                    ; Account hat keine knr oder knr hat nicht 4 oder 5 stellen, fehler falls das konto
                    ; buchungen enthaelt
                    (html-add-text doc "<br>" (redText "ERROR") ", Konto: '" (xaccAccountGetName account) "' hat eine ungueltige Kontonummer!<br><br>")
                    "0000"
                )
            )
        )
    )
)

(define (get-split-knr doc split)

    ; Splits ohne account (?!) abfangen
    (if (xaccSplitGetAccount split)
        (get-account-knr doc (xaccSplitGetAccount split))
        "NO_ACCOUNT_IN_SPLIT"
    )
)

; ausgabe html text
(define (html-add-text doc . text)
    (gnc:html-document-add-object! doc
        (gnc:make-html-text-internal text (gnc:make-html-style-table)))
)

; ausgabe transaktion mit link
(define (html-add-trn doc trn)
    (printf "transaction num in html-add-trn: '%s'\n" (xaccTransGetNum trn))
    (gnc:html-document-add-object! doc (gnc:html-transaction-anchor trn (gnc-print-date (gnc-transaction-get-date-posted trn))))
    (gnc:html-document-add-object! doc "; ")
    (gnc:html-document-add-object! doc (xaccTransGetDescription trn))
)

(define (redText text)
    (string-append "<font color=\"red\">" text "</font>")
)

(define (greenText text)
    (string-append "<font color=\"green\">" text "</font>")
)

(define (blueText text)
    (string-append "<font color=\"blue\">" text "</font>")
)

; numeric in text umwandeln, fuer html ausgabe
(define (num-to-text num)
    (gnc:default-html-gnc-numeric-renderer num #f)
)

; numeric mit waehrung in text umwandeln, fuer html ausgabe
(define (num-comm-to-text num comm)
    (string-append (num-to-text num) " " (gnc-commodity-get-mnemonic comm))
)

(define (num-account-comm-to-text num acc)
    (num-comm-to-text num (xaccAccountGetCommodity acc))
)

;;;;;;;;;;; Liefert alle anlagen accounts, ohne GWG
;;;;;;;;;;(define (get-anlagen-konten)
    ;;;;;;;;;;(gnc-account-get-descendants-sorted (find-acc-by-code "0100"))
;;;;;;;;;;)

; Liefert alle anlagen accounts, mit GWG
;; (define (get-anlagen-konten-gwg book)
    ;; (gnc-account-get-descendants-sorted (find-acc-in-childs-by-code (gnc:book-get-group (gnc:session-get-book session)) "0000"))
;; )
(define (get-anlagen-konten-gwg book)
    (let (
            (root-account (gnc-book-get-root-account book))
        )
        (gnc-account-get-descendants-sorted (find-acc-by-code-with-root-account root-account "0000"))
    )
)

; Pruefung ob afa konten vorhanden
(define (afaKontenCheck doc)
    (let (
            ; (anlagenaccounts (get-anlagen-konten))
            (anlagenaccounts (find-accounts-has-desc-value-no-descendants doc "AFAK"))
            (result #t)
        )
        ; (display anlagenaccounts) (printf "<afa-anlaccounts\n")

        (if (equal? anlagenaccounts '())
            (begin
                (html-add-text doc "Keine Anlagenkonten gefunden !<br>")
                (set! result #f)
            )
        )
        (map (lambda (acc)
                (let (
                        (afaAcc (get-gegenkonto-by-desc-value doc "AFAK" acc))
                    )

                    (if (not afaAcc)
                        (begin
                            (html-add-text doc "Afa Konto (AFAK) nicht gefunden f&uuml;r Konto: " (xaccAccountGetName acc) "!<br>")
                            (set! result #f)
                        )
                    )
                )
            )
            anlagenaccounts
        )
        result
    )
)

;; (define (find-acc-in-group-by-desc account-group accountdesc)
    ;; (let (
            ;; ; (children-list (gnc:group-get-account-list account-group))
            ;; (children-list (gnc-account-get-children account-group))
        ;; )
        ;; (if (not (null? children-list))
            ;; (find-acc-in-childs-by-code children-list accountdesc)
            ;; #f
        ;; )
    ;; )
;; )

; Konto ueber kontobeschreibung (datev nummer) suchen
; (define (find-acc-in-childs-by-code accountlist code)
    ; (let (
            ; (account (car accountlist))
            ; (restlist (cdr accountlist))
        ; )

        ; (printf "find account, %s code %s\n" code (xaccAccountGetCode account))

        ; (if (string=? code (xaccAccountGetCode account))
            ; account
            ; (let (
                    ; (acc (find-acc-in-group-by-code (gnc-account-get-children account) code))
                    ; (acc (find-acc-in-group-by-code account code))
                ; )
                ; (printf "after find-acc-in-group-by-code\n")
                ; (if (and (not acc) (not (null? restlist)))
                    ; (find-acc-in-childs-by-code restlist code)
                    ; acc
                ; )
            ; )
        ; )
    ; )
; )

;; (define (find-acc-in-group-by-code account-group code)
    ;; (let (
            ;; ; (children-list (gnc:group-get-account-list account-group))
            ;; (children-list (gnc-account-get-children account-group))
        ;; )
        ;; (if (not (null? children-list))
            ;; (find-acc-in-childs-by-code children-list code)
            ;; #f
        ;; )
    ;; )
;; )


; Suche account mit bestimmter kontonummer.
(define (find-acc-by-code-with-root-account root-account code)
    (let (
            (all-accounts (gnc-account-get-descendants-sorted root-account))
        )
        (find-acc-in-acclist-by-code all-accounts code)
    )
)

; Wie find-acc-by-code-with-root-account, jedoch mit current-root-account.
; xxx replace find-acc-in-group-by-code with this:
(define (find-acc-by-code code)
    (find-acc-by-code-with-root-account (gnc-get-current-root-account) code)
)

; Oeffnet session, liefert #f falls datei nicht vorhanden
; xxx funktioniert nicht: (gnc:url->loaded-session path #f #f)
(define (openSession path)
  (let* (
            (session (qof-session-new))
        )

        ; Clear session-error flag
        (if (qof-session-has-error session)
            (qof-session-pop-error session)
        )
    
        ; Wir ignorieren locks hier, die session sollte also nur fuer read only
        ; zugriffe verwendet werden !
        (qof-session-begin session path #t #f)

        ; (if (gw:enum-<gnc:BackendError>-val->sym (gnc:session-get-error session) #f)
        (if (not (qof-session-has-error session))
            (begin
                (gnc-session-scm-load session)
                ; (if (gw:enum-<gnc:BackendError>-val->sym (gnc:session-get-error session) #f)
                (if (not (qof-session-has-error session))
                    session
                    (begin
                        (qof-session-destroy session)
                        #f
                    )
                )
            )
            (begin
                (qof-session-destroy session)
                #f
            )
        )
    )
)

; Oeffnet session, oder liefert die aktuelle session
(define (openSessionOrCurrent name)
    (let (
            (cursession (gnc-get-current-session)) ; use our new call !
            (path (gnc-book-path name))
        )

        (printf "path to open: %s, current open: %s\n" path (qof-session-get-url cursession))
        (if (string=? path (qof-session-get-url cursession))
            cursession ; return current session
            (openSession path) ; open new session
        )
    )
)

; Schliesst session falls es nicht die aktuelle session ist
(define (closeSessionNotCurrent session)
    (let (
        (curpath (qof-session-get-url (gnc-get-current-session)))
        (path (qof-session-get-url session))
        )
        (if (not (string=? curpath path))
          (begin
            ; Done by session-destroy: (gnc:session-end session)
            (qof-session-destroy session)
           )
        )
    )
)


; transaktion mit nummer num im account suchen
(define (query-by-account-and-num book account num)
    (let ( 
            ; (query (gnc:malloc-query))
	                        (query (qof-query-create-for-splits))
            (splits #f)
        )
        (qof-query-set-book query book)
        (xaccQueryAddSingleAccountMatch query account QOF-QUERY-AND)
        (xaccQueryAddNumberMatch query num 0 1 QOF-QUERY-AND)

        (set! splits (xaccQueryGetSplitsUniqueTrans query))
        (qof-query-destroy query)
        splits
    )
)

(define (jaTestNullSaldo doc konto date)
    (let (
            (saldo (gnc:account-get-balance-at-date konto date #t))
        )

        (if (gnc-numeric-zero-p saldo)
            (html-add-text doc 
                "Saldo ist 0 in Konto '" (xaccAccountGetName konto) "' (" (get-account-knr doc konto) ") " (greenText "OK") "<br>")
            (html-add-text doc 
                "Saldo ist nicht 0 in Konto '" (xaccAccountGetName konto) "' (" (get-account-knr doc konto) "): "
                (num-account-comm-to-text saldo konto)
                " " (redText "NOTOK") "<br>")
        )
    )
)

(define (jaTestTotalNullSaldo doc konto date)
    (let (
            ; (saldo (xaccAccountGetBalance konto))
            (saldo (gnc:account-get-balance-at-date konto (get-TPTS-at-date 0 0 0 1 1 2038) #t))
        )

        (if (gnc-numeric-zero-p saldo)
            (html-add-text doc 
                "Saldo ist 0 in Konto '" (xaccAccountGetName konto) "' (" (get-account-knr doc konto) ") " (greenText "OK") "<br>")
            (html-add-text doc 
                "Saldo ist nicht 0 in Konto '" (xaccAccountGetName konto) "' (" (get-account-knr doc konto) "): "
                (num-account-comm-to-text saldo konto)
                " " (redText "NOTOK") "<br>")
        )
    )
)

; liefert fuer gegebenes konto den dafuer relevanten steuersatz, oder 0
(define (get-ust-satz-from-knr knr)
    (let ( 
            (splitted (string-split knr #\_))
        )

        (printf "splitted:")
        (display splitted)
        (printf "\n")

        (if (> (length splitted) 1)
            (let (
                    (satz (list-ref (string-split (list-ref splitted 1) #\%) 0))
                )
                ; (printf "get-ust-satz-from-acc-desc: steuersatz fuer konto %s: %s\n" knr satz)
                (string->number satz)
            )
            0
        )
    )
)

(define (get-desc-value key doc account searchParents)

    (let (
            (result #f)
        )

        (if (not (null? account))
            (begin

                ; (display account)
                ; (printf "<<get-desc-value account\n")
                ; (printf "<<get-desc-value account-desc: %s/%s\n" (xaccAccountGetName account) (xaccAccountGetDescription account))

                (map (lambda (token)
                        (let (
                                (splitted (string-split token #\=))
                            )
                
                            ; (printf "<<get-desc-value token:%s\n" token)
                            (if (string-ci=? (list-ref splitted 0) key)
                                ; Eintraege ohne wert (boolean) beachten
                                (if (> (length splitted) 1)
                                    (set! result (list-ref splitted 1))
                                    (set! result "TRUE")
                                )
                            )
                        )
                    )
                    (string-split (xaccAccountGetDescription account) #\ )
                )

                (if (and (not result) searchParents)
                    ; parents durchsuchen
                    (if (gnc-account-get-parent account)
                        (set! result (get-desc-value key doc (gnc-account-get-parent account) #t))
                    )
                )

                ; (if result
                    ; (printf "get-desc-value %s:'%s'\n" key result)
                ; )
            )
        )
        result
    )
)

;
; Wie get-desc-value, liefert aber liste mit ggf. mehreren descvalues
; zurueck.
;
(define (get-desc-values key doc account)

    (let (
            (result '())
        )

        ; (display account)
        ; (printf "<<get-desc-value account\n")
        ; (printf "<<get-desc-value account-desc: %s/%s\n" (xaccAccountGetName account) (xaccAccountGetDescription account))

        (map 
            (lambda (token)
                (let
                    (
                        (splitted (string-split token #\=))
                    )
        
                    ; (printf "<<get-desc-value token:%s\n" token)
                    (if (string-ci=? (list-ref splitted 0) key)
                        ; Eintraege ohne wert (boolean) beachten
                        (if (> (length splitted) 1)
                            (set! result (append result (list (list-ref splitted 1))))
                            (set! result (append result (list "TRUE")))
                        )
                    )
                )
            )
            (string-split (xaccAccountGetDescription account) #\ )
        )

        ; Parents durchsuchen
        (if (not (equal? account (gnc-get-current-root-account)))
            (if (gnc-account-get-parent account)
                (set! result (append result (get-desc-values key doc (gnc-account-get-parent account))))
            )
        )

        result
    )
)

(define (get-desc-numeric-value key doc account)

    (let (
            (stringval (get-desc-value key doc account #t))
        )
        (if stringval
            (string->number stringval)
            #f
        )
    )
)
 
(define (get-gegenkonto-by-desc-value doc key account)

    (let (
            (gk-account-knr (get-desc-value key doc account #t))
        )

        (if gk-account-knr
            (find-acc-by-code gk-account-knr)
            #f
        )
    )
)


; besorgt descvalue mit schluessel key aus gegenkonto
; gegenkonto wird durch descvalue mit dem schluessel kkey bestimmt
(define (get-gegenkonto-desc-value doc kkey key account)

    (let (
            (gegenkonto (get-gegenkonto-by-desc-value doc kkey account))
        )

        (if gegenkonto
            (get-desc-value key doc gegenkonto #t)
            #f
        )
    )
)

; (define (get-gegenkonto-desc-value doc kkey key account)

    ; (let (
            ; (gk-account-knr (get-desc-value kkey doc account #t))
        ; )

        ; (if gk-account-knr
            ; (let (
                    ; (gegenkonto (find-acc-by-code gk-account-knr))
                ; )

                ; (if gegenkonto
                    ; (get-desc-value key doc gegenkonto #t)
                    ; #f
                ; )
            ; )
            ; #f
        ; )
    ; )
; )

(define (get-gegenkonto-desc-numeric-value doc kkey key account)

    (let (
            (stringval (get-gegenkonto-desc-value doc kkey key account))
        )

        ; (printf "stringval: %s" stringval)

        (if stringval
            (string->number stringval)
            #f
        )
    )
)

(define (get-account-desc-numeric-value-from-split doc key split)

    (get-desc-numeric-value key doc (xaccSplitGetAccount split))
)

(define (unused-get-ust-satz-from-account doc account)

    (let (
            (ust (get-desc-value "Mwst" doc account #t))
        )

        (printf "ust<")
        (display ust)
        (printf ">\n")

        (if ust
            (string->number ust)
            0
        )
    )
)

; berechne umsatzsteuer ausgehend vom brutto wert, z.b. x * 16 / 116
(define (get-ust-from-brutto value ustsatz)
    (let (
            (ustnumeric (double-to-gnc-numeric ustsatz 100 GNC-RND-ROUND))
            (ust-value #f)
            (nenner #f)
        )
        (set! ust-value (gnc-numeric-mul value ustnumeric 100 GNC-RND-ROUND))
        (set! nenner (gnc-numeric-add-fixed ustnumeric numeric100))
        (gnc-numeric-div ust-value nenner 100 GNC-RND-ROUND)
    )
)

; berechne umsatzsteuer ausgehend vom netto wert, z.b. x * 16 / 100
(define (get-ust-from-netto value ustsatz)
    (let (
            (ustnumeric (double-to-gnc-numeric ustsatz 100 GNC-RND-ROUND))
            (ust-value #f)
        )
        (set! ust-value (gnc-numeric-mul value ustnumeric 100 GNC-RND-ROUND))
        (gnc-numeric-div ust-value numeric100 100 GNC-RND-ROUND)
    )
)

(define (numeric-delta-compare a b delta)
    (let (
            (value-diff (gnc-numeric-sub-fixed a b))
        )
        (<= (gnc-numeric-to-double (gnc-numeric-abs value-diff)) delta)
    )
)

; Umrechnung DEM-DEM oder DEM-EUR, fehler bei EUR-DEM
(define (comm-umrechnung doc quell-konto value ziel-comm)
    (let (
            ; quellwaehrung aus akt. konto
            (quell-comm (xaccAccountGetCommodity quell-konto))
        )

        (if (not (waehrungs-vergleich quell-comm ziel-comm))
            (if (ist-euro-waehrung quell-comm)
                (begin
                    (html-add-text doc (redText "ERROR") ", umrechnung von EUR in DM !, Quellkonto: " 
                        (xaccAccountGetName quell-konto) "' (" (get-account-knr doc quell-konto) ") <br>")
                    numeric0
                )
                ; umrechnung DM -> EUR
                (gnc-convert-to-euro quell-comm value)
            )
            value
        )
    )
)

(define (notused)
        ; Vorsteuer
        (let (
                ; (eurvorsteuerkonto (find-acc-in-childs-by-code (gnc-account-get-children root-account) "9998"))
                (eurvorsteuerkonto (find-acc-by-code "9998"))
                (eurvorsteuersaldo #f)
                (vorsteuer numeric0)
                ; (ausgabenaccounts (gnc-account-get-descendants-sorted (find-acc-in-childs-by-code root-account "6002")))
                ; (ausgabenaccounts (gnc-account-get-descendants-sorted (find-acc-in-childs-by-code (gnc-account-get-children root-account) "6000")))
                (ausgabenaccounts (gnc-account-get-descendants-sorted (find-acc-by-code "5000")))
            )
            (set! eurvorsteuersaldo (xaccAccountGetBalance eurvorsteuerkonto))


;;;;;;;;;;;;;,,XXXXXX
;;;;;;;;;;;;;,,neuer ansatz, der gleichzeitig ausgaben und afa/gwg-einkaeufe erschlaegt:
;;;;;;;;;;;;;,,* gehe ueber alle trn/splits,
;;;;;;;;;;;;;,,* summiere vst mittels (set! ustsatz (get-account-desc-numeric-value-from-split doc "VST" split)) auf
;;;;;;;;;;;;;,,* vergleiche mit saldo aus konto 9998
;;;;;;;;;;;;;,,XXX  fuer konto 9998 ein descvalue einfuehren



            ; Ausgaben, schleife ueber alle ausgaben konten:
            (for-each (lambda (account)
                    (let (
                            (saldo (xaccAccountGetBalance account))
                            (ustsatz (get-ust-satz-from-knr (get-account-knr doc account)))
                            (ustnumeric #f)
                        )

                        ; (printf "ust-satz: %d\n" ustsatz)
                        (set! ustnumeric (double-to-gnc-numeric ustsatz 100 GNC-RND-ROUND))

                        ; ust berechnen
                        (set! saldo (gnc-numeric-mul saldo ustnumeric 100 GNC-RND-ROUND)) ; z.B. x * 16
                        (set! saldo (gnc-numeric-div saldo numeric100 100 GNC-RND-ROUND)) ; / 100

                        ; aufsummieren, hier kann kein rundungsfehler passieren
                        (set! vorsteuer (gnc-numeric-add-fixed vorsteuer saldo))
                        ; (printf "xxxvorsteuer: %s, sum: %s\n" (gnc-numeric-to-string  saldo) (gnc-numeric-to-string  vorsteuer))
                    )
                )
                ausgabenaccounts
            )

            (printf "vorsteuer 1: %s\n" (gnc-numeric-to-string vorsteuer))
            ; Eingekaufte anlagen
            (let (
                    ; (query (gnc:malloc-query))
	                (query (qof-query-create-for-splits))
                    (anlagenaccounts (get-anlagen-konten-gwg (gnc-get-current-book)))
                )

                (qof-query-set-book query (gnc-get-current-book))
                (xaccQueryAddAccountMatch query anlagenaccounts QOF-GUID-MATCH-ANY QOF-QUERY-AND)

                ; schleife ueber alle gefundenen buchungen
                (map (lambda (trn)
                        (let (
                                (ustsatz #f)
                                (bank-split-value numeric0)
                            )

                            ; bank und ust split suchen
                            (map (lambda (split)
                                    (if (is-bank-split doc split)
                                        ; den bank - split mit dem brutto einkaufswert der anlage gefunden
                                        ; ggf. mehrere splits in trn aufsummieren
                                        (set! bank-split-value (gnc-numeric-add-fixed bank-split-value (xaccSplitGetValue split)))
                                    )
                                    (set! ustsatz (get-account-desc-numeric-value-from-split doc "VST" split))
                                )
                                (xaccTransGetSplitList trn)
                            )

                            ;;;;;;; falls es ein einkauf ist ...
                            ;;;;;;(if bank-split-value
                                ;if (> ustsatz 0)
                                (if ustsatz
                                    (begin
                                        (printf "afa einkauf: bank-value: %s, ust satz: %d\n" (gnc-numeric-to-string bank-split-value) ustsatz)
                                        ; aufsummieren
                                        (set! vorsteuer (gnc-numeric-add-fixed vorsteuer 
                                            (gnc-numeric-neg (get-ust-from-brutto bank-split-value ustsatz))))
                                        ; (printf "xxxvorsteuer: %s , sum: %s\n" (gnc-numeric-to-string  (gnc-numeric-neg (get-ust-from-brutto bank-split-value ustsatz))) (gnc-numeric-to-string  vorsteuer))
                                    )
                                )
                                ; geht nicht, afa eroeffnung wird als fehler erkannt:
                                ;   (begin
                                    ;   (html-add-text doc (blueText "Warnung:") " AFA - Einkauf '")
                                    ;   (html-add-trn doc trn)
                                    ;   (html-add-text doc "' ohne mehrwertsteuer buchung !<br><br>")
                                ;   )
                            ;;;;;;)
                        )
                    )

                    (xaccQueryGetTransactions query QUERY-TXN-MATCH-ANY)
                )

                (qof-query-destroy query)
            )

            (printf "vorsteuer2: %s\n" (gnc-numeric-to-string vorsteuer))

            (if (numeric-delta-compare vorsteuer eurvorsteuersaldo 1)
                (html-add-text doc
                    "Ausgaben Vorsteuer Verprobung ist " (greenText "OK") "<br>")
                (begin
                    (html-add-text doc
                        "Berechnete Vorsteuer: " (num-account-comm-to-text vorsteuer eurvorsteuerkonto)
                        " ist ungleich EUR Vorsteuer: " (num-account-comm-to-text eurvorsteuersaldo eurvorsteuerkonto)
                        " " (redText "NOTOK") "<br>")
                )
            )

            (html-add-text doc "<br>")

            ; auch bei verkauf afa faellt ust an !
            (html-add-text doc "xxx afa verkaufs test nicht implementiert !<br><br>")
        )

)


; Hook for reload
(define (jaRenderer report-obj)

    (jaPruefung report-obj (gnc:make-html-document))
)

; Pruefung auf korrekten jahresabschluss
(define (jaPruefung report-obj doc)
    (let* (
            ; (root-account (gnc:book-get-group (gnc-get-current-book)))
            (root-account (gnc-get-current-root-account))
            ; summe eingenommene ust ueber alle ust steuersaetze
            (summe-eurust numeric0)
            ; Summe vorsteuer aus allen einkaeufen
            (vorsteuer numeric0)

            (startdate (gnc:timepair-start-day-time
                (gnc:date-option-absolute-time 
                    (report-get-option report-obj gnc:pagename-general optname-from-date))))
            (enddate (gnc:timepair-end-day-time 
                (gnc:date-option-absolute-time 
                    (report-get-option report-obj gnc:pagename-general optname-to-date))))

            ; (eurvorsteuerkonto (find-acc-by-code "9998"))
            ; (eurvorsteuersaldo (xaccAccountGetBalance eurvorsteuerkonto))
            (eurvorsteuersaldo numeric0)
        )
        (html-add-text doc "<h2>Ergebnis Pruefung des Jahresabschluss:</h2>")

        (html-add-text doc "Vom " (gnc-print-date startdate) " bis " (gnc-print-date enddate) "</p>")

        (html-add-text doc "<p><h4>Pruefe Saldierungen (NullSaldo-Flag):</h4></p>")

        ; Saldierung auf 0 pruefen
        (map (lambda (account)

                (printf "Saldierung auf 0 pruefen, acc: %s %s\n" (xaccAccountGetCode account) (xaccAccountGetDescription account))

                (jaTestNullSaldo doc account enddate)
            )
            (find-accounts-has-desc-value-no-descendants doc "NullSaldo")
        )

        (html-add-text doc "<p><h4>Pruefe Totale Saldierungen (TotalNullSaldo-Flag):</h4></p>")

        ; Saldierung auf 0 pruefen
        (map (lambda (account)

                (printf "Saldierung auf 0 pruefen, acc: %s %s\n" (xaccAccountGetCode account) (xaccAccountGetDescription account))

                (jaTestTotalNullSaldo doc account enddate)
            )
            (find-accounts-has-desc-value-no-descendants doc "TotalNullSaldo")
        )

        ;;;;;;;;;;; ; eur verprobung
        ;;;;;;;;;;; (html-add-text doc "<p><h4>Umsatzsteuer Verprobung:</h4></p>")


        ; Pruefe anzahl splits in transaktion (nur ein bruttosplit erlaubt)
        (let (
                 (query (qof-query-create-for-splits))
                 (splitsOk #t)
            )

            (html-add-text doc "<h4>Pruefe Anzahl Splits/Bruttowerte:</h4>")

            ; Select alle transaktionen
            (qof-query-set-book query (gnc-get-current-book))

            (map (lambda (trn)
                    (let (
                            (splits (xaccTransGetSplitList trn))
                        )
                        (if (> (length splits) 1)
                            (get-brutto-split doc trn)
                            (begin
                                (html-add-text doc "Buchung enth&auml;lt keinen oder nur einen split: ")
                                (html-add-trn doc trn)
                                (html-add-text doc "' " (redText "NOTOK") " <br>")
                                (set! splitsOk #f)
                            )
                        )
                    )
                )
                (xaccQueryGetTransactions query QUERY-TXN-MATCH-ANY)
            )

            (qof-query-destroy query)

            (if splitsOk
                (html-add-text doc (greenText "OK") "<br>")
            )
        )

        doc
    )
)

(define (add-tara-split doc trn netto-split tara-value tara-account)
    (let (
            ; Umsatzsteuer berechnen:
            (tara-split (xaccMallocSplit (gnc-get-current-book)))
            (account-guid (gncAccountGetGUID tara-account))
            (netto-value (xaccSplitGetValue netto-split))
        )

        (printf "add-tara-split value<")
        (display tara-value)
        (printf ">\n")

        (html-add-text doc ", Tara Split wird angelegt...<br>")

        (printf "add-tara-split tara-account<")
        (display tara-account)
        (printf ">\n")

        ; Neuen Tara split einfuegen
        (xaccTransBeginEdit trn)

        (xaccSplitSetValue tara-split tara-value)
        (xaccSplitSetAmount tara-split tara-value)

        ; Identifizierung automatische tara buchungen
        (xaccSplitSetMemo tara-split (xaccAccountGetName tara-account))

        (xaccSplitSetAccount tara-split tara-account)
        (xaccSplitSetParent tara-split trn)

        (xaccSplitSetValue netto-split (gnc-numeric-sub-fixed netto-value tara-value))
        (xaccSplitSetAmount netto-split (gnc-numeric-sub-fixed netto-value tara-value))

        (xaccTransCommitEdit trn)
    )
)

(define (notused-add-ust-split doc trn ustsatz netto-value account)
    (let (
            ; Umsatzsteuer berechnen:
            (ust-value (get-ust-from-brutto netto-value ustsatz))
            (ust-split (xaccMallocSplit (gnc-get-current-book)))
            ;; (aktiva-accounts 
                ;; (gnc-account-get-descendants-sorted 
                    ;; (find-acc-in-childs-by-code (gnc:book-get-group (gnc:session-get-book  (gnc:get-current-session))) "4001")))
            (ust-account (get-gegenkonto-by-desc-value doc "USTK" account))
            (netto-split #f)
            (account-guid (gncAccountGetGUID account))
        )

        (printf "notused-add-ust-split value<")
        (display ust-value)
        (printf ">\n")

        (html-add-text doc ", UST split wird angelegt...")

        ; Einnahmensplit suchen und aktualisieren
        (map (lambda (split)

                (if (string=? account-guid (gncAccountGetGUID (xaccSplitGetAccount split)))
                    (set! netto-split split)
                )
            )
            (xaccTransGetSplitList trn)
        )

        ; (set! split (xaccTransGetSplit last-afa-trn 0))
        ; (set! value-diff (gnc-numeric-sub-fixed (xaccSplitGetValue anl-split) afa-value-sum))
        ; (set! last-value (gnc-numeric-add-fixed last-value value-diff))

        ; Schleife ueber alle aktiva konten:
        ;; (for-each (lambda (ust-acc)
                ;; (if (= (get-ust-satz-from-account doc ust-acc) ustsatz)
                    ;; (set! ust-account ust-acc)
                ;; )
            ;; )
            ;; aktiva-accounts
        ;; )

        (printf "add-ust-split ust-account<")
        (display ust-account)
        (printf ">\n")

        ; Neuen UST split einfuegen
        (if ust-account
            (begin
                (xaccTransBeginEdit trn)

                (xaccSplitSetValue ust-split ust-value)
                (xaccSplitSetAmount ust-split ust-value)

                ; Identifizierung automatische UST buchungen
                (xaccSplitSetMemo ust-split  (string-append "UST " (number->string ustsatz) "%"))

                (xaccSplitSetAccount ust-split ust-account)
                (xaccSplitSetParent ust-split trn)

                (xaccSplitSetValue netto-split (gnc-numeric-sub-fixed netto-value ust-value))
                (xaccSplitSetAmount netto-split (gnc-numeric-sub-fixed netto-value ust-value))

                (xaccTransCommitEdit trn)
            )
            (html-add-text doc (redText "Fehler") ", UST Konto fuer " (number->string ustsatz) "% nicht gefunden !<br>")
        )
    )
)

(define (add-vorsteuer-split doc trn ustsatz netto-value account)
    (let (
            ; Umsatzsteuer berechnen:
            (ust-value (get-ust-from-brutto netto-value ustsatz))
            (ust-split (xaccMallocSplit (gnc-get-current-book)))
            ;; (aktiva-accounts 
                ;; (gnc-account-get-descendants-sorted 
                    ;; (find-acc-in-childs-by-code (gnc:book-get-group (gnc:session-get-book  (gnc:get-current-session))) "4001")))
            (ust-account (get-gegenkonto-by-desc-value doc "VSTK" account))
            (netto-split #f)
            (account-guid (gncAccountGetGUID account))
        )

        (printf "add-vorsteuer-split value<")
        (display ust-value)
        (printf ">\n")

        (html-add-text doc ", Vorsteuer split wird angelegt...")

        ; Einnahmensplit suchen und aktualisieren
        (map (lambda (split)

                (if (string=? account-guid (gncAccountGetGUID (xaccSplitGetAccount split)))
                    (set! netto-split split)
                )
            )
            (xaccTransGetSplitList trn)
        )

        ; (set! split (xaccTransGetSplit last-afa-trn 0))
        ; (set! value-diff (gnc-numeric-sub-fixed (xaccSplitGetValue anl-split) afa-value-sum))
        ; (set! last-value (gnc-numeric-add-fixed last-value value-diff))

        ; Schleife ueber alle aktiva konten:
        ;; (for-each (lambda (ust-acc)
                ;; (if (= (get-ust-satz-from-account doc ust-acc) ustsatz)
                    ;; (set! ust-account ust-acc)
                ;; )
            ;; )
            ;; aktiva-accounts
        ;; )

        (printf "add-vorsteuer-split ust-account<")
        (display ust-account)
        (printf ">\n")

        ; Neuen Vorsteuer split einfuegen
        (if ust-account
            (begin
                (xaccTransBeginEdit trn)

                (xaccSplitSetValue ust-split ust-value)
                (xaccSplitSetAmount ust-split ust-value)

                ; Identifizierung automatische UST buchungen
                (xaccSplitSetMemo ust-split  (string-append "Vorsteuer " (number->string ustsatz) "%"))

                (xaccSplitSetAccount ust-split ust-account)
                (xaccSplitSetParent ust-split trn)

                (xaccSplitSetValue netto-split (gnc-numeric-sub-fixed netto-value ust-value))
                (xaccSplitSetAmount netto-split (gnc-numeric-sub-fixed netto-value ust-value))

                (xaccTransCommitEdit trn)
            )
            (html-add-text doc (redText "Fehler") ", Vorsteuer Konto fuer " (number->string ustsatz) "% nicht gefunden !<br>")
        )
    )
)

; Findet alle accounts, die (oder deren eltern, im gegnsatz zu find-accounts-has-desc-value-no-descendants) ein bestimmten
; descvalue key besitzen.
(define (find-accounts-has-desc-value doc key)

    (let (
          (result '())
         )
        (for-each (lambda (account)
            (let (
                        (descval (get-desc-value key doc account #t))
                    )
                    ; (html-add-text doc "Konto " (xaccAccountGetCode account) " " (xaccAccountGetDescription account)  "val: " descval "<br>")
                    (if descval
                        ;  (set! result (append (cons account result) (gnc-account-get-descendants-sorted account)))
                        (set! result (append result (list account)))
                    )
                )
            )
            ; (gnc:group-get-subaccounts (gnc:get-current-group))
            (gnc-account-get-descendants-sorted (gnc-get-current-root-account))
        )
        result
    )
)

; Findet alle accounts (ohne kinder im gegensatz zu find-accounts-has-desc-value()),
; die ein bestimmten descvalue key besitzen.
(define (find-accounts-has-desc-value-no-descendants doc key)

    (let (
          (result '())
         )
        (for-each (lambda (account)
            (let (
                        (descval (get-desc-value key doc account #f))
                    )
                    ; (html-add-text doc "Konto " (xaccAccountGetCode account) " " (xaccAccountGetDescription account)  "val: " descval "<br>")
                    (if descval
                        ;  (set! result (append (cons account result) (gnc-account-get-descendants-sorted account)))
                        (set! result (append result (list account)))
                    )
                )
            )
            ; (gnc:group-get-subaccounts (gnc:get-current-group))
            (gnc-account-get-descendants-sorted (gnc-get-current-root-account))
        )
        result
    )
)

(define (report-get-option report-obj section name)
    (gnc:option-value (gnc:lookup-option (gnc:report-options report-obj) section name)))


; Soll - gegenkonto aus GK descvalue filtern
(define (get-tara-soll-gk doc gkdesc)
    (let (
            (splitted (string-split gkdesc #\|))
        )
        (if (> (length splitted) 0)
            (list-ref splitted 0)
            #f
        )
    )
)

; Haben - gegenkonto aus GK descvalue filtern
(define (get-tara-haben-gk doc gkdesc)
    (let (
            (splitted (string-split gkdesc #\|))
        )
        (if (> (length splitted) 1)
            (list-ref splitted 1)
            #f
        )
    )
)

(define (get-split-with-knr doc splits knr)

    (let (
            (accnr (get-split-knr doc (car splits)))
        )
        ; (printf "listlen: %d %s %s\n" (length splits) knr accnr)
        (if (string=? accnr knr)
            (car splits)
            (if (> (length splits) 1)
                (get-split-with-knr doc (cdr splits) knr)
                #f
            )
        )
    )
)

;
; XXX benoetigt (ice-9 i18n) modul:
;
;(define (string-to-float str)
;  (receive (float num)
;    (locale-string->inexact str)
;    float)
;)

;
; XXX Hack
;
(define (string-to-float str)
    (string->number (my-string-replace-char str #\, #\.))
)

(define (compute-tara-value doc tara-account brutto-value)
    (let (
            (btara-desc (get-desc-value "BTARA" doc tara-account #t))
            (ntara-desc (get-desc-value "NTARA" doc tara-account #t))
            (neg-brutto-value (gnc-numeric-neg brutto-value))
        )

        (printf "ntara-desc: %s\n" ntara-desc)
        (printf "btara-desc: %s\n" btara-desc)

        (if ntara-desc
            (if (= (string-suffix-length ntara-desc "%") 1)
                ; Prozentualer wert, bezogen auf den netto wert
                (get-ust-from-brutto neg-brutto-value (string-to-float (list-ref (string-split ntara-desc #\%) 0)))
                ; Konstanter wert
                (double-to-gnc-numeric (string-to-float ntara-desc) 100 GNC-RND-ROUND)
            )
            (if btara-desc
                (if (= (string-suffix-length btara-desc "%") 1)
                    ; Prozentualer wert, bezogen auf den brutto wert
                    (get-ust-from-netto neg-brutto-value (string-to-float (list-ref (string-split btara-desc #\%) 0)))
                    ; Konstanter wert
                    (double-to-gnc-numeric (string-to-float btara-desc) 100 GNC-RND-ROUND)
                )
                (begin
                    (html-add-text doc "<p>" (redText "Fehler") ": Kein (B/N)-Tara Wert in Konto '" (xaccAccountGetName tara-account) "' '" (xaccAccountGetCode tara-account) "' definiert!</p>")
                    numeric0
                )
            )
        )
    )
)

(define (check-tara-splits doc trn netto-split splits tara-accounts brutto-value create-tara-splits)

    (let (
           (tara-account-desc (car tara-accounts))
           (tara-account-number #f)
           (netto-value (xaccSplitGetValue netto-split))
        )

        (printf "tara account: %s, brutto: %s, netto: %s\n" tara-account-desc (gnc-numeric-to-string brutto-value) (gnc-numeric-to-string netto-value))
        ;
        ; Positiver wert: soll
        ; Negativer wert: haben
        ;
        (if (= 1 (gnc-numeric-compare netto-value numeric0))
            (begin
                (set! tara-account-number (get-tara-soll-gk doc tara-account-desc))
                (printf "soll-fall gk: %s\n" tara-account-number)
            )
            (begin
                (set! tara-account-number (get-tara-haben-gk doc tara-account-desc))
                (printf "haben-fall gk: %s\n" tara-account-number)
            )
        )

        (if tara-account-number
            (let (
                    (tara-split (get-split-with-knr doc splits tara-account-number))
                )
                ; Nachschauen, ob ein split fuer dieses konto vorhanden ist:
                (if tara-split
                    ; Tara-split fuer diese gegenkonto gefunden, wert pruefen
                    (let (
                            (tara-value (xaccSplitGetValue tara-split))
                            (tara-value-computed (compute-tara-value doc (xaccSplitGetAccount tara-split) brutto-value))
                        )
                        (printf "tara split:\n")
                        (display tara-split)
                        (printf "\ntara value aus split:\n")
                        (display tara-value)
                        (printf "\ntara value computed:\n")
                        (display tara-value-computed)
                        (printf "\n")
                        (if (= (gnc-numeric-compare tara-value tara-value-computed) 0)
                            (if (> (length tara-accounts) 1)
                                (begin
                                    ; Brutto wert fuer die naechste stufe ist gleich netto-wert 
                                    ; dieser stufe:
                                    (check-tara-splits doc trn netto-split splits (cdr tara-accounts) (gnc-numeric-sub-fixed brutto-value (gnc-numeric-neg tara-value)) create-tara-splits)
                                )
                            )
                            ; Split Nicht OK
                            (begin
                                (printf "\nError, tara-value: %s, tara-value-computed: %s\n\n" (gnc-numeric-to-string tara-value) (gnc-numeric-to-string tara-value-computed))
                                (html-add-text doc "Tara Wert f&uuml;r Gegenkonto '" (xaccAccountGetName (find-acc-by-code tara-account-number)) "' '" tara-account-number "' in Transaktion '") (html-add-trn doc trn)
                                (html-add-text doc "' stimmt nicht (" (gnc-numeric-to-string tara-value) " ; " (gnc-numeric-to-string tara-value-computed) ")" (redText "NOTOK") "<br>")
                            )
                        )
                    )
                    ; Tara-split fuer diese gegenkonto nicht gefunden, ggf. anlegen:
                    (begin
                        (html-add-text doc "Split-buchung auf Konto '" (xaccAccountGetName (find-acc-by-code tara-account-number)) "' '"  tara-account-number "' nicht in Transaktion '")
                        (html-add-trn doc trn)
                        (html-add-text doc "' gefunden " (redText "NOTOK"))
                        (if create-tara-splits
                            (let (
                                    (tara-value (compute-tara-value doc (find-acc-by-code tara-account-number) brutto-value))
                                )
                                (add-tara-split doc trn netto-split tara-value (find-acc-by-code tara-account-number))
                                (if (> (length tara-accounts) 1)
                                    (begin
                                        ; Brutto wert fuer die naechste stufe ist gleich netto-wert 
                                        ; dieser stufe:
                                        (check-tara-splits doc trn netto-split splits (cdr tara-accounts) (gnc-numeric-sub-fixed brutto-value (gnc-numeric-neg tara-value)) create-tara-splits)
                                    )
                                )
                            )
                        )
                        (html-add-text doc "<br>")
                    )
                )
            )
        )

    )
)

(define (get-tara-accounts-as-string-list tara-accounts account)
    (let (
            (result (list account))
        )
        (map (lambda (elem)
                (set! result (append result (string-split elem #\|)))
            )
            tara-accounts
        )
        result
    )
)

(define (ustPruefung doc report-obj)

    (let (
            ; Alle accounts, die ein 'GK' descvalue besitzen:
            (gkaccounts (find-accounts-has-desc-value doc "GK"))

            ; Flag, fehlende splitbuchungen anlegen
            (create-tara-splits (report-get-option report-obj gnc:pagename-general optname-enter-tax-splits))

            ; Start- und enddatum des zu ueberpruefenden bereiches
            (begindate (gnc:timepair-start-day-time
                (gnc:date-option-absolute-time 
                    (report-get-option report-obj gnc:pagename-general optname-from-date))))

            (enddate (gnc:timepair-end-day-time 
                (gnc:date-option-absolute-time 
                    (report-get-option report-obj gnc:pagename-general optname-to-date))))
        )

        ;
        ; Hier wird sicherheitshalber die option zurueckgesetzt, dies wirkt sich leider nicht auf einen aktuell
        ; geoeffneten options-dialog aus. Erst nach schliessen und erneutem oeffnen wird die zurueckgesetzte option
        ; sichtbar.
        ;
        (gnc:option-set-value
               (gnc:lookup-option (gnc:report-options report-obj) gnc:pagename-general optname-enter-tax-splits) #f)

        (html-add-text doc "<h2>Ergebnis Buchungspr&uuml;fung:</h2>")
        (html-add-text doc "<p>Es wird geprueft, ob die Buchungen auf die geforderten Gegenkonten durchgefuehrt wurden.</p>")
        (html-add-text doc "<p>Pr&uuml;fe Buchungen vom " (gnc-print-date begindate) " bis " (gnc-print-date enddate) "</p>")

        (if create-tara-splits
            (html-add-text doc "<p>Fehlende Splits werden angelegt.<p>")
            (html-add-text doc "<p>Fehlende Splits werden nicht angelegt.<p>")
        )

        (if (null? gkaccounts)
            (html-add-text doc "<p>Keine Konten mit 'GK key gefunden!<p>")
        )

        ; Schleife ueber alle einnahmen konten:
        (for-each (lambda (account)
                (let (
                        (tara-accounts (get-desc-values "GK" doc account))
                    )

                    (html-add-text doc "<p>" (greenText "Konto") " '" (xaccAccountGetName account) "' '" (xaccAccountGetCode account) "' '" (xaccAccountGetDescription account)  "'</p>")

                    (printf "\ntara accounts for %s:\n" (xaccAccountGetName account))
                    (display tara-accounts)
                    (printf "\n")

                    (let (
	                        (query (qof-query-create-for-splits))
                        )

                        ; Abfrage alle buchungen im konto...
                        (qof-query-set-book query (gnc-get-current-book))
                        (xaccQueryAddSingleAccountMatch query account QOF-QUERY-AND)
                        ; The DateMatch queries match transactions whose posted date                                                 
                        ;    is in a date range.  If use_start is TRUE, then a matching                                              
                        ;    posted date will be greater than the start date.   If                                                   
                        ;    use_end is TRUE, then a match occurs for posted dates earlier                                           
                        ;    than the end date.  If both flags are set, then *both*                                                  
                        ;    conditions must hold ('and').  If neither flag is set, then                                             
                        ;    all transactions are matched.                                                                           
                        (xaccQueryAddDateMatchTS query #t begindate #t enddate QOF-QUERY-AND)

                        ; Schleife ueber alle buchungen im konto...
                        (map (lambda (trn)
                                (let (
                                        (brutto-value #f)
                                        (netto-split #f)
                                        (splits (xaccTransGetSplitList trn))
                                        (account-guid (gncAccountGetGUID account))
                                    )

                                    ; Netto-split suchen
                                    (map (lambda (split)

                                            (if (string=? account-guid (gncAccountGetGUID (xaccSplitGetAccount split)))
                                                (set! netto-split split)
                                            )
                                        )
                                        splits
                                    )

                                    ; brutto-split suchen
                                    (set! brutto-value (get-brutto-value-by-sign doc (get-tara-accounts-as-string-list tara-accounts (get-account-knr doc account)) splits (xaccSplitGetValue netto-split)))

                                    ; (printf "brutto value\n")
                                    ; (display brutto-value)
                                    ; (printf "\n")

                                    (check-tara-splits doc trn netto-split splits tara-accounts brutto-value create-tara-splits)
                                )
                            )
                            (xaccQueryGetTransactions query QUERY-TXN-MATCH-ANY)
                        )
                        (qof-query-destroy query)
                    )
                )
            )
            gkaccounts
        )

        doc
    )
)

(define (ustRenderer report-obj)
    (let (
            (doc (gnc:make-html-document))
        )

        (ustPruefung doc report-obj)
        doc
    )
)

(define (gnc-book-path name)    
    (build-path (getenv "HOME") "gncdata" name)
)


;;;;; ; Hack for missing gnc-get-current-session:
;;;;; (define my-current-session #f)
;;;;; (define (my-book-opened-hook session)
  ;;;;; (begin
    ;;;;; (printf "my-book-opened-hook called\n")
    ;;;;; (set! my-current-session session)
  ;;;;; )
;;;;; )
;;;;; (define (my-book-closed-hook session)
  ;;;;; (begin
    ;;;;; (printf "my-book-closed-hook called\n")
    ;;;;; (set! my-current-session #f)
  ;;;;; )
;;;;; )
;;;;; (gnc-hook-add-scm-dangler "hook_book_opened" my-book-opened-hook)
;;;;; (gnc-hook-add-scm-dangler "hook_book_closed" my-book-closed-hook)
; End hack

(define (afa-desc str trn)
    (string-append str " " (xaccTransGetDescription trn))
)

; Betrag abschreibung, wert/ndauer
(define (compute-afa-value anl-split ndauer)
    (let (
            (nd (double-to-gnc-numeric ndauer 100 GNC-RND-ROUND))
        )
        ; (gnc-numeric-div (xaccSplitGetValue anl-split) nd 100 GNC-RND-ROUND)
        (gnc-numeric-div (xaccSplitGetValue anl-split) nd GNC-DENOM-AUTO (logior GNC-DENOM-FIXED GNC-RND-ROUND))
    )
)

; Eine afa transaktion einfuegen
(define (afa-vorbereitung-add-trn doc trn anl-split afa-date afa-value i tday tmon tyear)
    (let (
            (afa-trn (xaccMallocTransaction (gnc-get-current-book)))
            (sa-split (xaccMallocSplit (gnc-get-current-book)))
            (afa-split (xaccMallocSplit (gnc-get-current-book)))
            ; (afa-account (find-acc-in-childs-by-code accgroup (get-afa-account-knr doc (xaccSplitGetAccount anl-split))))
            (afa-account (get-gegenkonto-by-desc-value doc "AFAK" (xaccSplitGetAccount anl-split)))
            (ausgaben-konto #f)
        )

        (if afa-account
            (begin

                (set! ausgaben-konto (get-gegenkonto-by-desc-value doc "AUSGK" afa-account))

                (if ausgaben-konto
                    (begin

                        (xaccTransBeginEdit afa-trn)

                        ; waehrung
                        (xaccTransSetCurrency afa-trn (xaccTransGetCurrency trn))

                        ; 1. teilbuchung verringerung anlagen konto
                        (xaccSplitSetValue sa-split (gnc-numeric-neg afa-value))
                        (xaccSplitSetAmount sa-split (gnc-numeric-neg afa-value))

                        ; identifizierung automatische afa buchungen
                        (xaccSplitSetMemo sa-split (string-append "AFA-NR " (xaccTransGetNum trn)))

                        (xaccSplitSetAccount sa-split afa-account)
                        (xaccSplitSetParent sa-split afa-trn)

                        ; 2. teilbuchung erhoehung ausgaben konto
                        (xaccSplitSetValue afa-split afa-value)
                        (xaccSplitSetAmount afa-split afa-value)

                        (xaccSplitSetAccount afa-split ausgaben-konto)
                        (xaccSplitSetParent afa-split afa-trn)

                        (printf "DAtum neue trans: %d.%d.%d\n"  tday tmon tyear)

                        ; (display afa-date) (printf " <afa-date\n")

                        ; (xaccTransSetDatePostedTS afa-trn (gnc:date->timepair afa-date))
                        ; (display (gnc:date->timepair afa-date)) (printf " <afa-date timespair\n")
                        ; (display (gnc-timepair2timespec (gnc:date->timepair afa-date))) (printf " <afa-date timespec\n")

                        ; (xaccTransSetDatePostedTS afa-trn (gnc-timepair2timespec (gnc:date->timepair afa-date)))

                        ; (xaccTransSetDatePostedGDate afa-trn afa-date)
                        ; (xaccTransSetDateEnteredTS afa-trn (gnc:date->timepair afa-date))
                        (xaccTransSetDate afa-trn tday tmon tyear)

                        (xaccTransSetDescription afa-trn (afa-desc (string-append "AFA " (number->string i)) trn))
                        (xaccTransSetNum afa-trn (xaccTransGetNum trn))

                        (xaccTransCommitEdit afa-trn)
                        afa-trn ; return 
                    )
                    (begin
                        (html-add-text doc (redText "Fehler") "Ausgabenkonto (AUSGK) nicht (richtig) definiert!<br>")
                        #f ; return
                    )
                )
            )
            (begin
                (html-add-text doc (redText "Fehler") "Abschreibungskonto (AFAK) nicht (richtig) definiert!<br>")
                #f ; return
            )
        )
    )
)

; Eine transaktion fuer jedes jahr der abschreibungsdauer in das abschreibungskonto eintragen,
; kauf im zweiten halbjahr beruecksichtigen
(define (afa-vorbereitung-afa doc trn anl-split ndauer)
    (printf "afa-vorbereitung-afa called\n")
    (let (
            (kauf-datum (gnc-transaction-get-date-posted trn))
            ; (afa-datum (gnc:timepair->date (gnc-transaction-get-date-posted trn)))
            (kauf-jahr (gnc:timepair-get-year (gnc-transaction-get-date-posted trn)))
            (notusedafa-datum #f)
            (normal-afa-value (compute-afa-value anl-split ndauer))
            (first-afa-value #f)
            ; (afa-value-sum #f)
            ; erinnerungswert
            (afa-value-sum numeric1)
            (last-afa-trn #f)
            (split #f)
            (last-value #f)
            (value-diff #f)
            ; (accgroup (gnc:book-get-group (gnc-get-current-book)))
            (notused_accgroup #f)
            (kaufMonate (- 13 (gnc:timepair-get-month (gnc-transaction-get-date-posted trn))))
            (monatsAfa (compute-afa-value anl-split (* 12 ndauer)))
        )
        (gnc:warn "kauf-datum" (gnc:timepair->date kauf-datum))
        (gnc:warn "anlage betrag: " (xaccSplitGetValue anl-split))
        (gnc:warn "afa betrag: " normal-afa-value)
        (gnc:warn "Monate anteilig: " kaufMonate)

        ;
        ; Alte regelung mit kauf im 2. halbjahr, gilt seit 2004 nicht mehr:
        ;
        ;(if (> (gnc:timepair-get-month kauf-datum) 6) ; kauf im 2. halbjahr ?
            ;(begin
                ;(set! first-afa-value (compute-afa-value anl-split (* 2 ndauer))) ; halbe afa
            ;)
            ;(set! first-afa-value normal-afa-value)
        ;)

        ;
        ; Neue regelung: monats-anteilig:
        ;
        (set! first-afa-value (gnc-numeric-mul monatsAfa (double-to-gnc-numeric kaufMonate 100 GNC-RND-ROUND) 100 GNC-RND-ROUND))
        (gnc:warn "first-afa-value" first-afa-value)

        ; erste abschreibung am 31.12 des kauf jahres:
        ; (set-tm:mon afa-datum 11) ; 11 -> dezember
        ; (set-tm:mday afa-datum 31)
        ; (set-tm:isdst afa-datum -1)

        (gnc:warn "first afa betrag: " first-afa-value)

        (afa-vorbereitung-add-trn doc trn anl-split notusedafa-datum first-afa-value 1 31 12 kauf-jahr)

        ; (set! afa-value-sum first-afa-value)
        (set! afa-value-sum (gnc-numeric-add-fixed afa-value-sum first-afa-value))

        (do ( (i 1 (+ i 1)) )
            ((= i ndauer))
            ; (set-tm:year afa-datum (+ (tm:year afa-datum) 1))
            (set! kauf-jahr (+ kauf-jahr 1))
            (set! last-afa-trn (afa-vorbereitung-add-trn doc trn anl-split notusedafa-datum normal-afa-value (+ i 1) 31 12 kauf-jahr))
            (set! afa-value-sum (gnc-numeric-add-fixed afa-value-sum normal-afa-value))
            (set! last-value normal-afa-value)
        )

        ; (set-tm:year afa-datum (+ (tm:year afa-datum) 1))
        (set! kauf-jahr (+ kauf-jahr 1))
        (if (> (gnc:timepair-get-month kauf-datum) 6) ; kauf im 2. halbjahr ?
            (begin
                (set! last-afa-trn (afa-vorbereitung-add-trn doc trn anl-split notusedafa-datum first-afa-value (+ ndauer 1) 31 12 kauf-jahr))
                (set! afa-value-sum (gnc-numeric-add-fixed afa-value-sum first-afa-value))
                (set! last-value first-afa-value)
            )
        )

        (gnc:warn "first afa betrag: " first-afa-value)

        (if last-afa-trn
            (begin

                ; rundungsfehler vermeiden, erinnerungswert beibehalten:
                (xaccTransBeginEdit last-afa-trn)

                (set! split (xaccTransGetSplit last-afa-trn 0))

                (set! value-diff (gnc-numeric-sub-fixed (xaccSplitGetValue anl-split) afa-value-sum))

                (set! last-value (gnc-numeric-add-fixed last-value value-diff))

                (xaccSplitSetValue split last-value)
                (xaccSplitSetAmount split last-value)

                (set! split (xaccTransGetSplit last-afa-trn 1))

                (set! last-value (gnc-numeric-neg last-value))

                (xaccSplitSetValue split last-value)
                (xaccSplitSetAmount split last-value)

                (xaccTransCommitEdit last-afa-trn)

                ; Abgangs buchung 
                (let (
                        (abg-trn (xaccMallocTransaction (gnc-get-current-book)))
                        (sa-split (xaccMallocSplit (gnc-get-current-book)))
                        (source-split (xaccMallocSplit (gnc-get-current-book)))
                        ; (source-account (find-acc-in-childs-by-code accgroup (get-anf-account-knr doc (xaccSplitGetAccount anl-split))))
                        ;
                        ; XXX Anfangsbestand, hardcoded
                        ;
                        (source-account (find-acc-by-code "9000"))
                        ; (date (get-TPTS-at-date 0 0 0 1 1 2038))
                    )

                    (xaccTransBeginEdit abg-trn)

                    ; waehrung
                    (xaccTransSetCurrency abg-trn (xaccTransGetCurrency trn))

                    ; 1. teilbuchung verringerung anlagen konto
                    (xaccSplitSetValue sa-split (gnc-numeric-neg numeric1))
                    (xaccSplitSetAmount sa-split (gnc-numeric-neg numeric1))

                    ; (xaccSplitSetAccount sa-split (xaccSplitGetAccount anl-split))

                    (xaccSplitSetAccount sa-split (get-gegenkonto-by-desc-value doc "AFAK" (xaccSplitGetAccount anl-split)))
                    (xaccSplitSetParent sa-split abg-trn)

                    ; 2. teilbuchung erhoehung afa konto
                    (xaccSplitSetValue source-split numeric1)
                    (xaccSplitSetAmount source-split numeric1)
                    ; identifizierung automatische afa buchungen
                    (xaccSplitSetMemo source-split  (string-append "ABG-NR " (xaccTransGetNum trn)))

                    (xaccSplitSetAccount source-split source-account)
                    (xaccSplitSetParent source-split abg-trn)

                    ; (xaccTransSetDatePostedTS abg-trn date)
                    ; (xaccTransSetDateEnteredTS abg-trn date)
                    (xaccTransSetDate abg-trn 1 1 2038)

                    (xaccTransSetDescription abg-trn (afa-desc "Abg./Verkauf" trn))
                    (xaccTransSetNum abg-trn (xaccTransGetNum trn))

                    (xaccTransCommitEdit abg-trn)
                )
            )
        )
    )
)

(define (get-list-kvp lst key indx)

    (if (>= indx (length lst))
        #f
        (if (string=? (list-ref lst indx) key)
            (list-ref lst (+ indx 1))
            (get-list-kvp lst key (+ indx 2))
        )
    )
)

; Holt pseudo kvp's aus string
(define (get-pseudo-kvp str key) 
    (let (
            (splitted (string-split str #\ ))
        )
        (get-list-kvp splitted key 0)
    )
)

; afa - transaktionen fuer eine anlage erzeugen/aktualisieren
(define (afa-vorbereitung-trn doc trn anl-split)
    (printf "afa-vorbereitung-trn\n")

    (html-add-text doc "<p>Abschreibungen fuer '" (xaccTransGetDescription trn) "' ")
    (html-add-trn doc trn)
    (html-add-text doc " werden angelegt ... </p>")

    (let (
            ; Speicherung abschreibungsdauer in slot-memo, fuer spaeteren anlagen 
            ; spiegel report
            (ndauer-string (get-pseudo-kvp (xaccSplitGetMemo anl-split) "ND"))
        )

        (if ndauer-string
            (begin
                (html-add-text doc " ... nicht vorhanden, erzeuge Transaktionen ...<br>")
                (afa-vorbereitung-afa doc trn anl-split (string->number ndauer-string))
            )
            (html-add-text doc "Nutzungsdauer nicht eingetragen (Key 'ND' im Memo fehlt)<br>")
        )
    )
)

; Hook for reload
(define (afavRenderer report-obj)

    (_afavRenderer report-obj (gnc:make-html-document))
)

; Afa buchungen im afa buch vorbereiten
(define (_afavRenderer report-obj doc)

    (html-add-text doc "<h2>Ergebnis AFA Vorbereitung:</h2>")

    ;
    ; XXX TODO: Transaktionen ohne afa-key melden, dort mus eine AFA-NR eingetragen werden ....
    ;

    ; nur im afa buch moeglich ...
    (if (afaKontenCheck doc) 
        (let (
                ; (anlagenaccounts (get-anlagen-konten))
                ; (anlagenaccounts (find-accounts-has-desc-value-no-descendants doc "AFAKonto"))
                (anlagenaccounts (find-accounts-has-desc-value doc "AFAKonto"))
                (afaaccounts (find-accounts-has-desc-value-no-descendants doc "AFAK"))
                ; liste aller gefundenen anlagen
                (anlagen '())
                ; hash mit allen afa und abgangs buchungen
                (afabuchungen (make-hash-table 1))
            )

            ; schleife ueber alle anlagen konten
            (for-each (lambda (anlagenaccount)
                    (let (
                            ; (query (gnc:malloc-query))
                            (query (qof-query-create-for-splits))
                        )

                        (html-add-text doc "<h3>Konto '" (xaccAccountGetName anlagenaccount) "' ("
                            (get-account-knr doc anlagenaccount) ")</h2>")

                        (printf "Doing acc: %s\n" (xaccAccountGetName anlagenaccount))

                        (qof-query-set-book query (gnc-get-current-book))
                        (xaccQueryAddSingleAccountMatch query anlagenaccount QOF-QUERY-AND)
                        (qof-query-set-sort-order query (list QUERY-DEFAULT-SORT) '() '())

                        ; schleife ueber alle splits aus dem anlagevermoegen konto, suche die anlagen splits
                        ;;;;;;;;;;;;   - kein IBRAfaId
                        ;;;;;;;;;;;;   - kein IBRAnlageAbgangId
                        ; Key "AFA-ID"
                        (map (lambda (split)

                                (let (
                                        (trn (xaccSplitGetParent split))
                                        (afa-nr (get-pseudo-kvp (xaccSplitGetMemo split) "AFA-NR"))
                                        (abg-nr (get-pseudo-kvp (xaccSplitGetMemo split) "ABG-NR"))
                                    )

                                    (if (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")
                                        ; anlage
                                        (set! anlagen (append anlagen (list split)))
                                    )

                                    (if afa-nr
                                        ; afa buchung
                                        (hash-set! afabuchungen afa-nr trn)
                                    )

                                    (if abg-nr
                                        ; abgangs buchung
                                        (hash-set! afabuchungen abg-nr trn)
                                    )
                                )

                            )
                            (xaccQueryGetSplitsUniqueTrans query)
                        )

                        (qof-query-destroy query)
                    )
                )
                anlagenaccounts
            )

            (begin

                ; (html-add-text doc "<h3>Konto '" (xaccAccountGetName afaaccount) "' ("
                    ; (get-account-knr doc afaaccount) ")</h2>")

                ; (printf "Doing acc: %s\n" (xaccAccountGetName afaaccount))

                (display anlagen) (printf " <anlagen\n")
                (display afabuchungen) (printf " <afa-afabuchungen\n")

                ; sortierte liste der anlagen abarbeiten, afa buchungen nur erzeugen, falls noch keine 
                ; vorhanden
                (map (lambda (split)
                        (let (
                                (trn (xaccSplitGetParent split))
                            )
                            (if (hash-ref afabuchungen (xaccTransGetNum trn))
                                (begin
                                    (html-add-text doc "<p>Buchungen fuer '" (xaccTransGetDescription trn) "' ")
                                    (html-add-trn doc trn)
                                    (html-add-text doc " bereits vorhanden <br>")
                                )
                                (afa-vorbereitung-trn doc trn split)
                            )
                        )
                    )
                    anlagen
                )
            )
        )
    )

    doc
)

; Hook for reload
(define (afavRenderer2 report-obj)

    (_afavRenderer2 report-obj (gnc:make-html-document))
)

; Afa buchungen im afa buch vorbereiten
(define (_afavRenderer2 report-obj doc)

    (html-add-text doc "<h2>Ergebnis AFA Vorbereitung:</h2>")

    ; nur im afa buch moeglich ...
    (if (afaKontenCheck doc) 
        (let (
                ; (anlagenaccounts (get-anlagen-konten))
                ; (anlagenaccounts (find-accounts-has-desc-value-no-descendants doc "AFAKonto"))
                (anlagenaccounts (find-accounts-has-desc-value doc "AFAKonto"))
                (afaaccounts (find-accounts-has-desc-value-no-descendants doc "AFAK"))
                ; liste aller gefundenen anlagen
                (anlagen '())
                ; hash mit allen afa und abgangs buchungen
                (afabuchungen (make-hash-table 1))

                (startdate (gnc:timepair-start-day-time
                    (gnc:date-option-absolute-time 
                        (report-get-option report-obj gnc:pagename-general optname-from-date))))
                (enddate (gnc:timepair-end-day-time 
                    (gnc:date-option-absolute-time 
                        (report-get-option report-obj gnc:pagename-general optname-to-date))))
                (do-report (report-get-option report-obj gnc:pagename-general optname-run-afa-buchung))
            )

            (if do-report
                (begin

            ; schleife ueber alle anlagen konten
            (for-each (lambda (anlagenaccount)
                    (let (
                            ; (query (gnc:malloc-query))
                            (query (qof-query-create-for-splits))
                        )

                        (html-add-text doc "<h3>Konto '" (xaccAccountGetName anlagenaccount) "' ("
                            (get-account-knr doc anlagenaccount) ")</h2>")

                        (printf "Doing acc: %s\n" (xaccAccountGetName anlagenaccount))

                        (qof-query-set-book query (gnc-get-current-book))
                        (xaccQueryAddSingleAccountMatch query anlagenaccount QOF-QUERY-AND)
                        (qof-query-set-sort-order query (list QUERY-DEFAULT-SORT) '() '())

                        ; schleife ueber alle splits aus dem anlagevermoegen konto, suche die anlagen splits
                        ;;;;;;;;;;;;   - kein IBRAfaId
                        ;;;;;;;;;;;;   - kein IBRAnlageAbgangId
                        ; Key "AFA-ID"
                        (map (lambda (split)

                                (let (
                                        (trn (xaccSplitGetParent split))
                                        (afa-nr (get-pseudo-kvp (xaccSplitGetMemo split) "AFA-NR"))
                                        (abg-nr (get-pseudo-kvp (xaccSplitGetMemo split) "ABG-NR"))
                                    )

                                    (if (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")
                                        ; anlage
                                        (set! anlagen (append anlagen (list split)))
                                    )

                                    (if afa-nr
                                        ; afa buchung
                                        (hash-set! afabuchungen afa-nr trn)
                                    )

                                    (if abg-nr
                                        ; abgangs buchung
                                        (hash-set! afabuchungen abg-nr trn)
                                    )
                                )

                            )
                            (xaccQueryGetSplitsUniqueTrans query)
                        )

                        (qof-query-destroy query)
                    )
                )
                anlagenaccounts
            )

            (begin

                ; (html-add-text doc "<h3>Konto '" (xaccAccountGetName afaaccount) "' ("
                    ; (get-account-knr doc afaaccount) ")</h2>")

                ; (printf "Doing acc: %s\n" (xaccAccountGetName afaaccount))

                (display anlagen) (printf " <anlagen\n")
                (display afabuchungen) (printf " <afa-afabuchungen\n")

                ; sortierte liste der anlagen abarbeiten, afa buchungen nur erzeugen, falls noch keine 
                ; vorhanden
                ; (map (lambda (split)
                        ; (let (
                                ; (trn (xaccSplitGetParent split))
                            ; )
                            ; (if (hash-ref afabuchungen (xaccTransGetNum trn))
                                ; (begin
                                    ; (html-add-text doc "<p>Buchungen fuer '" (xaccTransGetDescription trn) "' ")
                                    ; (html-add-trn doc trn)
                                    ; (html-add-text doc " bereits vorhanden <br>")
                                ; )
                                ; (afa-vorbereitung-trn doc trn split)
                            ; )
                        ; )
                    ; )
                    ; anlagen
                ; )
            )

                ) ; begin
            ) ; if do-report
        )
    )
    doc
)

; Kontonummer zielkonto im aktuellen jahrbuch aus kontonummer im afa-buch extrahieren
(define (get-ziel-buch-konto anlagen-knr)
    (list-ref (string-split (list-ref (string-split anlagen-knr #\|) 0) #\-) 0)
)

; Vergleich zweier waehrungen, es gibt zwar die funktion gnc:commodity-equiv? 
; aber es ist nicht klar wie diese sich verhaelt wenn die beiden waehrungen aus verschiedenen
; buechern stammen. Desshalb vergleich ueber Waehrungskurzname.
(define (waehrungs-vergleich ca cb)
    ; (printf "waehrung a: '%s', b: '%s'\n" (gnc-commodity-get-mnemonic ca) (gnc-commodity-get-mnemonic cb))
    (string=? (gnc-commodity-get-mnemonic ca) (gnc-commodity-get-mnemonic cb))
)

; gnc:is-euro-currency geht nicht !?
(define (ist-euro-waehrung c)
    ; (printf "waehrung: '%s'\n" (gnc-commodity-get-mnemonic c))
    (string=? (gnc-commodity-get-mnemonic c) "EUR")
)

; liefert timepair fuer bestimmtes datum fuer query/transaktions datum
(define (get-TPTS-at-date sec minu hr day mon year)
    (let (
            (tmDate (localtime (current-time)))
        )
        (set-tm:sec tmDate sec)
        (set-tm:min tmDate minu)
        (set-tm:hour tmDate hr)
        (set-tm:mday tmDate day)
        (set-tm:mon tmDate (- mon 1))
        (set-tm:year tmDate (- year 1900))
        (set-tm:isdst tmDate -1)
        (gnc:date->timepair tmDate)
    )
)

(define (get-afa-split-id split-memo)

    (or (get-pseudo-kvp split-memo "ANL-NR") (get-pseudo-kvp split-memo "ERW-NR") (get-pseudo-kvp split-memo "AFA-NR") (get-pseudo-kvp split-memo "ABG-NR"))
)

; alle split memo's nach id's durchsuchen
(define (is-afa-buchung trn)
    (let (
            (result #f)
            ; (slots (gnc-transaction-get-slots trn))
        )

        ; (if (or (gnc:kvp-frame-get-slot slots "IBRAfaId") (gnc:kvp-frame-get-slot slots "IBRAnlageAbgangId") (gnc:kvp-frame-get-slot slots "IBRAnlageId") (gnc:kvp-frame-get-slot slots "IBRAnlageNDauer"))
            ; (set! result #t)
        ; )

        (map (lambda (split)
                (if (get-afa-split-id (xaccSplitGetMemo split))
                    (set! result #t)
                )
            )
            (xaccTransGetSplitList trn)
        )

        result
    )
)

; transaktionen in account bis zum jahresende von thisyear suchen
(define (query-trn-by-account-and-endyear session account year)
    (let ( 
            ; (query (gnc:malloc-query))
	                        (query (qof-query-create-for-splits))
            (trnlist #f)
            ; 31.12.year
            (enddate (get-TPTS-at-date 59 59 23 31 12 year))
        )

        ; (printf "year %d\n" year)
        (qof-query-set-book query (qof-session-get-book session))
        (xaccQueryAddSingleAccountMatch query account QOF-QUERY-AND)
        ; (qof-query-set-sort-order query (list QUERY-DEFAULT-SORT) '() '())
        ; (qof-query-set-sort-order query (list gnc:split-trans gnc-trans-date-posted) '() '())
        ; (gnc:query-add-date-match-timepair query 
            ; #f enddate
            ; #t enddate QOF-QUERY-AND)

        ; The DateMatch queries match transactions whose posted date                                                 
        ;    is in a date range.  If use_start is TRUE, then a matching                                              
        ;    posted date will be greater than the start date.   If                                                   
        ;    use_end is TRUE, then a match occurs for posted dates earlier                                           
        ;    than the end date.  If both flags are set, then *both*                                                  
        ;    conditions must hold ('and').  If neither flag is set, then                                             
        ;    all transactions are matched.                                                                           
        (xaccQueryAddDateMatchTS query
             #f enddate
             #t enddate QOF-QUERY-AND)

        (set! trnlist (xaccQueryGetTransactions query QUERY-TXN-MATCH-ANY))
        (qof-query-destroy query)

        trnlist
    )
)

; sortiere splits in account bis zum jahresende von thisyear suchen
(define (query-split-by-account-and-endyear session account year)
    (let ( 
            ; (query (gnc:malloc-query))
	                        (query (qof-query-create-for-splits))
            (splitlist #f)
            ; 31.12.year
            (enddate (get-TPTS-at-date 59 59 23 31 12 year))
        )

        ; (printf "year %d\n" year)
        (qof-query-set-book query (qof-session-get-book session))
        (xaccQueryAddSingleAccountMatch query account QOF-QUERY-AND)
        (qof-query-set-sort-order query (list QUERY-DEFAULT-SORT) '() '())
        (gnc:query-add-date-match-timepair query 
            #f enddate
            #t enddate QOF-QUERY-AND)

        (set! splitlist (xaccQueryGetSplitsUniqueTrans query))
        (qof-query-destroy query)

        splitlist
    )
)

; xxx remove:
; sortiere splits in account bis zum jahresende von thisyear suchen
(define (query-split-by-account-and-endyear-all session account year)
    (let ( 
            ; (query (gnc:malloc-query))
            (query (qof-query-create-for-splits))
            (splitlist #f)
            ; 31.12.year
            (enddate (get-TPTS-at-date 59 59 23 31 12 year))
        )

        ; (printf "year %d\n" year)
        (qof-query-set-book query (qof-session-get-book session))
        (xaccQueryAddSingleAccountMatch query account QOF-QUERY-AND)
        (qof-query-set-sort-order query (list QUERY-DEFAULT-SORT) '() '())
        ; (gnc:query-add-date-match-timepair query 
            ; #f enddate
            ; #t enddate QOF-QUERY-AND)
        ; The DateMatch queries match transactions whose posted date                                                 
        ;    is in a date range.  If use_start is TRUE, then a matching                                              
        ;    posted date will be greater than the start date.   If                                                   
        ;    use_end is TRUE, then a match occurs for posted dates earlier                                           
        ;    than the end date.  If both flags are set, then *both*                                                  
        ;    conditions must hold ('and').  If neither flag is set, then                                             
        ;    all transactions are matched.                                                                           
        (xaccQueryAddDateMatchTS query
             #f enddate
             #t enddate QOF-QUERY-AND)

        ; (set! splitlist (gnc:query-get-splits query))
        (set! splitlist (xaccQueryGetSplitsUniqueTrans query))
        (qof-query-destroy query)

        splitlist
    )
)

; Sortiere splits in account bis zum endedatume suchen
(define (query-split-by-account-and-enddateTPTS-all book root enddateTPTS)
    (let ( 
            ; (query (gnc:malloc-query))
            (query (qof-query-create-for-splits))
            (splitlist #f)
            (accounts (gnc-account-get-descendants-sorted root))
        )

        ; (printf "year %d\n" year)
        (qof-query-set-book query book)
        (if (null? accounts)
            (xaccQueryAddSingleAccountMatch query root QOF-QUERY-AND)
            (xaccQueryAddAccountMatch query accounts QOF-GUID-MATCH-ANY QOF-QUERY-AND)
        )
        (qof-query-set-sort-order query (list QUERY-DEFAULT-SORT) '() '())
        ; (gnc:query-add-date-match-timepair query 
            ; #f enddateTPTS
            ; #t enddateTPTS QOF-QUERY-AND)
        ; The DateMatch queries match transactions whose posted date                                                 
        ;    is in a date range.  If use_start is TRUE, then a matching                                              
        ;    posted date will be GREATER than the start date.   If                                                   
        ;    use_end is TRUE, then a match occurs for posted dates EARLIER                                           
        ;    than the end date.  If both flags are set, then *both*                                                  
        ;    conditions must hold ('and').  If neither flag is set, then                                             
        ;    all transactions are matched.                                                                           
        (xaccQueryAddDateMatchTS query
             #f enddateTPTS
             #t enddateTPTS QOF-QUERY-AND)

        ; (set! splitlist (gnc:query-get-splits query))
        (set! splitlist (xaccQueryGetSplitsUniqueTrans query))
        (qof-query-destroy query)

        splitlist
    )
)

; (define (berechne-afa-restwerte thisyear afa-book-session anlagenaccount)
(define (berechne-afa-restwerte enddateTPTS book anlagenaccount)
    (let (
            ; fuer restwerte sind nur buchungen aus vorjahren zu beruecksichtigen
            ; (splits (query-split-by-account-and-endyear-all afa-book-session anlagenaccount (- thisyear 1)))
            (splits (query-split-by-account-and-enddateTPTS-all book anlagenaccount enddateTPTS))
            ; key: anl-id value: restwert
            (restwerte (make-hash-table 1))
        )

        ; schleife ueber alle splits im aktuellen anlagevermoegen konto bis ende dieses jahr,
        ; restwerte aufsummieren
        (map (lambda (split)
                (let (
                        (id (get-afa-split-id (xaccSplitGetMemo split)))
                    )

                    (if id
                        ; den afa - split mit dem netto einkaufswert oder dem afawert oder dem
                        ; netto abgangswert der anlage gefunden
                        (hash-set-add-numeric restwerte id (xaccSplitGetValue split))
                    )
                )
            )
            splits
        )

        ;(gnc:warn "restwerte" restwerte)

        restwerte
    )
)

; setzt einen numeric in ein hash oder addiert zu einem im hash vorhandenen wert
(define (hash-set-add-numeric hash key value)

    (if (hash-ref hash key)
        (hash-set! hash key (gnc-numeric-add-fixed (hash-ref hash key) value))
        (hash-set! hash key value)
    )
)

; Hook for reload
(define (aspiegelRenderer report-obj)

    (_aspiegelRenderer report-obj (gnc:make-html-document))
)

; Anlage spiegel erstellen
(define (_aspiegelRenderer report-obj doc)
    (let (
            (restdateTMDATE (localtime (current-time)))
            (restdateTPTS #f)

            (enddateTMDATE (localtime (current-time)))
            (enddateTPTS #f)

            (year (gnc:timepair-get-year 
                (gnc:date-option-absolute-time 
                    (report-get-option report-obj gnc:pagename-general optname-to-date))))

            (euroCurrency (gnc-commodity-table-lookup (gnc-commodity-table-get-table (gnc-get-current-book)) "ISO4217" "EUR"))
            (anlagenaccounts (find-accounts-has-desc-value-no-descendants doc "AFAKonto"))
            (book (gnc-get-current-book))
        )

        ; d1 = (report-get-option report-obj gnc:pagename-general optname-to-date)
        ; --> (relative . end-cal-year)                     # format: ?

        ; d2 = (gnc:date-option-absolute-time d1)
        ; --> (1356994799 . 0)                              # format: timepair, TPTS

        ; d3 = (gnc:timepair->date d2)
        ; --> #(59 59 23 31 11 112 1 365 0 -3600 CET)       # format: TMDATE

        ; d4 = (gnc:timepair-start-day-time d2)
        ; --> (1356908400 . 0)                              # format: timepair, TPTS

        (set-tm:sec     restdateTMDATE 0)
        (set-tm:min     restdateTMDATE 0)
        (set-tm:hour    restdateTMDATE 0)
        (set-tm:mday    restdateTMDATE 1)
        (set-tm:mon     restdateTMDATE 0)
        (set-tm:year    restdateTMDATE (- year 1900))
        (set-tm:isdst   restdateTMDATE -1)
        (set! restdateTPTS (gnc:date->timepair restdateTMDATE))

        (display restdateTPTS) (printf " <restdate : %s\n" (gnc-print-date restdateTPTS))

        (set-tm:sec     enddateTMDATE 59)
        (set-tm:min     enddateTMDATE 59)
        (set-tm:hour    enddateTMDATE 23)
        (set-tm:mday    enddateTMDATE 31)
        (set-tm:mon     enddateTMDATE 11)
        (set-tm:year    enddateTMDATE (- year 1900))
        (set-tm:isdst   enddateTMDATE -1)
        (set! enddateTPTS (gnc:date->timepair enddateTMDATE))

        (display enddateTPTS) (printf " <enddate : %s\n" (gnc-print-date enddateTPTS))

        (html-add-text doc "<h2>Entwicklung Anlagevermoegen bis zum " (gnc-print-date enddateTPTS) "</h2>")
        (html-add-text doc "<p>Stand: " (gnc-print-date (gnc:get-today)) ", Betr&auml;ge in " (gnc-commodity-get-mnemonic euroCurrency) "</p>")

        ;
        ; Die anlagen konten ZWEIMAL durchgehen, im ersten schritt
        ;

        ; Schleife 1 ueber alle anlagen accounts
        (for-each (lambda (anlagenaccount)
                (let (
                        (restwerte (berechne-afa-restwerte restdateTPTS book anlagenaccount))
                        (endwerte (berechne-afa-restwerte enddateTPTS book anlagenaccount))

                        (splits (query-split-by-account-and-enddateTPTS-all book anlagenaccount enddateTPTS))

                        ; html tabelle fuer diesen account
                        (table (gnc:make-html-table))
                        (anlagen '())
                        ; alle abgaenge bis einschliesslich dieses jahr
                        (abgaenge (make-hash-table 1))
                        ; alle erweiterungen bis einschliesslich dieses jahr
                        (erweiterungen (make-hash-table 1))
                        ; afa's dieses jahr
                        (afabuchungen (make-hash-table 1))
                        ; summe aller eroeffnungen
                        (sumanlagen (gnc-numeric-zero))
                        ; summe aller afa's
                        (sumafa (gnc-numeric-zero))
                        ; summe aller zuschreibungen
                        (sumerw (gnc-numeric-zero))
                        ; summe aller endwerte
                        (sumend (gnc-numeric-zero))
                        ; flag ob tabelle eintraege enthaelt
                        (table-not-empty #f)
                    )

                    (printf "anlagespiegel fuer konto: %s/%s\n" (xaccAccountGetName anlagenaccount) (xaccAccountGetDescription anlagenaccount))

                    ; Schleife ueber alle buchungen im anlagen konto
                    (for-each (lambda (split)
                                
                            (let (
                                    (splityear (gnc:timepair-get-year (gnc-transaction-get-date-posted (xaccSplitGetParent split))))
                                    (anl-nr (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR"))
                                    (erw-nr (get-pseudo-kvp (xaccSplitGetMemo split) "ERW-NR"))
                                    (afa-nr (get-pseudo-kvp (xaccSplitGetMemo split) "AFA-NR"))
                                    (abg-nr (get-pseudo-kvp (xaccSplitGetMemo split) "ABG-NR"))
                                )

                                (if anl-nr
                                    (begin
                                        (printf "anl-nr: %s\n" anl-nr)
                                        ; Anlagen buchung
                                        (set! anlagen (append anlagen (list split)))
                                        ;
                                        ; Falls anlage im berichtsjahr gekauft wurde, den restwert mit dem kaufpreis
                                        ; initialisieren:
                                        ;
                                        (if (= year splityear)
                                            (hash-set-add-numeric restwerte anl-nr (xaccSplitGetValue split))
                                        )
                                    )
                                )
                                (if erw-nr
                                    (begin
                                        ;
                                        ; Buchung nur beruecksichtigen, falls im berichtsjahr
                                        ;
                                        (printf "anl-nr: %s\n" anl-nr)
                                        (if (= year splityear)
                                            (hash-set-add-numeric erweiterungen erw-nr (xaccSplitGetValue split))
                                        )
                                    )
                                )
                                
                                (if afa-nr
                                    (begin
                                        ; (printf "afa-nr: %s\n" afa-nr)
                                        ;
                                        ; Buchung nur beruecksichtigen, falls im berichtsjahr
                                        ;
                                        (if (= year splityear)
                                            ; AFA buchung
                                            (hash-set-add-numeric afabuchungen afa-nr (gnc-numeric-neg (xaccSplitGetValue split)))
                                        )
                                    )
                                )
                                (if abg-nr
                                    ; Abgangs-buchung
                                    (hash-set! abgaenge abg-nr split)
                                )
                            )

                        )
                        splits
                    )

                    ; (display afabuchungen) (printf " <afa-afabuchungen\n")

                    (gnc:html-document-set-style! doc "table" 'attribute (list "border" 1))

                    (gnc:html-table-set-col-style! table 1 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 2 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 3 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 4 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 5 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 6 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 7 "td" 'attribute (list "align" "right"))

                    (gnc:html-table-set-col-headers! table '("Inv.Nr <br> Bezeich." 
                        "Anschaff.<br>- Datum<br>- Kosten" "Wert 1.1." "Zuschreib.<br>Erweit."
                        "Meth.<br>ND<br>%" "Abg. Datum" "AFA" "Wert <br> 31.12."))

                    ; Schleife ueber alle anlagen - splits
                    (for-each (lambda (split)
                            (let (
                                    (trn (xaccSplitGetParent split))
                                    (ndauer-string (get-pseudo-kvp (xaccSplitGetMemo split) "ND"))
                                    (prozent "--")
                                    (restwert (hash-ref restwerte (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")))
                                    (restwert-str #f)
                                    (erw-str "")
                                    (afavalue (hash-ref afabuchungen (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")))
                                    (erwvalue (hash-ref erweiterungen (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")))
                                    (abgsplit (hash-ref abgaenge (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")))
                                    (endwert (hash-ref endwerte (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")))
                                    (trn-year (gnc:timepair-get-year (gnc-transaction-get-date-posted (xaccSplitGetParent split))))
                                )

                                ; (display (xaccSplitGetValue afasplit) (printf " <-afa value\n"))

                                (if restwert

                                    ; Nur auflisten, falls restwert vorhanden (oder kauf in diesem jahr)
                                    (if (not (gnc-numeric-zero-p restwert))
                                        (begin

                                            ; Restwert
                                            (if (= trn-year year)
                                                ; Kauf in diesem jahr, kein restwert vorhanden
                                                (set! restwert-str "")
                                                (begin
                                                    (set! restwert-str (num-to-text (comm-umrechnung doc anlagenaccount restwert euroCurrency)))
                                                    (set! sumanlagen (gnc-numeric-add-fixed sumanlagen (comm-umrechnung doc anlagenaccount restwert euroCurrency)))
                                                )
                                            )

                                            (if afavalue
                                                (set! sumafa (gnc-numeric-add-fixed sumafa (comm-umrechnung doc anlagenaccount afavalue euroCurrency)))
                                            )
                                            (set! sumend (gnc-numeric-add-fixed sumend (comm-umrechnung doc anlagenaccount endwert euroCurrency)))

                                            (if erwvalue
                                                (begin
                                                    (set! sumerw (gnc-numeric-add-fixed sumerw (comm-umrechnung doc anlagenaccount erwvalue euroCurrency)))
                                                    (set! erw-str (num-to-text (comm-umrechnung doc anlagenaccount erwvalue euroCurrency)))
                                                )
                                            )

                                            ; ndauer ist nicht gesetzt, falls afa buchungen noch nicht vorbereitet wurden
                                            (if ndauer-string
                                                (begin
                                                    (set! prozent (/ 100.0 (string->number ndauer-string)))
                                                )
                                                (set! ndauer-string "--")
                                            )

                                            (gnc:html-table-append-row! table (list
                                                ; nummer, bezeichnung
                                                (string-append (xaccTransGetNum trn) "<br>" (xaccTransGetDescription trn))
                                                ; Anschaffungsdatum, wert
                                                (string-append (gnc-print-date (gnc-transaction-get-date-posted trn)) "<br>" (num-to-text (comm-umrechnung doc anlagenaccount (xaccSplitGetValue split) euroCurrency)))
                                                ; restwert 1.1.
                                                restwert-str
                                                ; zuschreibungen
                                                erw-str
                                                ; Methode
                                                (string-append "linear<br>" ndauer-string "<br>" (sprintf #f "%.2f" prozent))
                                                ; Abgang
                                                (if abgsplit
                                                    (gnc-print-date (gnc-transaction-get-date-posted (xaccSplitGetParent abgsplit)))
                                                    ""
                                                )
                                                ; afa
                                                (if afavalue
                                                    (num-to-text (comm-umrechnung doc anlagenaccount afavalue euroCurrency))
                                                    ""
                                                )
                                                ; rest 31.12.
                                                (num-to-text (comm-umrechnung doc anlagenaccount endwert euroCurrency))
                                            ))

                                            ; tabelle enhaelt eintraege -> anzeigen
                                            (set! table-not-empty #t)
                                        )
                                    )
                                    (html-add-text doc (redText "ERROR") ", Restwert fuer Anlage '" 
                                        (xaccTransGetDescription trn) "' (" (xaccTransGetNum trn) 
                                        ") konnte nicht berechnet werden !")
                                )

                            )
                        )
                        anlagen
                    )

                    (if table-not-empty
                        (begin
                            (html-add-text doc "<h3>Konto: " (xaccAccountGetName anlagenaccount) "</h3>")

                            (gnc:html-table-append-row! table (list
                                "<h4>Summe</h4>"
                                ""
                                (string-append "<h4>" (num-to-text sumanlagen) "</h4>")
                                (string-append "<h4>" (num-to-text sumerw) "</h4>")
                                ""
                                ""
                                (string-append "<h4>" (num-to-text sumafa) "</h4>")
                                (string-append "<h4>" (num-to-text sumend) "</h4>")
                            ))
                            (gnc:html-document-add-object! doc table)
                        )
                    )
                )
            )
            anlagenaccounts
        )

(if #f
        ; Schleife 2 ueber alle anlagen accounts
        (for-each (lambda (anlagenaccount)
                (let (
                        (restwerte (berechne-afa-restwerte restdateTPTS book anlagenaccount))
                        (endwerte (berechne-afa-restwerte enddateTPTS book anlagenaccount))

                        (splits (query-split-by-account-and-enddateTPTS-all book anlagenaccount enddateTPTS))

                        ; html tabelle fuer diesen account
                        (table (gnc:make-html-table))
                        (anlagen '())
                        ; alle abgaenge bis einschliesslich dieses jahr
                        (abgaenge (make-hash-table 1))
                        ; alle erweiterungen bis einschliesslich dieses jahr
                        (erweiterungen (make-hash-table 1))
                        ; afa's dieses jahr
                        (afabuchungen (make-hash-table 1))
                        ; summe aller eroeffnungen
                        (sumanlagen (gnc-numeric-zero))
                        ; summe aller afa's
                        (sumafa (gnc-numeric-zero))
                        ; summe aller zuschreibungen
                        (sumerw (gnc-numeric-zero))
                        ; summe aller endwerte
                        (sumend (gnc-numeric-zero))
                        ; flag ob tabelle eintraege enthaelt
                        (table-not-empty #f)
                    )

                    (printf "anlagespiegel fuer konto: %s/%s\n" (xaccAccountGetName anlagenaccount) (xaccAccountGetDescription anlagenaccount))

                    ; Schleife ueber alle buchungen im anlagen konto
                    (for-each (lambda (split)
                                
                            (let (
                                    (splityear (gnc:timepair-get-year (gnc-transaction-get-date-posted (xaccSplitGetParent split))))
                                    (anl-nr (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR"))
                                    (erw-nr (get-pseudo-kvp (xaccSplitGetMemo split) "ERW-NR"))
                                    (afa-nr (get-pseudo-kvp (xaccSplitGetMemo split) "AFA-NR"))
                                    (abg-nr (get-pseudo-kvp (xaccSplitGetMemo split) "ABG-NR"))
                                )

                                (if anl-nr
                                    (begin
                                        (printf "anl-nr: %s\n" anl-nr)
                                        ; Anlagen buchung
                                        (set! anlagen (append anlagen (list split)))
                                        ;
                                        ; Falls anlage im berichtsjahr gekauft wurde, den restwert mit dem kaufpreis
                                        ; initialisieren:
                                        ;
                                        (if (= year splityear)
                                            (hash-set-add-numeric restwerte anl-nr (xaccSplitGetValue split))
                                        )
                                    )
                                )
                                (if erw-nr
                                    ;
                                    ; Buchung nur beruecksichtigen, falls im berichtsjahr
                                    ;
                                    (if (= year splityear)
                                        (hash-set-add-numeric erweiterungen erw-nr (xaccSplitGetValue split))
                                    )
                                )
                                
                                (if afa-nr
                                    (begin
                                        ; (printf "afa-nr: %s\n" afa-nr)
                                        ;
                                        ; Buchung nur beruecksichtigen, falls im berichtsjahr
                                        ;
                                        (if (= year splityear)
                                            ; AFA buchung
                                            (hash-set-add-numeric afabuchungen afa-nr (gnc-numeric-neg (xaccSplitGetValue split)))
                                        )
                                    )
                                )
                                (if abg-nr
                                    ; Abgangs-buchung
                                    (hash-set! abgaenge abg-nr split)
                                )
                            )

                        )
                        splits
                    )

                    ; (display afabuchungen) (printf " <afa-afabuchungen\n")

                    (gnc:html-document-set-style! doc "table" 'attribute (list "border" 1))

                    (gnc:html-table-set-col-style! table 1 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 2 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 3 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 4 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 5 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 6 "td" 'attribute (list "align" "right"))
                    (gnc:html-table-set-col-style! table 7 "td" 'attribute (list "align" "right"))

                    (gnc:html-table-set-col-headers! table '("Inv.Nr <br> Bezeich." 
                        "Anschaff.<br>- Datum<br>- Kosten" "Wert 1.1." "Zuschreib.<br>Erweit."
                        "Meth.<br>ND<br>%" "Abg. Datum" "AFA" "Wert <br> 31.12."))

                    ; Schleife ueber alle anlagen - splits
                    (for-each (lambda (split)
                            (let (
                                    (trn (xaccSplitGetParent split))
                                    (ndauer-string (get-pseudo-kvp (xaccSplitGetMemo split) "ND"))
                                    (prozent "--")
                                    (restwert (hash-ref restwerte (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")))
                                    (restwert-str #f)
                                    (erw-str "")
                                    (afavalue (hash-ref afabuchungen (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")))
                                    (erwvalue (hash-ref erweiterungen (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")))
                                    (abgsplit (hash-ref abgaenge (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")))
                                    (endwert (hash-ref endwerte (get-pseudo-kvp (xaccSplitGetMemo split) "ANL-NR")))
                                    (trn-year (gnc:timepair-get-year (gnc-transaction-get-date-posted (xaccSplitGetParent split))))
                                )

                                ; (display (xaccSplitGetValue afasplit) (printf " <-afa value\n"))

                                (if restwert

                                    ; Nur auflisten, falls restwert vorhanden (oder kauf in diesem yahr)
                                    (if (not (gnc-numeric-zero-p restwert))
                                        (begin

                                            ; Restwert
                                            (if (= trn-year year)
                                                ; Kauf in diesem jahr, kein restwert vorhanden
                                                (set! restwert-str "")
                                                (begin
                                                    (set! restwert-str (num-to-text (comm-umrechnung doc anlagenaccount restwert euroCurrency)))
                                                    (set! sumanlagen (gnc-numeric-add-fixed sumanlagen (comm-umrechnung doc anlagenaccount restwert euroCurrency)))
                                                )
                                            )

                                            (if afavalue
                                                (set! sumafa (gnc-numeric-add-fixed sumafa (comm-umrechnung doc anlagenaccount afavalue euroCurrency)))
                                            )
                                            (set! sumend (gnc-numeric-add-fixed sumend (comm-umrechnung doc anlagenaccount endwert euroCurrency)))

                                            (if erwvalue
                                                (begin
                                                    (set! sumerw (gnc-numeric-add-fixed sumerw (comm-umrechnung doc anlagenaccount erwvalue euroCurrency)))
                                                    (set! erw-str (num-to-text (comm-umrechnung doc anlagenaccount erwvalue euroCurrency)))
                                                )
                                            )

                                            ; ndauer ist nicht gesetzt, falls afa buchungen noch nicht vorbereitet wurden
                                            (if ndauer-string
                                                (begin
                                                    (set! prozent (/ 100.0 (string->number ndauer-string)))
                                                )
                                                (set! ndauer-string "--")
                                            )

                                            (gnc:html-table-append-row! table (list
                                                ; nummer, bezeichnung
                                                (string-append (xaccTransGetNum trn) "<br>" (xaccTransGetDescription trn))
                                                ; Anschaffungsdatum, wert
                                                (string-append (gnc-print-date (gnc-transaction-get-date-posted trn)) "<br>" (num-to-text (comm-umrechnung doc anlagenaccount (xaccSplitGetValue split) euroCurrency)))
                                                ; restwert 1.1.
                                                restwert-str
                                                ; zuschreibungen
                                                erw-str
                                                ; Methode
                                                (string-append "linear<br>" ndauer-string "<br>" (sprintf #f "%.2f" prozent))
                                                ; Abgang
                                                (if abgsplit
                                                    (gnc-print-date (gnc-transaction-get-date-posted (xaccSplitGetParent abgsplit)))
                                                    ""
                                                )
                                                ; afa
                                                (if afavalue
                                                    (num-to-text (comm-umrechnung doc anlagenaccount afavalue euroCurrency))
                                                    ""
                                                )
                                                ; rest 31.12.
                                                (num-to-text (comm-umrechnung doc anlagenaccount endwert euroCurrency))
                                            ))

                                            ; tabelle enhaelt eintraege -> anzeigen
                                            (set! table-not-empty #t)
                                        )
                                    )
                                    (html-add-text doc (redText "ERROR") ", Restwert fuer Anlage '" 
                                        (xaccTransGetDescription trn) "' (" (xaccTransGetNum trn) 
                                        ") konnte nicht berechnet werden !")
                                )

                            )
                        )
                        anlagen
                    )

                    (if table-not-empty
                        (begin
                            (html-add-text doc "<h3>Konto: " (xaccAccountGetName anlagenaccount) "</h3>")

                            (gnc:html-table-append-row! table (list
                                "<h4>Summe</h4>"
                                ""
                                (string-append "<h4>" (num-to-text sumanlagen) "</h4>")
                                (string-append "<h4>" (num-to-text sumerw) "</h4>")
                                ""
                                ""
                                (string-append "<h4>" (num-to-text sumafa) "</h4>")
                                (string-append "<h4>" (num-to-text sumend) "</h4>")
                            ))
                            (gnc:html-document-add-object! doc table)
                        )
                    )
                )
            )
            anlagenaccounts
        )
)

        doc
    )
)

;  Plausibilitaets pruefungen:
;       - keine buchungen mit "99xx" konten, diese sind spezialkonten fuer unsere buchhaltung, 
;       die nicht beim SB auftauchen sollen !
(define (export-acc-mapping doc trn knr accountMapping)
    (let (
            (mapped-account (hash-ref accountMapping knr))
        )

        (if (string=? (substring knr 0 2) "99")
            (begin
                (html-add-text doc (redText "Fehler") "'")
                (html-add-trn doc trn)
                (html-add-text doc "': 99xx konto soll exportiert werden: " knr "!")
            )
        )

        ; (printf "export: %s\n" (list-ref splitted 0))
        (if (and mapped-account (not (string=? knr mapped-account)))
            (begin
                (html-add-text doc (greenText "Wandle") " Kontonummer " knr " in " mapped-account " um!<br>")
                mapped-account
            )
            knr
        )
    )
)

;
; Entfernt zahlen und sonderzeichen aus string
;
(define (numberFilter char)
    (if (or (char-numeric? char) (char-set-contains? char-set:punctuation char))
      #f
    )
)

(define (number-filter trndesc endIndex)
    (if (or (<= (string-length trndesc) 30) (>= endIndex 30))
        trndesc
        (number-filter (string-filter (string-trim-both (string-append (string-filter trndesc numberFilter 0 endIndex) (substring trndesc endIndex)) char-set:whitespace) wsFilter) (+ endIndex 1))
    )
)

;
; Entfernt wiederholten whitespace aus string
;
(define lastCharWasWS #f)
(define (wsFilter char)

    (if (char-whitespace? char)
        (if lastCharWasWS
           #f
           (begin
                (set! lastCharWasWS #t)
                #t
           )
        )
        (begin
            #t
            (set! lastCharWasWS #f)
        )
    )
)

; Buchungsbetrag wird aus split 1 extrahiert !
; Split2 ist der Brutto-split
(define (csv-export-teilbuchung doc outport trn split1 split2 accountMapping)
    (let (
            (splitvalue (xaccSplitGetValue split1))
            (trndesc (xaccTransGetDescription trn))
            (split1memo (xaccSplitGetMemo split1))
            (euroCurrency (gnc-commodity-table-lookup (gnc-commodity-table-get-table (gnc-get-current-book)) "ISO4217" "EUR"))
            (splitCommodity (xaccAccountGetCommodity (xaccSplitGetAccount split1)))
        )

        (if (not (= 100 (gnc-numeric-denom splitvalue)))
            (html-add-text doc (redText "Fehler") ": denom ist nicht 100 !")
        )

        ;
        ; Prüfung, ob der wert in EURO ist, sonst umrechnung:
        ;
        (if (not (gnc-commodity-equiv euroCurrency splitCommodity))
            (begin
                (html-add-text doc "<br>" (blueText "WARNUNG") ", Split nicht in EURO: '" (xaccSplitGetMemo split1) "', Umrechnung: ")
                (html-add-text doc (num-comm-to-text splitvalue splitCommodity) " --> ")
                (set! splitvalue (gnc-convert-to-euro splitCommodity splitvalue))
                (html-add-text doc (num-comm-to-text splitvalue euroCurrency) ".<br>")
            )
        )

        (set! trndesc (string-append trndesc " " split1memo))

        ; trn_desc=trn.getattr(default:''; attr:'_opt_trn_description')
        ; trn_desc=trn_desc+"; "+memo

        ; es wird immer soll an haben exportiert, das heisst, falls splitvalue >= 0 ist wird
        ; der betrag negiert und die konten entsprechend vertauscht !!!!!!!!!!

        ; 1. "Buchungsbetrag --> "Umsatz"
        (if (= -1 (gnc-numeric-compare splitvalue numeric0))
            ; soll betrag, split 1 ist soll split, split 2 ist haben split
            (display (number->string (gnc-numeric-num (gnc-numeric-neg splitvalue))) outport)
            ; soll betrag, split 2 ist soll split, split 1 ist haben split, umpolen
            (display (number->string (gnc-numeric-num splitvalue)) outport)
        )
        (display "s;" outport)

        ; 2. BU-Schluessel
        (display ";" outport)

        ; 3. Gegenkonto == Habenkonto
        (if (= -1 (gnc-numeric-compare splitvalue numeric0))    
            ; split 1 ist soll split, split 2 ist haben split
            (display (export-acc-mapping doc trn (get-split-knr doc split1) accountMapping) outport)
            ; split 2 ist soll split, split 1 ist haben split
            (display (export-acc-mapping doc trn (get-split-knr doc split2) accountMapping) outport)
        )
        (display ";" outport)

        ; 4. Belegnummer --> "Belegfeld1"
        (display "\"" outport)
        (display (xaccTransGetNum trn) outport)
        (display "\";" outport)

        ; 5. "Belegfeld2"
        (display ";" outport)

        ; 6. "Belegdatum", DDMM
        (display (sprintf #f "%02d" (gnc:date-get-month-day (gnc:timepair->date (gnc-transaction-get-date-posted trn)))) outport)
        (display (sprintf #f "%02d" (gnc:timepair-get-month (gnc-transaction-get-date-posted trn))) outport)
        (display ";" outport)
        
        ; 7. Konto == Sollkonto
        (if (= -1 (gnc-numeric-compare splitvalue numeric0))    
            ; split 1 ist soll split, split 2 ist haben split
            (display (export-acc-mapping doc trn (get-split-knr doc split2) accountMapping) outport)
            ; split 2 ist soll split, split 1 ist haben split
            (display (export-acc-mapping doc trn (get-split-knr doc split1) accountMapping) outport)
        )
        (display ";" outport)


        ; 8., 9., 10., 11. Kostfeld 1 + 2, Kostmenge, Skonto
        (display ";;;;" outport)

        ; 12. Buchungstext"
        ;
        ; XXX Datev aktzeptiert hier nuc 30 Zeichen, laengere strings werden beim
        ; import abgeschnitten.
        ; Um bei laengeren strings moeglichst viel information zu behalten,
        ; wird wird wie folgt vorgegangen:
        ; * trim rechts und links
        ; * wiederholten whitespace entfernen
        ; * falls immernoch zu lang: zahlen (z.b. kontonummern) aus dem string entfernen
        ;
        ; (printf "\ns untrimmed: '%s', laenge: %d\n" trndesc (string-length trndesc)) 

        (set! trndesc (string-filter (string-trim-both trndesc char-set:whitespace) wsFilter))

        ; (printf "s trimmed, removed whitespace '%s', laenge: %d\n" trndesc (string-length trndesc)) 

        (if (> (string-length trndesc) 30)
            (begin
                (set! trndesc (number-filter trndesc 0))
                ; (printf "s removed numbers '%s', laenge: %d\n" trndesc (string-length trndesc)) 
            )
        )

        (if (> (string-length trndesc) 30)
            (begin
                (set! trndesc (substring trndesc 0 30))
                ; (printf "s cutted to 30 chars: '%s'\n" trndesc)
            )
        )

        (display "\"" outport)
        (display trndesc outport)
        (display "\";" outport)

        ; 13. ...EULand + EuSteuersatz + Waehrungskennung + Basiswaehrungsbetrag + 
        ; + Basiswaehrungskennung + kurs
        (display ";;;;;;" outport)

        (display "\n" outport)
    )
)

(define (get-numeric-sign value)
    ;(/ (gnc-numeric-num value) (gnc-numeric-num (gnc-numeric-abs value)))
    (if (= (gnc-numeric-compare value numeric0) -1)
        -1
        1
    )
)

;
; Aufteilung der splits in brutto- und gegensplits
;
; Annahme: brutto-split ist der split der "alleine auf einer seite der transaktion steht"
;
; Ergebnis ist liste, erstes element: brutto split, zweites element die restlichen splits
;
(define (get-brutto-split doc trn)
    (let (
            (splits (xaccTransGetSplitList trn))
            (sollsplits '())
            (habensplits '())
        )

        ;
        ; Splits nach soll und haben sortieren
        ;
        (map (lambda (split)
                (let (
                        (svalue (xaccSplitGetValue split))
                    )

                    ;
                    ; Positiver wert: soll
                    ; Negativer wert: haben
                    ;
                    (if (= 1 (gnc-numeric-compare svalue numeric0))
                        (set! sollsplits (append sollsplits (list split)))
                        (set! habensplits (append habensplits (list split)))
                    )
                )
            )
            splits
        )

        (if (= (length sollsplits) 1)
            (begin
                ; Fertig, ergebnis zurueckliefern:
                (list (list-ref sollsplits 0) habensplits)
            )
            (if (= (length habensplits) 1)
                (begin
                    ; Fertig, ergebnis zurueckliefern:
                    (list (list-ref habensplits 0) sollsplits)
                )
                (begin
                    ; Fehler,
                    (html-add-text doc "<p>" (redText "Error") "<p>Ungueltige Anzahl splits (soll: " (number->string (length sollsplits)) ", haben: " (number->string (length habensplits)) ")in Transaktion ")
                    (html-add-trn doc trn)
                    (html-add-text doc ", kann Brutto Split nicht feststellen !</p>")
                    #f
                )
            )
        )
    )
)

(define (string-list-contains string-list string-element)
    (let (
            (this-element (car string-list))
        )
        (if (string=? this-element string-element)
            #t
            (if (> (length string-list) 1)
                (string-list-contains (cdr string-list) string-element)
                #f
            )
        )
    )
)

; ; Brutto split aus transaktion suchen, bruttosplit ist der split mit dem
; ; anderen vorzeichen als der netto-split.
; (define (get-brutto-split-by-sign doc splits netto-value)
;     (let (
;             (bruttosign (get-numeric-sign (xaccSplitGetValue (car splits))))
;         )
; 
;         ; Vorzeichen vergleichen:
;         (if (= bruttosign (get-numeric-sign netto-value))
;             (if (> (length splits) 1)
;                 (get-brutto-split-by-sign doc (cdr splits) netto-value)
;                 #f
;             )
;             ; Vorzeichen unterschiedlich, brutto-split gefunden:
;             (car splits)
;         )
;     )
; )

; Brutto split aus transaktion suchen, bruttosplit ist der split mit dem
; anderen vorzeichen als der netto-split.
; Auserdem abzug von "nicht-automatischen/manuellen buchungen".
; Return: brutto wert
(define (get-brutto-value-by-sign doc tara-accounts splits netto-value)
    (let (
            (bruttovalue #f)
            (abzug numeric0)
        )

        (printf "ignor acc: %s" (car tara-accounts))
        (display tara-accounts)
        (printf ">\n")
        (map (lambda (split)
                (let (
                        (bruttosign (get-numeric-sign (xaccSplitGetValue split)))
                    )
   
                    (printf "split-knr: %s\n" (get-split-knr doc split))

                    (printf "memq")
                    (display (string-list-contains tara-accounts (get-split-knr doc split)))
                    (printf ">\n")

                    ; Vorzeichen vergleichen:
                    (if (= bruttosign (get-numeric-sign netto-value))
                        ; Vorzeichen gleich, ggf. buchungswert aufsummieren
                        (if (not (string-list-contains tara-accounts (get-split-knr doc split)))
                          (begin 
                            (printf "memq true: %s\n" (get-split-knr doc split))
                            (set! abzug (gnc-numeric-add-fixed abzug (xaccSplitGetValue split))) )
                        )
                        ; Vorzeichen unterschiedlich, brutto-split gefunden:
                        (set! bruttovalue (xaccSplitGetValue split))
                    )
                )
            )
            splits
        )
        (printf "found brutto value<")
        (display bruttovalue)
        (printf ">\n")
        (printf "found abzug")
        (display abzug)
        (printf ">\n")
        ; Subtrahiere abzug, add wegen negativem vorzeichen
        (gnc-numeric-add-fixed bruttovalue abzug)
    )
)

(define (my-string-replace-char s old new)
  (string-map (lambda (c) (if (char=? c old) new c)) s))

(define (getAccountMapping doc)
    (let (
            (accountMapping (make-hash-table 1))
            (renamedAccounts (find-accounts-has-desc-value doc "ExportKNR"))
        )

        (map (lambda (renamedAccount)
                (if (not (get-desc-value "NoExport" doc renamedAccount #t))
                    (hash-set! accountMapping (get-account-knr doc renamedAccount) (get-desc-value "ExportKNR" doc renamedAccount #t))
                )
            )
            renamedAccounts
        )

        ; (display accountMapping) (printf "<accountMapping\n")

        accountMapping
    )
)

; Hook for reload
(define (csvexportRenderer report-obj)

    (csvExport report-obj (gnc:make-html-document))
)

(define (csvExport report-obj doc)

    (let (
            (book (gnc-get-current-book))
            ; String-replace wegen LANG variable
            (today-str (my-string-replace-char (gnc-print-date (gnc:get-today))  #\/ #\.))
            ; Path
            (pathname (build-path (or (getenv "HOME") (getenv "USERPROFILE")) "gnc_csv_export"))
            (startdate (gnc:timepair-start-day-time
                (gnc:date-option-absolute-time 
                    (report-get-option report-obj gnc:pagename-general optname-from-date))))
            (enddate (gnc:timepair-end-day-time 
                (gnc:date-option-absolute-time 
                    (report-get-option report-obj gnc:pagename-general optname-to-date))))
            (do-report (report-get-option report-obj gnc:pagename-general optname-run-cvs-export))
        )

        (html-add-text doc "<h2>Ergebnis CSV Export:</h2>")

        (if do-report

            (let (
                    ; Dateiname
                    (filename (build-path pathname (string-append (number->string (gnc:timepair-get-year startdate)) "_" today-str ".csv")))
                    (outport #f)
                )

                (html-add-text doc "<p>Exportiere Buchungen vom " (gnc-print-date startdate) " bis zum " (gnc-print-date enddate) "</p>")
                (html-add-text doc "Name Ausgabedatei: " filename "<br><br>")

                ; Ignore exception if directory exists.
                (false-if-exception (mkdir pathname))
                (set! outport (false-if-exception (open-output-file filename)))

                (if outport
                    (let (
	                        (query (qof-query-create-for-splits))
                            (num-trn 0)
                            (nError 0)
                            (accountMapping (getAccountMapping doc))
                        )

                        (qof-query-set-book query book)
        ; The DateMatch queries match transactions whose posted date                                                 
        ;    is in a date range.  If use_start is TRUE, then a matching                                              
        ;    posted date will be greater than the start date.   If                                                   
        ;    use_end is TRUE, then a match occurs for posted dates earlier                                           
        ;    than the end date.  If both flags are set, then *both*                                                  
        ;    conditions must hold ('and').  If neither flag is set, then                                             
        ;    all transactions are matched.                                                                           
                        (xaccQueryAddDateMatchTS query
                             #t startdate
                             #t enddate QOF-QUERY-AND)
                        (qof-query-set-sort-order query (list QUERY-DEFAULT-SORT) '() '())

                        ; Problem: wir wollen eigentlich alle splits exportieren, ein split betrifft aber
                        ; nur ein konto, so dass sich die frage nach dem gegenkonto auftut. Wir muessen
                        ; also ueber die transaktion gehen.
                        ; Falls die Transaktion nur 2 splits enthaelt ist das kein problem.
                        ; Falls 3 oder mehr splits vorhanden sind, so muss der brutto split gefunden werden und der
                        ; wert auf die anderen verteilt werden.

                        ; Schleife ueber alle transaktionen
                        (map (lambda (trn)
                                (let (
                                        (bruttosplit #f)
                                        (othersplits #f)
                                        (splitted (get-brutto-split doc trn))
                                        (exportTrn #t)
                                    )

                                    (if splitted
                                        (begin

                                            (set! bruttosplit (list-ref splitted 0))
                                            (set! othersplits (list-ref splitted 1))

                                            ;
                                            ; Nur exportieren, falls nicht descvalue "NoExport" gesetzt ist:
                                            ;
                                            (if (and bruttosplit (get-desc-value "NoExport" doc (xaccSplitGetAccount bruttosplit) #t))
                                                (set! exportTrn #f)
                                            )
                                            (map (lambda (split)
                                                    (if (get-desc-value "NoExport" doc (xaccSplitGetAccount split) #t)
                                                        (set! exportTrn #f)
                                                    )
                                                    ;
                                                    ; Um die waehrungs-umrechnung in csv-export-teilbuchung zu vereinfachen, gilt die regel dass
                                                    ; alle splits der transaktion in der gleichen waehrung sein muessen.
                                                    ;
                                                    (if (not (gnc-commodity-equiv (xaccAccountGetCommodity (xaccSplitGetAccount split)) (xaccAccountGetCommodity (xaccSplitGetAccount bruttosplit))))
                                                        (begin
                                                            (html-add-text doc "<br>" (redText "FEHLER") ", Nicht alle Splits der Transaktion sind in der gleichen Waehrung: " (xaccTransGetDescription trn) "<br>")
                                                            (set! exportTrn #f)
                                                            (set! nError (+ nError 1))
                                                        )
                                                    )
                                                )
                                                othersplits
                                            )

                                            (if (and bruttosplit exportTrn)
                                                (begin

                                                    (html-add-text doc "Export Buchung '" (xaccTransGetDescription trn) "'<br>")

                                                    (map (lambda (split)
                                                            (if (not (get-desc-value "NoExport" doc (xaccSplitGetAccount bruttosplit) #t))
                                                                (csv-export-teilbuchung doc outport trn split bruttosplit accountMapping)
                                                                (html-add-text doc (greenText "Skipping") " 'NoExport' Transaction '" (xaccTransGetDescription trn) "'<br>")
                                                            )
                                                        )
                                                        othersplits
                                                    )

                                                    (set! num-trn (+ num-trn 1))
                                                )
                                                (html-add-text doc (greenText "&Uuml;berspringe") " 'NoExport' Transaktion: '" (xaccTransGetDescription trn) "'<br>")
                                            )
                                        ) ; begin
                                    ) ; if splitted
                                )
                            )

                            ;(gnc:query-get-transactions query 'query-txn-match-any)
                            (xaccQueryGetTransactions query QUERY-TXN-MATCH-ANY)

                        )

                        ;(gnc:free-query query)
                        (qof-query-destroy query)
                        (close-port outport)
                        (html-add-text doc "<br>Es wurden " (number->string num-trn) " Buchungen exportiert.<br>")
                        (if (> nError 0)
                            (html-add-text doc "<br>Dabei traten " (redText (number->string nError)) " " (redText "Fehler") " auf.<br>")
                        )
                    )
                    (html-add-text doc "Ausgabe Datei konnte nicht geoeffnet werden !")
                )

            )

            (html-add-text doc (blueText "Warnung:") " Option '" optname-run-cvs-export "' nicht gesetzt")
        )
        doc
    )
)

; Report ausfuerhen
(define (runReport window reportname saveit)
    (let (
            (report-id (gnc:make-report reportname))
        )

        ; do not save this thing, xxx does not work ?
        ; (load-from-path "report.scm")
        ; (gnc:report-set-needs-save?! (gnc-report-find report-id) saveit)
        (gnc:report-set-needs-save?! (gnc-report-find report-id) #f)

        (gnc-main-window-open-report report-id window)
    )
)

(define (define-result-report name report-guid renderer)
    (define (options-generator)
        (let ((options (gnc:new-options)))
        options))

    (gnc:define-report
        'version 1
        'name name
        'report-guid report-guid
        'options-generator options-generator
        'renderer renderer
        'in-menu? #f
    )
)

(define (date-interval-options-generator)
    (let (
            (options (gnc:new-options))
        )

        ; (gnc:options-add-date-interval!
            ; options gnc:pagename-general
            ; optname-from-date optname-to-date "a")

        ; (gnc:option-set-value
            ; (gnc:lookup-option options gnc:pagename-general optname-from-date)
            ; (cons 'relative 'start-this-year))
            ;
        ; (vector-set!
            ; (gnc:lookup-option options gnc:pagename-general optname-from-date)
            ; 7
            ; (lambda () (cons 'relative 'start-cal-year)))

        ; (gnc:option-set-value
            ; (gnc:lookup-option options gnc:pagename-general optname-to-date)
            ; (cons 'relative 'end-this-year))


        (gnc:register-option 
        options  
        (gnc:make-date-option
            gnc:pagename-general optname-from-date
            "a" (N_ "Start of reporting period")
            (lambda () (cons 'relative 'start-cal-year))
            #f 'both 
            '(
            today
            start-this-month 
            start-prev-month 
            start-current-quarter
            start-prev-quarter
            start-cal-year 
            start-prev-year
            start-accounting-period
            )))

        (gnc:register-option 
        options  
        (gnc:make-date-option
            gnc:pagename-general optname-to-date
            "b" (N_ "End of reporting period")
            (lambda () (cons 'relative 'end-cal-year))
            #f 'both 
            '(
            today 
            end-this-month
            end-prev-month 
            end-current-quarter 
            end-prev-quarter
            end-cal-year 
            end-prev-year
            end-accounting-period
            )))

        options
    )
)

(define (end-year-options-generator)
    (let (
            (options (gnc:new-options))
        )

        (gnc:register-option 
        options  
        (gnc:make-date-option
            gnc:pagename-general optname-to-date
            "b" (N_ "End of reporting period")
            (lambda () (cons 'relative 'end-cal-year))
            #f 'both 
            '(
            end-cal-year 
            end-prev-year
            )))

        options
    )
)

(define (ust-options-generator)
    (let (
            (options (gnc:new-options))
        )

        ; (gnc:options-add-date-interval!
            ; options gnc:pagename-general
            ; optname-from-date optname-to-date "a")

        ; (gnc:option-set-value
            ; (gnc:lookup-option options gnc:pagename-general optname-from-date)
            ; (cons 'relative 'start-this-year))
            ;
        ; (vector-set!
            ; (gnc:lookup-option options gnc:pagename-general optname-from-date)
            ; 7
            ; (lambda () (cons 'relative 'start-cal-year)))

        ; (gnc:option-set-value
            ; (gnc:lookup-option options gnc:pagename-general optname-to-date)
            ; (cons 'relative 'end-this-year))


        (gnc:register-option options  
          (gnc:make-date-option
            gnc:pagename-general optname-from-date
            "a" (N_ "Start of reporting period")
            (lambda () (cons 'relative 'start-cal-year))
            #f 'both 
            '(
            today
            start-this-month 
            start-prev-month 
            start-current-quarter
            start-prev-quarter
            start-cal-year 
            start-prev-year
            start-accounting-period
            )))

        (gnc:register-option options  
          (gnc:make-date-option
            gnc:pagename-general optname-to-date
            "b" (N_ "End of reporting period")
            (lambda () (cons 'relative 'end-cal-year))
            #f 'both 
            '(
            today 
            end-this-month
            end-prev-month 
            end-current-quarter 
            end-prev-quarter
            end-cal-year 
            end-prev-year
            end-accounting-period
            )))

        (gnc:register-option options  
            (gnc:make-simple-boolean-option
                  gnc:pagename-general optname-enter-tax-splits
                  "c"
                  optname-enter-tax-splits
                  #f))

        options
    )
)

(define (csv-export-options-generator)
    (let (
            (options (gnc:new-options))
        )

        (gnc:register-option options  
          (gnc:make-date-option
            gnc:pagename-general optname-from-date
            "a" (N_ "Start of reporting period")
            (lambda () (cons 'relative 'start-prev-year))
            #f 'both 
            '(
            today
            start-this-month 
            start-prev-month 
            start-current-quarter
            start-prev-quarter
            start-cal-year 
            start-prev-year
            start-accounting-period
            )))

        (gnc:register-option options  
          (gnc:make-date-option
            gnc:pagename-general optname-to-date
            "b" (N_ "End of reporting period")
            (lambda () (cons 'relative 'end-prev-year))
            #f 'both 
            '(
            today 
            end-this-month
            end-prev-month 
            end-current-quarter 
            end-prev-quarter
            end-cal-year 
            end-prev-year
            end-accounting-period
            )))

        (gnc:register-option options  
            (gnc:make-simple-boolean-option
                  gnc:pagename-general optname-run-cvs-export
                  "c"
                  optname-run-cvs-export
                  #f))

        options
    )
)

;
; Optionen für die funktion "AFA buchungen vorbereiten", benötigt wird der zeitraum für den
; die buchungen erstellt werden sollen (das jahr) und ein flag, ob die buchungen
; erstellt werden sollen, dieses wird automatishch zurückgestellt.
;
(define (afa-buchung-options-generator)
    (let (
            (options (gnc:new-options))
        )

        (gnc:register-option options  
          (gnc:make-date-option
            gnc:pagename-general optname-from-date
            "a" (N_ "Start of reporting period")
            (lambda () (cons 'relative 'start-prev-year))
            #f 'both 
            '(
            today
            start-this-month 
            start-prev-month 
            start-current-quarter
            start-prev-quarter
            start-cal-year 
            start-prev-year
            start-accounting-period
            )))

        (gnc:register-option options  
          (gnc:make-date-option
            gnc:pagename-general optname-to-date
            "b" (N_ "End of reporting period")
            (lambda () (cons 'relative 'end-prev-year))
            #f 'both 
            '(
            today 
            end-this-month
            end-prev-month 
            end-current-quarter 
            end-prev-quarter
            end-cal-year 
            end-prev-year
            end-accounting-period
            )))

        (gnc:register-option options  
            (gnc:make-simple-boolean-option
                  gnc:pagename-general optname-run-afa-buchung
                  "c"
                  optname-run-afa-buchung
                  #f))

        options
    )
)

(define ibr-menu-name (N_ "_IngRieger"))

(define (ibr-init)
  (if (not ibr-menu-created)
    (let (
            (menu-path (list (N_ "Extensions") ibr-menu-name))
        )

        (printf "Creating ibr-menu, GnuCash version: %s\n" gnc:version)

        (load-from-path "gnc-menu-extensions.scm")

        ;
        ; Menue erzeugen
        ;
        (gnc-add-scm-extension 
            (gnc:make-menu ibr-menu-name (list "Extensions"))
        )

        ; Buchungs - pruefung, ggf. anlegen von teilbuchungen
        ; fuer steuer, privatentnahmen
        (gnc:define-report
            'version 1
            'name "BuchungsCheck"
            'report-guid ust-check-guid
            'options-generator ust-options-generator
            'renderer ustRenderer
            'in-menu? #f
        )
        (gnc-add-scm-extension (
            gnc:make-menu-item
            (N_ "A Pruefung Buchungen")
            ust-check-menu-guid
            (N_ "Pruefung Buchungen")
            menu-path
            (lambda (window) (runReport window ust-check-guid #f))
            )
        )

        ;;;;; ; UST pruefung mit anlegen der buchungen
        ;;;;; (gnc:define-report
            ;;;;; 'version 1
            ;;;;; 'name "USTBuchungen"
            ;;;;; 'report-guid ust-auto-guid
            ;;;;; 'options-generator safe-date-interval-options-generator
            ;;;;; 'renderer ustRenderer
            ;;;;; 'in-menu? #f
        ;;;;; )
        ;;;;; (gnc-add-scm-extension (
            ;;;;; gnc:make-menu-item
            ;;;;; (N_ "B UST Buchungen anlegen")
            ;;;;; (N_ "UST Buchungen anlegen")
            ;;;;; menu-path
            ;;;;; (lambda (window) (runReport window ust-auto-guid #f))
            ;;;;; )
        ;;;;; )

        ; Pruefung Jahres-Abschluss
        ; (define-result-report "JAErgebnis" ja-guid jaRenderer)

        ; Pruefung Jahresabschluss
        (gnc:define-report
            'version 1
            'name "JAErgebnis"
            'report-guid ja-guid
            'options-generator date-interval-options-generator
            'renderer jaRenderer
            'in-menu? #f
        )
        (gnc-add-scm-extension (
            gnc:make-menu-item
            (N_ "B Pruefung Jahresabschluss")
            ja-menu-guid
            (N_ "Pruefung auf korrekten Jahresabschluss des aktuellen Buches")
            menu-path
            (lambda (window) (runReport window ja-guid #f))
            )
        )

        ;;;;;;;; definiere JU result report
        ;;;;;;;(define-result-report "JUErgebnis" ju-guid juRenderer)

        ;;;;;;;(gnc-add-scm-extension (
            ;;;;;;;gnc:make-menu-item
            ;;;;;;;(N_ "D Pruefung Jahresuebergaenge")
            ;;;;;;;(N_ "Pruefung auf korrekte Jahresuebergaenge aller Buecher")
            ;;;;;;;menu-path
            ;;;;;;;(lambda (window) (runReport window ju-guid #f))
            ;;;;;;;)
        ;;;;;;;)

        (gnc-add-scm-extension (gnc:make-extension 'separator "CCSeparator" cc-sep-guid "" menu-path #f))

        ; Definiere CSV Export bericht
        (gnc:define-report
            'version 1
            'name "CSVExport"
            'report-guid csv-export-guid
            'options-generator csv-export-options-generator
            'renderer csvexportRenderer
            'in-menu? #f
        )
        (gnc-add-scm-extension (
            gnc:make-menu-item
            (N_ "C CSV Export")
            csv-export-menu-guid
            (N_ "Buchungen als CSV Datei exportieren (fuer Steuerberater)")
            menu-path
            (lambda (window) (runReport window csv-export-guid #f))
            )
        )

        (gnc-add-scm-extension (gnc:make-extension 'separator "DDSeparator" dd-sep-guid "" menu-path #f))

        ; Menue eintrag anlage spiegel
        (gnc:define-report
            'version 1
            'name "AFASpiegel"
            'report-guid afa-spiegel-guid
            'options-generator end-year-options-generator
            'renderer aspiegelRenderer
            'in-menu? #f
        )

        ; Menue eintrag anlage spiegel
        (gnc-add-scm-extension (gnc:make-menu-item
            (N_ "D Anlagen Spiegel")
            afa-spiegel-menu-guid
            (N_ "Report Anlage Spiegel")
            menu-path
            (lambda (window) (runReport window afa-spiegel-guid #t))))

        ; definiere AFA vorbereiten result report
        (define-result-report  "AFAVorbereitung" afa-vorbereitung-guid afavRenderer)

        ; Menue eintrag afa vorbereitung
        (gnc-add-scm-extension (gnc:make-menu-item 
            (N_ "E AFA Buchungen Vorbereiten")
            afa-vorbereitung-menu-guid
            (N_ "AFA Buchungen im Gnucash-Abschreibungs-Buch vorbereiten")
            menu-path
            (lambda (window) (runReport window afa-vorbereitung-guid #f))))

        ; Definiere AFA vorbereiten result report
        (gnc:define-report
            'version 1
            'name "AFAVorbereitung2"
            'report-guid afa-vorbereitung2-guid
            'options-generator afa-buchung-options-generator
            'renderer afavRenderer2
            'in-menu? #f
        )
        (gnc-add-scm-extension (
            gnc:make-menu-item
            (N_ "E AFA Buchungen Vorbereiten2")
            afa-vorbereitung2-menu-guid
            (N_ "AFA Buchungen im Gnucash-Abschreibungs-Buch vorbereiten 2")
            menu-path
            (lambda (window) (runReport window afa-vorbereitung2-guid #f))))

        ;; ; definiere AFA uebernahme result report
        ;; (define-result-report "AFAUebernahme" afa-uebernahme-guid afauRenderer)

        ;; ; Menue eintrag afa daten uebernehmen
        ;; (gnc-add-scm-extension (gnc:make-menu-item
            ;; (N_ "G AFA Daten uebernehmen")
            ;; (N_ "Uebernahme der AFA daten in das aktuelle buch")
            ;; menu-path
            ;; (lambda (window) (runReport window afa-uebernahme-guid #f))))

        (if ibr-debug
            (begin

                (gnc-add-scm-extension (gnc:make-extension 'separator "FFSeparator" ff-sep-guid "" menu-path #f))

                (gnc-add-scm-extension (
                    gnc:make-menu-item
                    (N_ "F DEBUG Reload ibr-gnc-module")
                    reload-ibr-gnc-module-menu-guid
                    (N_ "DEBUG ibr-gnc-module.scm neu laden")
                    menu-path
                    (lambda (window)
                        (let (
                                (path (build-path (or (getenv "HOME") (getenv "USERPROFILE")) ".gnucash" "ibr-gnc-module.scm"))
                                )
                                (primitive-load path)
                            )
                        )
                    )
                )
            ) ; begin
        ) ; if ibr-debug

        (printf "Create ibr-menu done\n")

        (set! ibr-menu-created #t)

    )
  )
)

(printf "End ibr-gnc-module.scm\n")




