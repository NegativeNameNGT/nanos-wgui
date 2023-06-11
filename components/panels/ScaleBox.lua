WGui.NScaleBox = WGui.Inherit(WGui.PanelWidget, "NScaleBox", {
    ChildSlot = "ScaleBoxSlot",
    ChildrenLimit = 1
})

function WGui.NScaleBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_ScaleBox" )
    return self
end

-- Sets the stretch of the scale box
---@param Stretch WGui.Stretch
function WGui.NScaleBox:SetStretch( Stretch )
    self:CallBlueprintEvent( "SetStretch", Stretch )
    return self
end

-- Sets the stretch direction of the scale box
---@param StretchDirection WGui.StretchDirection
function WGui.NScaleBox:SetStretchDirection( StretchDirection )
    self:CallBlueprintEvent( "SetStretchDirection", StretchDirection )
    return self
end

-- Sets the user specified scale of the scale box
---@param UserSpecifiedScale number
function WGui.NScaleBox:SetUserSpecifiedScale( UserSpecifiedScale )
    self:CallBlueprintEvent( "SetUserSpecifiedScale", UserSpecifiedScale )
    return self
end

-- Set Ignore Inherited Scale
---@param bInIgnoreInheritedScale boolean
function WGui.NScaleBox:SetIgnoreInheritedScale( bInIgnoreInheritedScale )
    self:CallBlueprintEvent( "SetIgnoreInheritedScale", bInIgnoreInheritedScale )
    return self
end