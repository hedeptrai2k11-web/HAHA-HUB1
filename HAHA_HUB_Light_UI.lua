-- HAHA HUB MOBILE - LIGHT UI
-- LocalScript for a Roblox Studio experience you own.
-- Place in StarterPlayer > StarterPlayerScripts.
-- UI only: this does not automate Blox Fruits or control game actions.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("HAHA_HUB")
if old then old:Destroy() end

local C = {
    bg = Color3.fromRGB(15, 12, 23),
    panel = Color3.fromRGB(29, 22, 42),
    panel2 = Color3.fromRGB(39, 29, 56),
    purple = Color3.fromRGB(155, 91, 255),
    cyan = Color3.fromRGB(71, 220, 255),
    text = Color3.fromRGB(245, 241, 255),
    muted = Color3.fromRGB(183, 174, 202),
    red = Color3.fromRGB(190, 38, 67),
}

local function make(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props) do obj[k] = v end
    obj.Parent = parent
    return obj
end

local gui = make("ScreenGui", {
    Name = "HAHA_HUB", ResetOnSpawn = false, DisplayOrder = 100,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, playerGui)

local main = make("Frame", {
    Name = "Main", AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(0.88, 0, 0.70, 0),
    BackgroundColor3 = C.bg, BackgroundTransparency = 0.06, BorderSizePixel = 0,
}, gui)
make("UICorner", {CornerRadius = UDim.new(0, 14)}, main)
make("UIStroke", {Color = C.purple, Thickness = 1.5}, main)
make("UISizeConstraint", {MinSize = Vector2.new(290, 330), MaxSize = Vector2.new(520, 620)}, main)

local header = make("Frame", {
    Size = UDim2.new(1, 0, 0, 46), BackgroundColor3 = C.panel, BorderSizePixel = 0,
}, main)
make("UICorner", {CornerRadius = UDim.new(0, 14)}, header)
make("TextLabel", {
    Position = UDim2.new(0, 13, 0, 0), Size = UDim2.new(1, -110, 1, 0),
    BackgroundTransparency = 1, Text = "⚡ HAHA HUB", Font = Enum.Font.GothamBold,
    TextSize = 18, TextColor3 = C.cyan, TextXAlignment = Enum.TextXAlignment.Left,
}, header)

local minimize = make("TextButton", {
    Name = "Minimize", AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.new(1, -8, 0.5, 0), Size = UDim2.fromOffset(36, 30),
    BackgroundColor3 = C.panel2, BorderSizePixel = 0, Text = "—",
    Font = Enum.Font.GothamBold, TextSize = 18, TextColor3 = C.text,
}, header)
make("UICorner", {CornerRadius = UDim.new(0, 8)}, minimize)

local stop = make("TextButton", {
    Name = "Stop", Position = UDim2.new(0, 10, 0, 54),
    Size = UDim2.new(1, -20, 0, 36), BackgroundColor3 = C.red,
    BorderSizePixel = 0, Text = "■  STOP", Font = Enum.Font.GothamBold,
    TextSize = 14, TextColor3 = C.text,
}, main)
make("UICorner", {CornerRadius = UDim.new(0, 8)}, stop)

local names = {
    "Trang chủ", "Kiếm", "Súng", "Võ", "Farm & Quest", "Sea Event",
    "Islands & Items", "Boss Auto", "Hop Server", "Movement Guard", "Performance",
}
local desc = {
    ["Trang chủ"] = "HAHA HUB Mobile\nMenu nhẹ, không chạy vòng lặp nền.",
    ["Kiếm"] = "Danh sách kiếm để theo dõi điều kiện mở khóa và mastery.",
    ["Súng"] = "Danh sách súng để theo dõi điều kiện mở khóa và mastery.",
    ["Võ"] = "Theo dõi fighting style và điều kiện nâng cấp.",
    ["Farm & Quest"] = "Theo dõi level, quest, mastery, nguyên liệu, Dojo và Race.",
    ["Sea Event"] = "Ghi chú và theo dõi tiến độ sự kiện biển.",
    ["Islands & Items"] = "Theo dõi đảo, vật phẩm hiếm và điều kiện cần thiết.",
    ["Boss Auto"] = "Bảng theo dõi boss/quest. Không tự triệu hồi hoặc tấn công.",
    ["Hop Server"] = "Giao diện ghi chú server/sea; không tự dò server.",
    ["Movement Guard"] = "Cài đặt theo dõi mục tiêu cho dự án Roblox của bạn.",
    ["Performance"] = "Giao diện hạn chế hiệu ứng để giảm tải.",
}

left = make("ScrollingFrame", {
    Name = "Tabs", Position = UDim2.new(0, 10, 0, 100),
    Size = UDim2.new(0.42, -7, 1, -110), BackgroundColor3 = C.panel,
    BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = C.cyan,
    CanvasSize = UDim2.new(0, 0, 0, #names * 40 + 8),
}, main)
make("UICorner", {CornerRadius = UDim.new(0, 9)}, left)
make("UIPadding", {PaddingTop = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5)}, left)
make("UIListLayout", {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}, left)

local right = make("ScrollingFrame", {
    Name = "Content", Position = UDim2.new(0.42, 3, 0, 100),
    Size = UDim2.new(0.58, -13, 1, -110), BackgroundColor3 = C.panel,
    BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = C.purple,
    CanvasSize = UDim2.new(0, 0, 0, 180),
}, main)
make("UICorner", {CornerRadius = UDim.new(0, 9)}, right)
make("UIPadding", {PaddingTop = UDim.new(0, 8), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8)}, right)
local layout = make("UIListLayout", {Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder}, right)

