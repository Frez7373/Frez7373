-- Settings
local inputSide = "left"   -- Сторона, откуда поступает сигнал
local outputSide = "right" -- Сторона, куда передается сигнал

-- Main loop
while true do
  if redstone.getInput(inputSide) then
    redstone.setOutput(outputSide, true)
    sleep(1)
    redstone.setOutput(outputSide, false)
    sleep(1)
  else
    redstone.setOutput(outputSide, false)
    sleep(0.1) -- Короткая пауза для оптимизации
  end
end
