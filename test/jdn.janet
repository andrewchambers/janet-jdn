(import ../jdn)

# decode
(assert (deep= (jdn/decode (jdn/encode @{})) @[@{}]))
(assert (deep= (jdn/decode "") @[]))
(assert (deep= (jdn/decode ":a b") @[:a 'b]))

# decode-one
(assert (deep= (jdn/decode-one (jdn/encode "")) ""))
(assert (deep= (jdn/decode-one (jdn/encode nil)) nil))
(assert (deep= (jdn/decode-one "a b c") 'a))
(assert (match (protect (jdn/decode-one "")) [false _] true))

