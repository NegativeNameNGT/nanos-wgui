WGui.NBlur = WGui.Inherit(WGui.PanelWidget, "NBlur", {
    ChildrenLimit = 1,
    ChildSlot = "BlurSlot"
})

function WGui.NBlur:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_BackgroundBlur" )
    return self
end

function WGui.NBlur:SetBlurStrength( fBlurStrength )
    self:CallBlueprintEvent("SetBlurStrength", fBlurStrength)
    return self
end

function WGui.NBlur:SetApplyAlphaToBlur( bApplyAlphaToBlur )
    self:CallBlueprintEvent("SetApplyAlphaToBlur", bApplyAlphaToBlur)
    return self
end

function WGui.NBlur:SetBlurRadius( iBlurRadius )
    self:CallBlueprintEvent("SetBlurRadius", iBlurRadius)
    return self
end

function WGui.NBlur:SetCornerRadius( tCornerRadius )
    self:CallBlueprintEvent("SetCornerRadius", tCornerRadius)
    return self
end

