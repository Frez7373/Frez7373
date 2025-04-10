-- Get the peripheral monitor
local monitor = peripheral.find("monitor")
if not monitor then
    print("Monitor not found!")
    return
end

-- Monitor setup
monitor.setTextScale(2)
monitor.clear()

-- Function to display the clock
local function displayClock()
    while true do
        -- Get the current time in HH:MM:SS format
        local time = textutils.formatTime(os.time(), true)

        -- Clear the monitor and display the time
        monitor.clear()
        monitor.setCursorPos(1, 1)
        monitor.write("Current Time:")
        monitor.setCursorPos(1, 2)
        monitor.write(time)

        -- Delay for update
        sleep(1)
    end
end

-- Run the clock
displayClock()
