require 'beTilesetLoader'

local exampleRes = beTilesetLoader_readTileFamily( 'res', 'solidstonetiles' )
	
-- call this in update of main.lua 
setup = function()
end

update = function( delta )
    local exampleTiles = {
        {x = 5, y = 5, adjust8 = { nil, 'ground', nil, 'ground', nil, 'ground', nil, 'ground'} },
        {x = 4, y = 5, adjust8 = { nil, nil, nil, 'ground', nil, nil, nil, nil} },
        {x = 5, y = 4, adjust8 = { nil, nil, nil, nil, nil, 'ground', nil, nil} },
        {x = 5, y = 6, adjust8 = { nil, 'ground', nil, nil, nil, nil, nil, nil} },
        {x = 6, y = 5, adjust8 = { nil, nil, nil, nil, nil, nil, nil, 'ground'} }
    }
    for k,v in ipairs( exampleTiles ) do
        local id = beTilesetLoader_getTileId( exampleRes, 'ground', v.adjust8 )
        local wCount = 8
        local xx, yy = id % wCount * 32, math.floor( id / wCount ) * 32
        local sprX, sprY = v.x * 32, v.y * 32
        tex( exampleRes.tex, sprX, sprY, 32, 32, xx, yy, 32, 32 )
    end
end