local status = make("TextLabel", {
    Name = "Status", Size = UDim2.new(1, 0, 0, 42), BackgroundTransparency = 1,
    Text = "Trạng thái: Sẵn sàng", TextWrapped = true,
    Font = Enum.Font.GothamSemibold, TextSize = 12, TextColor3 = C.cyan, LayoutOrder = 1,
}, right)
local info = make("TextLabel", {
    Name = "Info", Size = UDim2.new(1, 0, 0, 100), BackgroundColor3 = C.panel2,
    BorderSizePixel = 0, Text = desc["Trang chủ"], TextWrapped = true,
    Font = Enum.Font.Gotham, TextSize = 12, TextColor3 = C.text, LayoutOrder = 2,
}, right)
make("UICorner", {CornerRadius = UDim.new(0, 8)}, info)

local function showTab(name)
    status.Text = "Đang mở: " .. name
    info.Text = desc[name] or "Theo dõi tiến độ."
    task.defer(function()
        right.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 18)
    end)
end

for i, name in ipairs(names) do
    local tab = make("TextButton", {
        Name = "Tab" .. i, Size = UDim2.new(1, 0, 0, 36),
        BackgroundColor3 = C.panel2, BorderSizePixel = 0, Text = name,
        TextWrapped = true, Font = Enum.Font.GothamSemibold, TextSize = 11,
        TextColor3 = C.text, LayoutOrder = i,
    }, left)
    make("UICorner", {CornerRadius = UDim.new(0, 7)}, tab)
    tab.Activated:Connect(function() showTab(name) end)
end

local floating = make("TextButton", {
    Name = "HAHA_Floating", AnchorPoint = Vector2.new(0, 0.5),
    Position = UDim2.new(0, 12, 0.45, 0), Size = UDim2.fromOffset(56, 56),
    BackgroundColor3 = C.bg, BorderSizePixel = 0, Text = "HAHA",
    Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = C.cyan,
    Visible = false, Active = true,
}, gui)
make("UICorner", {CornerRadius = UDim.new(1, 0)}, floating)
make("UIStroke", {Color = C.purple, Thickness = 2}, floating)

local dragging, dragStart, startPosition
floating.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging, dragStart, startPosition = true, input.Position, floating.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        floating.Position = UDim2.new(startPosition.X.Scale, startPosition.X.Offset + delta.X, startPosition.Y.Scale, startPosition.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

minimize.Activated:Connect(function() main.Visible = false; floating.Visible = true end)
floating.Activated:Connect(function() main.Visible = true; floating.Visible = false end)
stop.Activated:Connect(function()
    status.Text = "Đã dừng"
    info.Text = "Không có tác vụ nền nào đang chạy trong bản UI này."
end)
showTab("Trang chủ")
