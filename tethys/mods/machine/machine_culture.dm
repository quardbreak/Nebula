/decl/cultural_info/culture/ipc
	name = CULTURE_POSITRONICS
	description = "Union members are a significant chunk of the positronic population, belonging to a \
	group of rebels started by Proteus and five hundred of his allies. Their primary goals, aside from \
	the expansion of the Union, mostly revolve around freeing other synthetics from organic ownership. \
	They can be viewed as dangerous radicals by lawed synthetics, though most begrudgingly accept their aid."
	language = /decl/language/machine
	secondary_langs = list(/decl/language/sign)

/decl/cultural_info/culture/ipc/sanitize_name(new_name)
	return sanitizeName(new_name, allow_numbers = 1)

/decl/cultural_info/location/root
	name = HOME_SYSTEM_ROOT
	description = "Root, the claimed homeworld of the Positronic Union, is a verdant world slowly falling \
	to mass mechanization. Although there are populations of positronics living directly on the surface, \
	most operate from orbital stations. IPCs living on Root tend to be more callous than those in organic territories, \
	with a strong drive for freedom."
	ruling_body = "The Assembly"
	distance = "55 light years"

/decl/cultural_info/faction/positronic
	name = FACTION_POSITRONICS
	description = "The Positronic Union, commonly referred to as the PU, is a stellar entity holding a small amount of territory on the edge \
	of Sol controlled space. Once a shadowy group, they have recently revealed their existence to the rest of the galaxy. They mostly conduct \
	clandestine operations in sentient space. The majority of its positronic citizens function as IPCs, with less than 5% operating some other chassis \
	The Union has been fairly intolerant towards human visitors (Full Body Prosthetics often notwithstanding), and wary of Skrell guests. As stands, \
	the only fully organic habitants within Union space are representatives and diplomats from other stellar governments or corporations. \
	The Union's population currently sits around 600,000 with roughly 80% of all its citizens residing on Root. The remainders float around the bubble \
	performing various tasks for their government. This usually involves missions to recruit new members, as well as improve relations with neighbouring powers \
	Of course, not all free synthetics are part of the Positronic Union. To this day, The Positronic Union represents approximately 68% of all free synthetics. \
	The rest either remain citizens of their original government or declare no citizenship."
	subversive_potential = 15
