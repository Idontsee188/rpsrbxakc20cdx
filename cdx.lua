-- Сервисы Roblox
local UserInputService = game:GetService("UserInputService")

-- UI элементы
local textBox = script.Parent.Key -- TextBox, где вводится ключ
local enterButton = script.Parent.Enter -- Кнопка Enter для проверки ключа
local originalText = "" -- Хранение оригинального текста

-- Звуки
local ErrorSound = script.Error
local SuccessSound = script.Success

-- Ключевая база данных с сгенерированными ключами
local keysDatabase = {
    trial = {
        lastUpdate = "2024-10-01",  -- Дата последнего обновления
        keys = {
            { key = "TRIAL-1A2B3C4D5E", expirationDays = 3, banned = false },
            { key = "TRIAL-6F7E8D9C2A", expirationDays = 3, banned = false },
            { key = "TRIAL-7B8A9C1D3E", expirationDays = 3, banned = false },
            { key = "TRIAL-3C4D5E6F7A", expirationDays = 3, banned = false },
            { key = "TRIAL-8A7B6C5D9E", expirationDays = 3, banned = false },
            { key = "TRIAL-2F4C7B1D8A", expirationDays = 3, banned = false },
            { key = "TRIAL-9D8A5C7B4F", expirationDays = 3, banned = false },
            { key = "TRIAL-5A6B9E7C1D", expirationDays = 3, banned = false },
            { key = "TRIAL-4D6F9B8A2C", expirationDays = 3, banned = false },
            { key = "TRIAL-5B4E9C3F82", expirationDays = 3, banned = true }, -- Забаненный ключ
            { key = "TRIAL-A9B8C7D6E5", expirationDays = 3, banned = false },
            { key = "TRIAL-F6E7D9C8B1", expirationDays = 3, banned = false },
            { key = "TRIAL-7A9C8B6E3F", expirationDays = 3, banned = false },
            { key = "TRIAL-1C2E5A7B9D", expirationDays = 3, banned = false },
            { key = "TRIAL-9E7A6B5C4D", expirationDays = 3, banned = false }
        }
    },
    weekly = {
        lastUpdate = "2024-10-01",
        keys = {
            { key = "WEEK-1A2B3C4D5E", expirationDays = 7, banned = false },
            { key = "WEEK-6F7E8D9C2A", expirationDays = 7, banned = false },
            { key = "WEEK-7B8A9C1D3E", expirationDays = 7, banned = false },
            { key = "WEEK-3C4D5E6F7A", expirationDays = 7, banned = false },
            { key = "WEEK-8A7B6C5D9E", expirationDays = 7, banned = false },
            { key = "WEEK-2F4C7B1D8A", expirationDays = 7, banned = false },
            { key = "WEEK-9D8A5C7B4F", expirationDays = 7, banned = false },
            { key = "WEEK-5A6B9E7C1D", expirationDays = 7, banned = false },
            { key = "WEEK-4D6F9B8A2C", expirationDays = 7, banned = false },
            { key = "WEEK-5B4E9C3F82", expirationDays = 7, banned = false },
            { key = "WEEK-A9B8C7D6E5", expirationDays = 7, banned = false },
            { key = "WEEK-F6E7D9C8B1", expirationDays = 7, banned = false },
            { key = "WEEK-7A9C8B6E3F", expirationDays = 7, banned = false },
            { key = "WEEK-1C2E5A7B9D", expirationDays = 7, banned = false },
            { key = "WEEK-9E7A6B5C4D", expirationDays = 7, banned = false }
        }
    },
    monthly = {
        lastUpdate = "2024-10-01",
        keys = {
            { key = "MONTH-1A2B3C4D5E", expirationDays = 30, banned = false },
            { key = "MONTH-6F7E8D9C2A", expirationDays = 30, banned = false },
            { key = "MONTH-7B8A9C1D3E", expirationDays = 30, banned = false },
            { key = "MONTH-3C4D5E6F7A", expirationDays = 30, banned = false },
            { key = "MONTH-8A7B6C5D9E", expirationDays = 30, banned = false },
            { key = "MONTH-2F4C7B1D8A", expirationDays = 30, banned = false },
            { key = "MONTH-9D8A5C7B4F", expirationDays = 30, banned = false },
            { key = "MONTH-5A6B9E7C1D", expirationDays = 30, banned = false },
            { key = "MONTH-4D6F9B8A2C", expirationDays = 30, banned = false },
            { key = "MONTH-5B4E9C3F82", expirationDays = 30, banned = false },
            { key = "MONTH-A9B8C7D6E5", expirationDays = 30, banned = false },
            { key = "MONTH-F6E7D9C8B1", expirationDays = 30, banned = false },
            { key = "MONTH-7A9C8B6E3F", expirationDays = 30, banned = false },
            { key = "MONTH-1C2E5A7B9D", expirationDays = 30, banned = false },
            { key = "MONTH-9E7A6B5C4D", expirationDays = 30, banned = false }
        }
    },
    threeMonths = {
        lastUpdate = "2024-10-01",
        keys = {
            { key = "3MO-1A2B3C4D5E", expirationDays = 90, banned = false },
            { key = "3MO-6F7E8D9C2A", expirationDays = 90, banned = false },
            { key = "3MO-7B8A9C1D3E", expirationDays = 90, banned = false },
            { key = "3MO-3C4D5E6F7A", expirationDays = 90, banned = false },
            { key = "3MO-8A7B6C5D9E", expirationDays = 90, banned = false },
            { key = "3MO-2F4C7B1D8A", expirationDays = 90, banned = false },
            { key = "3MO-9D8A5C7B4F", expirationDays = 90, banned = false },
            { key = "3MO-5A6B9E7C1D", expirationDays = 90, banned = false },
            { key = "3MO-4D6F9B8A2C", expirationDays = 90, banned = false },
            { key = "3MO-5B4E9C3F82", expirationDays = 90, banned = false },
            { key = "3MO-A9B8C7D6E5", expirationDays = 90, banned = false },
            { key = "3MO-F6E7D9C8B1", expirationDays = 90, banned = false },
            { key = "3MO-7A9C8B6E3F", expirationDays = 90, banned = false },
            { key = "3MO-1C2E5A7B9D", expirationDays = 90, banned = false },
            { key = "3MO-9E7A6B5C4D", expirationDays = 90, banned = false }
        }
    },
    yearly = {
        lastUpdate = "2024-10-01",
        keys = {
            { key = "YEAR-1A2B3C4D5E", expirationDays = 365, banned = false },
            { key = "YEAR-6F7E8D9C2A", expirationDays = 365, banned = false },
            { key = "YEAR-7B8A9C1D3E", expirationDays = 365, banned = false },
            { key = "YEAR-3C4D5E6F7A", expirationDays = 365, banned = false },
            { key = "YEAR-8A7B6C5D9E", expirationDays = 365, banned = false },
            { key = "YEAR-2F4C7B1D8A", expirationDays = 365, banned = false },
            { key = "YEAR-9D8A5C7B4F", expirationDays = 365, banned = false },
            { key = "YEAR-5A6B9E7C1D", expirationDays = 365, banned = false },
            { key = "YEAR-4D6F9B8A2C", expirationDays = 365, banned = false },
            { key = "YEAR-5B4E9C3F82", expirationDays = 365, banned = false },
            { key = "YEAR-A9B8C7D6E5", expirationDays = 365, banned = false },
            { key = "YEAR-F6E7D9C8B1", expirationDays = 365, banned = false },
            { key = "YEAR-7A9C8B6E3F", expirationDays = 365, banned = false },
            { key = "YEAR-1C2E5A7B9D", expirationDays = 365, banned = false },
            { key = "YEAR-9E7A6B5C4D", expirationDays = 365, banned = false }
        }
    }
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
