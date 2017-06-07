//The base clockwork item. Can have an alternate desc and will show up in the list of clockwork objects.
/obj/item/clockwork
	name = "meme blaster"
	desc = "What the fuck is this? It looks kinda like a frog."
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/clockwork_desc = "A fabled artifact from beyond the stars. Contains concentrated meme essence." //Shown to clockwork cultists instead of the normal description
	icon = 'icons/obj/clockwork_objects.dmi'
	icon_state = "rare_pepe"
	w_class = WEIGHT_CLASS_SMALL
	origin_tech = "materials=20;engineering=20;plasmatech=20;powerstorage=20;bluespace=20;biotech=20;combat=20;magnets=20;syndicate=20;programming=20;syndicate=10"

/obj/item/clockwork/New()
	..()
	ratvar_act()
	all_clockwork_objects += src

/obj/item/clockwork/Destroy()
	all_clockwork_objects -= src
	return ..()

/obj/item/clockwork/examine(mob/user)
	if((is_servant_of_ratvar(user) || isobserver(user)) && clockwork_desc)
		desc = clockwork_desc
	..()
	desc = initial(desc)
