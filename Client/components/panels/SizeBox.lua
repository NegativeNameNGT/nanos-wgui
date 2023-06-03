UMG.NSizeBox = UMG.Inherit(UMG.PanelWidget, "NSizeBox", {
    ChildSlot = "SizeBoxSlot",
    ChildrenLimit = 1
})

function UMG.NSizeBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_SizeBox" )
    return self
end
