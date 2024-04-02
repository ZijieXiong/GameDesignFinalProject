/// @description Insert description here
// You can write your code in this editor
function applyUpgrade()
{
	global.revive += 1;
	show_debug_message("Upgrade applied: Revive");
}

function createUI(_x, _y)
{
	var ui = instance_create_layer(_x, _y, "UI_Layer", obj_upgrade_UI);
	ui.parentUpgrade = id;
    ui.upgradeDescription = "Revive chance +1";
	show_debug_message("revive ui created");
}