WGui.NScroller = WGui.Inherit(WGui.PanelWidget, "NScroller", {
    ChildSlot = "ScrollerSlot",
})

function WGui.NScroller:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_ScrollBox" )

    self.NativeWidget = Widget( NativeWidget.ScrollBox )
    self:SetContentForSlot("NativeWidget", self.NativeWidget)
    self:CallBlueprintEvent("Initialize", self.NativeWidget)

    return self
end

---@param NewWheelScrollMultiplier number
function WGui.NScroller:SetWheelScrollMultiplier( NewWheelScrollMultiplier )
    self.NativeWidget:CallBlueprintEvent( "SetWheelScrollMultiplier", NewWheelScrollMultiplier )
    return self
end

---@param NewScrollWhenFocusChanges WGui.ScrollWhenFocusChanges
function WGui.NScroller:SetScrollWhenFocusChanges( NewScrollWhenFocusChanges )
    self.NativeWidget:CallBlueprintEvent( "SetScrollWhenFocusChanges", NewScrollWhenFocusChanges )
    return self
end

---@param NewScrollBarVisibility WGui.Visibility
function WGui.NScroller:SetScrollBarVisibility( NewScrollBarVisibility )
    self.NativeWidget:CallBlueprintEvent( "SetScrollBarVisibility", NewScrollBarVisibility )
    return self
end

---@param NewScrollbarThickness Vector2D
function WGui.NScroller:SetScrollBarThickness( NewScrollbarThickness )
    self.NativeWidget:CallBlueprintEvent( "SetScrollbarThickness", NewScrollbarThickness )
    return self
end

---@param NewScrollbarPadding table
function WGui.NScroller:SetScrollBarPadding( NewScrollbarPadding )
    self.NativeWidget:CallBlueprintEvent( "SetScrollbarPadding", NewScrollbarPadding )
    return self
end

---@param NewOrientation WGui.Orientation
function WGui.NScroller:SetOrientation( NewOrientation )
    self.NativeWidget:CallBlueprintEvent( "SetOrientation", NewOrientation )
    return self
end

---@param NewConsumeMouseWheel WGui.ScrollerConsumeMouseWheel
function WGui.NScroller:SetConsumeMouseWheel( NewConsumeMouseWheel )
    self.NativeWidget:CallBlueprintEvent( "SetConsumeMouseWheel", NewConsumeMouseWheel )
    return self
end

---@param bShouldAnimateWheelScrolling boolean
function WGui.NScroller:SetAnimateWheelScrolling( bShouldAnimateWheelScrolling )
    self.NativeWidget:CallBlueprintEvent( "SetAnimateWheelScrolling", bShouldAnimateWheelScrolling )
    return self
end

---@param NewAlwaysShowScrollbar boolean
function WGui.NScroller:SetAlwaysShowScrollBar( NewAlwaysShowScrollbar )
    self.NativeWidget:CallBlueprintEvent( "SetAlwaysShowScrollbar", NewAlwaysShowScrollbar )
    return self
end

---@param NewAllowOverscroll boolean
function WGui.NScroller:SetAllowOverscroll( NewAllowOverscroll )
    self.NativeWidget:CallBlueprintEvent( "SetAllowOverscroll", NewAllowOverscroll )
    return self
end

function WGui.NScroller:ScrollToStart()
    self.NativeWidget:CallBlueprintEvent( "ScrollToStart" )
    return self
end

function WGui.NScroller:ScrollToEnd()
    self.NativeWidget:CallBlueprintEvent( "ScrollToEnd" )
    return self
end

function WGui.NScroller:EndInertialScrolling()
    self.NativeWidget:CallBlueprintEvent( "EndInertialScrolling" )
    return self
end

function WGui.NScroller:SetAllowRightClickDragScrolling( bAllowRightClickDragScrolling )
    if self.Parent and self.Parent:IsValid() then
        Console.Warn("SetAllowRightClickDragScrolling should be called before adding the scroller to a parent")
        return self
    end
    self.NativeWidget:SetBlueprintPropertyValue("bAllowRightClickDragScrolling", bAllowRightClickDragScrolling)
    return self
end

function WGui.NScroller:SetAlwaysShowScrollBarTrack( bAlwaysShowScrollBarTrack )
    if self.Parent and self.Parent:IsValid() then
        Console.Warn("SetAlwaysShowScrollBarTrack should be called before adding the scroller to a parent")
        return self
    end
    self.NativeWidget:SetBlueprintPropertyValue("AlwaysShowScrollbarTrack", bAlwaysShowScrollBarTrack)
    return self
end

function WGui.NScroller:SetBackPadScrolling( bBackPadScrolling )
    if self.Parent and self.Parent:IsValid() then
        Console.Warn("SetBackPadScrolling should be called before adding the scroller to a parent")
        return self
    end
    self.NativeWidget:SetBlueprintPropertyValue("BackPadScrolling", bBackPadScrolling)
    return self
end

function WGui.NScroller:SetFrontPadScrolling( bFrontPadScrolling )
    if self.Parent and self.Parent:IsValid() then
        Console.Warn("SetFrontPadScrolling should be called before adding the scroller to a parent")
        return self
    end
    self.NativeWidget:SetBlueprintPropertyValue("FrontPadScrolling", bFrontPadScrolling)
    return self
end

---@param fBarThickness number
---@param tTopShadowBrush table
---@param tBottomShadowBrush table
---@param tLeftShadowBrush table
---@param tRightShadowBrush table
function WGui.NScroller:SetBrush( fBarThickness, tTopShadowBrush, tBottomShadowBrush, tLeftShadowBrush, tRightShadowBrush )
    if not self.Brush then self.Brush = {} end
    
    self:CallBlueprintEvent("SetBrush", fBarThickness or 9.0, tTopShadowBrush or {}, tBottomShadowBrush or {}, tLeftShadowBrush or {}, tRightShadowBrush or {})
    self.Brush = {
        BarThickness = fBarThickness or 9.0,
        TopShadowBrush = tTopShadowBrush,
        BottomShadowBrush = tBottomShadowBrush,
        LeftShadowBrush = tLeftShadowBrush,
        RightShadowBrush = tRightShadowBrush
     }
    return self
end

function WGui.NScroller:SetBarBrush( fBarThickness, tNormalBrush, tHoveredBrush, tDraggedBrush )
    self:CallBlueprintEvent("SetBarBrush", tNormalBrush or {}, tHoveredBrush or {}, tDraggedBrush or {}, fBarThickness or 9.0)
    self.BarBrush = {
        BarThickness = fBarThickness or 9.0,
        NormalBrush = tNormalBrush,
        HoveredBrush = tHoveredBrush,
        DraggedBrush = tDraggedBrush,
     }
    return self
end

function WGui.NScroller:SetVerticalBackgroundBrush( tBrush )
    self:CallBlueprintEvent("SetVerticalBrush", tBrush)
    return self
end

function WGui.NScroller:SetHorizontalBackgroundBrush( tBrush )
    self:CallBlueprintEvent("SetHorizontalBrush", tBrush)
    return self
end

function WGui.NScroller:SetVerticalBrush( tBrush )
    self:CallBlueprintEvent("SetVerticalHoverBrush", tBrush)
    return self
end

function WGui.NScroller:SetHorizontalBrush( tBrush )
    self:CallBlueprintEvent("SetHorizontalHoverBrush", tBrush)
    return self
end

function WGui.NScroller:GetBarBrush()
    return self.BarBrush
end

function WGui.NScroller:GetBrush()
    return self.Brush
end