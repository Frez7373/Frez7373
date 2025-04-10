-- Убедитесь, что модем активирован
if not peripheral.find("modem") then
    error("Не найден модем. Подключите модем и повторите попытку.")
end

-- Открываем Rednet
rednet.open(peripheral.find("modem"))

-- Функция для запроса информации о блоке
local function requestBlockInfo(targetID)
    rednet.send(targetID, "REQUEST_BLOCK_INFO")
    local senderID, message, protocol = rednet.receive("BLOCK_INFO", 5)
    
    if senderID and message then
        return message
    else
        return nil, "Не удалось получить информацию от блока."
    end
end

-- Ввод ID целевого компьютера
print("Введите ID целевого блока:")
local targetID = tonumber(read())

if targetID then
    local info, err = requestBlockInfo(targetID)
    if info then
        print("Информация о блоке:")
        for k, v in pairs(info) do
            print(k .. ": " .. tostring(v))
        end
    else
        print("Ошибка: " .. err)
    end
else
    print("Неверный ID блока.")
end

-- Закрываем Rednet (по желанию)
-- rednet.close()
