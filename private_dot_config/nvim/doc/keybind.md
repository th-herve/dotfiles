# (custom) keybinds

leader or ld = space

## in general

| key    | action                |
|--------|-----------------------|
| ld+t   | open terminal         |
| ld+v   | split screen          |
| ld+e   | move focus            |
| ld+b   | open file explorer    |
| M-h/l  | next/previous buffer  |
| ld+s   | save file             |
| ld+q   | save and close buffer |
| ld+o   | toggle spell check    |
| ld+z   | toggle zen mode       |
| ld+cc  | clear the search      |
| C+j/k  | move line down/up     |
| ld+l   | buffer selection      |
| ld+;   | add ; in normal mode  |
| ld+ff  | fuzzy finder          |
| ld+wv  | open init.vim         |
| C-a/x  | increment/decrement   |
| #      | search cursor word    |
| ld+cl  | toggle colorize       |
| ,-,    | trigger emmet         |

## terminal 

| key       | action           |
|-----------|------------------|
| ld+esc    | quit insert mode |
| ld+esc x2 | quit terminal    |

## navigation

| key     | action                    |
|---------|---------------------------|
| Alt+j/k | scroll down/up            |
| C-d/u   | scrool more               |
| C-o/i   | go nex/previous jump      |
| g-;/,   | go older/newer change pos |

## command 

| key              | action                                       |
|------------------|----------------------------------------------|
| :s/old/new/g     | replace in line                              |
| :%s/old/new/g    | replace in all doc (add c to confirm)        |
| :5,10s/old/new/g | replace from line 5 to 10 (inclusive)        |
| /text            | search for text                              |

> add bufdo to apply to all buffer

## spell check 

| key     | action               |
|---------|----------------------|
| [s , ]s | previous/next word   |
| z=      | show word suggestion |


## surround

| key   | action               |
|-------|----------------------|
| ds"   | delete               |
| cs"'  | replace              |
| ysiw) | surround word        |
| yss)  | surround line        |
| S'    | in visual mode       |
| yww   | surround word with " |

> work with ) } ] ' " htmltag
> can use b or B for ) }

## comment

| key | action                |
|-----|-----------------------|
| gcc | comment out line      |
| gc  | comment out selection |

## Mark

You can mark position in nvim and jump back to it.  
Lower case (char) mark, are specific to each file, upper case are global and work in different file.

| key              | action                |
|------------------|-----------------------|
| m + (char)       | mark the position     |
| ' + (char)       | go to the marked line |
| :marks           | list the mark         |
| :delmarks (char) | delete mark           |

## Telescope fuzzy finder

| key   | action        |
|-------|---------------|
| ld+ff | find files    |
| ld=fg | live grep     |
| ld+fb | find buffer   |
| ld+fh | help tag      |
| C-n/p | next/previous |
| C-c   | close         |

## Fold

| key  | action             |
|------|--------------------|
| zf   | create a fold      |
| zj/k | next/previous fold |
| za   | toggle fold        |
| zo/c | open/close fold    |
| zM   | close all fold     |
| zR   | reveal all fold    |
| zd   | delete fold        |
| ze   | delete all fold    |
| [/]z | start/end of fold  |
:mkview :loadview

## Harpoon

| key  | action       |
|------|--------------|
| C-h  | Toggle menu  |
| C-p  | Harpoon file |
| ld+j | file1        |
| ld+k | file2        |
| ld+l | file3        |
