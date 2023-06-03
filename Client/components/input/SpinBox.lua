UMG.NSpinBox = UMG.Inherit(UMG.PanelWidget, "NSpinBox" )

function UMG.NSpinBox:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_SpinBox" )

    self.Font = {
        ["FontFamily"] = "package://advanced-nanos-widgets/Client/fonts/Roboto-Bold.ttf",
        ["Typeface"] = "Bold",
        ["Size"] = 12,
        ["LetterSpacing"] = 0,
        ["SkewAmount"] = 0.0,
        ["FontMaterial"] = nil,
        ["OutlineSettings"] = {
            ["OutlineColor"] = Color.BLACK
        }
    }

    self.NativeWidget = Widget( NativeWidget.SpinBox )
    self:CallBlueprintEvent("Initialize", self.NativeWidget)

    self.NativeWidget:BindBlueprintEventDispatcher("OnValueChanged", function( _, fValue)
        self.Value = fValue
        if self.OnValueChanged then
            self.OnValueChanged(fValue)
        end
    end)

    self.NativeWidget:BindBlueprintEventDispatcher( "OnValueCommitted", function( _, fValue, eReason)
        if self.OnValueCommitted then
            self.OnValueCommitted(fValue, eReason)
        end
    end)

    self.NativeWidget:BindBlueprintEventDispatcher( "OnBeginSliderMovement", function()
        if self.OnBeginSliderMovement then
            self.OnBeginSliderMovement()
        end
    end)

    self.NativeWidget:BindBlueprintEventDispatcher( "OnEndSliderMovement", function(_, fValue)
        if self.OnEndSliderMovement then
            self.OnEndSliderMovement( fValue )
        end
    end)

    return self
end

function UMG.NSpinBox:SetSpinValue( fValue )
    self.NativeWidget:CallBlueprintEvent("SetValue", fValue)
    self.Value = fValue
    return self
end

function UMG.NSpinBox:GetSpinValue()
    return self.Value or 0
end

function UMG.NSpinBox:SetMinValue( fMinValue )
    self.NativeWidget:CallBlueprintEvent("SetMinValue", fMinValue)
    self.MinValue = fMinValue
    return self
end

function UMG.NSpinBox:GetMinValue()
    return self.MinValue or 0
end

function UMG.NSpinBox:SetMaxValue( fMaxValue )
    self.NativeWidget:CallBlueprintEvent("SetMaxValue", fMaxValue)
    self.MaxValue = fMaxValue
    return self
end

function UMG.NSpinBox:GetMaxValue()
    return self.MaxValue or 0
end

function UMG.NSpinBox:SetMinSliderValue( fMinSliderValue )
    self.NativeWidget:CallBlueprintEvent("SetMinSliderValue", fMinSliderValue)
    self.MinSliderValue = fMinSliderValue
    return self
end

function UMG.NSpinBox:GetMinSliderValue()
    return self.MinSliderValue or 0
end

function UMG.NSpinBox:SetMaxSliderValue( fMaxSliderValue )
    self.NativeWidget:CallBlueprintEvent("SetMaxSliderValue", fMaxSliderValue)
    self.MaxSliderValue = fMaxSliderValue
    return self
end

function UMG.NSpinBox:GetMaxSliderValue()
    return self.MaxSliderValue or 0
end

function UMG.NSpinBox:SetDelta( fDelta )
    self.NativeWidget:SetBlueprintPropertyValue("Delta", fDelta)
    self.Delta = fDelta
    return self
end

function UMG.NSpinBox:GetDelta()
    return self.Delta or 0
end

function UMG.NSpinBox:SetTextColor( Color )
    self:CallBlueprintEvent("SetTextColor", Color)
    return self
end

function UMG.NSpinBox:SetEnableSlider( bEnableSlider )
    self.NativeWidget:SetBlueprintPropertyValue("bEnableSlider", bEnableSlider)
    return self
end

function UMG.NSpinBox:SetAlwaysUsesDeltaSnap( bAlwaysUsesDeltaSnap )
    self.NativeWidget:SetBlueprintPropertyValue("bAlwaysUsesDeltaSnap", bAlwaysUsesDeltaSnap)
    return self
end

function UMG.NSpinBox:SetMinFractionalDigits( iMinFractionalDigits )
    self:SetBlueprintPropertyValue("MinFractionalDigits", iMinFractionalDigits)
    return self
end

function UMG.NSpinBox:SetMaxFractionalDigits( iMaxFractionalDigits )
    self:SetBlueprintPropertyValue("MaxFractionalDigits", iMaxFractionalDigits)
    return self
end

function UMG.NSpinBox:SetFont( sFont, sTypeface )
    if sFont then
        self.Font.FontFamily = sFont
    end

    if sTypeface then
        self.Font.Typeface = sTypeface
    end

    self.NativeWidget:SetBlueprintPropertyValue("Font", self.Font)
    return self
end

function UMG.NSpinBox:SetFontSize( iFontSize )
    self.Font.Size = iFontSize
    self.NativeWidget:SetBlueprintPropertyValue("Font", self.Font)
    return self
end

function UMG.NSpinBox:SetOutlineSettings( tOutlineSettings )
    self.Font.OutlineSettings = tOutlineSettings
    self.NativeWidget:SetBlueprintPropertyValue("Font", self.Font)
    return self
end

function UMG.NSpinBox:SetLetterSpacing( iLetterSpacing )
    self.Font.LetterSpacing = iLetterSpacing
    self.NativeWidget:SetBlueprintPropertyValue("Font", self.Font)
    return self
end

function UMG.NSpinBox:SetSkew( fSkewAmount )
    self.Font.Skew = fSkewAmount
    self.NativeWidget:SetBlueprintPropertyValue("Font", self.Font)
    return self
end

function UMG.NSpinBox:SetFontMaterial( sFontMaterial )
    self.Font.FontMaterial = sFontMaterial
    self.NativeWidget:SetBlueprintPropertyValue("Font", self.Font)
    return self
end

function UMG.NSpinBox:SetBackgroundBrush( tBrush, tActiveBrush, tHoveredBrush )
    self:CallBlueprintEvent("SetBackgroundBrush", tBrush or {}, tActiveBrush or {}, tHoveredBrush or {})
    return self
end

function UMG.NSpinBox:SetFillBrush( tActiveBrush, tHoveredBrush, tInactiveBrush )
    self:CallBlueprintEvent("SetFillBrush", tActiveBrush or {}, tHoveredBrush or {}, tInactiveBrush or {})
    return self
end

function UMG.NSpinBox:SetArrowBrush( tArrowBrush )
    self:CallBlueprintEvent("SetArrowBrush", tArrowBrush)
    return self
end

function UMG.NSpinBox:SetJustification( eJustification )
    self.NativeWidget:SetBlueprintPropertyValue("Justification", eJustification)
    return self
end