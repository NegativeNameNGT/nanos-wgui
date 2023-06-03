UMG.NWidgetSwitcher = UMG.Inherit(UMG.PanelWidget, "NWidgetSwitcher", {
    ChildSlot = "WidgetSwitcherSlot"
})

function UMG.NWidgetSwitcher:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_WidgetSwitcher" )
    return self
end

-- Sets the active widget of the widget switcher
---@param InWidget Widget
function UMG.NWidgetSwitcher:SetActiveWidget( InWidget )
    self:CallBlueprintEvent( "SetActiveWidget", InWidget )
    return self
end

-- Sets the active widget of the widget switcher by index
---@param Index number
function UMG.NWidgetSwitcher:SetActiveWidgetIndex( Index )
    self:CallBlueprintEvent( "SetActiveWidgetIndex", Index )
    return self
end