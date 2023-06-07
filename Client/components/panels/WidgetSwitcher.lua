WGui.NWidgetSwitcher = WGui.Inherit(WGui.PanelWidget, "NWidgetSwitcher", {
    ChildSlot = "WidgetSwitcherSlot"
})

function WGui.NWidgetSwitcher:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_WidgetSwitcher" )
    return self
end

-- Sets the active widget of the widget switcher
---@param InWidget Widget
function WGui.NWidgetSwitcher:SetActiveWidget( InWidget )
    self:CallBlueprintEvent( "SetActiveWidget", InWidget )
    return self
end

-- Sets the active widget of the widget switcher by index
---@param Index number
function WGui.NWidgetSwitcher:SetActiveWidgetIndex( Index )
    self:CallBlueprintEvent( "SetActiveWidgetIndex", Index )
    return self
end