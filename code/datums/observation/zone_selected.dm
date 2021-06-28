//	Observer Pattern Implementation: Zone Selected
//		Registration type: /atom/movable/screen/zone_sel
//
//		Raised when: A /atom/movable/screen/zone_sel had its selected zone modified.
//
//		Arguments that the called proc should expect:
//			/atom/movable/screen/zone_sel: the
//			old_zone: the previously selected zone
//          new_zone: the newly selected zone
//

/decl/observ/zone_selected
	name = "Zone Selected"
	expected_type = /atom/movable/screen/zone_sel

/*******************
* Zone Selected Handling *
*******************/

/atom/movable/screen/zone_sel/set_selected_zone(bodypart)
	var/old_selecting = selecting
	if((. = ..()))
		events_repository.raise_event(/decl/observ/zone_selected, src, old_selecting, selecting)