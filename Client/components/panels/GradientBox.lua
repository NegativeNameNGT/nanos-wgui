WGui.NLinearGradient = WGui.Inherit(WGui.PanelWidget, "NLinearGradient", {
    ChildrenLimit = 1
})

function WGui.NLinearGradient:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_GradientPanel" )
    return self
end

function WGui.NLinearGradient:SetFromColor( tColor )
    self:CallBlueprintEvent("SetFromColor", tColor)
    return self
end

function WGui.NLinearGradient:SetToColor( tColor )
    self:CallBlueprintEvent("SetToColor", tColor)
    return self
end

function WGui.NLinearGradient:SetDirection( fDirection )
    self:CallBlueprintEvent("SetDirection", fDirection)
    return self
end