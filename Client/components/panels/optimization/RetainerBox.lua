WGui.NRetainerBox = WGui.Inherit(WGui.PanelWidget, "NRetainerBox", {
    ChildrenLimit = 1
})

function WGui.NRetainerBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_RetainerBox" )
    return self
end

-- Sets if we retain the render or pass it through
---@param bRetainRender boolean
function WGui.NRetainerBox:SetRetainRender( bRetainRender )
    self:CallBlueprintEvent("SetRetainRender", bRetainRender)
    self.RetainRender = bRetainRender
    return self
end

---@return boolean
function WGui.NRetainerBox:GetRetainRender()
    return self.RetainRender or false
end

-- Sets the rendering phase of this widget
---@param iRenderPhase number
---@param iTotalPhases number
function WGui.NRetainerBox:SetRenderingPhase( iRenderPhase, iTotalPhases )
    self:CallBlueprintEvent("SetRenderingPhase", iRenderPhase, iTotalPhases)
    self.RenderingPhase = iRenderPhase
    self.TotalPhases = iTotalPhases
    return self
end

-- Gets the rendering phase of this widget
---@return number, number
function WGui.NRetainerBox:GetRenderingPhase()
    return self.RenderingPhase or 0, self.TotalPhases or 1
end

-- Sets the texture parameter to use
---@param sParameterName string
function WGui.NRetainerBox:SetTextureParameter( sParameterName )
    self:CallBlueprintEvent("SetTextureParameter", sParameterName)
    self.TextureParameter = sParameterName
    return self
end

---@return string
function WGui.NRetainerBox:GetTextureParameter()
    return self.TextureParameter or "Texture"
end

-- Sets a new effect material to the retainer widget
---@param xMaterial string
function WGui.NRetainerBox:SetEffectMaterial( xMaterial )
    if type(xMaterial) == "string" then
        local sAssetPath = WGui.GetAssetPath("[assets.others]", xMaterial, WGui.NText.SetFont, self:GetID(), {xMaterial})
        if not sAssetPath then return self end

        self:CallBlueprintEvent("SetEffectMaterial", nil, sAssetPath)
        return self
    end
    self:CallBlueprintEvent("SetEffectMaterial", xMaterial)
    return self
end

-- Sets a vector parameter to the effect material
---@param sParameterName string
---@param vValue Vector
function WGui.NRetainerBox:SetVectorParameterValue( sParameterName, vValue )
    self:CallBlueprintEvent("SetVectorParameter", sParameterName, vValue)
    return self
end

-- Sets a scalar parameter to the effect material
---@param sParameterName string
---@param fValue number
function WGui.NRetainerBox:SetScalarParameterValue( sParameterName, fValue )
    self:CallBlueprintEvent("SetScalarParameter", sParameterName, fValue)
    return self
end

-- Sets a texture parameter to the effect material
---@param sParameterName string
---@param xTexture string
function WGui.NRetainerBox:SetTextureParameterValue( sParameterName, xTexture )
    if string.find(xTexture, "package://") then
        self:CallBlueprintEvent("SetTextureParameter", sParameterName, xTexture)
    else
        self:CallBlueprintEvent("SetTextureParameter", sParameterName, nil, xTexture)
    end
    return self
end