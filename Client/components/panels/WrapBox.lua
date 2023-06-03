UMG.NWrapBox = UMG.Inherit(UMG.PanelWidget, "NWrapBox", {
    ChildSlot = "WrapBoxSlot",
})

function UMG.NWrapBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_WrapBox" )
    return self
end

-- Sets the inner slot padding of the wrap box
---@param InSlotPadding Vector2D
function UMG.NWrapBox:SetInnerSlotPadding( InSlotPadding )
    self:CallBlueprintEvent( "SetInnerSlotPadding", InSlotPadding )
    return self
end

-- Sets the wrap box size
---@param InWrapSize number
function UMG.NWrapBox:SetWrapSize( InWrapSize )
    self:CallBlueprintEvent( "SetWrapSize", InWrapSize )
    return self
end

-- Sets if the wrap box should use explicit wrap size or calculate it automatically
---@param bInExplicitWrapSize boolean
function UMG.NWrapBox:SetExplicitWrapSize( bInExplicitWrapSize )
    self:CallBlueprintEvent( "SetExplicitWrapSize", bInExplicitWrapSize )
    return self
end

-- Sets the content horizontal alignment
---@param InHorizontalAlignment UMG.HorizontalAlignment
function UMG.NWrapBox:SetContentHorizontalAlignment( InHorizontalAlignment )
    self:CallBlueprintEvent( "SetContentHorizontalAlignment", InHorizontalAlignment )
    return self
end

-- Sets the orientation of the wrap box
---@param InOrientation UMG.Orientation
function UMG.NWrapBox:SetOrientation( InOrientation )
    self:CallBlueprintEvent( "SetOrientation", InOrientation )
    return self
end