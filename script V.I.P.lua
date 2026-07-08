-- SCRIPT HOÀN CHỈNH - ZYGAME_VN LAUNCHER
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- 1. TẠO GIAO DIỆN HỆ THỐNG
local gui = script.Parent
local loginFrame = Instance.new("Frame", gui); loginFrame.Name = "LoginFrame"; loginFrame.Size = UDim2.new(0, 220, 0, 120); loginFrame.Position = UDim2.new(0.5, -110, 0.5, -60)
loginFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30); Instance.new("UICorner", loginFrame)

local passBox = Instance.new("TextBox", loginFrame); passBox.Size = UDim2.new(0.8, 0, 0.3, 0); passBox.Position = UDim2.new(0.1, 0, 0.2, 0); passBox.PlaceholderText = "Mật khẩu..."; passBox.Text = ""
local loginBtn = Instance.new("TextButton", loginFrame); loginBtn.Size = UDim2.new(0.8, 0, 0.3, 0); loginBtn.Position = UDim2.new(0.1, 0, 0.6, 0); loginBtn.Text = "Đăng nhập"; loginBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50); loginBtn.TextColor3 = Color3.new(1,1,1)

local menu = Instance.new("Frame", gui); menu.Name = "Menu"; menu.Size = UDim2.new(0, 350, 0, 350); menu.Position = UDim2.new(0.5, -175, 0.5, -175); menu.Visible = false; menu.BorderSizePixel = 6; menu.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", menu)

local title = Instance.new("TextLabel", menu); title.Size = UDim2.new(1, 0, 0.2, 0); title.Text = "zygame_vn"; title.BackgroundTransparency = 1; title.TextColor3 = Color3.new(1, 1, 1); title.Font = Enum.Font.Bold; title.TextSize = 24

-- 2. LOGIC ĐĂNG NHẬP (BẢO MẬT)
local PASSWORD = "zygame_key"
loginBtn.MouseButton1Click:Connect(function()
    if passBox.Text == PASSWORD then
        loginFrame:Destroy() -- Xóa khung đăng nhập
        menu.Visible = true
        
        -- Gọi script từ GitHub với kiểm tra lỗi
        local success, err = pcall(function()
            local response = game:HttpGet("https://raw.githubusercontent.com/shoppefood2025-lang/zygisk.lua/refs/heads/main/zygame_new.lua")
            loadstring(response)()
        end)
        
        if not success then
            warn("Lỗi tải script: " .. tostring(err))
            title.Text = "Lỗi kết nối!"
        end
    else
        passBox.Text = ""
        passBox.PlaceholderText = "Sai mật khẩu!"
    end
end)

-- 3. HIỆU ỨNG THẨM MỸ (THỞ & CẦU VỒNG)
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
TweenService:Create(menu, tweenInfo, {Size = UDim2.new(0, 370, 0, 370)}):Play()

RunService.RenderStepped:Connect(function()
    if menu.Visible then
        menu.BorderColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    end
end)

-- 4. PHÍM TẮT ĐIỀU KHIỂN
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
        menu.Visible = not menu.Visible
    end
end)
