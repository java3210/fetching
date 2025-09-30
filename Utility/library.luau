--discord.gg/boronide, code generated using luamin.js™






local L_1_
L_1_ = {
	cache = {},
	load = function(L_15_arg0)
		if not L_1_.cache[L_15_arg0] then
			L_1_.cache[L_15_arg0] = {
				c = L_1_[L_15_arg0]()
			}
		end
		return L_1_.cache[L_15_arg0].c
	end
}
do
	function L_1_.a()
		local L_16_ = game:GetService"RunService"
		local L_17_ =
			L_16_.Heartbeat
		local L_18_ = game:GetService"UserInputService"
		local L_19_ = game:GetService"TweenService"
		local L_20_ = game:GetService"LocalizationService"
		local L_21_ = game:GetService"HttpService"

		local L_22_ = "https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"

		local L_23_ = loadstring(
			game.HttpGetAsync and game:HttpGetAsync(L_22_)
				or L_21_:GetAsync(L_22_)
		)()
		L_23_.SetIconsType"lucide"

		local L_24_

		local L_25_ = {
			Font = "rbxassetid://12187365364",
			Localization = nil,
			CanDraggable = true,
			Theme = nil,
			Themes = nil,
			Icons = L_23_,
			Signals = {},
			Objects = {},
			LocalizationObjects = {},
			FontObjects = {},
			Language = string.match(L_20_.SystemLocaleId, "^[a-z]+"),
			Request = http_request or (syn and syn.request) or request,
			DefaultProperties = {
				ScreenGui = {
					ResetOnSpawn = false,
					ZIndexBehavior = "Sibling",
				},
				CanvasGroup = {
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.new(1, 1, 1),
				},
				Frame = {
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.new(1, 1, 1),
				},
				TextLabel = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					Text = "",
					RichText = true,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = 14,
				},
				TextButton = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					Text = "",
					AutoButtonColor = false,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = 14,
				},
				TextBox = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderColor3 = Color3.new(0, 0, 0),
					ClearTextOnFocus = false,
					Text = "",
					TextColor3 = Color3.new(0, 0, 0),
					TextSize = 14,
				},
				ImageLabel = {
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
				},
				ImageButton = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					AutoButtonColor = false,
				},
				UIListLayout = {
					SortOrder = "LayoutOrder",
				},
				ScrollingFrame = {
					ScrollBarImageTransparency = 1,
					BorderSizePixel = 0,
				},
				VideoFrame = {
					BorderSizePixel = 0,
				}
			},
			Colors = {
				Red = "#e53935",
				Orange = "#f57c00",
				Green = "#43a047",
				Blue = "#039be5",
				White = "#ffffff",
				Grey = "#484848",
			},
		}

		function L_25_.Init(L_28_arg0)
			L_24_ = L_28_arg0
		end

		function L_25_.AddSignal(L_29_arg0, L_30_arg1)
			local L_31_ = L_29_arg0:Connect(L_30_arg1)
			table.insert(L_25_.Signals, L_31_)
			return L_31_
		end

		function L_25_.DisconnectAll()
			for L_32_forvar0, L_33_forvar1 in next, L_25_.Signals do
				local L_34_ = table.remove(L_25_.Signals, L_32_forvar0)
				L_34_:Disconnect()
			end
		end

		function L_25_.SafeCallback(L_35_arg0, ...)
			if not L_35_arg0 then
				return
			end

			local L_36_, L_37_ = pcall(L_35_arg0, ...)
			if not L_36_ then
				if L_24_ and L_24_.Window and L_24_.Window.Debug then
					local
					L_38_, L_39_ = L_37_:find":%d+: "

					warn("[ WindUI: DEBUG Mode ] " .. L_37_)

					return L_24_:Notify{
						Title = "DEBUG Mode: Error",
						Content = not L_39_ and L_37_ or L_37_:sub(L_39_ + 1),
						Duration = 8,
					}
				end
			end
		end

		function L_25_.Gradient(L_40_arg0, L_41_arg1)
			if L_24_ and L_24_.Gradient then
				return L_24_:Gradient(L_40_arg0, L_41_arg1)
			end

			local L_42_ = {}
			local L_43_ = {}

			for L_45_forvar0, L_46_forvar1 in next, L_40_arg0 do
				local L_47_ = tonumber(L_45_forvar0)
				if L_47_ then
					L_47_ = math.clamp(L_47_ / 100, 0, 1)
					table.insert(L_42_, ColorSequenceKeypoint.new(L_47_, L_46_forvar1.Color))
					table.insert(L_43_, NumberSequenceKeypoint.new(L_47_, L_46_forvar1.Transparency or 0))
				end
			end

			table.sort(L_42_, function(L_48_arg0, L_49_arg1)
				return L_48_arg0.Time < L_49_arg1.Time
			end)
			table.sort(L_43_, function(L_50_arg0, L_51_arg1)
				return L_50_arg0.Time < L_51_arg1.Time
			end)

			if #L_42_ < 2 then
				error"ColorSequence requires at least 2 keypoints"
			end

			local L_44_ = {
				Color = ColorSequence.new(L_42_),
				Transparency = NumberSequence.new(L_43_),
			}

			if L_41_arg1 then
				for L_52_forvar0, L_53_forvar1 in pairs(L_41_arg1) do
					L_44_[L_52_forvar0] = L_53_forvar1
				end
			end

			return L_44_
		end

		function L_25_.SetTheme(L_54_arg0)
			L_25_.Theme = L_54_arg0
			L_25_.UpdateTheme(nil, true)
		end

		function L_25_.AddFontObject(L_55_arg0)
			table.insert(L_25_.FontObjects, L_55_arg0)
			L_25_.UpdateFont(L_25_.Font)
		end

		function L_25_.UpdateFont(L_56_arg0)
			L_25_.Font = L_56_arg0
			for L_57_forvar0, L_58_forvar1 in next, L_25_.FontObjects do
				L_58_forvar1.FontFace = Font.new(L_56_arg0, L_58_forvar1.FontFace.Weight, L_58_forvar1.FontFace.Style)
			end
		end

		function L_25_.GetThemeProperty(L_59_arg0, L_60_arg1)
			local L_61_ = L_60_arg1[L_59_arg0] or L_25_.Themes.Dark[L_59_arg0]

			if not L_61_ then
				return nil
			end

			if type(L_61_) == "string" and string.sub(L_61_, 1, 1) == "#" then
				return Color3.fromHex(L_61_)
			end

			if typeof(L_61_) == "Color3" then
				return L_61_
			end

			if type(L_61_) == "table" and L_61_.Color and L_61_.Transparency then
				return L_61_
			end

			if type(L_61_) == "function" then
				return L_61_()
			end

			return nil
		end

		function L_25_.AddThemeObject(L_62_arg0, L_63_arg1)
			L_25_.Objects[L_62_arg0] = {
				Object = L_62_arg0,
				Properties = L_63_arg1
			}
			L_25_.UpdateTheme(L_62_arg0, false)
			return L_62_arg0
		end

		function L_25_.AddLangObject(L_64_arg0)
			local L_65_ = L_25_.LocalizationObjects[L_64_arg0]
			local L_66_ = L_65_.Object
			local L_67_ = currentObjTranslationId
			L_25_.UpdateLang(L_66_, L_67_)
			return L_66_
		end

		function L_25_.UpdateTheme(L_68_arg0, L_69_arg1)
			local function L_70_func(L_71_arg0)
				for L_72_forvar0, L_73_forvar1 in pairs(L_71_arg0.Properties or {}) do
					local L_74_ = L_25_.GetThemeProperty(L_73_forvar1, L_25_.Theme)
					if L_74_ then
						if typeof(L_74_) == "Color3" then
							local L_75_ = L_71_arg0.Object:FindFirstChild"WindUIGradient"
							if L_75_ then
								L_75_:Destroy()
							end

							if not L_69_arg1 then
								L_71_arg0.Object[L_72_forvar0] = L_74_
							else
								L_25_.Tween(L_71_arg0.Object, 0.08, {
									[L_72_forvar0] = L_74_
								}):Play()
							end
						elseif type(L_74_) == "table" and L_74_.Color and L_74_.Transparency then
							L_71_arg0.Object[L_72_forvar0] = Color3.new(1, 1, 1)

							local L_76_ = L_71_arg0.Object:FindFirstChild"WindUIGradient"
							if not L_76_ then
								L_76_ = Instance.new"UIGradient"
								L_76_.Name = "WindUIGradient"
								L_76_.Parent = L_71_arg0.Object
							end

							L_76_.Color = L_74_.Color
							L_76_.Transparency = L_74_.Transparency

							for L_77_forvar0, L_78_forvar1 in pairs(L_74_) do
								if L_77_forvar0 ~= "Color" and L_77_forvar0 ~= "Transparency" and L_76_[L_77_forvar0] ~= nil then
									L_76_[L_77_forvar0] = L_78_forvar1
								end
							end
						end
					else
						local L_79_ = L_71_arg0.Object:FindFirstChild"WindUIGradient"
						if L_79_ then
							L_79_:Destroy()
						end
					end
				end
			end

			if L_68_arg0 then
				local L_80_ = L_25_.Objects[L_68_arg0]
				if L_80_ then
					L_70_func(L_80_)
				end
			else
				for L_81_forvar0, L_82_forvar1 in pairs(L_25_.Objects) do
					L_70_func(L_82_forvar1)
				end
			end
		end

		function L_25_.SetLangForObject(L_83_arg0)
			if L_25_.Localization and L_25_.Localization.Enabled then
				local L_84_ = L_25_.LocalizationObjects[L_83_arg0]
				if not L_84_ then
					return
				end

				local L_85_ = L_84_.Object
				local L_86_ = L_84_.TranslationId

				local L_87_ = L_25_.Localization.Translations[L_25_.Language]
				if L_87_ and L_87_[L_86_] then
					L_85_.Text = L_87_[L_86_]
				else
					local L_88_ = L_25_.Localization and L_25_.Localization.Translations and L_25_.Localization.Translations.en or nil
					if L_88_ and L_88_[L_86_] then
						L_85_.Text = L_88_[L_86_]
					else
						L_85_.Text = "[" .. L_86_ .. "]"
					end
				end
			end
		end

		function L_25_.ChangeTranslationKey(L_89_arg0, L_90_arg1, L_91_arg2)
			if L_25_.Localization and L_25_.Localization.Enabled then
				local L_92_ = string.match(L_91_arg2, "^" .. L_25_.Localization.Prefix .. "(.+)")
				if L_92_ then
					for L_93_forvar0, L_94_forvar1 in ipairs(L_25_.LocalizationObjects) do
						if L_94_forvar1.Object == L_90_arg1 then
							L_94_forvar1.TranslationId = L_92_
							L_25_.SetLangForObject(L_93_forvar0)
							return
						end
					end

					table.insert(L_25_.LocalizationObjects, {
						TranslationId = L_92_,
						Object = L_90_arg1
					})
					L_25_.SetLangForObject(#L_25_.LocalizationObjects)
				end
			end
		end

		function L_25_.UpdateLang(L_95_arg0)
			if L_95_arg0 then
				L_25_.Language = L_95_arg0
			end

			for L_96_forvar0 = 1, #L_25_.LocalizationObjects do
				local L_97_ = L_25_.LocalizationObjects[L_96_forvar0]
				if L_97_.Object and L_97_.Object.Parent ~= nil then
					L_25_.SetLangForObject(L_96_forvar0)
				else
					L_25_.LocalizationObjects[L_96_forvar0] = nil
				end
			end
		end

		function L_25_.SetLanguage(L_98_arg0)
			L_25_.Language = L_98_arg0
			L_25_.UpdateLang()
		end

		function L_25_.Icon(L_99_arg0)
			return L_23_.Icon(L_99_arg0)
		end

		function L_25_.AddIcons(L_100_arg0, L_101_arg1)
			return L_23_.AddIcons(L_100_arg0, L_101_arg1)
		end

		function L_25_.New(L_102_arg0, L_103_arg1, L_104_arg2)
			local L_105_ = Instance.new(L_102_arg0)

			for L_106_forvar0, L_107_forvar1 in next, L_25_.DefaultProperties[L_102_arg0] or {} do
				L_105_[L_106_forvar0] = L_107_forvar1
			end

			for L_108_forvar0, L_109_forvar1 in next, L_103_arg1 or {} do
				if L_108_forvar0 ~= "ThemeTag" then
					L_105_[L_108_forvar0] = L_109_forvar1
				end
				if L_25_.Localization and L_25_.Localization.Enabled and L_108_forvar0 == "Text" then
					local L_110_ = string.match(L_109_forvar1, "^" .. L_25_.Localization.Prefix .. "(.+)")
					if L_110_ then
						local L_111_ = #L_25_.LocalizationObjects + 1
						L_25_.LocalizationObjects[L_111_] = {
							TranslationId = L_110_,
							Object = L_105_
						}

						L_25_.SetLangForObject(L_111_)
					end
				end
			end

			for L_112_forvar0, L_113_forvar1 in next, L_104_arg2 or {} do
				L_113_forvar1.Parent = L_105_
			end

			if L_103_arg1 and L_103_arg1.ThemeTag then
				L_25_.AddThemeObject(L_105_, L_103_arg1.ThemeTag)
			end
			if L_103_arg1 and L_103_arg1.FontFace then
				L_25_.AddFontObject(L_105_)
			end
			return L_105_
		end

		function L_25_.Tween(L_114_arg0, L_115_arg1, L_116_arg2, ...)
			return L_19_:Create(L_114_arg0, TweenInfo.new(L_115_arg1, ...), L_116_arg2)
		end

		function L_25_.NewRoundFrame(L_117_arg0, L_118_arg1, L_119_arg2, L_120_arg3, L_121_arg4, L_122_arg5)
			local function L_123_func(L_128_arg0)
				return L_128_arg0 == "Squircle" and "rbxassetid://80999662900595"
					or L_128_arg0 == "SquircleOutline" and "rbxassetid://117788349049947"
					or L_128_arg0 == "SquircleOutline2" and "rbxassetid://117817408534198"
					or L_128_arg0 == "Squircle-Outline" and "rbxassetid://117817408534198"
					or L_128_arg0 == "Shadow-sm" and "rbxassetid://84825982946844"
					or L_128_arg0 == "Squircle-TL-TR" and "rbxassetid://73569156276236"
					or L_128_arg0 == "Squircle-BL-BR" and "rbxassetid://93853842912264"
					or L_128_arg0 == "Squircle-TL-TR-Outline" and "rbxassetid://136702870075563"
					or L_128_arg0 == "Squircle-BL-BR-Outline" and "rbxassetid://75035847706564"
					or L_128_arg0 == "Square" and "rbxassetid://82909646051652"
					or L_128_arg0 == "Square-Outline" and "rbxassetid://72946211851948"
			end

			local function L_124_func(L_129_arg0)
				return L_129_arg0 ~= "Shadow-sm" and Rect.new(256
					, 256
					, 256
					, 256

				) or Rect.new(512, 512, 512, 512)
			end

			local L_125_ = L_25_.New(L_121_arg4 and "ImageButton" or "ImageLabel", {
				Image = L_123_func(L_118_arg1),
				ScaleType = "Slice",
				SliceCenter = L_124_func(L_118_arg1),
				SliceScale = 1,
				BackgroundTransparency = 1,
				ThemeTag = L_119_arg2.ThemeTag and L_119_arg2.ThemeTag
			}, L_120_arg3)

			for L_130_forvar0, L_131_forvar1 in pairs(L_119_arg2 or {}) do
				if L_130_forvar0 ~= "ThemeTag" then
					L_125_[L_130_forvar0] = L_131_forvar1
				end
			end

			local function L_126_func(L_132_arg0)
				local L_133_ = L_118_arg1 ~= "Shadow-sm" and (L_132_arg0 / (256)) or (L_132_arg0 / 512)
				L_125_.SliceScale = math.max(L_133_, 0.0001)
			end

			local L_127_ = {}

			function L_127_.SetRadius(L_134_arg0, L_135_arg1)
				L_126_func(L_135_arg1)
			end

			function L_127_.SetType(L_136_arg0, L_137_arg1)
				L_118_arg1 = L_137_arg1
				L_125_.Image = L_123_func(L_137_arg1)
				L_125_.SliceCenter = L_124_func(L_137_arg1)
				L_126_func(L_117_arg0)
			end

			function L_127_.UpdateShape(L_138_arg0, L_139_arg1, L_140_arg2)
				if L_140_arg2 then
					L_118_arg1 = L_140_arg2
					L_125_.Image = L_123_func(L_140_arg2)
					L_125_.SliceCenter = L_124_func(L_140_arg2)
				end
				if L_139_arg1 then
					L_117_arg0 = L_139_arg1
				end
				L_126_func(L_117_arg0)
			end

			function L_127_.GetRadius(L_141_arg0)
				return L_117_arg0
			end

			function L_127_.GetType(L_142_arg0)
				return L_118_arg1
			end

			L_126_func(L_117_arg0)

			return L_125_, L_122_arg5 and L_127_ or nil
		end

		local L_26_ = L_25_.New
		local L_27_ =
			L_25_.Tween

		function L_25_.SetDraggable(L_143_arg0)
			L_25_.CanDraggable = L_143_arg0
		end

		function L_25_.Drag(L_144_arg0, L_145_arg1, L_146_arg2)
			local L_147_
			local L_148_, L_149_, L_150_, L_151_
			local L_152_ = {
				CanDraggable = true
			}

			if not L_145_arg1 or type(L_145_arg1) ~= "table" then
				L_145_arg1 = {
					L_144_arg0
				}
			end

			local function L_153_func(L_154_arg0)
				local L_155_ = L_154_arg0.Position - L_150_
				L_25_.Tween(L_144_arg0, 0.02, {
					Position = UDim2.new(
						L_151_.X.Scale, L_151_.X.Offset + L_155_.X,
						L_151_.Y.Scale, L_151_.Y.Offset + L_155_.Y
					)
				}):Play()
			end

			for L_156_forvar0, L_157_forvar1 in pairs(L_145_arg1) do
				L_157_forvar1.InputBegan:Connect(function(L_158_arg0)
					if (L_158_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_158_arg0.UserInputType == Enum.UserInputType.Touch) and L_152_.CanDraggable then
						if L_147_ == nil then
							L_147_ = L_157_forvar1
							L_148_ = true
							L_150_ = L_158_arg0.Position
							L_151_ = L_144_arg0.Position

							if L_146_arg2 and type(L_146_arg2) == "function" then
								L_146_arg2(true, L_147_)
							end

							L_158_arg0.Changed:Connect(function()
								if L_158_arg0.UserInputState == Enum.UserInputState.End then
									L_148_ = false
									L_147_ = nil

									if L_146_arg2 and type(L_146_arg2) == "function" then
										L_146_arg2(false, L_147_)
									end
								end
							end)
						end
					end
				end)

				L_157_forvar1.InputChanged:Connect(function(L_159_arg0)
					if L_147_ == L_157_forvar1 and L_148_ then
						if L_159_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_159_arg0.UserInputType == Enum.UserInputType.Touch then
							L_149_ = L_159_arg0
						end
					end
				end)
			end

			L_18_.InputChanged:Connect(function(L_160_arg0)
				if L_160_arg0 == L_149_ and L_148_ and L_147_ ~= nil then
					if L_152_.CanDraggable then
						L_153_func(L_160_arg0)
					end
				end
			end)

			function L_152_.Set(L_161_arg0, L_162_arg1)
				L_152_.CanDraggable = L_162_arg1
			end

			return L_152_
		end

		L_23_.Init(L_26_, "Icon")

		function L_25_.Image(L_163_arg0, L_164_arg1, L_165_arg2, L_166_arg3, L_167_arg4, L_168_arg5, L_169_arg6)
			local function L_170_func(L_172_arg0)
				L_172_arg0 = L_172_arg0:gsub("[%s/\\:*?\"<>|]+", "-")
				L_172_arg0 = L_172_arg0:gsub("[^%w%-_%.]", "")
				return L_172_arg0
			end

			L_166_arg3 = L_166_arg3 or "Temp"
			L_164_arg1 = L_170_func(L_164_arg1)

			local L_171_ = L_26_("Frame", {
				Size = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
			}, {
				L_26_("ImageLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					ScaleType = "Crop",
					ThemeTag = (L_25_.Icon(L_163_arg0) or L_169_arg6) and {
						ImageColor3 = L_168_arg5 and "Icon" or nil
					} or nil,
				}, {
					L_26_("UICorner", {
						CornerRadius = UDim.new(0, L_165_arg2)
					})
				})
			})
			if L_25_.Icon(L_163_arg0) then
				L_171_.ImageLabel:Destroy()

				local L_173_ = L_23_.Image{
					Icon = L_163_arg0,
					Size = UDim2.new(1, 0, 1, 0),
					Colors = {
						(L_168_arg5 and "Icon" or false),
						"Button"
					}
				}.IconFrame
				L_173_.Parent = L_171_
			elseif string.find(L_163_arg0, "http") then
				local L_174_ = "WindUI/" .. L_166_arg3 .. "/Assets/." .. L_167_arg4 .. "-" .. L_164_arg1 .. ".png"
				local L_175_, L_176_ = pcall(function()
					task.spawn(function()
						if not isfile(L_174_) then
							local L_177_ = L_25_.Request{
								Url = L_163_arg0,
								Method = "GET",
							}.Body

							writefile(L_174_, L_177_)
						end
						L_171_.ImageLabel.Image = getcustomasset(L_174_)
					end)
				end)
				if not L_175_ then
					warn("[ WindUI.Creator ]  '" .. identifyexecutor() .. "' doesnt support the URL Images. Error: " .. L_176_)

					L_171_:Destroy()
				end
			elseif L_163_arg0 == "" then
				L_171_.Visible = false
			else
				L_171_.ImageLabel.Image = L_163_arg0
			end

			return L_171_
		end

		return L_25_
	end
	function L_1_.b()
		local L_178_ = {}







		function L_178_.New(L_179_arg0, L_180_arg1, L_181_arg2)
			local L_182_ = {
				Enabled = L_180_arg1.Enabled or false,
				Translations = L_180_arg1.Translations or {},
				Prefix = L_180_arg1.Prefix or "loc:",
				DefaultLanguage = L_180_arg1.DefaultLanguage or "en"
			}

			L_181_arg2.Localization = L_182_

			return L_182_
		end



		return L_178_
	end
	function L_1_.c()
		local L_183_ = L_1_.load'a'
		local L_184_ = L_183_.New
		local L_185_ = L_183_.Tween

		local L_186_ = {
			Size = UDim2.new(0, 300, 1, -156),
			SizeLower = UDim2.new(0, 300, 1, -56),
			UICorner = 13,
			UIPadding = 14,

			Holder = nil,
			NotificationIndex = 0,
			Notifications = {}
		}

		function L_186_.Init(L_187_arg0)
			local L_188_ = {
				Lower = false
			}

			function L_188_.SetLower(L_189_arg0)
				L_188_.Lower = L_189_arg0
				L_188_.Frame.Size = L_189_arg0 and L_186_.SizeLower or L_186_.Size
			end

			L_188_.Frame = L_184_("Frame", {
				Position = UDim2.new(1, -29, 0, 56),
				AnchorPoint = Vector2.new(1, 0),
				Size = L_186_.Size,
				Parent = L_187_arg0,
				BackgroundTransparency = 1,




			}, {
				L_184_("UIListLayout", {
					HorizontalAlignment = "Center",
					SortOrder = "LayoutOrder",
					VerticalAlignment = "Bottom",
					Padding = UDim.new(0, 8),
				}),
				L_184_("UIPadding", {
					PaddingBottom = UDim.new(0, 29)
				})
			})
			return L_188_
		end

		function L_186_.New(L_190_arg0)
			local L_191_ = {
				Title = L_190_arg0.Title or "Notification",
				Content = L_190_arg0.Content or nil,
				Icon = L_190_arg0.Icon or nil,
				IconThemed = L_190_arg0.IconThemed,
				Background = L_190_arg0.Background,
				BackgroundImageTransparency = L_190_arg0.BackgroundImageTransparency,
				Duration = L_190_arg0.Duration or 5,
				Buttons = L_190_arg0.Buttons or {},
				CanClose = true,
				UIElements = {},
				Closed = false,
			}
			if L_191_.CanClose == nil then
				L_191_.CanClose = true
			end
			L_186_.NotificationIndex = L_186_.NotificationIndex + 1
			L_186_.Notifications[L_186_.NotificationIndex] = L_191_









			local L_192_

			if L_191_.Icon then





















				L_192_ = L_183_.Image(
					L_191_.Icon,
					L_191_.Title .. ":" .. L_191_.Icon,
					0,
					L_190_arg0.Window,
					"Notification",
					L_191_.IconThemed
				)
				L_192_.Size = UDim2.new(0, 26, 0, 26)
				L_192_.Position = UDim2.new(0, L_186_.UIPadding, 0, L_186_.UIPadding)

			end

			local L_193_
			if L_191_.CanClose then
				L_193_ = L_184_("ImageButton", {
					Image = L_183_.Icon"x"[1],
					ImageRectSize = L_183_.Icon"x"[2].ImageRectSize,
					ImageRectOffset = L_183_.Icon"x"[2].ImageRectPosition,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(1, -L_186_.UIPadding, 0, L_186_.UIPadding),
					AnchorPoint = Vector2.new(1, 0),
					ThemeTag = {
						ImageColor3 = "Text"
					},
					ImageTransparency = .4,
				}, {
					L_184_("TextButton", {
						Size = UDim2.new(1, 8, 1, 8),
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Text = "",
					})
				})
			end

			local L_194_ = L_184_("Frame", {
				Size = UDim2.new(0, 0, 1, 0),
				BackgroundTransparency = .95,
				ThemeTag = {
					BackgroundColor3 = "Text",
				},

			})

			local L_195_ = L_184_("Frame", {
				Size = UDim2.new(1,
					L_191_.Icon and -28 - L_186_.UIPadding or 0,
					1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				AutomaticSize = "Y",
			}, {
				L_184_("UIPadding", {
					PaddingTop = UDim.new(0, L_186_.UIPadding),
					PaddingLeft = UDim.new(0, L_186_.UIPadding),
					PaddingRight = UDim.new(0, L_186_.UIPadding),
					PaddingBottom = UDim.new(0, L_186_.UIPadding),
				}),
				L_184_("TextLabel", {
					AutomaticSize = "Y",
					Size = UDim2.new(1, -30 - L_186_.UIPadding, 0, 0),
					TextWrapped = true,
					TextXAlignment = "Left",
					RichText = true,
					BackgroundTransparency = 1,
					TextSize = 16,
					ThemeTag = {
						TextColor3 = "Text"
					},
					Text = L_191_.Title,
					FontFace = Font.new(L_183_.Font, Enum.FontWeight.Medium)
				}),
				L_184_("UIListLayout", {
					Padding = UDim.new(0, L_186_.UIPadding / 3)
				})
			})

			if L_191_.Content then
				L_184_("TextLabel", {
					AutomaticSize = "Y",
					Size = UDim2.new(1, 0, 0, 0),
					TextWrapped = true,
					TextXAlignment = "Left",
					RichText = true,
					BackgroundTransparency = 1,
					TextTransparency = .4,
					TextSize = 15,
					ThemeTag = {
						TextColor3 = "Text"
					},
					Text = L_191_.Content,
					FontFace = Font.new(L_183_.Font, Enum.FontWeight.Medium),
					Parent = L_195_
				})
			end


			local L_196_ = L_183_.NewRoundFrame(L_186_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(2, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				AutomaticSize = "Y",
				ImageTransparency = .05,
				ThemeTag = {
					ImageColor3 = "Background"
				},

			}, {
				L_184_("CanvasGroup", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L_194_,
					L_184_("UICorner", {
						CornerRadius = UDim.new(0, L_186_.UICorner),
					})

				}),
				L_184_("ImageLabel", {
					Name = "Background",
					Image = L_191_.Background,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					ScaleType = "Crop",
					ImageTransparency = L_191_.BackgroundImageTransparency

				}, {
					L_184_("UICorner", {
						CornerRadius = UDim.new(0, L_186_.UICorner),
					})
				}),

				L_195_,
				L_192_,
				L_193_,
			})

			local L_197_ = L_184_("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				Parent = L_190_arg0.Holder
			}, {
				L_196_
			})

			function L_191_.Close(L_198_arg0)
				if not L_191_.Closed then
					L_191_.Closed = true
					L_185_(L_197_, 0.45, {
						Size = UDim2.new(1, 0, 0, -8)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_185_(L_196_, 0.55, {
						Position = UDim2.new(2, 0, 1, 0)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					task.wait(.45)
					L_197_:Destroy()
				end
			end

			task.spawn(function()
				task.wait()
				L_185_(L_197_, 0.45, {
					Size = UDim2.new(
						1,
						0,
						0,
						L_196_.AbsoluteSize.Y
					)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_185_(L_196_, 0.45, {
					Position = UDim2.new(0, 0, 1, 0)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				if L_191_.Duration then
					L_185_(L_194_, L_191_.Duration, {
						Size = UDim2.new(1, 0, 1, 0)
					}, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut):Play()
					task.wait(L_191_.Duration)
					L_191_:Close()
				end
			end)

			if L_193_ then
				L_183_.AddSignal(L_193_.TextButton.MouseButton1Click, function()
					L_191_:Close()
				end)
			end


			return L_191_
		end

		return L_186_
	end 

	function L_1_.d()











		local L_199_ = 4294967296;
		local L_200_ = L_199_ - 1;
		local function L_201_func(L_249_arg0, L_250_arg1)
			local L_251_, L_252_ = 0, 1;
			while L_249_arg0 ~= 0 or L_250_arg1 ~= 0 do
				local L_253_, L_254_ = L_249_arg0 % 2, L_250_arg1 % 2;
				local L_255_ = (L_253_ + L_254_) % 2;
				L_251_ = L_251_ + L_255_ * L_252_;
				L_249_arg0 = math.floor(L_249_arg0 / 2)
				L_250_arg1 = math.floor(L_250_arg1 / 2)
				L_252_ = L_252_ * 2
			end;
			return L_251_ % L_199_
		end;
		local function L_202_func(L_256_arg0, L_257_arg1, L_258_arg2, ...)
			local L_259_;
			if L_257_arg1 then
				L_256_arg0 = L_256_arg0 % L_199_;
				L_257_arg1 = L_257_arg1 % L_199_;
				L_259_ = L_201_func(L_256_arg0, L_257_arg1)
				if L_258_arg2 then
					L_259_ = L_202_func(L_259_, L_258_arg2, ...)
				end;
				return L_259_
			elseif L_256_arg0 then
				return L_256_arg0 % L_199_
			else
				return 0
			end
		end;
		local function L_203_func(L_260_arg0, L_261_arg1, L_262_arg2, ...)
			local L_263_;
			if L_261_arg1 then
				L_260_arg0 = L_260_arg0 % L_199_;
				L_261_arg1 = L_261_arg1 % L_199_;
				L_263_ = (L_260_arg0 + L_261_arg1 - L_201_func(L_260_arg0, L_261_arg1)) / 2;
				if L_262_arg2 then
					L_263_ = L_203_func(L_263_, L_262_arg2, ...)
				end;
				return L_263_
			elseif L_260_arg0 then
				return L_260_arg0 % L_199_
			else
				return L_200_
			end
		end;
		local function L_204_func(L_264_arg0)
			return L_200_ - L_264_arg0
		end;
		local function L_205_func(L_265_arg0, L_266_arg1)
			if L_266_arg1 < 0 then
				return lshift(L_265_arg0, -L_266_arg1)
			end;
			return math.floor(L_265_arg0 % 4294967296 / 2 ^ L_266_arg1)
		end;
		local function L_206_func(L_267_arg0, L_268_arg1)
			if L_268_arg1 > 31 or L_268_arg1 < -31 then
				return 0
			end;
			return L_205_func(L_267_arg0 % L_199_, L_268_arg1)
		end;
		local function L_207_func(L_269_arg0, L_270_arg1)
			if L_270_arg1 < 0 then
				return L_206_func(L_269_arg0, -L_270_arg1)
			end;
			return L_269_arg0 * 2 ^ L_270_arg1 % 4294967296
		end;
		local function L_208_func(L_271_arg0, L_272_arg1)
			L_271_arg0 = L_271_arg0 % L_199_;
			L_272_arg1 = L_272_arg1 % 32;
			local L_273_ = L_203_func(L_271_arg0, 2 ^ L_272_arg1 - 1)
			return L_206_func(L_271_arg0, L_272_arg1) + L_207_func(L_273_, 32 - L_272_arg1)
		end;
		local L_209_ = {
			1116352408,
			1899447441,
			3049323471,
			3921009573,
			961987163,
			1508970993,
			2453635748,
			2870763221,
			3624381080,
			310598401,
			607225278,
			1426881987,
			1925078388,
			2162078206,
			2614888103,
			3248222580,
			3835390401,
			4022224774,
			264347078,
			604807628,
			770255983,
			1249150122,
			1555081692,
			1996064986,
			2554220882,
			2821834349,
			2952996808,
			3210313671,
			3336571891,
			3584528711,
			113926993,
			338241895,
			666307205,
			773529912,
			1294757372,
			1396182291,
			1695183700,
			1986661051,
			2177026350,
			2456956037,
			2730485921,
			2820302411,
			3259730800,
			3345764771,
			3516065817,
			3600352804,
			4094571909,
			275423344,
			430227734,
			506948616,
			659060556,
			883997877,
			958139571,
			1322822218,
			1537002063,
			1747873779,
			1955562222,
			2024104815,
			2227730452,
			2361852424,
			2428436474,
			2756734187,
			3204031479,
			3329325298
		}
		local function L_210_func(L_274_arg0)
			return string.gsub(L_274_arg0, ".", function(L_275_arg0)
				return string.format("%02x", string.byte(L_275_arg0))
			end)
		end;
		local function L_211_func(L_276_arg0, L_277_arg1)
			local L_278_ = ""
			for L_279_forvar0 = 1, L_277_arg1 do
				local L_280_ = L_276_arg0 % 256;
				L_278_ = string.char(L_280_) .. L_278_;
				L_276_arg0 = (L_276_arg0 - L_280_) / 256
			end;
			return L_278_
		end;
		local function L_212_func(L_281_arg0, L_282_arg1)
			local L_283_ = 0;
			for L_284_forvar0 = L_282_arg1, L_282_arg1 + 3 do
				L_283_ = L_283_ * 256 + string.byte(L_281_arg0, L_284_forvar0)
			end;
			return L_283_
		end;
		local function L_213_func(L_285_arg0, L_286_arg1)
			local L_287_ = 64 - (L_286_arg1 + 9) % 64;
			L_286_arg1 = L_211_func(8 * L_286_arg1, 8)
			L_285_arg0 = L_285_arg0 .. "\128" .. string.rep("\0", L_287_) .. L_286_arg1;
			assert(#L_285_arg0 % 64 == 0)
			return L_285_arg0
		end;
		local function L_214_func(L_288_arg0)
			L_288_arg0[1] = 1779033703;
			L_288_arg0[2] = 3144134277;
			L_288_arg0[3] = 1013904242;
			L_288_arg0[4] = 2773480762;
			L_288_arg0[5] = 1359893119;
			L_288_arg0[6] = 2600822924;
			L_288_arg0[7] = 528734635;
			L_288_arg0[8] = 1541459225;
			return L_288_arg0
		end;
		local function L_215_func(L_289_arg0, L_290_arg1, L_291_arg2)
			local L_292_ = {}
			for L_301_forvar0 = 1, 16 do
				L_292_[L_301_forvar0] = L_212_func(L_289_arg0, L_290_arg1 + (L_301_forvar0 - 1) * 4)
			end;
			for L_302_forvar0 = 17, 64 do
				local L_303_ = L_292_[L_302_forvar0 - 15]
				local L_304_ = L_202_func(L_208_func(L_303_, 7), L_208_func(L_303_, 18), L_206_func(L_303_, 3))
				L_303_ = L_292_[L_302_forvar0 - 2]
				L_292_[L_302_forvar0] = (L_292_[L_302_forvar0 - 16] + L_304_ + L_292_[L_302_forvar0 - 7] + L_202_func(L_208_func(L_303_, 17), L_208_func(L_303_, 19), L_206_func(L_303_, 10))) % L_199_
			end;
			local L_293_, L_294_, L_295_, L_296_, L_297_, L_298_, L_299_, L_300_ = L_291_arg2[1], L_291_arg2[2], L_291_arg2[3], L_291_arg2[4], L_291_arg2[5], L_291_arg2[6], L_291_arg2[7], L_291_arg2[8]
			for L_305_forvar0 = 1, 64 do
				local L_306_ = L_202_func(L_208_func(L_293_, 2), L_208_func(L_293_, 13), L_208_func(L_293_, 22))
				local L_307_ = L_202_func(L_203_func(L_293_, L_294_), L_203_func(L_293_, L_295_), L_203_func(L_294_, L_295_))
				local L_308_ = (L_306_ + L_307_) % L_199_;
				local L_309_ = L_202_func(L_208_func(L_297_, 6), L_208_func(L_297_, 11), L_208_func(L_297_, 25))
				local L_310_ = L_202_func(L_203_func(L_297_, L_298_), L_203_func(L_204_func(L_297_), L_299_))
				local L_311_ = (L_300_ + L_309_ + L_310_ + L_209_[L_305_forvar0] + L_292_[L_305_forvar0]) % L_199_;
				L_300_ = L_299_;
				L_299_ = L_298_;
				L_298_ = L_297_;
				L_297_ = (L_296_ + L_311_) % L_199_;
				L_296_ = L_295_;
				L_295_ = L_294_;
				L_294_ = L_293_;
				L_293_ = (L_311_ + L_308_) % L_199_
			end;
			L_291_arg2[1] = (L_291_arg2[1] + L_293_) % L_199_;
			L_291_arg2[2] = (L_291_arg2[2] + L_294_) % L_199_;
			L_291_arg2[3] = (L_291_arg2[3] + L_295_) % L_199_;
			L_291_arg2[4] = (L_291_arg2[4] + L_296_) % L_199_;
			L_291_arg2[5] = (L_291_arg2[5] + L_297_) % L_199_;
			L_291_arg2[6] = (L_291_arg2[6] + L_298_) % L_199_;
			L_291_arg2[7] = (L_291_arg2[7] + L_299_) % L_199_;
			L_291_arg2[8] = (L_291_arg2[8] + L_300_) % L_199_
		end;
		local function L_216_func(L_312_arg0)
			L_312_arg0 = L_213_func(L_312_arg0, #L_312_arg0)
			local L_313_ = L_214_func{}
			for L_314_forvar0 = 1, #L_312_arg0, 64 do
				L_215_func(L_312_arg0, L_314_forvar0, L_313_)
			end;
			return L_210_func(L_211_func(L_313_[1], 4) .. L_211_func(L_313_[2], 4) .. L_211_func(L_313_[3], 4) .. L_211_func(L_313_[4], 4) .. L_211_func(L_313_[5], 4) .. L_211_func(L_313_[6], 4) .. L_211_func(L_313_[7], 4) .. L_211_func(L_313_[8], 4))
		end;
		local L_217_;
		local L_218_ = {
			["\\"] = "\\",
			["\""] = "\"",
			["\b"] = "b",
			["\f"] = "f",
			["\n"] = "n",
			["\r"] = "r",
			["\t"] = "t"
		}
		local L_219_ = {
			["/"] = "/"
		}
		for L_315_forvar0, L_316_forvar1 in pairs(L_218_) do
			L_219_[L_316_forvar1] = L_315_forvar0
		end;
		local L_220_ = function(L_317_arg0)
			return "\\" .. (L_218_[L_317_arg0] or string.format("u%04x", L_317_arg0:byte()))
		end;
		local L_221_ = function(L_318_arg0)
			return "null"
		end;
		local L_222_ = function(L_319_arg0, L_320_arg1)
			local L_321_ = {}
			L_320_arg1 = L_320_arg1 or {}
			if L_320_arg1[L_319_arg0] then
				error"circular reference"
			end;
			L_320_arg1[L_319_arg0] = true;
			if rawget(L_319_arg0, 1) ~= nil or next(L_319_arg0) == nil then
				local L_322_ = 0;
				for L_323_forvar0 in pairs(L_319_arg0) do
					if type(L_323_forvar0) ~= "number" then
						error"invalid table: mixed or invalid key types"
					end;
					L_322_ = L_322_ + 1
				end;
				if L_322_ ~= #L_319_arg0 then
					error"invalid table: sparse array"
				end;
				for L_324_forvar0, L_325_forvar1 in ipairs(L_319_arg0) do
					table.insert(L_321_, L_217_(L_325_forvar1, L_320_arg1))
				end;
				L_320_arg1[L_319_arg0] = nil;
				return "[" .. table.concat(L_321_, ",") .. "]"
			else
				for L_326_forvar0, L_327_forvar1 in pairs(L_319_arg0) do
					if type(L_326_forvar0) ~= "string" then
						error"invalid table: mixed or invalid key types"
					end;
					table.insert(L_321_, L_217_(L_326_forvar0, L_320_arg1) .. ":" .. L_217_(L_327_forvar1, L_320_arg1))
				end;
				L_320_arg1[L_319_arg0] = nil;
				return "{" .. table.concat(L_321_, ",") .. "}"
			end
		end;
		local L_223_ = function(L_328_arg0)
			return '"' .. L_328_arg0:gsub('[%z\1-\31\\"]', L_220_) .. '"'
		end;
		local L_224_ = function(L_329_arg0)
			if L_329_arg0 ~= L_329_arg0 or L_329_arg0 <= -math.huge or L_329_arg0 >= math.huge then
				error("unexpected number value '" .. tostring(L_329_arg0) .. "'")
			end;
			return string.format("%.14g", L_329_arg0)
		end;
		local L_225_ = {
			["nil"] = L_221_,
			table = L_222_,
			string = L_223_,
			number = L_224_,
			boolean = tostring
		}
		L_217_ = function(L_330_arg0, L_331_arg1)
			local L_332_ = type(L_330_arg0)
			local L_333_ = L_225_[L_332_]
			if L_333_ then
				return L_333_(L_330_arg0, L_331_arg1)
			end;
			error("unexpected type '" .. L_332_ .. "'")
		end;
		local L_226_ = function(L_334_arg0)
			return L_217_(L_334_arg0)
		end;
		local L_227_;
		local L_228_ = function(...)
			local L_335_ = {}
			for L_336_forvar0 = 1, select("#", ...) do
				L_335_[select(L_336_forvar0, ...)] = true
			end;
			return L_335_
		end;
		local L_229_ = L_228_(" ", "\t", "\r", "\n")
		local L_230_ = L_228_(" ", "\t", "\r", "\n", "]", "}", ",")
		local L_231_ = L_228_("\\", "/", '"', "b", "f", "n", "r", "t", "u")
		local L_232_ = L_228_("true", "false", "null")
		local L_233_ = {
			["true"] = true,
			["false"] = false,
			null = nil
		}
		local L_234_ = function(L_337_arg0, L_338_arg1, L_339_arg2, L_340_arg3)
			for L_341_forvar0 = L_338_arg1, #L_337_arg0 do
				if L_339_arg2[L_337_arg0:sub(L_341_forvar0, L_341_forvar0)] ~= L_340_arg3 then
					return L_341_forvar0
				end
			end;
			return #L_337_arg0 + 1
		end;
		local L_235_ = function(L_342_arg0, L_343_arg1, L_344_arg2)
			local L_345_ = 1;
			local L_346_ = 1;
			for L_347_forvar0 = 1, L_343_arg1 - 1 do
				L_346_ = L_346_ + 1;
				if L_342_arg0:sub(L_347_forvar0, L_347_forvar0) == "\n" then
					L_345_ = L_345_ + 1;
					L_346_ = 1
				end
			end;
			error(string.format("%s at line %d col %d", L_344_arg2, L_345_, L_346_))
		end;
		local L_236_ = function(L_348_arg0)
			local L_349_ = math.floor;
			if L_348_arg0 <= 127 then
				return string.char(L_348_arg0)
			elseif L_348_arg0 <= 2047 then
				return string.char(L_349_(L_348_arg0 / 64) + 192, L_348_arg0 % 64 + 128)
			elseif L_348_arg0 <= 65535 then
				return string.char(L_349_(L_348_arg0 / 4096) + 224, L_349_(L_348_arg0 % 4096 / 64) + 128, L_348_arg0 % 64 + 128)
			elseif L_348_arg0 <= 1114111 then
				return string.char(L_349_(L_348_arg0 / 262144) + 240, L_349_(L_348_arg0 % 262144 / 4096) + 128, L_349_(L_348_arg0 % 4096 / 64) + 128, L_348_arg0 % 64 + 128)
			end;
			error(string.format("invalid unicode codepoint '%x'", L_348_arg0))
		end;
		local L_237_ = function(L_350_arg0)
			local L_351_ = tonumber(L_350_arg0:sub(1, 4), 16)
			local L_352_ = tonumber(L_350_arg0:sub(7, 10), 16)
			if L_352_ then
				return L_236_((L_351_ - 55296) * 1024 + L_352_ - 56320 + 65536)
			else
				return L_236_(L_351_)
			end
		end;
		local L_238_ = function(L_353_arg0, L_354_arg1)
			local L_355_ = ""
			local L_356_ = L_354_arg1 + 1;
			local L_357_ = L_356_;
			while L_356_ <= #L_353_arg0 do
				local L_358_ = L_353_arg0:byte(L_356_)
				if L_358_ < 32 then
					L_235_(L_353_arg0, L_356_, "control character in string")
				elseif L_358_ == 92 then
					L_355_ = L_355_ .. L_353_arg0:sub(L_357_, L_356_ - 1)
					L_356_ = L_356_ + 1;
					local L_359_ = L_353_arg0:sub(L_356_, L_356_)
					if L_359_ == "u" then
						local L_360_ = L_353_arg0:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", L_356_ + 1) or L_353_arg0:match("^%x%x%x%x", L_356_ + 1) or L_235_(L_353_arg0, L_356_ - 1, "invalid unicode escape in string")
						L_355_ = L_355_ .. L_237_(L_360_)
						L_356_ = L_356_ + #L_360_
					else
						if not L_231_[L_359_] then
							L_235_(L_353_arg0, L_356_ - 1, "invalid escape char '" .. L_359_ .. "' in string")
						end;
						L_355_ = L_355_ .. L_219_[L_359_]
					end;
					L_357_ = L_356_ + 1
				elseif L_358_ == 34 then
					L_355_ = L_355_ .. L_353_arg0:sub(L_357_, L_356_ - 1)
					return L_355_, L_356_ + 1
				end;
				L_356_ = L_356_ + 1
			end;
			L_235_(L_353_arg0, L_354_arg1, "expected closing quote for string")
		end;
		local L_239_ = function(L_361_arg0, L_362_arg1)
			local L_363_ = L_234_(L_361_arg0, L_362_arg1, L_230_)
			local L_364_ = L_361_arg0:sub(L_362_arg1, L_363_ - 1)
			local L_365_ = tonumber(L_364_)
			if not L_365_ then
				L_235_(L_361_arg0, L_362_arg1, "invalid number '" .. L_364_ .. "'")
			end;
			return L_365_, L_363_
		end;
		local L_240_ = function(L_366_arg0, L_367_arg1)
			local L_368_ = L_234_(L_366_arg0, L_367_arg1, L_230_)
			local L_369_ = L_366_arg0:sub(L_367_arg1, L_368_ - 1)
			if not L_232_[L_369_] then
				L_235_(L_366_arg0, L_367_arg1, "invalid literal '" .. L_369_ .. "'")
			end;
			return L_233_[L_369_], L_368_
		end;
		local L_241_ = function(L_370_arg0, L_371_arg1)
			local L_372_ = {}
			local L_373_ = 1;
			L_371_arg1 = L_371_arg1 + 1;
			while 1 do
				local L_374_;
				L_371_arg1 = L_234_(L_370_arg0, L_371_arg1, L_229_, true)
				if L_370_arg0:sub(L_371_arg1, L_371_arg1) == "]" then
					L_371_arg1 = L_371_arg1 + 1;
					break
				end;
				L_374_, L_371_arg1 = L_227_(L_370_arg0, L_371_arg1)
				L_372_[L_373_] = L_374_;
				L_373_ = L_373_ + 1;
				L_371_arg1 = L_234_(L_370_arg0, L_371_arg1, L_229_, true)
				local L_375_ = L_370_arg0:sub(L_371_arg1, L_371_arg1)
				L_371_arg1 = L_371_arg1 + 1;
				if L_375_ == "]" then
					break
				end;
				if L_375_ ~= "," then
					L_235_(L_370_arg0, L_371_arg1, "expected ']' or ','")
				end
			end;
			return L_372_, L_371_arg1
		end;
		local L_242_ = function(L_376_arg0, L_377_arg1)
			local L_378_ = {}
			L_377_arg1 = L_377_arg1 + 1;
			while 1 do
				local L_379_, L_380_;
				L_377_arg1 = L_234_(L_376_arg0, L_377_arg1, L_229_, true)
				if L_376_arg0:sub(L_377_arg1, L_377_arg1) == "}" then
					L_377_arg1 = L_377_arg1 + 1;
					break
				end;
				if L_376_arg0:sub(L_377_arg1, L_377_arg1) ~= '"' then
					L_235_(L_376_arg0, L_377_arg1, "expected string for key")
				end;
				L_379_, L_377_arg1 = L_227_(L_376_arg0, L_377_arg1)
				L_377_arg1 = L_234_(L_376_arg0, L_377_arg1, L_229_, true)
				if L_376_arg0:sub(L_377_arg1, L_377_arg1) ~= ":" then
					L_235_(L_376_arg0, L_377_arg1, "expected ':' after key")
				end;
				L_377_arg1 = L_234_(L_376_arg0, L_377_arg1 + 1, L_229_, true)
				L_380_, L_377_arg1 = L_227_(L_376_arg0, L_377_arg1)
				L_378_[L_379_] = L_380_;
				L_377_arg1 = L_234_(L_376_arg0, L_377_arg1, L_229_, true)
				local L_381_ = L_376_arg0:sub(L_377_arg1, L_377_arg1)
				L_377_arg1 = L_377_arg1 + 1;
				if L_381_ == "}" then
					break
				end;
				if L_381_ ~= "," then
					L_235_(L_376_arg0, L_377_arg1, "expected '}' or ','")
				end
			end;
			return L_378_, L_377_arg1
		end;
		local L_243_ = {
			['"'] = L_238_,
			["0"] = L_239_,
			["1"] = L_239_,
			["2"] = L_239_,
			["3"] = L_239_,
			["4"] = L_239_,
			["5"] = L_239_,
			["6"] = L_239_,
			["7"] = L_239_,
			["8"] = L_239_,
			["9"] = L_239_,
			["-"] = L_239_,
			t = L_240_,
			f = L_240_,
			n = L_240_,
			["["] = L_241_,
			["{"] = L_242_
		}
		L_227_ = function(L_382_arg0, L_383_arg1)
			local L_384_ = L_382_arg0:sub(L_383_arg1, L_383_arg1)
			local L_385_ = L_243_[L_384_]
			if L_385_ then
				return L_385_(L_382_arg0, L_383_arg1)
			end;
			L_235_(L_382_arg0, L_383_arg1, "unexpected character '" .. L_384_ .. "'")
		end;
		local L_244_ = function(L_386_arg0)
			if type(L_386_arg0) ~= "string" then
				error("expected argument of type string, got " .. type(L_386_arg0))
			end;
			local L_387_, L_388_ = L_227_(L_386_arg0, L_234_(L_386_arg0, 1, L_229_, true))
			L_388_ = L_234_(L_386_arg0, L_388_, L_229_, true)
			if L_388_ <= #L_386_arg0 then
				L_235_(L_386_arg0, L_388_, "trailing garbage")
			end;
			return L_387_
		end;
		local L_245_, L_246_, L_247_ = L_226_, L_244_, L_216_func;





		local L_248_ = {}


		function L_248_.New(L_389_arg0, L_390_arg1)

			local L_391_ = L_389_arg0;
			local L_392_ = L_390_arg1;
			local L_393_ = true;


			local L_394_ = function(L_414_arg0)
			end;


			repeat
				task.wait(1)
			until game:IsLoaded();


			local L_395_ = false;
			local L_396_, L_397_, L_398_, L_399_, L_400_, L_401_, L_402_, L_403_, L_404_ = setclipboard or toclipboard, request or http_request or syn_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function()
				return game:GetService"Players".LocalPlayer.UserId
			end
			local L_405_, L_406_ = "", 0;


			local L_407_ = "https://api.platoboost.com";
			local L_408_ = L_397_{
				Url = L_407_ .. "/public/connectivity",
				Method = "GET"
			};
			if L_408_.StatusCode ~= 200 or L_408_.StatusCode ~= 429 then
				L_407_ = "https://api.platoboost.net";
			end


			function cacheLink()
				if L_406_ + (600) < L_401_() then
					local L_415_ = L_397_{
						Url = L_407_ .. "/public/start",
						Method = "POST",
						Body = L_245_{
							service = L_391_,
							identifier = L_247_(L_404_())
						},
						Headers = {
							["Content-Type"] = "application/json",
							["User-Agent"] = "Roblox/Exploit"
						}
					};

					if L_415_.StatusCode == 200 then
						local L_417_ = L_246_(L_415_.Body);

						if L_417_.success == true then
							L_405_ = L_417_.data.url;
							L_406_ = L_401_();
							return true, L_405_
						else
							L_394_(L_417_.message);
							return false, L_417_.message
						end
					elseif L_415_.StatusCode == 429 then
						local L_418_ = "you are being rate limited, please wait 20 seconds and try again.";
						L_394_(L_418_);
						return false, L_418_
					end

					local L_416_ = "Failed to cache link.";
					L_394_(L_416_);
					return false, L_416_
				else
					return true, L_405_
				end
			end

			cacheLink();


			local L_409_ = function()
				local L_419_ = ""
				for L_420_forvar0 = 1, 16 do
					L_419_ = L_419_ .. L_398_(L_403_(L_402_() * (26)) + 97)
				end
				return L_419_
			end


			for L_421_forvar0 = 1, 5 do
				local L_422_ = L_409_();
				task.wait(0.2)
				if L_409_() == L_422_ then
					local L_423_ = "platoboost nonce error.";
					L_394_(L_423_);
					error(L_423_);
				end
			end


			local L_410_ = function()
				local L_424_, L_425_ = cacheLink();

				if L_424_ then
					L_396_(L_425_);
				end
			end


			local L_411_ = function(L_426_arg0)
				local L_427_ = L_409_();
				local L_428_ = L_407_ .. "/public/redeem/" .. L_399_(L_391_);

				local L_429_ = {
					identifier = L_247_(L_404_()),
					key = L_426_arg0
				}

				if L_393_ then
					L_429_.nonce = L_427_;
				end

				local L_430_ = L_397_{
					Url = L_428_,
					Method = "POST",
					Body = L_245_(L_429_),
					Headers = {
						["Content-Type"] = "application/json"
					}
				};

				if L_430_.StatusCode == 200 then
					local L_431_ = L_246_(L_430_.Body);

					if L_431_.success == true then
						if L_431_.data.valid == true then
							if L_393_ then
								if L_431_.data.hash == L_247_("true" .. "-" .. L_427_ .. "-" .. L_392_) then
									return true
								else
									L_394_"failed to verify integrity.";
									return false
								end
							else
								return true
							end
						else
							L_394_"key is invalid.";
							return false
						end
					else
						if L_400_(L_431_.message, 1, 27) == "unique constraint violation" then
							L_394_"you already have an active key, please wait for it to expire before redeeming it.";
							return false
						else
							L_394_(L_431_.message);
							return false
						end
					end
				elseif L_430_.StatusCode == 429 then
					L_394_"you are being rate limited, please wait 20 seconds and try again.";
					return false
				else
					L_394_"server returned an invalid status code, please try again later.";
					return false
				end
			end


			local L_412_ = function(L_432_arg0)
				if L_395_ == true then
					return false, ("A request is already being sent, please slow down.")
				else
					L_395_ = true;
				end

				local L_433_ = L_409_();
				local L_434_ = L_407_ .. "/public/whitelist/" .. L_399_(L_391_) .. "?identifier=" .. L_247_(L_404_()) .. "&key=" .. L_432_arg0;

				if L_393_ then
					L_434_ = L_434_ .. "&nonce=" .. L_433_;
				end

				local L_435_ = L_397_{
					Url = L_434_,
					Method = "GET",
				};

				L_395_ = false;

				if L_435_.StatusCode == 200 then
					local L_436_ = L_246_(L_435_.Body);

					if L_436_.success == true then
						if L_436_.data.valid == true then
							if L_393_ then
								if L_436_.data.hash == L_247_("true" .. "-" .. L_433_ .. "-" .. L_392_) then
									return true, ""
								else
									return false, ("failed to verify integrity.")
								end
							else
								return true
							end
						else
							if L_400_(L_432_arg0, 1, 4) == "KEY_" then
								return true, L_411_(L_432_arg0)
							else
								return false, ("Key is invalid.")
							end
						end
					else
						return false, (L_436_.message)
					end
				elseif L_435_.StatusCode == 429 then
					return false, ("You are being rate limited, please wait 20 seconds and try again.")
				else
					return false, ("Server returned an invalid status code, please try again later.")
				end
			end


			local L_413_ = function(L_437_arg0)
				local L_438_ = L_409_();
				local L_439_ = L_407_ .. "/public/flag/" .. L_399_(L_391_) .. "?name=" .. L_437_arg0;

				if L_393_ then
					L_439_ = L_439_ .. "&nonce=" .. L_438_;
				end

				local L_440_ = L_397_{
					Url = L_439_,
					Method = "GET",
				};

				if L_440_.StatusCode == 200 then
					local L_441_ = L_246_(L_440_.Body);

					if L_441_.success == true then
						if L_393_ then
							if L_441_.data.hash == L_247_(L_399_(L_441_.data.value) .. "-" .. L_438_ .. "-" .. L_392_) then
								return L_441_.data.value
							else
								L_394_"failed to verify integrity.";
								return nil
							end
						else
							return L_441_.data.value
						end
					else
						L_394_(L_441_.message);
						return nil
					end
				else
					return nil
				end
			end


			return {
				Verify = L_412_,
				GetFlag = L_413_,
				Copy = L_410_,
			}
		end


		return L_248_
	end
	function L_1_.e()








		local L_442_ = game:GetService"HttpService"
		local L_443_ = {}


		function L_443_.New(L_444_arg0)
			local L_445_ = gethwid or function()
				return game:GetService"Players".LocalPlayer.UserId
			end
			local L_446_, L_447_ = request or http_request or syn_request, setclipboard or toclipboard

			function ValidateKey(L_448_arg0)
				local L_449_ = "https://pandadevelopment.net/v2_validation?key=" .. tostring(L_448_arg0) .. "&service=" .. tostring(L_444_arg0) .. "&hwid=" .. tostring(L_445_())


				local L_450_, L_451_ = pcall(function()
					return L_446_{
						Url = L_449_,
						Method = "GET",
						Headers = {
							["User-Agent"] = "Roblox/Exploit"
						}
					}
				end)

				if L_450_ and L_451_ then
					if L_451_.Success then
						local L_452_, L_453_ = pcall(function()
							return L_442_:JSONDecode(L_451_.Body)
						end)

						if L_452_ and L_453_ then
							if L_453_.V2_Authentication and L_453_.V2_Authentication == "success" then

								return true, "Authenticated"
							else
								local L_454_ = L_453_.Key_Information.Notes or "Unknown reason"

								return false, "Authentication failed: " .. L_454_
							end
						else

							return false, "JSON decode error"
						end
					else
						warn("[Pelinda Ov2.5] HTTP request was not successful. Code: " .. tostring(L_451_.StatusCode) .. " Message: " .. L_451_.StatusMessage)
						return false, "HTTP request failed: " .. L_451_.StatusMessage
					end
				else

					return false, "Request pcall error"
				end
			end

			function GetKeyLink()
				return "https://pandadevelopment.net/getkey?service=" .. tostring(L_444_arg0) .. "&hwid=" .. tostring(L_445_())
			end

			function CopyLink()
				return L_447_(GetKeyLink())
			end

			return {
				Verify = ValidateKey,
				Copy = CopyLink
			}
		end

		return L_443_
	end
	function L_1_.f()








		local L_455_ = {}


		function L_455_.New(L_456_arg0, L_457_arg1)
			local L_458_ = "https://sdkapi-public.luarmor.net/library.lua"

			local L_459_ = loadstring(
				game.HttpGetAsync and game:HttpGetAsync(L_458_)
					or HttpService:GetAsync(L_458_)
			)()
			local L_460_ = setclipboard or toclipboard

			L_459_.script_id = L_456_arg0

			function ValidateKey(L_461_arg0)
				local L_462_ = L_459_.check_key(L_461_arg0);


				if (L_462_.code == "KEY_VALID") then
					return true, "Whitelisted!"

				elseif (L_462_.code == "KEY_HWID_LOCKED") then
					return false, "Key linked to a different HWID. Please reset it using our bot"

				elseif (L_462_.code == "KEY_INCORRECT") then
					return false, "Key is wrong or deleted!"
				else
					return false, "Key check failed:" .. L_462_.message .. " Code: " .. L_462_.code
				end
			end

			function CopyLink()
				L_460_(tostring(L_457_arg1))
			end

			return {
				Verify = ValidateKey,
				Copy = CopyLink
			}
		end


		return L_455_
	end
	function L_1_.g()
		return {
			platoboost = {
				Name = "Platoboost",
				Icon = "rbxassetid://75920162824531",
				Args = {
					"ServiceId",
					"Secret"
				},


				New = L_1_.load'd'.New
			},
			pandadevelopment = {
				Name = "Panda Development",
				Icon = "panda",
				Args = {
					"ServiceId"
				},


				New = L_1_.load'e'.New
			},
			luarmor = {
				Name = "Luarmor",
				Icon = "rbxassetid://130918283130165",
				Args = {
					"ScriptId",
					"Discord"
				},


				New = L_1_.load'f'.New
			},

		}
	end
	function L_1_.h()


		return [[
{
    "name": "windui",
    "version": "1.6.53",
    "main": "./dist/main.lua",
    "repository": "https://github.com/Footagesus/WindUI",
    "discord": "https://discord.gg/ftgs-development-hub-1300692552005189632",
    "author": "Footagesus",
    "description": "Roblox UI Library for scripts",
    "license": "MIT",
    "scripts": {
        "dev": "sh build/build.sh dev $INPUT_FILE",
        "build": "sh build/build.sh build $INPUT_FILE",
        "live": "python -m http.server 8642",
        "watch": "chokidar . -i 'node_modules' -i 'dist' -i 'build' -c 'npm run dev --'",
        "live-build": "concurrently \"npm run live\" \"npm run watch --\"",
        "updater": "python updater/main.py"
    },
    "keywords": [
        "ui-library",
        "ui-design",
        "script",
        "script-hub",
        "exploiting"
    ],
    "devDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}]]
	end
	function L_1_.i()

		local L_463_ = {}

		local L_464_ = L_1_.load'a'
		local L_465_ = L_464_.New
		local L_466_ = L_464_.Tween


		function L_463_.New(L_467_arg0, L_468_arg1, L_469_arg2, L_470_arg3, L_471_arg4, L_472_arg5, L_473_arg6)
			L_470_arg3 = L_470_arg3 or "Primary"
			local L_474_ = not L_473_arg6 and 10 or 99
			local L_475_
			if L_468_arg1 and L_468_arg1 ~= "" then
				L_475_ = L_465_("ImageLabel", {
					Image = L_464_.Icon(L_468_arg1)[1],
					ImageRectSize = L_464_.Icon(L_468_arg1)[2].ImageRectSize,
					ImageRectOffset = L_464_.Icon(L_468_arg1)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ImageColor3 = L_470_arg3 == "White" and Color3.new(0, 0, 0) or nil,
					ImageTransparency = L_470_arg3 == "White" and .4 or 0,
					ThemeTag = {
						ImageColor3 = L_470_arg3 ~= "White" and "Icon" or nil,
					}
				})
			end

			local L_476_ = L_465_("TextButton", {
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = "X",
				Parent = L_471_arg4,
				BackgroundTransparency = 1
			}, {
				L_464_.NewRoundFrame(L_474_, "Squircle", {
					ThemeTag = {
						ImageColor3 = L_470_arg3 ~= "White" and "Button" or nil,
					},
					ImageColor3 = L_470_arg3 == "White" and Color3.new(1, 1, 1) or nil,
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Squircle",
					ImageTransparency = L_470_arg3 == "Primary" and 0 or L_470_arg3 == "White" and 0 or 1
				}),

				L_464_.NewRoundFrame(L_474_, "Squircle", {



					ImageColor3 = Color3.new(1, 1, 1),
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Special",
					ImageTransparency = L_470_arg3 == "Secondary" and 0.95 or 1
				}),

				L_464_.NewRoundFrame(L_474_, "Shadow-sm", {



					ImageColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(1, 3, 1, 3),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = "Shadow",

					ImageTransparency = 1,
					Visible = not L_473_arg6
				}),

				L_464_.NewRoundFrame(L_474_, not L_473_arg6 and "SquircleOutline" or "SquircleOutline2", {
					ThemeTag = {
						ImageColor3 = L_470_arg3 ~= "White" and "Outline" or nil,
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageColor3 = L_470_arg3 == "White" and Color3.new(0, 0, 0) or nil,
					ImageTransparency = L_470_arg3 == "Primary" and .95 or .85,
					Name = "SquircleOutline",
				}, {
					L_465_("UIGradient", {
						Rotation = 70,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}
					})
				}),

				L_464_.NewRoundFrame(L_474_, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Frame",
					ThemeTag = {
						ImageColor3 = L_470_arg3 ~= "White" and "Text" or nil
					},
					ImageColor3 = L_470_arg3 == "White" and Color3.new(0, 0, 0) or nil,
					ImageTransparency = 1
				}, {
					L_465_("UIPadding", {
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
					}),
					L_465_("UIListLayout", {
						FillDirection = "Horizontal",
						Padding = UDim.new(0, 8),
						VerticalAlignment = "Center",
						HorizontalAlignment = "Center",
					}),
					L_475_,
					L_465_("TextLabel", {
						BackgroundTransparency = 1,
						FontFace = Font.new(L_464_.Font, Enum.FontWeight.SemiBold),
						Text = L_467_arg0 or "Button",
						ThemeTag = {
							TextColor3 = (L_470_arg3 ~= "Primary" and L_470_arg3 ~= "White") and "Text",
						},
						TextColor3 = L_470_arg3 == "Primary" and Color3.new(1, 1, 1) or L_470_arg3 == "White" and Color3.new(0, 0, 0) or nil,
						AutomaticSize = "XY",
						TextSize = 18,
					})
				})
			})

			L_464_.AddSignal(L_476_.MouseEnter, function()
				L_466_(L_476_.Frame, .047, {
					ImageTransparency = .95
				}):Play()
			end)
			L_464_.AddSignal(L_476_.MouseLeave, function()
				L_466_(L_476_.Frame, .047, {
					ImageTransparency = 1
				}):Play()
			end)
			L_464_.AddSignal(L_476_.MouseButton1Up, function()
				if L_472_arg5 then
					L_472_arg5:Close()()
				end
				if L_469_arg2 then
					L_464_.SafeCallback(L_469_arg2)
				end
			end)

			return L_476_
		end


		return L_463_
	end
	function L_1_.j()
		local L_477_ = {}

		local L_478_ = L_1_.load'a'
		local L_479_ = L_478_.New
		local L_480_ =
			L_478_.Tween


		function L_477_.New(L_481_arg0, L_482_arg1, L_483_arg2, L_484_arg3, L_485_arg4, L_486_arg5, L_487_arg6, L_488_arg7)
			L_484_arg3 = L_484_arg3 or "Input"
			local L_489_ = L_487_arg6 or 10
			local L_490_
			if L_482_arg1 and L_482_arg1 ~= "" then
				L_490_ = L_479_("ImageLabel", {
					Image = L_478_.Icon(L_482_arg1)[1],
					ImageRectSize = L_478_.Icon(L_482_arg1)[2].ImageRectSize,
					ImageRectOffset = L_478_.Icon(L_482_arg1)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = "Icon",
					}
				})
			end

			local L_491_ = L_484_arg3 ~= "Input"

			local L_492_ = L_479_("TextBox", {
				BackgroundTransparency = 1,
				TextSize = 17,
				FontFace = Font.new(L_478_.Font, Enum.FontWeight.Regular),
				Size = UDim2.new(1, L_490_ and -29 or 0, 1, 0),
				PlaceholderText = L_481_arg0,
				ClearTextOnFocus = L_488_arg7 or false,
				ClipsDescendants = true,
				TextWrapped = L_491_,
				MultiLine = L_491_,
				TextXAlignment = "Left",
				TextYAlignment = L_484_arg3 == "Input" and "Center" or "Top",

				ThemeTag = {
					PlaceholderColor3 = "PlaceholderText",
					TextColor3 = "Text",
				},
			})

			local L_493_ = L_479_("Frame", {
				Size = UDim2.new(1, 0, 0, 42),
				Parent = L_483_arg2,
				BackgroundTransparency = 1
			}, {
				L_479_("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L_478_.NewRoundFrame(L_489_, "Squircle", {
						ThemeTag = {
							ImageColor3 = "Accent",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = .97,
					}),
					L_478_.NewRoundFrame(L_489_, "SquircleOutline", {
						ThemeTag = {
							ImageColor3 = "Outline",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = .95,
					}, {













					}),
					L_478_.NewRoundFrame(L_489_, "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						Name = "Frame",
						ImageColor3 = Color3.new(1, 1, 1),
						ImageTransparency = .95
					}, {
						L_479_("UIPadding", {
							PaddingTop = UDim.new(0, L_484_arg3 == "Input" and 0 or 12),
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12),
							PaddingBottom = UDim.new(0, L_484_arg3 == "Input" and 0 or 12),
						}),
						L_479_("UIListLayout", {
							FillDirection = "Horizontal",
							Padding = UDim.new(0, 8),
							VerticalAlignment = L_484_arg3 == "Input" and "Center" or "Top",
							HorizontalAlignment = "Left",
						}),
						L_490_,
						L_492_,
					})
				})
			})










			if L_486_arg5 then
				L_478_.AddSignal(L_492_:GetPropertyChangedSignal"Text", function()
					if L_485_arg4 then
						L_478_.SafeCallback(L_485_arg4, L_492_.Text)
					end
				end)
			else
				L_478_.AddSignal(L_492_.FocusLost, function()
					if L_485_arg4 then
						L_478_.SafeCallback(L_485_arg4, L_492_.Text)
					end
				end)
			end

			return L_493_
		end


		return L_477_
	end
	function L_1_.k()
		local L_494_ = L_1_.load'a'
		local L_495_ = L_494_.New
		local L_496_ = L_494_.Tween



		local L_497_ = {
			Holder = nil,

			Parent = nil,
		}

		function L_497_.Init(L_498_arg0, L_499_arg1)
			Window = L_498_arg0
			L_497_.Parent = L_499_arg1
			return L_497_
		end

		function L_497_.Create(L_500_arg0)
			local L_501_ = {
				UICorner = 24,
				UIPadding = 15,
				UIElements = {}
			}

			if L_500_arg0 then
				L_501_.UIPadding = 0
			end
			if L_500_arg0 then
				L_501_.UICorner = 26
			end

			if not L_500_arg0 then
				L_501_.UIElements.FullScreen = L_495_("Frame", {
					ZIndex = 999,
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromHex"#000000",
					Size = UDim2.new(1, 0, 1, 0),
					Active = false,
					Visible = false,
					Parent = L_497_.Parent or (Window and Window.UIElements and Window.UIElements.Main and Window.UIElements.Main.Main)
				}, {
					L_495_("UICorner", {
						CornerRadius = UDim.new(0, Window.UICorner)
					})
				})
			end

			L_501_.UIElements.Main = L_495_("Frame", {
				Size = UDim2.new(0, 280, 0, 0),
				ThemeTag = {
					BackgroundColor3 = "Dialog",
				},
				AutomaticSize = "Y",
				BackgroundTransparency = 1,
				Visible = false,
				ZIndex = 99999,
			}, {
				L_495_("UIPadding", {
					PaddingTop = UDim.new(0, L_501_.UIPadding),
					PaddingLeft = UDim.new(0, L_501_.UIPadding),
					PaddingRight = UDim.new(0, L_501_.UIPadding),
					PaddingBottom = UDim.new(0, L_501_.UIPadding),
				})
			})

			L_501_.UIElements.MainContainer = L_494_.NewRoundFrame(L_501_.UICorner, "Squircle", {
				Visible = false,

				ImageTransparency = L_500_arg0 and 0.15 or 0,
				Parent = L_500_arg0 and L_497_.Parent or L_501_.UIElements.FullScreen,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutomaticSize = "XY",
				ThemeTag = {
					ImageColor3 = "Dialog"
				},
				ZIndex = 9999,
			}, {





				L_501_.UIElements.Main,



				L_494_.NewRoundFrame(L_501_.UICorner, "SquircleOutline2", {
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 1,
					ThemeTag = {
						ImageColor3 = "Outline",
					},
				}, {
					L_495_("UIGradient", {
						Rotation = 45,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0.55),
							NumberSequenceKeypoint.new(0.5, 0.8),
							NumberSequenceKeypoint.new(1, 0.6)
						}
					})
				})
			})

			function L_501_.Open(L_502_arg0)
				if not L_500_arg0 then
					L_501_.UIElements.FullScreen.Visible = true
					L_501_.UIElements.FullScreen.Active = true
				end

				task.spawn(function()
					L_501_.UIElements.MainContainer.Visible = true

					if not L_500_arg0 then
						L_496_(L_501_.UIElements.FullScreen, 0.1, {
							BackgroundTransparency = .3
						}):Play()
					end
					L_496_(L_501_.UIElements.MainContainer, 0.1, {
						ImageTransparency = 0
					}):Play()


					task.spawn(function()
						task.wait(0.05)
						L_501_.UIElements.Main.Visible = true
					end)
				end)
			end
			function L_501_.Close(L_503_arg0)
				if not L_500_arg0 then
					L_496_(L_501_.UIElements.FullScreen, 0.1, {
						BackgroundTransparency = 1
					}):Play()
					L_501_.UIElements.FullScreen.Active = false
					task.spawn(function()
						task.wait(.1)
						L_501_.UIElements.FullScreen.Visible = false
					end)
				end
				L_501_.UIElements.Main.Visible = false

				L_496_(L_501_.UIElements.MainContainer, 0.1, {
					ImageTransparency = 1
				}):Play()



				task.spawn(function()
					task.wait(.1)
					if not L_500_arg0 then
						L_501_.UIElements.FullScreen:Destroy()
					else
						L_501_.UIElements.MainContainer:Destroy()
					end
				end)

				return function()
				end
			end


			return L_501_
		end

		return L_497_
	end
	function L_1_.l()
		local L_504_ = {}


		local L_505_ = L_1_.load'a'
		local L_506_ = L_505_.New
		local L_507_ = L_505_.Tween

		local L_508_ = L_1_.load'i'.New
		local L_509_ = L_1_.load'j'.New

		function L_504_.new(L_510_arg0, L_511_arg1, L_512_arg2)
			local L_513_ = L_1_.load'k'.Init(nil, L_510_arg0.WindUI.ScreenGui.KeySystem)
			local L_514_ = L_513_.Create(true)

			local L_515_ = {}

			local L_516_

			local L_517_ = (L_510_arg0.KeySystem.Thumbnail and L_510_arg0.KeySystem.Thumbnail.Width) or 200

			local L_518_ = 430
			if L_510_arg0.KeySystem.Thumbnail and L_510_arg0.KeySystem.Thumbnail.Image then
				L_518_ = 430 + (L_517_ / 2)
			end

			L_514_.UIElements.Main.AutomaticSize = "Y"
			L_514_.UIElements.Main.Size = UDim2.new(0, L_518_, 0, 0)

			local L_519_

			if L_510_arg0.Icon then

				L_519_ = L_505_.Image(
					L_510_arg0.Icon,
					L_510_arg0.Title .. ":" .. L_510_arg0.Icon,
					0,
					"Temp",
					"KeySystem",
					L_510_arg0.IconThemed
				)
				L_519_.Size = UDim2.new(0, 24, 0, 24)
				L_519_.LayoutOrder = -1
			end

			local L_520_ = L_506_("TextLabel", {
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				Text = L_510_arg0.Title,
				FontFace = Font.new(L_505_.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = "Text",
				},
				TextSize = 20
			})
			local L_521_ = L_506_("TextLabel", {
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				Text = "Key System",
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				TextTransparency = 1,
				FontFace = Font.new(L_505_.Font, Enum.FontWeight.Medium),
				ThemeTag = {
					TextColor3 = "Text",
				},
				TextSize = 16
			})

			local L_522_ = L_506_("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			}, {
				L_506_("UIListLayout", {
					Padding = UDim.new(0, 14),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center"
				}),
				L_519_,
				L_520_
			})

			local L_523_ = L_506_("Frame", {
				AutomaticSize = "Y",
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
			}, {





				L_522_,
				L_521_,
			})

			local L_524_ = L_509_("Enter Key", "key", nil, "Input", function(L_531_arg0)
				L_516_ = L_531_arg0
			end)

			local L_525_
			if L_510_arg0.KeySystem.Note and L_510_arg0.KeySystem.Note ~= "" then
				L_525_ = L_506_("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					FontFace = Font.new(L_505_.Font, Enum.FontWeight.Medium),
					TextXAlignment = "Left",
					Text = L_510_arg0.KeySystem.Note,
					TextSize = 18,
					TextTransparency = .4,
					ThemeTag = {
						TextColor3 = "Text",
					},
					BackgroundTransparency = 1,
					RichText = true,
					TextWrapped = true,
				})
			end

			local L_526_ = L_506_("Frame", {
				Size = UDim2.new(1, 0, 0, 42),
				BackgroundTransparency = 1,
			}, {
				L_506_("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = "X",
					Size = UDim2.new(0, 0, 1, 0),
				}, {
					L_506_("UIListLayout", {
						Padding = UDim.new(0, 9),
						FillDirection = "Horizontal",
					})
				})
			})


			local L_527_
			if L_510_arg0.KeySystem.Thumbnail and L_510_arg0.KeySystem.Thumbnail.Image then
				local L_532_
				if L_510_arg0.KeySystem.Thumbnail.Title then
					L_532_ = L_506_("TextLabel", {
						Text = L_510_arg0.KeySystem.Thumbnail.Title,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextSize = 18,
						FontFace = Font.new(L_505_.Font, Enum.FontWeight.Medium),
						BackgroundTransparency = 1,
						AutomaticSize = "XY",
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
					})
				end
				L_527_ = L_506_("ImageLabel", {
					Image = L_510_arg0.KeySystem.Thumbnail.Image,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, L_517_, 1, -12),
					Position = UDim2.new(0, 6, 0, 6),
					Parent = L_514_.UIElements.Main,
					ScaleType = "Crop"
				}, {
					L_532_,
					L_506_("UICorner", {
						CornerRadius = UDim.new(0, 20),
					})
				})
			end

			L_506_("Frame", {

				Size = UDim2.new(1, L_527_ and -L_517_ or 0, 1, 0),
				Position = UDim2.new(0, L_527_ and L_517_ or 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = L_514_.UIElements.Main
			}, {
				L_506_("Frame", {

					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L_506_("UIListLayout", {
						Padding = UDim.new(0, 18),
						FillDirection = "Vertical",
					}),
					L_523_,
					L_525_,
					L_524_,
					L_526_,
					L_506_("UIPadding", {
						PaddingTop = UDim.new(0, 16),
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
						PaddingBottom = UDim.new(0, 16),
					})
				}),
			})





			local L_528_ = L_508_("Exit", "log-out", function()
				L_514_:Close()()
			end, "Tertiary", L_526_.Frame)

			if L_527_ then
				L_528_.Parent = L_527_
				L_528_.Size = UDim2.new(0, 0, 0, 42)
				L_528_.Position = UDim2.new(0, 10, 1, -10)
				L_528_.AnchorPoint = Vector2.new(0, 1)
			end

			if L_510_arg0.KeySystem.URL then
				L_508_("Get key", "key", function()
					setclipboard(L_510_arg0.KeySystem.URL)
				end, "Secondary", L_526_.Frame)
			end

			if L_510_arg0.KeySystem.API then








				local L_533_ = 240
				local L_534_ = false
				local L_535_ = L_508_("Get key", "key", nil, "Secondary", L_526_.Frame)

				local L_536_ = L_505_.NewRoundFrame(99, "Squircle", {
					Size = UDim2.new(0, 1, 1, 0),
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = .9,
				})

				L_506_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = "X",
					Parent = L_535_.Frame,
				}, {
					L_536_,
					L_506_("UIPadding", {
						PaddingLeft = UDim.new(0, 5),
						PaddingRight = UDim.new(0, 5),
					})
				})

				local L_537_ = L_505_.Image(
					"chevron-down",
					"chevron-down",
					0,
					"Temp",
					"KeySystem",
					true
				)

				L_537_.Size = UDim2.new(1, 0, 1, 0)

				L_506_("Frame", {
					Size = UDim2.new(0, 21, 0, 21),
					Parent = L_535_.Frame,
					BackgroundTransparency = 1,
				}, {
					L_537_
				})

				local L_538_ = L_505_.NewRoundFrame(15, "Squircle", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					ThemeTag = {
						ImageColor3 = "Background",
					},
				}, {
					L_506_("UIPadding", {
						PaddingTop = UDim.new(0, 5),
						PaddingLeft = UDim.new(0, 5),
						PaddingRight = UDim.new(0, 5),
						PaddingBottom = UDim.new(0, 5),
					}),
					L_506_("UIListLayout", {
						FillDirection = "Vertical",
						Padding = UDim.new(0, 5),
					})
				})

				local L_539_ = L_506_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, L_533_, 0, 0),
					ClipsDescendants = true,
					AnchorPoint = Vector2.new(1, 0),
					Parent = L_535_,
					Position = UDim2.new(1, 0, 1, 15)
				}, {
					L_538_
				})

				L_506_("TextLabel", {
					Text = "Select Service",
					BackgroundTransparency = 1,
					FontFace = Font.new(L_505_.Font, Enum.FontWeight.Medium),
					ThemeTag = {
						TextColor3 = "Text"
					},
					TextTransparency = 0.2,
					TextSize = 16,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					TextWrapped = true,
					TextXAlignment = "Left",
					Parent = L_538_,
				}, {
					L_506_("UIPadding", {
						PaddingTop = UDim.new(0, 10),
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10),
						PaddingBottom = UDim.new(0, 10),
					})
				})

				for L_540_forvar0, L_541_forvar1 in next, L_510_arg0.KeySystem.API do
					local L_542_ = L_510_arg0.WindUI.Services[L_541_forvar1.Type]
					if L_542_ then
						local L_543_ = {}
						for L_547_forvar0, L_548_forvar1 in next, L_542_.Args do
							table.insert(L_543_, L_541_forvar1[L_548_forvar1])
						end

						local L_544_ = L_542_.New(table.unpack(L_543_))
						L_544_.Type = L_541_forvar1.Type
						table.insert(L_515_, L_544_)

						local L_545_ = L_505_.Image(
							L_541_forvar1.Icon or L_542_.Icon or Icons[L_541_forvar1.Type] or "user",
							L_541_forvar1.Icon or L_542_.Icon or Icons[L_541_forvar1.Type] or "user",
							0,
							"Temp",
							"KeySystem",
							true
						)
						L_545_.Size = UDim2.new(0, 24, 0, 24)

						local L_546_ = L_505_.NewRoundFrame(10, "Squircle", {
							Size = UDim2.new(1, 0, 0, 0),
							ThemeTag = {
								ImageColor3 = "Text"
							},
							ImageTransparency = 1,
							Parent = L_538_,
							AutomaticSize = "Y",
						}, {
							L_506_("UIListLayout", {
								FillDirection = "Horizontal",
								Padding = UDim.new(0, 10),
								VerticalAlignment = "Center",
							}),
							L_545_,
							L_506_("UIPadding", {
								PaddingTop = UDim.new(0, 10),
								PaddingLeft = UDim.new(0, 10),
								PaddingRight = UDim.new(0, 10),
								PaddingBottom = UDim.new(0, 10),
							}),
							L_506_("Frame", {
								BackgroundTransparency = 1,
								Size = UDim2.new(1, -34, 0, 0),
								AutomaticSize = "Y",
							}, {
								L_506_("UIListLayout", {
									FillDirection = "Vertical",
									Padding = UDim.new(0, 5),
									HorizontalAlignment = "Center",
								}),
								L_506_("TextLabel", {
									Text = L_541_forvar1.Title or L_542_.Name,
									BackgroundTransparency = 1,
									FontFace = Font.new(L_505_.Font, Enum.FontWeight.Medium),
									ThemeTag = {
										TextColor3 = "Text"
									},
									TextTransparency = 0.05,
									TextSize = 18,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = "Y",
									TextWrapped = true,
									TextXAlignment = "Left",
								}),
								L_506_("TextLabel", {
									Text = L_541_forvar1.Desc or "",
									BackgroundTransparency = 1,
									FontFace = Font.new(L_505_.Font, Enum.FontWeight.Regular),
									ThemeTag = {
										TextColor3 = "Text"
									},
									TextTransparency = 0.2,
									TextSize = 16,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = "Y",
									TextWrapped = true,
									Visible = L_541_forvar1.Desc and true or false,
									TextXAlignment = "Left",
								})
							})
						}, true)

						L_505_.AddSignal(L_546_.MouseEnter, function()
							L_507_(L_546_, 0.08, {
								ImageTransparency = .95
							}):Play()
						end)
						L_505_.AddSignal(L_546_.InputEnded, function()
							L_507_(L_546_, 0.08, {
								ImageTransparency = 1
							}):Play()
						end)
						L_505_.AddSignal(L_546_.MouseButton1Click, function()
							L_544_.Copy()
							L_510_arg0.WindUI:Notify{
								Title = "Key System",
								Content = "Key link copied to clipboard.",
								Image = "key",
							}
						end)
					end
				end

				L_505_.AddSignal(L_535_.MouseButton1Click, function()
					if not L_534_ then
						L_507_(L_539_, .3, {
							Size = UDim2.new(0, L_533_, 0, L_538_.AbsoluteSize.Y + 1)
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
						L_507_(L_537_, .3, {
							Rotation = 180
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					else
						L_507_(L_539_, .25, {
							Size = UDim2.new(0, L_533_, 0, 0)
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
						L_507_(L_537_, .25, {
							Rotation = 0
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
					L_534_ = not L_534_
				end)

			end

			local function L_529_func(L_549_arg0)
				L_514_:Close()()
				writefile((L_510_arg0.Folder or L_510_arg0.Title) .. "/" .. L_511_arg1 .. ".key", tostring(L_549_arg0))
				task.wait(.4)
				L_512_arg2(true)
			end

			local L_530_ = L_508_("Submit", "arrow-right", function()
				local L_550_ = tostring(L_516_ or "empty")
				local L_551_ =
					L_510_arg0.Folder or L_510_arg0.Title

				if not L_510_arg0.KeySystem.API then
					local L_552_ = type(L_510_arg0.KeySystem.Key) == "table"
						and table.find(L_510_arg0.KeySystem.Key, L_550_)
						or L_510_arg0.KeySystem.Key == L_550_

					if L_552_ then
						if L_510_arg0.KeySystem.SaveKey then
							L_529_func(L_550_)
						else
							L_514_:Close()()
							task.wait(.4)
							L_512_arg2(true)
						end
					end
				else
					local L_553_, L_554_
					for L_555_forvar0, L_556_forvar1 in next, L_515_ do
						local L_557_, L_558_ = L_556_forvar1.Verify(L_550_)
						if L_557_ then
							L_553_, L_554_ = true, L_558_
							break
						end
						L_554_ = L_558_
					end

					if L_553_ then
						L_529_func(L_550_)
					else
						L_510_arg0.WindUI:Notify{
							Title = "Key System. Error",
							Content = L_554_,
							Icon = "triangle-alert",
						}
					end
				end
			end, "Primary", L_526_)

			L_530_.AnchorPoint = Vector2.new(1, 0.5)
			L_530_.Position = UDim2.new(1, 0, 0.5, 0)










			L_514_:Open()
		end

		return L_504_
	end
	function L_1_.m()


		local function L_559_func(L_562_arg0, L_563_arg1, L_564_arg2, L_565_arg3, L_566_arg4)
			return (L_562_arg0 - L_563_arg1) * (L_566_arg4 - L_565_arg3) / (L_564_arg2 - L_563_arg1) + L_565_arg3
		end

		local function L_560_func(L_567_arg0, L_568_arg1)
			local L_569_ = game:GetService"Workspace".CurrentCamera:ScreenPointToRay(L_567_arg0.X, L_567_arg0.Y)
			return L_569_.Origin + L_569_.Direction * L_568_arg1
		end

		local function L_561_func()
			local L_570_ = game:GetService"Workspace".CurrentCamera.ViewportSize.Y
			return L_559_func(L_570_, 0, 2560, 8, 56)
		end

		return {
			L_560_func,
			L_561_func
		}
	end
	function L_1_.n()



		local L_571_ = L_1_.load'a'
		local L_572_ = L_571_.New


		local L_573_, L_574_ = unpack(L_1_.load'm')
		local L_575_ = Instance.new("Folder", game:GetService"Workspace".CurrentCamera)


		local function L_576_func()
			local L_578_ = L_572_("Part", {
				Name = "Body",
				Color = Color3.new(0, 0, 0),
				Material = Enum.Material.Glass,
				Size = Vector3.new(1, 1, 0),
				Anchored = true,
				CanCollide = false,
				Locked = true,
				CastShadow = false,
				Transparency = 0.98,
			}, {
				L_572_("SpecialMesh", {
					MeshType = Enum.MeshType.Brick,
					Offset = Vector3.new(0, 0, -1),
				}),
			})

			return L_578_
		end


		local function L_577_func(L_579_arg0)
			local L_580_ = {}

			L_579_arg0 = L_579_arg0 or 0.001
			local L_581_ = {
				topLeft = Vector2.new(),
				topRight = Vector2.new(),
				bottomRight = Vector2.new(),
			}
			local L_582_ = L_576_func()
			L_582_.Parent = L_575_

			local function L_583_func(L_587_arg0, L_588_arg1)
				L_581_.topLeft = L_588_arg1
				L_581_.topRight = L_588_arg1 + Vector2.new(L_587_arg0.X, 0)
				L_581_.bottomRight = L_588_arg1 + L_587_arg0
			end

			local function L_584_func()
				local L_589_ = game:GetService"Workspace".CurrentCamera
				if L_589_ then
					L_589_ = L_589_.CFrame
				end
				local L_590_ = L_589_
				if not L_590_ then
					L_590_ = CFrame.new()
				end

				local L_591_ = L_590_
				local L_592_ = L_581_.topLeft
				local L_593_ = L_581_.topRight
				local L_594_ = L_581_.bottomRight

				local L_595_ = L_573_(L_592_, L_579_arg0)
				local L_596_ = L_573_(L_593_, L_579_arg0)
				local L_597_ = L_573_(L_594_, L_579_arg0)

				local L_598_ = (L_596_ - L_595_).Magnitude
				local L_599_ = (L_596_ - L_597_).Magnitude

				L_582_.CFrame =
					CFrame.fromMatrix((L_595_ + L_597_) / 2, L_591_.XVector, L_591_.YVector, L_591_.ZVector)
				L_582_.Mesh.Scale = Vector3.new(L_598_, L_599_, 0)
			end

			local function L_585_func(L_600_arg0)
				local L_601_ = L_574_()
				local L_602_ = L_600_arg0.AbsoluteSize - Vector2.new(L_601_, L_601_)
				local L_603_ = L_600_arg0.AbsolutePosition + Vector2.new(L_601_ / 2, L_601_ / 2)

				L_583_func(L_602_, L_603_)
				task.spawn(L_584_func)
			end

			local function L_586_func()
				local L_604_ = game:GetService"Workspace".CurrentCamera
				if not L_604_ then
					return
				end

				table.insert(L_580_, L_604_:GetPropertyChangedSignal"CFrame":Connect(L_584_func))
				table.insert(L_580_, L_604_:GetPropertyChangedSignal"ViewportSize":Connect(L_584_func))
				table.insert(L_580_, L_604_:GetPropertyChangedSignal"FieldOfView":Connect(L_584_func))
				task.spawn(L_584_func)
			end

			L_582_.Destroying:Connect(function()
				for L_605_forvar0, L_606_forvar1 in L_580_ do
					pcall(function()
						L_606_forvar1:Disconnect()
					end)
				end
			end)

			L_586_func()

			return L_585_func, L_582_
		end

		return function(L_607_arg0)
			local L_608_ = {}
			local L_609_, L_610_ = L_577_func(L_607_arg0)

			local L_611_ = L_572_("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
			})

			L_571_.AddSignal(L_611_:GetPropertyChangedSignal"AbsolutePosition", function()
				L_609_(L_611_)
			end)

			L_571_.AddSignal(L_611_:GetPropertyChangedSignal"AbsoluteSize", function()
				L_609_(L_611_)
			end)

			L_608_.AddParent = function(L_612_arg0)
				L_571_.AddSignal(L_612_arg0:GetPropertyChangedSignal"Visible", function()
					L_608_.SetVisibility(L_612_arg0.Visible)
				end)
			end

			L_608_.SetVisibility = function(L_613_arg0)
				L_610_.Transparency = L_613_arg0 and 0.98 or 1
			end

			L_608_.Frame = L_611_
			L_608_.Model = L_610_

			return L_608_
		end
	end
	function L_1_.o()



		local L_614_ = L_1_.load'a'
		local L_615_ = L_1_.load'n'

		local L_616_ = L_614_.New

		return function(L_617_arg0)
			local L_618_ = {}

			L_618_.Frame = L_616_("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderSizePixel = 0,
			}, {












				L_616_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),

				L_616_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Name = "Background",
					ThemeTag = {
						BackgroundColor3 = "AcrylicMain",
					},
				}, {
					L_616_("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				}),

				L_616_("Frame", {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
				}, {










				}),

				L_616_("ImageLabel", {
					Image = "rbxassetid://9968344105",
					ImageTransparency = 0.98,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
				}, {
					L_616_("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				}),

				L_616_("ImageLabel", {
					Image = "rbxassetid://9968344227",
					ImageTransparency = 0.9,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageTransparency = "AcrylicNoise",
					},
				}, {
					L_616_("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				}),

				L_616_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 2,
				}, {










				}),
			})


			local L_619_

			task.wait()
			if L_617_arg0.UseAcrylic then
				L_619_ = L_615_()

				L_619_.Frame.Parent = L_618_.Frame
				L_618_.Model = L_619_.Model
				L_618_.AddParent = L_619_.AddParent
				L_618_.SetVisibility = L_619_.SetVisibility
			end

			return L_618_, L_619_
		end
	end
	function L_1_.p()



		local L_620_ = {
			AcrylicBlur = L_1_.load'n',

			AcrylicPaint = L_1_.load'o',
		}

		function L_620_.init()
			local L_621_ = Instance.new"DepthOfFieldEffect"
			L_621_.FarIntensity = 0
			L_621_.InFocusRadius = 0.1
			L_621_.NearIntensity = 1

			local L_622_ = {}

			function L_620_.Enable()
				for L_624_forvar0, L_625_forvar1 in pairs(L_622_) do
					L_625_forvar1.Enabled = false
				end
				L_621_.Parent = game:GetService"Lighting"
			end

			function L_620_.Disable()
				for L_626_forvar0, L_627_forvar1 in pairs(L_622_) do
					L_627_forvar1.Enabled = L_627_forvar1.enabled
				end
				L_621_.Parent = nil
			end

			local function L_623_func()
				local function L_628_func(L_629_arg0)
					if L_629_arg0:IsA"DepthOfFieldEffect" then
						L_622_[L_629_arg0] = {
							enabled = L_629_arg0.Enabled
						}
					end
				end

				for L_630_forvar0, L_631_forvar1 in pairs(game:GetService"Lighting":GetChildren()) do
					L_628_func(L_631_forvar1)
				end

				if game:GetService"Workspace".CurrentCamera then
					for L_632_forvar0, L_633_forvar1 in pairs(game:GetService"Workspace".CurrentCamera:GetChildren()) do
						L_628_func(L_633_forvar1)
					end
				end
			end

			L_623_func()
			L_620_.Enable()
		end

		return L_620_
	end
	function L_1_.q()

		local L_634_ = {}

		local L_635_ = L_1_.load'a'
		local L_636_ = L_635_.New
		local L_637_ =
			L_635_.Tween


		function L_634_.new(L_638_arg0)
			local L_639_ = {
				Title = L_638_arg0.Title or "Dialog",
				Content = L_638_arg0.Content,
				Icon = L_638_arg0.Icon,
				IconThemed = L_638_arg0.IconThemed,
				Thumbnail = L_638_arg0.Thumbnail,
				Buttons = L_638_arg0.Buttons,

				IconSize = 22,
			}

			local L_640_ = L_1_.load'k'.Init(nil, L_638_arg0.WindUI.ScreenGui.Popups)
			local L_641_ = L_640_.Create(true)

			local L_642_ = 200

			local L_643_ = 430
			if L_639_.Thumbnail and L_639_.Thumbnail.Image then
				L_643_ = 430 + (L_642_ / 2)
			end

			L_641_.UIElements.Main.AutomaticSize = "Y"
			L_641_.UIElements.Main.Size = UDim2.new(0, L_643_, 0, 0)



			local L_644_

			if L_639_.Icon then
				L_644_ = L_635_.Image(
					L_639_.Icon,
					L_639_.Title .. ":" .. L_639_.Icon,
					0,
					L_638_arg0.WindUI.Window,
					"Popup",
					true,
					L_638_arg0.IconThemed
				)
				L_644_.Size = UDim2.new(0, L_639_.IconSize, 0, L_639_.IconSize)
				L_644_.LayoutOrder = -1
			end


			local L_645_ = L_636_("TextLabel", {
				AutomaticSize = "Y",
				BackgroundTransparency = 1,
				Text = L_639_.Title,
				TextXAlignment = "Left",
				FontFace = Font.new(L_635_.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = "Text",
				},
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, L_644_ and -L_639_.IconSize - 14 or 0, 0, 0)
			})

			local L_646_ = L_636_("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			}, {
				L_636_("UIListLayout", {
					Padding = UDim.new(0, 14),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center"
				}),
				L_644_,
				L_645_
			})

			local L_647_ = L_636_("Frame", {
				AutomaticSize = "Y",
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
			}, {





				L_646_,
			})

			local L_648_
			if L_639_.Content and L_639_.Content ~= "" then
				L_648_ = L_636_("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					FontFace = Font.new(L_635_.Font, Enum.FontWeight.Medium),
					TextXAlignment = "Left",
					Text = L_639_.Content,
					TextSize = 18,
					TextTransparency = .2,
					ThemeTag = {
						TextColor3 = "Text",
					},
					BackgroundTransparency = 1,
					RichText = true,
					TextWrapped = true,
				})
			end

			local L_649_ = L_636_("Frame", {
				Size = UDim2.new(1, 0, 0, 42),
				BackgroundTransparency = 1,
			}, {
				L_636_("UIListLayout", {
					Padding = UDim.new(0, 9),
					FillDirection = "Horizontal",
					HorizontalAlignment = "Right"
				})
			})

			local L_650_
			if L_639_.Thumbnail and L_639_.Thumbnail.Image then
				local L_652_
				if L_639_.Thumbnail.Title then
					L_652_ = L_636_("TextLabel", {
						Text = L_639_.Thumbnail.Title,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextSize = 18,
						FontFace = Font.new(L_635_.Font, Enum.FontWeight.Medium),
						BackgroundTransparency = 1,
						AutomaticSize = "XY",
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
					})
				end
				L_650_ = L_636_("ImageLabel", {
					Image = L_639_.Thumbnail.Image,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, L_642_, 1, 0),
					Parent = L_641_.UIElements.Main,
					ScaleType = "Crop"
				}, {
					L_652_,
					L_636_("UICorner", {
						CornerRadius = UDim.new(0, 0),
					})
				})
			end

			L_636_("Frame", {

				Size = UDim2.new(1, L_650_ and -L_642_ or 0, 1, 0),
				Position = UDim2.new(0, L_650_ and L_642_ or 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = L_641_.UIElements.Main
			}, {
				L_636_("Frame", {

					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L_636_("UIListLayout", {
						Padding = UDim.new(0, 18),
						FillDirection = "Vertical",
					}),
					L_647_,
					L_648_,
					L_649_,
					L_636_("UIPadding", {
						PaddingTop = UDim.new(0, 16),
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
						PaddingBottom = UDim.new(0, 16),
					})
				}),
			})

			local L_651_ = L_1_.load'i'.New

			for L_653_forvar0, L_654_forvar1 in next, L_639_.Buttons do
				L_651_(L_654_forvar1.Title, L_654_forvar1.Icon, L_654_forvar1.Callback, L_654_forvar1.Variant, L_649_, L_641_)
			end

			L_641_:Open()


			return L_639_
		end

		return L_634_
	end
	function L_1_.r()
		return function(L_655_arg0)
			return {
				Dark = {
					Name = "Dark",

					Accent = Color3.fromHex"#18181b",
					Dialog = Color3.fromHex"#161616",
					Outline = Color3.fromHex"#FFFFFF",
					Text = Color3.fromHex"#FFFFFF",
					Placeholder = Color3.fromHex"#7a7a7a",
					Background = Color3.fromHex"#101010",
					Button = Color3.fromHex"#52525b",
					Icon = Color3.fromHex"#a1a1aa"
				},
				Light = {
					Name = "Light",

					Accent = Color3.fromHex"#FFFFFF",
					Dialog = Color3.fromHex"#f4f4f5",
					Outline = Color3.fromHex"#09090b",
					Text = Color3.fromHex"#000000",
					Placeholder = Color3.fromHex"#555555",
					Background = Color3.fromHex"#e4e4e7",
					Button = Color3.fromHex"#18181b",
					Icon = Color3.fromHex"#52525b",
				},
				Rose = {
					Name = "Rose",

					Accent = Color3.fromHex"#be185d",
					Dialog = Color3.fromHex"#4c0519",
					Outline = Color3.fromHex"#fecdd3",
					Text = Color3.fromHex"#fdf2f8",
					Placeholder = Color3.fromHex"#d67aa6",
					Background = Color3.fromHex"#1f0308",
					Button = Color3.fromHex"#e11d48",
					Icon = Color3.fromHex"#fb7185",
				},
				Plant = {
					Name = "Plant",

					Accent = Color3.fromHex"#166534",
					Dialog = Color3.fromHex"#052e16",
					Outline = Color3.fromHex"#bbf7d0",
					Text = Color3.fromHex"#f0fdf4",
					Placeholder = Color3.fromHex"#4fbf7a",
					Background = Color3.fromHex"#0a1b0f",
					Button = Color3.fromHex"#16a34a",
					Icon = Color3.fromHex"#4ade80",
				},
				Red = {
					Name = "Red",

					Accent = Color3.fromHex"#991b1b",
					Dialog = Color3.fromHex"#450a0a",
					Outline = Color3.fromHex"#fecaca",
					Text = Color3.fromHex"#fef2f2",
					Placeholder = Color3.fromHex"#d95353",
					Background = Color3.fromHex"#1c0606",
					Button = Color3.fromHex"#dc2626",
					Icon = Color3.fromHex"#ef4444",
				},
				Indigo = {
					Name = "Indigo",

					Accent = Color3.fromHex"#3730a3",
					Dialog = Color3.fromHex"#1e1b4b",
					Outline = Color3.fromHex"#c7d2fe",
					Text = Color3.fromHex"#f1f5f9",
					Placeholder = Color3.fromHex"#7078d9",
					Background = Color3.fromHex"#0f0a2e",
					Button = Color3.fromHex"#4f46e5",
					Icon = Color3.fromHex"#6366f1",
				},
				Sky = {
					Name = "Sky",

					Accent = Color3.fromHex"#0369a1",
					Dialog = Color3.fromHex"#0c4a6e",
					Outline = Color3.fromHex"#bae6fd",
					Text = Color3.fromHex"#f0f9ff",
					Placeholder = Color3.fromHex"#4fb6d9",
					Background = Color3.fromHex"#041f2e",
					Button = Color3.fromHex"#0284c7",
					Icon = Color3.fromHex"#0ea5e9",
				},
				Violet = {
					Name = "Violet",

					Accent = Color3.fromHex"#6d28d9",
					Dialog = Color3.fromHex"#3c1361",
					Outline = Color3.fromHex"#ddd6fe",
					Text = Color3.fromHex"#faf5ff",
					Placeholder = Color3.fromHex"#8f7ee0",
					Background = Color3.fromHex"#1e0a3e",
					Button = Color3.fromHex"#7c3aed",
					Icon = Color3.fromHex"#8b5cf6",
				},
				Amber = {
					Name = "Amber",

					Accent = Color3.fromHex"#b45309",
					Dialog = Color3.fromHex"#451a03",
					Outline = Color3.fromHex"#fde68a",
					Text = Color3.fromHex"#fffbeb",
					Placeholder = Color3.fromHex"#d1a326",
					Background = Color3.fromHex"#1c1003",
					Button = Color3.fromHex"#d97706",
					Icon = Color3.fromHex"#f59e0b",
				},
				Emerald = {
					Name = "Emerald",

					Accent = Color3.fromHex"#047857",
					Dialog = Color3.fromHex"#022c22",
					Outline = Color3.fromHex"#a7f3d0",
					Text = Color3.fromHex"#ecfdf5",
					Placeholder = Color3.fromHex"#3fbf8f",
					Background = Color3.fromHex"#011411",
					Button = Color3.fromHex"#059669",
					Icon = Color3.fromHex"#10b981",
				},
				Midnight = {
					Name = "Midnight",

					Accent = Color3.fromHex"#1e3a8a",
					Dialog = Color3.fromHex"#0c1e42",
					Outline = Color3.fromHex"#bfdbfe",
					Text = Color3.fromHex"#dbeafe",
					Placeholder = Color3.fromHex"#2f74d1",
					Background = Color3.fromHex"#0a0f1e",
					Button = Color3.fromHex"#2563eb",
					Icon = Color3.fromHex"#3b82f6",
				},
				Crimson = {
					Name = "Crimson",

					Accent = Color3.fromHex"#b91c1c",
					Dialog = Color3.fromHex"#450a0a",
					Outline = Color3.fromHex"#fca5a5",
					Text = Color3.fromHex"#fef2f2",
					Placeholder = Color3.fromHex"#6f757b",
					Background = Color3.fromHex"#0c0404",
					Button = Color3.fromHex"#991b1b",
					Icon = Color3.fromHex"#dc2626",
				},
				MonokaiPro = {
					Name = "Monokai Pro",

					Accent = Color3.fromHex"#fc9867",
					Dialog = Color3.fromHex"#1e1e1e",
					Outline = Color3.fromHex"#78dce8",
					Text = Color3.fromHex"#fcfcfa",
					Placeholder = Color3.fromHex"#6f6f6f",
					Background = Color3.fromHex"#191622",
					Button = Color3.fromHex"#ab9df2",
					Icon = Color3.fromHex"#a9dc76",
				},
				CottonCandy = {
					Name = "Cotton Candy",

					Accent = Color3.fromHex"#ec4899",
					Dialog = Color3.fromHex"#2d1b3d",
					Outline = Color3.fromHex"#f9a8d4",
					Text = Color3.fromHex"#fdf2f8",
					Placeholder = Color3.fromHex"#8a5fd3",
					Background = Color3.fromHex"#1a0b2e",
					Button = Color3.fromHex"#d946ef",
					Icon = Color3.fromHex"#06b6d4",
				},
				Rainbow = {
					Name = "Rainbow",

					Accent = L_655_arg0:Gradient({
						["0"] = {
							Color = Color3.fromHex"#00ff41",
							Transparency = 0
						},
						["33"] = {
							Color = Color3.fromHex"#00ffff",
							Transparency = 0
						},
						["66"] = {
							Color = Color3.fromHex"#0080ff",
							Transparency = 0
						},
						["100"] = {
							Color = Color3.fromHex"#8000ff",
							Transparency = 0
						},
					}, {
						Rotation = 45,
					}),

					Dialog = L_655_arg0:Gradient({
						["0"] = {
							Color = Color3.fromHex"#ff0080",
							Transparency = 0
						},
						["25"] = {
							Color = Color3.fromHex"#8000ff",
							Transparency = 0
						},
						["50"] = {
							Color = Color3.fromHex"#0080ff",
							Transparency = 0
						},
						["75"] = {
							Color = Color3.fromHex"#00ff80",
							Transparency = 0
						},
						["100"] = {
							Color = Color3.fromHex"#ff8000",
							Transparency = 0
						},
					}, {
						Rotation = 135,
					}),

					Outline = Color3.fromHex"#ffffff",
					Text = Color3.fromHex"#ffffff",

					Placeholder = Color3.fromHex"#00ff80",

					Background = L_655_arg0:Gradient({
						["0"] = {
							Color = Color3.fromHex"#ff0040",
							Transparency = 0
						},
						["20"] = {
							Color = Color3.fromHex"#ff4000",
							Transparency = 0
						},
						["40"] = {
							Color = Color3.fromHex"#ffff00",
							Transparency = 0
						},
						["60"] = {
							Color = Color3.fromHex"#00ff40",
							Transparency = 0
						},
						["80"] = {
							Color = Color3.fromHex"#0040ff",
							Transparency = 0
						},
						["100"] = {
							Color = Color3.fromHex"#4000ff",
							Transparency = 0
						},
					}, {
						Rotation = 90,
					}),

					Button = L_655_arg0:Gradient({
						["0"] = {
							Color = Color3.fromHex"#ff0080",
							Transparency = 0
						},
						["25"] = {
							Color = Color3.fromHex"#ff8000",
							Transparency = 0
						},
						["50"] = {
							Color = Color3.fromHex"#ffff00",
							Transparency = 0
						},
						["75"] = {
							Color = Color3.fromHex"#80ff00",
							Transparency = 0
						},
						["100"] = {
							Color = Color3.fromHex"#00ffff",
							Transparency = 0
						},
					}, {
						Rotation = 60,
					}),

					Icon = Color3.fromHex"#ffffff",
				}
			}
		end
	end
	function L_1_.s()
		local L_656_ = {}

		local L_657_ = L_1_.load'a'
		local L_658_ = L_657_.New
		local L_659_ =
			L_657_.Tween


		function L_656_.New(L_660_arg0, L_661_arg1, L_662_arg2, L_663_arg3)
			local L_664_ = 10
			local L_665_
			if L_661_arg1 and L_661_arg1 ~= "" then
				L_665_ = L_658_("ImageLabel", {
					Image = L_657_.Icon(L_661_arg1)[1],
					ImageRectSize = L_657_.Icon(L_661_arg1)[2].ImageRectSize,
					ImageRectOffset = L_657_.Icon(L_661_arg1)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = "Icon",
					}
				})
			end

			local L_666_ = L_658_("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 17,
				FontFace = Font.new(L_657_.Font, Enum.FontWeight.Regular),
				Size = UDim2.new(1, L_665_ and -29 or 0, 1, 0),
				TextXAlignment = "Left",
				ThemeTag = {
					TextColor3 = L_663_arg3 and "Placeholder" or "Text",
				},
				Text = L_660_arg0,
			})

			local L_667_ = L_658_("TextButton", {
				Size = UDim2.new(1, 0, 0, 42),
				Parent = L_662_arg2,
				BackgroundTransparency = 1,
				Text = "",
			}, {
				L_658_("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L_657_.NewRoundFrame(L_664_, "Squircle", {
						ThemeTag = {
							ImageColor3 = "Accent",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = .97,
					}),
					L_657_.NewRoundFrame(L_664_, "SquircleOutline", {
						ThemeTag = {
							ImageColor3 = "Outline",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = .95,
					}, {
						L_658_("UIGradient", {
							Rotation = 70,
							Color = ColorSequence.new{
								ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
							},
							Transparency = NumberSequence.new{
								NumberSequenceKeypoint.new(0.0, 0.1),
								NumberSequenceKeypoint.new(0.5, 1),
								NumberSequenceKeypoint.new(1.0, 0.1),
							}
						})
					}),
					L_657_.NewRoundFrame(L_664_, "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						Name = "Frame",
						ImageColor3 = Color3.new(1, 1, 1),
						ImageTransparency = .95
					}, {
						L_658_("UIPadding", {
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12),
						}),
						L_658_("UIListLayout", {
							FillDirection = "Horizontal",
							Padding = UDim.new(0, 8),
							VerticalAlignment = "Center",
							HorizontalAlignment = "Left",
						}),
						L_665_,
						L_666_,
					})
				})
			})

			return L_667_
		end


		return L_656_
	end
	function L_1_.t()
		local L_668_ = {}

		local L_669_ = game:GetService"UserInputService"

		local L_670_ = L_1_.load'a'
		local L_671_ = L_670_.New
		local L_672_ =
			L_670_.Tween


		function L_668_.New(L_673_arg0, L_674_arg1, L_675_arg2, L_676_arg3)
			local L_677_ = L_671_("Frame", {
				Size = UDim2.new(0, L_676_arg3, 1, 0),
				BackgroundTransparency = 1,
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				Parent = L_674_arg1,
				ZIndex = 999,
				Active = true,
			})

			local L_678_ = L_670_.NewRoundFrame(L_676_arg3 / 2, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				ImageTransparency = 0.85,
				ThemeTag = {
					ImageColor3 = "Text"
				},
				Parent = L_677_,
			})

			local L_679_ = L_671_("Frame", {
				Size = UDim2.new(1, 12, 1, 12),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Active = true,
				ZIndex = 999,
				Parent = L_678_,
			})

			local L_680_ = false
			local L_681_ = 0

			local function L_682_func()
				local L_685_ = L_673_arg0
				local L_686_ = L_685_.AbsoluteCanvasSize.Y
				local L_687_ = L_685_.AbsoluteWindowSize.Y

				if L_686_ <= L_687_ then
					L_678_.Visible = false
					return
				end

				local L_688_ = math.clamp(L_687_ / L_686_, 0.1, 1)
				L_678_.Size = UDim2.new(1, 0, L_688_, 0)
				L_678_.Visible = true
			end

			local function L_683_func()
				local L_689_ = L_678_.Position.Y.Scale
				local L_690_ = L_673_arg0.AbsoluteCanvasSize.Y
				local L_691_ = L_673_arg0.AbsoluteWindowSize.Y
				local L_692_ = math.max(L_690_ - L_691_, 0)

				if L_692_ <= 0 then
					return
				end

				local L_693_ = math.max(1 - L_678_.Size.Y.Scale, 0)
				if L_693_ <= 0 then
					return
				end

				local L_694_ = L_689_ / L_693_

				L_673_arg0.CanvasPosition = Vector2.new(
					L_673_arg0.CanvasPosition.X,
					L_694_ * L_692_
				)
			end

			local function L_684_func()
				if L_680_ then
					return
				end

				local L_695_ = L_673_arg0.CanvasPosition.Y
				local L_696_ = L_673_arg0.AbsoluteCanvasSize.Y
				local L_697_ = L_673_arg0.AbsoluteWindowSize.Y
				local L_698_ = math.max(L_696_ - L_697_, 0)

				if L_698_ <= 0 then
					L_678_.Position = UDim2.new(0, 0, 0, 0)
					return
				end

				local L_699_ = L_695_ / L_698_
				local L_700_ = math.max(1 - L_678_.Size.Y.Scale, 0)
				local L_701_ = math.clamp(L_699_ * L_700_, 0, L_700_)

				L_678_.Position = UDim2.new(0, 0, L_701_, 0)
			end

			L_670_.AddSignal(L_677_.InputBegan, function(L_702_arg0)
				if (L_702_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_702_arg0.UserInputType == Enum.UserInputType.Touch) then
					local L_703_ = L_678_.AbsolutePosition.Y
					local L_704_ = L_703_ + L_678_.AbsoluteSize.Y

					if not(L_702_arg0.Position.Y >= L_703_ and L_702_arg0.Position.Y <= L_704_) then
						local L_705_ = L_677_.AbsolutePosition.Y
						local L_706_ = L_677_.AbsoluteSize.Y
						local L_707_ = L_678_.AbsoluteSize.Y

						local L_708_ = L_702_arg0.Position.Y - L_705_ - L_707_ / 2
						local L_709_ = L_706_ - L_707_

						local L_710_ = math.clamp(L_708_ / L_709_, 0, 1 - L_678_.Size.Y.Scale)

						L_678_.Position = UDim2.new(0, 0, L_710_, 0)
						L_683_func()
					end
				end
			end)

			L_670_.AddSignal(L_679_.InputBegan, function(L_711_arg0)
				if L_711_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_711_arg0.UserInputType == Enum.UserInputType.Touch then
					L_680_ = true
					L_681_ = L_711_arg0.Position.Y - L_678_.AbsolutePosition.Y

					local L_712_
					local L_713_

					L_712_ = L_669_.InputChanged:Connect(function(L_714_arg0)
						if L_714_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_714_arg0.UserInputType == Enum.UserInputType.Touch then
							local L_715_ = L_677_.AbsolutePosition.Y
							local L_716_ = L_677_.AbsoluteSize.Y
							local L_717_ = L_678_.AbsoluteSize.Y

							local L_718_ = L_714_arg0.Position.Y - L_715_ - L_681_
							local L_719_ = L_716_ - L_717_

							local L_720_ = math.clamp(L_718_ / L_719_, 0, 1 - L_678_.Size.Y.Scale)

							L_678_.Position = UDim2.new(0, 0, L_720_, 0)
							L_683_func()
						end
					end)

					L_713_ = L_669_.InputEnded:Connect(function(L_721_arg0)
						if L_721_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_721_arg0.UserInputType == Enum.UserInputType.Touch then
							L_680_ = false
							if L_712_ then
								L_712_:Disconnect()
							end
							if L_713_ then
								L_713_:Disconnect()
							end
						end
					end)
				end
			end)

			L_670_.AddSignal(L_673_arg0:GetPropertyChangedSignal"AbsoluteWindowSize", function()
				L_682_func()
				L_684_func()
			end)

			L_670_.AddSignal(L_673_arg0:GetPropertyChangedSignal"AbsoluteCanvasSize", function()
				L_682_func()
				L_684_func()
			end)

			L_670_.AddSignal(L_673_arg0:GetPropertyChangedSignal"CanvasPosition", function()
				if not L_680_ then
					L_684_func()
				end
			end)

			L_682_func()
			L_684_func()

			return L_677_
		end


		return L_668_
	end
	function L_1_.u()
		local L_722_ = {}


		local L_723_ = L_1_.load'a'
		local L_724_ = L_723_.New
		local L_725_ = L_723_.Tween

		local function L_726_func(L_730_arg0)
			local L_731_, L_732_, L_733_ = L_730_arg0.R, L_730_arg0.G, L_730_arg0.B
			local L_734_ = math.max(L_731_, L_732_, L_733_)
			local L_735_ = math.min(L_731_, L_732_, L_733_)
			local L_736_ = L_734_ - L_735_

			local L_737_ = 0
			if L_736_ ~= 0 then
				if L_734_ == L_731_ then
					L_737_ = (L_732_ - L_733_) / L_736_ % 6
				elseif L_734_ == L_732_ then
					L_737_ = (L_733_ - L_731_) / L_736_ + 2
				else
					L_737_ = (L_731_ - L_732_) / L_736_ + 4
				end
				L_737_ = L_737_ * 60
			else
				L_737_ = 0
			end

			local L_738_ = (L_734_ == 0) and 0 or (L_736_ / L_734_)
			local L_739_ = L_734_

			return {
				h = math.floor(L_737_ + 0.5),
				s = L_738_,
				b = L_739_
			}
		end

		local function L_727_func(L_740_arg0)
			local L_741_ = L_740_arg0.R
			local L_742_ = L_740_arg0.G
			local L_743_ = L_740_arg0.B
			return 0.299 * L_741_ + 0.587 * L_742_ + 0.114 * L_743_
		end

		local function L_728_func(L_744_arg0)
			local L_745_ = L_726_func(L_744_arg0)
			local
			L_746_, L_747_, L_748_ = L_745_.h, L_745_.s, L_745_.b
			if L_727_func(L_744_arg0) > 0.5 then
				return Color3.fromHSV(L_746_ / 360, 0, 0.05)
			else
				return Color3.fromHSV(L_746_ / 360, 0, 0.98)
			end
		end

		local function L_729_func(L_749_arg0)
			local L_750_, L_751_, L_752_ = 0, 0, 0
			local L_753_ = L_749_arg0.Color.Keypoints
			for L_755_forvar0, L_756_forvar1 in ipairs(L_753_) do

				L_750_ = L_750_ + L_756_forvar1.Value.R
				L_751_ = L_751_ + L_756_forvar1.Value.G
				L_752_ = L_752_ + L_756_forvar1.Value.B
			end
			local L_754_ = #L_753_
			return Color3.new(L_750_ / L_754_, L_751_ / L_754_, L_752_ / L_754_)
		end


		function L_722_.New(L_757_arg0, L_758_arg1, L_759_arg2)
			local L_760_ = {
				Title = L_758_arg1.Title or "Tag",
				Color = L_758_arg1.Color or Color3.fromHex"#315dff",
				Radius = L_758_arg1.Radius or 999,

				TagFrame = nil,
				Height = 26,
				Padding = 10,
				TextSize = 14,
			}

			local L_761_ = L_724_("TextLabel", {
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
				TextSize = L_760_.TextSize,
				FontFace = Font.new(L_723_.Font, Enum.FontWeight.SemiBold),
				Text = L_760_.Title,
				TextColor3 = typeof(L_760_.Color) == "Color3" and L_728_func(L_760_.Color) or nil,
			})

			local L_762_

			if typeof(L_760_.Color) == "table" then

				L_762_ = L_724_"UIGradient"
				for L_764_forvar0, L_765_forvar1 in next, L_760_.Color do
					L_762_[L_764_forvar0] = L_765_forvar1
				end

				L_761_.TextColor3 = L_728_func(L_729_func(L_762_))
			end



			local L_763_ = L_723_.NewRoundFrame(L_760_.Radius, "Squircle", {
				AutomaticSize = "X",
				Size = UDim2.new(0, 0, 0, L_760_.Height),
				Parent = L_759_arg2,
				ImageColor3 = typeof(L_760_.Color) == "Color3" and L_760_.Color or Color3.new(1, 1, 1),
			}, {
				L_762_,
				L_724_("UIPadding", {
					PaddingLeft = UDim.new(0, L_760_.Padding),
					PaddingRight = UDim.new(0, L_760_.Padding),
				}),
				L_761_,
				L_724_("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				})
			})


			function L_760_.SetTitle(L_766_arg0, L_767_arg1)
				L_760_.Title = L_767_arg1
				L_761_.Text = L_767_arg1
			end

			function L_760_.SetColor(L_768_arg0, L_769_arg1)
				L_760_.Color = L_769_arg1
				if typeof(L_769_arg1) == "table" then
					local L_770_ = L_729_func(L_769_arg1)
					L_725_(L_761_, .06, {
						TextColor3 = L_728_func(L_770_)
					}):Play()
					local L_771_ = L_763_:FindFirstChildOfClass"UIGradient" or L_724_("UIGradient", {
						Parent = L_763_
					})
					for L_772_forvar0, L_773_forvar1 in next, L_769_arg1 do
						L_771_[L_772_forvar0] = L_773_forvar1
					end
					L_725_(L_763_, .06, {
						ImageColor3 = Color3.new(1, 1, 1)
					}):Play()
				else
					if L_762_ then
						L_762_:Destroy()
					end
					L_725_(L_761_, .06, {
						TextColor3 = L_728_func(L_769_arg1)
					}):Play()
					L_725_(L_763_, .06, {
						ImageColor3 = L_769_arg1
					}):Play()
				end
			end


			return L_760_
		end


		return L_722_
	end
	function L_1_.v()

		local L_774_ = game:GetService"HttpService"

		local L_775_

		local L_776_
		L_776_ = {

			Folder = nil,
			Path = nil,
			Configs = {},
			Parser = {
				Colorpicker = {
					Save = function(L_777_arg0)
						return {
							__type = L_777_arg0.__type,
							value = L_777_arg0.Default:ToHex(),
							transparency = L_777_arg0.Transparency or nil,
						}
					end,
					Load = function(L_778_arg0, L_779_arg1)
						if L_778_arg0 then
							L_778_arg0:Update(Color3.fromHex(L_779_arg1.value), L_779_arg1.transparency or nil)
						end
					end
				},
				Dropdown = {
					Save = function(L_780_arg0)
						return {
							__type = L_780_arg0.__type,
							value = L_780_arg0.Value,
						}
					end,
					Load = function(L_781_arg0, L_782_arg1)
						if L_781_arg0 then
							L_781_arg0:Select(L_782_arg1.value)
						end
					end
				},
				Input = {
					Save = function(L_783_arg0)
						return {
							__type = L_783_arg0.__type,
							value = L_783_arg0.Value,
						}
					end,
					Load = function(L_784_arg0, L_785_arg1)
						if L_784_arg0 then
							L_784_arg0:Set(L_785_arg1.value)
						end
					end
				},
				Keybind = {
					Save = function(L_786_arg0)
						return {
							__type = L_786_arg0.__type,
							value = L_786_arg0.Value,
						}
					end,
					Load = function(L_787_arg0, L_788_arg1)
						if L_787_arg0 then
							L_787_arg0:Set(L_788_arg1.value)
						end
					end
				},
				Slider = {
					Save = function(L_789_arg0)
						return {
							__type = L_789_arg0.__type,
							value = L_789_arg0.Value.Default,
						}
					end,
					Load = function(L_790_arg0, L_791_arg1)
						if L_790_arg0 then
							L_790_arg0:Set(L_791_arg1.value)
						end
					end
				},
				Toggle = {
					Save = function(L_792_arg0)
						return {
							__type = L_792_arg0.__type,
							value = L_792_arg0.Value,
						}
					end,
					Load = function(L_793_arg0, L_794_arg1)
						if L_793_arg0 then
							L_793_arg0:Set(L_794_arg1.value)
						end
					end
				},
			}
		}

		function L_776_.Init(L_795_arg0, L_796_arg1)
			if not L_796_arg1.Folder then
				warn"[ WindUI.ConfigManager ] Window.Folder is not specified."
				return false
			end

			L_775_ = L_796_arg1
			L_776_.Folder = L_775_.Folder
			L_776_.Path = "WindUI/" .. tostring(L_776_.Folder) .. "/config/"

			if not isfolder("WindUI/" .. L_776_.Folder) then
				makefolder("WindUI/" .. L_776_.Folder)
				if not isfolder("WindUI/" .. L_776_.Folder .. "/config/") then
					makefolder("WindUI/" .. L_776_.Folder .. "/config/")
				end
			end

			local L_797_ = L_776_:AllConfigs()

			for L_798_forvar0, L_799_forvar1 in next, L_797_ do
				if isfile and readfile and isfile(L_799_forvar1 .. ".json") then
					L_776_.Configs[L_799_forvar1] = readfile(L_799_forvar1 .. ".json")
				end
			end


			return L_776_
		end

		function L_776_.CreateConfig(L_800_arg0, L_801_arg1)
			local L_802_ = {
				Path = L_776_.Path .. L_801_arg1 .. ".json",
				Elements = {},
				CustomData = {},
				Version = 1.1
			}

			if not L_801_arg1 then
				return false, "No config file is selected"
			end

			function L_802_.Register(L_803_arg0, L_804_arg1, L_805_arg2)
				L_802_.Elements[L_804_arg1] = L_805_arg2
			end

			function L_802_.Set(L_806_arg0, L_807_arg1, L_808_arg2)
				L_802_.CustomData[L_807_arg1] = L_808_arg2
			end

			function L_802_.Get(L_809_arg0, L_810_arg1)
				return L_802_.CustomData[L_810_arg1]
			end

			function L_802_.Save(L_811_arg0)
				local L_812_ = {
					__version = L_802_.Version,
					__elements = {},
					__custom = L_802_.CustomData
				}

				for L_814_forvar0, L_815_forvar1 in next, L_802_.Elements do
					if L_776_.Parser[L_815_forvar1.__type] then
						L_812_.__elements[tostring(L_814_forvar0)] = L_776_.Parser[L_815_forvar1.__type].Save(L_815_forvar1)
					end
				end

				local L_813_ = L_774_:JSONEncode(L_812_)
				if writefile then
					writefile(L_802_.Path, L_813_)
				end

				return L_812_
			end

			function L_802_.Load(L_816_arg0)
				if isfile and not isfile(L_802_.Path) then
					return false, "Config file does not exist"
				end

				local L_817_, L_818_ = pcall(function()
					local L_819_ = readfile or function()
						warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
						return nil
					end
					return L_774_:JSONDecode(L_819_(L_802_.Path))
				end)

				if not L_817_ then
					return false, "Failed to parse config file"
				end

				if not L_818_.__version then
					local L_820_ = {
						__version = L_802_.Version,
						__elements = L_818_,
						__custom = {}
					}
					L_818_ = L_820_
				end

				for L_821_forvar0, L_822_forvar1 in next, (L_818_.__elements or {}) do
					if L_802_.Elements[L_821_forvar0] and L_776_.Parser[L_822_forvar1.__type] then
						task.spawn(function()
							L_776_.Parser[L_822_forvar1.__type].Load(L_802_.Elements[L_821_forvar0], L_822_forvar1)
						end)
					end
				end

				L_802_.CustomData = L_818_.__custom or {}

				return L_802_.CustomData
			end

			function L_802_.GetData(L_823_arg0)
				return {
					elements = L_802_.Elements,
					custom = L_802_.CustomData
				}
			end

			L_776_.Configs[L_801_arg1] = L_802_
			return L_802_
		end

		function L_776_.AllConfigs(L_824_arg0)
			if not listfiles then
				return {}
			end

			local L_825_ = {}
			if not isfolder(L_776_.Path) then
				makefolder(L_776_.Path)
				return L_825_
			end

			for L_826_forvar0, L_827_forvar1 in next, listfiles(L_776_.Path) do
				local L_828_ = L_827_forvar1:match"([^\\/]+)%.json$"
				if L_828_ then
					table.insert(L_825_, L_828_)
				end
			end

			return L_825_
		end

		function L_776_.GetConfig(L_829_arg0, L_830_arg1)
			return L_776_.Configs[L_830_arg1]
		end

		return L_776_
	end
	function L_1_.w()
		local L_831_ = {}

		local L_832_ = L_1_.load'a'
		local L_833_ = L_832_.New
		local L_834_ = L_832_.Tween

		game:GetService"UserInputService"


		function L_831_.New(L_835_arg0)
			local L_836_ = {
				Button = nil
			}

			local L_837_













			local L_838_ = L_833_("TextLabel", {
				Text = L_835_arg0.Title,
				TextSize = 17,
				FontFace = Font.new(L_832_.Font, Enum.FontWeight.Medium),
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			})

			local L_839_ = L_833_("Frame", {
				Size = UDim2.new(0, 36, 0, 36),
				BackgroundTransparency = 1,
				Name = "Drag",
			}, {
				L_833_("ImageLabel", {
					Image = L_832_.Icon"move"[1],
					ImageRectOffset = L_832_.Icon"move"[2].ImageRectPosition,
					ImageRectSize = L_832_.Icon"move"[2].ImageRectSize,
					Size = UDim2.new(0, 18, 0, 18),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ThemeTag = {
						ImageColor3 = "Icon",
					},
					ImageTransparency = .3,
				})
			})
			local L_840_ = L_833_("Frame", {
				Size = UDim2.new(0, 1, 1, 0),
				Position = UDim2.new(0, 36, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = .9,
			})

			local L_841_ = L_833_("Frame", {
				Size = UDim2.new(0, 0, 0, 0),
				Position = UDim2.new(0.5, 0, 0, 28),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Parent = L_835_arg0.Parent,
				BackgroundTransparency = 1,
				Active = true,
				Visible = false,
			})
			local L_842_ = L_833_("TextButton", {
				Size = UDim2.new(0, 0, 0, 44),
				AutomaticSize = "X",
				Parent = L_841_,
				Active = false,
				BackgroundTransparency = .25,
				ZIndex = 99,
				BackgroundColor3 = Color3.new(0, 0, 0),
			}, {



				L_833_("UICorner", {
					CornerRadius = UDim.new(1, 0)
				}),
				L_833_("UIStroke", {
					Thickness = 1,
					ApplyStrokeMode = "Border",
					Color = Color3.new(1, 1, 1),
					Transparency = 0,
				}, {
					L_833_("UIGradient", {
						Color = ColorSequence.new(Color3.fromHex"40c9ff", Color3.fromHex"e81cff")
					})
				}),
				L_839_,
				L_840_,

				L_833_("UIListLayout", {
					Padding = UDim.new(0, 4),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				}),

				L_833_("TextButton", {
					AutomaticSize = "XY",
					Active = true,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 36),

					BackgroundColor3 = Color3.new(1, 1, 1),
				}, {
					L_833_("UICorner", {
						CornerRadius = UDim.new(1, -4)
					}),
					L_837_,
					L_833_("UIListLayout", {
						Padding = UDim.new(0, L_835_arg0.UIPadding),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
					}),
					L_838_,
					L_833_("UIPadding", {
						PaddingLeft = UDim.new(0, 11),
						PaddingRight = UDim.new(0, 11),
					}),
				}),
				L_833_("UIPadding", {
					PaddingLeft = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
				})
			})

			L_836_.Button = L_842_



			function L_836_.SetIcon(L_844_arg0, L_845_arg1)
				if L_837_ then
					L_837_:Destroy()
				end
				if L_845_arg1 then
					L_837_ = L_832_.Image(
						L_845_arg1,
						L_835_arg0.Title,
						0,
						L_835_arg0.Folder,
						"OpenButton",
						true,
						L_835_arg0.IconThemed
					)
					L_837_.Size = UDim2.new(0, 22, 0, 22)
					L_837_.LayoutOrder = -1
					L_837_.Parent = L_836_.Button.TextButton
				end
			end

			if L_835_arg0.Icon then
				L_836_:SetIcon(L_835_arg0.Icon)
			end



			L_832_.AddSignal(L_842_:GetPropertyChangedSignal"AbsoluteSize", function()
				L_841_.Size = UDim2.new(
					0, L_842_.AbsoluteSize.X,
					0, L_842_.AbsoluteSize.Y
				)
			end)

			L_832_.AddSignal(L_842_.TextButton.MouseEnter, function()
				L_834_(L_842_.TextButton, .1, {
					BackgroundTransparency = .93
				}):Play()
			end)
			L_832_.AddSignal(L_842_.TextButton.MouseLeave, function()
				L_834_(L_842_.TextButton, .1, {
					BackgroundTransparency = 1
				}):Play()
			end)

			local L_843_ = L_832_.Drag(L_841_)


			function L_836_.Visible(L_846_arg0, L_847_arg1)
				L_841_.Visible = L_847_arg1
			end

			function L_836_.Edit(L_848_arg0, L_849_arg1)
				local L_850_ = {
					Title = L_849_arg1.Title,
					Icon = L_849_arg1.Icon,
					Enabled = L_849_arg1.Enabled,
					Position = L_849_arg1.Position,
					OnlyIcon = L_849_arg1.OnlyIcon or false,
					Draggable = L_849_arg1.Draggable,
					OnlyMobile = L_849_arg1.OnlyMobile,
					CornerRadius = L_849_arg1.CornerRadius or UDim.new(1, 0),
					StrokeThickness = L_849_arg1.StrokeThickness or 2,
					Color = L_849_arg1.Color
						or ColorSequence.new(Color3.fromHex"40c9ff", Color3.fromHex"e81cff"),
				}



				if L_850_.Enabled == false then
					L_835_arg0.IsOpenButtonEnabled = false
				end

				if L_850_.OnlyMobile ~= false then
					L_850_.OnlyMobile = true
				else
					L_835_arg0.IsPC = false
				end


				if L_850_.Draggable == false and L_839_ and L_840_ then
					L_839_.Visible = L_850_.Draggable
					L_840_.Visible = L_850_.Draggable

					if L_843_ then
						L_843_:Set(L_850_.Draggable)
					end
				end

				if L_850_.Position and L_841_ then
					L_841_.Position = L_850_.Position
				end

				if L_850_.OnlyIcon and L_838_ then
					L_838_.Visible = false
					L_842_.TextButton.UIPadding.PaddingLeft = UDim.new(0, 7)
					L_842_.TextButton.UIPadding.PaddingRight = UDim.new(0, 7)
				end





				if L_838_ then
					if L_850_.Title then
						L_838_.Text = L_850_.Title
						L_832_:ChangeTranslationKey(L_838_, L_850_.Title)
					elseif L_850_.Title == nil then

					end
				end

				if L_850_.Icon then
					L_836_:SetIcon(L_850_.Icon)
				end

				L_842_.UIStroke.UIGradient.Color = L_850_.Color
				if Glow then
					Glow.UIGradient.Color = L_850_.Color
				end

				L_842_.UICorner.CornerRadius = L_850_.CornerRadius
				L_842_.TextButton.UICorner.CornerRadius = UDim.new(L_850_.CornerRadius.Scale, L_850_.CornerRadius.Offset - 4)
				L_842_.UIStroke.Thickness = L_850_.StrokeThickness
			end

			return L_836_
		end



		return L_831_
	end
	function L_1_.x()
		local L_851_ = {}

		local L_852_ = L_1_.load'a'
		local L_853_ = L_852_.New
		local L_854_ = L_852_.Tween


		function L_851_.New(L_855_arg0, L_856_arg1)
			local L_857_ = {
				Container = nil,
				ToolTipSize = 16,
			}

			local L_858_ = L_853_("TextLabel", {
				AutomaticSize = "XY",
				TextWrapped = true,
				BackgroundTransparency = 1,
				FontFace = Font.new(L_852_.Font, Enum.FontWeight.Medium),
				Text = L_855_arg0,
				TextSize = 17,
				TextTransparency = 1,
				ThemeTag = {
					TextColor3 = "Text",
				}
			})

			local L_859_ = L_853_("UIScale", {
				Scale = .9
			})

			local L_860_ = L_853_("Frame", {
				AnchorPoint = Vector2.new(0.5, 0),
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				Parent = L_856_arg1,

				Visible = false
			}, {
				L_853_("UISizeConstraint", {
					MaxSize = Vector2.new(400, math.huge)
				}),
				L_853_("Frame", {
					AutomaticSize = "XY",
					BackgroundTransparency = 1,
					LayoutOrder = 99,
					Visible = false
				}, {
					L_853_("ImageLabel", {
						Size = UDim2.new(0, L_857_.ToolTipSize, 0, L_857_.ToolTipSize / 2),
						BackgroundTransparency = 1,
						Rotation = 180,
						Image = "rbxassetid://89524607682719",
						ThemeTag = {
							ImageColor3 = "Accent",
						},
					}, {
						L_853_("ImageLabel", {
							Size = UDim2.new(0, L_857_.ToolTipSize, 0, L_857_.ToolTipSize / 2),
							BackgroundTransparency = 1,
							LayoutOrder = 99,
							ImageTransparency = .9,
							Image = "rbxassetid://89524607682719",
							ThemeTag = {
								ImageColor3 = "Text",
							},
						}),
					}),
				}),
				L_852_.NewRoundFrame(14, "Squircle", {
					AutomaticSize = "XY",
					ThemeTag = {
						ImageColor3 = "Accent",
					},
					ImageTransparency = 1,
					Name = "Background",
				}, {



					L_853_("Frame", {
						ThemeTag = {
							BackgroundColor3 = "Text",
						},
						AutomaticSize = "XY",
						BackgroundTransparency = 1,
					}, {
						L_853_("UICorner", {
							CornerRadius = UDim.new(0, 16),
						}),
						L_853_("UIListLayout", {
							Padding = UDim.new(0, 12),
							FillDirection = "Horizontal",
							VerticalAlignment = "Center"
						}),

						L_858_,
						L_853_("UIPadding", {
							PaddingTop = UDim.new(0, 12),
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12),
							PaddingBottom = UDim.new(0, 12),
						}),
					})
				}),
				L_859_,
				L_853_("UIListLayout", {
					Padding = UDim.new(0, 0),
					FillDirection = "Vertical",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
				}),
			})
			L_857_.Container = L_860_

			function L_857_.Open(L_861_arg0)
				L_860_.Visible = true


				L_854_(L_860_.Background, .2, {
					ImageTransparency = 0
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_854_(L_858_, .2, {
					TextTransparency = 0
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_854_(L_859_, .18, {
					Scale = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			end

			function L_857_.Close(L_862_arg0)

				L_854_(L_860_.Background, .3, {
					ImageTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_854_(L_858_, .3, {
					TextTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				L_854_(L_859_, .35, {
					Scale = .9
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

				task.wait(.35)

				L_860_.Visible = false
				L_860_:Destroy()
			end

			return L_857_
		end



		return L_851_
	end
	function L_1_.y() -- Slider Components
		local L_863_ = L_1_.load'a'
		local L_864_ = L_863_.New
		local L_865_ = L_863_.NewRoundFrame
		local L_866_ = L_863_.Tween

		game:GetService"UserInputService"


		local function L_867_func(L_871_arg0)
			local L_872_, L_873_, L_874_ = L_871_arg0.R, L_871_arg0.G, L_871_arg0.B
			local L_875_ = math.max(L_872_, L_873_, L_874_)
			local L_876_ = math.min(L_872_, L_873_, L_874_)
			local L_877_ = L_875_ - L_876_

			local L_878_ = 0
			if L_877_ ~= 0 then
				if L_875_ == L_872_ then
					L_878_ = (L_873_ - L_874_) / L_877_ % 6
				elseif L_875_ == L_873_ then
					L_878_ = (L_874_ - L_872_) / L_877_ + 2
				else
					L_878_ = (L_872_ - L_873_) / L_877_ + 4
				end
				L_878_ = L_878_ * 60
			else
				L_878_ = 0
			end

			local L_879_ = (L_875_ == 0) and 0 or (L_877_ / L_875_)
			local L_880_ = L_875_

			return {
				h = math.floor(L_878_ + 0.5),
				s = L_879_,
				b = L_880_
			}
		end

		local function L_868_func(L_881_arg0)
			local L_882_ = L_881_arg0.R
			local L_883_ = L_881_arg0.G
			local L_884_ = L_881_arg0.B
			return 0.299 * L_882_ + 0.587 * L_883_ + 0.114 * L_884_
		end

		local function L_869_func(L_885_arg0)
			local L_886_ = L_867_func(L_885_arg0)
			local
			L_887_, L_888_, L_889_ = L_886_.h, L_886_.s, L_886_.b
			if L_868_func(L_885_arg0) > 0.5 then
				return Color3.fromHSV(L_887_ / 360, 0, 0.05)
			else
				return Color3.fromHSV(L_887_ / 360, 0, 0.98)
			end
		end


		local function L_870_func(L_890_arg0, L_891_arg1)
			if type(L_891_arg1) ~= "number" or L_891_arg1 ~= math.floor(L_891_arg1) then
				return nil, 1
			end






			local L_892_ = #L_890_arg0


			if L_892_ == 0 or L_891_arg1 < 1 or L_891_arg1 > L_892_ then
				return nil, 2
			end

			local function L_893_func(L_897_arg0)
				if L_897_arg0 == nil then
					return true
				end
				local L_898_ = L_897_arg0.__type
				return L_898_ == "Divider" or L_898_ == "Space" or L_898_ == "Section" or L_898_ == "Code"
			end

			if L_893_func(L_890_arg0[L_891_arg1]) then
				return nil, 3
			end

			local function L_894_func(L_899_arg0, L_900_arg1)
				if L_900_arg1 == 1 then
					return "Squircle"
				end
				if L_899_arg0 == 1 then
					return "Squircle-TL-TR"
				end
				if L_899_arg0 == L_900_arg1 then
					return "Squircle-BL-BR"
				end
				return "Square"
			end

			local L_895_ = 1
			local L_896_ = 0

			for L_901_forvar0 = 1, L_892_ do
				local L_902_ = L_890_arg0[L_901_forvar0]
				if L_893_func(L_902_) then
					if L_891_arg1 >= L_895_ and L_891_arg1 <= L_901_forvar0 - 1 then
						local L_903_ = L_891_arg1 - L_895_ + 1
						return L_894_func(L_903_, L_896_)
					end
					L_895_ = L_901_forvar0 + 1
					L_896_ = 0
				else
					L_896_ = L_896_ + 1
				end
			end


			if L_891_arg1 >= L_895_ and L_891_arg1 <= L_892_ then
				local L_904_ = L_891_arg1 - L_895_ + 1
				return L_894_func(L_904_, L_896_)
			end

			return nil, 4
		end


		return function(L_905_arg0)
			local L_906_ = {
				Title = L_905_arg0.Title,
				Desc = L_905_arg0.Desc or nil,
				Hover = L_905_arg0.Hover,
				Thumbnail = L_905_arg0.Thumbnail,
				ThumbnailSize = L_905_arg0.ThumbnailSize or 80,
				Image = L_905_arg0.Image,
				IconThemed = L_905_arg0.IconThemed or false,
				ImageSize = L_905_arg0.ImageSize or 30,
				Color = L_905_arg0.Color,
				Scalable = L_905_arg0.Scalable,
				Parent = L_905_arg0.Parent,
				Justify = L_905_arg0.Justify or "Between",
				UIPadding = L_905_arg0.Window.ElementConfig.UIPadding,
				UICorner = L_905_arg0.Window.ElementConfig.UICorner,
				UIElements = {},

				Index = L_905_arg0.Index
			}

			local L_907_ = L_906_.ImageSize
			local L_908_ = L_906_.ThumbnailSize
			local L_909_ = true


			local L_910_ = 0

			local L_911_
			local L_912_
			if L_906_.Thumbnail then
				L_911_ = L_863_.Image(
					L_906_.Thumbnail,
					L_906_.Title,
					L_906_.UICorner - 3,
					L_905_arg0.Window.Folder,
					"Thumbnail",
					false,
					L_906_.IconThemed
				)
				L_911_.Size = UDim2.new(1, 0, 0, L_908_)
			end
			if L_906_.Image then
				L_912_ = L_863_.Image(
					L_906_.Image,
					L_906_.Title,
					L_906_.UICorner - 3,
					L_905_arg0.Window.Folder,
					"Image",
					not L_906_.Color and true or false
				)
				if typeof(L_906_.Color) == "string" then
					L_912_.ImageLabel.ImageColor3 = L_869_func(Color3.fromHex(L_863_.Colors[L_906_.Color]))
				elseif typeof(L_906_.Color) == "Color3" then
					L_912_.ImageLabel.ImageColor3 = L_869_func(L_906_.Color)
				end

				L_912_.Size = UDim2.new(0, L_907_, 0, L_907_)

				L_910_ = L_907_
			end

			local function L_913_func(L_927_arg0, L_928_arg1)
				local L_929_ = typeof(L_906_.Color) == "string"
					and L_869_func(Color3.fromHex(L_863_.Colors[L_906_.Color]))
					or typeof(L_906_.Color) == "Color3"
					and L_869_func(L_906_.Color)

				return L_864_("TextLabel", {
					BackgroundTransparency = 1,
					Text = L_927_arg0 or "",
					TextSize = L_928_arg1 == "Desc" and 15 or 17,
					TextXAlignment = "Left",
					ThemeTag = {
						TextColor3 = not L_906_.Color and "Text" or nil,
					},
					TextColor3 = L_906_.Color and L_929_ or nil,
					TextTransparency = L_928_arg1 == "Desc" and .3 or 0,
					TextWrapped = true,
					Size = UDim2.new(L_906_.Justify == "Between" and 1 or 0, 0, 0, 0),
					AutomaticSize = L_906_.Justify == "Between" and "Y" or "XY",
					FontFace = Font.new(L_863_.Font, L_928_arg1 == "Desc" and Enum.FontWeight.Medium or Enum.FontWeight.SemiBold)
				})
			end

			local L_914_ = L_913_func(L_906_.Title, "Title")
			local L_915_ = L_913_func(L_906_.Desc, "Desc")
			if not L_906_.Desc or L_906_.Desc == "" then
				L_915_.Visible = false
			end

			L_906_.UIElements.Container = L_864_("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				AutomaticSize = "Y",
				BackgroundTransparency = 1,
			}, {
				L_864_("UIListLayout", {
					Padding = UDim.new(0, L_906_.UIPadding),
					FillDirection = "Vertical",
					VerticalAlignment = L_905_arg0.Window.NewElements and "Top" or "Center",
					HorizontalAlignment = L_906_.Justify == "Between" and "Left" or "Center",
				}),
				L_911_,
				L_864_("Frame", {
					Size = UDim2.new(
						L_906_.Justify == "Between" and 1 or 0,
						L_906_.Justify == "Between" and -L_905_arg0.TextOffset or 0,
						0,
						0
					),
					AutomaticSize = L_906_.Justify == "Between" and "Y" or "XY",
					BackgroundTransparency = 1,
					Name = "TitleFrame",
				}, {
					L_864_("UIListLayout", {
						Padding = UDim.new(0, L_906_.UIPadding),
						FillDirection = "Horizontal",
						VerticalAlignment = L_905_arg0.Window.NewElements and (L_906_.Justify == "Between" and "Top" or "Center") or "Center",
						HorizontalAlignment = L_906_.Justify ~= "Between" and L_906_.Justify or "Center",
					}),
					L_912_,
					L_864_("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = L_906_.Justify == "Between" and "Y" or "XY",
						Size = UDim2.new(
							L_906_.Justify == "Between" and 1 or 0,
							L_906_.Justify == "Between" and (L_912_ and -L_910_ - L_906_.UIPadding or -L_910_) or 0,
							1,
							0
						),
						Name = "TitleFrame",
					}, {
						L_864_("UIPadding", {
							PaddingTop = UDim.new(0, L_905_arg0.Window.NewElements and L_906_.UIPadding / 2 or 0),
							PaddingLeft = UDim.new(0, L_905_arg0.Window.NewElements and L_906_.UIPadding / 2 or 0),
							PaddingRight = UDim.new(0, L_905_arg0.Window.NewElements and L_906_.UIPadding / 2 or 0),
							PaddingBottom = UDim.new(0, L_905_arg0.Window.NewElements and L_906_.UIPadding / 2 or 0),
						}),
						L_864_("UIListLayout", {
							Padding = UDim.new(0, 6),
							FillDirection = "Vertical",
							VerticalAlignment = "Center",
							HorizontalAlignment = "Left",
						}),
						L_914_,
						L_915_
					}),
				})
			})






			local L_916_ = L_863_.Image(
				"lock",
				"lock",
				0,
				L_905_arg0.Window.Folder,
				"Lock",
				false
			)
			L_916_.Size = UDim2.new(0, 20, 0, 20)
			L_916_.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
			L_916_.ImageLabel.ImageTransparency = .4

			local L_917_ = L_864_("TextLabel", {
				Text = "Locked",
				TextSize = 18,
				FontFace = Font.new(L_863_.Font, Enum.FontWeight.Medium),
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				TextColor3 = Color3.new(1, 1, 1),
				TextTransparency = .05,
			})

			local L_918_ = L_864_("Frame", {
				Size = UDim2.new(1, L_906_.UIPadding * 2, 1, L_906_.UIPadding * 2),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ZIndex = 9999999,
			})

			local L_919_, L_920_ = L_865_(L_906_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = .25,
				ImageColor3 = Color3.new(0, 0, 0),
				Visible = false,
				Active = false,
				Parent = L_918_,
			}, {
				L_864_("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
					Padding = UDim.new(0, 8)
				}),
				L_916_,
				L_917_
			}, nil, true)

			local L_921_, L_922_ = L_865_(L_906_.UICorner, "Squircle-Outline", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				Active = false,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				Parent = L_918_,
			}, {
				L_864_("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
					Padding = UDim.new(0, 8)
				}),
			}, nil, true)

			local L_923_, L_924_ = L_865_(L_906_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				Active = false,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				Parent = L_918_,
			}, {
				L_864_("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
					Padding = UDim.new(0, 8)
				}),
			}, nil, true)

			local L_925_, L_926_ = L_865_(L_906_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = "Y",
				ImageTransparency = L_906_.Color and .05 or .93,



				Parent = L_905_arg0.Parent,
				ThemeTag = {
					ImageColor3 = not L_906_.Color and "Text" or nil
				},
				ImageColor3 = L_906_.Color and
					(
						typeof(L_906_.Color) == "string"
						and Color3.fromHex(L_863_.Colors[L_906_.Color])
						or typeof(L_906_.Color) == "Color3"
						and L_906_.Color
					) or nil
			}, {
				L_906_.UIElements.Container,
				L_918_,
				L_864_("UIPadding", {
					PaddingTop = UDim.new(0, L_906_.UIPadding),
					PaddingLeft = UDim.new(0, L_906_.UIPadding),
					PaddingRight = UDim.new(0, L_906_.UIPadding),
					PaddingBottom = UDim.new(0, L_906_.UIPadding),
				}),
			}, true, true)

			L_906_.UIElements.Main = L_925_
			L_906_.UIElements.Locked = L_919_

			if L_906_.Hover then
				L_863_.AddSignal(L_925_.MouseEnter, function()
					if L_909_ then
						L_866_(L_925_, .05, {
							ImageTransparency = L_906_.Color and .15 or .9
						}):Play()
					end
				end)
				L_863_.AddSignal(L_925_.InputEnded, function()
					if L_909_ then
						L_866_(L_925_, .05, {
							ImageTransparency = L_906_.Color and .05 or .93
						}):Play()
					end
				end)
			end

			function L_906_.SetTitle(L_930_arg0, L_931_arg1)
				L_906_.Title = L_931_arg1
				L_914_.Text = L_931_arg1
			end

			function L_906_.SetDesc(L_932_arg0, L_933_arg1)
				L_906_.Desc = L_933_arg1
				L_915_.Text = L_933_arg1 or ""
				if not L_933_arg1 then
					L_915_.Visible = false
				elseif not L_915_.Visible then
					L_915_.Visible = true
				end
			end


			function L_906_.Colorize(L_934_arg0, L_935_arg1, L_936_arg2)
				if L_906_.Color then
					L_935_arg1[L_936_arg2] = typeof(L_906_.Color) == "string"
						and L_869_func(Color3.fromHex(L_863_.Colors[L_906_.Color]))
						or typeof(L_906_.Color) == "Color3"
						and L_869_func(L_906_.Color)
						or nil
				end
			end

			if L_905_arg0.ElementTable then
				L_863_.AddSignal(L_914_:GetPropertyChangedSignal"Text", function()
					if L_906_.Title ~= L_914_.Text then
						L_906_:SetTitle(L_914_.Text)
						L_905_arg0.ElementTable.Title = L_914_.Text
					end
				end)
				L_863_.AddSignal(L_915_:GetPropertyChangedSignal"Text", function()
					if L_906_.Desc ~= L_915_.Text then
						L_906_:SetDesc(L_915_.Text)
						L_905_arg0.ElementTable.Desc = L_915_.Text
					end
				end)
			end





			function L_906_.SetThumbnail(L_937_arg0, L_938_arg1, L_939_arg2)
				L_906_.Thumbnail = L_938_arg1
				if L_939_arg2 then
					L_906_.ThumbnailSize = L_939_arg2
					L_908_ = L_939_arg2
				end

				if L_911_ then
					if L_938_arg1 then
						L_911_:Destroy()
						L_911_ = L_863_.Image(
							L_938_arg1,
							L_906_.Title,
							L_906_.UICorner - 3,
							L_905_arg0.Window.Folder,
							"Thumbnail",
							false,
							L_906_.IconThemed
						)
						L_911_.Size = UDim2.new(1, 0, 0, L_908_)
						L_911_.Parent = L_906_.UIElements.Container
						local L_940_ = L_906_.UIElements.Container:FindFirstChild"UIListLayout"
						if L_940_ then
							L_911_.LayoutOrder = -1
						end
					else
						L_911_.Visible = false
					end
				else
					if L_938_arg1 then
						L_911_ = L_863_.Image(
							L_938_arg1,
							L_906_.Title,
							L_906_.UICorner - 3,
							L_905_arg0.Window.Folder,
							"Thumbnail",
							false,
							L_906_.IconThemed
						)
						L_911_.Size = UDim2.new(1, 0, 0, L_908_)
						L_911_.Parent = L_906_.UIElements.Container
						local L_941_ = L_906_.UIElements.Container:FindFirstChild"UIListLayout"
						if L_941_ then
							L_911_.LayoutOrder = -1
						end
					end
				end
			end

			function L_906_.SetImage(L_942_arg0, L_943_arg1, L_944_arg2, L_945_arg3, L_946_arg4)
				L_906_.Image = L_943_arg1
				if L_944_arg2 then
					L_906_.ImageSize = L_944_arg2
					L_907_ = L_944_arg2
				end
				if L_945_arg3 ~= nil then
					L_906_.Color = L_945_arg3
				end
				if L_946_arg4 ~= nil then
					L_906_.IconThemed = L_946_arg4
				end

				if L_912_ then
					if L_943_arg1 then
						L_912_.Size = UDim2.new(0, L_907_, 0, L_907_)
						L_863_.UpdateImage(L_912_, L_943_arg1, L_906_.Title)

						if typeof(L_906_.Color) == "string" then
							L_912_.ImageLabel.ImageColor3 = L_869_func(Color3.fromHex(L_863_.Colors[L_906_.Color]))
						elseif typeof(L_906_.Color) == "Color3" then
							L_912_.ImageLabel.ImageColor3 = L_869_func(L_906_.Color)
						elseif not L_906_.Color then
							L_912_.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
						end

						L_912_.Visible = true
						L_910_ = L_907_
					else
						L_912_.Visible = false
						L_910_ = 0
					end
				else
					if L_943_arg1 then
						L_912_ = L_863_.Image(
							L_943_arg1,
							L_906_.Title,
							L_906_.UICorner - 3,
							L_905_arg0.Window.Folder,
							"Image",
							not L_906_.Color and true or false
						)

						if typeof(L_906_.Color) == "string" then
							L_912_.ImageLabel.ImageColor3 = L_869_func(Color3.fromHex(L_863_.Colors[L_906_.Color]))
						elseif typeof(L_906_.Color) == "Color3" then
							L_912_.ImageLabel.ImageColor3 = L_869_func(L_906_.Color)
						end

						L_912_.Size = UDim2.new(0, L_907_, 0, L_907_)
						L_910_ = L_907_

						local L_947_ = L_906_.UIElements.Container:FindFirstChild"Frame"
						if L_947_ then
							L_912_.Parent = L_947_
							local L_948_ = L_947_:FindFirstChild"UIListLayout"
							if L_948_ then
								L_912_.LayoutOrder = 0
							end
						end
					end
				end








			end

			function L_906_.Destroy(L_949_arg0)
				L_925_:Destroy()
			end


			function L_906_.Lock(L_950_arg0)
				L_909_ = false
				L_919_.Active = true
				L_919_.Visible = true
			end

			function L_906_.Unlock(L_951_arg0)
				L_909_ = true
				L_919_.Active = false
				L_919_.Visible = false
			end

			function L_906_.Highlight(L_952_arg0)
				local L_953_ = L_864_("UIGradient", {
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.1, 0.9),
						NumberSequenceKeypoint.new(0.5, 0.3),
						NumberSequenceKeypoint.new(0.9, 0.9),
						NumberSequenceKeypoint.new(1, 1)
					},
					Rotation = 0,
					Offset = Vector2.new(-1, 0),
					Parent = L_921_
				})

				local L_954_ = L_864_("UIGradient", {
					Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))
					},
					Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.15, 0.8),
						NumberSequenceKeypoint.new(0.5, 0.1),
						NumberSequenceKeypoint.new(0.85, 0.8),
						NumberSequenceKeypoint.new(1, 1)
					},
					Rotation = 0,
					Offset = Vector2.new(-1, 0),
					Parent = L_923_
				})

				L_921_.ImageTransparency = 0.25
				L_923_.ImageTransparency = 0.88

				L_866_(L_953_, 0.75, {
					Offset = Vector2.new(1, 0)
				}):Play()

				L_866_(L_954_, 0.75, {
					Offset = Vector2.new(1, 0)
				}):Play()


				task.spawn(function()
					task.wait(.75)
					L_921_.ImageTransparency = 1
					L_923_.ImageTransparency = 1
					L_953_:Destroy()
					L_954_:Destroy()
				end)
			end


			function L_906_.UpdateShape(L_955_arg0)
				if L_905_arg0.Window.NewElements then
					local L_956_ = L_870_func(L_955_arg0.Elements, L_906_.Index)
					if L_956_ and L_925_ then
						L_926_:SetType(L_956_)
						L_920_:SetType(L_956_)
						L_924_:SetType(L_956_)
						L_922_:SetType(L_956_ .. "-Outline")
					end
				end
			end





			return L_906_
		end
	end
	function L_1_.z() -- Paragarp
		local L_957_ = L_1_.load'a'
		local L_958_ = L_957_.New

		local L_959_ = {}

		local L_960_ = L_1_.load'i'.New

		function L_959_.New(L_961_arg0, L_962_arg1)
			L_962_arg1.Hover = false
			L_962_arg1.TextOffset = 0
			L_962_arg1.IsButtons = L_962_arg1.Buttons and #L_962_arg1.Buttons > 0 and true or false

			local L_963_ = {
				__type = "Paragraph",
				Title = L_962_arg1.Title or "Paragraph",
				Desc = L_962_arg1.Desc or nil,

				Locked = L_962_arg1.Locked or false,
			}
			local L_964_ = L_1_.load'y'(L_962_arg1)

			L_963_.ParagraphFrame = L_964_
			if L_962_arg1.Buttons and #L_962_arg1.Buttons > 0 then
				local L_965_ = L_958_("Frame", {
					Size = UDim2.new(1, 0, 0, 38),
					BackgroundTransparency = 1,
					AutomaticSize = "Y",
					Parent = L_964_.UIElements.Container
				}, {
					L_958_("UIListLayout", {
						Padding = UDim.new(0, 10),
						FillDirection = "Vertical",
					})
				})


				for L_966_forvar0, L_967_forvar1 in next, L_962_arg1.Buttons do
					local L_968_ = L_960_(L_967_forvar1.Title, L_967_forvar1.Icon, L_967_forvar1.Callback, "White", L_965_)
					L_968_.Size = UDim2.new(1, 0, 0, 38)

				end
			end

			return L_963_.__type, L_963_

		end

		return L_959_
	end
	function L_1_.A() -- Button
		local L_969_ = L_1_.load'a'
		local L_970_ =
			L_969_.New

		local L_971_ = {}

		function L_971_.New(L_972_arg0, L_973_arg1)
			local L_974_ = {
				__type = "Button",
				Title = L_973_arg1.Title or "Button",
				Desc = L_973_arg1.Desc or nil,
				Icon = L_973_arg1.Icon or "mouse-pointer-click",
				IconThemed = L_973_arg1.IconThemed or false,
				Color = L_973_arg1.Color,
				Justify = L_973_arg1.Justify or "Between",
				IconAlign = L_973_arg1.IconAlign or "Right",
				Locked = L_973_arg1.Locked or false,
				Callback = L_973_arg1.Callback or function()
				end,
				UIElements = {}
			}

			local L_975_ = true

			L_974_.ButtonFrame = L_1_.load'y'{
				Title = L_974_.Title,
				Desc = L_974_.Desc,
				Parent = L_973_arg1.Parent,




				Window = L_973_arg1.Window,
				Color = L_974_.Color,
				Justify = L_974_.Justify,
				TextOffset = 20,
				Hover = true,
				Scalable = true,
				Tab = L_973_arg1.Tab,
				Index = L_973_arg1.Index,
				ElementTable = L_974_,
			}














			L_974_.UIElements.ButtonIcon = L_969_.Image(
				L_974_.Icon,
				L_974_.Icon,
				0,
				L_973_arg1.Window.Folder,
				"Button",
				not L_974_.Color and true or nil,
				L_974_.IconThemed
			)

			L_974_.UIElements.ButtonIcon.Size = UDim2.new(0, 20, 0, 20)
			L_974_.UIElements.ButtonIcon.Parent = L_974_.Justify == "Between" and L_974_.ButtonFrame.UIElements.Main or L_974_.ButtonFrame.UIElements.Container.TitleFrame
			L_974_.UIElements.ButtonIcon.LayoutOrder = L_974_.IconAlign == "Left" and -99999 or 99999
			L_974_.UIElements.ButtonIcon.AnchorPoint = Vector2.new(1, 0.5)
			L_974_.UIElements.ButtonIcon.Position = UDim2.new(1, 0, 0.5, 0)

			L_974_.ButtonFrame:Colorize(L_974_.UIElements.ButtonIcon.ImageLabel, "ImageColor3")

			function L_974_.Lock(L_976_arg0)
				L_974_.Locked = true
				L_975_ = false
				return L_974_.ButtonFrame:Lock()
			end
			function L_974_.Unlock(L_977_arg0)
				L_974_.Locked = false
				L_975_ = true
				return L_974_.ButtonFrame:Unlock()
			end

			if L_974_.Locked then
				L_974_:Lock()
			end

			L_969_.AddSignal(L_974_.ButtonFrame.UIElements.Main.MouseButton1Click, function()
				if L_975_ then
					task.spawn(function()
						L_969_.SafeCallback(L_974_.Callback)
					end)
				end
			end)
			return L_974_.__type, L_974_
		end

		return L_971_
	end
	function L_1_.B() -- Icon Components
		local L_978_ = {}

		local L_979_ = L_1_.load'a'
		local L_980_ = L_979_.New
		local L_981_ = L_979_.Tween
		
		local function sss(L_99_arg0)
			if typeof(L_99_arg0) == 'number' then
				return "rbxassetid://" .. tostring(L_99_arg0)
			end

			if typeof(L_99_arg0) == 'string' and string.find(L_99_arg0, "rbxassetid") then
				return L_99_arg0
			end

			return L_99_arg0
		end


		function L_978_.New(L_982_arg0, L_983_arg1, L_984_arg2, L_985_arg3)
			local L_986_ = {}


			local L_987_ = 13
			local L_988_
			if L_983_arg1 and L_983_arg1 ~= "" then
				L_988_ = L_980_("ImageLabel", {
					Size = UDim2.new(1, -7, 1, -7),
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Image = sss(L_983_arg1),
					--ImageRectOffset = L_979_.Icon(L_983_arg1)[2].ImageRectPosition,
					--ImageRectSize = L_979_.Icon(L_983_arg1)[2].ImageRectSize,
					ImageTransparency = 1,
					ImageColor3 = Color3.new(0, 0, 0),
				})
			end

			local L_989_ = L_979_.NewRoundFrame(L_987_, "Squircle", {
				ImageTransparency = .93,
				ThemeTag = {
					ImageColor3 = "Text"
				},
				Parent = L_984_arg2,
				Size = UDim2.new(0, 41.6, 0, 26),
			}, {
				L_979_.NewRoundFrame(L_987_, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Layer",
					ThemeTag = {
						ImageColor3 = "Button",
					},
					ImageTransparency = 1,
				}),
				L_979_.NewRoundFrame(L_987_, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Stroke",
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 1,
				}, {
					L_980_("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}
					})
				}),


				L_979_.NewRoundFrame(L_987_, "Squircle", {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(0, 3, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					ImageTransparency = 0,
					ImageColor3 = Color3.new(1, 1, 1),



					Name = "Frame",
				}, {
					L_988_,
				})
			})


			function L_986_.Set(L_990_arg0, L_991_arg1, L_992_arg2)
				if L_991_arg1 then
					L_981_(L_989_.Frame, 0.15, {
						Position = UDim2.new(1, -22, 0.5, 0),

					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_981_(L_989_.Layer, 0.1, {
						ImageTransparency = 0,
					}):Play()
					L_981_(L_989_.Stroke, 0.1, {
						ImageTransparency = 0.95,
					}):Play()

					if L_988_ then
						L_981_(L_988_, 0.1, {
							ImageTransparency = 0,
						}):Play()
					end
				else
					L_981_(L_989_.Frame, 0.15, {
						Position = UDim2.new(0, 4, 0.5, 0),
						Size = UDim2.new(0, 18, 0, 18),
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_981_(L_989_.Layer, 0.1, {
						ImageTransparency = 1,
					}):Play()
					L_981_(L_989_.Stroke, 0.1, {
						ImageTransparency = 1,
					}):Play()

					if L_988_ then
						L_981_(L_988_, 0.1, {
							ImageTransparency = 1,
						}):Play()
					end
				end

				if L_992_arg2 ~= false then
					L_992_arg2 = true
				end

				task.spawn(function()
					if L_985_arg3 and L_992_arg2 then
						L_979_.SafeCallback(L_985_arg3, L_991_arg1)
					end
				end)


			end

			return L_989_, L_986_
		end


		return L_978_
	end
	function L_1_.C() --??
		local L_993_ = {}

		local L_994_ = L_1_.load'a'
		local L_995_ = L_994_.New
		local L_996_ = L_994_.Tween


		function L_993_.New(L_997_arg0, L_998_arg1, L_999_arg2, L_1000_arg3)
			local L_1001_ = {}

			L_998_arg1 = L_998_arg1 or "check"

			local L_1002_ = 10
			local L_1003_ = L_995_("ImageLabel", {
				Size = UDim2.new(1, -10, 1, -10),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Image = L_994_.Icon(L_998_arg1)[1],
				ImageRectOffset = L_994_.Icon(L_998_arg1)[2].ImageRectPosition,
				ImageRectSize = L_994_.Icon(L_998_arg1)[2].ImageRectSize,
				ImageTransparency = 1,
				ImageColor3 = Color3.new(1, 1, 1),
			})

			local L_1004_ = L_994_.NewRoundFrame(L_1002_, "Squircle", {
				ImageTransparency = .95,
				ThemeTag = {
					ImageColor3 = "Text"
				},
				Parent = L_999_arg2,
				Size = UDim2.new(0, 27, 0, 27),
			}, {
				L_994_.NewRoundFrame(L_1002_, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Layer",
					ThemeTag = {
						ImageColor3 = "Button",
					},
					ImageTransparency = 1,
				}),
				L_994_.NewRoundFrame(L_1002_, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Stroke",
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 1,
				}, {
					L_995_("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}
					})
				}),

				L_1003_,
			})

			function L_1001_.Set(L_1005_arg0, L_1006_arg1)
				if L_1006_arg1 then
					L_996_(L_1004_.Layer, 0.06, {
						ImageTransparency = 0,
					}):Play()
					L_996_(L_1004_.Stroke, 0.06, {
						ImageTransparency = 0.95,
					}):Play()
					L_996_(L_1003_, 0.06, {
						ImageTransparency = 0,
					}):Play()
				else
					L_996_(L_1004_.Layer, 0.05, {
						ImageTransparency = 1,
					}):Play()
					L_996_(L_1004_.Stroke, 0.05, {
						ImageTransparency = 1,
					}):Play()
					L_996_(L_1003_, 0.06, {
						ImageTransparency = 1,
					}):Play()
				end

				task.spawn(function()
					if L_1000_arg3 then
						L_994_.SafeCallback(L_1000_arg3, L_1006_arg1)
					end
				end)
			end

			return L_1004_, L_1001_
		end


		return L_993_
	end
	function L_1_.D() -- Toggle
		local L_1007_ = L_1_.load'a'
		local L_1008_ =
			L_1007_.New
		local L_1009_ =
			L_1007_.Tween

		local L_1010_ = L_1_.load'B'.New
		local L_1011_ = L_1_.load'C'.New

		local L_1012_ = {}

		function L_1012_.New(L_1013_arg0, L_1014_arg1)
			local L_1015_ = {
				__type = "Toggle",
				Title = L_1014_arg1.Title or "Toggle",
				Desc = L_1014_arg1.Desc or nil,
				Locked = L_1014_arg1.Locked or false,
				Value = L_1014_arg1.Value,
				Icon = L_1014_arg1.Icon or nil,
				Type = L_1014_arg1.Type or "Toggle",
				Callback = L_1014_arg1.Callback or function()
				end,
				UIElements = {}
			}
			L_1015_.ToggleFrame = L_1_.load'y'{
				Title = L_1015_.Title,
				Desc = L_1015_.Desc,




				Window = L_1014_arg1.Window,
				Parent = L_1014_arg1.Parent,
				TextOffset = 44,
				Hover = false,
				Tab = L_1014_arg1.Tab,
				Index = L_1014_arg1.Index,
				ElementTable = L_1015_,
			}

			local L_1016_ = true

			if L_1015_.Value == nil then
				L_1015_.Value = false
			end



			function L_1015_.Lock(L_1020_arg0)
				L_1015_.Locked = true
				L_1016_ = false
				return L_1015_.ToggleFrame:Lock()
			end
			function L_1015_.Unlock(L_1021_arg0)
				L_1015_.Locked = false
				L_1016_ = true
				return L_1015_.ToggleFrame:Unlock()
			end

			if L_1015_.Locked then
				L_1015_:Lock()
			end

			local L_1017_ = L_1015_.Value

			local L_1018_, L_1019_
			if L_1015_.Type == "Toggle" then
				L_1018_, L_1019_ = L_1010_(L_1017_, L_1015_.Icon, L_1015_.ToggleFrame.UIElements.Main, L_1015_.Callback)
			elseif L_1015_.Type == "Checkbox" then
				L_1018_, L_1019_ = L_1011_(L_1017_, L_1015_.Icon, L_1015_.ToggleFrame.UIElements.Main, L_1015_.Callback)
			else
				error("Unknown Toggle Type: " .. tostring(L_1015_.Type))
			end

			L_1018_.AnchorPoint = Vector2.new(1, L_1014_arg1.Window.NewElements and 0 or 0.5)
			L_1018_.Position = UDim2.new(1, 0, L_1014_arg1.Window.NewElements and 0 or 0.5, 0)

			function L_1015_.Set(L_1022_arg0, L_1023_arg1, L_1024_arg2)
				if L_1016_ then
					L_1019_:Set(L_1023_arg1, L_1024_arg2)
					L_1017_ = L_1023_arg1
					L_1015_.Value = L_1023_arg1
				end
			end

			L_1015_:Set(L_1017_, false)

			L_1007_.AddSignal(L_1015_.ToggleFrame.UIElements.Main.MouseButton1Click, function()
				L_1015_:Set(not L_1017_)
			end)

			return L_1015_.__type, L_1015_
		end

		return L_1012_
	end
	function L_1_.E() -- Slider
		local L_1025_ = L_1_.load'a'
		local L_1026_ = L_1025_.New
		local L_1027_ = L_1025_.Tween

		local L_1028_ = {}

		local L_1029_ = false

		function L_1028_.New(L_1030_arg0, L_1031_arg1)
			local L_1032_ = {
				__type = "Slider",
				Title = L_1031_arg1.Title or "Slider",
				Desc = L_1031_arg1.Desc or nil,
				Locked = L_1031_arg1.Locked or nil,
				Value = L_1031_arg1.Value or {},
				Step = L_1031_arg1.Step or 1,
				Callback = L_1031_arg1.Callback or function()
				end,
				UIElements = {},
				IsFocusing = false,

				Width = 130,
				TextBoxWidth = 30,
				ThumbSize = 13,
			}
			local L_1033_
			local L_1034_
			local L_1035_
			local L_1036_ = L_1032_.Value.Default or L_1032_.Value.Min or 0

			local L_1037_ = L_1036_
			local L_1038_ = (L_1036_ - (L_1032_.Value.Min or 0)) / ((L_1032_.Value.Max or 100) - (L_1032_.Value.Min or 0))

			local L_1039_ = true
			local L_1040_ = L_1032_.Step % 1 ~= 0

			local function L_1041_func(L_1044_arg0)
				if L_1040_ then
					return string.format("%.2f", L_1044_arg0)
				else
					return tostring(math.floor(L_1044_arg0 + 0.5))
				end
			end

			local function L_1042_func(L_1045_arg0)
				if L_1040_ then
					return math.floor(L_1045_arg0 / L_1032_.Step + 0.5) * L_1032_.Step
				else
					return math.floor(L_1045_arg0 / L_1032_.Step + 0.5) * L_1032_.Step
				end
			end

			L_1032_.SliderFrame = L_1_.load'y'{
				Title = L_1032_.Title,
				Desc = L_1032_.Desc,
				Parent = L_1031_arg1.Parent,
				TextOffset = L_1032_.Width,
				Hover = false,
				Tab = L_1031_arg1.Tab,
				Index = L_1031_arg1.Index,
				Window = L_1031_arg1.Window,
				ElementTable = L_1032_,
			}

			L_1032_.UIElements.SliderIcon = L_1025_.NewRoundFrame(99, "Squircle", {
				ImageTransparency = .95,
				Size = UDim2.new(1, -L_1032_.TextBoxWidth - 8, 0, 4),
				Name = "Frame",
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}, {
				L_1025_.NewRoundFrame(99, "Squircle", {
					Name = "Frame",
					Size = UDim2.new(L_1038_, 0, 1, 0),
					ImageTransparency = .1,
					ThemeTag = {
						ImageColor3 = "Button",
					},
				}, {
					L_1025_.NewRoundFrame(99, "Squircle", {
						Size = UDim2.new(0, L_1032_.ThumbSize, 0, L_1032_.ThumbSize),
						Position = UDim2.new(1, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						Name = "Thumb",
					})
				})
			})

			L_1032_.UIElements.SliderContainer = L_1026_("Frame", {
				Size = UDim2.new(0, L_1032_.Width, 0, 0),
				AutomaticSize = "Y",
				Position = UDim2.new(1, 0, .5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 1,
				Parent = L_1032_.SliderFrame.UIElements.Main,
			}, {
				L_1026_("UIListLayout", {
					Padding = UDim.new(0, 8),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				}),
				L_1032_.UIElements.SliderIcon,
				L_1026_("TextBox", {
					Size = UDim2.new(0, L_1032_.TextBoxWidth, 0, 0),
					TextXAlignment = "Left",
					Text = L_1041_func(L_1036_),
					ThemeTag = {
						TextColor3 = "Text"
					},
					TextTransparency = .4,
					AutomaticSize = "Y",
					TextSize = 15,
					FontFace = Font.new(L_1025_.Font, Enum.FontWeight.Medium),
					BackgroundTransparency = 1,
					LayoutOrder = -1,
				})
			})

			function L_1032_.Lock(L_1046_arg0)
				L_1032_.Locked = true
				L_1039_ = false
				return L_1032_.SliderFrame:Lock()
			end
			function L_1032_.Unlock(L_1047_arg0)
				L_1032_.Locked = false
				L_1039_ = true
				return L_1032_.SliderFrame:Unlock()
			end

			if L_1032_.Locked then
				L_1032_:Lock()
			end

			local L_1043_ = L_1032_.SliderFrame.Parent:IsA"ScrollingFrame" and L_1032_.SliderFrame.Parent or L_1032_.SliderFrame.Parent.Parent.Parent

			function L_1032_.Set(L_1048_arg0, L_1049_arg1, L_1050_arg2)
				if L_1039_ then
					if not L_1032_.IsFocusing and not L_1029_ and (not L_1050_arg2 or (L_1050_arg2.UserInputType == Enum.UserInputType.MouseButton1 or L_1050_arg2.UserInputType == Enum.UserInputType.Touch)) then
						L_1049_arg1 = math.clamp(L_1049_arg1, L_1032_.Value.Min or 0, L_1032_.Value.Max or 100)

						local L_1051_ = math.clamp((L_1049_arg1 - (L_1032_.Value.Min or 0)) / ((L_1032_.Value.Max or 100) - (L_1032_.Value.Min or 0)), 0, 1)
						L_1049_arg1 = L_1042_func(L_1032_.Value.Min + L_1051_ * (L_1032_.Value.Max - L_1032_.Value.Min))

						if L_1049_arg1 ~= L_1037_ then
							L_1027_(L_1032_.UIElements.SliderIcon.Frame, 0.05, {
								Size = UDim2.new(L_1051_, 0, 1, 0)
							}):Play()
							L_1032_.UIElements.SliderContainer.TextBox.Text = L_1041_func(L_1049_arg1)
							L_1032_.Value.Default = L_1041_func(L_1049_arg1)
							L_1037_ = L_1049_arg1
							L_1025_.SafeCallback(L_1032_.Callback, L_1041_func(L_1049_arg1))
						end

						if L_1050_arg2 then
							L_1033_ = (L_1050_arg2.UserInputType == Enum.UserInputType.Touch)
							L_1043_.ScrollingEnabled = false
							L_1029_ = true
							L_1034_ = game:GetService"RunService".RenderStepped:Connect(function()
								local L_1052_ = L_1033_ and L_1050_arg2.Position.X or game:GetService"UserInputService":GetMouseLocation().X
								local L_1053_ = math.clamp((L_1052_ - L_1032_.UIElements.SliderIcon.AbsolutePosition.X) / L_1032_.UIElements.SliderIcon.AbsoluteSize.X, 0, 1)
								L_1049_arg1 = L_1042_func(L_1032_.Value.Min + L_1053_ * (L_1032_.Value.Max - L_1032_.Value.Min))

								if L_1049_arg1 ~= L_1037_ then
									L_1027_(L_1032_.UIElements.SliderIcon.Frame, 0.05, {
										Size = UDim2.new(L_1053_, 0, 1, 0)
									}):Play()
									L_1032_.UIElements.SliderContainer.TextBox.Text = L_1041_func(L_1049_arg1)
									L_1032_.Value.Default = L_1041_func(L_1049_arg1)
									L_1037_ = L_1049_arg1
									L_1025_.SafeCallback(L_1032_.Callback, L_1041_func(L_1049_arg1))
								end
							end)
							L_1035_ = game:GetService"UserInputService".InputEnded:Connect(function(L_1054_arg0)
								if (L_1054_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1054_arg0.UserInputType == Enum.UserInputType.Touch) and L_1050_arg2 == L_1054_arg0 then
									L_1034_:Disconnect()
									L_1035_:Disconnect()
									L_1029_ = false
									L_1043_.ScrollingEnabled = true

									L_1027_(L_1032_.UIElements.SliderIcon.Frame.Thumb, .12, {
										Size = UDim2.new(0, L_1032_.ThumbSize, 0, L_1032_.ThumbSize)
									}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
								end
							end)
						end
					end
				end
			end

			function L_1032_.SetMax(L_1055_arg0, L_1056_arg1)
				L_1032_.Value.Max = L_1056_arg1

				local L_1057_ = tonumber(L_1032_.Value.Default) or L_1037_
				if L_1057_ > L_1056_arg1 then
					L_1032_:Set(L_1056_arg1)
				else
					local L_1058_ = math.clamp((L_1057_ - (L_1032_.Value.Min or 0)) / (L_1056_arg1 - (L_1032_.Value.Min or 0)), 0, 1)
					L_1027_(L_1032_.UIElements.SliderIcon.Frame, 0.1, {
						Size = UDim2.new(L_1058_, 0, 1, 0)
					}):Play()
				end
			end

			function L_1032_.SetMin(L_1059_arg0, L_1060_arg1)
				L_1032_.Value.Min = L_1060_arg1

				local L_1061_ = tonumber(L_1032_.Value.Default) or L_1037_
				if L_1061_ < L_1060_arg1 then
					L_1032_:Set(L_1060_arg1)
				else
					local L_1062_ = math.clamp((L_1061_ - L_1060_arg1) / ((L_1032_.Value.Max or 100) - L_1060_arg1), 0, 1)
					L_1027_(L_1032_.UIElements.SliderIcon.Frame, 0.1, {
						Size = UDim2.new(L_1062_, 0, 1, 0)
					}):Play()
				end
			end

			L_1025_.AddSignal(L_1032_.UIElements.SliderContainer.TextBox.FocusLost, function(L_1063_arg0)
				if L_1063_arg0 then
					local L_1064_ = tonumber(L_1032_.UIElements.SliderContainer.TextBox.Text)
					if L_1064_ then
						L_1032_:Set(L_1064_)
					else
						L_1032_.UIElements.SliderContainer.TextBox.Text = L_1041_func(L_1037_)
					end
				end
			end)

			L_1025_.AddSignal(L_1032_.UIElements.SliderContainer.InputBegan, function(L_1065_arg0)
				L_1032_:Set(L_1036_, L_1065_arg0)

				if L_1065_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1065_arg0.UserInputType == Enum.UserInputType.Touch then
					L_1027_(L_1032_.UIElements.SliderIcon.Frame.Thumb, .12, {
						Size = UDim2.new(0, L_1032_.ThumbSize + 8, 0, L_1032_.ThumbSize + 8)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end)

			return L_1032_.__type, L_1032_
		end

		return L_1028_
	end
	function L_1_.F() -- Enumaretion
		local L_1066_ = game:GetService"UserInputService"

		local L_1067_ = L_1_.load'a'
		local L_1068_ = L_1067_.New
		local L_1069_ =
			L_1067_.Tween

		local L_1070_ = {
			UICorner = 6,
			UIPadding = 8,
		}

		local L_1071_ = L_1_.load's'.New

		function L_1070_.New(L_1072_arg0, L_1073_arg1)
			local L_1074_ = {
				__type = "Keybind",
				Title = L_1073_arg1.Title or "Keybind",
				Desc = L_1073_arg1.Desc or nil,
				Locked = L_1073_arg1.Locked or false,
				Value = L_1073_arg1.Value or "F",
				Callback = L_1073_arg1.Callback or function()
				end,
				CanChange = L_1073_arg1.CanChange or true,
				Picking = false,
				UIElements = {},
			}

			local L_1075_ = true

			L_1074_.KeybindFrame = L_1_.load'y'{
				Title = L_1074_.Title,
				Desc = L_1074_.Desc,
				Parent = L_1073_arg1.Parent,
				TextOffset = 85,
				Hover = L_1074_.CanChange,
				Tab = L_1073_arg1.Tab,
				Index = L_1073_arg1.Index,
				Window = L_1073_arg1.Window,
				ElementTable = L_1074_,
			}

			L_1074_.UIElements.Keybind = L_1071_(L_1074_.Value, nil, L_1074_.KeybindFrame.UIElements.Main)

			L_1074_.UIElements.Keybind.Size = UDim2.new(
				0, 24
					+ L_1074_.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
				0,
				42
			)
			L_1074_.UIElements.Keybind.AnchorPoint = Vector2.new(1, 0.5)
			L_1074_.UIElements.Keybind.Position = UDim2.new(1, 0, 0.5, 0)

			L_1068_("UIScale", {
				Parent = L_1074_.UIElements.Keybind,
				Scale = .85,
			})

			L_1067_.AddSignal(L_1074_.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds", function()
				L_1074_.UIElements.Keybind.Size = UDim2.new(
					0, 24
						+ L_1074_.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
					0,
					42
				)
			end)

			function L_1074_.Lock(L_1076_arg0)
				L_1074_.Locked = true
				L_1075_ = false
				return L_1074_.KeybindtrueFrame:Lock()
			end
			function L_1074_.Unlock(L_1077_arg0)
				L_1074_.Locked = false
				L_1075_ = true
				return L_1074_.KeybindFrame:Unlock()
			end

			function L_1074_.Set(L_1078_arg0, L_1079_arg1)
				L_1074_.Value = L_1079_arg1
				L_1074_.UIElements.Keybind.Frame.Frame.TextLabel.Text = L_1079_arg1
			end

			if L_1074_.Locked then
				L_1074_:Lock()
			end

			L_1067_.AddSignal(L_1074_.KeybindFrame.UIElements.Main.MouseButton1Click, function()
				if L_1075_ then
					if L_1074_.CanChange then
						L_1074_.Picking = true
						L_1074_.UIElements.Keybind.Frame.Frame.TextLabel.Text = "..."

						task.wait(0.2)

						local L_1080_
						L_1080_ = L_1066_.InputBegan:Connect(function(L_1081_arg0)
							local L_1082_

							if L_1081_arg0.UserInputType == Enum.UserInputType.Keyboard then
								L_1082_ = L_1081_arg0.KeyCode.Name
							elseif L_1081_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
								L_1082_ = "MouseLeft"
							elseif L_1081_arg0.UserInputType == Enum.UserInputType.MouseButton2 then
								L_1082_ = "MouseRight"
							end

							local L_1083_
							L_1083_ = L_1066_.InputEnded:Connect(function(L_1084_arg0)
								if L_1084_arg0.KeyCode.Name == L_1082_ or L_1082_ == "MouseLeft" and L_1084_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1082_ == "MouseRight" and L_1084_arg0.UserInputType == Enum.UserInputType.MouseButton2 then
									L_1074_.Picking = false

									L_1074_.UIElements.Keybind.Frame.Frame.TextLabel.Text = L_1082_
									L_1074_.Value = L_1082_

									L_1080_:Disconnect()
									L_1083_:Disconnect()
								end
							end)
						end)
					end
				end
			end)
			L_1067_.AddSignal(L_1066_.InputBegan, function(L_1085_arg0)
				if L_1075_ then
					if L_1085_arg0.KeyCode.Name == L_1074_.Value then
						L_1067_.SafeCallback(L_1074_.Callback, L_1085_arg0.KeyCode.Name)
					end
				end
			end)
			return L_1074_.__type, L_1074_
		end

		return L_1070_
	end
	function L_1_.G() -- Textfield
		local L_1086_ = L_1_.load'a'
		local L_1087_ = L_1086_.New
		local L_1088_ =
			L_1086_.Tween

		local L_1089_ = {
			UICorner = 8,
			UIPadding = 8,
		}
		local L_1090_ = L_1_.load'i'


			.New
		local L_1091_ = L_1_.load'j'.New

		function L_1089_.New(L_1092_arg0, L_1093_arg1)
			local L_1094_ = {
				__type = "Input",
				Title = L_1093_arg1.Title or "Input",
				Desc = L_1093_arg1.Desc or nil,
				Type = L_1093_arg1.Type or "Input",
				Locked = L_1093_arg1.Locked or false,
				InputIcon = L_1093_arg1.InputIcon or false,
				Placeholder = L_1093_arg1.Placeholder or "Enter Text...",
				Value = L_1093_arg1.Value or "",
				Callback = L_1093_arg1.Callback or function()
				end,
				ClearTextOnFocus = L_1093_arg1.ClearTextOnFocus or false,
				UIElements = {},

				Width = 150,
			}

			local L_1095_ = true

			L_1094_.InputFrame = L_1_.load'y'{
				Title = L_1094_.Title,
				Desc = L_1094_.Desc,
				Parent = L_1093_arg1.Parent,
				TextOffset = L_1094_.Width,
				Hover = false,
				Tab = L_1093_arg1.Tab,
				Index = L_1093_arg1.Index,
				Window = L_1093_arg1.Window,
				ElementTable = L_1094_,
			}

			local L_1096_ = L_1091_(
				L_1094_.Placeholder,
				L_1094_.InputIcon,
				L_1094_.Type == "Textarea" and L_1094_.InputFrame.UIElements.Container or L_1094_.InputFrame.UIElements.Main,
				L_1094_.Type,
				function(L_1097_arg0)
					L_1094_:Set(L_1097_arg0)
				end,
				nil,
				L_1093_arg1.Window.NewElements and 12 or 10,
				L_1094_.ClearTextOnFocus
			)

			if L_1094_.Type == "Input" then
				L_1096_.Size = UDim2.new(0, L_1094_.Width, 0, 36)
				L_1096_.Position = UDim2.new(1, 0, 0.5, 0)
				L_1096_.AnchorPoint = Vector2.new(1, 0.5)
			else
				L_1096_.Size = UDim2.new(1, 0, 0, 148)
			end

			L_1087_("UIScale", {
				Parent = L_1096_,
				Scale = 1,
			})

			function L_1094_.Lock(L_1098_arg0)
				L_1094_.Locked = true
				L_1095_ = false
				return L_1094_.InputFrame:Lock()
			end
			function L_1094_.Unlock(L_1099_arg0)
				L_1094_.Locked = false
				L_1095_ = true
				return L_1094_.InputFrame:Unlock()
			end


			function L_1094_.Set(L_1100_arg0, L_1101_arg1)
				if L_1095_ then
					L_1086_.SafeCallback(L_1094_.Callback, L_1101_arg1)

					L_1096_.Frame.Frame.TextBox.Text = L_1101_arg1
					L_1094_.Value = L_1101_arg1
				end
			end
			function L_1094_.SetPlaceholder(L_1102_arg0, L_1103_arg1)
				L_1096_.Frame.Frame.TextBox.PlaceholderText = L_1103_arg1
				L_1094_.Placeholder = L_1103_arg1
			end

			L_1094_:Set(L_1094_.Value)

			if L_1094_.Locked then
				L_1094_:Lock()
			end

			return L_1094_.__type, L_1094_
		end

		return L_1089_
	end
	function L_1_.H() -- Dropdown List
		local L_1104_ = {}

		local L_1105_ = game:GetService"UserInputService"
		local L_1106_ = game:GetService"Players".LocalPlayer:GetMouse()
		local L_1107_ = game:GetService"Workspace".CurrentCamera

		local L_1108_ = workspace.CurrentCamera

		local L_1109_ = L_1_.load'j'.New


		local L_1110_ = L_1_.load'a'
		local L_1111_ = L_1110_.New
		local L_1112_ = L_1110_.Tween

		function L_1104_.New(L_1113_arg0, L_1114_arg1, L_1115_arg2, L_1116_arg3, L_1117_arg4)
			local L_1118_ = {}


			L_1114_arg1.UIElements.UIListLayout = L_1111_("UIListLayout", {
				Padding = UDim.new(0, L_1115_arg2.MenuPadding),
				FillDirection = "Vertical"
			})

			L_1114_arg1.UIElements.Menu = L_1110_.NewRoundFrame(L_1115_arg2.MenuCorner, "Squircle", {
				ThemeTag = {
					ImageColor3 = "Background",
				},
				ImageTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
			}, {
				L_1111_("UIPadding", {
					PaddingTop = UDim.new(0, L_1115_arg2.MenuPadding),
					PaddingLeft = UDim.new(0, L_1115_arg2.MenuPadding),
					PaddingRight = UDim.new(0, L_1115_arg2.MenuPadding),
					PaddingBottom = UDim.new(0, L_1115_arg2.MenuPadding),
				}),
				L_1111_("UIListLayout", {
					FillDirection = "Vertical",
					Padding = UDim.new(0, L_1115_arg2.MenuPadding)
				}),
				L_1111_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, L_1114_arg1.SearchBarEnabled and -L_1115_arg2.MenuPadding - L_1115_arg2.SearchBarHeight),

					ClipsDescendants = true,
					LayoutOrder = 999,
				}, {
					L_1111_("UICorner", {
						CornerRadius = UDim.new(0, L_1115_arg2.MenuCorner - L_1115_arg2.MenuPadding),
					}),
					L_1111_("ScrollingFrame", {
						Size = UDim2.new(1, 0, 1, 0),
						ScrollBarThickness = 0,
						ScrollingDirection = "Y",
						AutomaticCanvasSize = "Y",
						CanvasSize = UDim2.new(0, 0, 0, 0),
						BackgroundTransparency = 1,
						ScrollBarImageTransparency = 1,
					}, {
						L_1114_arg1.UIElements.UIListLayout,
					})
				})
			})

			L_1114_arg1.UIElements.MenuCanvas = L_1111_("Frame", {
				Size = UDim2.new(0, L_1114_arg1.MenuWidth, 0, 300),
				BackgroundTransparency = 1,
				Position = UDim2.new(-10, 0, -10, 0),
				Visible = false,
				Active = false,

				Parent = L_1113_arg0.WindUI.DropdownGui,
				AnchorPoint = Vector2.new(1, 0),
			}, {
				L_1114_arg1.UIElements.Menu,






				L_1111_("UISizeConstraint", {
					MinSize = Vector2.new(170, 0)
				})
			})



			local function L_1119_func()
				L_1114_arg1.UIElements.Menu.Frame.ScrollingFrame.CanvasSize = UDim2.fromOffset(0, L_1114_arg1.UIElements.UIListLayout.AbsoluteContentSize.Y)

			end

			local function L_1120_func()
				local L_1122_ = L_1108_.ViewportSize.Y * 0.6

				local L_1123_ = L_1114_arg1.UIElements.UIListLayout.AbsoluteContentSize.Y
				local L_1124_ = L_1114_arg1.SearchBarEnabled and (L_1115_arg2.SearchBarHeight + (L_1115_arg2.MenuPadding * 3)) or (L_1115_arg2.MenuPadding * 2)
				local L_1125_ = (L_1123_) + L_1124_

				if L_1125_ > L_1122_ then
					L_1114_arg1.UIElements.MenuCanvas.Size = UDim2.fromOffset(
						L_1114_arg1.UIElements.MenuCanvas.AbsoluteSize.X,
						L_1122_
					)
				else
					L_1114_arg1.UIElements.MenuCanvas.Size = UDim2.fromOffset(
						L_1114_arg1.UIElements.MenuCanvas.AbsoluteSize.X,
						L_1125_
					)
				end
			end

			function UpdatePosition()
				local L_1126_ = L_1114_arg1.UIElements.Dropdown
				local L_1127_ = L_1114_arg1.UIElements.MenuCanvas

				local L_1128_ = L_1107_.ViewportSize.Y - (L_1126_.AbsolutePosition.Y + L_1126_.AbsoluteSize.Y) - L_1115_arg2.MenuPadding - 54
				local L_1129_ = L_1127_.AbsoluteSize.Y + L_1115_arg2.MenuPadding

				local L_1130_ = -54
				if L_1128_ < L_1129_ then
					L_1130_ = L_1129_ - L_1128_ - 54
				end

				L_1127_.Position = UDim2.new(
					0,
					L_1126_.AbsolutePosition.X + L_1126_.AbsoluteSize.X,
					0,
					L_1126_.AbsolutePosition.Y + L_1126_.AbsoluteSize.Y - L_1130_ + L_1115_arg2.MenuPadding
				)
			end

			local L_1121_


			function L_1118_.Display(L_1131_arg0)
				local L_1132_ = L_1114_arg1.Values
				local L_1133_ = ""

				if L_1114_arg1.Multi then
					for L_1134_forvar0, L_1135_forvar1 in next, L_1132_ do
						local L_1136_ = typeof(L_1135_forvar1) == "table" and L_1135_forvar1.Title or L_1135_forvar1
						if table.find(L_1114_arg1.Value, L_1136_) then
							L_1133_ = L_1133_ .. L_1136_ .. ", "
						end
					end
					L_1133_ = L_1133_:sub(1, #L_1133_ - 2)
				else
					L_1133_ = typeof(L_1114_arg1.Value) == "table" and L_1114_arg1.Value.Title or L_1114_arg1.Value or ""
				end

				L_1114_arg1.UIElements.Dropdown.Frame.Frame.TextLabel.Text = (L_1133_ == "" and "--" or L_1133_)
			end

			function L_1118_.Refresh(L_1137_arg0, L_1138_arg1)
				for L_1140_forvar0, L_1141_forvar1 in next, L_1114_arg1.UIElements.Menu.Frame.ScrollingFrame:GetChildren() do
					if not L_1141_forvar1:IsA"UIListLayout" then
						L_1141_forvar1:Destroy()
					end
				end

				L_1114_arg1.Tabs = {}

				if L_1114_arg1.SearchBarEnabled then
					if not L_1121_ then
						L_1121_ = L_1109_("Search...", "search", L_1114_arg1.UIElements.Menu, nil, function(L_1142_arg0)
							for L_1143_forvar0, L_1144_forvar1 in next, L_1114_arg1.Tabs do
								if string.find(string.lower(L_1144_forvar1.Name), string.lower(L_1142_arg0), 1, true) then
									L_1144_forvar1.UIElements.TabItem.Visible = true
								else
									L_1144_forvar1.UIElements.TabItem.Visible = false
								end
								L_1120_func()
							end
						end, true)
						L_1121_.Size = UDim2.new(1, 0, 0, L_1115_arg2.SearchBarHeight)
						L_1121_.Position = UDim2.new(0, 0, 0, 0)
						L_1121_.Name = "SearchBar"
					end
				end

				for L_1145_forvar0, L_1146_forvar1 in next, L_1138_arg1 do

					local L_1147_ = {
						Name = typeof(L_1146_forvar1) == "table" and L_1146_forvar1.Title or L_1146_forvar1,
						Icon = typeof(L_1146_forvar1) == "table" and L_1146_forvar1.Icon or nil,
						Original = L_1146_forvar1,
						Selected = false,
						UIElements = {},
					}
					local L_1148_
					if L_1147_.Icon then
						L_1148_ = L_1110_.Image(
							L_1147_.Icon,
							L_1147_.Icon,
							0,
							L_1113_arg0.Window.Folder,
							"Dropdown",
							true
						)
						L_1148_.Size = UDim2.new(0, L_1115_arg2.TabIcon, 0, L_1115_arg2.TabIcon)
						L_1148_.ImageLabel.ImageTransparency = .2
						L_1147_.UIElements.TabIcon = L_1148_
					end
					L_1147_.UIElements.TabItem = L_1110_.NewRoundFrame(L_1115_arg2.MenuCorner - L_1115_arg2.MenuPadding, "Squircle", {
						Size = UDim2.new(1, 0, 0, 36),

						ImageTransparency = 1,
						Parent = L_1114_arg1.UIElements.Menu.Frame.ScrollingFrame,

						ImageColor3 = Color3.new(1, 1, 1),

					}, {
						L_1110_.NewRoundFrame(L_1115_arg2.MenuCorner - L_1115_arg2.MenuPadding, "SquircleOutline", {
							Size = UDim2.new(1, 0, 1, 0),
							ImageColor3 = Color3.new(1, 1, 1),
							ImageTransparency = 1,
							Name = "Highlight",
						}, {
							L_1111_("UIGradient", {
								Rotation = 80,
								Color = ColorSequence.new{
									ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
									ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
									ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
								},
								Transparency = NumberSequence.new{
									NumberSequenceKeypoint.new(0.0, 0.1),
									NumberSequenceKeypoint.new(0.5, 1),
									NumberSequenceKeypoint.new(1.0, 0.1),
								}
							}),
						}),
						L_1111_("Frame", {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
						}, {
							L_1111_("UIListLayout", {
								Padding = UDim.new(0, L_1115_arg2.TabPadding),
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
							}),
							L_1111_("UIPadding", {

								PaddingLeft = UDim.new(0, L_1115_arg2.TabPadding),
								PaddingRight = UDim.new(0, L_1115_arg2.TabPadding),

							}),
							L_1111_("UICorner", {
								CornerRadius = UDim.new(0, L_1115_arg2.MenuCorner - L_1115_arg2.MenuPadding)
							}),













							L_1148_,
							L_1111_("TextLabel", {
								Text = L_1147_.Name,
								TextXAlignment = "Left",
								FontFace = Font.new(L_1110_.Font, Enum.FontWeight.Regular),
								ThemeTag = {
									TextColor3 = "Text",
									BackgroundColor3 = "Text"
								},
								TextSize = 15,
								BackgroundTransparency = 1,
								TextTransparency = .4,
								LayoutOrder = 999,
								AutomaticSize = "Y",

								Size = UDim2.new(1, L_1148_ and -L_1115_arg2.TabPadding - L_1115_arg2.TabIcon or 0, 0, 0),
								AnchorPoint = Vector2.new(0, 0.5),
								Position = UDim2.new(0, 0, 0.5, 0),
							})
						})
					}, true)


					if L_1114_arg1.Multi then
						L_1147_.Selected = table.find(L_1114_arg1.Value or {}, L_1147_.Name)
					else
						L_1147_.Selected = typeof(L_1114_arg1.Value) == "table" and L_1114_arg1.Value.Title == L_1147_.Name
							or L_1114_arg1.Value == L_1147_.Name
					end

					if L_1147_.Selected then
						L_1147_.UIElements.TabItem.ImageTransparency = .95
						L_1147_.UIElements.TabItem.Highlight.ImageTransparency = .75


						L_1147_.UIElements.TabItem.Frame.TextLabel.TextTransparency = 0
						if L_1147_.UIElements.TabIcon then
							L_1147_.UIElements.TabIcon.ImageLabel.ImageTransparency = 0
						end
					end

					L_1114_arg1.Tabs[L_1145_forvar0] = L_1147_

					L_1118_:Display()

					local function L_1149_func()
						L_1118_:Display()
						task.spawn(function()
							L_1110_.SafeCallback(L_1114_arg1.Callback, L_1114_arg1.Value)
						end)
					end


					L_1110_.AddSignal(L_1147_.UIElements.TabItem.MouseButton1Click, function()
						if L_1117_arg4 == "Dropdown" then
							if L_1114_arg1.Multi then
								if not L_1147_.Selected then
									L_1147_.Selected = true
									L_1112_(L_1147_.UIElements.TabItem, 0.1, {
										ImageTransparency = .95
									}):Play()
									L_1112_(L_1147_.UIElements.TabItem.Highlight, 0.1, {
										ImageTransparency = .75
									}):Play()

									L_1112_(L_1147_.UIElements.TabItem.Frame.TextLabel, 0.1, {
										TextTransparency = 0
									}):Play()
									if L_1147_.UIElements.TabIcon then
										L_1112_(L_1147_.UIElements.TabIcon.ImageLabel, 0.1, {
											ImageTransparency = 0
										}):Play()
									end
									table.insert(L_1114_arg1.Value, L_1147_.Original)
								else
									if not L_1114_arg1.AllowNone and #L_1114_arg1.Value == 1 then
										return
									end
									L_1147_.Selected = false
									L_1112_(L_1147_.UIElements.TabItem, 0.1, {
										ImageTransparency = 1
									}):Play()
									L_1112_(L_1147_.UIElements.TabItem.Highlight, 0.1, {
										ImageTransparency = 1
									}):Play()

									L_1112_(L_1147_.UIElements.TabItem.Frame.TextLabel, 0.1, {
										TextTransparency = .4
									}):Play()
									if L_1147_.UIElements.TabIcon then
										L_1112_(L_1147_.UIElements.TabIcon.ImageLabel, 0.1, {
											ImageTransparency = .2
										}):Play()
									end

									for L_1150_forvar0, L_1151_forvar1 in ipairs(L_1114_arg1.Value) do
										if typeof(L_1151_forvar1) == "table" and (L_1151_forvar1.Title == L_1147_.Name) or (L_1151_forvar1 == L_1147_.Name) then
											table.remove(L_1114_arg1.Value, L_1150_forvar0)
											break
										end
									end
								end
							else
								for L_1152_forvar0, L_1153_forvar1 in next, L_1114_arg1.Tabs do

									L_1112_(L_1153_forvar1.UIElements.TabItem, 0.1, {
										ImageTransparency = 1
									}):Play()
									L_1112_(L_1153_forvar1.UIElements.TabItem.Highlight, 0.1, {
										ImageTransparency = 1
									}):Play()

									L_1112_(L_1153_forvar1.UIElements.TabItem.Frame.TextLabel, 0.1, {
										TextTransparency = .4
									}):Play()
									if L_1153_forvar1.UIElements.TabIcon then
										L_1112_(L_1153_forvar1.UIElements.TabIcon.ImageLabel, 0.1, {
											ImageTransparency = .2
										}):Play()
									end
									L_1153_forvar1.Selected = false
								end
								L_1147_.Selected = true
								L_1112_(L_1147_.UIElements.TabItem, 0.1, {
									ImageTransparency = .95
								}):Play()
								L_1112_(L_1147_.UIElements.TabItem.Highlight, 0.1, {
									ImageTransparency = .75
								}):Play()

								L_1112_(L_1147_.UIElements.TabItem.Frame.TextLabel, 0.1, {
									TextTransparency = 0
								}):Play()
								if L_1147_.UIElements.TabIcon then
									L_1112_(L_1147_.UIElements.TabIcon.ImageLabel, 0.1, {
										ImageTransparency = 0
									}):Play()
								end
								L_1114_arg1.Value = L_1147_.Original
							end
							L_1149_func()
						end
					end)

					L_1119_func()
					L_1120_func()
				end

				local L_1139_ = 0
				for L_1154_forvar0, L_1155_forvar1 in next, L_1114_arg1.Tabs do
					if L_1155_forvar1.UIElements.TabItem.Frame.TextLabel then

						local L_1156_ = L_1155_forvar1.UIElements.TabItem.Frame.TextLabel.TextBounds.X
						L_1139_ = math.max(L_1139_, L_1156_)
					end
				end

				L_1114_arg1.UIElements.MenuCanvas.Size = UDim2.new(0, L_1139_ + 6 + 6 + 5 + 5 + 18 + 6 + 6, L_1114_arg1.UIElements.MenuCanvas.Size.Y.Scale, L_1114_arg1.UIElements.MenuCanvas.Size.Y.Offset)


			end


			L_1118_:Refresh(L_1114_arg1.Values)

			function L_1118_.Select(L_1157_arg0, L_1158_arg1)
				if L_1158_arg1 then
					L_1114_arg1.Value = L_1158_arg1
				else
					if L_1114_arg1.Multi then
						L_1114_arg1.Value = {}
					else
						L_1114_arg1.Value = nil

					end
				end
				L_1118_:Refresh(L_1114_arg1.Values)
			end






			L_1120_func()

			function L_1118_.Open(L_1159_arg0)
				if L_1116_arg3 then
					L_1114_arg1.UIElements.Menu.Visible = true
					L_1114_arg1.UIElements.MenuCanvas.Visible = true
					L_1114_arg1.UIElements.MenuCanvas.Active = true
					L_1114_arg1.UIElements.Menu.Size = UDim2.new(
						1, 0,
						0, 0
					)
					L_1112_(L_1114_arg1.UIElements.Menu, 0.1, {
						Size = UDim2.new(
							1, 0,
							1, 0
						),
						ImageTransparency = 0.05
					}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play()

					task.spawn(function()
						task.wait(.1)
						L_1114_arg1.Opened = true
					end)




					UpdatePosition()
				end
			end
			function L_1118_.Close(L_1160_arg0)
				L_1114_arg1.Opened = false

				L_1112_(L_1114_arg1.UIElements.Menu, 0.25, {
					Size = UDim2.new(
						1, 0,
						0, 0
					),
					ImageTransparency = 1,
				}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play()


				task.spawn(function()
					task.wait(.1)
					L_1114_arg1.UIElements.Menu.Visible = false
				end)

				task.spawn(function()
					task.wait(.25)
					L_1114_arg1.UIElements.MenuCanvas.Visible = false
					L_1114_arg1.UIElements.MenuCanvas.Active = false
				end)
			end

			L_1110_.AddSignal(L_1114_arg1.UIElements.Dropdown.MouseButton1Click, function()
				L_1118_:Open()
			end)

			L_1110_.AddSignal(L_1105_.InputBegan, function(L_1161_arg0)
				if L_1161_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1161_arg0.UserInputType == Enum.UserInputType.Touch then
					local L_1162_ = L_1114_arg1.UIElements.MenuCanvas
					local L_1163_, L_1164_ = L_1162_.AbsolutePosition, L_1162_.AbsoluteSize

					local L_1165_ = L_1114_arg1.UIElements.Dropdown
					local L_1166_ = L_1165_.AbsolutePosition
					local L_1167_ = L_1165_.AbsoluteSize

					local L_1168_ =
						L_1106_.X >= L_1166_.X and
						L_1106_.X <= L_1166_.X + L_1167_.X and
						L_1106_.Y >= L_1166_.Y and
						L_1106_.Y <= L_1166_.Y + L_1167_.Y

					local L_1169_ =
						L_1106_.X >= L_1163_.X and
						L_1106_.X <= L_1163_.X + L_1164_.X and
						L_1106_.Y >= L_1163_.Y and
						L_1106_.Y <= L_1163_.Y + L_1164_.Y

					if L_1113_arg0.Window.CanDropdown and L_1114_arg1.Opened and not L_1168_ and not L_1169_ then
						L_1118_:Close()
					end
				end
			end)

			L_1110_.AddSignal(L_1114_arg1.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition", UpdatePosition)


			return L_1118_
		end


		return L_1104_
	end
	function L_1_.I() -- Dropdown
		game:GetService"UserInputService"
		game:GetService"Players".LocalPlayer:GetMouse()
		local L_1170_ =
			game:GetService"Workspace".CurrentCamera

		local L_1171_ = L_1_.load'a'
		local L_1172_ = L_1171_.New
		local L_1173_ =
			L_1171_.Tween

		local L_1174_ = L_1_.load's'.New
		local L_1175_ = L_1_.load'j'
			.New
		local L_1176_ = L_1_.load'H'.New
		local L_1177_ =

			workspace.CurrentCamera

		local L_1178_ = {
			UICorner = 10,
			UIPadding = 12,
			MenuCorner = 15,
			MenuPadding = 5,
			TabPadding = 10,
			SearchBarHeight = 39,
			TabIcon = 18,
		}

		function L_1178_.New(L_1179_arg0, L_1180_arg1)
			local L_1181_ = {
				__type = "Dropdown",
				Title = L_1180_arg1.Title or "Dropdown",
				Desc = L_1180_arg1.Desc or nil,
				Locked = L_1180_arg1.Locked or false,
				Values = L_1180_arg1.Values or {},
				MenuWidth = L_1180_arg1.MenuWidth or 170,
				Value = L_1180_arg1.Value,
				AllowNone = L_1180_arg1.AllowNone,
				SearchBarEnabled = L_1180_arg1.SearchBarEnabled or false,
				Multi = L_1180_arg1.Multi,
				Callback = L_1180_arg1.Callback or function()
				end,

				UIElements = {},

				Opened = false,
				Tabs = {},

				Width = 150,
			}

			if L_1181_.Multi and not L_1181_.Value then
				L_1181_.Value = {}
			end

			local L_1182_ = true

			L_1181_.DropdownFrame = L_1_.load'y'{
				Title = L_1181_.Title,
				Desc = L_1181_.Desc,
				Parent = L_1180_arg1.Parent,
				TextOffset = L_1181_.Width,
				Hover = false,
				Tab = L_1180_arg1.Tab,
				Index = L_1180_arg1.Index,
				Window = L_1180_arg1.Window,
				ElementTable = L_1181_,
			}


			L_1181_.UIElements.Dropdown = L_1174_("", nil, L_1181_.DropdownFrame.UIElements.Main)

			L_1181_.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate = "AtEnd"
			L_1181_.UIElements.Dropdown.Frame.Frame.TextLabel.Size = UDim2.new(1, L_1181_.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset - 18 - 12 - 12, 0, 0)

			L_1181_.UIElements.Dropdown.Size = UDim2.new(0, L_1181_.Width, 0, 36)
			L_1181_.UIElements.Dropdown.Position = UDim2.new(1, 0, 0.5, 0)
			L_1181_.UIElements.Dropdown.AnchorPoint = Vector2.new(1, 0.5)






			L_1172_("ImageLabel", {
				Image = L_1171_.Icon"chevrons-up-down"[1],
				ImageRectOffset = L_1171_.Icon"chevrons-up-down"[2].ImageRectPosition,
				ImageRectSize = L_1171_.Icon"chevrons-up-down"[2].ImageRectSize,
				Size = UDim2.new(0, 18, 0, 18),
				Position = UDim2.new(1, -12, 0.5, 0),
				ThemeTag = {
					ImageColor3 = "Icon"
				},
				AnchorPoint = Vector2.new(1, 0.5),
				Parent = L_1181_.UIElements.Dropdown.Frame
			})


			L_1181_.DropdownMenu = L_1176_(L_1180_arg1, L_1181_, L_1178_, L_1182_, "Dropdown")

			L_1181_.Display = L_1181_.DropdownMenu.Display
			L_1181_.Refresh = L_1181_.DropdownMenu.Refresh
			L_1181_.Select = L_1181_.DropdownMenu.Select
			L_1181_.Open = L_1181_.DropdownMenu.Open
			L_1181_.Close = L_1181_.DropdownMenu.Close

			function L_1181_.Lock(L_1183_arg0)
				L_1181_.Locked = true
				L_1182_ = false
				return L_1181_.DropdownFrame:Lock()
			end
			function L_1181_.Unlock(L_1184_arg0)
				L_1181_.Locked = false
				L_1182_ = true
				return L_1181_.DropdownFrame:Unlock()
			end

			if L_1181_.Locked then
				L_1181_:Lock()
			end


			return L_1181_.__type, L_1181_
		end

		return L_1178_
	end
	function L_1_.J() -- Code Block?






		local L_1185_ = {}
		local L_1186_ = {
			lua = {
				"and",
				"break",
				"or",
				"else",
				"elseif",
				"if",
				"then",
				"until",
				"repeat",
				"while",
				"do",
				"for",
				"in",
				"end",
				"local",
				"return",
				"function",
				"export",
			},
			rbx = {
				"game",
				"workspace",
				"script",
				"math",
				"string",
				"table",
				"task",
				"wait",
				"select",
				"next",
				"Enum",
				"tick",
				"assert",
				"shared",
				"loadstring",
				"tonumber",
				"tostring",
				"type",
				"typeof",
				"unpack",
				"Instance",
				"CFrame",
				"Vector3",
				"Vector2",
				"Color3",
				"UDim",
				"UDim2",
				"Ray",
				"BrickColor",
				"OverlapParams",
				"RaycastParams",
				"Axes",
				"Random",
				"Region3",
				"Rect",
				"TweenInfo",
				"collectgarbage",
				"not",
				"utf8",
				"pcall",
				"xpcall",
				"_G",
				"setmetatable",
				"getmetatable",
				"os",
				"pairs",
				"ipairs"
			},
			operators = {
				"#",
				"+",
				"-",
				"*",
				"%",
				"/",
				"^",
				"=",
				"~",
				"=",
				"<",
				">",
			}
		}

		local L_1187_ = {
			numbers = Color3.fromHex"#FAB387",
			boolean = Color3.fromHex"#FAB387",
			operator = Color3.fromHex"#94E2D5",
			lua = Color3.fromHex"#CBA6F7",
			rbx = Color3.fromHex"#F38BA8",
			str = Color3.fromHex"#A6E3A1",
			comment = Color3.fromHex"#9399B2",
			null = Color3.fromHex"#F38BA8",
			call = Color3.fromHex"#89B4FA",
			self_call = Color3.fromHex"#89B4FA",
			local_property = Color3.fromHex"#CBA6F7",
		}

		local function L_1188_func(L_1193_arg0)
			local L_1194_ = {}
			for L_1195_forvar0, L_1196_forvar1 in ipairs(L_1193_arg0) do
				L_1194_[L_1196_forvar1] = true
			end
			return L_1194_
		end

		local L_1189_ = L_1188_func(L_1186_.lua)
		local L_1190_ = L_1188_func(L_1186_.rbx)
		local L_1191_ = L_1188_func(L_1186_.operators)

		local function L_1192_func(L_1197_arg0, L_1198_arg1)
			local L_1199_ = L_1197_arg0[L_1198_arg1]

			if L_1187_[L_1199_ .. "_color"] then
				return L_1187_[L_1199_ .. "_color"]
			end

			if tonumber(L_1199_) then
				return L_1187_.numbers
			elseif L_1199_ == "nil" then
				return L_1187_.null
			elseif L_1199_:sub(1, 2) == "--" then
				return L_1187_.comment
			elseif L_1191_[L_1199_] then
				return L_1187_.operator
			elseif L_1189_[L_1199_] then
				return L_1187_.lua
			elseif L_1190_[L_1199_] then
				return L_1187_.rbx
			elseif L_1199_:sub(1, 1) == "\"" or L_1199_:sub(1, 1) == "\'" then
				return L_1187_.str
			elseif L_1199_ == "true" or L_1199_ == "false" then
				return L_1187_.boolean
			end

			if L_1197_arg0[L_1198_arg1 + 1] == "(" then
				if L_1197_arg0[L_1198_arg1 - 1] == ":" then
					return L_1187_.self_call
				end

				return L_1187_.call
			end

			if L_1197_arg0[L_1198_arg1 - 1] == "." then
				if L_1197_arg0[L_1198_arg1 - 2] == "Enum" then
					return L_1187_.rbx
				end

				return L_1187_.local_property
			end
		end

		function L_1185_.run(L_1200_arg0)
			local L_1201_ = {}
			local L_1202_ = ""

			local L_1203_ = false
			local L_1204_ = false
			local L_1205_ = false

			for L_1207_forvar0 = 1, #L_1200_arg0 do
				local L_1208_ = L_1200_arg0:sub(L_1207_forvar0, L_1207_forvar0)

				if L_1204_ then
					if L_1208_ == "\n" and not L_1205_ then
						table.insert(L_1201_, L_1202_)
						table.insert(L_1201_, L_1208_)
						L_1202_ = ""

						L_1204_ = false
					elseif L_1200_arg0:sub(L_1207_forvar0 - 1, L_1207_forvar0) == "]]" and L_1205_ then
						L_1202_ = L_1202_ .. "]"

						table.insert(L_1201_, L_1202_)
						L_1202_ = ""

						L_1204_ = false
						L_1205_ = false
					else
						L_1202_ = L_1202_ .. L_1208_
					end
				elseif L_1203_ then
					if L_1208_ == L_1203_ and L_1200_arg0:sub(L_1207_forvar0 - 1, L_1207_forvar0 - 1) ~= "\\" or L_1208_ == "\n" then
						L_1202_ = L_1202_ .. L_1208_
						L_1203_ = false
					else
						L_1202_ = L_1202_ .. L_1208_
					end
				else
					if L_1200_arg0:sub(L_1207_forvar0, L_1207_forvar0 + 1) == "--" then
						table.insert(L_1201_, L_1202_)
						L_1202_ = "-"
						L_1204_ = true
						L_1205_ = L_1200_arg0:sub(L_1207_forvar0 + 2, L_1207_forvar0 + 3) == "[["
					elseif L_1208_ == "\"" or L_1208_ == "\'" then
						table.insert(L_1201_, L_1202_)
						L_1202_ = L_1208_
						L_1203_ = L_1208_
					elseif L_1191_[L_1208_] then
						table.insert(L_1201_, L_1202_)
						table.insert(L_1201_, L_1208_)
						L_1202_ = ""
					elseif L_1208_:match"[%w_]" then
						L_1202_ = L_1202_ .. L_1208_
					else
						table.insert(L_1201_, L_1202_)
						table.insert(L_1201_, L_1208_)
						L_1202_ = ""
					end
				end
			end

			table.insert(L_1201_, L_1202_)

			local L_1206_ = {}

			for L_1209_forvar0, L_1210_forvar1 in ipairs(L_1201_) do
				local L_1211_ = L_1192_func(L_1201_, L_1209_forvar0)

				if L_1211_ then
					local L_1212_ = string.format("<font color = \"#%s\">%s</font>", L_1211_:ToHex(), L_1210_forvar1:gsub("<", "&lt;"):gsub(">", "&gt;"))

					table.insert(L_1206_, L_1212_)
				else
					table.insert(L_1206_, L_1210_forvar1)
				end
			end

			return table.concat(L_1206_)
		end

		return L_1185_
	end
	function L_1_.K() -- ?
		local L_1213_ = {}

		local L_1214_ = L_1_.load'a'
		local L_1215_ = L_1214_.New
		local L_1216_ = L_1214_.Tween

		local L_1217_ = L_1_.load'J'

		function L_1213_.New(L_1218_arg0, L_1219_arg1, L_1220_arg2, L_1221_arg3, L_1222_arg4)
			local L_1223_ = {
				Radius = 12,
				Padding = 10
			}

			local L_1224_ = L_1215_("TextLabel", {
				Text = "",
				TextColor3 = Color3.fromHex"#CDD6F4",
				TextTransparency = 0,
				TextSize = 14,
				TextWrapped = false,
				LineHeight = 1.15,
				RichText = true,
				TextXAlignment = "Left",
				Size = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			}, {
				L_1215_("UIPadding", {
					PaddingTop = UDim.new(0, L_1223_.Padding + 3),
					PaddingLeft = UDim.new(0, L_1223_.Padding + 3),
					PaddingRight = UDim.new(0, L_1223_.Padding + 3),
					PaddingBottom = UDim.new(0, L_1223_.Padding + 3),
				})
			})
			L_1224_.Font = "Code"

			local L_1225_ = L_1215_("ScrollingFrame", {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticCanvasSize = "X",
				ScrollingDirection = "X",
				ElasticBehavior = "Never",
				CanvasSize = UDim2.new(0, 0, 0, 0),
				ScrollBarThickness = 0,
			}, {
				L_1224_
			})

			local L_1226_ = L_1215_("TextButton", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 30, 0, 30),
				Position = UDim2.new(1, -L_1223_.Padding / 2, 0, L_1223_.Padding / 2),
				AnchorPoint = Vector2.new(1, 0),
				Visible = L_1221_arg3 and true or false,
			}, {
				L_1214_.NewRoundFrame(L_1223_.Radius - 4, "Squircle", {



					ImageColor3 = Color3.fromHex"#ffffff",
					ImageTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = "Button",
				}, {
					L_1215_("UIScale", {
						Scale = 1,
					}),
					L_1215_("ImageLabel", {
						Image = L_1214_.Icon"copy"[1],
						ImageRectSize = L_1214_.Icon"copy"[2].ImageRectSize,
						ImageRectOffset = L_1214_.Icon"copy"[2].ImageRectPosition,
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, 12, 0, 12),



						ImageColor3 = Color3.fromHex"#ffffff",
						ImageTransparency = .1,
					})
				})
			})

			L_1214_.AddSignal(L_1226_.MouseEnter, function()
				L_1216_(L_1226_.Button, .05, {
					ImageTransparency = .95
				}):Play()
				L_1216_(L_1226_.Button.UIScale, .05, {
					Scale = .9
				}):Play()
			end)
			L_1214_.AddSignal(L_1226_.InputEnded, function()
				L_1216_(L_1226_.Button, .08, {
					ImageTransparency = 1
				}):Play()
				L_1216_(L_1226_.Button.UIScale, .08, {
					Scale = 1
				}):Play()
			end)

			local L_1227_ = L_1214_.NewRoundFrame(L_1223_.Radius, "Squircle", {



				ImageColor3 = Color3.fromHex"#212121",
				ImageTransparency = .035,
				Size = UDim2.new(1, 0, 0, 20 + (L_1223_.Padding * 2)),
				AutomaticSize = "Y",
				Parent = L_1220_arg2,
			}, {
				L_1214_.NewRoundFrame(L_1223_.Radius, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),



					ImageColor3 = Color3.fromHex"#ffffff",
					ImageTransparency = .955,
				}),
				L_1215_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
				}, {
					L_1214_.NewRoundFrame(L_1223_.Radius, "Squircle-TL-TR", {



						ImageColor3 = Color3.fromHex"#ffffff",
						ImageTransparency = .96,
						Size = UDim2.new(1, 0, 0, 20 + (L_1223_.Padding * 2)),
						Visible = L_1219_arg1 and true or false
					}, {
						L_1215_("ImageLabel", {
							Size = UDim2.new(0, 18, 0, 18),
							BackgroundTransparency = 1,
							Image = "rbxassetid://132464694294269",



							ImageColor3 = Color3.fromHex"#ffffff",
							ImageTransparency = .2,
						}),
						L_1215_("TextLabel", {
							Text = L_1219_arg1,



							TextColor3 = Color3.fromHex"#ffffff",
							TextTransparency = .2,
							TextSize = 16,
							AutomaticSize = "Y",
							FontFace = Font.new(L_1214_.Font, Enum.FontWeight.Medium),
							TextXAlignment = "Left",
							BackgroundTransparency = 1,
							TextTruncate = "AtEnd",
							Size = UDim2.new(1, L_1226_ and -20 - (L_1223_.Padding * 2), 0, 0)
						}),
						L_1215_("UIPadding", {

							PaddingLeft = UDim.new(0, L_1223_.Padding + 3),
							PaddingRight = UDim.new(0, L_1223_.Padding + 3),

						}),
						L_1215_("UIListLayout", {
							Padding = UDim.new(0, L_1223_.Padding),
							FillDirection = "Horizontal",
							VerticalAlignment = "Center",
						})
					}),
					L_1225_,
					L_1215_("UIListLayout", {
						Padding = UDim.new(0, 0),
						FillDirection = "Vertical",
					})
				}),
				L_1226_,
			})

			L_1223_.CodeFrame = L_1227_

			L_1214_.AddSignal(L_1224_:GetPropertyChangedSignal"TextBounds", function()
				L_1225_.Size = UDim2.new(1, 0, 0, (L_1224_.TextBounds.Y / (L_1222_arg4 or 1)) + ((L_1223_.Padding + 3) * 2))
			end)

			function L_1223_.Set(L_1228_arg0)
				L_1224_.Text = L_1217_.run(L_1228_arg0)
			end

			function L_1223_.Destroy()
				L_1227_:Destroy()
				L_1223_ = nil
			end

			L_1223_.Set(L_1218_arg0)

			L_1214_.AddSignal(L_1226_.MouseButton1Click, function()
				if L_1221_arg3 then
					L_1221_arg3()
					local L_1229_ = L_1214_.Icon"check"
					L_1226_.Button.ImageLabel.Image = L_1229_[1]
					L_1226_.Button.ImageLabel.ImageRectSize = L_1229_[2].ImageRectSize
					L_1226_.Button.ImageLabel.ImageRectOffset = L_1229_[2].ImageRectPosition

					task.wait(1)
					local L_1230_ = L_1214_.Icon"copy"
					L_1226_.Button.ImageLabel.Image = L_1230_[1]
					L_1226_.Button.ImageLabel.ImageRectSize = L_1230_[2].ImageRectSize
					L_1226_.Button.ImageLabel.ImageRectOffset = L_1230_[2].ImageRectPosition
				end
			end)
			return L_1223_
		end


		return L_1213_
	end
	function L_1_.L() -- Code Block?
		local L_1231_ = L_1_.load'a'
		local L_1232_ =
			L_1231_.New


		local L_1233_ = L_1_.load'K'

		local L_1234_ = {}

		function L_1234_.New(L_1235_arg0, L_1236_arg1)
			local L_1237_ = {
				__type = "Code",
				Title = L_1236_arg1.Title,
				Code = L_1236_arg1.Code,
				OnCopy = L_1236_arg1.OnCopy,
			}

			local L_1238_ = not L_1237_.Locked











			local L_1239_ = L_1233_.New(L_1237_.Code, L_1237_.Title, L_1236_arg1.Parent, function()
				if L_1238_ then
					local L_1240_ = L_1237_.Title or "code"
					local L_1241_, L_1242_ = pcall(function()
						toclipboard(L_1237_.Code)

						if L_1237_.OnCopy then
							L_1237_.OnCopy()
						end
					end)
					if not L_1241_ then
						L_1236_arg1.WindUI:Notify{
							Title = "Error",
							Content = "The " .. L_1240_ .. " is not copied. Error: " .. L_1242_,
							Icon = "x",
							Duration = 5,
						}
					end
				end
			end, L_1236_arg1.WindUI.UIScale, L_1237_)

			function L_1237_.SetCode(L_1243_arg0, L_1244_arg1)
				L_1239_.Set(L_1244_arg1)
			end

			function L_1237_.Destroy(L_1245_arg0)
				L_1239_.Destroy()
				L_1237_ = nil
			end

			L_1237_.ElementFrame = L_1239_.CodeFrame

			return L_1237_.__type, L_1237_
		end

		return L_1234_
	end
	function L_1_.M() -- Colorpicker
		local L_1246_ = L_1_.load'a'
		local L_1247_ = L_1246_.New
		local L_1248_ =
			L_1246_.Tween

		local L_1249_ = game:GetService"UserInputService"
		game:GetService"TouchInputService"
		local L_1250_ = game:GetService"RunService"
		local L_1251_ = game:GetService"Players"

		local L_1252_ = L_1250_.RenderStepped
		local L_1253_ = L_1251_.LocalPlayer
		local L_1254_ = L_1253_:GetMouse()

		local L_1255_ = L_1_.load'i'.New
		local L_1256_ = L_1_.load'j'.New

		local L_1257_ = {
			UICorner = 8,
			UIPadding = 8
		}

		function L_1257_.Colorpicker(L_1258_arg0, L_1259_arg1, L_1260_arg2, L_1261_arg3)
			local L_1262_ = {
				__type = "Colorpicker",
				Title = L_1259_arg1.Title,
				Desc = L_1259_arg1.Desc,
				Default = L_1259_arg1.Default,
				Callback = L_1259_arg1.Callback,
				Transparency = L_1259_arg1.Transparency,
				UIElements = L_1259_arg1.UIElements,

				TextPadding = 10,
			}

			function L_1262_.SetHSVFromRGB(L_1291_arg0, L_1292_arg1)
				local L_1293_, L_1294_, L_1295_ = Color3.toHSV(L_1292_arg1)
				L_1262_.Hue = L_1293_
				L_1262_.Sat = L_1294_
				L_1262_.Vib = L_1295_
			end

			L_1262_:SetHSVFromRGB(L_1262_.Default)

			local L_1263_ = L_1_.load'k'.Init(L_1260_arg2)
			local L_1264_ = L_1263_.Create()

			L_1262_.ColorpickerFrame = L_1264_

			L_1264_.UIElements.Main.Size = UDim2.new(1, 0, 0, 0)



			local L_1265_, L_1266_, L_1267_ = L_1262_.Hue, L_1262_.Sat, L_1262_.Vib

			L_1262_.UIElements.Title = L_1247_("TextLabel", {
				Text = L_1262_.Title,
				TextSize = 20,
				FontFace = Font.new(L_1246_.Font, Enum.FontWeight.SemiBold),
				TextXAlignment = "Left",
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = "Y",
				ThemeTag = {
					TextColor3 = "Text"
				},
				BackgroundTransparency = 1,
				Parent = L_1264_.UIElements.Main
			}, {
				L_1247_("UIPadding", {
					PaddingTop = UDim.new(0, L_1262_.TextPadding / 2),
					PaddingLeft = UDim.new(0, L_1262_.TextPadding / 2),
					PaddingRight = UDim.new(0, L_1262_.TextPadding / 2),
					PaddingBottom = UDim.new(0, L_1262_.TextPadding / 2),
				})
			})





			local L_1268_ = L_1247_("Frame", {
				Size = UDim2.new(0, 14, 0, 14),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0, 0),
				Parent = HueDragHolder,
				BackgroundColor3 = L_1262_.Default
			}, {
				L_1247_("UIStroke", {
					Thickness = 2,
					Transparency = .1,
					ThemeTag = {
						Color = "Text",
					},
				}),
				L_1247_("UICorner", {
					CornerRadius = UDim.new(1, 0),
				})
			})

			L_1262_.UIElements.SatVibMap = L_1247_("ImageLabel", {
				Size = UDim2.fromOffset(160, 158),
				Position = UDim2.fromOffset(0, 40 + L_1262_.TextPadding),
				Image = "rbxassetid://4155801252",
				BackgroundColor3 = Color3.fromHSV(L_1265_, 1, 1),
				BackgroundTransparency = 0,
				Parent = L_1264_.UIElements.Main,
			}, {
				L_1247_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
				L_1246_.NewRoundFrame(8, "SquircleOutline", {
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = .85,
					ZIndex = 99999,
				}, {
					L_1247_("UIGradient", {
						Rotation = 45,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}
					})
				}),

				L_1268_,
			})

			L_1262_.UIElements.Inputs = L_1247_("Frame", {
				AutomaticSize = "XY",
				Size = UDim2.new(0, 0, 0, 0),
				Position = UDim2.fromOffset(L_1262_.Transparency and 240 or 210, 40 + L_1262_.TextPadding),
				BackgroundTransparency = 1,
				Parent = L_1264_.UIElements.Main
			}, {
				L_1247_("UIListLayout", {
					Padding = UDim.new(0, 4),
					FillDirection = "Vertical",
				})
			})





			local L_1269_ = L_1247_("Frame", {
				BackgroundColor3 = L_1262_.Default,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = L_1262_.Transparency,
			}, {
				L_1247_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			})

			L_1247_("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(85, 208 + L_1262_.TextPadding),
				Size = UDim2.fromOffset(75, 24),
				Parent = L_1264_.UIElements.Main,
			}, {
				L_1247_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
				L_1246_.NewRoundFrame(8, "SquircleOutline", {
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = .85,
					ZIndex = 99999,
				}, {
					L_1247_("UIGradient", {
						Rotation = 60,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}
					})
				}),







				L_1269_,
			})

			local L_1270_ = L_1247_("Frame", {
				BackgroundColor3 = L_1262_.Default,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 0,
				ZIndex = 9,
			}, {
				L_1247_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			})

			L_1247_("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 208 + L_1262_.TextPadding),
				Size = UDim2.fromOffset(75, 24),
				Parent = L_1264_.UIElements.Main,
			}, {
				L_1247_("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),







				L_1246_.NewRoundFrame(8, "SquircleOutline", {
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = .85,
					ZIndex = 99999,
				}, {
					L_1247_("UIGradient", {
						Rotation = 60,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}
					})
				}),
				L_1270_,
			})

			local L_1271_ = {}

			for L_1296_forvar0 = 0, 1, 0.1 do
				table.insert(L_1271_, ColorSequenceKeypoint.new(L_1296_forvar0, Color3.fromHSV(L_1296_forvar0, 1, 1)))
			end

			local L_1272_ = L_1247_("UIGradient", {
				Color = ColorSequence.new(L_1271_),
				Rotation = 90,
			})

			local L_1273_ = L_1247_("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
			})

			local L_1274_ = L_1247_("Frame", {
				Size = UDim2.new(0, 14, 0, 14),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0, 0),
				Parent = L_1273_,


				BackgroundColor3 = L_1262_.Default
			}, {
				L_1247_("UIStroke", {
					Thickness = 2,
					Transparency = .1,
					ThemeTag = {
						Color = "Text",
					},
				}),
				L_1247_("UICorner", {
					CornerRadius = UDim.new(1, 0),
				})
			})

			local L_1275_ = L_1247_("Frame", {
				Size = UDim2.fromOffset(6, 192),
				Position = UDim2.fromOffset(180, 40 + L_1262_.TextPadding),
				Parent = L_1264_.UIElements.Main,
			}, {
				L_1247_("UICorner", {
					CornerRadius = UDim.new(1, 0),
				}),
				L_1272_,
				L_1273_,
			})


			function CreateNewInput(L_1297_arg0, L_1298_arg1)
				local L_1299_ = L_1256_(L_1297_arg0, nil, L_1262_.UIElements.Inputs)

				L_1247_("TextLabel", {
					BackgroundTransparency = 1,
					TextTransparency = .4,
					TextSize = 17,
					FontFace = Font.new(L_1246_.Font, Enum.FontWeight.Regular),
					AutomaticSize = "XY",
					ThemeTag = {
						TextColor3 = "Placeholder",
					},
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -12, 0.5, 0),
					Parent = L_1299_.Frame,
					Text = L_1297_arg0,
				})

				L_1247_("UIScale", {
					Parent = L_1299_,
					Scale = .85,
				})

				L_1299_.Frame.Frame.TextBox.Text = L_1298_arg1
				L_1299_.Size = UDim2.new(0, 150, 0, 42)

				return L_1299_
			end

			local function L_1276_func(L_1300_arg0)
				return {
					R = math.floor(L_1300_arg0.R * 255),
					G = math.floor(L_1300_arg0.G * 255),
					B = math.floor(L_1300_arg0.B * 255)
				}
			end

			local L_1277_ = CreateNewInput("Hex", "#" .. L_1262_.Default:ToHex())

			local L_1278_ = CreateNewInput("Red", L_1276_func(L_1262_.Default).R)
			local L_1279_ = CreateNewInput("Green", L_1276_func(L_1262_.Default).G)
			local L_1280_ = CreateNewInput("Blue", L_1276_func(L_1262_.Default).B)
			local L_1281_
			if L_1262_.Transparency then
				L_1281_ = CreateNewInput("Alpha", ((1 - L_1262_.Transparency) * 100) .. "%")
			end

			local L_1282_ = L_1247_("Frame", {
				Size = UDim2.new(1, 0, 0, 40),
				AutomaticSize = "Y",
				Position = UDim2.new(0, 0, 0, 254 + L_1262_.TextPadding),
				BackgroundTransparency = 1,
				Parent = L_1264_.UIElements.Main,
				LayoutOrder = 4,
			}, {
				L_1247_("UIListLayout", {
					Padding = UDim.new(0, 6),
					FillDirection = "Horizontal",
					HorizontalAlignment = "Right",
				}),






			})

			local L_1283_ = {
				{
					Title = "Cancel",
					Variant = "Secondary",
					Callback = function()
					end
				},
				{
					Title = "Apply",
					Icon = "chevron-right",
					Variant = "Primary",
					Callback = function()
						L_1261_arg3(Color3.fromHSV(L_1262_.Hue, L_1262_.Sat, L_1262_.Vib), L_1262_.Transparency)
					end
				}
			}

			for L_1301_forvar0, L_1302_forvar1 in next, L_1283_ do
				local L_1303_ = L_1255_(L_1302_forvar1.Title, L_1302_forvar1.Icon, L_1302_forvar1.Callback, L_1302_forvar1.Variant, L_1282_, L_1264_, false)
				L_1303_.Size = UDim2.new(0.5, -3, 0, 40)
				L_1303_.AutomaticSize = "None"
			end



			local L_1284_, L_1285_, L_1286_
			if L_1262_.Transparency then
				local L_1304_ = L_1247_("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1,
				})

				L_1285_ = L_1247_("ImageLabel", {
					Size = UDim2.new(0, 14, 0, 14),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0, 0),
					ThemeTag = {
						BackgroundColor3 = "Text",
					},
					Parent = L_1304_,

				}, {
					L_1247_("UIStroke", {
						Thickness = 2,
						Transparency = .1,
						ThemeTag = {
							Color = "Text",
						},
					}),
					L_1247_("UICorner", {
						CornerRadius = UDim.new(1, 0),
					})

				})

				L_1286_ = L_1247_("Frame", {
					Size = UDim2.fromScale(1, 1),
				}, {
					L_1247_("UIGradient", {
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						},
						Rotation = 270,
					}),
					L_1247_("UICorner", {
						CornerRadius = UDim.new(0, 6),
					}),
				})

				L_1284_ = L_1247_("Frame", {
					Size = UDim2.fromOffset(6, 192),
					Position = UDim2.fromOffset(210, 40 + L_1262_.TextPadding),
					Parent = L_1264_.UIElements.Main,
					BackgroundTransparency = 1,
				}, {
					L_1247_("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
					L_1247_("ImageLabel", {
						Image = "rbxassetid://14204231522",
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
					}, {
						L_1247_("UICorner", {
							CornerRadius = UDim.new(1, 0),
						}),
					}),
					L_1286_,
					L_1304_,
				})
			end

			function L_1262_.Round(L_1305_arg0, L_1306_arg1, L_1307_arg2)
				if L_1307_arg2 == 0 then
					return math.floor(L_1306_arg1)
				end
				L_1306_arg1 = tostring(L_1306_arg1)
				return L_1306_arg1:find"%." and tonumber(L_1306_arg1:sub(1, L_1306_arg1:find"%." + L_1307_arg2)) or L_1306_arg1
			end


			function L_1262_.Update(L_1308_arg0, L_1309_arg1, L_1310_arg2)
				if L_1309_arg1 then
					L_1265_, L_1266_, L_1267_ = Color3.toHSV(L_1309_arg1)
				else
					L_1265_, L_1266_, L_1267_ = L_1262_.Hue, L_1262_.Sat, L_1262_.Vib
				end

				L_1262_.UIElements.SatVibMap.BackgroundColor3 = Color3.fromHSV(L_1265_, 1, 1)
				L_1268_.Position = UDim2.new(L_1266_, 0, 1 - L_1267_, 0)
				L_1268_.BackgroundColor3 = Color3.fromHSV(L_1265_, L_1266_, L_1267_)
				L_1270_.BackgroundColor3 = Color3.fromHSV(L_1265_, L_1266_, L_1267_)
				L_1274_.BackgroundColor3 = Color3.fromHSV(L_1265_, 1, 1)
				L_1274_.Position = UDim2.new(0.5, 0, L_1265_, 0)

				L_1277_.Frame.Frame.TextBox.Text = "#" .. Color3.fromHSV(L_1265_, L_1266_, L_1267_):ToHex()
				L_1278_.Frame.Frame.TextBox.Text = L_1276_func(Color3.fromHSV(L_1265_, L_1266_, L_1267_)).R
				L_1279_.Frame.Frame.TextBox.Text = L_1276_func(Color3.fromHSV(L_1265_, L_1266_, L_1267_)).G
				L_1280_.Frame.Frame.TextBox.Text = L_1276_func(Color3.fromHSV(L_1265_, L_1266_, L_1267_)).B

				if L_1310_arg2 or L_1262_.Transparency then
					L_1270_.BackgroundTransparency = L_1262_.Transparency or L_1310_arg2
					L_1286_.BackgroundColor3 = Color3.fromHSV(L_1265_, L_1266_, L_1267_)
					L_1285_.BackgroundColor3 = Color3.fromHSV(L_1265_, L_1266_, L_1267_)
					L_1285_.BackgroundTransparency = L_1262_.Transparency or L_1310_arg2
					L_1285_.Position = UDim2.new(0.5, 0, 1 - L_1262_.Transparency or L_1310_arg2, 0)
					L_1281_.Frame.Frame.TextBox.Text = L_1262_:Round((1 - L_1262_.Transparency or L_1310_arg2) * 100, 0) .. "%"
				end
			end

			L_1262_:Update(L_1262_.Default, L_1262_.Transparency)




			local function L_1287_func()
				local L_1311_ = Color3.fromHSV(L_1262_.Hue, L_1262_.Sat, L_1262_.Vib)
				return {
					R = math.floor(L_1311_.r * 255),
					G = math.floor(L_1311_.g * 255),
					B = math.floor(L_1311_.b * 255)
				}
			end



			local function L_1288_func(L_1312_arg0, L_1313_arg1, L_1314_arg2)
				return math.clamp(tonumber(L_1312_arg0) or 0, L_1313_arg1, L_1314_arg2)
			end

			L_1246_.AddSignal(L_1277_.Frame.Frame.TextBox.FocusLost, function(L_1315_arg0)
				if L_1315_arg0 then
					local L_1316_ = L_1277_.Frame.Frame.TextBox.Text:gsub("#", "")
					local L_1317_, L_1318_ = pcall(Color3.fromHex, L_1316_)
					if L_1317_ and typeof(L_1318_) == "Color3" then
						L_1262_.Hue, L_1262_.Sat, L_1262_.Vib = Color3.toHSV(L_1318_)
						L_1262_:Update()
						L_1262_.Default = L_1318_
					end
				end
			end)

			local function L_1289_func(L_1319_arg0, L_1320_arg1)
				L_1246_.AddSignal(L_1319_arg0.Frame.Frame.TextBox.FocusLost, function(L_1321_arg0)
					if L_1321_arg0 then
						local L_1322_ = L_1319_arg0.Frame.Frame.TextBox
						local L_1323_ = L_1287_func()
						local L_1324_ = L_1288_func(L_1322_.Text, 0, 255)
						L_1322_.Text = tostring(L_1324_)

						L_1323_[L_1320_arg1] = L_1324_
						local L_1325_ = Color3.fromRGB(L_1323_.R, L_1323_.G, L_1323_.B)
						L_1262_.Hue, L_1262_.Sat, L_1262_.Vib = Color3.toHSV(L_1325_)
						L_1262_:Update()
					end
				end)
			end

			L_1289_func(L_1278_, "R")
			L_1289_func(L_1279_, "G")
			L_1289_func(L_1280_, "B")

			if L_1262_.Transparency then
				L_1246_.AddSignal(L_1281_.Frame.Frame.TextBox.FocusLost, function(L_1326_arg0)
					if L_1326_arg0 then
						local L_1327_ = L_1281_.Frame.Frame.TextBox
						local L_1328_ = L_1288_func(L_1327_.Text, 0, 100)
						L_1327_.Text = tostring(L_1328_)

						L_1262_.Transparency = 1 - L_1328_ * 0.01
						L_1262_:Update(nil, L_1262_.Transparency)
					end
				end)
			end



			local L_1290_ = L_1262_.UIElements.SatVibMap
			L_1246_.AddSignal(L_1290_.InputBegan, function(L_1329_arg0)
				if L_1329_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1329_arg0.UserInputType == Enum.UserInputType.Touch then
					while L_1249_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local L_1330_ = L_1290_.AbsolutePosition.X
						local L_1331_ = L_1330_ + L_1290_.AbsoluteSize.X
						local L_1332_ = math.clamp(L_1254_.X, L_1330_, L_1331_)

						local L_1333_ = L_1290_.AbsolutePosition.Y
						local L_1334_ = L_1333_ + L_1290_.AbsoluteSize.Y
						local L_1335_ = math.clamp(L_1254_.Y, L_1333_, L_1334_)

						L_1262_.Sat = (L_1332_ - L_1330_) / (L_1331_ - L_1330_)
						L_1262_.Vib = 1 - ((L_1335_ - L_1333_) / (L_1334_ - L_1333_))
						L_1262_:Update()

						L_1252_:Wait()
					end
				end
			end)

			L_1246_.AddSignal(L_1275_.InputBegan, function(L_1336_arg0)
				if L_1336_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1336_arg0.UserInputType == Enum.UserInputType.Touch then
					while L_1249_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local L_1337_ = L_1275_.AbsolutePosition.Y
						local L_1338_ = L_1337_ + L_1275_.AbsoluteSize.Y
						local L_1339_ = math.clamp(L_1254_.Y, L_1337_, L_1338_)

						L_1262_.Hue = ((L_1339_ - L_1337_) / (L_1338_ - L_1337_))
						L_1262_:Update()

						L_1252_:Wait()
					end
				end
			end)

			if L_1262_.Transparency then
				L_1246_.AddSignal(L_1284_.InputBegan, function(L_1340_arg0)
					if L_1340_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1340_arg0.UserInputType == Enum.UserInputType.Touch then
						while L_1249_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local L_1341_ = L_1284_.AbsolutePosition.Y
							local L_1342_ = L_1341_ + L_1284_.AbsoluteSize.Y
							local L_1343_ = math.clamp(L_1254_.Y, L_1341_, L_1342_)

							L_1262_.Transparency = 1 - ((L_1343_ - L_1341_) / (L_1342_ - L_1341_))
							L_1262_:Update()

							L_1252_:Wait()
						end
					end
				end)
			end

			return L_1262_
		end

		function L_1257_.New(L_1344_arg0, L_1345_arg1)
			local L_1346_ = {
				__type = "Colorpicker",
				Title = L_1345_arg1.Title or "Colorpicker",
				Desc = L_1345_arg1.Desc or nil,
				Locked = L_1345_arg1.Locked or false,
				Default = L_1345_arg1.Default or Color3.new(1, 1, 1),
				Callback = L_1345_arg1.Callback or function()
				end,

				UIScale = L_1345_arg1.UIScale,
				Transparency = L_1345_arg1.Transparency,
				UIElements = {}
			}

			local L_1347_ = true

			if L_1345_arg1.Window.NewElements then
				L_1257_.UICorner = 14
			end

			L_1346_.ColorpickerFrame = L_1_.load'y'{
				Title = L_1346_.Title,
				Desc = L_1346_.Desc,
				Parent = L_1345_arg1.Parent,
				TextOffset = 40,
				Hover = false,
				Tab = L_1345_arg1.Tab,
				Index = L_1345_arg1.Index,
				Window = L_1345_arg1.Window,
				ElementTable = L_1346_,
			}

			L_1346_.UIElements.Colorpicker = L_1246_.NewRoundFrame(L_1257_.UICorner, "Squircle", {
				ImageTransparency = 0,
				Active = true,
				ImageColor3 = L_1346_.Default,
				Parent = L_1346_.ColorpickerFrame.UIElements.Main,
				Size = UDim2.new(0, 30, 0, 30),
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				ZIndex = 2
			}, nil, true)


			function L_1346_.Lock(L_1348_arg0)
				L_1346_.Locked = true
				L_1347_ = false
				return L_1346_.ColorpickerFrame:Lock()
			end
			function L_1346_.Unlock(L_1349_arg0)
				L_1346_.Locked = false
				L_1347_ = true
				return L_1346_.ColorpickerFrame:Unlock()
			end

			if L_1346_.Locked then
				L_1346_:Lock()
			end


			function L_1346_.Update(L_1350_arg0, L_1351_arg1, L_1352_arg2)
				L_1346_.UIElements.Colorpicker.ImageTransparency = L_1352_arg2 or 0
				L_1346_.UIElements.Colorpicker.ImageColor3 = L_1351_arg1
				L_1346_.Default = L_1351_arg1
				if L_1352_arg2 then
					L_1346_.Transparency = L_1352_arg2
				end
			end

			function L_1346_.Set(L_1353_arg0, L_1354_arg1, L_1355_arg2)
				return L_1346_:Update(L_1354_arg1, L_1355_arg2)
			end

			L_1246_.AddSignal(L_1346_.UIElements.Colorpicker.MouseButton1Click, function()
				if L_1347_ then
					L_1257_:Colorpicker(L_1346_, L_1345_arg1.Window, function(L_1356_arg0, L_1357_arg1)
						L_1346_:Update(L_1356_arg0, L_1357_arg1)
						L_1346_.Default = L_1356_arg0
						L_1346_.Transparency = L_1357_arg1
						L_1246_.SafeCallback(L_1346_.Callback, L_1356_arg0, L_1357_arg1)
					end).ColorpickerFrame:Open()
				end
			end)

			return L_1346_.__type, L_1346_
		end

		return L_1257_
	end
	function L_1_.N() -- Section
		local L_1358_ = L_1_.load'a'
		local L_1359_ = L_1358_.New
		local L_1360_ = L_1358_.Tween

		local L_1361_ = {}

		function L_1361_.New(L_1362_arg0, L_1363_arg1)
			local L_1364_ = {
				__type = "Section",
				Title = L_1363_arg1.Title or "Section",
				Icon = L_1363_arg1.Icon,
				TextXAlignment = L_1363_arg1.TextXAlignment or "Left",
				TextSize = L_1363_arg1.TextSize or 19,
				Box = L_1363_arg1.Box or false,
				FontWeight = L_1363_arg1.FontWeight or Enum.FontWeight.SemiBold,
				TextTransparency = L_1363_arg1.TextTransparency or 0.05,
				Opened = L_1363_arg1.Opened or false,
				UIElements = {},

				HeaderSize = 42,
				IconSize = 20,
				Padding = 10,

				Elements = {},

				Expandable = false,
			}

			local L_1365_


			function L_1364_.SetIcon(L_1371_arg0, L_1372_arg1)
				L_1364_.Icon = L_1372_arg1 or nil
				if L_1365_ then
					L_1365_:Destroy()
				end
				if L_1372_arg1 then
					L_1365_ = L_1358_.Image(
						L_1372_arg1,
						L_1372_arg1 .. ":" .. L_1364_.Title,
						0,
						L_1363_arg1.Window.Folder,
						L_1364_.__type,
						true
					)
					L_1365_.Size = UDim2.new(0, L_1364_.IconSize, 0, L_1364_.IconSize)
				end
			end

			local L_1366_ = L_1359_("Frame", {
				Size = UDim2.new(0, L_1364_.IconSize, 0, L_1364_.IconSize),
				BackgroundTransparency = 1,
				Visible = false
			}, {
				L_1359_("ImageLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = L_1358_.Icon"chevron-down"[1],
					ImageRectSize = L_1358_.Icon"chevron-down"[2].ImageRectSize,
					ImageRectOffset = L_1358_.Icon"chevron-down"[2].ImageRectPosition,
					ThemeTag = {
						ImageColor3 = "Icon",
					},
					ImageTransparency = .7,
				})
			})


			if L_1364_.Icon then
				L_1364_:SetIcon(L_1364_.Icon)
			end

			local L_1367_ = L_1359_("TextLabel", {
				BackgroundTransparency = 1,
				TextXAlignment = L_1364_.TextXAlignment,
				AutomaticSize = "Y",
				TextSize = L_1364_.TextSize,
				TextTransparency = L_1364_.TextTransparency,
				ThemeTag = {
					TextColor3 = "Text",
				},
				FontFace = Font.new(L_1358_.Font, L_1364_.FontWeight),


				Text = L_1364_.Title,
				Size = UDim2.new(
					1,
					0,
					0,
					0
				),
				TextWrapped = true,
			})


			local function L_1368_func()
				local L_1373_ = 0
				if L_1365_ then
					L_1373_ = L_1373_ - (L_1364_.IconSize + 8)
				end
				if L_1366_.Visible then
					L_1373_ = L_1373_ - (L_1364_.IconSize + 8)
				end
				L_1367_.Size = UDim2.new(1, L_1373_, 0, 0)
			end


			local L_1369_ = L_1358_.NewRoundFrame(L_1363_arg1.Window.ElementConfig.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = L_1363_arg1.Parent,
				ClipsDescendants = true,
				AutomaticSize = "Y",
				ImageTransparency = L_1364_.Box and .93 or 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}, {
				L_1359_("TextButton", {
					Size = UDim2.new(1, 0, 0, Expandable and 0 or L_1364_.HeaderSize),
					BackgroundTransparency = 1,
					AutomaticSize = Expandable and nil or "Y",
					Text = "",
					Name = "Top",
				}, {
					L_1364_.Box and L_1359_("UIPadding", {
						PaddingLeft = UDim.new(0, L_1363_arg1.Window.ElementConfig.UIPadding),
						PaddingRight = UDim.new(0, L_1363_arg1.Window.ElementConfig.UIPadding),
					}) or nil,
					L_1365_,
					L_1367_,
					L_1359_("UIListLayout", {
						Padding = UDim.new(0, 8),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
						HorizontalAlignment = "Left",
					}),
					L_1366_,
				}),
				L_1359_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					Name = "Content",
					Visible = false,
					Position = UDim2.new(0, 0, 0, L_1364_.HeaderSize)
				}, {
					L_1364_.Box and L_1359_("UIPadding", {
						PaddingLeft = UDim.new(0, L_1363_arg1.Window.ElementConfig.UIPadding),
						PaddingRight = UDim.new(0, L_1363_arg1.Window.ElementConfig.UIPadding),
						PaddingBottom = UDim.new(0, L_1363_arg1.Window.ElementConfig.UIPadding),
					}) or nil,
					L_1359_("UIListLayout", {
						FillDirection = "Vertical",
						Padding = UDim.new(0, L_1363_arg1.Tab.Gap),
						VerticalAlignment = "Top",
					}),
				})
			})







			local L_1370_ = L_1363_arg1.ElementsModule

			L_1370_.Load(L_1364_, L_1369_.Content, L_1370_.Elements, L_1363_arg1.Window, L_1363_arg1.WindUI, function()
				if not L_1364_.Expandable then
					L_1364_.Expandable = true
					L_1366_.Visible = true
					L_1368_func()
				end
			end, L_1370_, L_1363_arg1.UIScale, L_1363_arg1.Tab)


			L_1368_func()

			function L_1364_.SetTitle(L_1374_arg0, L_1375_arg1)
				L_1367_.Text = L_1375_arg1
			end

			function L_1364_.Destroy(L_1376_arg0)
				for L_1377_forvar0, L_1378_forvar1 in next, L_1364_.Elements do
					L_1378_forvar1:Destroy()
				end








				L_1369_:Destroy()
			end

			function L_1364_.Open(L_1379_arg0)
				if L_1364_.Expandable then
					L_1364_.Opened = true
					L_1360_(L_1369_, 0.33, {
						Size = UDim2.new(1, 0, 0, L_1364_.HeaderSize + (L_1369_.Content.AbsoluteSize.Y / L_1363_arg1.UIScale))
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

					L_1360_(L_1366_.ImageLabel, 0.1, {
						Rotation = 180
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end
			function L_1364_.Close(L_1380_arg0)
				if L_1364_.Expandable then
					L_1364_.Opened = false
					L_1360_(L_1369_, 0.26, {
						Size = UDim2.new(1, 0, 0, L_1364_.HeaderSize)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_1360_(L_1366_.ImageLabel, 0.1, {
						Rotation = 0
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end

			L_1358_.AddSignal(L_1369_.Top.MouseButton1Click, function()
				if L_1364_.Expandable then
					if L_1364_.Opened then
						L_1364_:Close()
					else
						L_1364_:Open()
					end
				end
			end)

			task.spawn(function()
				task.wait()
				if L_1364_.Expandable then








					L_1369_.Size = UDim2.new(1, 0, 0, L_1364_.HeaderSize)
					L_1369_.AutomaticSize = "None"
					L_1369_.Top.Size = UDim2.new(1, 0, 0, L_1364_.HeaderSize)
					L_1369_.Top.AutomaticSize = "None"
					L_1369_.Content.Visible = true
				end
				if L_1364_.Opened then
					L_1364_:Open()
				end

			end)

			return L_1364_.__type, L_1364_
		end

		return L_1361_
	end
	function L_1_.O() -- Line
		local L_1381_ = L_1_.load'a'
		local L_1382_ = L_1381_.New

		local L_1383_ = {}

		function L_1383_.New(L_1384_arg0, L_1385_arg1)
			local L_1386_ = L_1382_("Frame", {
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = .9,
				ThemeTag = {
					BackgroundColor3 = "Text"
				}
			})
			local L_1387_ = L_1382_("Frame", {
				Parent = L_1385_arg1.Parent,
				Size = UDim2.new(1, -7, 0, 7),
				BackgroundTransparency = 1,
			}, {
				L_1386_
			})

			return "Divider", {
				__type = "Divider",
				ElementFrame = L_1387_
			}
		end

		return L_1383_
	end
	function L_1_.P() -- Space
		local L_1388_ = L_1_.load'a'
		local L_1389_ = L_1388_.New

		local L_1390_ = {}

		function L_1390_.New(L_1391_arg0, L_1392_arg1)
			local L_1393_ = L_1389_("Frame", {
				Parent = L_1392_arg1.Parent,
				Size = UDim2.new(1, -7, 0, 7 * (L_1392_arg1.Columns or 1)),
				BackgroundTransparency = 1,
			})

			return "Space", {
				__type = "Space",
				ElementFrame = L_1393_
			}
		end

		return L_1390_
	end
	function L_1_.Q() -- Image
		local L_1394_ = L_1_.load'a'
		local L_1395_ = L_1394_.New

		local L_1396_ = {}

		local function L_1397_func(L_1398_arg0)
			if type(L_1398_arg0) == "string" then
				local L_1399_, L_1400_ = L_1398_arg0:match"(%d+):(%d+)"
				if L_1399_ and L_1400_ then
					return tonumber(L_1399_) / tonumber(L_1400_)
				end
			elseif type(L_1398_arg0) == "number" then
				return L_1398_arg0
			end
			return nil
		end

		function L_1396_.New(L_1401_arg0, L_1402_arg1)
			local L_1403_ = {
				__type = "Image",
				Image = L_1402_arg1.Image or "",
				AspectRatio = L_1402_arg1.AspectRatio or "16:9",
				Radius = L_1402_arg1.Radius or L_1402_arg1.Window.ElementConfig.UICorner,
			}
			local L_1404_ = L_1394_.Image(
				L_1403_.Image,
				L_1403_.Image,
				L_1403_.Radius,
				L_1402_arg1.Window.Folder,
				"Image",
				false
			)
			L_1404_.Parent = L_1402_arg1.Parent
			L_1404_.Size = UDim2.new(1, 0, 0, 0)
			L_1404_.BackgroundTransparency = 1












			local L_1405_ = L_1397_func(L_1402_arg1.AspectRatio)
			local L_1406_

			if L_1405_ then
				L_1406_ = L_1395_("UIAspectRatioConstraint", {
					Parent = L_1404_,
					AspectRatio = L_1405_,
					AspectType = "ScaleWithParentSize",
					DominantAxis = "Width"
				})
			end

			function L_1403_.Destroy(L_1407_arg0)
				L_1404_:Destroy()
			end

			return L_1403_.__type, L_1403_
		end

		return L_1396_
	end
	function L_1_.R() -- REQUIRED MODULE
		return {
			Elements = {
				Paragraph = L_1_.load'z',
				Button = L_1_.load'A',
				Toggle = L_1_.load'D',
				Slider = L_1_.load'E',
				Keybind = L_1_.load'F',
				Input = L_1_.load'G',
				Dropdown = L_1_.load'I',
				Code = L_1_.load'L',
				Colorpicker = L_1_.load'M',
				Section = L_1_.load'N',
				Divider = L_1_.load'O',
				Space = L_1_.load'P',
				Image = L_1_.load'Q',
			},
			Load = function(L_1408_arg0, L_1409_arg1, L_1410_arg2, L_1411_arg3, L_1412_arg4, L_1413_arg5, L_1414_arg6, L_1415_arg7, L_1416_arg8)
				for L_1417_forvar0, L_1418_forvar1 in next, L_1410_arg2 do
					L_1408_arg0[L_1417_forvar0] = function(L_1419_arg0, L_1420_arg1)
						L_1420_arg1 = L_1420_arg1 or {}
						L_1420_arg1.Tab = L_1416_arg8 or L_1408_arg0
						L_1420_arg1.ParentTable = L_1408_arg0
						L_1420_arg1.Index = #L_1408_arg0.Elements + 1
						L_1420_arg1.GlobalIndex = #L_1411_arg3.AllElements + 1
						L_1420_arg1.Parent = L_1409_arg1
						L_1420_arg1.Window = L_1411_arg3
						L_1420_arg1.WindUI = L_1412_arg4
						L_1420_arg1.UIScale = L_1415_arg7
						L_1420_arg1.ElementsModule = L_1414_arg6
						local

						L_1421_, L_1422_ = L_1418_forvar1:New(L_1420_arg1)


						local L_1423_
						for L_1424_forvar0, L_1425_forvar1 in pairs(L_1422_) do
							if typeof(L_1425_forvar1) == "table" and L_1424_forvar0:match"Frame$" then
								L_1423_ = L_1425_forvar1
								break
							end
						end

						if L_1423_ then
							L_1422_.ElementFrame = L_1423_.UIElements.Main
							function L_1422_.SetTitle(L_1426_arg0, L_1427_arg1)
								L_1423_:SetTitle(L_1427_arg1)
							end
							function L_1422_.SetDesc(L_1428_arg0, L_1429_arg1)
								L_1423_:SetDesc(L_1429_arg1)
							end
							function L_1422_.Highlight(L_1430_arg0)
								L_1423_:Highlight()
							end
							function L_1422_.Destroy(L_1431_arg0)

								table.remove(L_1411_arg3.AllElements, L_1420_arg1.GlobalIndex)
								table.remove(L_1408_arg0.Elements, L_1420_arg1.Index)
								table.remove(L_1416_arg8.Elements, L_1420_arg1.Index)
								L_1408_arg0:UpdateAllElementShapes(L_1408_arg0)

								L_1423_:Destroy()
							end
						end



						L_1411_arg3.AllElements[L_1420_arg1.Index] = L_1422_
						L_1408_arg0.Elements[L_1420_arg1.Index] = L_1422_
						if L_1416_arg8 then
							L_1416_arg8.Elements[L_1420_arg1.Index] = L_1422_
						end

						if L_1411_arg3.NewElements then
							L_1408_arg0:UpdateAllElementShapes(L_1408_arg0)
						end

						if L_1413_arg5 then
							L_1413_arg5()
						end
						return L_1422_
					end
				end
				function L_1408_arg0.UpdateAllElementShapes(L_1432_arg0, L_1433_arg1)
					for L_1434_forvar0, L_1435_forvar1 in next, L_1433_arg1.Elements do
						local L_1436_
						for L_1437_forvar0, L_1438_forvar1 in pairs(L_1435_forvar1) do
							if typeof(L_1438_forvar1) == "table" and L_1437_forvar0:match"Frame$" then
								L_1436_ = L_1438_forvar1
								break
							end
						end

						if L_1436_ then

							L_1436_.Index = L_1434_forvar0
							if L_1436_.UpdateShape then

								L_1436_.UpdateShape(L_1433_arg1)
							end
						end
					end
				end
			end,

		}
	end
	function L_1_.S() -- Tab
		game:GetService"UserInputService"
		local L_1439_ = game.Players.LocalPlayer:GetMouse()

		local L_1440_ = L_1_.load'a'
		local L_1441_ = L_1440_.New
		local L_1442_ = L_1440_.Tween

		local L_1443_ = L_1_.load'x'.New
		local L_1444_ = L_1_.load't'.New





		local L_1445_ = {


			Tabs = {},
			Containers = {},
			SelectedTab = nil,
			TabCount = 0,
			ToolTipParent = nil,
			TabHighlight = nil,

			OnChangeFunc = function(L_1446_arg0)
			end
		}

		function L_1445_.Init(L_1447_arg0, L_1448_arg1, L_1449_arg2, L_1450_arg3)
			Window = L_1447_arg0
			WindUI = L_1448_arg1
			L_1445_.ToolTipParent = L_1449_arg2
			L_1445_.TabHighlight = L_1450_arg3
			return L_1445_
		end

		function L_1445_.New(L_1451_arg0, L_1452_arg1)
			local L_1453_ = {
				__type = "Tab",
				Title = L_1451_arg0.Title or "Tab",
				Desc = L_1451_arg0.Desc,
				Icon = L_1451_arg0.Icon,
				IconThemed = L_1451_arg0.IconThemed,
				Locked = L_1451_arg0.Locked,
				ShowTabTitle = L_1451_arg0.ShowTabTitle,
				Selected = false,
				Index = nil,
				Parent = L_1451_arg0.Parent,
				UIElements = {},
				Elements = {},
				ContainerFrame = nil,
				UICorner = Window.UICorner - (Window.UIPadding / 2),

				Gap = Window.NewElements and 1 or 6,
			}

			L_1445_.TabCount = L_1445_.TabCount + 1

			local L_1454_ = L_1445_.TabCount
			L_1453_.Index = L_1454_

			L_1453_.UIElements.Main = L_1440_.NewRoundFrame(L_1453_.UICorner, "Squircle", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -7, 0, 0),
				AutomaticSize = "Y",
				Parent = L_1451_arg0.Parent,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				ImageTransparency = 1,
			}, {
				L_1440_.NewRoundFrame(L_1453_.UICorner, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = 1,
					Name = "Outline"
				}, {
					L_1441_("UIGradient", {
						Rotation = 80,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						},
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}
					}),
				}),
				L_1440_.NewRoundFrame(L_1453_.UICorner, "Squircle", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = 1,
					Name = "Frame",
				}, {
					L_1441_("UIListLayout", {
						SortOrder = "LayoutOrder",
						Padding = UDim.new(0, 10),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
					}),
					L_1441_("TextLabel", {
						Text = L_1453_.Title,
						ThemeTag = {
							TextColor3 = "Text"
						},
						TextTransparency = not L_1453_.Locked and 0.4 or .7,
						TextSize = 15,
						Size = UDim2.new(1, 0, 0, 0),
						FontFace = Font.new(L_1440_.Font, Enum.FontWeight.Medium),
						TextWrapped = true,
						RichText = true,
						AutomaticSize = "Y",
						LayoutOrder = 2,
						TextXAlignment = "Left",
						BackgroundTransparency = 1,
					}),
					L_1441_("UIPadding", {
						PaddingTop = UDim.new(0, 2 + (Window.UIPadding / 2)),
						PaddingLeft = UDim.new(0, 4 + (Window.UIPadding / 2)),
						PaddingRight = UDim.new(0, 4 + (Window.UIPadding / 2)),
						PaddingBottom = UDim.new(0, 2 + (Window.UIPadding / 2)),
					})
				}),
			}, true)

			local L_1455_ = 0
			local L_1456_
			local L_1457_

			if L_1453_.Icon then
				L_1456_ = L_1440_.Image(
					L_1453_.Icon,
					L_1453_.Icon .. ":" .. L_1453_.Title,
					0,
					Window.Folder,
					L_1453_.__type,
					true,
					L_1453_.IconThemed
				)
				L_1456_.Size = UDim2.new(0, 16, 0, 16)
				L_1456_.Parent = L_1453_.UIElements.Main.Frame
				L_1456_.ImageLabel.ImageTransparency = not L_1453_.Locked and 0 or .7
				L_1453_.UIElements.Main.Frame.TextLabel.Size = UDim2.new(1, -30, 0, 0)
				L_1455_ = -30

				L_1453_.UIElements.Icon = L_1456_


				L_1457_ = L_1440_.Image(
					L_1453_.Icon,
					L_1453_.Icon .. ":" .. L_1453_.Title,
					0,
					Window.Folder,
					L_1453_.__type,
					true,
					L_1453_.IconThemed
				)
				L_1457_.Size = UDim2.new(0, 16, 0, 16)
				L_1457_.ImageLabel.ImageTransparency = not L_1453_.Locked and 0 or .7
				L_1455_ = -30




			end

			L_1453_.UIElements.ContainerFrame = L_1441_("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, L_1453_.ShowTabTitle and -((Window.UIPadding * 2.4) + 12) or 0),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ElasticBehavior = "Never",
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				AutomaticCanvasSize = "Y",

				ScrollingDirection = "Y",
			}, {
				L_1441_("UIPadding", {
					PaddingTop = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingLeft = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingRight = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingBottom = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
				}),
				L_1441_("UIListLayout", {
					SortOrder = "LayoutOrder",
					Padding = UDim.new(0, L_1453_.Gap),
					HorizontalAlignment = "Center",
				})
			})





			L_1453_.UIElements.ContainerFrameCanvas = L_1441_("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Visible = false,
				Parent = Window.UIElements.MainBar,
				ZIndex = 5,
			}, {
				L_1453_.UIElements.ContainerFrame,
				L_1441_("Frame", {
					Size = UDim2.new(1, 0, 0, ((Window.UIPadding * 2.4) + 12)),
					BackgroundTransparency = 1,
					Visible = L_1453_.ShowTabTitle or false,
					Name = "TabTitle"
				}, {
					L_1457_,
					L_1441_("TextLabel", {
						Text = L_1453_.Title,
						ThemeTag = {
							TextColor3 = "Text"
						},
						TextSize = 20,
						TextTransparency = .1,
						Size = UDim2.new(1, -L_1455_, 1, 0),
						FontFace = Font.new(L_1440_.Font, Enum.FontWeight.SemiBold),
						TextTruncate = "AtEnd",
						RichText = true,
						LayoutOrder = 2,
						TextXAlignment = "Left",
						BackgroundTransparency = 1,
					}),
					L_1441_("UIPadding", {
						PaddingTop = UDim.new(0, 20),
						PaddingLeft = UDim.new(0, 20),
						PaddingRight = UDim.new(0, 20),
						PaddingBottom = UDim.new(0, 20),
					}),
					L_1441_("UIListLayout", {
						SortOrder = "LayoutOrder",
						Padding = UDim.new(0, 10),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
					})
				}),
				L_1441_("Frame", {
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundTransparency = .9,
					ThemeTag = {
						BackgroundColor3 = "Text"
					},
					Position = UDim2.new(0, 0, 0, ((Window.UIPadding * 2.4) + 12)),
					Visible = L_1453_.ShowTabTitle or false,
				})
			})

			L_1445_.Containers[L_1454_] = L_1453_.UIElements.ContainerFrameCanvas
			L_1445_.Tabs[L_1454_] = L_1453_

			L_1453_.ContainerFrame = ContainerFrameCanvas

			L_1440_.AddSignal(L_1453_.UIElements.Main.MouseButton1Click, function()
				if not L_1453_.Locked then
					L_1445_:SelectTab(L_1454_)
				end
			end)

			if Window.ScrollBarEnabled then
				L_1444_(L_1453_.UIElements.ContainerFrame, L_1453_.UIElements.ContainerFrameCanvas, Window, 3)
			end

			local L_1458_
			local L_1459_
			local L_1460_
			local L_1461_ = false



			if L_1453_.Desc then


				L_1440_.AddSignal(L_1453_.UIElements.Main.InputBegan, function()
					L_1461_ = true
					L_1459_ = task.spawn(function()
						task.wait(0.35)
						if L_1461_ and not L_1458_ then
							L_1458_ = L_1443_(L_1453_.Desc, L_1445_.ToolTipParent)

							local function L_1462_func()
								if L_1458_ then
									L_1458_.Container.Position = UDim2.new(0, L_1439_.X, 0, L_1439_.Y - 20)
								end
							end

							L_1462_func()
							L_1460_ = L_1439_.Move:Connect(L_1462_func)
							L_1458_:Open()
						end
					end)
				end)

			end

			L_1440_.AddSignal(L_1453_.UIElements.Main.MouseEnter, function()
				if not L_1453_.Locked then
					L_1442_(L_1453_.UIElements.Main.Frame, 0.08, {
						ImageTransparency = .97
					}):Play()
				end
			end)
			L_1440_.AddSignal(L_1453_.UIElements.Main.InputEnded, function()
				if L_1453_.Desc then
					L_1461_ = false
					if L_1459_ then
						task.cancel(L_1459_)
						L_1459_ = nil
					end
					if L_1460_ then
						L_1460_:Disconnect()
						L_1460_ = nil
					end
					if L_1458_ then
						L_1458_:Close()
						L_1458_ = nil
					end
				end

				if not L_1453_.Locked then
					L_1442_(L_1453_.UIElements.Main.Frame, 0.08, {
						ImageTransparency = 1
					}):Play()
				end
			end)



			function L_1453_.ScrollToTheElement(L_1463_arg0, L_1464_arg1)
				L_1453_.UIElements.ContainerFrame.ScrollingEnabled = false
				L_1442_(L_1453_.UIElements.ContainerFrame, .45,
					{
						CanvasPosition = Vector2.new(
							0,

							L_1453_.Elements[L_1464_arg1].ElementFrame.AbsolutePosition.Y
							- L_1453_.UIElements.ContainerFrame.AbsolutePosition.Y
							- L_1453_.UIElements.ContainerFrame.UIPadding.PaddingTop.Offset
						)
					},
					Enum.EasingStyle.Quint, Enum.EasingDirection.Out
				):Play()

				task.spawn(function()
					task.wait(.48)

					if L_1453_.Elements[L_1464_arg1].Highlight then
						L_1453_.Elements[L_1464_arg1]:Highlight()
						L_1453_.UIElements.ContainerFrame.ScrollingEnabled = true
					end
				end)

				return L_1453_
			end





			L_1453_.ElementsModule = L_1_.load'R'

			L_1453_.ElementsModule.Load(L_1453_, L_1453_.UIElements.ContainerFrame, L_1453_.ElementsModule.Elements, Window, WindUI, nil, L_1453_.ElementsModule, L_1452_arg1)



			function L_1453_.LockAll(L_1465_arg0)

				for L_1466_forvar0, L_1467_forvar1 in next, Window.AllElements do
					if L_1467_forvar1.Tab and L_1467_forvar1.Tab.Index and L_1467_forvar1.Tab.Index == L_1453_.Index and L_1467_forvar1.Lock then
						L_1467_forvar1:Lock()
					end
				end
			end
			function L_1453_.UnlockAll(L_1468_arg0)
				for L_1469_forvar0, L_1470_forvar1 in next, Window.AllElements do
					if L_1470_forvar1.Tab and L_1470_forvar1.Tab.Index and L_1470_forvar1.Tab.Index == L_1453_.Index and L_1470_forvar1.Unlock then
						L_1470_forvar1:Unlock()
					end
				end
			end
			function L_1453_.GetLocked(L_1471_arg0)
				local L_1472_ = {}

				for L_1473_forvar0, L_1474_forvar1 in next, Window.AllElements do
					if L_1474_forvar1.Tab and L_1474_forvar1.Tab.Index and L_1474_forvar1.Tab.Index == L_1453_.Index and L_1474_forvar1.Locked == true then
						table.insert(L_1472_, L_1474_forvar1)
					end
				end

				return L_1472_
			end
			function L_1453_.GetUnlocked(L_1475_arg0)
				local L_1476_ = {}

				for L_1477_forvar0, L_1478_forvar1 in next, Window.AllElements do
					if L_1478_forvar1.Tab and L_1478_forvar1.Tab.Index and L_1478_forvar1.Tab.Index == L_1453_.Index and L_1478_forvar1.Locked == false then
						table.insert(L_1476_, L_1478_forvar1)
					end
				end

				return L_1476_
			end

			function L_1453_.Select(L_1479_arg0)
				return L_1445_:SelectTab(L_1453_.Index)
			end

			task.spawn(function()
				local L_1480_ = L_1441_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, -Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
					Parent = L_1453_.UIElements.ContainerFrame
				}, {
					L_1441_("UIListLayout", {
						Padding = UDim.new(0, 8),
						SortOrder = "LayoutOrder",
						VerticalAlignment = "Center",
						HorizontalAlignment = "Center",
						FillDirection = "Vertical",
					}),
					L_1441_("ImageLabel", {
						Size = UDim2.new(0, 48, 0, 48),
						Image = L_1440_.Icon"frown"[1],
						ImageRectOffset = L_1440_.Icon"frown"[2].ImageRectPosition,
						ImageRectSize = L_1440_.Icon"frown"[2].ImageRectSize,
						ThemeTag = {
							ImageColor3 = "Icon"
						},
						BackgroundTransparency = 1,
						ImageTransparency = .6,
					}),
					L_1441_("TextLabel", {
						AutomaticSize = "XY",
						Text = "This tab is empty",
						ThemeTag = {
							TextColor3 = "Text"
						},
						TextSize = 18,
						TextTransparency = .5,
						BackgroundTransparency = 1,
						FontFace = Font.new(L_1440_.Font, Enum.FontWeight.Medium),
					})
				})





				local L_1481_
				L_1481_ = L_1440_.AddSignal(L_1453_.UIElements.ContainerFrame.ChildAdded, function()
					L_1480_.Visible = false
					L_1481_:Disconnect()
				end)
			end)

			return L_1453_
		end

		function L_1445_.OnChange(L_1482_arg0, L_1483_arg1)
			L_1445_.OnChangeFunc = L_1483_arg1
		end

		function L_1445_.SelectTab(L_1484_arg0, L_1485_arg1)
			if not L_1445_.Tabs[L_1485_arg1].Locked then
				L_1445_.SelectedTab = L_1485_arg1

				for L_1486_forvar0, L_1487_forvar1 in next, L_1445_.Tabs do
					if not L_1487_forvar1.Locked then
						L_1442_(L_1487_forvar1.UIElements.Main, 0.15, {
							ImageTransparency = 1
						}):Play()
						L_1442_(L_1487_forvar1.UIElements.Main.Outline, 0.15, {
							ImageTransparency = 1
						}):Play()
						L_1442_(L_1487_forvar1.UIElements.Main.Frame.TextLabel, 0.15, {
							TextTransparency = 0.3
						}):Play()
						if L_1487_forvar1.UIElements.Icon then
							L_1442_(L_1487_forvar1.UIElements.Icon.ImageLabel, 0.15, {
								ImageTransparency = 0.4
							}):Play()
						end
						L_1487_forvar1.Selected = false
					end
				end
				L_1442_(L_1445_.Tabs[L_1485_arg1].UIElements.Main, 0.15, {
					ImageTransparency = 0.95
				}):Play()
				L_1442_(L_1445_.Tabs[L_1485_arg1].UIElements.Main.Outline, 0.15, {
					ImageTransparency = 0.85
				}):Play()
				L_1442_(L_1445_.Tabs[L_1485_arg1].UIElements.Main.Frame.TextLabel, 0.15, {
					TextTransparency = 0
				}):Play()
				if L_1445_.Tabs[L_1485_arg1].UIElements.Icon then
					L_1442_(L_1445_.Tabs[L_1485_arg1].UIElements.Icon.ImageLabel, 0.15, {
						ImageTransparency = 0.1
					}):Play()
				end
				L_1445_.Tabs[L_1485_arg1].Selected = true


				task.spawn(function()
					for L_1488_forvar0, L_1489_forvar1 in next, L_1445_.Containers do
						L_1489_forvar1.AnchorPoint = Vector2.new(0, 0.05)
						L_1489_forvar1.Visible = false
					end
					L_1445_.Containers[L_1485_arg1].Visible = true
					L_1442_(L_1445_.Containers[L_1485_arg1], 0.15, {
						AnchorPoint = Vector2.new(0, 0)
					}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play()
				end)

				L_1445_.OnChangeFunc(L_1485_arg1)
			end
		end

		return L_1445_
	end
	function L_1_.T() -- Section TABs?
		local L_1490_ = {}


		local L_1491_ = L_1_.load'a'
		local L_1492_ = L_1491_.New
		local L_1493_ = L_1491_.Tween

		local L_1494_ = L_1_.load'S'

		function L_1490_.New(L_1495_arg0, L_1496_arg1, L_1497_arg2, L_1498_arg3, L_1499_arg4)
			local L_1500_ = {
				Title = L_1495_arg0.Title or "Section",
				Icon = L_1495_arg0.Icon,
				IconThemed = L_1495_arg0.IconThemed,
				Opened = L_1495_arg0.Opened or false,

				HeaderSize = 42,
				IconSize = 18,

				Expandable = false,
			}

			local L_1501_
			if L_1500_.Icon then
				L_1501_ = L_1491_.Image(
					L_1500_.Icon,
					L_1500_.Icon,
					0,
					L_1497_arg2,
					"Section",
					true,
					L_1500_.IconThemed
				)

				L_1501_.Size = UDim2.new(0, L_1500_.IconSize, 0, L_1500_.IconSize)
				L_1501_.ImageLabel.ImageTransparency = .25
			end

			local L_1502_ = L_1492_("Frame", {
				Size = UDim2.new(0, L_1500_.IconSize, 0, L_1500_.IconSize),
				BackgroundTransparency = 1,
				Visible = false
			}, {
				L_1492_("ImageLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = L_1491_.Icon"chevron-down"[1],
					ImageRectSize = L_1491_.Icon"chevron-down"[2].ImageRectSize,
					ImageRectOffset = L_1491_.Icon"chevron-down"[2].ImageRectPosition,
					ThemeTag = {
						ImageColor3 = "Icon",
					},
					ImageTransparency = .7,
				})
			})

			local L_1503_ = L_1492_("Frame", {
				Size = UDim2.new(1, 0, 0, L_1500_.HeaderSize),
				BackgroundTransparency = 1,
				Parent = L_1496_arg1,
				ClipsDescendants = true,
			}, {
				L_1492_("TextButton", {
					Size = UDim2.new(1, 0, 0, L_1500_.HeaderSize),
					BackgroundTransparency = 1,
					Text = "",
				}, {
					L_1501_,
					L_1492_("TextLabel", {
						Text = L_1500_.Title,
						TextXAlignment = "Left",
						Size = UDim2.new(
							1,
							L_1501_ and (-L_1500_.IconSize - 10) * 2
								or (-L_1500_.IconSize - 10),

							1,
							0
						),
						ThemeTag = {
							TextColor3 = "Text",
						},
						FontFace = Font.new(L_1491_.Font, Enum.FontWeight.SemiBold),
						TextSize = 14,
						BackgroundTransparency = 1,
						TextTransparency = .7,

						TextWrapped = true
					}),
					L_1492_("UIListLayout", {
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
						Padding = UDim.new(0, 10)
					}),
					L_1502_,
					L_1492_("UIPadding", {
						PaddingLeft = UDim.new(0, 11),
						PaddingRight = UDim.new(0, 11),
					})
				}),
				L_1492_("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					Name = "Content",
					Visible = true,
					Position = UDim2.new(0, 0, 0, L_1500_.HeaderSize)
				}, {
					L_1492_("UIListLayout", {
						FillDirection = "Vertical",
						Padding = UDim.new(0, L_1499_arg4.Gap),
						VerticalAlignment = "Bottom",
					}),
				})
			})


			function L_1500_.Tab(L_1504_arg0, L_1505_arg1)
				if not L_1500_.Expandable then
					L_1500_.Expandable = true
					L_1502_.Visible = true
				end
				L_1505_arg1.Parent = L_1503_.Content
				return L_1494_.New(L_1505_arg1, L_1498_arg3)
			end

			function L_1500_.Open(L_1506_arg0)
				if L_1500_.Expandable then
					L_1500_.Opened = true
					L_1493_(L_1503_, 0.33, {
						Size = UDim2.new(1, 0, 0, L_1500_.HeaderSize + (L_1503_.Content.AbsoluteSize.Y / L_1498_arg3))
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

					L_1493_(L_1502_.ImageLabel, 0.1, {
						Rotation = 180
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end
			function L_1500_.Close(L_1507_arg0)
				if L_1500_.Expandable then
					L_1500_.Opened = false
					L_1493_(L_1503_, 0.26, {
						Size = UDim2.new(1, 0, 0, L_1500_.HeaderSize)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_1493_(L_1502_.ImageLabel, 0.1, {
						Rotation = 0
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end

			L_1491_.AddSignal(L_1503_.TextButton.MouseButton1Click, function()
				if L_1500_.Expandable then
					if L_1500_.Opened then
						L_1500_:Close()
					else
						L_1500_:Open()
					end
				end
			end)

			if L_1500_.Opened then
				task.spawn(function()
					task.wait()
					L_1500_:Open()
				end)
			end



			return L_1500_
		end


		return L_1490_
	end
	function L_1_.U() -- ?
		return {
			Tab = "table-of-contents",
			Paragraph = "type",
			Button = "square-mouse-pointer",
			Toggle = "toggle-right",
			Slider = "sliders-horizontal",
			Keybind = "command",
			Input = "text-cursor-input",
			Dropdown = "chevrons-up-down",
			Code = "terminal",
			Colorpicker = "palette",
		}
	end
	function L_1_.V() -- Textflield?
		game:GetService"UserInputService"

		local L_1508_ = {
			Margin = 8,
			Padding = 9,
		}


		local L_1509_ = L_1_.load'a'
		local L_1510_ = L_1509_.New
		local L_1511_ = L_1509_.Tween


		function L_1508_.new(L_1512_arg0, L_1513_arg1, L_1514_arg2)
			local L_1515_ = {
				IconSize = 18,
				Padding = 14,
				Radius = 22,
				Width = 400,
				MaxHeight = 380,

				Icons = L_1_.load'U'
			}


			local L_1516_ = L_1510_("TextBox", {
				Text = "",
				PlaceholderText = "Search...",
				ThemeTag = {
					PlaceholderColor3 = "Placeholder",
					TextColor3 = "Text",
				},
				Size = UDim2.new(
					1,
					-((L_1515_.IconSize * 2) + (L_1515_.Padding * 2)),
					0,
					0
				),
				AutomaticSize = "Y",
				ClipsDescendants = true,
				ClearTextOnFocus = false,
				BackgroundTransparency = 1,
				TextXAlignment = "Left",
				FontFace = Font.new(L_1509_.Font, Enum.FontWeight.Regular),
				TextSize = 18,
			})

			local L_1517_ = L_1510_("ImageLabel", {
				Image = L_1509_.Icon"x"[1],
				ImageRectSize = L_1509_.Icon"x"[2].ImageRectSize,
				ImageRectOffset = L_1509_.Icon"x"[2].ImageRectPosition,
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = "Icon",
				},
				ImageTransparency = .1,
				Size = UDim2.new(0, L_1515_.IconSize, 0, L_1515_.IconSize)
			}, {
				L_1510_("TextButton", {
					Size = UDim2.new(1, 8, 1, 8),
					BackgroundTransparency = 1,
					Active = true,
					ZIndex = 999999999,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Text = "",
				})
			})

			local L_1518_ = L_1510_("ScrollingFrame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticCanvasSize = "Y",
				ScrollingDirection = "Y",
				ElasticBehavior = "Never",
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				Visible = false
			}, {
				L_1510_("UIListLayout", {
					Padding = UDim.new(0, 0),
					FillDirection = "Vertical",
				}),
				L_1510_("UIPadding", {
					PaddingTop = UDim.new(0, L_1515_.Padding),
					PaddingLeft = UDim.new(0, L_1515_.Padding),
					PaddingRight = UDim.new(0, L_1515_.Padding),
					PaddingBottom = UDim.new(0, L_1515_.Padding),
				})
			})

			local L_1519_ = L_1509_.NewRoundFrame(L_1515_.Radius, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ThemeTag = {
					ImageColor3 = "Background",
				},
				ImageTransparency = 0,
			}, {
				L_1509_.NewRoundFrame(L_1515_.Radius, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,

					Visible = false,
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = .98,
					Name = "Frame",
				}, {
					L_1510_("Frame", {
						Size = UDim2.new(1, 0, 0, 46),
						BackgroundTransparency = 1,
					}, {








						L_1510_("Frame", {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
						}, {
							L_1510_("ImageLabel", {
								Image = L_1509_.Icon"search"[1],
								ImageRectSize = L_1509_.Icon"search"[2].ImageRectSize,
								ImageRectOffset = L_1509_.Icon"search"[2].ImageRectPosition,
								BackgroundTransparency = 1,
								ThemeTag = {
									ImageColor3 = "Icon",
								},
								ImageTransparency = .1,
								Size = UDim2.new(0, L_1515_.IconSize, 0, L_1515_.IconSize)
							}),
							L_1516_,
							L_1517_,
							L_1510_("UIListLayout", {
								Padding = UDim.new(0, L_1515_.Padding),
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
							}),
							L_1510_("UIPadding", {
								PaddingLeft = UDim.new(0, L_1515_.Padding),
								PaddingRight = UDim.new(0, L_1515_.Padding),
							})
						})
					}),
					L_1510_("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = "Y",
						Size = UDim2.new(1, 0, 0, 0),
						Name = "Results",
					}, {
						L_1510_("Frame", {
							Size = UDim2.new(1, 0, 0, 1),
							ThemeTag = {
								BackgroundColor3 = "Outline",
							},
							BackgroundTransparency = .9,
							Visible = false,
						}),
						L_1518_,
						L_1510_("UISizeConstraint", {
							MaxSize = Vector2.new(L_1515_.Width, L_1515_.MaxHeight),
						}),
					}),
					L_1510_("UIListLayout", {
						Padding = UDim.new(0, 0),
						FillDirection = "Vertical",
					}),
				})
			})

			local L_1520_ = L_1510_("Frame", {
				Size = UDim2.new(0, L_1515_.Width, 0, 0),
				AutomaticSize = "Y",
				Parent = L_1513_arg1,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Visible = false,

				ZIndex = 99999999,
			}, {
				L_1510_("UIScale", {
					Scale = .9,
				}),
				L_1519_,
				L_1509_.NewRoundFrame(L_1515_.Radius, "SquircleOutline2", {
					Size = UDim2.new(1, 0, 1, 0),
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					ImageTransparency = 1,
				}, {
					L_1510_("UIGradient", {
						Rotation = 45,
						Transparency = NumberSequence.new{
							NumberSequenceKeypoint.new(0, 0.55),
							NumberSequenceKeypoint.new(0.5, 0.8),
							NumberSequenceKeypoint.new(1, 0.6)
						}
					})
				})
			})

			local function L_1521_func(L_1524_arg0, L_1525_arg1, L_1526_arg2, L_1527_arg3, L_1528_arg4, L_1529_arg5)
				local L_1530_ = L_1510_("TextButton", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					BackgroundTransparency = 1,
					Parent = L_1527_arg3 or nil
				}, {
					L_1509_.NewRoundFrame(L_1515_.Radius - 11, "Squircle", {
						Size = UDim2.new(1, 0, 0, 0),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),

						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "Main"
					}, {
						L_1509_.NewRoundFrame(L_1515_.Radius - 11, "SquircleOutline2", {
							Size = UDim2.new(1, 0, 1, 0),
							Position = UDim2.new(0.5, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0.5, 0.5),
							ThemeTag = {
								ImageColor3 = "Outline",
							},
							ImageTransparency = 1,
							Name = "Outline",
						}, {
							L_1510_("UIGradient", {
								Rotation = 65,
								Transparency = NumberSequence.new{
									NumberSequenceKeypoint.new(0, 0.55),
									NumberSequenceKeypoint.new(0.5, 0.8),
									NumberSequenceKeypoint.new(1, 0.6)
								}
							}),
							L_1510_("UIPadding", {
								PaddingTop = UDim.new(0, L_1515_.Padding - 2),
								PaddingLeft = UDim.new(0, L_1515_.Padding),
								PaddingRight = UDim.new(0, L_1515_.Padding),
								PaddingBottom = UDim.new(0, L_1515_.Padding - 2),
							}),
							L_1510_("ImageLabel", {
								Image = L_1509_.Icon(L_1526_arg2)[1],
								ImageRectSize = L_1509_.Icon(L_1526_arg2)[2].ImageRectSize,
								ImageRectOffset = L_1509_.Icon(L_1526_arg2)[2].ImageRectPosition,
								BackgroundTransparency = 1,
								ThemeTag = {
									ImageColor3 = "Icon",
								},
								ImageTransparency = .1,
								Size = UDim2.new(0, L_1515_.IconSize, 0, L_1515_.IconSize)
							}),
							L_1510_("Frame", {
								Size = UDim2.new(1, -L_1515_.IconSize - L_1515_.Padding, 0, 0),
								BackgroundTransparency = 1,
							}, {
								L_1510_("TextLabel", {
									Text = L_1524_arg0,
									ThemeTag = {
										TextColor3 = "Text",
									},
									TextSize = 17,
									BackgroundTransparency = 1,
									TextXAlignment = "Left",
									FontFace = Font.new(L_1509_.Font, Enum.FontWeight.Medium),
									Size = UDim2.new(1, 0, 0, 0),
									TextTruncate = "AtEnd",
									AutomaticSize = "Y",
									Name = "Title"
								}),
								L_1510_("TextLabel", {
									Text = L_1525_arg1 or "",
									Visible = L_1525_arg1 and true or false,
									ThemeTag = {
										TextColor3 = "Text",
									},
									TextSize = 15,
									TextTransparency = .3,
									BackgroundTransparency = 1,
									TextXAlignment = "Left",
									FontFace = Font.new(L_1509_.Font, Enum.FontWeight.Medium),
									Size = UDim2.new(1, 0, 0, 0),
									TextTruncate = "AtEnd",
									AutomaticSize = "Y",
									Name = "Desc"
								}) or nil,
								L_1510_("UIListLayout", {
									Padding = UDim.new(0, 6),
									FillDirection = "Vertical",
								})
							}),
							L_1510_("UIListLayout", {
								Padding = UDim.new(0, L_1515_.Padding),
								FillDirection = "Horizontal",
							})
						}),
					}, true),
					L_1510_("Frame", {
						Name = "ParentContainer",
						Size = UDim2.new(1, -L_1515_.Padding, 0, 0),
						AutomaticSize = "Y",
						BackgroundTransparency = 1,
						Visible = L_1528_arg4,

					}, {
						L_1509_.NewRoundFrame(99, "Squircle", {
							Size = UDim2.new(0, 2, 1, 0),
							BackgroundTransparency = 1,
							ThemeTag = {
								ImageColor3 = "Text"
							},
							ImageTransparency = .9,
						}),
						L_1510_("Frame", {
							Size = UDim2.new(1, -L_1515_.Padding - 2, 0, 0),
							Position = UDim2.new(0, L_1515_.Padding + 2, 0, 0),
							BackgroundTransparency = 1,
						}, {
							L_1510_("UIListLayout", {
								Padding = UDim.new(0, 0),
								FillDirection = "Vertical",
							}),
						}),
					}),
					L_1510_("UIListLayout", {
						Padding = UDim.new(0, 0),
						FillDirection = "Vertical",
						HorizontalAlignment = "Right"
					})
				})



				L_1530_.Main.Size = UDim2.new(
					1,
					0,
					0,
					L_1530_.Main.Outline.Frame.Desc.Visible and (((L_1515_.Padding - 2) * 2) + L_1530_.Main.Outline.Frame.Title.TextBounds.Y + 6 + L_1530_.Main.Outline.Frame.Desc.TextBounds.Y)
						or (((L_1515_.Padding - 2) * 2) + L_1530_.Main.Outline.Frame.Title.TextBounds.Y)
				)

				L_1509_.AddSignal(L_1530_.Main.MouseEnter, function()
					L_1511_(L_1530_.Main, .04, {
						ImageTransparency = .95
					}):Play()
					L_1511_(L_1530_.Main.Outline, .04, {
						ImageTransparency = .7
					}):Play()
				end)
				L_1509_.AddSignal(L_1530_.Main.InputEnded, function()
					L_1511_(L_1530_.Main, .08, {
						ImageTransparency = 1
					}):Play()
					L_1511_(L_1530_.Main.Outline, .08, {
						ImageTransparency = 1
					}):Play()
				end)
				L_1509_.AddSignal(L_1530_.Main.MouseButton1Click, function()
					if L_1529_arg5 then
						L_1529_arg5()
					end
				end)

				return L_1530_
			end

			local function L_1522_func(L_1531_arg0, L_1532_arg1)
				if not L_1532_arg1 or L_1532_arg1 == "" then
					return false
				end

				if not L_1531_arg0 or L_1531_arg0 == "" then
					return false
				end

				local L_1533_ = string.lower(L_1531_arg0)
				local L_1534_ = string.lower(L_1532_arg1)

				return string.find(L_1533_, L_1534_, 1, true) ~= nil
			end

			local function L_1523_func(L_1535_arg0)
				if not L_1535_arg0 or L_1535_arg0 == "" then
					return {}
				end

				local L_1536_ = {}
				for L_1537_forvar0, L_1538_forvar1 in next, L_1512_arg0.Tabs do
					local L_1539_ = L_1522_func(L_1538_forvar1.Title or "", L_1535_arg0)
					local L_1540_ = {}

					for L_1541_forvar0, L_1542_forvar1 in next, L_1538_forvar1.Elements do
						if L_1542_forvar1.__type ~= "Section" then
							local L_1543_ = L_1522_func(L_1542_forvar1.Title or "", L_1535_arg0)
							local L_1544_ = L_1522_func(L_1542_forvar1.Desc or "", L_1535_arg0)

							if L_1543_ or L_1544_ then
								L_1540_[L_1541_forvar0] = {
									Title = L_1542_forvar1.Title,
									Desc = L_1542_forvar1.Desc,
									Original = L_1542_forvar1,
									__type = L_1542_forvar1.__type,
									Index = L_1541_forvar0,
								}
							end
						end
					end

					if L_1539_ or next(L_1540_) ~= nil then
						L_1536_[L_1537_forvar0] = {
							Tab = L_1538_forvar1,
							Title = L_1538_forvar1.Title,
							Icon = L_1538_forvar1.Icon,
							Elements = L_1540_,
						}
					end
				end
				return L_1536_
			end

			function L_1515_.Search(L_1545_arg0, L_1546_arg1)
				L_1546_arg1 = L_1546_arg1 or ""

				local L_1547_ = L_1523_func(L_1546_arg1)

				L_1518_.Visible = true
				L_1519_.Frame.Results.Frame.Visible = true
				for L_1548_forvar0, L_1549_forvar1 in next, L_1518_:GetChildren() do
					if L_1549_forvar1.ClassName ~= "UIListLayout" and L_1549_forvar1.ClassName ~= "UIPadding" then
						L_1549_forvar1:Destroy()
					end
				end

				if L_1547_ and next(L_1547_) ~= nil then
					for L_1550_forvar0, L_1551_forvar1 in next, L_1547_ do
						local L_1552_ = L_1515_.Icons.Tab
						local L_1553_ = L_1521_func(L_1551_forvar1.Title, nil, L_1552_, L_1518_, true, function()
							L_1515_:Close()
							L_1512_arg0:SelectTab(L_1550_forvar0)
						end)
						if L_1551_forvar1.Elements and next(L_1551_forvar1.Elements) ~= nil then
							for L_1554_forvar0, L_1555_forvar1 in next, L_1551_forvar1.Elements do
								local L_1556_ = L_1515_.Icons[L_1555_forvar1.__type]
								L_1521_func(L_1555_forvar1.Title, L_1555_forvar1.Desc, L_1556_, L_1553_:FindFirstChild"ParentContainer" and L_1553_.ParentContainer.Frame or nil, false, function()
									L_1515_:Close()
									L_1512_arg0:SelectTab(L_1550_forvar0)
									if L_1551_forvar1.Tab.ScrollToTheElement then

										L_1551_forvar1.Tab:ScrollToTheElement(L_1555_forvar1.Index)
									end

								end)

							end
						end
					end
				elseif L_1546_arg1 ~= "" then
					L_1510_("TextLabel", {
						Size = UDim2.new(1, 0, 0, 70),
						BackgroundTransparency = 1,
						Text = "No results found",
						TextSize = 16,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextTransparency = .2,
						BackgroundTransparency = 1,
						FontFace = Font.new(L_1509_.Font, Enum.FontWeight.Medium),
						Parent = L_1518_,
						Name = "NotFound",
					})
				else
					L_1518_.Visible = false
					L_1519_.Frame.Results.Frame.Visible = false
				end
			end

			L_1509_.AddSignal(L_1516_:GetPropertyChangedSignal"Text", function()
				L_1515_:Search(L_1516_.Text)
			end)

			L_1509_.AddSignal(L_1518_.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize", function()

				L_1511_(L_1518_, .06, {
					Size = UDim2.new(
						1,
						0,
						0,
						math.clamp(L_1518_.UIListLayout.AbsoluteContentSize.Y + (L_1515_.Padding * 2), 0, L_1515_.MaxHeight)
					)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()






			end)

			function L_1515_.Open(L_1557_arg0)
				task.spawn(function()
					L_1519_.Frame.Visible = true
					L_1520_.Visible = true
					L_1511_(L_1520_.UIScale, .12, {
						Scale = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end)
			end

			function L_1515_.Close(L_1558_arg0)
				task.spawn(function()
					L_1514_arg2()
					L_1519_.Frame.Visible = false
					L_1511_(L_1520_.UIScale, .12, {
						Scale = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

					task.wait(.12)
					L_1520_.Visible = false
				end)
			end

			L_1509_.AddSignal(L_1517_.TextButton.MouseButton1Click, function()
				L_1515_:Close()
			end)

			L_1515_:Open()

			return L_1515_
		end

		return L_1508_
	end
	function L_1_.W() -- Init Window

		local L_1559_ = game:GetService"UserInputService"
		game:GetService"RunService"

		local L_1560_ = workspace.CurrentCamera



		local L_1561_ = L_1_.load'a'
		local L_1562_ = L_1561_.New
		local L_1563_ = L_1561_.Tween


		local L_1564_ = L_1_.load's'.New
		local L_1565_ = L_1_.load'i'.New
		local L_1566_ = L_1_.load't'.New
		local L_1567_ = L_1_.load'u'

		local L_1568_ = L_1_.load'v'



		return function(L_1569_arg0)
			local L_1570_ = {
				Title = L_1569_arg0.Title or "UI Library",
				Author = L_1569_arg0.Author,
				Icon = L_1569_arg0.Icon,
				IconThemed = L_1569_arg0.IconThemed,
				Folder = L_1569_arg0.Folder,
				Resizable = L_1569_arg0.Resizable,
				Background = L_1569_arg0.Background,
				BackgroundImageTransparency = L_1569_arg0.BackgroundImageTransparency or 0,
				User = L_1569_arg0.User or {},

				Size = L_1569_arg0.Size,

				MinSize = L_1569_arg0.MinSize or Vector2.new(560, 350),
				MaxSize = L_1569_arg0.MaxSize or Vector2.new(850, 560),

				ToggleKey = L_1569_arg0.ToggleKey,
				Transparent = L_1569_arg0.Transparent or false,
				HideSearchBar = L_1569_arg0.HideSearchBar,
				ScrollBarEnabled = L_1569_arg0.ScrollBarEnabled or false,
				SideBarWidth = L_1569_arg0.SideBarWidth or 200,

				NewElements = L_1569_arg0.NewElements or false,
				HidePanelBackground = L_1569_arg0.HidePanelBackground or false,
				AutoScale = L_1569_arg0.AutoScale,
				OpenButton = L_1569_arg0.OpenButton,

				Position = UDim2.new(0.5, 0, 0.5, 0),
				IconSize = L_1569_arg0.IconSize or 22,
				UICorner = 16,
				UIPadding = 14,
				UIElements = {},
				CanDropdown = true,
				Closed = false,
				Parent = L_1569_arg0.Parent,
				Destroyed = false,
				IsFullscreen = false,
				CanResize = false,
				IsOpenButtonEnabled = true,

				ConfigManager = nil,

				CurrentTab = nil,
				TabModule = nil,

				OnOpenCallback = nil,
				OnCloseCallback = nil,
				OnDestroyCallback = nil,

				IsPC = false,

				Gap = 5,

				TopBarButtons = {},
				AllElements = {},

				ElementConfig = {}
			}


			L_1570_.ElementConfig = {
				UIPadding = L_1570_.NewElements and 10 or 13,
				UICorner = L_1570_.NewElements and 23 or 12,
			}

			local L_1571_ = L_1570_.Size or UDim2.new(0, 580, 0, 460)
			L_1570_.Size = UDim2.new(
				L_1571_.X.Scale,
				math.clamp(L_1571_.X.Offset, L_1570_.MinSize.X, L_1570_.MaxSize.X),
				L_1571_.Y.Scale,
				math.clamp(L_1571_.Y.Offset, L_1570_.MinSize.Y, L_1570_.MaxSize.Y)
			)

			if L_1570_.HideSearchBar ~= false then
				L_1570_.HideSearchBar = true
			end
			if L_1570_.AutoScale ~= false then
				L_1570_.AutoScale = true
			end
			if L_1570_.Resizable ~= false then
				L_1570_.CanResize = true
				L_1570_.Resizable = true
			end

			if L_1570_.Folder then
				makefolder("WindUI/" .. L_1570_.Folder)
			end

			local L_1572_ = L_1562_("UICorner", {
				CornerRadius = UDim.new(0, L_1570_.UICorner)
			})

			if L_1570_.Folder then
				L_1570_.ConfigManager = L_1568_:Init(L_1570_)
			end







			local L_1573_ = L_1562_("Frame", {
				Size = UDim2.new(0, 32, 0, 32),
				Position = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(.5, .5),
				BackgroundTransparency = 1,
				ZIndex = 99,
				Active = true
			}, {
				L_1562_("ImageLabel", {
					Size = UDim2.new(0, 96, 0, 96),
					BackgroundTransparency = 1,
					Image = "rbxassetid://120997033468887",
					Position = UDim2.new(0.5, -16, 0.5, -16),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = 1,
				})
			})
			local L_1574_ = L_1561_.NewRoundFrame(L_1570_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				ImageColor3 = Color3.new(0, 0, 0),
				ZIndex = 98,
				Active = false,
			}, {
				L_1562_("ImageLabel", {
					Size = UDim2.new(0, 70, 0, 70),
					Image = L_1561_.Icon"expand"[1],
					ImageRectOffset = L_1561_.Icon"expand"[2].ImageRectPosition,
					ImageRectSize = L_1561_.Icon"expand"[2].ImageRectSize,
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = 1,
				}),
			})

			local L_1575_ = L_1561_.NewRoundFrame(L_1570_.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				ImageColor3 = Color3.new(0, 0, 0),
				ZIndex = 999,
				Active = false,
			})










			L_1570_.UIElements.SideBar = L_1562_("ScrollingFrame", {
				Size = UDim2.new(
					1,
					L_1570_.ScrollBarEnabled and -3 - (L_1570_.UIPadding / 2) or 0,
					1,
					not L_1570_.HideSearchBar and -45 or 0
				),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ElasticBehavior = "Never",
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = "Y",
				ScrollingDirection = "Y",
				ClipsDescendants = true,
				VerticalScrollBarPosition = "Left",
			}, {
				L_1562_("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = "Y",
					Size = UDim2.new(1, 0, 0, 0),
					Name = "Frame",
				}, {
					L_1562_("UIPadding", {
						PaddingTop = UDim.new(0, L_1570_.UIPadding / 2),


						PaddingBottom = UDim.new(0, L_1570_.UIPadding / 2),
					}),
					L_1562_("UIListLayout", {
						SortOrder = "LayoutOrder",
						Padding = UDim.new(0, L_1570_.Gap)
					})
				}),
				L_1562_("UIPadding", {

					PaddingLeft = UDim.new(0, L_1570_.UIPadding / 2),
					PaddingRight = UDim.new(0, L_1570_.UIPadding / 2),

				}),

			})

			L_1570_.UIElements.SideBarContainer = L_1562_("Frame", {
				Size = UDim2.new(0, L_1570_.SideBarWidth, 1, L_1570_.User.Enabled and -94 - (L_1570_.UIPadding * 2) or -52),
				Position = UDim2.new(0, 0, 0, 52),
				BackgroundTransparency = 1,
				Visible = true,
			}, {
				L_1562_("Frame", {
					Name = "Content",
					BackgroundTransparency = 1,
					Size = UDim2.new(
						1,
						0,
						1,
						not L_1570_.HideSearchBar and -45 - L_1570_.UIPadding / 2 or 0
					),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
				}),
				L_1570_.UIElements.SideBar,
			})

			if L_1570_.ScrollBarEnabled then
				L_1566_(L_1570_.UIElements.SideBar, L_1570_.UIElements.SideBarContainer.Content, L_1570_, 3)
			end


			L_1570_.UIElements.MainBar = L_1562_("Frame", {
				Size = UDim2.new(1, -L_1570_.UIElements.SideBarContainer.AbsoluteSize.X, 1, -52),
				Position = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 1),
				BackgroundTransparency = 1,
			}, {
				L_1561_.NewRoundFrame(L_1570_.UICorner - (L_1570_.UIPadding / 2), "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					ImageColor3 = Color3.new(1, 1, 1),
					ZIndex = 3,
					ImageTransparency = .95,
					Name = "Background",
					Visible = not L_1570_.HidePanelBackground
				}),
				L_1562_("UIPadding", {
					PaddingTop = UDim.new(0, L_1570_.UIPadding / 2),
					PaddingLeft = UDim.new(0, L_1570_.UIPadding / 2),
					PaddingRight = UDim.new(0, L_1570_.UIPadding / 2),
					PaddingBottom = UDim.new(0, L_1570_.UIPadding / 2),
				})
			})

			local L_1576_ = L_1562_("ImageLabel", {
				Image = "rbxassetid://8992230677",
				ImageColor3 = Color3.new(0, 0, 0),
				ImageTransparency = 1,
				Size = UDim2.new(1, 120, 1, 116),
				Position = UDim2.new(0, -60, 0, -58),
				ScaleType = "Slice",
				SliceCenter = Rect.new(99, 99, 99, 99),
				BackgroundTransparency = 1,
				ZIndex = -999999999999999,
				Name = "Blur",
			})


			if L_1559_.TouchEnabled and not L_1559_.KeyboardEnabled then
				L_1570_.IsPC = false
			elseif L_1559_.KeyboardEnabled then
				L_1570_.IsPC = true
			else
				L_1570_.IsPC = nil
			end










			local L_1577_
			if L_1570_.User then
				local function L_1601_func()
					local
					L_1602_, L_1603_ = game:GetService"Players":GetUserThumbnailAsync(
						L_1570_.User.Anonymous and 1 or game.Players.LocalPlayer.UserId,
						Enum.ThumbnailType.HeadShot,
						Enum.ThumbnailSize.Size420x420
					)
					return L_1602_
				end


				L_1577_ = L_1562_("TextButton", {
					Size = UDim2.new(0,
						(L_1570_.UIElements.SideBarContainer.AbsoluteSize.X) - (L_1570_.UIPadding / 2),
						0,
						42 + (L_1570_.UIPadding)
					),
					Position = UDim2.new(0, L_1570_.UIPadding / 2, 1, -(L_1570_.UIPadding / 2)),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = 1,
					Visible = L_1570_.User.Enabled or false,
				}, {
					L_1561_.NewRoundFrame(L_1570_.UICorner - (L_1570_.UIPadding / 2), "SquircleOutline", {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "Outline"
					}, {
						L_1562_("UIGradient", {
							Rotation = 78,
							Color = ColorSequence.new{
								ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
							},
							Transparency = NumberSequence.new{
								NumberSequenceKeypoint.new(0.0, 0.1),
								NumberSequenceKeypoint.new(0.5, 1),
								NumberSequenceKeypoint.new(1.0, 0.1),
							}
						}),
					}),
					L_1561_.NewRoundFrame(L_1570_.UICorner - (L_1570_.UIPadding / 2), "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "UserIcon",
					}, {
						L_1562_("ImageLabel", {
							Image = L_1601_func(),
							BackgroundTransparency = 1,
							Size = UDim2.new(0, 42, 0, 42),
							ThemeTag = {
								BackgroundColor3 = "Text",
							},
							BackgroundTransparency = .93,
						}, {
							L_1562_("UICorner", {
								CornerRadius = UDim.new(1, 0)
							})
						}),
						L_1562_("Frame", {
							AutomaticSize = "XY",
							BackgroundTransparency = 1,
						}, {
							L_1562_("TextLabel", {
								Text = L_1570_.User.Anonymous and "Anonymous" or game.Players.LocalPlayer.DisplayName,
								TextSize = 17,
								ThemeTag = {
									TextColor3 = "Text",
								},
								FontFace = Font.new(L_1561_.Font, Enum.FontWeight.SemiBold),
								AutomaticSize = "Y",
								BackgroundTransparency = 1,
								Size = UDim2.new(1, -27, 0, 0),
								TextTruncate = "AtEnd",
								TextXAlignment = "Left",
								Name = "DisplayName"
							}),
							L_1562_("TextLabel", {
								Text = L_1570_.User.Anonymous and "anonymous" or game.Players.LocalPlayer.Name,
								TextSize = 15,
								TextTransparency = .6,
								ThemeTag = {
									TextColor3 = "Text",
								},
								FontFace = Font.new(L_1561_.Font, Enum.FontWeight.Medium),
								AutomaticSize = "Y",
								BackgroundTransparency = 1,
								Size = UDim2.new(1, -27, 0, 0),
								TextTruncate = "AtEnd",
								TextXAlignment = "Left",
								Name = "UserName"
							}),
							L_1562_("UIListLayout", {
								Padding = UDim.new(0, 4),
								HorizontalAlignment = "Left",
							})
						}),
						L_1562_("UIListLayout", {
							Padding = UDim.new(0, L_1570_.UIPadding),
							FillDirection = "Horizontal",
							VerticalAlignment = "Center",
						}),
						L_1562_("UIPadding", {
							PaddingLeft = UDim.new(0, L_1570_.UIPadding / 2),
							PaddingRight = UDim.new(0, L_1570_.UIPadding / 2),
						})
					})
				})


				function L_1570_.User.Enable(L_1604_arg0)
					L_1570_.User.Enabled = true
					L_1563_(L_1570_.UIElements.SideBarContainer, .25, {
						Size = UDim2.new(0, L_1570_.SideBarWidth, 1, -94 - (L_1570_.UIPadding * 2))
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_1577_.Visible = true
				end
				function L_1570_.User.Disable(L_1605_arg0)
					L_1570_.User.Enabled = false
					L_1563_(L_1570_.UIElements.SideBarContainer, .25, {
						Size = UDim2.new(0, L_1570_.SideBarWidth, 1, -52)
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					L_1577_.Visible = false
				end
				function L_1570_.User.SetAnonymous(L_1606_arg0, L_1607_arg1)
					if L_1607_arg1 ~= false then
						L_1607_arg1 = true
					end
					L_1570_.User.Anonymous = L_1607_arg1
					L_1577_.UserIcon.ImageLabel.Image = L_1601_func()
					L_1577_.UserIcon.Frame.DisplayName.Text = L_1607_arg1 and "Anonymous" or game.Players.LocalPlayer.DisplayName
					L_1577_.UserIcon.Frame.UserName.Text = L_1607_arg1 and "anonymous" or game.Players.LocalPlayer.Name
				end

				if L_1570_.User.Enabled then
					L_1570_.User:Enable()
				else
					L_1570_.User:Disable()
				end

				if L_1570_.User.Callback then
					L_1561_.AddSignal(L_1577_.MouseButton1Click, function()
						L_1570_.User.Callback()
					end)
					L_1561_.AddSignal(L_1577_.MouseEnter, function()
						L_1563_(L_1577_.UserIcon, 0.04, {
							ImageTransparency = .95
						}):Play()
						L_1563_(L_1577_.Outline, 0.04, {
							ImageTransparency = .85
						}):Play()
					end)
					L_1561_.AddSignal(L_1577_.InputEnded, function()
						L_1563_(L_1577_.UserIcon, 0.04, {
							ImageTransparency = 1
						}):Play()
						L_1563_(L_1577_.Outline, 0.04, {
							ImageTransparency = 1
						}):Play()
					end)
				end
			end

			local L_1578_
			local L_1579_


			local L_1580_ = false
			local L_1581_

			local L_1582_ = typeof(L_1570_.Background) == "string" and string.match(L_1570_.Background, "^video:(.+)") or nil
			local L_1583_ = typeof(L_1570_.Background) == "string" and not L_1582_ and string.match(L_1570_.Background, "^https?://.+") or nil

			local function L_1584_func(L_1608_arg0)
				L_1608_arg0 = L_1608_arg0:gsub("[%s/\\:*?\"<>|]+", "-")
				L_1608_arg0 = L_1608_arg0:gsub("[^%w%-_%.]", "")
				return L_1608_arg0
			end

			if typeof(L_1570_.Background) == "string" and L_1582_ then
				L_1580_ = true

				if string.find(L_1582_, "http") then
					local L_1609_ = L_1570_.Folder .. "/Assets/." .. L_1584_func(L_1582_) .. ".webm"
					if not isfile(L_1609_) then
						local L_1612_, L_1613_ = pcall(function()
							local L_1614_ = L_1561_.Request{
								Url = L_1582_,
								Method = "GET"
							}
							writefile(L_1609_, L_1614_.Body)
						end)
						if not L_1612_ then
							warn("[ Window.Background ] Failed to download video: " .. tostring(L_1613_))
							return
						end
					end

					local L_1610_, L_1611_ = pcall(function()
						return getcustomasset(L_1609_)
					end)
					if not L_1610_ then
						warn("[ Window.Background ] Failed to load custom asset: " .. tostring(L_1611_))
						return
					end
					L_1582_ = L_1611_
				end

				L_1581_ = L_1562_("VideoFrame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Video = L_1582_,
					Looped = true,
					Volume = 0,
				}, {
					L_1562_("UICorner", {
						CornerRadius = UDim.new(0, L_1570_.UICorner)
					}),
				})
				L_1581_:Play()

			elseif L_1583_ then
				local L_1615_ = L_1570_.Folder .. "/Assets/." .. L_1584_func(L_1583_) .. ".png"
				if not isfile(L_1615_) then
					local L_1618_, L_1619_ = pcall(function()
						local L_1620_ = L_1561_.Request{
							Url = L_1583_,
							Method = "GET"
						}
						writefile(L_1615_, L_1620_.Body)
					end)
					if not L_1618_ then
						warn("[ Window.Background ] Failed to download image: " .. tostring(L_1619_))
						return
					end
				end

				local L_1616_, L_1617_ = pcall(function()
					return getcustomasset(L_1615_)
				end)
				if not L_1616_ then
					warn("[ Window.Background ] Failed to load custom asset: " .. tostring(L_1617_))
					return
				end

				L_1581_ = L_1562_("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = L_1617_,
					ImageTransparency = 0,
					ScaleType = "Crop",
				}, {
					L_1562_("UICorner", {
						CornerRadius = UDim.new(0, L_1570_.UICorner)
					}),
				})

			elseif L_1570_.Background then
				L_1581_ = L_1562_("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = typeof(L_1570_.Background) == "string" and L_1570_.Background or "",
					ImageTransparency = 1,
					ScaleType = "Crop",
				}, {
					L_1562_("UICorner", {
						CornerRadius = UDim.new(0, L_1570_.UICorner)
					}),
				})
			end


			local L_1585_ = L_1561_.NewRoundFrame(99, "Squircle", {
				ImageTransparency = .8,
				ImageColor3 = Color3.new(1, 1, 1),
				Size = UDim2.new(0, 0, 0, 4),
				Position = UDim2.new(0.5, 0, 1, 4),
				AnchorPoint = Vector2.new(0.5, 0),
			}, {
				L_1562_("TextButton", {
					Size = UDim2.new(1, 12, 1, 12),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Active = true,
					ZIndex = 99,
					Name = "Frame",
				})
			})

			function createAuthor(L_1621_arg0)
				return L_1562_("TextLabel", {
					Text = L_1621_arg0,
					FontFace = Font.new(L_1561_.Font, Enum.FontWeight.Medium),
					BackgroundTransparency = 1,
					TextTransparency = 0.35,
					AutomaticSize = "XY",
					Parent = L_1570_.UIElements.Main and L_1570_.UIElements.Main.Main.Topbar.Left.Title,
					TextXAlignment = "Left",
					TextSize = 13,
					LayoutOrder = 2,
					ThemeTag = {
						TextColor3 = "Text"
					},
					Name = "Author",
				})
			end

			local L_1586_
			local L_1587_

			if L_1570_.Author then
				L_1586_ = createAuthor(L_1570_.Author)
			end


			local L_1588_ = L_1562_("TextLabel", {
				Text = L_1570_.Title,
				FontFace = Font.new(L_1561_.Font, Enum.FontWeight.SemiBold),
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
				Name = "Title",
				TextXAlignment = "Left",
				TextSize = 16,
				ThemeTag = {
					TextColor3 = "Text"
				}
			})

			L_1570_.UIElements.Main = L_1562_("Frame", {
				Size = L_1570_.Size,
				Position = L_1570_.Position,
				BackgroundTransparency = 1,
				Parent = L_1569_arg0.Parent,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Active = true,
			}, {

				L_1576_,
				L_1561_.NewRoundFrame(L_1570_.UICorner, "Squircle", {
					ImageTransparency = 1,
					Size = UDim2.new(1, 0, 1, -240),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = "Background",
					ThemeTag = {
						ImageColor3 = "Background"
					},

				}, {
					L_1581_,
					L_1585_,
					L_1573_,



				}),
				UIStroke,
				L_1572_,
				L_1574_,
				L_1575_,
				L_1562_("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Name = "Main",

					Visible = false,
					ZIndex = 97,
				}, {
					L_1562_("UICorner", {
						CornerRadius = UDim.new(0, L_1570_.UICorner)
					}),
					L_1570_.UIElements.SideBarContainer,
					L_1570_.UIElements.MainBar,

					L_1577_,

					L_1579_,
					L_1562_("Frame", {
						Size = UDim2.new(1, 0, 0, 52),
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.fromRGB(50, 50, 50),
						Name = "Topbar"
					}, {
						L_1578_,






						L_1562_("Frame", {
							AutomaticSize = "X",
							Size = UDim2.new(0, 0, 1, 0),
							BackgroundTransparency = 1,
							Name = "Left"
						}, {
							L_1562_("UIListLayout", {
								Padding = UDim.new(0, L_1570_.UIPadding + 4),
								SortOrder = "LayoutOrder",
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
							}),
							L_1562_("Frame", {
								AutomaticSize = "XY",
								BackgroundTransparency = 1,
								Name = "Title",
								Size = UDim2.new(0, 0, 1, 0),
								LayoutOrder = 2,
							}, {
								L_1562_("UIListLayout", {
									Padding = UDim.new(0, 0),
									SortOrder = "LayoutOrder",
									FillDirection = "Vertical",
									VerticalAlignment = "Center",
								}),
								L_1588_,
								L_1586_,
							}),
							L_1562_("UIPadding", {
								PaddingLeft = UDim.new(0, 4)
							})
						}),
						L_1562_("ScrollingFrame", {
							Name = "Center",
							BackgroundTransparency = 1,
							AutomaticSize = "Y",
							ScrollBarThickness = 0,
							ScrollingDirection = "X",
							AutomaticCanvasSize = "X",
							CanvasSize = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(0, 0, 1, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.new(0, 0, 0.5, 0),
							Visible = false,
						}, {
							L_1562_("UIListLayout", {
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
								HorizontalAlignment = "Left",
								Padding = UDim.new(0, L_1570_.UIPadding / 2)
							})
						}),
						L_1562_("Frame", {
							AutomaticSize = "XY",
							BackgroundTransparency = 1,
							Position = UDim2.new(1, 0, 0.5, 0),
							AnchorPoint = Vector2.new(1, 0.5),
							Name = "Right",
						}, {
							L_1562_("UIListLayout", {
								Padding = UDim.new(0, 9),
								FillDirection = "Horizontal",
								SortOrder = "LayoutOrder",
							}),

						}),
						L_1562_("UIPadding", {
							PaddingTop = UDim.new(0, L_1570_.UIPadding),
							PaddingLeft = UDim.new(0, L_1570_.UIPadding),
							PaddingRight = UDim.new(0, 8),
							PaddingBottom = UDim.new(0, L_1570_.UIPadding),
						})
					})
				})
			})

			L_1561_.AddSignal(L_1570_.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize", function()
				local L_1622_ = 0
				local L_1623_ = L_1570_.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X
				if L_1588_ and L_1586_ then
					L_1622_ = math.max(L_1588_.TextBounds.X, L_1586_.TextBounds.X)
				else
					L_1622_ = L_1588_.TextBounds.X
				end
				if L_1587_ then
					L_1622_ = L_1622_ + L_1570_.IconSize + L_1570_.UIPadding + 4
				end
				L_1570_.UIElements.Main.Main.Topbar.Center.Position = UDim2.new(0, L_1622_ + L_1570_.UIPadding, 0.5, 0)
				L_1570_.UIElements.Main.Main.Topbar.Center.Size = UDim2.new(
					1,
					-L_1622_ - L_1623_ - (L_1570_.UIPadding * 2),
					1,
					0
				)
			end)

			function L_1570_.CreateTopbarButton(L_1624_arg0, L_1625_arg1, L_1626_arg2, L_1627_arg3, L_1628_arg4, L_1629_arg5)
				local L_1630_ = L_1561_.Image(
					L_1626_arg2,
					L_1626_arg2,
					0,
					L_1570_.Folder,
					"TopbarIcon",
					true,
					L_1629_arg5
				)
				L_1630_.Size = UDim2.new(0, 16, 0, 16)
				L_1630_.AnchorPoint = Vector2.new(0.5, 0.5)
				L_1630_.Position = UDim2.new(0.5, 0, 0.5, 0)

				local L_1631_ = L_1561_.NewRoundFrame(9, "Squircle", {
					Size = UDim2.new(0, 36, 0, 36),
					LayoutOrder = L_1628_arg4 or 999,
					Parent = L_1570_.UIElements.Main.Main.Topbar.Right,

					ZIndex = 9999,
					ThemeTag = {
						ImageColor3 = "Text"
					},
					ImageTransparency = 1
				}, {
					L_1561_.NewRoundFrame(9, "SquircleOutline", {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "Outline"
					}, {
						L_1562_("UIGradient", {
							Rotation = 45,
							Color = ColorSequence.new{
								ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
							},
							Transparency = NumberSequence.new{
								NumberSequenceKeypoint.new(0.0, 0.1),
								NumberSequenceKeypoint.new(0.5, 1),
								NumberSequenceKeypoint.new(1.0, 0.1),
							}
						}),
					}),
					L_1630_
				}, true)



				L_1570_.TopBarButtons[100 - L_1628_arg4] = {
					Name = L_1625_arg1,
					Object = L_1631_
				}

				L_1561_.AddSignal(L_1631_.MouseButton1Click, function()
					L_1627_arg3()
				end)
				L_1561_.AddSignal(L_1631_.MouseEnter, function()
					L_1563_(L_1631_, .15, {
						ImageTransparency = .93
					}):Play()
					L_1563_(L_1631_.Outline, .15, {
						ImageTransparency = .75
					}):Play()

				end)
				L_1561_.AddSignal(L_1631_.MouseLeave, function()
					L_1563_(L_1631_, .1, {
						ImageTransparency = 1
					}):Play()
					L_1563_(L_1631_.Outline, .1, {
						ImageTransparency = 1
					}):Play()

				end)

				return L_1631_
			end



			local L_1589_ = L_1561_.Drag(
				L_1570_.UIElements.Main,
				{
					L_1570_.UIElements.Main.Main.Topbar,
					L_1585_.Frame
				},
				function(L_1632_arg0, L_1633_arg1)
					if not L_1570_.Closed then
						if L_1632_arg0 and L_1633_arg1 == L_1585_.Frame then
							L_1563_(L_1585_, .1, {
								ImageTransparency = .35
							}):Play()
						else
							L_1563_(L_1585_, .2, {
								ImageTransparency = .8
							}):Play()
						end
						L_1570_.Position = L_1570_.UIElements.Main.Position
						L_1570_.Dragging = L_1632_arg0
					end
				end
			)

			if not L_1580_ and L_1570_.Background and typeof(L_1570_.Background) == "table" then

				local L_1634_ = L_1562_"UIGradient"
				for L_1635_forvar0, L_1636_forvar1 in next, L_1570_.Background do
					L_1634_[L_1635_forvar0] = L_1636_forvar1
				end

				L_1570_.UIElements.BackgroundGradient = L_1561_.NewRoundFrame(L_1570_.UICorner, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Parent = L_1570_.UIElements.Main.Background,
					ImageTransparency = L_1570_.Transparent and L_1569_arg0.WindUI.TransparencyValue or 0
				}, {
					L_1634_
				})
			end














			L_1570_.OpenButtonMain = L_1_.load'w'.New(L_1570_)


			task.spawn(function()
				if L_1570_.Icon then

					L_1587_ = L_1561_.Image(
						L_1570_.Icon,
						L_1570_.Title,
						0,
						L_1570_.Folder,
						"Window",
						true,
						L_1570_.IconThemed
					)
					L_1587_.Parent = L_1570_.UIElements.Main.Main.Topbar.Left
					L_1587_.Size = UDim2.new(0, L_1570_.IconSize, 0, L_1570_.IconSize)

					L_1570_.OpenButtonMain:SetIcon(L_1570_.Icon)











				else
					L_1570_.OpenButtonMain:SetIcon(L_1570_.Icon)

				end
			end)

			function L_1570_.SetToggleKey(L_1637_arg0, L_1638_arg1)
				L_1570_.ToggleKey = L_1638_arg1
			end

			function L_1570_.SetTitle(L_1639_arg0, L_1640_arg1)
				L_1570_.Title = L_1640_arg1
				L_1588_.Text = L_1640_arg1
			end

			function L_1570_.SetAuthor(L_1641_arg0, L_1642_arg1)
				L_1570_.Author = L_1642_arg1
				if not L_1586_ then
					L_1586_ = createAuthor(L_1570_.Author)
				end

				L_1586_.Text = L_1642_arg1
			end

			function L_1570_.SetBackgroundImage(L_1643_arg0, L_1644_arg1)
				L_1570_.UIElements.Main.Background.ImageLabel.Image = L_1644_arg1
			end
			function L_1570_.SetBackgroundImageTransparency(L_1645_arg0, L_1646_arg1)
				if L_1581_ and L_1581_:IsA"ImageLabel" then
					L_1581_.ImageTransparency = math.floor(L_1646_arg1 + 0.5)
				end
				L_1570_.BackgroundImageTransparency = math.floor(L_1646_arg1 + 0.5)
			end
			function L_1570_.SetBackgroundTransparency(L_1647_arg0, L_1648_arg1)
				WindUI.TransparencyValue = math.floor(tonumber(L_1648_arg1) + 0.5)
				L_1570_:ToggleTransparency(math.floor(tonumber(L_1648_arg1) + 0.5) > 0)
			end

			local L_1590_
			local L_1591_
			L_1561_.Icon"minimize"
			L_1561_.Icon"maximize"

			L_1570_:CreateTopbarButton("Fullscreen", "maximize", function()
				L_1570_:ToggleFullscreen()
			end, 998)

			function L_1570_.ToggleFullscreen(L_1649_arg0)
				local L_1650_ = L_1570_.IsFullscreen

				L_1589_:Set(L_1650_)

				if not L_1650_ then
					L_1590_ = L_1570_.UIElements.Main.Position
					L_1591_ = L_1570_.UIElements.Main.Size

					L_1570_.CanResize = false
				else
					if L_1570_.Resizable then
						L_1570_.CanResize = true
					end
				end

				L_1563_(L_1570_.UIElements.Main, 0.45, {
					Size = L_1650_ and L_1591_ or UDim2.new(1, -20, 1, -72)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

				L_1563_(L_1570_.UIElements.Main, 0.45, {
					Position = L_1650_ and L_1590_ or UDim2.new(0.5, 0, 0.5, 26)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()



				L_1570_.IsFullscreen = not L_1650_
			end


			L_1570_:CreateTopbarButton("Minimize", "minus", function()
				L_1570_:Close()
				task.spawn(function()
					task.wait(.3)
					if not L_1570_.IsPC and L_1570_.IsOpenButtonEnabled then

						L_1570_.OpenButtonMain:Visible(true)
					end
				end)















			end, 997)

			function L_1570_.OnOpen(L_1651_arg0, L_1652_arg1)
				L_1570_.OnOpenCallback = L_1652_arg1
			end
			function L_1570_.OnClose(L_1653_arg0, L_1654_arg1)
				L_1570_.OnCloseCallback = L_1654_arg1
			end
			function L_1570_.OnDestroy(L_1655_arg0, L_1656_arg1)
				L_1570_.OnDestroyCallback = L_1656_arg1
			end





			function L_1570_.SetIconSize(L_1657_arg0, L_1658_arg1)
				local L_1659_
				if typeof(L_1658_arg1) == "number" then
					L_1659_ = UDim2.new(0, L_1658_arg1, 0, L_1658_arg1)
					L_1570_.IconSize = L_1658_arg1
				elseif typeof(L_1658_arg1) == "UDim2" then
					L_1659_ = L_1658_arg1
					L_1570_.IconSize = L_1658_arg1.X.Offset
				end

				if L_1587_ then
					L_1587_.Size = L_1659_
				end
			end

			function L_1570_.Open(L_1660_arg0)
				task.spawn(function()
					if L_1570_.OnOpenCallback then
						task.spawn(function()
							L_1561_.SafeCallback(L_1570_.OnOpenCallback)
						end)
					end


					task.wait(.06)
					L_1570_.Closed = false

					L_1563_(L_1570_.UIElements.Main.Background, 0.2, {
						ImageTransparency = L_1570_.Transparent and L_1569_arg0.WindUI.TransparencyValue or 0,
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

					if L_1570_.UIElements.BackgroundGradient then
						L_1563_(L_1570_.UIElements.BackgroundGradient, 0.2, {
							ImageTransparency = 0,
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end

					L_1563_(L_1570_.UIElements.Main.Background, 0.4, {
						Size = UDim2.new(1, 0, 1, 0),
					}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play()

					if L_1581_ then
						if L_1581_:IsA"VideoFrame" then
							L_1581_.Visible = true
						else
							L_1563_(L_1581_, 0.2, {
								ImageTransparency = L_1570_.BackgroundImageTransparency,
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
						end
					end


					L_1563_(L_1576_, 0.25, {
						ImageTransparency = .7
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					if UIStroke then
						L_1563_(UIStroke, 0.25, {
							Transparency = .8
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end

					task.spawn(function()
						task.wait(.3)
						L_1563_(L_1585_, .45, {
							Size = UDim2.new(0, 200, 0, 4),
							ImageTransparency = .8
						}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play()
						L_1589_:Set(true)
						task.wait(.45)
						if L_1570_.Resizable then
							L_1563_(L_1573_.ImageLabel, .45, {
								ImageTransparency = .8
							}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play()
							L_1570_.CanResize = true
						end
					end)


					L_1570_.CanDropdown = true

					L_1570_.UIElements.Main.Visible = true
					task.spawn(function()
						task.wait(.05)
						L_1570_.UIElements.Main:WaitForChild"Main".Visible = true


					end)
				end)
			end
			function L_1570_.Close(L_1661_arg0)
				local L_1662_ = {}

				if L_1570_.OnCloseCallback then
					task.spawn(function()
						L_1561_.SafeCallback(L_1570_.OnCloseCallback)
					end)
				end



				L_1570_.UIElements.Main:WaitForChild"Main".Visible = false

				L_1570_.CanDropdown = false
				L_1570_.Closed = true

				L_1563_(L_1570_.UIElements.Main.Background, 0.32, {
					ImageTransparency = 1,
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
				if L_1570_.UIElements.BackgroundGradient then
					L_1563_(L_1570_.UIElements.BackgroundGradient, 0.32, {
						ImageTransparency = 1,
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
				end

				L_1563_(L_1570_.UIElements.Main.Background, 0.4, {
					Size = UDim2.new(1, 0, 1, -240),
				}, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut):Play()


				if L_1581_ then
					if L_1581_:IsA"VideoFrame" then
						L_1581_.Visible = false
					else
						L_1563_(L_1581_, 0.3, {
							ImageTransparency = 1,
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
				end
				L_1563_(L_1576_, 0.25, {
					ImageTransparency = 1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				if UIStroke then
					L_1563_(UIStroke, 0.25, {
						Transparency = 1
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end

				L_1563_(L_1585_, .3, {
					Size = UDim2.new(0, 0, 0, 4),
					ImageTransparency = 1
				}, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut):Play()
				L_1563_(L_1573_.ImageLabel, .3, {
					ImageTransparency = 1
				}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play()
				L_1589_:Set(false)
				L_1570_.CanResize = false

				task.spawn(function()
					task.wait(0.4)
					L_1570_.UIElements.Main.Visible = false
				end)

				function L_1662_.Destroy(L_1663_arg0)
					if L_1570_.OnDestroyCallback then
						task.spawn(function()
							L_1561_.SafeCallback(L_1570_.OnDestroyCallback)
						end)
					end



					L_1570_.Destroyed = true
					task.wait(0.4)
					L_1569_arg0.WindUI.ScreenGui:Destroy()
					L_1569_arg0.WindUI.NotificationGui:Destroy()
					L_1569_arg0.WindUI.DropdownGui:Destroy()


				end

				return L_1662_
			end
			function L_1570_.Destroy(L_1664_arg0)
				return L_1570_:Close():Destroy()
			end
			function L_1570_.Toggle(L_1665_arg0)
				if L_1570_.Closed then
					L_1570_:Open()
				else
					L_1570_:Close()
				end
			end


			function L_1570_.ToggleTransparency(L_1666_arg0, L_1667_arg1)

				L_1570_.Transparent = L_1667_arg1
				L_1569_arg0.WindUI.Transparent = L_1667_arg1

				L_1570_.UIElements.Main.Background.ImageTransparency = L_1667_arg1 and L_1569_arg0.WindUI.TransparencyValue or 0

				L_1570_.UIElements.MainBar.Background.ImageTransparency = L_1667_arg1 and 0.97 or 0.95

			end

			function L_1570_.LockAll(L_1668_arg0)
				for L_1669_forvar0, L_1670_forvar1 in next, L_1570_.AllElements do
					if L_1670_forvar1.Lock then
						L_1670_forvar1:Lock()
					end
				end
			end
			function L_1570_.UnlockAll(L_1671_arg0)
				for L_1672_forvar0, L_1673_forvar1 in next, L_1570_.AllElements do
					if L_1673_forvar1.Unlock then
						L_1673_forvar1:Unlock()
					end
				end
			end
			function L_1570_.GetLocked(L_1674_arg0)
				local L_1675_ = {}

				for L_1676_forvar0, L_1677_forvar1 in next, L_1570_.AllElements do
					if L_1677_forvar1.Locked then
						table.insert(L_1675_, L_1677_forvar1)
					end
				end

				return L_1675_
			end
			function L_1570_.GetUnlocked(L_1678_arg0)
				local L_1679_ = {}

				for L_1680_forvar0, L_1681_forvar1 in next, L_1570_.AllElements do
					if L_1681_forvar1.Locked == false then
						table.insert(L_1679_, L_1681_forvar1)
					end
				end

				return L_1679_
			end

			function L_1570_.GetUIScale(L_1682_arg0, L_1683_arg1)
				return L_1569_arg0.WindUI.UIScale
			end

			function L_1570_.SetUIScale(L_1684_arg0, L_1685_arg1)
				L_1569_arg0.WindUI.UIScale = L_1685_arg1
				L_1563_(L_1569_arg0.WindUI.ScreenGui.UIScale, .2, {
					Scale = L_1685_arg1
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				return L_1570_
			end

			function L_1570_.SetToTheCenter(L_1686_arg0)
				L_1563_(L_1570_.UIElements.Main, 0.45, {
					Position = UDim2.new(0.5, 0, 0.5, 0)
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				return L_1570_
			end

			do
				local L_1687_ = 40
				local L_1688_ = L_1560_.ViewportSize
				local L_1689_ = L_1570_.UIElements.Main.AbsoluteSize

				if not L_1570_.IsFullscreen and L_1570_.AutoScale then
					local L_1690_ = L_1688_.X - (L_1687_ * 2)
					local L_1691_ = L_1688_.Y - (L_1687_ * 2)

					local L_1692_ = L_1690_ / L_1689_.X
					local L_1693_ = L_1691_ / L_1689_.Y

					local L_1694_ = math.min(L_1692_, L_1693_)

					local L_1695_ = 0.3
					local L_1696_ = 1.0

					local L_1697_ = math.clamp(L_1694_, L_1695_, L_1696_)

					local L_1698_ = L_1570_:GetUIScale() or 1
					local L_1699_ = 0.05

					if math.abs(L_1697_ - L_1698_) > L_1699_ then
						L_1570_:SetUIScale(L_1697_)
					end
				end
			end


			if L_1570_.OpenButtonMain and L_1570_.OpenButtonMain.Button then
				L_1561_.AddSignal(L_1570_.OpenButtonMain.Button.TextButton.MouseButton1Click, function()

					L_1570_.OpenButtonMain:Visible(false)
					L_1570_:Open()
				end)
			end

			L_1561_.AddSignal(L_1559_.InputBegan, function(L_1700_arg0, L_1701_arg1)
				if L_1701_arg1 then
					return
				end

				if L_1570_.ToggleKey then
					if L_1700_arg0.KeyCode == L_1570_.ToggleKey then
						L_1570_:Toggle()
					end
				end
			end)

			task.spawn(function()

				L_1570_:Open()
			end)

			function L_1570_.EditOpenButton(L_1702_arg0, L_1703_arg1)
				return L_1570_.OpenButtonMain:Edit(L_1703_arg1)
			end

			if L_1570_.OpenButton and typeof(L_1570_.OpenButton) == "table" then
				L_1570_:EditOpenButton(L_1570_.OpenButton)
			end


			local L_1592_ = L_1_.load'S'
			local L_1593_ = L_1_.load'T'
			local L_1594_ = L_1592_.Init(L_1570_, L_1569_arg0.WindUI, L_1569_arg0.Parent.Parent.ToolTips)
			L_1594_:OnChange(function(L_1704_arg0)
				L_1570_.CurrentTab = L_1704_arg0
			end)

			L_1570_.TabModule = L_1592_

			function L_1570_.Tab(L_1705_arg0, L_1706_arg1)
				L_1706_arg1.Parent = L_1570_.UIElements.SideBar.Frame
				return L_1594_.New(L_1706_arg1, L_1569_arg0.WindUI.UIScale)
			end

			function L_1570_.SelectTab(L_1707_arg0, L_1708_arg1)
				L_1594_:SelectTab(L_1708_arg1)
			end

			function L_1570_.Section(L_1709_arg0, L_1710_arg1)
				return L_1593_.New(L_1710_arg1, L_1570_.UIElements.SideBar.Frame, L_1570_.Folder, L_1569_arg0.WindUI.UIScale, L_1570_)
			end

			function L_1570_.IsResizable(L_1711_arg0, L_1712_arg1)
				L_1570_.Resizable = L_1712_arg1
				L_1570_.CanResize = L_1712_arg1
			end

			function L_1570_.Divider(L_1713_arg0)
				local L_1714_ = L_1562_("Frame", {
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0.5, 0, 0, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = .9,
					ThemeTag = {
						BackgroundColor3 = "Text"
					}
				})
				local L_1715_ = L_1562_("Frame", {
					Parent = L_1570_.UIElements.SideBar.Frame,

					Size = UDim2.new(1, -7, 0, 5),
					BackgroundTransparency = 1,
				}, {
					L_1714_
				})

				return L_1715_
			end

			local L_1595_ = L_1_.load'k'.Init(L_1570_, nil)
			function L_1570_.Dialog(L_1716_arg0, L_1717_arg1)
				local L_1718_ = {
					Title = L_1717_arg1.Title or "Dialog",
					Width = L_1717_arg1.Width or 320,
					Content = L_1717_arg1.Content,
					Buttons = L_1717_arg1.Buttons or {},

					TextPadding = 10,
				}
				local L_1719_ = L_1595_.Create(false)

				L_1719_.UIElements.Main.Size = UDim2.new(0, L_1718_.Width, 0, 0)

				local L_1720_ = L_1562_("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					BackgroundTransparency = 1,
					Parent = L_1719_.UIElements.Main
				}, {
					L_1562_("UIListLayout", {
						FillDirection = "Horizontal",
						Padding = UDim.new(0, L_1719_.UIPadding),
						VerticalAlignment = "Center"
					}),
					L_1562_("UIPadding", {
						PaddingTop = UDim.new(0, L_1718_.TextPadding / 2),
						PaddingLeft = UDim.new(0, L_1718_.TextPadding / 2),
						PaddingRight = UDim.new(0, L_1718_.TextPadding / 2),
					})
				})

				local L_1721_
				if L_1717_arg1.Icon then
					L_1721_ = L_1561_.Image(
						L_1717_arg1.Icon,
						L_1718_.Title .. ":" .. L_1717_arg1.Icon,
						0,
						L_1570_,
						"Dialog",
						true,
						L_1717_arg1.IconThemed
					)
					L_1721_.Size = UDim2.new(0, 22, 0, 22)
					L_1721_.Parent = L_1720_
				end

				L_1719_.UIElements.UIListLayout = L_1562_("UIListLayout", {
					Padding = UDim.new(0, 12),
					FillDirection = "Vertical",
					HorizontalAlignment = "Left",
					Parent = L_1719_.UIElements.Main
				})

				L_1562_("UISizeConstraint", {
					MinSize = Vector2.new(180, 20),
					MaxSize = Vector2.new(400, math.huge),
					Parent = L_1719_.UIElements.Main,
				})


				L_1719_.UIElements.Title = L_1562_("TextLabel", {
					Text = L_1718_.Title,
					TextSize = 20,
					FontFace = Font.new(L_1561_.Font, Enum.FontWeight.SemiBold),
					TextXAlignment = "Left",
					TextWrapped = true,
					RichText = true,
					Size = UDim2.new(1, L_1721_ and -26 - L_1719_.UIPadding or 0, 0, 0),
					AutomaticSize = "Y",
					ThemeTag = {
						TextColor3 = "Text"
					},
					BackgroundTransparency = 1,
					Parent = L_1720_
				})
				if L_1718_.Content then
					L_1562_("TextLabel", {
						Text = L_1718_.Content,
						TextSize = 18,
						TextTransparency = .4,
						TextWrapped = true,
						RichText = true,
						FontFace = Font.new(L_1561_.Font, Enum.FontWeight.Medium),
						TextXAlignment = "Left",
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = "Y",
						LayoutOrder = 2,
						ThemeTag = {
							TextColor3 = "Text"
						},
						BackgroundTransparency = 1,
						Parent = L_1719_.UIElements.Main
					}, {
						L_1562_("UIPadding", {
							PaddingLeft = UDim.new(0, L_1718_.TextPadding / 2),
							PaddingRight = UDim.new(0, L_1718_.TextPadding / 2),
							PaddingBottom = UDim.new(0, L_1718_.TextPadding / 2),
						})
					})
				end

				local L_1722_ = L_1562_("UIListLayout", {
					Padding = UDim.new(0, 6),
					FillDirection = "Horizontal",
					HorizontalAlignment = "Right",
				})

				local L_1723_ = L_1562_("Frame", {
					Size = UDim2.new(1, 0, 0, 40),
					AutomaticSize = "None",
					BackgroundTransparency = 1,
					Parent = L_1719_.UIElements.Main,
					LayoutOrder = 4,
				}, {
					L_1722_,






				})


				local L_1724_ = {}

				for L_1726_forvar0, L_1727_forvar1 in next, L_1718_.Buttons do
					local L_1728_ = L_1565_(L_1727_forvar1.Title, L_1727_forvar1.Icon, L_1727_forvar1.Callback, L_1727_forvar1.Variant, L_1723_, L_1719_, false)
					table.insert(L_1724_, L_1728_)
				end

				local function L_1725_func()
					L_1722_.FillDirection = Enum.FillDirection.Horizontal
					L_1722_.HorizontalAlignment = Enum.HorizontalAlignment.Right
					L_1722_.VerticalAlignment = Enum.VerticalAlignment.Center
					L_1723_.AutomaticSize = Enum.AutomaticSize.None

					for L_1731_forvar0, L_1732_forvar1 in ipairs(L_1724_) do
						L_1732_forvar1.Size = UDim2.new(0, 0, 1, 0)
						L_1732_forvar1.AutomaticSize = Enum.AutomaticSize.X
					end

					wait()

					local L_1729_ = L_1722_.AbsoluteContentSize.X / L_1569_arg0.WindUI.UIScale
					local L_1730_ = L_1723_.AbsoluteSize.X / L_1569_arg0.WindUI.UIScale

					if L_1729_ > L_1730_ then
						L_1722_.FillDirection = Enum.FillDirection.Vertical
						L_1722_.HorizontalAlignment = Enum.HorizontalAlignment.Right
						L_1722_.VerticalAlignment = Enum.VerticalAlignment.Bottom
						L_1723_.AutomaticSize = Enum.AutomaticSize.Y

						for L_1733_forvar0, L_1734_forvar1 in ipairs(L_1724_) do
							L_1734_forvar1.Size = UDim2.new(1, 0, 0, 40)
							L_1734_forvar1.AutomaticSize = Enum.AutomaticSize.None
						end
					else
						local L_1735_ = L_1730_ - L_1729_
						if L_1735_ > 0 then
							local L_1736_
							local L_1737_ = math.huge

							for L_1738_forvar0, L_1739_forvar1 in ipairs(L_1724_) do
								local L_1740_ = L_1739_forvar1.AbsoluteSize.X / L_1569_arg0.WindUI.UIScale
								if L_1740_ < L_1737_ then
									L_1737_ = L_1740_
									L_1736_ = L_1739_forvar1
								end
							end

							if L_1736_ then
								L_1736_.Size = UDim2.new(0, L_1737_ + L_1735_, 1, 0)
								L_1736_.AutomaticSize = Enum.AutomaticSize.None
							end
						end
					end
				end

				L_1561_.AddSignal(L_1719_.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize", L_1725_func)
				L_1725_func()

				wait()
				L_1719_:Open()

				return L_1719_
			end


			L_1570_:CreateTopbarButton("Close", "x", function()
				L_1570_:SetToTheCenter()
				L_1570_:Dialog{

					Title = "Close Window",
					Content = "Do you want to close this window? You will not be able to open it again.",
					Buttons = {
						{
							Title = "Cancel",

							Callback = function()
							end,
							Variant = "Secondary",
						},
						{
							Title = "Close Window",

							Callback = function()
								L_1570_:Close():Destroy()
							end,
							Variant = "Primary",
						}
					}
				}
			end, 999)

			function L_1570_.Tag(L_1741_arg0, L_1742_arg1)
				if L_1570_.UIElements.Main.Main.Topbar.Center.Visible == false then
					L_1570_.UIElements.Main.Main.Topbar.Center.Visible = true
				end
				return L_1567_:New(L_1742_arg1, L_1570_.UIElements.Main.Main.Topbar.Center)
			end


			local function L_1596_func(L_1743_arg0)
				if L_1570_.CanResize then
					isResizing = true
					L_1574_.Active = true
					initialSize = L_1570_.UIElements.Main.Size
					initialInputPosition = L_1743_arg0.Position


					L_1563_(L_1573_.ImageLabel, 0.1, {
						ImageTransparency = .35
					}):Play()

					L_1561_.AddSignal(L_1743_arg0.Changed, function()
						if L_1743_arg0.UserInputState == Enum.UserInputState.End then
							isResizing = false
							L_1574_.Active = false


							L_1563_(L_1573_.ImageLabel, 0.17, {
								ImageTransparency = .8
							}):Play()
						end
					end)
				end
			end

			L_1561_.AddSignal(L_1573_.InputBegan, function(L_1744_arg0)
				if L_1744_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_1744_arg0.UserInputType == Enum.UserInputType.Touch then
					if L_1570_.CanResize then
						L_1596_func(L_1744_arg0)
					end
				end
			end)

			L_1561_.AddSignal(L_1559_.InputChanged, function(L_1745_arg0)
				if L_1745_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_1745_arg0.UserInputType == Enum.UserInputType.Touch then
					if isResizing and L_1570_.CanResize then
						local L_1746_ = L_1745_arg0.Position - initialInputPosition
						local L_1747_ = UDim2.new(0, initialSize.X.Offset + L_1746_.X * 2, 0, initialSize.Y.Offset + L_1746_.Y * 2)

						L_1747_ = UDim2.new(
							L_1747_.X.Scale,
							math.clamp(L_1747_.X.Offset, L_1570_.MinSize.X, L_1570_.MaxSize.X),
							L_1747_.Y.Scale,
							math.clamp(L_1747_.Y.Offset, L_1570_.MinSize.Y, L_1570_.MaxSize.Y)
						)

						L_1563_(L_1570_.UIElements.Main, 0, {
							Size = L_1747_
						}):Play()

						L_1570_.Size = L_1747_
					end
				end
			end)




			local L_1597_ = 0
			local L_1598_ = 0.4
			local L_1599_
			local L_1600_ = 0

			function onDoubleClick()
				L_1570_:SetToTheCenter()
			end

			L_1585_.Frame.MouseButton1Up:Connect(function()
				local L_1748_ = tick()
				local L_1749_ = L_1570_.Position

				L_1600_ = L_1600_ + 1

				if L_1600_ == 1 then
					L_1597_ = L_1748_
					L_1599_ = L_1749_

					task.spawn(function()
						task.wait(L_1598_)
						if L_1600_ == 1 then
							L_1600_ = 0
							L_1599_ = nil
						end
					end)

				elseif L_1600_ == 2 then
					if L_1748_ - L_1597_ <= L_1598_ and L_1749_ == L_1599_ then
						onDoubleClick()
					end

					L_1600_ = 0
					L_1599_ = nil
					L_1597_ = 0
				else
					L_1600_ = 1
					L_1597_ = L_1748_
					L_1599_ = L_1749_
				end
			end)





			if not L_1570_.HideSearchBar then
				local L_1750_ = L_1_.load'V'
				local L_1751_ = false





















				local L_1752_ = L_1564_("Search", "search", L_1570_.UIElements.SideBarContainer, true)
				L_1752_.Size = UDim2.new(1, -L_1570_.UIPadding / 2, 0, 39)
				L_1752_.Position = UDim2.new(0, L_1570_.UIPadding / 2, 0, L_1570_.UIPadding / 2)

				L_1561_.AddSignal(L_1752_.MouseButton1Click, function()
					if L_1751_ then
						return
					end

					L_1750_.new(L_1570_.TabModule, L_1570_.UIElements.Main, function()

						L_1751_ = false
						if L_1570_.Resizable then
							L_1570_.CanResize = true
						end

						L_1563_(L_1575_, 0.1, {
							ImageTransparency = 1
						}):Play()
						L_1575_.Active = false
					end)
					L_1563_(L_1575_, 0.1, {
						ImageTransparency = .65
					}):Play()
					L_1575_.Active = true

					L_1751_ = true
					L_1570_.CanResize = false
				end)
			end




			function L_1570_.DisableTopbarButtons(L_1753_arg0, L_1754_arg1)
				for L_1755_forvar0, L_1756_forvar1 in next, L_1754_arg1 do
					for L_1757_forvar0, L_1758_forvar1 in next, L_1570_.TopBarButtons do
						if L_1758_forvar1.Name == L_1756_forvar1 then
							L_1758_forvar1.Object.Visible = false
						end
					end
				end
			end

			return L_1570_
		end
	end
end
local L_2_ = {
	Window = nil,
	Theme = nil,
	Creator = L_1_.load'a',
	LocalizationModule = L_1_.load'b',
	NotificationModule = L_1_.load'c',
	Themes = nil,
	Transparent = false,

	TransparencyValue = .15,

	UIScale = 1,


	Version = "0.0.0",

	Services = L_1_.load'g',

	OnThemeChangeFunction = nil,
}


local L_3_ = game:GetService"HttpService"


local L_4_ = L_3_:JSONDecode(L_1_.load'h')
if L_4_ then
	L_2_.Version = L_4_.version
end

local L_5_ = L_1_.load'l'
local L_6_ =

	L_2_.Services

local L_7_ = L_2_.Creator

local L_8_ = L_7_.New
local L_9_ =
	L_7_.Tween


local L_10_ = L_1_.load'p'
local L_11_ =

	game:GetService"Players" and game:GetService"Players".LocalPlayer or nil

local L_12_ = protectgui or (syn and syn.protect_gui) or function()
end

local L_13_ = gethui and gethui() or (game.CoreGui or game.Players.LocalPlayer:WaitForChild"PlayerGui")


L_2_.ScreenGui = L_8_("ScreenGui", {
	Name = "WindUI",
	Parent = L_13_,
	IgnoreGuiInset = true,
	ScreenInsets = "None",
}, {
	L_8_("UIScale", {
		Scale = L_2_.Scale,
	}),
	L_8_("Folder", {
		Name = "Window"
	}),






	L_8_("Folder", {
		Name = "KeySystem"
	}),
	L_8_("Folder", {
		Name = "Popups"
	}),
	L_8_("Folder", {
		Name = "ToolTips"
	})
})

L_2_.NotificationGui = L_8_("ScreenGui", {
	Name = "WindUI/Notifications",
	Parent = L_13_,
	IgnoreGuiInset = true,
})
L_2_.DropdownGui = L_8_("ScreenGui", {
	Name = "WindUI/Dropdowns",
	Parent = L_13_,
	IgnoreGuiInset = true,
})
L_12_(L_2_.ScreenGui)
L_12_(L_2_.NotificationGui)
L_12_(L_2_.DropdownGui)

L_7_.Init(L_2_)

math.clamp(L_2_.TransparencyValue, 0, 1)

local L_14_ = L_2_.NotificationModule.Init(L_2_.NotificationGui)

function L_2_.Notify(L_1759_arg0, L_1760_arg1)
	L_1760_arg1.Holder = L_14_.Frame
	L_1760_arg1.Window = L_2_.Window

	return L_2_.NotificationModule.New(L_1760_arg1)
end

function L_2_.SetNotificationLower(L_1761_arg0, L_1762_arg1)
	L_14_.SetLower(L_1762_arg1)
end

function L_2_.SetFont(L_1763_arg0, L_1764_arg1)
	L_7_.UpdateFont(L_1764_arg1)
end

function L_2_.OnThemeChange(L_1765_arg0, L_1766_arg1)
	L_2_.OnThemeChangeFunction = L_1766_arg1
end

function L_2_.AddTheme(L_1767_arg0, L_1768_arg1)
	L_2_.Themes[L_1768_arg1.Name] = L_1768_arg1
	return L_1768_arg1
end

function L_2_.SetTheme(L_1769_arg0, L_1770_arg1)
	if L_2_.Themes[L_1770_arg1] then
		L_2_.Theme = L_2_.Themes[L_1770_arg1]
		L_7_.SetTheme(L_2_.Themes[L_1770_arg1])

		if L_2_.OnThemeChangeFunction then
			L_2_.OnThemeChangeFunction(L_1770_arg1)
		end


		return L_2_.Themes[L_1770_arg1]
	end
	return nil
end

function L_2_.GetThemes(L_1771_arg0)
	return L_2_.Themes
end
function L_2_.GetCurrentTheme(L_1772_arg0)
	return L_2_.Theme.Name
end
function L_2_.GetTransparency(L_1773_arg0)
	return L_2_.Transparent or false
end
function L_2_.GetWindowSize(L_1774_arg0)
	return Window.UIElements.Main.Size
end
function L_2_.Localization(L_1775_arg0, L_1776_arg1)
	return L_2_.LocalizationModule:New(L_1776_arg1, L_7_)
end

function L_2_.SetLanguage(L_1777_arg0, L_1778_arg1)
	if L_7_.Localization then
		return L_7_.SetLanguage(L_1778_arg1)
	end
	return false
end

function L_2_.ToggleAcrylic(L_1779_arg0, L_1780_arg1)
	if L_2_.Window and L_2_.Window.AcrylicPaint and L_2_.Window.AcrylicPaint.Model then
		L_2_.Window.Acrylic = L_1780_arg1
		L_2_.Window.AcrylicPaint.Model.Transparency = L_1780_arg1 and 0.98 or 1
		if L_1780_arg1 then
			L_10_.Enable()
		else
			L_10_.Disable()
		end
	end
end



function L_2_.Gradient(L_1781_arg0, L_1782_arg1, L_1783_arg2)
	local L_1784_ = {}
	local L_1785_ = {}

	for L_1787_forvar0, L_1788_forvar1 in next, L_1782_arg1 do
		local L_1789_ = tonumber(L_1787_forvar0)
		if L_1789_ then
			L_1789_ = math.clamp(L_1789_ / 100, 0, 1)
			table.insert(L_1784_, ColorSequenceKeypoint.new(L_1789_, L_1788_forvar1.Color))
			table.insert(L_1785_, NumberSequenceKeypoint.new(L_1789_, L_1788_forvar1.Transparency or 0))
		end
	end

	table.sort(L_1784_, function(L_1790_arg0, L_1791_arg1)
		return L_1790_arg0.Time < L_1791_arg1.Time
	end)
	table.sort(L_1785_, function(L_1792_arg0, L_1793_arg1)
		return L_1792_arg0.Time < L_1793_arg1.Time
	end)


	if #L_1784_ < 2 then
		error"ColorSequence requires at least 2 keypoints"
	end


	local L_1786_ = {
		Color = ColorSequence.new(L_1784_),
		Transparency = NumberSequence.new(L_1785_),
	}

	if L_1783_arg2 then
		for L_1794_forvar0, L_1795_forvar1 in pairs(L_1783_arg2) do
			L_1786_[L_1794_forvar0] = L_1795_forvar1
		end
	end

	return L_1786_
end


function L_2_.Popup(L_1796_arg0, L_1797_arg1)
	L_1797_arg1.WindUI = L_2_
	return L_1_.load'q'.new(L_1797_arg1)
end


L_2_.Themes = L_1_.load'r'(L_2_)

L_7_.Themes = L_2_.Themes


L_2_:SetTheme"Dark"
L_2_:SetLanguage(L_7_.Language)


function L_2_.CreateWindow(L_1798_arg0, L_1799_arg1)
	local L_1800_ = L_1_.load'W'

	if not isfolder"WindUI" then
		makefolder"WindUI"
	end
	if L_1799_arg1.Folder then
		makefolder(L_1799_arg1.Folder)
	else
		makefolder(L_1799_arg1.Title)
	end

	L_1799_arg1.WindUI = L_2_
	L_1799_arg1.Parent = L_2_.ScreenGui.Window

	if L_2_.Window then
		warn"You cannot create more than one window"
		return
	end

	local L_1801_ = true

	local L_1802_ = L_2_.Themes[L_1799_arg1.Theme or "Dark"]


	L_7_.SetTheme(L_1802_)


	local L_1803_ = gethwid or function()
		return game:GetService"Players".LocalPlayer.UserId
	end

	local L_1804_ = L_1803_()

	if L_1799_arg1.KeySystem then
		L_1801_ = false

		local function L_1806_func()
			L_5_.new(L_1799_arg1, L_1804_, function(L_1808_arg0)
				L_1801_ = L_1808_arg0
			end)
		end

		local L_1807_ = L_1799_arg1.Folder .. "/" .. L_1804_ .. ".key"

		if not L_1799_arg1.KeySystem.API then
			if L_1799_arg1.KeySystem.SaveKey and isfile(L_1807_) then
				local L_1809_ = readfile(L_1807_)
				local L_1810_ = (type(L_1799_arg1.KeySystem.Key) == "table")
					and table.find(L_1799_arg1.KeySystem.Key, L_1809_)
					or tostring(L_1799_arg1.KeySystem.Key) == tostring(L_1809_)

				if L_1810_ then
					L_1801_ = true
				else
					L_1806_func()
				end
			else
				L_1806_func()
			end
		else
			if isfile(L_1807_) then
				local L_1811_ = readfile(L_1807_)
				local L_1812_ = false

				for L_1813_forvar0, L_1814_forvar1 in next, L_1799_arg1.KeySystem.API do
					local L_1815_ = L_2_.Services[L_1814_forvar1.Type]
					if L_1815_ then
						local L_1816_ = {}
						for L_1819_forvar0, L_1820_forvar1 in next, L_1815_.Args do
							table.insert(L_1816_, L_1814_forvar1[L_1820_forvar1])
						end

						local L_1817_ = L_1815_.New(table.unpack(L_1816_))
						local L_1818_ = L_1817_.Verify(L_1811_)
						if L_1818_ then
							L_1812_ = true
							break
						end
					end
				end

				L_1801_ = L_1812_
				if not L_1812_ then
					L_1806_func()
				end
			else
				L_1806_func()
			end
		end

		repeat
			task.wait()
		until L_1801_
	end

	local L_1805_ = L_1800_(L_1799_arg1)

	L_2_.Transparent = L_1799_arg1.Transparent
	L_2_.Window = L_1805_

	if L_1799_arg1.Acrylic then
		L_10_.init()
	end

	return L_1805_
end

return L_2_
