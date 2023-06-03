UMG.NGrid = UMG.Inherit(UMG.PanelWidget, "NGrid", {
    ChildSlot = "GridSlot"
})

function UMG.NGrid:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Grid" )
    return self
end

local NativeAdd = UMG.NGrid.Add
function UMG.NGrid:Add( eWidget, iInRow, iInColumn )
    NativeAdd(self, eWidget, {iInRow, iInColumn})
    return self
end