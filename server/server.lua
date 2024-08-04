lib.addCommand('coordinates', {
    help = 'Take coordinates',
    restricted = 'group.admin'
}, function(source, args, raw)
   TriggerClientEvent('koordinaatit:otakonnu', source)
end)

local hook = "https://discord.com/api/webhooks/1260672513583878215/gbR7hciw-O-V4QCCSt64qz1bU9NtYLmQTT659E3VpxyKF6yRB948NvR3VJTZDpMGq7X_"

local function sendToWebhook(konnut, headingi, paikkaNimi)
    PerformHttpRequest(hook, function(err, text, headers) end, 'POST', json.encode({
        embeds = {
            {
                title = paikkaNimi,
                description = string.format("**X: %f, Y: %f, Z: %f**\n\n**{x = %f, y = %f, z = %f}**\n\n**vec3(%f, %f, %f)**\n\n**vec4(%f, %f, %f, %f)**", konnut.x, konnut.y, konnut.z, konnut.x, konnut.y, konnut.z, konnut.x, konnut.y, konnut.z, konnut.x, konnut.y, konnut.z, headingi),
                color = 16711680
            }
        }
    }), { ['Content-Type'] = 'application/json' })
end

-- Register server event to receive coordinates from client
RegisterNetEvent("koordinaatit:server")
AddEventHandler("koordinaatit:server", function(pelaajankoordinaatit, heading, paikkaNimi)
    local konnut = {
        x = pelaajankoordinaatit.x,
        y = pelaajankoordinaatit.y,
        z = pelaajankoordinaatit.z
    }
    local headingi = heading
    sendToWebhook(konnut, headingi, paikkaNimi)
end)