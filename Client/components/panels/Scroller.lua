UMG.NScroller = UMG.Inherit(UMG.PanelWidget, "NScroller", {
    ChildSlot = "ScrollerSlot",
})

function UMG.NScroller:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_ScrollBox" )

    self.NativeWidget = Widget( NativeWidget.ScrollBox )
    self:SetContentForSlot("NativeWidget", self.NativeWidget)
    self:CallBlueprintEvent("Initialize", self.NativeWidget)

    return self
end

---@param NewWheelScrollMultiplier number
function UMG.NScroller:SetWheelScrollMultiplier( NewWheelScrollMultiplier )
    self.NativeWidget:CallBlueprintEvent( "SetWheelScrollMultiplier", NewWheelScrollMultiplier )
    return self
end

---@param NewScrollWhenFocusChanges EScrollWhenFocusChanges
function UMG.NScroller:SetScrollWhenFocusChanges( NewScrollWhenFocusChanges )
    self.NativeWidget:CallBlueprintEvent( "SetScrollWhenFocusChanges", NewScrollWhenFocusChanges )
    return self
end

---@param NewScrollBarVisibility ESlateVisibility
function UMG.NScroller:SetScrollBarVisibility( NewScrollBarVisibility )
    self.NativeWidget:CallBlueprintEvent( "SetScrollBarVisibility", NewScrollBarVisibility )
    return self
end

---@param NewScrollbarThickness Vector2D
function UMG.NScroller:SetScrollbarThickness( NewScrollbarThickness )
    self.NativeWidget:CallBlueprintEvent( "SetScrollbarThickness", NewScrollbarThickness )
    return self
end

---@param NewScrollbarPadding table
function UMG.NScroller:SetScrollbarPadding( NewScrollbarPadding )
    self.NativeWidget:CallBlueprintEvent( "SetScrollbarPadding", NewScrollbarPadding )
    return self
end

---@param NewOrientation UMG.Orientation
function UMG.NScroller:SetOrientation( NewOrientation )
    self.NativeWidget:CallBlueprintEvent( "SetOrientation", NewOrientation )
    return self
end

---@param NewConsumeMouseWheel UMG.ScrollerConsumeMouseWheel
function UMG.NScroller:SetConsumeMouseWheel( NewConsumeMouseWheel )
    self.NativeWidget:CallBlueprintEvent( "SetConsumeMouseWheel", NewConsumeMouseWheel )
    return self
end

---@param bShouldAnimateWheelScrolling boolean
function UMG.NScroller:SetAnimateWheelScrolling( bShouldAnimateWheelScrolling )
    self.NativeWidget:CallBlueprintEvent( "SetAnimateWheelScrolling", bShouldAnimateWheelScrolling )
    return self
end

---@param NewAlwaysShowScrollbar boolean
function UMG.NScroller:SetAlwaysShowScrollbar( NewAlwaysShowScrollbar )
    self.NativeWidget:CallBlueprintEvent( "SetAlwaysShowScrollbar", NewAlwaysShowScrollbar )
    return self
end

---@param NewAllowOverscroll boolean
function UMG.NScroller:SetAllowOverscroll( NewAllowOverscroll )
    self.NativeWidget:CallBlueprintEvent( "SetAllowOverscroll", NewAllowOverscroll )
    return self
end

function UMG.NScroller:EndInertialScrolling()
    self.NativeWidget:CallBlueprintEvent( "EndInertialScrolling" )
    return self
end

function UMG.NScroller:SetAllowRightClickDragScrolling( bAllowRightClickDragScrolling )
    if self.Parent and self.Parent:IsValid() then
        Console.Warn("SetAllowRightClickDragScrolling should be called before adding the scroller to a parent")
        return self
    end
    self.NativeWidget:SetBlueprintPropertyValue("bAllowRightClickDragScrolling", bAllowRightClickDragScrolling)
    return self
end

function UMG.NScroller:SetAlwaysShowScrollBarTrack( bAlwaysShowScrollBarTrack )
    if self.Parent and self.Parent:IsValid() then
        Console.Warn("SetAlwaysShowScrollBarTrack should be called before adding the scroller to a parent")
        return self
    end
    self.NativeWidget:SetBlueprintPropertyValue("AlwaysShowScrollbarTrack", bAlwaysShowScrollBarTrack)
    return self
end

function UMG.NScroller:SetBackPadScrolling( bBackPadScrolling )
    if self.Parent and self.Parent:IsValid() then
        Console.Warn("SetBackPadScrolling should be called before adding the scroller to a parent")
        return self
    end
    self.NativeWidget:SetBlueprintPropertyValue("BackPadScrolling", bBackPadScrolling)
    return self
end

function UMG.NScroller:SetFrontPadScrolling( bFrontPadScrolling )
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
function UMG.NScroller:SetBrush( fBarThickness, tTopShadowBrush, tBottomShadowBrush, tLeftShadowBrush, tRightShadowBrush )
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

function UMG.NScroller:SetBarBrush( fBarThickness, tNormalBrush, tHoveredBrush, tDraggedBrush )
    self:CallBlueprintEvent("SetBarBrush", tNormalBrush or {}, tHoveredBrush or {}, tDraggedBrush or {}, fBarThickness or 9.0)
    self.BarBrush = {
        BarThickness = fBarThickness or 9.0,
        NormalBrush = tNormalBrush,
        HoveredBrush = tHoveredBrush,
        DraggedBrush = tDraggedBrush,
     }
    return self
end

function UMG.NScroller:SetVerticalBackgroundBrush( tBrush )
    self:CallBlueprintEvent("SetVerticalBrush", tBrush)
    return self
end

function UMG.NScroller:SetHorizontalBackgroundBrush( tBrush )
    self:CallBlueprintEvent("SetHorizontalBrush", tBrush)
    return self
end

function UMG.NScroller:SetVerticalBrush( tBrush )
    self:CallBlueprintEvent("SetVerticalHoverBrush", tBrush)
    return self
end

function UMG.NScroller:SetHorizontalBrush( tBrush )
    self:CallBlueprintEvent("SetHorizontalHoverBrush", tBrush)
    return self
end

function UMG.NScroller:GetBarBrush()
    return self.BarBrush
end

function UMG.NScroller:GetBrush()
    return self.Brush
end