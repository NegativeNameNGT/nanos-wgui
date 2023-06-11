WGui.NBorder = WGui.Inherit(WGui.PanelWidget, "NBorder", {
    ChildrenLimit = 1,
    ChildSlot = "BorderSlot"
})

function WGui.NBorder:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Border" )
    return self
end

function WGui.NBorder:SetBrush( tBrush )
    if not self.Brush then self.Brush = {} end

    self:CallBlueprintEvent("SetBrush", tBrush)
    self.Brush = tBrush
    return self
end

function WGui.NBorder:GetBrush()
    return self.Brush or {}
end