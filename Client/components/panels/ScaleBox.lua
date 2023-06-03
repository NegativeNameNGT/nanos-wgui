UMG.NScaleBox = UMG.Inherit(UMG.PanelWidget, "NScaleBox", {
    ChildSlot = "ScaleBoxSlot",
    ChildrenLimit = 1
})

function UMG.NScaleBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_ScaleBox" )
    return self
end

-- Sets the stretch of the scale box
---@param Stretch UMG.Stretch
function UMG.NScaleBox:SetStretch( Stretch )
    self:CallBlueprintEvent( "SetStretch", Stretch )
    return self
end

-- Sets the stretch direction of the scale box
---@param StretchDirection UMG.StretchDirection
function UMG.NScaleBox:SetStretchDirection( StretchDirection )
    self:CallBlueprintEvent( "SetStretchDirection", StretchDirection )
    return self
end

-- Sets the user specified scale of the scale box
---@param UserSpecifiedScale number
function UMG.NScaleBox:SetUserSpecifiedScale( UserSpecifiedScale )
    self:CallBlueprintEvent( "SetUserSpecifiedScale", UserSpecifiedScale )
    return self
end

-- Set Ignore Inherited Scale
---@param bInIgnoreInheritedScale boolean
function UMG.NScaleBox:SetIgnoreInheritedScale( bInIgnoreInheritedScale )
    self:CallBlueprintEvent( "SetIgnoreInheritedScale", bInIgnoreInheritedScale )
    return self
end