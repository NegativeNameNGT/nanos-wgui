WGui.NCanvas = WGui.Inherit(WGui.PanelWidget, "NCanvas", {
    ChildSlot = "CanvasPanelSlot"
})

function WGui.NCanvas:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Canvas" )
    self:AddToViewport()
    return self
end
