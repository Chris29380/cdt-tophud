local isUiOpen = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
    Citizen.Wait(2000)
    -- call triggers
    TriggerEvent("cdt-tophud:openUi")

end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
    ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)


RegisterNetEvent('onResourceStart')
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then 
        Citizen.Wait(300)
        -- call trigger
        TriggerEvent("cdt-tophud:openUi")
    end
end)

RegisterNetEvent('onResourceStop')
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then 

    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

--

RegisterKeyMapping('tophud', 'Toggle Top Hud', 'keyboard', Options.keybindhud)

RegisterCommand("tophud", function()
    if isUiOpen then
        TriggerEvent('cdt-tophud:closeUi')
    else
        TriggerEvent('cdt-tophud:openUi')
    end
end, false)

RegisterNetEvent('cdt-tophud:openUi')
AddEventHandler('cdt-tophud:openUi', function()
    SendNUIMessage(
        {
            type = "showUi",
            discord = Options.discordurl,
            databinds = Options.binds
        }
    )
    isUiOpen = true
end)

RegisterNetEvent('cdt-tophud:closeUi')
AddEventHandler('cdt-tophud:closeUi', function()
    SendNUIMessage(
        {
            type = "hideUi",
        }
    )
    isUiOpen = false
end)
