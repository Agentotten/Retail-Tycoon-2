-- Data Grapper Library

local roblox_environment = getrenv()._G
local game_data = require(game:GetService("ReplicatedStorage").GameData)

local library = {}

function library:plot()
    return roblox_environment.Plot, roblox_environment.CurrentPlotNum
end

function library:cash()
    return roblox_environment.Data.Cash
end

function library:storage()
    return roblox_environment.Data.Storage
end

function library:sellables()
    return game_data.Sellables
end

function library:shelves()
    local shelves = {}

    for _, floor in pairs(roblox_environment.Plot.Objects:GetChildren()) do
        for _, object in pairs(floor:GetChildren()) do
            if object:FindFirstChild("Sellable") == nil then continue end
            shelves[#shelves + 1] = object
        end
    end

    return shelves
end

function library:trashcans()
    local trashcans = {}

    for _, floor in pairs(roblox_environment.Plot.Objects:GetChildren()) do
        for _, object in pairs(floor:GetChildren()) do
            if string.find(object.Name, "TrashCan") == nil then continue end
            trashcans[#trashcans + 1] = object
        end
    end

    return trashcans
end

function library:trash()
    local trash = {}

    for _, trash_piece in pairs(roblox_environment.Plot.Trash:GetChildren()) do
        trash[#trash + 1] = trash_piece
    end

    return trash
end

function library:robbers()
    local robbers = {}

    for _, customer in pairs(workspace.NPCModel:GetChildren()) do
        if customer:FindFirstChild("ArrestPrompt") == nil then continue end
        robbers[#robbers + 1] = customer
    end

    return robbers
end

return library
