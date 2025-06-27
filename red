-- Инициализация
local redstone = peripheral.wrap("back") -- Убедитесь, что компьютер поддерживает управление Redstone
if not redstone then
    print("Не удалось найти Redstone peripheral!")
    return
end

print("Скрипт запущен. Ожидание сигнала...")

while true do
    -- Получаем статус сигнала справа
    local rightSignal = redstone.getInput("right")
    
    -- Включаем или отключаем сигнал слева
    if rightSignal then
        redstone.setOutput("left", true)
        print("Сигнал включен слева.")
    else
        redstone.setOutput("left", false)
        print("Сигнал отключен слева.")
    end
    
    -- Задержка для снижения нагрузки
    sleep(0.1)
end
