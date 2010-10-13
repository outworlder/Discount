(module discount
	'markdown
	(import scheme chicken foreign)

(define (markdown-generate-in-memory doc)
  (print "\n omsdgsd fsdf --------------------------------------------------" doc)
  (let-location ([out c-string*])
		(let ([rv (discount-mkd-document doc (location out))])
		       (let ([out out])
			 out))))
  
(define (markdown input #!key (flags 0))
  (let ([document (discount-mkd-string input (string-length input) flags)])
    (discount-mkd-compile! document flags)
    (markdown-generate-in-memory document)))
	 
