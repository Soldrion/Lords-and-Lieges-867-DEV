local TweenService = game:GetService("TweenService")
local InvisFrame = script.Parent

-- Function to calculate the final position for the button to fly in from
local function calculateFinalPosition(button)
	local initialPosition = button.Position
	local screenWidth = workspace.CurrentCamera.ViewportSize.X
	local screenHeight = workspace.CurrentCamera.ViewportSize.Y
	local flyInPosition = UDim2.new(1, -button.Size.X.Offset, initialPosition.Y.Scale, initialPosition.Y.Offset)
	return flyInPosition
end

local function flyIn(button)
	local finalPosition = calculateFinalPosition(button)

	local tweenInfo = TweenInfo.new(
		1, -- Duration of the tween in seconds
		Enum.EasingStyle.Quint, -- Easing style
		Enum.EasingDirection.Out, -- Easing direction
		0, -- Number of times to repeat (-1 means infinite)
		false, -- Whether to reverse the tween
		0 -- Delay before starting the tween
	)

	local properties = {
		Position = finalPosition
	}

	local tween = TweenService:Create(button, tweenInfo, properties)
	tween:Play()
end

-- Function to handle button visibility changes
local function handleButtonVisibility(button)
	button:GetPropertyChangedSignal("Visible"):Connect(function()
		if button.Visible == true then
			flyIn(button)
		end
	end)
end

-- Connect to event when a new button is added or becomes visible

for _, newButton in ipairs(InvisFrame:GetChildren()) do
	if newButton:IsA("ImageButton") then
		handleButtonVisibility(newButton)
	end
end

-- Listen for new buttons being added
InvisFrame.ChildAdded:Connect(function(newButton)
	if newButton:IsA("ImageButton") then
		handleButtonVisibility(newButton)
	end
end)
