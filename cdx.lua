-- Сервисы Roblox
local UserInputService = game:GetService("UserInputService")

-- UI элементы
local textBox = script.Parent.Key -- TextBox, где вводится ключ
local enterButton = script.Parent.Enter -- Кнопка Enter для проверки ключа
local originalText = "" -- Хранение оригинального текста

-- Звуки
local ErrorSound = script.Error
local SuccessSound = script.Success

-- Локальная база данных с сгенерированными ключами
local keysDatabase = {
    trial = {
        lastUpdate = "2024-10-01",  -- Дата последнего обновления
        keys = {
            { key = "TRIAL-1A2B3C4D5E", expirationDays = 3, banned = false },
            { key = "TRIAL-6F7E8D9C2A", expirationDays = 3, banned = false },
            -- Добавьте другие ключи
        }
    },
    -- Другие типы ключей (weekly, monthly и т.д.)
}

-- Переменные состояния
local Logined = false
local Opened = false

-- Функция для создания уведомления
local function CreateNotification(Message)
    local Notification = script.Parent.Parent.Parent.Parent.Parent.Assets.SystemNotification:Clone()
    Notification.Value = Message
    Notification.Parent = script.Parent.Parent.Parent.Parent.Parent.Notifications.Notifications
end

-- Функция для фильтрации текста (удаляем не латинские символы)
local function filterText(inputText)
    local filteredText = ""
    for i = 1, #inputText do
        local char = inputText:sub(i, i)
        -- Оставляем только латинские буквы, цифры и символы
        if string.match(char, "[%w%s%p]") then
            filteredText = filteredText .. char
        end
    end
    return filteredText
end

-- Функция для маскировки текста (вместо текста показываются звёздочки)
local function updateOriginalText(newText)
    newText = filterText(newText) -- Фильтруем текст, убирая лишние символы
    
    if #newText > #originalText then
        originalText = originalText .. string.sub(newText, #originalText + 1, #newText)
    elseif #newText < #originalText then
        originalText = string.sub(originalText, 1, #newText)
    end
    
    -- Маскируем текст символами "*"
    local maskedText = string.rep("*", #originalText)
    textBox.Text = maskedText
    textBox.CursorPosition = #originalText + 1 -- Курсор ставим в конец
end

-- Обработчик изменения текста
textBox:GetPropertyChangedSignal("Text"):Connect(function()
    local newText = textBox.Text
    if newText ~= string.rep("*", #newText) then
        updateOriginalText(newText) -- Обновляем текст при вводе
    end
end)

-- Функция для проверки срока действия ключа
local function isKeyExpired(expirationDays)
    return expirationDays <= 0
end

-- Функция для проверки ключа
local function checkKeyValidity(inputKey)
    for keyType, data in pairs(keysDatabase) do
        for _, keyInfo in pairs(data.keys) do
            if keyInfo.key == inputKey then
                -- Проверка, забанен ли ключ
                if keyInfo.banned then
                    return false, "Ключ заблокирован!"
                end
                
                -- Проверка срока действия ключа
                local expirationDays = keyInfo.expirationDays
                if isKeyExpired(expirationDays) then
                    return false, "Ключ истёк!"
                end
                
                return true, "Ключ действителен: " .. keyType .. " на " .. expirationDays .. " дней."
            end
        end
    end
    return false, "Ключ не найден."
end

-- Обработчик нажатия кнопки Enter
enterButton.MouseButton1Click:Connect(function()
    local inputKey = originalText
    
    local isValid, message = checkKeyValidity(inputKey)
    if isValid then
        SuccessSound:Play()
        Logined = true  -- Если ключ правильный, сохраняем состояние входа
    else
        ErrorSound:Play()
    end
    CreateNotification(message)
end)

-- Горячая клавиша для открытия интерфейса
local AtomKeybind = Instance.new("StringValue", script.Parent.Parent.Parent.Parent.Parent.MainPage.Page)
AtomKeybind.Name = "AtomKeybind"
AtomKeybind.Value = "RightAlt"

local function isTextBoxFocused()
    return UserInputService:GetFocusedTextBox() ~= nil
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not isTextBoxFocused() and input.KeyCode.Name == AtomKeybind.Value and not gameProcessedEvent then
        local KeyFrame = script.Parent.Parent.Parent.Parent
        local CheatPage = script.Parent.Parent.Parent.Parent.Parent.MainPage
        if not Logined then
            if Opened == false then
                Opened = true
                KeyFrame.Visible = true
                CheatPage.Visible = false
            else
                Opened = false
                KeyFrame.Visible = false
                CheatPage.Visible = false
            end
        else
            if Opened == false then
                Opened = true
                KeyFrame.Visible = false
                CheatPage.Visible = true
            else
                Opened = false
                KeyFrame.Visible = false
                CheatPage.Visible = false
            end
        end
    end        
end)

coroutine.wrap(CreateNotification)("Press RightAlt to open the interface!")
