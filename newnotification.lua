function vapenotif(title, text, duration, type)
	local notifications = game:GetService("CoreGui"):FindFirstChild("Notifications") or Instance.new("ScreenGui", game:GetService("CoreGui"))
	notifications.Name = 'Notifications'
	local tween = {
		tweens = {},
		tweenstwo = {}
	}
	task.delay(0, function()
		if setthreadidentity then setthreadidentity(8) end
		local i = #notifications:GetChildren() + 1
		local notification = Instance.new('ImageLabel')
		notification.Name = 'Notification'
		local fontsize = Instance.new('GetTextBoundsParams')
		fontsize.Width = math.huge
		fontsize.Text = text:gsub('<br%s*/>', '\n'):gsub('<[^<>]->', '')
		fontsize.Size = 14
		fontsize.Font = Font.fromEnum(Enum.Font.Arial)
		notification.Size = UDim2.fromOffset(math.max(game:GetService('TextService'):GetTextBoundsAsync(fontsize).X + 80, 266), 75)
		notification.Position = UDim2.new(1, 0, 1, -(29 + (78 * i)))
		notification.ZIndex = 5
		notification.BackgroundTransparency = 1
		notification.Image = "rbxassetid://16738721069"
		notification.ScaleType = Enum.ScaleType.Slice
		notification.SliceCenter = Rect.new(7, 7, 9, 9)
		notification.Parent = notifications

		local blur = Instance.new('ImageLabel')
		blur.Name = 'Blur'
		blur.Size = UDim2.new(1, 89, 1, 52)
		blur.Position = UDim2.fromOffset(-48, -31)
		blur.BackgroundTransparency = 1
		blur.Image = "rbxassetid://16738720137"
		blur.ScaleType = Enum.ScaleType.Slice
		blur.SliceCenter = Rect.new(52, 31, 261, 502)
		blur.Parent = notification

		local iconshadow = Instance.new('ImageLabel')
		iconshadow.Name = 'Icon'
		iconshadow.Size = UDim2.fromOffset(60, 60)
		iconshadow.Position = UDim2.fromOffset(-5, -8)
		iconshadow.ZIndex = 5
		iconshadow.BackgroundTransparency = 1
		iconshadow.Image = type == 'error' and "rbxassetid://14368301329" or type == 'warning' and 'rbxassetid://14368361552' or 'rbxassetid://14368324807'
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
		titlelabel.Size = UDim2.new(1, -56, 0, 20)
		titlelabel.Position = UDim2.fromOffset(46, 16)
		titlelabel.ZIndex = 5
		titlelabel.BackgroundTransparency = 1
		titlelabel.Text = "<stroke color='#FFFFFF' joins='round' thickness='0.3' transparency='0.5'>"..title..'</stroke>'
		titlelabel.TextXAlignment = Enum.TextXAlignment.Left
		titlelabel.TextYAlignment = Enum.TextYAlignment.Top
		titlelabel.TextColor3 = Color3.fromRGB(209, 209, 209)
		titlelabel.TextSize = 14
		titlelabel.RichText = true
		titlelabel.FontFace = Font.fromEnum(Enum.Font.Arial, Enum.FontWeight.SemiBold)
		titlelabel.Parent = notification

		local textshadow = titlelabel:Clone()
		textshadow.Name = 'Text'
		textshadow.Position = UDim2.fromOffset(47, 44)
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
		progress.Position = UDim2.new(0, 3, 1, -4)
		progress.ZIndex = 5
		progress.BackgroundColor3 = type == 'error' and Color3.fromRGB(250, 50, 56) or type == 'warning' and Color3.fromRGB(236, 129, 43) or Color3.fromRGB(220, 220, 220)
		progress.BorderSizePixel = 0
		progress.Parent = notification

		if tween.tweenstwo[notification] then
			tween.tweenstwo[notification]:Cancel()
		end

		if notification.Parent and notification.Visible then
			tween.tweenstwo[notification] = game:GetService('TweenService'):Create(notification, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {AnchorPoint = Vector2.new(1, 0)})
			tween.tweenstwo[notification].Completed:Once(function()
				tween.tweenstwo[notification] = nil
			end)
			tween.tweenstwo[notification]:Play()
		else
			for i, v in pairs(goal) do
				notification[i] = v
			end
		end

		if tween.tweens[progress] then
			tween.tweens[progress]:Cancel()
		end

		if progress.Parent and progress.Visible then
			tween.tweens[progress] = game:GetService('TweenService'):Create(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.fromOffset(0, 2)})
			tween.tweens[progress].Completed:Once(function()
				tween.tweens[progress] = nil
			end)
			tween.tweens[progress]:Play()
		else
			for i, v in pairs(goal) do
				progress[i] = v
			end
		end

		task.delay(duration, function()
			if tween.tweenstwo[notification] then
				tween.tweenstwo[notification]:Cancel()
			end
			if notification.Parent and notification.Visible then
				tween.tweenstwo[notification] = game:GetService('TweenService'):Create(notification, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {AnchorPoint = Vector2.new(0, 0)})
				tween.tweenstwo[notification].Completed:Once(function()
					tween.tweenstwo[notification] = nil
				end)
				tween.tweenstwo[notification]:Play()
			else
				for i, v in pairs(goal) do
					notification[i] = v
				end
			end
			task.wait(0.2)
			notification:ClearAllChildren()
			notification:Destroy()
		end)
	end)
end
return vapenotif
