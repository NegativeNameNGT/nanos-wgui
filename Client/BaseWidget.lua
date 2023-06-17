local tPaintableWidgets = {}

WGui.BaseWidget = Widget.Inherit("BaseWidget")

WGui.BaseWidget.Overridables = {
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

WGui.Bindables = {
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

WGui.BaseWidget.Subscribe("Spawn", function ( self )
    for k,v in pairs(WGui.BaseWidget.Overridables) do
        self[k] = v
    end
end)


Client.Subscribe("Tick", function ()
    -- Paint update
    for v,_ in pairs(tPaintableWidgets) do
        if v.Paint then
            v:SetValue("INTERNAL_Draw", { Lines = {}, Splines = {} })
            v.Paint()
        end
    end
end)

function WGui.BaseWidget:GetID()
    return self.ID
end

function WGui.BaseWidget:AddBindable( sName, sEvent, CustomWidget )
    if not self.Bindables then self.Bindables = {} end
    self.Bindables[sName] = {sEvent, CustomWidget}
end

local function GetBindable( self, sKey )
    if WGui.Bindables[sKey] then
        return {WGui.Bindables[sKey], self}
    end

    if self.Bindables and self.Bindables[sKey] then
        return self.Bindables[sKey]
    end

    return nil
end

function WGui.BaseWidget:newindex( sKey, xValue )
    local Bindable = GetBindable(self, sKey)
    if Bindable then
        if not self.BindedEvents then self.BindedEvents = {} end
        if self.BindedEvents[sKey] then
           Bindable[2]:UnbindBlueprintEventDispatcher(Bindable[1], self.BindedEvents[sKey])
        end

        local function Bind( _, ... )
            if type(self[sKey]) == "function" then
                self[sKey](...)
                return
            end
            Bindable[2]:UnbindBlueprintEventDispatcher(Bindable[1], self.BindedEvents[sKey])
        end
        Bindable[2]:BindBlueprintEventDispatcher(Bindable[1], Bind)
        
        self.BindedEvents[sKey] = Bind
    end
    rawset(self, sKey, xValue)
end

function WGui.BaseWidget:SetDragKey( sKey )
    self:SetBlueprintPropertyValue( "DragKey", sKey )
    return self
end

---@param sTag string
---@param ePayload Widget
---@param eDragVisual Widget
---@param Pivot WGui.DragPivot
---@param tOffset Vector2D
function WGui.BaseWidget:CreateDragDropOperation( sTag, ePayload, eDragVisual, Pivot, tOffset )
    self:CallBlueprintEvent("CreateDragDropOperation", sTag or "", ePayload or nil, eDragVisual or nil, Pivot or 0, tOffset or Vector2D())
end

function WGui.BaseWidget:SetRenderPaint( bRenderPaint )
    if bRenderPaint then
        tPaintableWidgets[self] = 0
    else
        tPaintableWidgets[self] = nil
    end
end

function WGui.BaseWidget:DrawLine( tStart, tEnd, tTintColor, fThickness )
    local tDraw = self:GetValue("INTERNAL_Draw")
    table.insert(tDraw.Lines, { PosA = tStart, PosB = tEnd, Tint = tTintColor, Thickness = fThickness})
    self:SetValue("INTERNAL_Draw", tDraw)

    self:SetBlueprintPropertyValue("Draw", tDraw)
    return self
end

function WGui.BaseWidget:DrawSpline( tStart, tStartDir, tEnd, tEndDir, tTintColor, fThickness )
    local tDraw = self:GetValue("INTERNAL_Draw")
    table.insert(tDraw.Splines, { Start = tStart, StartDir = tStartDir, End = tEnd, EndDir = tEndDir, Tint = tTintColor, Thickness = fThickness})
    self:SetValue("INTERNAL_Draw", tDraw)

    self:SetBlueprintPropertyValue("Draw", tDraw)
    return self
end

-- Sets the padding of the widget
---@param tPadding table
function WGui.BaseWidget:SetPadding(tPadding)
    self:CallBlueprintEvent("SetPadding", tPadding)
    self.Padding = tPadding
    return self
end

-- Gets the padding of the widget
---@return table
function WGui.BaseWidget:GetPadding()
    return self.Padding or { Left = 0, Top = 0, Right = 0, Bottom = 0 }
end

---@param ToolTip string
function WGui.BaseWidget:SetToolTipText(ToolTip)
    self:CallBlueprintEvent("SetToolTipText", ToolTip)
    return self
end

---@param ToolTipWidget WGui.BaseWidget
function WGui.BaseWidget:SetToolTipWidget(ToolTipWidget)
    self:CallBlueprintEvent("SetToolTip", ToolTipWidget)
    return self
end

---@param fAngle number
function WGui.BaseWidget:SetAngle( fAngle )
    self:CallBlueprintEvent("SetRenderTransformAngle", fAngle)
    self.RenderTransformAngle = fAngle
    return self
end

function WGui.BaseWidget:GetAngle()
    return self.RenderTransformAngle or 0
end

---@param Shear Vector2D
function WGui.BaseWidget:SetShear( Shear )
    self:CallBlueprintEvent("SetRenderShear", Shear)
    self.RenderShear = Shear
    return self
end

function WGui.BaseWidget:GetShear()
    return self.RenderShear or Vector2D()
end

---@param Scale Vector2D
function WGui.BaseWidget:SetScale( Scale )
    self:CallBlueprintEvent("SetRenderScale", Scale)
    self.RenderScale = Scale
    return self
end

function WGui.BaseWidget:GetScale()
    return self.RenderScale or Vector2D(1,1)
end

---@param Opacity number
function WGui.BaseWidget:SetOpacity( Opacity )
    self:CallBlueprintEvent("SetRenderOpacity", Opacity)
    self.RenderOpacity = Opacity
    return self
end

function WGui.BaseWidget:GetOpacity()
    return self.RenderOpacity or 1
end

---@param Color Color
function WGui.BaseWidget:SetColorAndOpacity( Color )
    self:CallBlueprintEvent("SetColorAndOpacity", Color)
    return self
end

---@param IsEnabled boolean
function WGui.BaseWidget:SetIsEnabled( IsEnabled )
    self:CallBlueprintEvent("SetIsEnabled", IsEnabled)
    self.IsEnabled = IsEnabled
    return self
end

---@return boolean
function WGui.BaseWidget:GetIsEnabled()
    return self.IsEnabled or true
end

---@param Cursor CursorType
function WGui.BaseWidget:SetCursor( Cursor )
    self:CallBlueprintEvent("SetCursor", Cursor)
    return self
end

---@param Clipping WGui.Clipping
function WGui.BaseWidget:SetClipping( Clipping )
    self:CallBlueprintEvent("SetClipping", Clipping)
    return self
end

function WGui.BaseWidget:RemoveFromParent()
    if self.Parent then
        self.Parent:RemoveChild(self)
    end
    return self
end

function WGui.BaseWidget:SetVisibility( Visibility )
    self:CallBlueprintEvent("SetVisibility", Visibility)
    return self
end

function WGui.BaseWidget:GetVisibility()
    return self.Visibility or WGui.Visibility.Visible
end

---@return boolean IsVisible
function WGui.BaseWidget:IsVisible()
    return self:GetVisibility() == WGui.Visibility.Visible or WGui.NotHitTestableAll or WGui.NotHitTestableSelf
end

---@return boolean IsHovered
function WGui.BaseWidget:IsHovered()
    return self:CallBlueprintEvent("IsHovered")
end

---@return Widget | nil
function WGui.BaseWidget:GetParent()
    return WGui.GetByID(self.Parent)
end

Package.Require( "WidgetAnimation.lua" )