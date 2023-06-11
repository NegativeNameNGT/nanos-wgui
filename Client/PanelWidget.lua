WGui.PanelWidget = WGui.BaseWidget.Inherit("PanelWidget")

local NativeDestroy = WGui.PanelWidget.Destroy

function WGui.PanelWidget:Destroy()
    local tPanelChildren = self:GetAllChildren()
    for _,v in pairs(tPanelChildren) do
        v:Destroy()
    end
    NativeDestroy(self)
end

function WGui.PanelWidget:GetAllChildren()
    return self:GetValue("INTERNAL_Children", {})
end

function wgui_raw_addslot(self, eChild, Slot)
    local tChildSlot = GetChildSlot(self.ChildSlot)
    for k,v in pairs(tChildSlot.Methods) do
        eChild[k] = v
    end
    tChildSlot.Constructor( eChild )
end

function wgui_raw_add(self, eChild)
    local tChildren = self:GetAllChildren()
    tChildren[eChild:GetID()] = eChild
    self:SetValue("INTERNAL_Children", tChildren)

    eChild.Parent = self
end

function wgui_raw_removeslot(self, eChild)
    if eChild.Parent.ChildSlot then
        local tChildSlot = GetChildSlot(eChild.Parent.ChildSlot)
        for k,_ in pairs(tChildSlot.Methods) do
            eChild[k] = nil
        end

        for k,v in pairs(WGui.BaseWidget.Overridables) do
            if not eChild[k] then
                 eChild[k] = v
            end
        end
    end
end

function wgui_raw_remove(self, eChild)
    local tChildren = self:GetAllChildren()
    tChildren[eChild:GetID()] = nil
    self:SetValue("INTERNAL_Children", tChildren)
end

function WGui.PanelWidget:Add(eChild, tParameters)
    -- Checks if the panel reached the children limit
    if self.ChildrenLimit then
        if #self:GetAllChildren() >= self.ChildrenLimit then
            assert(false, "Cannot add more children to this panel widget, limit reached.")
            return
        end
    end

    if tParameters then
        self:CallBlueprintEvent("AddChildOverride", eChild, table.unpack(tParameters))
    else
        self:CallBlueprintEvent("AddChild", eChild)
    end

    -- Remove old slot functions from the child
    if eChild.Parent then wgui_raw_removeslot(self, eChild) end

    -- Add slot functions to the child
    if self.ChildSlot then wgui_raw_addslot(self, eChild, self.ChildSlot) end

    wgui_raw_add(self, eChild)
    return self
end

function WGui.PanelWidget:RemoveChild(eChild)
    wgui_raw_removeslot(self, eChild)
    wgui_raw_remove(self, eChild)

    self:CallBlueprintEvent("RemoveChild", eChild)
    return self
end

function WGui.PanelWidget:RemoveChildAt(iIndex)
    local tChildren = self:GetAllChildren()
    local eChild = tChildren[iIndex]
    if eChild then
        self:RemoveChild(eChild)
    end
    return self
end

function WGui.PanelWidget:GetChildIndex(eChild)
    local tChildren = self:GetAllChildren()
    for i,v in pairs(tChildren) do
        if v == eChild then
            return i
        end
    end
    return -1
end

function WGui.PanelWidget:ClearChildren()
    local tPanelChildren = self:GetAllChildren()
    for _,v in pairs(tPanelChildren) do
        self:RemoveChild(v)
    end
    return self
end