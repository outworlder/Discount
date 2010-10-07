(declare (unit discount))

(define (sys-open-file filename #!key (mode "r+"))
  (let ([result (fopen filename mode)])
    (if (equal? result #f)
	(begin
	  (perror "")
	  result)
	result)))

(define (sys-close-file filename)
  (let ([result (fclose filename)])
    (if (equal? result #f)
	(begin
	  (perror "")
	  result)
	result)))

;;; Generates a markdown object
  ;; (define (markdown-document data)
  ;;   ;;TODO
  ;;   ))

;;; Reads a markdown document from a file
(define (parse-markdown-file input-file)
  (let ([file (sys-open-file input-file mode: "r")])
    (mkd_in file 0)))

;;; Reads the input string and returns a markdown-document
(define (parse-markdown input)
  (mkd_string input (string-length input) 0))

;;; Generates HTML to file
(define (generate-html document filename)
  (let* ([file (sys-open-file filename mode: "w")])
    (if file
	(begin
	  (markdown document file 0)
	  (sys-close-file file)))))

;; (generate-html
;;  (parse-markdown "<<TEST
;; Download
;; --------

;; [Markdown 1.0.1][dl] (18 KB) -- 17 Dec 2004

;; [dl]: http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
;; TEST"
;; 		 ) "test.html")

