local notifs = {}
local tween = {tweens = {}, tweenstwo = {}}
function risenotif(title, text, duration, type, continued)
    local notifications = game:GetService("CoreGui"):FindFirstChild("Notifications") or Instance.new("ScreenGui", game:GetService("CoreGui"))
    notifications.Name = 'Notifications'
    local notifs2 = risenotif
	if #notifs > 0 and not continued then
		table.insert(notifs, {
			title,
			text,
			duration
		})
		return
	end
	if not continued then
		table.insert(notifs, {
			title,
			text,
			duration
		})
	end
	local notification = Instance.new('Frame')
	notification.Name = 'Notification'
	notification.Size = UDim2.fromOffset(280, 60)
	notification.Position = UDim2.fromOffset(150, game:GetService('GuiService'):GetGuiInset().Y + 84)
	notification.AnchorPoint = Vector2.new(0.5, 0.5)
	notification.BackgroundTransparency = 1
	notification.BackgroundColor3 = Color3.fromHSV(0.5907127429805615, 0.6265223274695534, math.clamp(select(3, Color3.fromRGB(23, 26, 33):ToHSV()) > 0.5 and 0.739 + 0.4 or 0.739 - 0.4, 0, 1))
	notification.Parent = notifications
    local corner = Instance.new('UICorner')
    corner.CornerRadius = UDim.new(0, 22)
    corner.Parent = notification
	local scale = Instance.new('UIScale')
	scale.Scale = 1.1
	scale.Parent = notification
	local icon = Instance.new('Frame')
	icon.Size = UDim2.fromOffset(40, 40)
	icon.Position = UDim2.fromOffset(10, 10)
	icon.BackgroundColor3 = Color3.new(1, 1, 1)
	icon.Parent = notification
    local corner = Instance.new('UICorner')
    corner.CornerRadius = UDim.new(0, 11)
    corner.Parent = icon
	local titlelabel = Instance.new('TextLabel')
	titlelabel.Name = 'Title'
	titlelabel.Size = UDim2.fromOffset(60, 30)
	titlelabel.Position = UDim2.fromOffset(61, 6)
	titlelabel.BackgroundTransparency = 1
	titlelabel.Text = title
	titlelabel.TextXAlignment = Enum.TextXAlignment.Left
	titlelabel.TextYAlignment = Enum.TextYAlignment.Center
	titlelabel.TextColor3 = Color3.fromRGB(12, 163, 232)
	titlelabel.TextSize = 18
	titlelabel.RichText = true
	titlelabel.FontFace = Font.fromEnum(Enum.Font.Arial, Enum.FontWeight.SemiBold)
	titlelabel.Parent = notification
	local textlabel = Instance.new('TextLabel')
	textlabel.Size = UDim2.fromOffset(60, 30)
	textlabel.Position = UDim2.fromOffset(61, 25)
	textlabel.BackgroundTransparency = 1
	textlabel.Text = text
	textlabel.TextColor3 = Color3.new(1, 1, 1)
	textlabel.TextSize = 17
	textlabel.TextXAlignment = Enum.TextXAlignment.Left
	textlabel.TextYAlignment = Enum.TextYAlignment.Center
	textlabel.FontFace = Font.fromEnum(Enum.Font.Arial, Enum.FontWeight.SemiBold)
	textlabel.Parent = notification
	local info = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
    if tween.tweens[scale] then
        tween.tweens[scale]:Cancel()
    end
    if true == true or scale.Parent and scale.Visible then
        tween.tweens[scale] = game:GetService('TweenService'):Create(scale, info, {Scale = 1})
        tween.tweens[scale]:Play()
    else
        for i, v in goal do
            scale[i] = v
        end
    end



    if tween.tweens[notification] then
        tween.tweens[notification]:Cancel()
    end
    if notification.Parent and notification.Visible then
        tween.tweens[notification] = game:GetService('TweenService'):Create(notification, info, {BackgroundTransparency = 0.5})
        tween.tweens[notification]:Play()
    else
        for i, v in goal do
            notification[i] = v
        end
    end


	for _, v in {titlelabel, textlabel, icon} do
        if tween.tweens[v] then
            tween.tweens[v]:Cancel()
        end
        if v.Parent and v.Visible then
            tween.tweens[v] = game:GetService('TweenService'):Create(v, info, {[v:IsA('TextLabel') and 'TextTransparency' or 'BackgroundTransparency'] = 0})
            tween.tweens[v]:Play()
        else
            for d, p in goal do
                v[d] = p
            end
        end


	end
	task.delay(duration, function()
        if tween.tweens[scale] then
            tween.tweens[scale]:Cancel()
        end
        if true == true or scale.Parent and scale.Visible then
            tween.tweens[scale] = game:GetService('TweenService'):Create(scale, info, {Scale = 1.1})
            tween.tweens[scale]:Play()
        else
            for d, p in goal do
                scale[d] = p
            end
        end


		for _, v in {notification, titlelabel, textlabel, icon} do
            if tween.tweens[v] then
                tween.tweens[v]:Cancel()
            end
            if v.Parent and v.Visible then
                tween.tweens[v] = game:GetService('TweenService'):Create(v, info, {[v:IsA('TextLabel') and 'TextTransparency' or 'BackgroundTransparency'] = 1})
                tween.tweens[v]:Play()
            else
                for d, p in goal do
                    v[d] = p
                end
            end

            
		end
		task.delay(0.5, function()
			notification:Destroy()
		end)
		task.delay(0.3, function()
			table.remove(notifs, 1)
			if notifs[1] then
				notifs2(notifs[1][1], notifs[1][2], notifs[1][3], '', true)
			end
		end)
	end)
end

return risenotif
