/datum/design/board/announceconsole
	name = "Announcements Board"
	desc = "Allows for the construction of circuit boards used to build a public announcements console."
	id = "announceconsole"
	build_path = /obj/item/circuitboard/computer/public_announcement
	category = list(
		RND_CATEGORY_COMPUTER
	)

/datum/design/board/arcade_fallout
	name = "Fallout: Sonora Arcade Machine Board"
	desc = "Allows for the construction of circuit boards used to build a Fallout: Sonora arcade machine."
	id = "arcade_fallout"
	build_path = /obj/item/circuitboard/computer/arcade/fallout
	category = list(
		RND_CATEGORY_COMPUTER + RND_SUBCATEGORY_COMPUTER_ENTERTAINMENT
	)
	departmental_flags = DEPARTMENT_BITFLAG_SERVICE
