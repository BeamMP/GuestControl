RegisterEvent("onPlayerAuth","onPlayerAuth")

function onPlayerAuth(name, role, isGuest)
	if isGuest then
		return "You must be signed in to join this server!"
	end
end