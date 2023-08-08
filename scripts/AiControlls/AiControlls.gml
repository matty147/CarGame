function AiControlls(X, Y, CurentBoxVal){
//show_debug_message("Ai");
SearchForId = true;
spd = 3;
var foundInstance = noone;
if SearchForId
{
	for (var i = 0; i < instance_number(Obj_Ai_Goto_Box); i++) {
	    var instance = instance_find(Obj_Ai_Goto_Box, i);
	    if (instance.BoxNumber == CurentBoxVal){
	        foundInstance = instance;
			//show_debug_message("FoundId:" + string(SearchForId));
	        break; // Exit the loop once the instance is found
	    }
	}
}
if place_meeting(X, Y, foundInstance)
{
	CurentBoxVal++;
	show_debug_message("Checkpoint reached");
}
return [spd, foundInstance, CurentBoxVal];
}