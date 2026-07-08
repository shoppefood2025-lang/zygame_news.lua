local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. Thiết lập Cửa sổ chính
local Window = Rayfield:CreateWindow({
   Name = "Zygame_,VN",
   LoadingTitle = "Đang tải dữ liệu...",
   LoadingSubtitle = "by Gbao_gm",
   ConfigurationSaving = { Enabled = true, FileName = "TayHubConfig" },
   KeySystem = true, 
   KeySettings = {
      Title = "Xác thực Key",
      Subtitle = "Nhập Key để sử dụng",
      Note = "", 
      SaveKey = true,
      Key = "zy_game_vn" -- Đã đổi thành zy_game_vn
   }
})

-- Biến điều khiển trạng thái viền
local RainbowEnabled = false

-- 2. Kiểm tra Password
local input = Rayfield:Prompt({
    Title = "Nhập mật khẩu",
    Text = "Vui lòng nhập mật khẩu:",
    Placeholder = "Password",
    Callback = function(text)
        if text ~= "zygame_" then
            game.Players.LocalPlayer:Kick("Sai mật khẩu!")
        end
    end
})

-- 3. Tạo Tab và Nút bật/tắt
local Tab = Window:CreateTab("Settings", nil)

Tab:CreateToggle({
   Name = "Bật/Tắt viền 7 màu",
   CurrentValue = false,
   Flag = "RainbowToggle",
   Callback = function(Value)
      RainbowEnabled = Value
   end,
})

-- 4. Logic hiệu ứng viền
task.spawn(function()
    local UI = game:GetService("CoreGui"):FindFirstChild("Rayfield")
    if not UI then return end
    local MainFrame = UI:FindFirstChild("Main")
    if not MainFrame then return end
    
    MainFrame.BorderSizePixel = 2
    
    local hue = 0
    while true do
        if RainbowEnabled then
            hue = hue + 0.01
            if hue > 1 then hue = 0 end
            MainFrame.BorderColor3 = Color3.fromHSV(hue, 1, 1)
        else
            MainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
        end
        task.wait(0.05)
    end
end)
