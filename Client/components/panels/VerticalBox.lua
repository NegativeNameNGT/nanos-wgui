UMG.NVerticalBox = UMG.Inherit(UMG.PanelWidget, "NVerticalBox", {
    ChildSlot = "VerticalBoxSlot"
})

function UMG.NVerticalBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_VerticalBox" )
    return self
end