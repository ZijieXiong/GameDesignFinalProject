event_inherited();
trackShooterSpeed = 1;
attack_cooldown = 0;
trackerShooterLives = 3;

self.image_xscale = 0.7;
self.image_yscale = 0.7;

_health = 50 + global.currLevel * 10;

dm = instance_find(oDungeon, 0);

