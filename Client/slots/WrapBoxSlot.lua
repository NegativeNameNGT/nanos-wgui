local WrapBoxSlot = RegisterChildSlot("WrapBoxSlot")

-- Constructor
function WrapBoxSlot.Constructor( Parent )
    Parent.Slot = {}
end

function WrapBoxSlot.Methods.SetFillEmptySpace( self, FillEmptySpace )
    self:CallBlueprintEvent("WB_SetFillEmptySpace", FillEmptySpace)
    return self
end

function WrapBoxSlot.Methods.SetFillSpanWhenLessThan( self, FillSpanWhenLessThan )
    self:CallBlueprintEvent("WB_SetFillSpanWhenLessThan", FillSpanWhenLessThan)
    return self
end

function WrapBoxSlot.Methods.SetHorizontalAlignment( self, Alignment )
    self:CallBlueprintEvent("WB_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

function WrapBoxSlot.Methods.GetHorizontalAlignment( self )
    return self.Slot.HorizontalAlignment or UMG.HorizontalAlignment.Fill
end

function WrapBoxSlot.Methods.SetVerticalAlignment( self, Alignment )
    self:CallBlueprintEvent("WB_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

function WrapBoxSlot.Methods.GetVerticalAlignment( self )
    return self.Slot.VerticalAlignment or UMG.VerticalAlignment.Fill
end

function WrapBoxSlot.Methods.SetNewLine( self, NewLine )
    self:CallBlueprintEvent("WB_SetNewLine", NewLine)
    return self
end