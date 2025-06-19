-- Place me in a UIListLayout
local UIListLayout = script.Parent
local ScrollingFrame = UIListLayout.Parent

UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	local size = UIListLayout.AbsoluteContentSize
	ScrollingFrame.CanvasSize = UDim2.new(0,size.X,0,size.Y)
end)