WGui.NButton = WGui.Inherit(WGui.PanelWidget, "NButton", {
    ChildrenLimit = 1
})

function WGui.NButton:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Button" )

    self.NativeWidget = Widget(NativeWidget.Button)

    self:CallBlueprintEvent("Initialize", self.NativeWidget)

    -- Events --
    self.NativeWidget:BindBlueprintEventDispatcher("OnClicked", function()
        if self.OnClicked then
            self:OnClicked()
        end
    end)

    self.NativeWidget:BindBlueprintEventDispatcher("OnHovered", function()
        if self.OnHovered then
            self:OnHovered()
        end
    end)

    self.NativeWidget:BindBlueprintEventDispatcher("OnUnhovered", function()
        if self.OnUnhovered then
            self:OnUnhovered()
        end
    end)

    self.NativeWidget:BindBlueprintEventDispatcher("OnPressed", function()
        if self.OnPressed then
            self:OnPressed()
        end
    end)

    self.NativeWidget:BindBlueprintEventDispatcher("OnReleased", function()
        if self.OnReleased then
            self:OnReleased()
        end
    end)

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