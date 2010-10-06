(include "bindings.scm")

;;; Generates a markdown object
(define (markdown-document data)
  ;;TODO
  )

;;; Reads the input string and returns a markdown-document
(define (parse-markdown input)
  (mkd_string input (string-length input) 0))

;;; Generates HTML to file
(define (generate-html document file)
  (mkd_line document (string-length document) file 0))

(print (generate-html
	(parse-markdown "<<TEST
Download
--------

[Markdown 1.0.1][dl] (18 KB) -- 17 Dec 2004

[dl]: http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
TEST") (current-output-port)))