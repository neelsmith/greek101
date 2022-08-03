using Pkg
Pkg.activate(".")
Pkg.instantiate()
using CourseCalendar

calfile = joinpath(pwd(), "F22", "calendar1.toml")
topics = joinpath(pwd(), "F22", "topics1.txt")
sched = courseSchedule(calfile, topics)

md = mdcalendar(sched)

hdg = """---
title: "Course schedule: Greek 101, section 1, F22"
layout: page
nav_order: 1
---

"""

open(joinpath(pwd(), "docs", "schedule", "index.md"), "w") do io
    write(io, hdg * md)
end