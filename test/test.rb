require_relative '../lib/wiki-this'

header = "=== This is a header ===\n<code></code>\n== This is another header ==\n<nowiki></nowiki>\n= this is a title ="

links = "[[Audio:thing.png|thing]]\n [[Video:thing.png|thing]]\n [[Image:thing.png|thing]]\n [[P14452:thing.png|thing]]\n [[P14452:thing.png]]\n [[thing.png|thing]]\n [[thing.png]]\n [thing.png]\n [thing.png|thing]\n"

lists = "* thing 1\n# number 1\n** thing 2\n"

def_lists = "; definitions\n; def 1\n: a thing\n; def 2\n: a thing 2\n"

formatted = "''italic'' '''bold''' ''''bold as well'''' '''''bold and italic'''''"

table = "{| class='wikitable'\n|+ caption thing\n|-\n! header 1\n! header 2\n! header 3\n|-\n| row 1, cell 1\n| row 1, cell 2\n| row 1, cell 3\n|-\n| row 2, cell 1\n| row 2, cell 2\n| row 2, cell 3\n|}\n"

superTable = "== About Me ==

{| class='wikitable'
|-
! scope='row'| Name
| Bryan T. Meyers
|-
! scope='row'| BS (Finish Spring 2013-3)
| BS in Computer Engineering at Rochester Institute of Technology
|-
! scope='row'| MS (Start Fall 2014-1)
| MS in Computer Engineering at Rochester Institute of Technology
|}

=== Current Research Areas ===

* Distributed Systems
* Cloud Computing
* Web Accessibility
* High Performance Computing

== Table of Contents ==

{| class='wikitable'
! Literature Review
! Master's Thesis Proposal
! Master's Thesis
! Papers Published
! Undergraduate Research
|-
|[[BryanMeyers: private/LiteratureReview/ReadingLists | Reading Lists ]]

'''Categories'''

* [[BryanMeyers: private/LiteratureReview/DistributedSystems| Distributed Systems ]]
* [[BryanMeyers: private/LiteratureReview/ProductDevelopment | Product Development ]]
* [[BryanMeyers: private/LiteratureReview/WebAccessibility| Web Accessibility ]]

|

[[Meeting Notes]]
[[Proposal]]
|
|
|

|}




----

[[BryanMeyers:private/Home|Go to the private Home page of this project]] |
[[BryanMeyers:public/Home|Go to the public Home page of this project]]"

superTable2 = "== Overview ==
    {| class='wikitable'
|-
! scope='row' | Title
| The Preliminary Construction of Accessibility Design Guidelines of Learning Website for Old People
                                                                                        |-
                                                                                        ! scope='row' | Author 1
                                                                                        | Zhenxiang Sun
                                                                                        |-
                                                                                        ! scope='row' | Author 2
                                                                                        | Yang Zhao
                                                                                        |-
                                                                                        ! scope='row' | Print Year
                                                                                        | 2010
                                                                                        |-
                                                                                        ! scope='row' | Link to Bibtex
                                                                                        | [[IEEE5460244.bib | Here ]]
                                                                                        |}

                                                                                        === Abstract ===

                                                                                            With improvement and development of network education, old people in expanding number take part in e_learning, then accessibility design and development of learning website for old people causes concern. website accessibility design guidelines are of significant importance in accessibility design and development of learning website for old people. Based on foreign accessibility guidelines of website for old people, this article explores the relationship between physical and cognitive characteristics of old people and learning website accessibility design for old people. Combined with a series of W3C web accessibility design guidelines, this paper proposes an preliminary accessibility design guidelines of learning website for old people, and it provides a reference and guide during learning website design and development in the future.

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       == Personal Review (500 words or less) ==

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           == Notes ==
"


#ap header
#ap parse( header )

#ap links
#ap parse( links )

ap lists
ap WikiThis.parse( lists)

ap def_lists
ap WikiThis.parse( def_lists)

#ap formatted
#ap parse( formatted )

#ap table
#ap parse( table )

superTable3 = "== About Me ==\n\n{| class=\"wikitable\"\n|-\n! scope=\"row\"| Name\n| Bryan T. Meyers\n|-\n! scope=\"row\"| BS (Finish Spring 2013-3)\n| BS in Computer Engineering at Rochester Institute of Technology\n|-\n! scope=\"row\"| MS (Start Fall 2014-1)\n| MS in Computer Engineering at Rochester Institute of Technology\n|}\n\n=== Current Research Areas ===\n\n* Distributed Systems\n* Cloud Computing\n* Web Accessibility\n* High Performance Computing\n\n== Table of Contents ==\n\n{| class=\"wikitable\"\n! Literature Review\n! Master's Thesis Proposal\n! Master's Thesis\n! Papers Published\n! Undergraduate Research  \n|-\n|[[BryanMeyers: private/LiteratureReview/ReadingLists | Reading Lists ]]\n\n'''Categories'''\n\n* [[BryanMeyers: private/LiteratureReview/DistributedSystems| Distributed Systems ]]\n* [[BryanMeyers: private/LiteratureReview/ProductDevelopment | Product Development ]]\n* [[BryanMeyers: private/LiteratureReview/WebAccessibility| Web Accessibility ]]\n\n|\n\n[[Meeting Notes]]\n[[Proposal]]\n|\n|\n|\n \n|}\n\n\n\n\n----\n\n[[BryanMeyers:private/Home|Go to the private Home page of this project]] | \n[[BryanMeyers:public/Home|Go to the public Home page of this project]]\n"

ap superTable3
puts WikiThis.parse(superTable3)