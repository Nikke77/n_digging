


local AllowedAreas = {
    [-1885547121] = true,  -- desert and rock
    [-1907520769] = true,  -- desert
    [-1595148316] = true,  -- desert & beach san
    [-1286696947] = true,  -- sand mixed grass
    [-840216541] = true,   -- desert
    [1288448767] = true,   -- wet beach sand
    [-1942898710] = true,  -- desert mixed grass
    [951832588] = true,    -- 2d grass
    [-461750719] = true,   -- grass mountain
    [2409420175] = true,   -- grass
    [3833216577] = true,   -- grass
    [1333033863] = true,   -- grass
    [4170197704] = true,   -- grass
    [1109728704] = true,   -- grass
    [2352068586] = true,   -- grass
    [581794674] =  true,   -- grass
    [3008270349] = true,   -- sand
    [223086562] =  true,   -- sand
    [3594309083] = true,   -- sand
    [2461440131] = true,   -- sand
    [1144315879] = true,   -- sand
    [2128369009] = true,   -- sand  
}


RegisterNetEvent('esx_n_digging:client:start', function()
            local groundhash = GetGroundHash(PlayerPedId())
            local p = PlayerPedId()
            if not AllowedAreas[groundhash] then
                lib.notify({
                    title = "You can't dig here",
                    description = '',
                    type = 'error'
                }) return end
                if not IsPedInAnyVehicle(PlayerPedId(), false) then
                lib.notify({
                    title = 'You started digging',
                    description = '',
                    type = 'success'
                })

                TaskStartScenarioInPlace(p, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
                Wait(2000)
                if lib.progressCircle({
                    duration = 7000,
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                    car = true,
                    },
                    }) then
                if IsPedUsingScenario(p, "WORLD_HUMAN_GARDENER_PLANT") then
                ClearPedTasks(p)
                TriggerServerEvent('esx_n_digging:server:givereward')
            end
         end
    end
end)


function GetGroundHash(ped)
    local posped = GetEntityCoords(ped)
    local num = StartShapeTestCapsule(posped.x,posped.y,posped.z+4,posped.x,posped.y,posped.z-2.0, 2, 1, ped, 7)
    local arg1, arg2, arg3, arg4, arg5 = GetShapeTestResultEx(num)
    return arg5
end