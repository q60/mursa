Red [
    title: "ᠮᡠᡵᠰᠠ"
    version: 0.1.0
    description: {
        Random quote fetching console utility.
    }
    author: "Llathasa Veleth"
    mail: llathasa@outlook.com
    url: https://github.com/q60/mursa
]

wrap: func [string max-len] [
    acc: 0
    result: []
    foreach word (split string #" ") [
        either acc >= max-len [
            append append result "^/ " word
            acc: length? word
        ] [
            append append result #" " word
            acc: acc + length? word
        ]
    ]
    return trim/head to-string result
]

url: https://api.forismatic.com/api/1.0/?method=getQuote&format=text&lang=en

text: split read url #"("                ;-- Split string by "("
insert trim/lines text/1 {"^[[94m^[[1m}  ;-- Prepend " + color and trim excess whitespaces
insert tail text/1 {^[[0m"}              ;-- Append " + reset color
either text/2 [
    quote-text: text/1                   ;-- First element of a block
    quote-author: append "^[[93m" text/2 ;-- Second element of a block
    clear find quote-author #")"         ;-- Removes parentheses
    print wrap quote-text 40
    print [quote-author "^[[0m"]
] [
    quote-text: text/1
    print wrap quote-text 40
]