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
        local sAssetPath = Assets.GetAssetPath(xMaterial, AssetType.Material)

        self:CallBlueprintEvent("SetEffectMaterial", nil, sAssetPath)
        return self
    end

    if type(xMaterial) == "table" and getmetatable(xMaterial) == WGui.DynamicMaterial then
        self:CallBlueprintEvent("SetEffectMaterial", nil, "", xMaterial.ID)
        return self
    end
    self:CallBlueprintEvent("SetEffectMaterial", xMaterial)
    return self
end