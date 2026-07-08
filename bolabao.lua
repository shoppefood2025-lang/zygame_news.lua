local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. Thiết lập Cửa sổ xác thực
local Window = Rayfield:CreateWindow({
   Name = "Zygame_,VN",
   LoadingTitle = "Đang kiểm tra...",
   LoadingSubtitle = "by Gbao_gm",
   ConfigurationSaving = { Enabled = false }, -- Tắt lưu config để tránh xung đột
   KeySystem = true, 
   KeySettings = {
      Title = "Xác thực Key",
      Subtitle = "Nhập Key để sử dụng",
      Note = "", 
      SaveKey = true,
      Key = "zy_game_vn" 
   }
})

-- 2. Kiểm tra Password
local input = Rayfield:Prompt({
    Title = "Nhập mật khẩu",
    Text = "Vui lòng nhập mật khẩu:",
    Placeholder = "Password",
    Callback = function(text)
        if text == "zygame_" then
            -- BƯỚC QUAN TRỌNG: Xóa menu xác thực trước khi load menu mới
            Rayfield:Destroy() 
            
            -- Đợi một chút để hệ thống giải phóng bộ nhớ
            task.wait(0.5)
            
            -- Tải script chính
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VTDROBLOX/Animehub/refs/heads/main/Tayhub.lua"))()
        else
            game.Players.LocalPlayer:Kick("Sai mật khẩu!")
        end
    end
})
