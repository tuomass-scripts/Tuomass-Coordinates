RegisterNetEvent("koordinaatit:otakonnu")
AddEventHandler("koordinaatit:otakonnu", function()
    local input = lib.inputDialog('Name for the place', {'Name'})
    if not input then return end
    local pelajaankoordinaatit = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    TriggerServerEvent("koordinaatit:server", pelajaankoordinaatit, heading, input[1])
end)