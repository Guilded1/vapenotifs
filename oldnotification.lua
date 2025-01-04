local tween = {tweens = {},tweenstwo = {}}
function oldnotif(title, text, duration, type)
    local notifications = game:GetService("CoreGui"):FindFirstChild("Notifications") or Instance.new("ScreenGui", game:GetService("CoreGui"))
    notifications.Name = 'Notifications'
	task.delay(0, function()
		if setthreadidentity then setthreadidentity(8) end
		local i = #notifications:GetChildren() + 1
		local notification = Instance.new('Frame')
		notification.Name = 'Notification'
        local fontsize = Instance.new('GetTextBoundsParams')
        fontsize.Width = math.huge
        fontsize.Text = text:gsub('<br%s*/>', '\n'):gsub('<[^<>]->', '')
        fontsize.Size = 18
        fontsize.Font = Font.fromEnum(Enum.Font.Arial)
        local txtsize = game:GetService('TextService'):GetTextBoundsAsync(fontsize)
		notification.Size = UDim2.fromOffset(txtsize.X + 36, 41)
		notification.Position = UDim2.new(1, 0, 1, -(29 + (44 * i)))
		notification.ZIndex = 5
		notification.BackgroundColor3 = Color3.fromHSV(0.8333333134651184, 0.038461536169052124, math.clamp(select(3, Color3.fromRGB(26, 25, 26):ToHSV()) > 0.5 and 0.10196078568696976 + 0.1 or 0.10196078568696976 - 0.1, 0, 1))
		notification.BackgroundTransparency = 0.5
		notification.BorderSizePixel = 0
		notification.Parent = notifications
		local iconshadow = Instance.new('ImageLabel')
		iconshadow.Name = 'Icon'
		iconshadow.Size = UDim2.fromOffset(32, 32)
		iconshadow.Position = UDim2.fromOffset(1, 3)
		iconshadow.ZIndex = 5
		iconshadow.BackgroundTransparency = 1
		iconshadow.Image = type == 'warning' and "rbxassetid://139403815386577" or type == "error" and "rbxassetid://139403815386577" or "rbxassetid://118895138210470"
		iconshadow.ImageColor3 = Color3.new()
		iconshadow.ImageTransparency = 0.5
		iconshadow.Parent = notification
		local icon = iconshadow:Clone()
		icon.Position = UDim2.fromOffset(-1, -1)
		icon.ImageColor3 = Color3.new(1, 1, 1)
		icon.ImageTransparency = 0
		icon.Parent = iconshadow
		local titlelabel = Instance.new('TextLabel')
		titlelabel.Name = 'Title'
		titlelabel.Size = UDim2.new(1, -31, 0, 20)
		titlelabel.Position = UDim2.fromOffset(31, 0)
		titlelabel.ZIndex = 5
		titlelabel.BackgroundTransparency = 1
		titlelabel.Text = title
		titlelabel.TextXAlignment = Enum.TextXAlignment.Left
		titlelabel.TextYAlignment = Enum.TextYAlignment.Top
		titlelabel.TextColor3 = Color3.new(1, 1, 1)
		titlelabel.TextSize = 18
		titlelabel.RichText = true
		titlelabel.FontFace = Font.fromEnum(Enum.Font.Arial)
		titlelabel.Parent = notification
		local textshadow = titlelabel:Clone()
		textshadow.Name = 'Text'
		textshadow.Position = UDim2.fromOffset(32, 19)
		textshadow.Text = text:gsub('<br%s*/>', '\n'):gsub('<[^<>]->', '')
		textshadow.TextColor3 = Color3.new()
		textshadow.TextTransparency = 0.5
		textshadow.RichText = false
		textshadow.FontFace = Font.fromEnum(Enum.Font.Arial)
		textshadow.Parent = notification
		local textlabel = textshadow:Clone()
		textlabel.Position = UDim2.fromOffset(-1, -1)
		textlabel.Text = text
		textlabel.TextColor3 = Color3.fromRGB(170, 170, 170)
		textlabel.TextTransparency = 0
		textlabel.RichText = true
		textlabel.Parent = textshadow
		local progress = Instance.new('Frame')
		progress.Name = 'Progress'
		progress.Size = UDim2.new(1, -13, 0, 2)
		progress.Position = UDim2.new(0, 0, 1, -2)
		progress.ZIndex = 5
		progress.BackgroundColor3 = type == 'error' and Color3.fromRGB(250, 50, 56) or type == 'warning' and Color3.fromRGB(236, 129, 43) or Color3.fromRGB(220, 220, 220)
		progress.BorderSizePixel = 0
		progress.Parent = notification
		if tween.tweens then
            local tab = tween.tweenstwo
            if tab[notification] then
                tab[notification]:Cancel()
            end
            if notification.Parent and notification.Visible then
                tab[notification] = game:GetService('TweenService'):Create(notification, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {AnchorPoint = Vector2.new(1, 0)})
                tab[notification].Completed:Once(function()
                    if tab then
                        tab[notification] = nil
                        tab = nil
                    end
                end)
                tab[notification]:Play()
            else
                for i, v in goal do
                    notification[i] = v
                end
            end
            local tab2 = tween.tweens
            if tab2[progress] then
                tab2[progress]:Cancel()
            end
            if progress.Parent and progress.Visible then
                tab2[progress] = game:GetService('TweenService'):Create(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.fromOffset(0, 2)})
                tab2[progress].Completed:Once(function()
                    if tab2 then
                        tab2[progress] = nil
                        tab2 = nil
                    end
                end)
                tab2[progress]:Play()
            else
                for i, v in goal do
                    progress[i] = v
                end
            end
		end
		task.delay(duration, function()
			if tween.tweens then
				local tab3 = tween.tweenstwo
                if tab3[notification] then
                    tab3[notification]:Cancel()
                end
                if notification.Parent and notification.Visible then
                    tab3[notification] = game:GetService('TweenService'):Create(notification, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {AnchorPoint = Vector2.new(0, 0)})
                    tab3[notification].Completed:Once(function()
                        if tab3 then
                            tab3[notification] = nil
                            tab3 = nil
                        end
                    end)
                    tab3[notification]:Play()
                else
                    for i, v in goal do
                        notification[i] = v
                    end
                end
			end
			task.wait(0.2)
			notification:ClearAllChildren()
			notification:Destroy()
		end)
	end)
end

return oldnotif
