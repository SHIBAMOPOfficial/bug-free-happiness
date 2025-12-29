-- Services
local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WieldingHubGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = Player:WaitForChild("PlayerGui")

-- Main Frame
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 0, 0, 0)
menuFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
menuFrame.AnchorPoint = Vector2.new(0.5, 0.5)
menuFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
menuFrame.BorderSizePixel = 0
menuFrame.Parent = screenGui

-- Rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = menuFrame

-- Drop shadow (fake)
local shadow = Instance.new("ImageLabel")
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.6
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Size = UDim2.new(1, 40, 1, 40)
shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.BackgroundTransparency = 1
shadow.Parent = menuFrame
shadow.ZIndex = 0

menuFrame.ZIndex = 1

-- Title Bar
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 60)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Wielding Hub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 34
titleLabel.Parent = menuFrame

-- Accent line
local accent = Instance.new("Frame")
accent.Size = UDim2.new(0.3, 0, 0, 3)
accent.Position = UDim2.new(0.35, 0, 0, 58)
accent.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
accent.BorderSizePixel = 0
accent.Parent = menuFrame

-- Dev message
local devMessageLabel = Instance.new("TextLabel")
devMessageLabel.Size = UDim2.new(1, -40, 0, 40)
devMessageLabel.Position = UDim2.new(0, 20, 0, 90)
devMessageLabel.BackgroundTransparency = 1
devMessageLabel.Text = "Under Development"
devMessageLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
devMessageLabel.Font = Enum.Font.Gotham
devMessageLabel.TextSize = 20
devMessageLabel.TextTransparency = 1
devMessageLabel.Parent = menuFrame

-- Fade-in background
menuFrame.BackgroundTransparency = 1
titleLabel.TextTransparency = 1
accent.BackgroundTransparency = 1

-- Animations
local openTween = TweenService:Create(
	menuFrame,
	TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
	{Size = UDim2.new(0.45, 0, 0.45, 0), BackgroundTransparency = 0}
)

local titleTween = TweenService:Create(
	titleLabel,
	TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
	{TextTransparency = 0}
)

local accentTween = TweenService:Create(
	accent,
	TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
	{BackgroundTransparency = 0}
)

local devTween = TweenService:Create(
	devMessageLabel,
	TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
	{TextTransparency = 0}
)

-- Play animations
task.wait(0.1)
openTween:Play()
task.wait(0.2)
titleTween:Play()
accentTween:Play()
task.wait(0.2)
devTween:Play()
