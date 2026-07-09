return function()
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
        Name = "Zamex Pro Hub",
        LoadingTitle = "Đang khởi tạo Zamex...",
        LoadingSubtitle = "by YourName",
        ConfigurationSaving = { Enabled = true, FileName = "ZamexConfig" }
    })

    -- Tạo Tab
    local MainTab = Window:CreateTab("Main", "sword")
    
    -- Chia cột trong Tab Main
    local LeftColumn = MainTab:CreateSection("Farm & Methods")
    
    MainTab:CreateToggle({
        Name = "Auto Farm",
        Callback = function(Value) end
    })

    MainTab:CreateToggle({
        Name = "Auto Mystic Island",
        Callback = function(Value) end
    })

    local RightColumn = MainTab:CreateSection("Boss & Raid")
    
    RightColumn:CreateToggle({
        Name = "Auto Law Boss",
        Callback = function(Value) end
    })

    RightColumn:CreateToggle({
        Name = "Auto Advance Dungeon",
        Callback = function(Value) end
    })

    -- Tạo thông báo
    Rayfield:Notify({
        Title = "Thành công",
        Content = "Menu đã được tải lên!",
        Duration = 5
    })
end
