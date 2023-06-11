WGui.NSlider = WGui.Inherit(WGui.BaseWidget, "NSlider")

function WGui.NSlider:Constructor()
    self.Super:Constructor( "nwgui-assets::AW_Slider" )

    self.NativeWidget = Widget(NativeWidget.Slider)

    self:CallBlueprintEvent("Initialize", self.NativeWidget)

    self.NativeWidget:BindBlueprintEventDispatcher( "OnMouseCaptureBegin", function()
        if self.OnMouseCaptureBegin then
            self.OnMouseCaptureBegin()
        end
    end)

    self.NativeWidget:BindBlueprintEventDispatcher( "OnMouseCaptureEnd", function()
        if self.OnMouseCaptureEnd then
            self.OnMouseCaptureEnd()
        end
    end)
    
    self.NativeWidget:BindBlueprintEventDispatcher( "OnValueChanged", function( _, fValue )
        self.Value = fValue
        if self.OnValueChanged then
            self.OnValueChanged(fValue)
        end
    end)

    return self
end

function WGui.NSlider:SetBrush( tNormal, tHovered )
    self.NativeWidget:CallBlueprintEvent("SetBrush", tNormal or {}, tHovered or {})
    return self
end

function WGui.NSlider:SetBarStyle( tNormal, tHovered, fBarThickness )
    self.NativeWidget:CallBlueprintEvent("SetBarStyle", tNormal or {}, tHovered or {}, (fBarThickness or 2) or self.Thickness)
    self.Thickness = fBarThickness
    return self
end

function WGui.NSlider:SetValue( fValue )
    self.Value = fValue
    self.NativeWidget:CallBlueprintEvent("SetValue", fValue)
    return self
end

function WGui.NSlider:GetValue()
    return self.Value or 0
end

function WGui.NSlider:SetMinValue( fMinValue )
    self.NativeWidget:CallBlueprintEvent("SetMinValue", fMinValue)
    return self
end

function WGui.NSlider:SetMaxValue( fMaxValue )
    self.NativeWidget:CallBlueprintEvent("SetMaxValue", fMaxValue)
    return self
end

function WGui.NSlider:SetOrientation( eOrientation )
    self.NativeWidget:SetBlueprintPropertyValue("Orientation", eOrientation)
    return self
end

function WGui.NSlider:SetStepSize( fStepSize )
    self.NativeWidget:SetBlueprintPropertyValue("StepSize", fStepSize)
    return self
end

function WGui.NSlider:SetIndentHandle( bIndentHandle )
    self.NativeWidget:CallBlueprintEvent("SetIndentHandle", bIndentHandle)
    return self
end

function WGui.NSlider:SetLocked( bLocked )
    self.NativeWidget:CallBlueprintEvent("SetLocked", bLocked)
    return self
end

function WGui.NSlider:SetMouseUsesStep( bMouseUsesStep )
    self.NativeWidget:SetBlueprintPropertyValue("MouseUsesStep", bMouseUsesStep)
    return self
end