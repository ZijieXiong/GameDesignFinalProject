/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	var shotgun = instance_find(obj_shotgun, 0);
	shotgun.shotgun_bulletcount += 1;
	show_debug_message("Upgrade applied: Shotgun Bullet Count");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "+1 bullet";
	show_debug_message("shotgun range ui created");
}