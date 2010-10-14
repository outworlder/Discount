(module discount
	'markdown
	(import scheme chicken foreign)

	(include "bindings")
	
	(define (markdown-generate-in-memory doc)
	  (let-location ([out c-string*])
			(let ([rv (discount-mkd-document doc (location out))])
			  (let ([out out])
			    out))))
	
	(define (markdown input #!key (flags 0))
	  (let ([document (discount-mkd-string input (string-length input) flags)])
	    (discount-mkd-compile! document flags)
	    (markdown-generate-in-memory document))))

