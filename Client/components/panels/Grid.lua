WGui.NGrid = WGui.Inherit(WGui.PanelWidget, "NGrid", {
    ChildSlot = "GridSlot"
})

function WGui.NGrid:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Grid" )
    return self
end

local NativeAdd = WGui.NGrid.Add
function WGui.NGrid:Add( eWidget, iInRow, iInColumn )
    self.Slot.Column = iInColumn
    self.Slot.Row = iInRow
    NativeAdd(self, eWidget, {iInRow, iInColumn})
    return self
end