(setf tape
  (list 1 0 1 0 0 1 1 1 )
  ) ; 167 binary


(setf all-zeroes 
  (make-machine
    (list
      (make-state-pair
        (make-action 0 0 1)
        (make-action 0 0 1))
      )
    )
  )


