WGui.NCheckBox = WGui.Inherit(WGui.PanelWidget, "NCheckBox", {
    ChildrenLimit = 1
})

function WGui.NCheckBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_CheckBox" )

    self:BindBlueprintEventDispatcher("OnChecked", function(self, bIsChecked)
        self.IsChecked = bIsChecked
        if self.OnChecked then
            self.OnChecked(bIsChecked)
        end
    end)
    return self
end

function WGui.NCheckBox:SetIsChecked(bIsChecked)
    self:CallBlueprintEvent("SetIsChecked", bIsChecked)
    self.IsChecked = bIsChecked
    return self
end

function WGui.NCheckBox:GetIsChecked()
    return self.IsChecked or false
end

function WGui.NCheckBox:SetBrush( tImage, tHoveredImage, tPressedImage )
    if not self.Brush then self.Brush = {} end
    
    local tBrush = self:GetBrush()

    self:CallBlueprintEvent("SetBrush", tImage or {}, tHoveredImage or {}, tPressedImage or {})
    self.Brush = {
        Normal = tImage or tBrush.Normal,
        Pressed = tPressedImage or tBrush.Pressed,
        Hovered = tHoveredImage or tBrush.Hovered,
    }
    return self
end

function WGui.NCheckBox:GetBrush()
    return self.Brush or {}
end

function WGui.NCheckBox:SetUncheckedBrush( tImage, tHoveredImage, tPressedImage )
    if not self.UncheckedBrush then self.UncheckedBrush = {} end
    
    local tBrush = self:GetUncheckedBrush()

    self:CallBlueprintEvent("SetUncheckedBrush", tImage or {}, tHoveredImage or {}, tPressedImage or {})
    self.UncheckedBrush = {
        Normal = tImage or tBrush.Normal,
        Pressed = tPressedImage or tBrush.Pressed,
        Hovered = tHoveredImage or tBrush.Hovered,
    }
    return self
end

function WGui.NCheckBox:GetUncheckedBrush()
    return self.UncheckedBrush or {}
end

function WGui.NCheckBox:SetCheckedBrush( tImage, tHoveredImage, tPressedImage )
    if not self.CheckedBrush then self.CheckedBrush = {} end
    
    local tBrush = self:GetCheckedBrush()

    self:CallBlueprintEvent("SetCheckedBrush", tImage or {}, tHoveredImage or {}, tPressedImage or {})
    self.CheckedBrush = {
        Normal = tImage or tBrush.Normal,
        Pressed = tPressedImage or tBrush.Pressed,
        Hovered = tHoveredImage or tBrush.Hovered,
    }
    return self
end

function WGui.NCheckBox:GetCheckedBrush()
    return self.CheckedBrush or {}
end