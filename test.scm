(use test)
(use data-structures)
(use ports)
(use extras)
(use utils)

(use discount)

(test-group "Markdown in-memory processing"
	    (test "Should return a html string from a given markdown string"
		  "<h2>Download</h2>

<p><a href=\"http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip\">Markdown 1.0.1</a> (18 KB) &mdash; 17 Dec 2004</p>" (markdown "Download
--------

[Markdown 1.0.1][dl] (18 KB) -- 17 Dec 2004

[dl]: http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
")))