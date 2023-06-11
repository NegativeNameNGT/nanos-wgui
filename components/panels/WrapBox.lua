WGui.NWrapBox = WGui.Inherit(WGui.PanelWidget, "NWrapBox", {
    ChildSlot = "WrapBoxSlot",
})

function WGui.NWrapBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_WrapBox" )
    return self
end

-- Sets the inner slot padding of the wrap box
---@param InSlotPadding Vector2D
function WGui.NWrapBox:SetInnerSlotPadding( InSlotPadding )
    self:CallBlueprintEvent( "SetInnerSlotPadding", InSlotPadding )
    return self
end

-- Sets the wrap box size
---@param InWrapSize number
function WGui.NWrapBox:SetWrapSize( InWrapSize )
    self:CallBlueprintEvent( "SetWrapSize", InWrapSize )
    return self
end

-- Sets if the wrap box should use explicit wrap size or calculate it automatically
---@param bInExplicitWrapSize boolean
function WGui.NWrapBox:SetExplicitWrapSize( bInExplicitWrapSize )
    self:CallBlueprintEvent( "SetExplicitWrapSize", bInExplicitWrapSize )
    return self
end

-- Sets the content horizontal alignment
---@param InHorizontalAlignment WGui.HAlign
function WGui.NWrapBox:SetContentHorizontalAlignment( InHorizontalAlignment )
    self:CallBlueprintEvent( "SetContentHorizontalAlignment", InHorizontalAlignment )
    return self
end

-- Sets the orientation of the wrap box
---@param InOrientation WGui.Orientation
function WGui.NWrapBox:SetOrientation( InOrientation )
    self:CallBlueprintEvent( "SetOrientation", InOrientation )
    return self
end