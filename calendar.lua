-- Получаем периферийное устройство монитора
local monitor = peripheral.find("monitor")
if not monitor then
    print("Монитор не найден!")
    return
end

-- Настройка монитора
monitor.setTextScale(1)
monitor.clear()

-- Определяем дни недели
local daysOfWeek = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"}

-- Функция для определения дня недели
local function getDayOfWeek(day)
    return daysOfWeek[(day - 1) % 7 + 1]
end

-- Функция для отображения календаря
local function drawCalendar()
    while true do
        -- Получаем текущий день в игре
        local day = os.day()

        -- Определяем текущий месяц и день месяца
        local totalDaysInMonth = 30 -- Каждый месяц содержит 30 дней
        local month = math.ceil(day / totalDaysInMonth)
        local dayOfMonth = day % totalDaysInMonth
        if dayOfMonth == 0 then dayOfMonth = totalDaysInMonth end

        -- Вычисляем день недели
        local dayOfWeek = getDayOfWeek(day)

        -- Очищаем монитор и выводим данные
        monitor.clear()
        monitor.setCursorPos(1, 1)
        monitor.write(string.format("Month: %d", month))
        monitor.setCursorPos(1, 2)
        monitor.write(string.format("Day: %d (%s)", dayOfMonth, dayOfWeek))

        -- Обновляем каждые 10 секунд
        sleep(10)
    end
end

-- Запускаем отображение календаря
drawCalendar()
