return function()
    local success, Rayfield = pcall(function() return loadstring(game:HttpGet('https://sirius.menu/rayfield'))() end)
    if not success then return end

    local Window = Rayfield:CreateWindow({
        Name = "Zygame Hub",
        ConfigurationSaving = { Enabled = true, FileName = "ZygameConfig" },
        KeySystem = true, 
        KeySettings = {
            Title = "Zygame Key System",
            Key = {"zygamevn"}
        },
        Theme = "Default"
    })

    Window:SetAccentColor(Color3.fromRGB(0, 150, 255))
    local MainTab = Window:CreateTab("Main", "sword")

    MainTab:CreateSection("Farm")
    MainTab:CreateToggle({Name = "Auto Farm", Callback = function(v) _G.AutoFarm = v end})
    MainTab:CreateToggle({Name = "Auto Mystic", Callback = function(v) _G.AutoMystic = v end})
    MainTab:CreateButton({Name = "Refresh", Callback = function() end})

    MainTab:CreateSection("Boss")
    MainTab:CreateToggle({Name = "Auto Law", Callback = function(v) _G.AutoLaw = v end})
    MainTab:CreateToggle({Name = "Auto Elite", Callback = function(v) _G.AutoElite = v end})
end
