(import ../jdn)

# decode-values
(assert (deep= (jdn/decode-values (jdn/encode @{})) @[@{}]))
(assert (deep= (jdn/decode-values "") @[]))
(assert (deep= (jdn/decode-values ":a b") @[:a 'b]))

# decode
(assert (deep= (jdn/decode (jdn/encode "")) ""))
(assert (deep= (jdn/decode (jdn/encode nil)) nil))
(assert (deep= (jdn/decode "a b c") 'a))
(assert (match (protect (jdn/decode "")) [false _] true))

