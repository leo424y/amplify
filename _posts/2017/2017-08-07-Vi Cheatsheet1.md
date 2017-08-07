---
layout: post
comments: true
title: Vi Cheatsheet
---


# quitting

:x Exit, saving chages
:q Exit as long as there have been no chages
ZZ Exit and save chages if any have been made
:q! Exit and ignore any chages


# inserting text

i/I Insert before cursor/line
a/A Append after cursor/line
o/O Open a new line after/before current line
r/R Replace one/many characters


# motion

h/j/k/l Left/Down/Up/Right

w/W|b/B|e/E To next word | beginning|end of the word/blank delimited word
(){} To a sentence/paragraph back/forward
0/$ To the begining/end of the line
% To associated (), [], {}
nG/G/:n Move to n line of the file
fc/Fc Go forword/back to 'c'
H/M/L To top/middle/botton of screen

# deleting/yanking/changing/putting text
x/X Delete character to the right/left of cursor
d Delete to the end of the line
dd/:d Delete current line
yy/:y Yank current line
cc/C Change the whole line/change to the end of line

# markers
mc Set marker 'c' on this line.
`c/'c Go to Endding/First non-blank of marker 'c' line.

# search for strings
/string | ?string Search forward|back for string
n/N Search for next/previous instance of string

# replace
:s/pattern/replace/flags(g/c all/confirm)
& Repeat last :s

# ranges
:n,m Lines n-m
:. Current line
:'c Marker c
:%|:g/pattern All lines in file|that contain pattern

# files
:w/:r/:e file  Write to file/Read file in after line/Edit file
:n/:p Go to next/previous file
!!program Replace line with output from 'program'

# other
~ Toggle up and lower case
J Join lines
. Repeat last text-chaging command
u/U Undo last change/all changes to line
