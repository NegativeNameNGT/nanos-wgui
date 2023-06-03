local GridSlot = RegisterChildSlot("GridSlot")

-- Constructor
function GridSlot.Constructor( Parent )
    Parent.Slot = {}
end

-- Sets the column of the slot
---@param Column number
function GridSlot.Methods.SetColumn( self, Column )
    self:CallBlueprintEvent("G_SetColumn", Column)
    self.Slot.Column = Column
    return self
end

-- Gets the column of the slot
---@return number
function GridSlot.Methods.GetColumn( self )
    return self.Slot.Column or 0
end

-- Sets the row of the slot
---@param Row number
function GridSlot.Methods.SetRow( self, Row )
    self:CallBlueprintEvent("G_SetRow", Row)
    self.Slot.Row = Row
    return self
end

-- Gets the row of the slot
---@return number
function GridSlot.Methods.GetRow( self )
    return self.Slot.Row or 0
end

-- Sets the column span of the slot
---@param ColumnSpan number
function GridSlot.Methods.SetColumnSpan( self, ColumnSpan )
    self:CallBlueprintEvent("G_SetColumnSpan", ColumnSpan)
    self.Slot.ColumnSpan = ColumnSpan
    return self
end

-- Gets the column span of the slot
---@return number
function GridSlot.Methods.GetColumnSpan( self )
    return self.Slot.ColumnSpan or 1
end

-- Sets the row span of the slot
---@param RowSpan number
function GridSlot.Methods.SetRowSpan( self, RowSpan )
    self:CallBlueprintEvent("G_SetRowSpan", RowSpan)
    self.Slot.RowSpan = RowSpan
    return self
end

-- Gets the row span of the slot
---@return number
function GridSlot.Methods.GetRowSpan( self )
    return self.Slot.RowSpan or 1
end

-- Sets the horizontal alignment of the slot
---@param Alignment UMG.HorizontalAlignment
function GridSlot.Methods.SetHorizontalAlignment( self, Alignment )
    self:CallBlueprintEvent("G_SetHorizontalAlignment", Alignment)
    self.Slot.HorizontalAlignment = Alignment
    return self
end

-- Gets the horizontal alignment of the slot
---@return number
function GridSlot.Methods.GetHorizontalAlignment( self )
    return self.Slot.HorizontalAlignment or UMG.HorizontalAlignment.Fill
end

-- Sets the vertical alignment of the slot
---@param Alignment UMG.VerticalAlignment
function GridSlot.Methods.SetVerticalAlignment( self, Alignment )
    self:CallBlueprintEvent("G_SetVerticalAlignment", Alignment)
    self.Slot.VerticalAlignment = Alignment
    return self
end

-- Gets the vertical alignment of the slot
---@return number
function GridSlot.Methods.GetVerticalAlignment( self )
    return self.Slot.VerticalAlignment or UMG.VerticalAlignment.Fill
end

-- Sets the layer of the slot
---@param Layer number
function GridSlot.Methods.SetLayer( self, Layer )
    self:CallBlueprintEvent("G_SetLayer", Layer)
    self.Slot.Layer = Layer
    return self
end

-- Gets the layer of the slot
---@return number
function GridSlot.Methods.GetLayer( self )
    return self.Slot.Layer or 0
end

-- Sets the nudge of the slot
---@param Nudge Vector2D
function GridSlot.Methods.SetNudge( self, Nudge )
    self:CallBlueprintEvent("G_SetNudge", Nudge)
    self.Slot.Nudge = Nudge
    return self
end

-- Gets the nudge of the slot
---@return Vector2D
function GridSlot.Methods.GetNudge( self )
    return self.Slot.Nudge or Vector2D(0, 0)
end