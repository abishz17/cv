#import "german-cv.typ": *

#let cvdata = yaml("template.yml")

#let uservars = (
    headingfont: "Libertinus Serif",
    bodyfont: "Libertinus Serif",
    fontsize: 10pt,
    linespacing: 5pt,
    sectionspacing: 0pt,
    showAddress: true,
    showNumber: true,
    showTitle: true,
    headingsmallcaps: true,
)

#let customrules(doc) = {
    set page(
        paper: "a4",
        margin: 2cm,
    )
    doc
}

#let cvinit(doc) = {
    doc = setrules(uservars, doc)
    doc = showrules(uservars, doc)
    doc = customrules(doc)
    doc
}

#let germancvfooter(uservars) = {
  place(bottom + right)[
    #v(0.8cm)
    #line(length: 4cm, stroke: 0.5pt + black) \
    #text(size: 8pt)[Place, Date / Unterschrift]
  ]
}

#show: doc => cvinit(doc)

#cvheading(cvdata, uservars)
#cveducation(cvdata)
#cvwork(cvdata)
#cvskills(cvdata)
#cvcertificates(cvdata)
#cvpublications(cvdata)
#cvreferences(cvdata)
#germancvfooter(uservars)
