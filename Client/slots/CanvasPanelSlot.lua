local CanvasPanelSlot = RegisterChildSlot("CanvasPanelSlot")

-- Sets the position of the slot
---@param Position Vector2D
function CanvasPanelSlot.Methods.SetPos( self, Position )
    self:CallBlueprintEvent("SetPos", Position)
    self.Slot.Position = Position
    return self
end

-- Gets the position of the slot
---@return Vector2D
function CanvasPanelSlot.Methods.GetPos( self )
    return self.Slot.Position or Vector2D()
end

-- Sets the size of the slot
---@param Size Vector2D
function CanvasPanelSlot.Methods.SetSize( self, Size )
    self:CallBlueprintEvent("SetSize", Size)
    self.Slot.Size = Size
    return self
end

-- Gets the size of the slot
---@return Vector2D
function CanvasPanelSlot.Methods.GetSize( self )
    return self.Slot.Size or Vector2D(100, 40)
end

-- Sets the ZOrder of the slot
---@param ZOrder number
function CanvasPanelSlot.Methods.SetZOrder( self, ZOrder )
    self:CallBlueprintEvent("SetZOrder", ZOrder)
    self.Slot.ZOrder = ZOrder
    return self
end

-- Gets the ZOrder of the slot
---@return number
function CanvasPanelSlot.Methods.GetZOrder( self )
    return self.Slot.ZOrder or 0
end

-- Sets the alignment of the slot
---@param Alignment Vector2D
function CanvasPanelSlot.Methods.SetAlignment( self, Alignment )
    self:CallBlueprintEvent("SetAlignment", Alignment)
    self.Slot.Alignment = Alignment
    return self
end

-- Gets the alignment of the slot
---@return Vector2D
function CanvasPanelSlot.Methods.GetAlignment( self )
    return self.Slot.Alignment or Vector2D()
end

-- Sets the anchor of the slot
---@param Anchor table
function CanvasPanelSlot.Methods.SetAnchor( self, Anchor )
    self:SetPos(Vector2D())
    self:CallBlueprintEvent("SetAnchor", Anchor.Min, Anchor.Max)
    self:SetAlignment( Anchor.Alignment )

    print(self:GetSize().Y)
    if Anchor.bResetOffsetRight then
        self:SetSize(Vector2D(0, self:GetSize().Y))
    end

    if Anchor.bResetOffsetBottom then
        self:SetSize(Vector2D(self:GetSize().X, 0))
    end

    self.Slot.Anchor = Anchor
    return self
end

-- Gets the anchor of the slot
---@return table
function CanvasPanelSlot.Methods.GetAnchor( self )
    return {Min = self.Slot.Anchor.Min, Max = self.Slot.Anchor.Max} or {Vector2D(), Vector2D()}
end

-- Sizes the slot to the content
function CanvasPanelSlot.Methods.SizeToContent( self )
    self:CallBlueprintEvent("SetAutoSize", true)
    return self
end

-- Disables the auto size of the slot
function CanvasPanelSlot.Methods.DisableAutoSize( self )
    self:CallBlueprintEvent("SetAutoSize", false)
    return self
end
