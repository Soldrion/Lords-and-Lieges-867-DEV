local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local plr = game.Players.LocalPlayer
local char = game.Workspace:WaitForChild(plr.Name)

local Camera = game.Workspace.CurrentCamera
Camera.CameraType = Enum.CameraType.Scriptable
Camera.CFrame = CFrame.new(0, 0, 0)
Camera.CFrame = game.Workspace.CamPlace.CFrame

local W, A, S, D, Q, E, NotMoving = false, false, false, false, false, false, true

local Speed = .7

local function KeepMoving()
	repeat
		local velocity = Vector3.new()

		if W then
			velocity = velocity + (Camera.CFrame.UpVector * Speed)
		end
		if S then
			velocity = velocity - (Camera.CFrame.UpVector * Speed)
		end
		if A then
			velocity = velocity - (Camera.CFrame.RightVector * Speed)
		end
		if D then
			velocity = velocity + (Camera.CFrame.RightVector * Speed)
		end

		Camera.CFrame = Camera.CFrame + velocity

		while Camera.CFrame.Z >= -8 do
			Camera.CFrame = Camera.CFrame - (Camera.CFrame.UpVector * Speed)
		end
		while Camera.CFrame.X >= 520 do
			Camera.CFrame = Camera.CFrame + (Camera.CFrame.RightVector * Speed)
		end
		while Camera.CFrame.X <= -525 do
			Camera.CFrame = Camera.CFrame - (Camera.CFrame.RightVector * Speed)
		end
		while Camera.CFrame.Z <= -870 do
			Camera.CFrame = Camera.CFrame + (Camera.CFrame.UpVector * Speed)
		end

		RunService.RenderStepped:Wait()
	until NotMoving
end

local function MoveBegan(actionName, inputState, input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then
			W = true
			NotMoving = false
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then
			A = true
			NotMoving = false
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
			S = true
			NotMoving = false
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then
			D = true
			NotMoving = false
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
			Q = true
			NotMoving = false
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.E) then
			E = true
			NotMoving = false
		end
	end

	if (W or A or S or D) and not (Q or E) then
		KeepMoving()
	end
end

local function MoveEnded(input, gpe)
	if input.KeyCode == Enum.KeyCode.W then
		W = false
	elseif input.KeyCode == Enum.KeyCode.S then
		S = false
	elseif input.KeyCode == Enum.KeyCode.D then
		D = false
	elseif input.KeyCode == Enum.KeyCode.A then
		A = false
	elseif input.KeyCode == Enum.KeyCode.Q then
		Q = false
	elseif input.KeyCode == Enum.KeyCode.E then
		E = false
	end

	if not (W or A or S or D or Q or E) then
		NotMoving = true
	end
end

game:GetService("ContextActionService"):BindAction("MoveCam", MoveBegan, false, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D, Enum.KeyCode.Q, Enum.KeyCode.E)
UserInputService.InputEnded:Connect(MoveEnded)

local function AdjustCameraHeight()
	if Q and not E then
		Camera.CFrame = Camera.CFrame + (Camera.CFrame.LookVector * Speed)
	elseif E and not Q then
		Camera.CFrame = Camera.CFrame - (Camera.CFrame.LookVector * Speed)
	end
end

while true do
	AdjustCameraHeight()
	RunService.RenderStepped:Wait()
end
