
(defn encode [j]
  "Encode a janet value to a jdn string."
  (string/format "%j" j))

(defn decode
  "Decode a string of buffer into zero
   or more janet values. Panics on parse error."
  [b]
  (def v @[])
  (def p (parser/new))
  (parser/consume p b)
  (parser/eof p)
  (when (= :error (parser/status p))
    (error (parser/error p)))
  (while (parser/has-more p)
    (array/push v (parser/produce p)))
  v)

(defn decode-one
  "Decode a string of buffer returning
   a single janet value. Trailing values
   are discarded. Panics on parse error."
  [b]
  (def p (parser/new))
  (parser/consume p b)
  (parser/eof p)
  (when (= :error (parser/status p))
    (error (parser/error p)))
  (unless (parser/has-more p)
    (error "expected at least one value"))
  (parser/produce p))