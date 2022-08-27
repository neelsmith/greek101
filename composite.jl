#=
Compile a single composite markdown file from a root directory
of markdown files with headers following the conventions of
the JustTheDocs jekyll theme.

Usage:

    julia composite.jl SRCDIR] [OUTFILE]
=#

srcdir = length(ARGS) > 1 ? ARGS[2] : "docs/syllabus"
outfile = length(ARGS) > 2 ? ARGS[3] : "printable/syllabus.md"

using Pkg
Pkg.add("UnifyJustTheDocs")
using UnifyJustTheDocs

# Could set styled title here?
##hdrlines = ["---", "title: \"Greek 101, section1, F22: Syllabus\"", "---", ""]
hdrlines = readlines("printable/syllabus-settings.yaml")
hdr = join(hdrlines,"\n")

# Create single markdown file
docsmd = composite(srcdir)
md = hdr * replace(docsmd, "`" => "")
# Another LaText gotcha:
tidier = replace(md, "-*" => "*")

# Write to disk
open(outfile,"w") do io
    write(io, tidier)
end


