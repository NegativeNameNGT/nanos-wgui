UMG.NBorder = UMG.Inherit(UMG.PanelWidget, "NBorder", {
    ChildrenLimit = 1,
    ChildSlot = "BorderSlot"
})

function UMG.NBorder:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Border" )
    return self
end

function UMG.NBorder:SetBrush( tBrush )
    if not self.Brush then self.Brush = {} end

    self:CallBlueprintEvent("SetBrush", tBrush)
    self.Brush = tBrush
    return self
end

function UMG.NBorder:GetBrush()
    return self.Brush or {}
end