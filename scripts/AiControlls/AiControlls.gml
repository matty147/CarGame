function AiControlls(X, Y, CurentBoxVal,spd){
//show_debug_message("Ai");
//var foundInstance = noone;
SearchForId = true
if spd <= 5
{
spd += 0.01;
}
if SearchForId
{
	for (var i = 0; i < instance_number(Obj_Ai_Goto_Box); i++) {
	    var instance = instance_find(Obj_Ai_Goto_Box, i);
	    if (instance.BoxNumber == CurentBoxVal){
	        foundInstance = instance;
			//show_debug_message("FoundId:" + string(SearchForId));
	        break;
	    }
	}
}
if !place_meeting(X,Y,Obj_Ground)
{
spd = 0.3;	
}

if place_meeting(X, Y, foundInstance)
{
	CurentBoxVal++;
	show_debug_message("Checkpoint reached");
}
return [spd, foundInstance, CurentBoxVal];
}