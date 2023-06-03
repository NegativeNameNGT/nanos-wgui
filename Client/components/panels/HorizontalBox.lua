UMG.NHorizontalBox = UMG.Inherit(UMG.PanelWidget, "NHorizontalBox", {
    ChildSlot = "HorizontalBoxSlot"
})

function UMG.NHorizontalBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_HorizontalBox" )
    return self
end