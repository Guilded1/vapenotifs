--these are all the compiled ones

--OLDVAPE
local tween = {tweens = {},tweenstwo = {}}
function oldnotif(title, text, duration)
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
		iconshadow.Image = getcustomasset('newvape/assets/old/info.png')
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
		progress.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
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
oldnotif("Vape", "Vape has been loaded.", 2)

--RISE
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
	textlabel.FontFace = Font.new(getcustomasset('newvape/assets/rise/SF-Pro-Rounded-Light.otf'))
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
risenotif("Vape", "Finished Loading.", 2, "info")

--NEW VAPE
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
		notification.Image = getcustomasset('newvape/assets/new/notification.png')
		notification.ScaleType = Enum.ScaleType.Slice
		notification.SliceCenter = Rect.new(7, 7, 9, 9)
		notification.Parent = notifications

		local blur = Instance.new('ImageLabel')
		blur.Name = 'Blur'
		blur.Size = UDim2.new(1, 89, 1, 52)
		blur.Position = UDim2.fromOffset(-48, -31)
		blur.BackgroundTransparency = 1
		blur.Image = getcustomasset('newvape/assets/new/blurnotif.png')
		blur.ScaleType = Enum.ScaleType.Slice
		blur.SliceCenter = Rect.new(52, 31, 261, 502)
		blur.Parent = notification

		local iconshadow = Instance.new('ImageLabel')
		iconshadow.Name = 'Icon'
		iconshadow.Size = UDim2.fromOffset(60, 60)
		iconshadow.Position = UDim2.fromOffset(-5, -8)
		iconshadow.ZIndex = 5
		iconshadow.BackgroundTransparency = 1
		iconshadow.Image = getcustomasset('newvape/assets/new/'..(type or 'info')..'.png')
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
		progress.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
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
vapenotif("Vape", "Finished Loading", 3, "info")
