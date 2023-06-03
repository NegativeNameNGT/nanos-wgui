local tPaintableWidgets = {}

UMG.BaseWidget = Widget.Inherit("BaseWidget")

UMG.BaseWidget.Overridables = {
    -- Uses Render Translation instead
    SetPos = function (self, tTranslation)
        self:CallBlueprintEvent("SetRenderTranslation", tTranslation)
        self.RenderTranslation = tTranslation
        return self
    end,

    GetPos = function (self)
        return self.RenderTranslation or Vector2D()
    end
}

UMG.BaseWidget.Bindables = {
    OnMouseMove = "MouseMove",
    OnMouseButtonDown = "MouseButtonDown",
    OnMouseButtonUp = "MouseButtonUp",
    OnMouseEnter = "MouseEnter",
    OnMouseLeave = "MouseLeave",
    OnMouseWheel = "MouseWheel",
    OnFocusReceived = "FocusReceived",
    OnFocusLost = "FocusLost",
    OnDragDetected = "DragDetected",
    OnDragEnter = "DragEnter",
    OnDragLeave = "DragLeave",
    OnDragDrop = "DragDrop",
    OnDragCancelled = "DragCancelled",
}

UMG.BaseWidget.Subscribe("Spawn", function ( self )
    for k,v in pairs(UMG.BaseWidget.Overridables) do
        self[k] = v
    end
end)


Client.Subscribe("Tick", function ()
    for v,_ in pairs(tPaintableWidgets) do
        if v.Paint then
            v:SetValue("INTERNAL_Draw", { Lines = {}, Splines = {} })
            v.Paint()
        end
    end
end)

function UMG.BaseWidget:AddBindable( sName, sEvent )
    self.Bindables[sName] = sEvent
end

function UMG.BaseWidget:newindex( sKey, xValue )
    if self.Bindables[sKey] then
        if type( xValue ) == "function" then
            self:UnbindBlueprintEventDispatcher( self.Bindables[sKey] )

            self:BindBlueprintEventDispatcher( self.Bindables[sKey], function ( eSelf, ...)
                if type(eSelf[sKey]) == "function" then
                    eSelf[sKey](...)
                else
                    eSelf:UnbindBlueprintEventDispatcher( eSelf.Bindables[sKey] )
                end
            end )
        end
    end
    rawset(self, sKey, xValue)
end

function UMG.BaseWidget:SetDragKey( sKey )
    self:SetBlueprintPropertyValue( "DragKey", sKey )
    return self
end

---@param sTag string
---@param ePayload Widget
---@param eDragVisual Widget
---@param Pivot UMG.DragPivot
---@param tOffset Vector2D
function UMG.BaseWidget:CreateDragDropOperation( sTag, ePayload, eDragVisual, Pivot, tOffset )
    self:CallBlueprintEvent("CreateDragDropOperation", sTag or "", ePayload or nil, eDragVisual or nil, Pivot or 0, tOffset or Vector2D())
end

function UMG.BaseWidget:SetRenderPaint( bRenderPaint )
    if bRenderPaint then
        tPaintableWidgets[self] = 0
    else
        tPaintableWidgets[self] = nil
    end
end

function UMG.BaseWidget:DrawLine( tStart, tEnd, tTintColor, fThickness )
    local tDraw = self:GetValue("INTERNAL_Draw")
    table.insert(tDraw.Lines, { PosA = tStart, PosB = tEnd, Tint = tTintColor, Thickness = fThickness})
    self:SetValue("INTERNAL_Draw", tDraw)

    self:SetBlueprintPropertyValue("Draw", tDraw)
    return self
end

function UMG.BaseWidget:DrawSpline( tStart, tStartDir, tEnd, tEndDir, tTintColor, fThickness )
    local tDraw = self:GetValue("INTERNAL_Draw")
    table.insert(tDraw.Splines, { Start = tStart, StartDir = tStartDir, End = tEnd, EndDir = tEndDir, Tint = tTintColor, Thickness = fThickness})
    self:SetValue("INTERNAL_Draw", tDraw)

    self:SetBlueprintPropertyValue("Draw", tDraw)
    return self
end

-- Sets the padding of the widget
---@param tPadding table
function UMG.BaseWidget:SetPadding(tPadding)
    self:CallBlueprintEvent("SetPadding", tPadding)
    self.Padding = tPadding
    return self
