WGui.NInvalidationBox = WGui.Inherit(WGui.PanelWidget, "NInvalidationBox", {
    ChildrenLimit = 1
})

function WGui.NInvalidationBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_InvalidationBox" )
    return self
end

-- Sets if this widget can cache its children
---@param bCanCache boolean
function WGui.NInvalidationBox:SetCanCache( bCanCache )
    self:CallBlueprintEvent("SetCanCache", bCanCache)
    self.CanCache = bCanCache
    return self
end

-- Gets if this widget can cache its children
---@return boolean
function WGui.NInvalidationBox:GetCanCache()
    return self.CanCache or false
end