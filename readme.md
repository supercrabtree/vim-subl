# subl.vim

A simple plugin that opens your current buffer(s) in sublime text.

This plugin consists of one command `:Subl` which will open your current buffer
in sublime text trying to guess your project directory first by looking for a
git directory up the tree, otherwise defaulting to the containing folder of the
current file. There is also a bang option `:Subl!` which will do the same, but
for *all* current buffers.
