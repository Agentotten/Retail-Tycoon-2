local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()
local Cheats = loadstring(game:HttpGet("https://raw.githubusercontent.com/Agentotten/Retail-Tycoon-2/main/src/lib/cheats.luau"))()

local Window = Rayfield:CreateWindow({
    Name = "Retail Tycoon 2",
    LoadingTitle = "Retail Tycoon 2",
    LoadingSubtitle = "By Agentotten#2610"
})

local StoreTab = Window:CreateTab("Store")

StoreTab:CreateSection("Macro Cheats")

StoreTab:CreateButton({
    Name = "Buy & Restock Products",
    Callback = function()
        Cheats:buy_restock_products()
    end
})

StoreTab:CreateButton({
    Name = "Empty Trashcans & Pickup Trash",
    Callback = function()
        Cheats:empty_trashcans_pickup_trash()
    end
})

StoreTab:CreateSection("Cheats")

StoreTab:CreateButton({
    Name = "Buy Products",
    Callback = function()
        Cheats:buy_products()
    end
})

StoreTab:CreateButton({
    Name = "Restock Products",
    Callback = function()
        Cheats:restock_products()
    end
})

StoreTab:CreateButton({
    Name = "Empty Trashcans",
    Callback = function()
        Cheats:empty_trashcans()
    end
})

StoreTab:CreateButton({
    Name = "Pickup Trash",
    Callback = function()
        Cheats:pickup_trash()
    end
})

StoreTab:CreateButton({
    Name = "Arrest Robbers",
    Callback = function()
        Cheats:arrest_robbers()
    end
})
