UMG.NOverlay = UMG.Inherit(UMG.PanelWidget, "NOverlay", {
    ChildSlot = "OverlaySlot"
})

function UMG.NOverlay:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Overlay" )
    return self
end