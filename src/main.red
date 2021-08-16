Red [
    title: "ᠮᡠᡵᠰᠠ"
    version: 0.1.1
    description: {
        Random quote fetching console utility.
    }
    author: "Llathasa Veleth"
    mail: llathasa@outlook.com
    url: https://github.com/q60/mursa
]

wrap: func [string max-len] [
    acc: 0
    result: copy ""
    foreach word (split string #" ") [
        either acc >= max-len [
            append append result "^/ " word
            acc: length? word
        ] [
            append append result #" " word
            acc: acc + length? word
        ]
    ]
    trim/head result
]

url: https://api.forismatic.com/api/1.0/?method=getQuote&format=text&lang=en

text: split read url #"("     ;-- Split string by "("
quote-text: trim/lines text/1 ;-- Trim excess whitespaces
quote-author: text/2

print rejoin [
    {"^[[94m^[[1m}                      ;-- Bold bright blue
    wrap quote-text 40
    {^[[0m"}
]

if quote-author [
    print rejoin [
        "^[[93m"                        ;-- Bright yellow
        trim/all/with quote-author #")" ;-- Removes parentheses
        "^[[0m"
    ]
]