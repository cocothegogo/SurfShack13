#define FALLOUT_ARCADE_URL "https://fallout-nevada.ru/#/Fallout_Sonora_1_14_dlc_eng"

/// Arcade cabinet that opens a browser popup running Fallout: Sonora in an embedded frame.
/obj/machinery/computer/arcade/fallout
	name = "Fallout: Sonora"
	desc = "A rugged arcade cabinet covered in wasteland grime. A faded Vault Boy gives you a thumbs up from the marquee."
	icon_state = "arcade"
	icon_screen = "invaders"
	light_color = LIGHT_COLOR_ORANGE
	circuit = /obj/item/circuitboard/computer/arcade/fallout
	/// the complete html for the game window, loaded once.
	var/static/game_html

/obj/machinery/computer/arcade/fallout/examine(mob/user)
	. = ..()
	. += span_notice("If the game doesn't load on the screen, there's a button to open it in your own browser.")

/obj/machinery/computer/arcade/fallout/ui_interact(mob/user)
	if(!is_operational)
		return
	if(!game_html)
		game_html = file2text('surfshack13/frogui/fallout_arcade.html')
	playsound(src, 'sound/machines/terminal/terminal_on.ogg', 25, FALSE)
	SSfrogui.open_ui(user, src, game_html, "size=1100x850;can_resize=1;")

/obj/machinery/computer/arcade/fallout/frog_ui_topic(datum/source, mob/user, list/href_list)
	. = ..()
	if(href_list["open_external"])
		user << link(FALLOUT_ARCADE_URL)

/obj/machinery/computer/arcade/fallout/on_set_is_operational(old_value)
	. = ..()
	if(!is_operational)
		close_game_windows()

/obj/machinery/computer/arcade/fallout/Destroy()
	close_game_windows()
	return ..()

/// Closes the game window for everyone currently playing.
/obj/machinery/computer/arcade/fallout/proc/close_game_windows()
	var/list/players = SSfrogui.atom_ui_clients[src]
	for(var/client/player as anything in players?.Copy())
		if(player?.mob)
			SSfrogui.close_ui(player.mob, src)

#undef FALLOUT_ARCADE_URL
