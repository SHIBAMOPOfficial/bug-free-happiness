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

-- MAIN FRAME
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 420, 0, 260)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.BackgroundTransparency = 1
main.BorderSizePixel = 0
main.Parent = gui

-- CORNER
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "Wielding Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 30
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextTransparency = 1
title.Parent = main

-- SUBTEXT
local sub = Instance.new("TextLabel")
sub.Position = UDim2.new(0, 0, 0, 48)
sub.Size = UDim2.new(1, 0, 0, 24)
sub.BackgroundTransparency = 1
sub.Text = "Enter Access Key"
sub.Font = Enum.Font.Gotham
sub.TextSize = 16
sub.TextColor3 = Color3.fromRGB(180, 180, 180)
sub.TextTransparency = 1
sub.Parent = main

-- INPUT
local input = Instance.new("TextBox")
input.Position = UDim2.new(0.1, 0, 0.45, 0)
input.Size = UDim2.new(0.8, 0, 0, 40)
input.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.PlaceholderText = "Enter key here"
input.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
input.Font = Enum.Font.Gotham
input.TextSize = 16
input.TextTransparency = 1
input.BackgroundTransparency = 1
input.ClearTextOnFocus = false
input.Parent = main
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 10)

-- BUTTON
local button = Instance.new("TextButton")
button.Position = UDim2.new(0.3, 0, 0.7, 0)
button.Size = UDim2.new(0.4, 0, 0, 38)
button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
button.TextColor3 = Color3.fromRGB(0, 0, 0)
button.Text = "UNLOCK"
button.Font = Enum.Font.GothamBold
button.TextSize = 16
button.TextTransparency = 1
button.BackgroundTransparency = 1
button.Parent = main
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 10)

-- ERROR TEXT
local errorText = Instance.new("TextLabel")
errorText.Position = UDim2.new(0, 0, 0.88, 0)
errorText.Size = UDim2.new(1, 0, 0, 20)
errorText.BackgroundTransparency = 1
errorText.Text = ""
errorText.Font = Enum.Font.Gotham
errorText.TextSize = 14
errorText.TextColor3 = Color3.fromRGB(255, 80, 80)
errorText.Parent = main

-- OPEN ANIMATION
TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
	BackgroundTransparency = 0
}):Play()

TweenService:Create(title, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
TweenService:Create(sub, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
TweenService:Create(input, TweenInfo.new(0.5), {
	TextTransparency = 0,
	BackgroundTransparency = 0
}):Play()
TweenService:Create(button, TweenInfo.new(0.5), {
	TextTransparency = 0,
	BackgroundTransparency = 0
}):Play()

-- BUTTON CLICK
button.MouseButton1Click:Connect(function()
	if input.Text == VALID_KEY then
		errorText.Text = "Access Granted"

		-- CLOSE ANIMATION
		TweenService:Create(main, TweenInfo.new(0.4), {
			BackgroundTransparency = 1
		}):Play()

		task.wait(0.4)
		gui:Destroy()

		-- HUB UNLOCKED (placeholder)
		print("Wielding Hub Unlocked")

	else
		errorText.Text = "Invalid Key"
	end
end)
