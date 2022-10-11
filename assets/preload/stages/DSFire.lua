local xx = 2450;
local yy = 2050;
local xx2 = 2450;
local yy2 = 2450;
local xx3 = 2550;
local yy3 = 2460;
local ofs = 30;
local ofs2 = 60;
local followchars = true;
local del = 0;
local del2 = 0;
frames = 0

function onCreate()
	setProperty('gfGroup.alpha', 0);
	setPropertyFromClass('GameOverSubstate', 'characterName', 'dsbf-die');

	makeLuaSprite('back', 'Back_Box_BG_Fire', 1000, 1800)
	makeLuaSprite('gfhop', 'gfhop', 1500, 1800)
	makeAnimatedLuaSprite('smoke1', 'smoke', 1250, 1800)
	addAnimationByPrefix('smoke1', 'smoke1', 'smoke1', 24, true)
	makeAnimatedLuaSprite('smoke2', 'smoke2', 2450, 1800)
	addAnimationByPrefix('smoke2', 'smoke2', 'smoke2', 24, true)
	makeLuaSprite('front', 'Top_Brick_Wall_BG', 1500, 1800)

	setScrollFactor('back', 0.7, 1)
	setScrollFactor('smoke1', 0.8, 1)
	setScrollFactor('smoke2', 0.9, 1)

	scaleObject('gfhop', 0.4, 0.4);

	addLuaSprite('back', false)
	addLuaSprite('gfhop', false)
	addLuaSprite('smoke1', false)
	addLuaSprite('smoke2', false)
	addLuaSprite('front', false);	
    setProperty('gfhop.flipX', true);

end

function onCountdownStarted()
    for i = 0, getProperty("unspawnNotes.length") do
    	if not getPropertyFromGroup("unspawnNotes", i, "mustPress") then
        	setPropertyFromGroup("unspawnNotes", i, "visible", false);
    	end
    end

    for i = 0, 3 do
        setPropertyFromGroup("opponentStrums", i, "visible", false);
    end
end

function onUpdate(elapsed)
	frames = frames + 1
	laps = elapsed/0.016 --thank allah for bbpanzu
	t = math.sin(frames/5)*34
	tt = math.sin((frames+50)/150)*1024
	setProperty('gfhop.y',t+2200)
	setProperty('gfhop.x',tt+2200)
	if getProperty('gfhop.x') <= getCharacterX('dad') then
		setProperty('gfhop.flipX', true)
	elseif getProperty('gfhop.x') >= getCharacterX('bf') + 200 then
		setProperty('gfhop.flipX', false)
	end



	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
	-- "if curStep < 199992 then" ?? ? ? who the FUCK wrote this???
if curStep < 199992 then
       if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
		else
		    if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx3-ofs2,yy3)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx3+ofs2,yy3)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx3,yy3-ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx3,yy3+ofs2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx3,yy3)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
end
