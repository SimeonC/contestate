<cfset struct = {test: { subTest: { Minority: 3}}}>
<cfdump var="#struct#"/>
<cfdump var="#struct["test[subTest[Minority]]"]#"/>