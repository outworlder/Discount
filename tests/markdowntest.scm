(use utils)
(use discount)

(with-input-from-file (cadr (argv))
  (lambda ()
    (print (markdown (read-all (current-input-port))))))
       