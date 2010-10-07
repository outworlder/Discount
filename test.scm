(declare (uses bindings)
	 (uses discount))

(use test)
(use data-structures)
(use ports)
(use extras)
(use utils)

(test-group "Markdown file i/o"
	    (test "Should generate an html file from the markdown input file"
		  "test.html"
		  (begin
		    (generate-html (parse-markdown-file "test.markdown") "test.html")
		    (file-exists? "test.html")))
	    (test "The generated file should contain the corrent HTML markup"
		  "<h2>Download</h2>

<p><a href=\"http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip\">Markdown 1.0.1</a> (18 KB) &mdash; 17 Dec 2004</p>
" (read-all "test.html")))

