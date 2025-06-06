-- Инициализация компонентов
local term = require("term")
local colors = require("colors")

-- Настройка экрана
local function drawButton(x, y, width, height, text, bgColor, textColor)
    term.setBackgroundColor(bgColor)
    term.setTextColor(textColor)
    for i = 0, height - 1 do
        term.setCursorPos(x, y + i)
        term.write(string.rep(" ", width))
    end
    term.setCursorPos(x + math.floor((width - #text) / 2), y + math.floor(height / 2))
    term.write(text)
end

local function drawUI()
    term.clear()
    drawButton(10, 5, 20, 3, "Open Door", colors.green, colors.white)
    drawButton(10, 10, 20, 3, "Close Door", colors.red, colors.white)
end

local function isInButton(x, y, bx, by, bw, bh)
    return x >= bx and x < bx + bw and y >= by and y < by + bh
end

-- Основной цикл
local function main()
    drawUI()

    while true do
        local event, side, x, y = os.pullEvent("monitor_touch")

        -- Проверяем нажатие на кнопку "Open Door"
        if isInButton(x, y, 10, 5, 20, 3) then
            shell.run("ondoor") -- Запуск приложения ondoor

        -- Проверяем нажатие на кнопку "Close Door"
        elseif isInButton(x, y, 10, 10, 20, 3) then
            shell.run("offdoor") -- Запуск приложения offdoor
        end
    end
end

main()
