local WidgetSwitcherSlot = RegisterChildSlot("WidgetSwitcherSlot")

-- Constructor
function WidgetSwitcherSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the horizontal alignment of the slot
---@param Alignment WGui.HAlign
function WidgetSwitcherSlot.Methods.HAlign( self, Alignment )
    self:CallBlueprintEvent("O_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function WidgetSwitcherSlot.Methods.GetHAlign( self )
    return self.Slot.HorizontalAlignment or WGui.HAlign.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment WGui.VAlign
function WidgetSwitcherSlot.Methods.VAlign( self, Alignment )
    self:CallBlueprintEvent("O_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function WidgetSwitcherSlot.Methods.GetVAlign( self )
    return self.Slot.VerticalAlignment or WGui.VAlign.Fill
end