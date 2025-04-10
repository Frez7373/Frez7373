-- Get the peripheral monitor
local monitor = peripheral.find("monitor")
if not monitor then
    print("Monitor not found!")
    return
end

-- Monitor setup
monitor.setTextScale(1)
monitor.clear()

-- Function to draw the calendar
local function drawCalendar()
    -- Get the current day and month
    local day = os.day()
    local totalDaysInMonth = 30 -- Minecraft months are fixed at 30 days
    local month = math.ceil(day / totalDaysInMonth)
    local dayOfMonth = day % totalDaysInMonth
    if dayOfMonth == 0 then dayOfMonth = totalDaysInMonth end

    -- Clear the monitor and draw the calendar
    monitor.clear()
    monitor.setCursorPos(1, 1)
    monitor.write(string.format("Month: %d", month))
    monitor.setCursorPos(1, 2)
    monitor.write(string.format("Day: %d", dayOfMonth))
end

-- Refresh the calendar periodically
while true do
    drawCalendar()
    sleep(10) -- Update every 10 seconds
end
