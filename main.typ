// Layout comes from basic-resume; this file only turns cv.yml into its calls.
//   typst compile main.typ Abish_Bhusal_Resume.pdf
#import "@preview/basic-resume:0.2.9": *

#let d = yaml("cv.yml")
#let p = d.personal

// "2025-10" -> "Oct 2025"
#let month(s) = {
  let s = str(s)
  if s == "present" { return "Present" }
  datetime(year: int(s.slice(0, 4)), month: int(s.slice(5, 7)), day: 1)
    .display("[month repr:short] [year]")
}
#let range(x) = month(x.start) + " – " + month(x.end)

#show: resume.with(
  author: p.name,
  location: p.location,
  email: p.email,
  github: p.github,
  linkedin: p.linkedin,
  personal-site: p.site,
  paper: "a4",
)
// Hyphenated words ("synchro-nization") break keyword matching in ATS parsers.
#set text(hyphenate: false)

== Summary
#d.summary

== Experience
#for w in d.work {
  work(title: w.title, company: w.company, location: w.location, dates: range(w))
  list(..w.highlights)
}

== Skills
#for s in d.skills [
  *#s.category:* #s.items.join(", ") \
]

== Education
#for e in d.education {
  edu(institution: e.institution, degree: e.degree, location: e.location,
      dates: range(e), consistent: true)
  list(..e.highlights.map(h => if type(h) == str { h } else [
    #h.text #link(h.url)[(#h.urltext)]
  ]))
}
