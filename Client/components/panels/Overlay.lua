WGui.NOverlay = WGui.Inherit(WGui.PanelWidget, "NOverlay", {
    ChildSlot = "OverlaySlot"
})

function WGui.NOverlay:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Overlay" )
    return self
end