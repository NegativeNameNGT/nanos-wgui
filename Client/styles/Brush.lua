UMG.Brush = function ()
    local tNewBrush = {}
    tNewBrush.IsCustom = true
    tNewBrush.OutlineSettings = {}

    ---@param DrawType UMG.DrawType
    function tNewBrush.SetDrawType( DrawType )
        tNewBrush.DrawType = DrawType
        return tNewBrush
    end

    ---@param iMirrorType UMG.MirrorType
    function tNewBrush.SetMirrorType( iMirrorType )
        tNewBrush.MirrorType = iMirrorType
        return tNewBrush
    end
    
    ---@param iTileType UMG.TileType
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
        else
            tNewBrush.ImageURL = nil
            tNewBrush.ImageTexture = sPath
        end

        return tNewBrush
    end

    function tNewBrush.SetMaterial( eMaterial )
        tNewBrush.ImageURL = nil
        tNewBrush.ImageTexture = eMaterial
        
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