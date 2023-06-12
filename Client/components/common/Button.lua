WGui.NButton = WGui.Inherit(WGui.PanelWidget, "NButton", {
    ChildrenLimit = 1
})

function WGui.NButton:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Button" )

    self.NativeWidget = Widget(NativeWidget.Button)

    self:CallBlueprintEvent("Initialize", self.NativeWidget)

    -- Events --
    self:AddBindable("OnClicked", "OnClicked", self.NativeWidget)
    self:AddBindable("OnHovered", "OnHovered", self.NativeWidget)
    self:AddBindable("OnUnhovered", "OnUnhovered", self.NativeWidget)
    self:AddBindable("OnPressed", "OnPressed", self.NativeWidget)
    self:AddBindable("OnReleased", "OnReleased", self.NativeWidget)

    return self
end


function WGui.NButton:SetBrush( tNormalBrush, tPressedBrush, tHoveredBrush )
    if not self.Brush then self.Brush = {} end
    
    local tBrush = self:GetBrush()

    self:CallBlueprintEvent("SetBrush", tNormalBrush or {}, tPressedBrush or {}, tHoveredBrush or {})
    self.Brush = {
        Normal = tNormalBrush or tBrush.Normal,
        Pressed = tPressedBrush or tBrush.Pressed,
        Hovered = tHoveredBrush or tBrush.Hovered,
    }
    return self
end

function WGui.NButton:GetBrush()
    return self.Brush
end