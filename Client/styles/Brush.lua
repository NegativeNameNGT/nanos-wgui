WGui.Brush = function ()
    local tNewBrush = {}
    tNewBrush.IsCustom = true
    tNewBrush.OutlineSettings = {}

    ---@param DrawType WGui.DrawType
    function tNewBrush.SetDrawType( DrawType )
        tNewBrush.DrawType = DrawType
        return tNewBrush
    end

    ---@param iMirrorType WGui.MirrorType
    function tNewBrush.SetMirrorType( iMirrorType )
        tNewBrush.MirrorType = iMirrorType
        return tNewBrush
    end
    
    ---@param iTileType WGui.TileType
    function tNewBrush.SetTileType( iTileType )
        tNewBrush.TileType = iTileType
        return tNewBrush
    end

    ---@param tColor Color
    function tNewBrush.SetColor( tColor )
        tNewBrush.Tint = tColor
        return tNewBrush
    end

    ---@param sPath string
    function tNewBrush.SetImage( sPath )
        if string.sub(sPath, 1, 7) == "http://" or string.sub(sPath, 1, 8) == "https://" or string.sub(sPath, 1, 6) == "ftp://" then
            tNewBrush.ImageURL = sPath
            return tNewBrush
        end

        -- Special Path
        if string.sub(sPath, 1, 7) == "package" then
            tNewBrush.ImageURL = nil
            tNewBrush.ImageTexture = sPath
            return tNewBrush
        end

        -- Steam Avatar
        if string.sub(sPath, 1, 5) == "steam" then
            tNewBrush.ImageURL = nil
            tNewBrush.ImageTexture = sPath
            return tNewBrush
        end
        
        tNewBrush.ImageURL = sPath
        tNewBrush.ImageTexture = nil
        return tNewBrush
    end

    function tNewBrush.SetMaterial( eMaterial )
        if type(eMaterial) == "string" then
            tNewBrush.ImageURL, tNewBrush.ImageTexture = nil, nil
            tNewBrush.ImageMaterial = eMaterial
            return tNewBrush
        end

        if not eMaterial.ID then
            tNewBrush.ImageMaterial = eMaterial
            tNewBrush.ImageURL, tNewBrush.ImageTexture = nil, nil
            return tNewBrush
        end

        tNewBrush.ImageURL = tostring(eMaterial.ID)
        tNewBrush.ImageTexture = nil

        return tNewBrush
    end

    ---@param Size Vector2D
    function tNewBrush.SetImageSize( tImageSize )
        tNewBrush.ImageSize = tImageSize
        return tNewBrush
    end

    ---@param tOutlineSettings table
    function tNewBrush.SetOutlineSettings( tOutlineSettings )
        if tOutlineSettings.CornerRadius then
            tOutlineSettings.CornerRadii = tOutlineSettings.CornerRadius
            tOutlineSettings.CornerRadius = nil
        end

        tNewBrush.OutlineSettings = tOutlineSettings

        return tNewBrush
    end

    ---@param tMargin table
    function tNewBrush.SetMargin( tMargin )
        tNewBrush.Margin = tMargin
        return tNewBrush
    end

    return tNewBrush
end