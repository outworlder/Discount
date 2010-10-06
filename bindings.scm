(use bind)

(bind "typedef void MMIOT;")

;; Input functions

;; Reads a markdown input file and returns a MMIOT containing the preprocessed document. (which is then fed to markdown() for final formatting.)
(bind "MMIOT *mkd_in(FILE *f, int flags)")
;; Reads the markdown input file that’s been written into bfr and returns a preprocessed blob suitable for feedin to markdown(). This function exists because annotations uses mmap() to access message files instead of traditional file i/o. (If you’re going to port Markdown to an AS/400, this function is the droid you’ve been looking for.)
(bind "MMIOT *mkd_string(char *bfr, int size, int flags)")

;; "Big picture-style" processing functions

;; Formats a document (created with mkd_in() or mkd_string()) and writes the resulting HTML document to out.
(bind "int markdown(MMIOT *doc, FILE *out, int flags)")

;; Allocates a buffer, then formats the text string into that buffer. text string, allocates a buffer, The differences from markdown() are it doesn’t support quoting, footnotes (“reference links”,) multiple paragraphs, lists, code sections, or pure html sections.
(bind "int mkd_line(char *bfr, int size, char **out, int flags)")

;; Formats the text string and writes the resulting HTML fragment to out. It is exactly like mkd_line() except that it writes the output to a FILE*.
(bind "int mkd_generateline(char*bfr, int size, FILE *out, int flags)")

;; Fine-grained access to the internals

;; Takes a document created by mkd_in() or mkd_string() and compiles it into a tree of block elements.
(bind "int mkd_compile(MMIOT *doc, int flags)")

;; Generates HTML from a compiled document
(bind "int mkd_generatehtml(MMIOT *doc, FILE *out)")

;; Returns (in 'text') a pointer to the compiled HTML document, and (in the return code) the size of that document
(bind "int mkd_document(MMIOT *doc, char **text)")

;; Allocates a buffer and populates it with any style blocks found in the document
(bind "int mkd_css(MMIOT *doc, char **out)")

;; Prints any style blocks in the document
(bind "int mkd_generatecss(MMIOT *doc, FILE *out)")

;; Allocates a string, populates it with a table of contents, assigns it to out, and returns the length of the string
(bind "int mkd_toc(MMIOT *doc, char **out)")

;;; To get a table of contents, you must (compile) the document with the MKD_TOC flag (described below)

;; Writes a table of contents to out, other than writing to a string, it operates exactly like mkd_toc
(bind "int mkd_generatetoc(MMIOT *doc, FILE *out)")

;; Prints a block structure diagram of a compiled document
(bind "int mkd_dump(MMIOT *doc, FILE *f, int flags, char *title)")

;; Releases the MMIOT allocated for the document
(bind "void mkd_cleanup(MMIOT *doc)")

