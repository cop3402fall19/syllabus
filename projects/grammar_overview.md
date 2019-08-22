## Grammar Specification Syntax

A language can be thought of as the (possibly infinite) set of all possible strings in the language, where strings are finite sequences of characters from a finite alphabet.  For a programming lanugage, all valid programs are the language, and the ASCII characters are the finite alphabet.

While a language can have an infinite set of possible strings, a _grammar_ is a finite representation of this infinite set.  It provides a set of symbol replacement rules that define the syntax of the language, i.e., the set of well-formed strings of a language.

A grammar consists of terminals, nonterminals, productions, and a starting symbol.

### Terminals

The indivisble elements of the language, e.g., numbers and semicolons for programming languages.  Utterances of the language will only contain the terminals.  For instance, English words are the terminals of the English language.  In our specifications below, terminals are always in uppercase, e.g., `DIGIT` or `SEMI`.  See our lexical specification below for the terminals of our language.

(Note: strictly speaking the terminals of our language are the actual digits, e.g., 0 or 1, the semicolon symbol itself, etc.  But for performance reasons, compilers typtically use an initial lexical phase that converts groups of characters, or lexemes, into tokens.  These tokens are the terminals of our grammar.)

### Nonterminals

Nonterminals are the syntactic units of a language.  In English, a sentence or a noun phrase is a nonterminal.  In our programming language, the expression nonterminal represents possible valid integer expressions, the statement nonterminal represents all valid statements, and so on.  The nonterminals of our language are always lowercase, e.g., `program` or `expression`.

### Productions

Productions are rules that map a nonterminal symbol to a list of other nonterminals or terminals.  For instance, in English, a noun phrase nonterminal may map to a "the" terminal followed by a modifier nonterminal and a noun terminal.  The production rule shows how parts of a sentence are broken down into all possible legal sentences in the language.  Productions look like

    program
      = statement*
      
The left hand side, i.e., `program`, is the nonterminal, the `=` means it is a production, and the right-hand side contains the symbols replacing the nonterminal.  In this case, it is a list of 0 or more `statement` productions.  A the left-hand side of a production can be empty, which is denoted by an epsilon character.  Our specification does not use this notation, but a production can still be empty due to the `statement*` notation.

(Note: we will use context-free grammars only, in which the left-hand-side of a production is always a single nonterminal.  More expressive grammars may have more than one symbol on the left-hand-side.)

### The Starting Symbol

The concept of a grammar specification for a language is related to Chomsky's generative grammars, a theory about how humans generate well-formed sentences from a language.  A quick-and-dirty explanation is that mind begins with top-level symbol of the grammar and follows the grammar by replacing nonterminal symbols using the production rules until only the terminals, or words, of the language are left and uttered.  The starting symbol is the top-level symbol that represents all possible utterances, or strings, of the language.  This scheme is one explanation for how a representation of language in finite amount of memory can produce an potentially infinite set of different utterances.  It is closely related to finite state machines and computational theory, and there is a [correspond](https://en.wikipedia.org/wiki/Chomsky_hierarchy#The_hierarchy) from the hierarachy of language type to the type of automaton, or finite machine.

For our projects, the starting symbol is always called `program`.


## Syntax of the Grammar Specifications

- `=` is a production as described above, e.g., `program = statement*` means that the `program` symbol is substituted by a list of 0 or more `statement` symbols
- `|` is an alternative, i.e., one, but not both, of the productions applies, e.g., `expression = integer PLUS integer | integer TIMES integer` means either addition or multiplication applies
- `*` is 0 or more repetitions, e.g., `statement*` means there may be 0 or more `statement` nonterminals
- `(` ... `)` groups symbols in order to use `*` on multiple symbols, e.g., `(COMMA expression)*` means 0 or more instances of COMMA followed by an expression
