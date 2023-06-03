UMG.NBlur = UMG.Inherit(UMG.PanelWidget, "NBlur", {
    ChildrenLimit = 1,
    ChildSlot = "BlurSlot"
})

function UMG.NBlur:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_BackgroundBlur" )
    return self
end

function UMG.NBlur:SetBlurStrength( fBlurStrength )
    self:CallBlueprintEvent("SetBlurStrength", fBlurStrength)
    return self
end

function UMG.NBlur:SetApplyAlphaToBlur( bApplyAlphaToBlur )
    self:CallBlueprintEvent("SetApplyAlphaToBlur", bApplyAlphaToBlur)
    return self
end

function UMG.NBlur:SetBlurRadius( iBlurRadius )
    self:CallBlueprintEvent("SetBlurRadius", iBlurRadius)
    return self
end

function UMG.NBlur:SetCornerRadius( tCornerRadius )
    self:CallBlueprintEvent("SetCornerRadius", tCornerRadius)
    return self
end

