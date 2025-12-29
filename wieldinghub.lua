-- SERVICES
local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer

-- CONFIG
local VALID_KEY = "wd001"

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "WieldingHubGui"
gui.ResetOnSpawn = false
gui.Parent = Player:WaitForChild("PlayerGui")

-- ===== SHARED FUNCTION =====
local function tween(obj, time, props)
	TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props):Play()
end

-- ===== FLOATING ICON =====
local icon = Instance.new("TextButton")
icon.Size = UDim2.new(0, 45, 0, 45)
icon.Position = UDim2.new(0, 20, 0.5, -22)
icon.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
icon.Text = "W"
icon.TextColor3 = Color3.new(1,1,1)
icon.Font = Enum.Font.GothamBold
icon.TextSize = 18
icon.Visible = false
icon.Parent = gui
Instance.new("UICorner", icon).CornerRadius = UDim.new(1,0)

-- ===== MAIN FRAME =====
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 420, 0, 300)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.BackgroundTransparency = 1
main.BorderSizePixel = 0
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)

-- ===== CLOSE BUTTON =====
local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 32, 0, 32)
close.Position = UDim2.new(1, -40, 0, 8)
close.Text = "✕"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.TextColor3 = Color3.new(1,1,1)
close.BackgroundTransparency = 1
close.Parent = main

-- ===== TITLE =====
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "Wielding Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextColor3 = Color3.new(1,1,1)
title.TextTransparency = 1
title.Parent = main

-- ===== CONTENT HOLDER =====
local content = Instance.new("Frame")
content.Position = UDim2.new(0, 20, 0, 60)
content.Size = UDim2.new(1, -40, 1, -80)
content.BackgroundTransparency = 1
content.Parent = main

-- ===== KEY UI =====
local keyText = Instance.new("TextLabel")
keyText.Size = UDim2.new(1, 0, 0, 30)
keyText.Text = "Enter Access Key"
keyText.Font = Enum.Font.Gotham
keyText.TextSize = 16
keyText.TextColor3 = Color3.fromRGB(180,180,180)
keyText.TextTransparency = 1
keyText.BackgroundTransparency = 1
keyText.Parent = content

local input = Instance.new("TextBox")
input.Position = UDim2.new(0, 0, 0, 45)
input.Size = UDim2.new(1, 0, 0, 38)
input.PlaceholderText = "Key here"
input.Text = ""
input.ClearTextOnFocus = false
input.Font = Enum.Font.Gotham
input.TextSize = 15
input.TextColor3 = Color3.new(1,1,1)
input.PlaceholderColor3 = Color3.fromRGB(120,120,120)
input.BackgroundColor3 = Color3.fromRGB(20,20,20)
input.BackgroundTransparency = 1
input.TextTransparency = 1
input.Parent = content
Instance.new("UICorner", input).CornerRadius = UDim.new(0,10)

local unlock = Instance.new("TextButton")
unlock.Position = UDim2.new(0.25, 0, 0, 95)
unlock.Size = UDim2.new(0.5, 0, 0, 36)
unlock.Text = "UNLOCK"
unlock.Font = Enum.Font.GothamBold
unlock.TextSize = 15
unlock.TextColor3 = Color3.fromRGB(0,0,0)
unlock.BackgroundColor3 = Color3.fromRGB(255,255,255)
unlock.BackgroundTransparency = 1
unlock.TextTransparency = 1
unlock.Parent = content
Instance.new("UICorner", unlock).CornerRadius = UDim.new(0,10)

-- ===== HUB UI =====
local hubText = Instance.new("TextLabel")
hubText.Size = UDim2.new(1, 0, 0, 30)
hubText.Text = "Welcome to Wielding Hub"
hubText.Font = Enum.Font.GothamBold
hubText.TextSize = 18
hubText.TextColor3 = Color3.new(1,1,1)
hubText.Visible = false
hubText.BackgroundTransparency = 1
hubText.Parent = content

local desc = Instance.new("TextLabel")
desc.Position = UDim2.new(0,0,0,40)
desc.Size = UDim2.new(1,0,0,50)
desc.Text = "Features will appear here.\nClean • Fast • Undetected"
desc.Font = Enum.Font.Gotham
desc.TextSize = 14
desc.TextColor3 = Color3.fromRGB(170,170,170)
desc.Visible = false
desc.BackgroundTransparency = 1
desc.Parent = content

-- ===== OPEN ANIMATION =====
tween(main, 0.5, {BackgroundTransparency = 0})
tween(title, 0.5, {TextTransparency = 0})
tween(keyText, 0.5, {TextTransparency = 0})
tween(input, 0.5, {TextTransparency = 0, BackgroundTransparency = 0})
tween(unlock, 0.5, {TextTransparency = 0, BackgroundTransparency = 0})

-- ===== UNLOCK LOGIC =====
unlock.MouseButton1Click:Connect(function()
	if input.Text == VALID_KEY then
		keyText.Visible = false
		input.Visible = false
		unlock.Visible = false

		hubText.Visible = true
		desc.Visible = true
	end
end)

-- ===== CLOSE =====
close.MouseButton1Click:Connect(function()
	tween(main, 0.4, {BackgroundTransparency = 1})
	task.wait(0.4)
	main.Visible = false
	icon.Visible = true
end)

-- ===== REOPEN =====
icon.MouseButton1Click:Connect(function()
	icon.Visible = false
	main.Visible = true
	tween(main, 0.4, {BackgroundTransparency = 0})
end)
