/obj/item/psychic_power/arc_welder
	name = "energistic arc welder"
	icon_state = "psi_arc"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	force = 1

/obj/item/psychic_power/Destroy()
	to_chat(owner, "<span class='notice'>You stop projecting a small electrical arc from your hand.</span>")
	owner.visible_message("<b>[owner]</b> stops projecting a small electrical arc from \his hand.", \
	"<b>[owner]</b> stops projecting a small electrical arc from \his hand.")
	..()

/obj/item/psychic_power/arc_welder/attack(mob/living/target, mob/living/user, target_zone)
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		var/obj/item/organ/external/S = M.organs_by_name[target_zone]

		if(!S || !BP_IS_ROBOTIC(S) || user.a_intent != I_HELP)
			if(target == user)
				return attack_self(user)

		if(BP_IS_BRITTLE(S))
			to_chat(user, SPAN_WARNING("\The [M]'s [S.name] is hard and brittle - \the [src] cannot repair it."))
			return

		S.robo_repair(10, BRUTE, "some dents", src, user)
		return

	else return

/obj/item/psychic_power/arc_welder/afterattack(var/obj/O, var/mob/user, proximity)
	if(!proximity)
		return ..()

	var/turf/location = get_turf(user)
	if(isliving(O))
		var/mob/living/L = O
		L.IgniteMob()
	else if(istype(O))
		O.HandleObjectHeating(src, user, 700)
	if(istype(location, /turf))
		location.hotspot_expose(700, 50, 1)

	return ..()

/obj/item/psychic_power/arc_welder/dropped()
	..()
	qdel(src)