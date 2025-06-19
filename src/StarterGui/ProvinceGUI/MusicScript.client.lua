local old_music_list = {1842241530,1842275120,1848063745,12397858013,1837474332,1847223170,9040382962,1847795501,9043838315,1847093532,1848358282,1837231920,9043213762,1847146076,1838095614,1842262405,1835519286,1837808904,1847223146,1847112501,1847223500,1836377639,1844292809,1840182901,1847091695,1839900676,9045862243,9045862512,1840154523}
local music_list = {1}
local volume = .7
local UI = game.Players.LocalPlayer.PlayerGui:FindFirstChild("ProvinceGUI").TopFrame
local button = UI.MusicButton
local RE = game.ReplicatedStorage.SpecificSongPlay
local rs = game:GetService("ReplicatedStorage")
local pos = math.random(1,#music_list)
local sound = Instance.new("Sound",workspace)
sound.Volume = volume
local paused = sound.Playing

local function pos()
	math.random(1,#music_list)
end


local function playmusic()
	
	if game.Players.LocalPlayer.Team.Name ~= "Choosing" then
		
		sound.SoundId = "rbxassetid://"..music_list[pos]
	math.random(1,#music_list)
	sound.Loaded:Connect(function(success) 
		if success then
				wait(1)
			
			sound:Play()
				
			local id = tonumber(music_list[pos],10)

			local SongName = game:GetService("MarketplaceService"):GetProductInfo(id)
			button.BGFrame.CPSongLabel.Text = SongName.Name
		else
			warn("Sound", sound.Name, "failed to load. ID:".. sound.SoundId)
			music_list.remove(pos)
			math.random(1,#music_list)
			end
			
	end)

	sound.Ended:Wait()
	if pos > #music_list then
		pos = 1
	end
	
	end
end
button.MouseButton1Click:Connect(function()
	button.BGFrame.Visible = not button.BGFrame.Visible
end)

RE.OnClientEvent:Connect(function(d,starttime)
	local endtime = os.time()
	local ping = endtime-starttime
	print(ping)
	sound:Stop()
	for Index, Song in ipairs(music_list) do
		if Song == d then
			pos = Index
			playmusic()
		end
	end
end)


button.BGFrame.NextButton.MouseButton1Click:Connect(function()
	print("forwards")
	sound:Stop()
	pos = pos + 1
	if pos > #music_list then
		pos = 1
	end
	playmusic()
end)

button.BGFrame.BackButton.MouseButton1Click:Connect(function()
	print("back")
	sound:Stop()		
	pos = pos - 1
	if pos < 1 then
		pos = #music_list
	end
	playmusic()
end)
button.BGFrame.VolumeToggle.MouseButton1Click:Connect(function()
	local oldvolume = sound.Volume
	if oldvolume == 0 then
		if (button.BGFrame.TextBox.Text == "" or button.BGFrame.TextBox.Text == "volume") then
			print((button.BGFrame.TextBox.Text == "" or button.BGFrame.TextBox.Text == "volume"))

			elseif tonumber(button.BGFrame.TextBox.Text) then
		sound.Volume = tonumber(button.BGFrame.TextBox.Text)

		end
	else
		sound.Volume = 0
	end
	

	button.BGFrame.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
		local newText = button.BGFrame.TextBox.Text
		if newText == "" or newText == "volume" then
			sound.Volume = 1
			return
		end
		local newVolume = tonumber(newText)
		if newVolume and newVolume >= 0 and newVolume <= 10 then
			sound.Volume = newVolume			
		end
	end)


	
	
end)

button.BGFrame.PauseButton.MouseButton1Click:Connect(function()
	paused = not paused
	if paused == true then
		button.BGFrame.PauseButton.Text = "►"
		sound.Playing = false
	else 
		button.BGFrame.PauseButton.Text = "II"
		sound.Playing = true
	end
end)

for Index, Song in ipairs(music_list) do
	local SongName = game.MarketplaceService:GetProductInfo(Song).Name
	local SB = button.BGFrame.Templates.SongButton
	local clone = SB:Clone()
	clone.Text = SongName
	clone.SongID.Value = Song
	clone.Name = SongName
	clone.Parent = button.BGFrame.ListFrame
	clone.Visible = true
end




while wait(.1) do	
	
	playmusic()
	
end

sound.Stopped:Connect(function()
		if pos == #music_list then
			pos = 1
			sound:Play()
		end
	end)