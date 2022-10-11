function onCreate()
    	setProperty('explode.alpha',0)

	makeLuaSprite('card', 'nothing', -400, 250);
	setObjectCamera('card', 'hud');
	addLuaSprite('card');
	scaleObject('card', 0.7, 0.7);

	makeLuaText('songname', 'Song: Alliance', '500', -462, 262);
	setTextSize('songname', 24);
	setObjectCamera('songname', 'hud');
	setTextColor('songname', 'A4A4A4');
	setTextFont('songname', 'stratum2-medium-webfont.ttf');
	setTextBorder('songname', '0','A4A4A4');
	setObjectOrder('songname', 98);
	addLuaText('songname');

	makeLuaText('desc', 'Song by: Speedz', '500', -517, 320);
	setTextSize('desc', 24);
	setObjectCamera('desc', 'hud');
	setTextColor('desc', 'A4A4A4');
	setTextFont('desc', 'stratum2-medium-webfont.ttf');
	setTextBorder('desc', '0','A4A4A4');
	setObjectOrder('desc', 99);
	addLuaText('desc');

	makeLuaSprite('bartop','',0, -30);
	makeGraphic('bartop',1280,100,'000000');
	addLuaSprite('bartop', false);
	setObjectCamera('bartop','hud');
	setScrollFactor('bartop',0,0);

	makeLuaSprite('barbot','',0,650);
	makeGraphic('barbot',1280,100,'000000');
	addLuaSprite('barbot', false);
	setScrollFactor('barbot',0,0);
	setObjectCamera('barbot','hud');
end

function onCreatePost()
	setProperty("gfhop.alpha", 0);
end

function onCountdownTick(counter)
	if counter == 0 then
		doTweenX('card','card', '0', 1, 'expoInOut')
		doTweenX('name','songname', '-102', 1, 'expoInOut')
		doTweenX('line1','desc', '-137', 1, 'expoInOut')
		runTimer('cardback', 4)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'cardback' then
		doTweenX('dawg','card', '-400', 1, 'expoInOut')
		doTweenX('andnamowashisnamo','songname', '-462', 1, 'expoInOut')
		doTweenX('lineo1','desc', '-517', 1, 'expoInOut')
	end
end

function onTweenCompleted(tag)
	if tag == 'dawg' then
		removeLuaSprite('dawg', true);
		removeLuaText('desc', true);
		removeLuaText('songname', true);
	end
end