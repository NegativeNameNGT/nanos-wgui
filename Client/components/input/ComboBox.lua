UMG.NComboBox = UMG.Inherit(UMG.BaseWidget, "NComboBox" )

function UMG.NComboBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_ComboBox" )
    self.Options = {}

    self:BindBlueprintEventDispatcher( "OnSelectionChanged", function( _, sSelectedItem, iSelectedType )
        self.SelectedOption = sSelectedItem
        if self.OnSelectionChanged then
            self.OnSelectionChanged( sSelectedItem, iSelectedType )
        end
    end)

    self:BindBlueprintEventDispatcher( "OnOpening", function()
        if self.OnOpening then
            self.OnOpening()
        end
    end)

    self:BindBlueprintEventDispatcher( "OnGenerateWidget", function( _, sId )
        if self.OnGenerateWidget then
            local eWidget = self.OnGenerateWidget( sId )
            if eWidget then
                self:SetBlueprintPropertyValue( "GenerateWidget", eWidget )
            end
        end
    end)
    return self
end

function UMG.NComboBox:SetTextColor( color )
    self:CallBlueprintEvent( "SetTextColor", color )
    return self
end

function UMG.NComboBox:AddOption( sText )
    self:CallBlueprintEvent( "AddOption", sText )
    
    table.insert( self.Options, sText )
    return self
end

function UMG.NComboBox:RemoveOption( sText )
    self:CallBlueprintEvent( "RemoveOption", sText )
    table.remove( self.Options, sText )
    return self
end

function UMG.NComboBox:GetOption( iIndex )
    return self.Options[iIndex]
end

function UMG.NComboBox:GetOptionIndex( sText )
    for i,v in pairs( self.Options ) do
        if v == sText then
            return i
        end
    end
end

function UMG.NComboBox:RefreshOptions()
    self:CallBlueprintEvent( "RefreshOptions" )
    return self
end

function UMG.NComboBox:SetSelectedOption( sText )
    self:CallBlueprintEvent( "SetSelectedOption", sText )
    self.SelectedOption = sText
    return self
end

function UMG.NComboBox:SetSelectedIndex( iIndex )
    if not self.Options[iIndex] then
        return self
    end
    self:CallBlueprintEvent( "SetSelectedIndex", iIndex )
    self.SelectedOption = self.Options[iIndex]
    return self
end

function UMG.NComboBox:ClearOptions()
    self:CallBlueprintEvent( "ClearOptions" )
    self.Options = {}
    self.SelectedOption = nil
    return self
end

function UMG.NComboBox:ClearSelection()
    self:CallBlueprintEvent( "ClearSelection" )
    self.SelectedOption = nil
    return self
end

function UMG.NComboBox:GetSelectedOption()
    return self.SelectedOption
end

function UMG.NComboBox:IsOpen()
    return self:CallBlueprintEvent( "IsOpen" )
end

function UMG.NComboBox:SetButtonBrush( tNormalBrush, tHoveredBrush, tPressedBrush )
    self:CallBlueprintEvent( "SetButtonBrush", tNormalBrush or {}, tHoveredBrush or {}, tPressedBrush or {} )
    return self
end

function UMG.NComboBox:SetArrowBrush( tBrush )
    self:CallBlueprintEvent( "SetArrowBrush", tBrush )
    return self
end

function UMG.NComboBox:SetItemBrush( tSelectorFocusedBrush, tActiveHoveredBrush, tActiveBrush, tInactiveHoveredBrush, tInactiveBrush )
    self:CallBlueprintEvent( "SetItemBrush", tSelectorFocusedBrush or {}, tActiveHoveredBrush or {}, tActiveBrush or {}, tInactiveHoveredBrush or {}, tInactiveBrush or {} )
    return self
end

function UMG.NComboBox:SetItemRowBrush( tEvenRowBackgroundBrush, tEvenRowBackgroundHoveredBrush, tOddRowBackgroundBrush, tOddRowBackgroundHoveredBrush )
    self:CallBlueprintEvent( "SetItemRowBrush", tEvenRowBackgroundHoveredBrush or {}, tEvenRowBackgroundBrush or {}, tOddRowBackgroundBrush or {}, tOddRowBackgroundHoveredBrush or {} )
    return self
end