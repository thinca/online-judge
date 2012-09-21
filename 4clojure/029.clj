(fn [string] (apply str (filter #(Character/isUpperCase %) (seq string))))
