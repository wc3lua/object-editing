compiletime(function()
    local mapName = 'test1.w3x' -- имя карты

    local path = ceres.layout.mapsDirectory .. mapName
    print('path: ', path)
    local map, err = ceres.openMap(path)
    print('map, err: ', map, err)

    local addNewObjects = function(keyObjects, targetMap, sourceMap)
        for id in pairs(sourceMap.objects[keyObjects].all) do
            if (not targetMap.objects[keyObjects]:getObject(id)) then
                targetMap.objects[keyObjects]:setObject(id, sourceMap.objects[keyObjects]:getObject(id))
            end
        end
    end

    local function addNewAllObjects(targetMap, sourceMap)
        addNewObjects('unit', targetMap, sourceMap)
        addNewObjects('item', targetMap, sourceMap)
        addNewObjects('destructable', targetMap, sourceMap)
        addNewObjects('doodad', targetMap, sourceMap)
        addNewObjects('ability', targetMap, sourceMap)
        addNewObjects('buff', targetMap, sourceMap)
        addNewObjects('upgrade', targetMap, sourceMap)
    end

    addNewAllObjects(currentMap, map)
end)