end

-- Gets the padding of the widget
---@return table
function UMG.BaseWidget:GetPadding()
    return self.Padding or { Left = 0, Top = 0, Right = 0, Bottom = 0 }
end

function UMG.BaseWidget:GetVisibility()
    return self.Visibility or UMG.Visibility.Visible
end

---@param ToolTip string
function UMG.BaseWidget:SetToolTipText(ToolTip)
    self:CallBlueprintEvent("SetToolTipText", ToolTip)
    return self
end

---@param ToolTipWidget UMG.BaseWidget
function UMG.BaseWidget:SetToolTipWidget(ToolTipWidget)
    self:CallBlueprintEvent("SetToolTip", ToolTipWidget)
    return self
end

---@param fAngle number
function UMG.BaseWidget:SetAngle( fAngle )
    self:CallBlueprintEvent("SetRenderTransformAngle", fAngle)
    return self
end

---@param Shear Vector2D
function UMG.BaseWidget:SetShear( Shear )
    self:CallBlueprintEvent("SetRenderShear", Shear)
    return self
end

---@param Scale Vector2D
function UMG.BaseWidget:SetScale( Scale )
    self:CallBlueprintEvent("SetRenderScale", Scale)
    return self
end

---@param Opacity number
function UMG.BaseWidget:SetOpacity( Opacity )
    self:CallBlueprintEvent("SetRenderOpacity", Opacity)
    return self
end

---@param Color Li²arColor
function UMG.BaseWidget:SetColorAndOpacity( Color )
    self:CallBlueprintEvent("SetColorAndOpacity", Color)
    return self
end

---@param IsEnabled boolean
function UMG.BaseWidget:SetEnabled( IsEnabled )
    self:CallBlueprintEvent("SetIsEnabled", IsEnabled)
    return self
end

---@param Cursor CursorType
function UMG.BaseWidget:SetCursor( Cursor )
    self:CallBlueprintEvent("SetCursor", Cursor)
    return self
end

---@param Clipping UMG.Clipping
function UMG.BaseWidget:SetClipping( Clipping )
    self:CallBlueprintEvent("SetClipping", Clipping)
    return self
end

---@return boolean IsVisible
function UMG.BaseWidget:IsVisible()
    return self:GetVisibility() == UMG.Visibility.Visible or UMG.NotHitTestableAll or UMG.NotHitTestableSelf
end

---@return boolean IsHovered
function UMG.BaseWidget:IsHovered()
    return self:CallBlueprintEvent("IsHovered")
end

---@return Widget | nil
function UMG.BaseWidget:GetParent()
    return self.Parent
end

-- PanelWidget
UMG.PanelWidget = UMG.BaseWidget.Inherit("PanelWidget")

function UMG.PanelWidget:GetAllChildren()
    return self:GetValue("INTERNAL_Children", {})
end

function UMG.PanelWidget:Add(eChild, ...)
    -- Checks if the panel reached the children limit
    if self.ChildrenLimit then
        if #self:GetAllChildren() >= self.ChildrenLimit then
            assert(false, "Cannot add more children to this panel widget, limit reached.")
            return
        end
    end

    if ... then
        self:CallBlueprintEvent("AddChild", eChild, table.unpack(...))
    else
        self:CallBlueprintEvent("AddChild", eChild)
    end

    -- Removes the slot's methods from the previous parent
    if eChild.Parent then
        if eChild.Parent.ChildSlot and eChild.Parent.ChildSlot ~= self.ChildSlot then
           local tChildSlot = GetChildSlot(eChild.Parent.ChildSlot)
           for k,_ in pairs(tChildSlot.Methods) do
               eChild[k] = nil
           end

           for k,v in pairs(UMG.BaseWidget.Overridables) do
                if not eChild[k] then
                    eChild[k] = v
                end
           end
        end
    end

    eChild.Parent = self

    if self.ChildSlot then
        local tChildSlot = GetChildSlot(self.ChildSlot)
        for k,v in pairs(tChildSlot.Methods) do
            eChild[k] = v
        end
        tChildSlot.Constructor( eChild )
    end

    local tChildren = self:GetAllChildren()
    table.insert(tChildren, eChild)
    self:SetValue("INTERNAL_Children", tChildren)
end