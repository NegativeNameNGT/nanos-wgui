WGui.NHorizontalBox = WGui.Inherit(WGui.PanelWidget, "NHorizontalBox", {
    ChildSlot = "HorizontalBoxSlot"
})

function WGui.NHorizontalBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_HorizontalBox" )
    return self
end