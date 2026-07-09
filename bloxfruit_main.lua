return function()
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
        Name = "Zamex Pro Hub",
        LoadingTitle = "Zamex Initializing...",
        LoadingSubtitle = "by YourName",
        Theme = "Default"
    })

    Window:SetAccentColor(Color3.fromRGB(0, 150, 255)) -- Màu xanh Zamex

    local MainTab = Window:CreateTab("Main", "sword")
    
    -- Chia cột 1 (Bên trái)
    local Left = MainTab:CreateSection("Farm & Methods")
    Left:CreateToggle({Name = "Auto Farm", Callback = function(v) end})
    Left:CreateToggle({Name = "Auto Mystic Island", Callback = function(v) end})
    Left:CreateButton({Name = "Refresh Weapon", Callback = function() end})

    -- Chia cột 2 (Bên phải)
    local Right = MainTab:CreateSection("Boss & Elite")
    Right:CreateToggle({Name = "Auto Law Boss", Callback = function(v) end})
    Right:CreateToggle({Name = "Auto Elite Hunter", Callback = function(v) end})
    Right:CreateToggle({Name = "Auto Hallow Scythe", Callback = function(v) end})

    Rayfield:Notify({Title = "Thành công", Content = "Script đã nạp hoàn tất!", Duration = 5})
end
