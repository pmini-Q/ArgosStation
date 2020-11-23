
/obj/item/psychic_power/arc_welder
	name = "energistic arc welder"
	icon_state = "psi_arc"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	force = 2.5
	damtype = BURN
	maintain_cost = 2

/obj/item/psychic_power/arc_welder/iswelder()
	return TRUE

/obj/item/psychic_power/arc_welder/Destroy()
	to_chat(owner, "<span class='notice'>You stop projecting a small electrical arc from your hand.</span>")
	owner.visible_message("<b>\The [owner]</b> stops projecting a small electrical arc from \his hand.")
	..()

/obj/item/psychic_power/arc_welder/attack(var/mob/living/target, var/mob/living/user, var/target_zone)
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
		remove_fuel(0, user)
		return

	else return

/obj/item/psychic_power/arc_welder/afterattack(var/obj/O, var/mob/user, var/proximity)
	if(!proximity)
		return ..()

	if(ishuman(O))
		if(O == user)
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

/obj/item/psychic_power/arc_welder/proc/remove_fuel(var/amount, var/mob/M = null)
	if(M)
		M.welding_eyecheck()//located in mob_helpers.dm
		set_light(0.7, 2, 5, l_color = COLOR_LIGHT_CYAN)
		addtimer(CALLBACK(src, /atom/proc/update_icon), 5)
	return TRUE

/obj/item/psychic_power/arc_welder/dropped()
	..()
	qdel(src)