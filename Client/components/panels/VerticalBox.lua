WGui.NVerticalBox = WGui.Inherit(WGui.PanelWidget, "NVerticalBox", {
    ChildSlot = "VerticalBoxSlot"
})

function WGui.NVerticalBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_VerticalBox" )
    return self
end