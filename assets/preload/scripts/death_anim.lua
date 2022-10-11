function onCreatePost()
	if getProperty('boyfriend.curCharacter') == 'dstankman' then
		
	setPropertyFromClass('GameOverSubstate', 'characterName', 'dstankman-die');
	end
end