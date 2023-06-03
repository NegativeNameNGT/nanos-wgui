UMG.NCanvas = UMG.Inherit(UMG.PanelWidget, "NCanvas", {
    ChildSlot = "CanvasPanelSlot"
})

function UMG.NCanvas:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Canvas" )
    self:AddToViewport()
    return self
end
