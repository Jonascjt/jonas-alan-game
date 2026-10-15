require "palette"
require "sprites"

local jogador = {
    x=100,
    y=100,
    w=50,
    h=50,
    v=2
}

function loop(frame)
    
    for i = 1, #Palette do
        local color = Palette[i]
        ui.palset(i - 1, color)
    end
    if ui.btn(LEFT) then
        jogador.x = jogador.x - jogador.v
    end

    if ui.btn(RIGHT) then
        jogador.x = jogador.x + jogador.v
    end
    if ui.btn(UP) then
        jogador.y = jogador.y - jogador.v
    end

    if ui.btn(DOWN) then
        jogador.y = jogador.y + jogador.v
    end

    ui.cls(0)
    ui.rectfill(jogador.x, jogador.y, jogador.x+jogador.w, jogador.y+jogador.h,2)
end 