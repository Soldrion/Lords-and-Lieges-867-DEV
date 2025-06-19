local Teams = game:GetService("Teams")
wait(1)
local teamPlayers = Teams["Choosing"]:GetPlayers() 
year = 867
month = 1
day = 1
max_days_feb = 30
max_days_normal = 32
max_days_other = 31
local remotefunction = game.ReplicatedStorage.TimeUpdate
while wait(.25) do
	
	while #teamPlayers >= 1 do
		wait(.3)
		teamPlayers = Teams["Choosing"]:GetPlayers() 
	end
	day += 1
	
	if day == max_days_normal and (month == 1 or month == 3 or month == 5 or month == 7
		or month == 8 or month == 10 or month == 12) then
		day = 1
		if month < 12 then
			month += 1
		else
			month = 1
			year +=1
		end
	end
	
	if year%4 ==0 then 
		if day == max_days_feb and month == 2 then
		day = 1
		month += 1
		end
	else
		if day == (max_days_feb-1) and month == 2 then
		day = 1
		month += 1
		end
	end
	
	
	
	if day == max_days_other and (month == 4 or month == 6 or month == 9 or month == 11) then
		day = 1
		if month < 12 then
			month += 1
		else
			month = 1
			year +=1
		end
	end
	remotefunction:FireAllClients(month,day,year)
end