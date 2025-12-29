-- Create a ScreenGui to hold the menu
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WieldingHubGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame for the menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
menuFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
menuFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
menuFrame.BorderSizePixel = 0
menuFrame.Parent = screenGui

-- Create a TextLabel for the title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White background
titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
titleLabel.Text = "Wielding Hub"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 36
titleLabel.Parent = menuFrame

-- Create a TextLabel for the development message
local devMessageLabel = Instance.new("TextLabel")
devMessageLabel.Size = UDim2.new(1, 0, 0.2, 0)
devMessageLabel.Position = UDim2.new(0, 0, 0.3, 0)
devMessageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White background
devMessageLabel.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
devMessageLabel.Text = "Under Development"
devMessageLabel.Font = Enum.Font.SourceSans
devMessageLabel.TextSize = 24
devMessageLabel.Parent = menuFrame
