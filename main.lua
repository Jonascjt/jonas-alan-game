require "palette"
require "sprites"

local jogador = {
    x=100,
    y=100,
    w=50,
    h=50,
    v=2
}

local TELA_LARGURA = 480
local TELA_ALTURA = 270



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
    jogador.x = math.max(0, math.min(jogador.x, TELA_LARGURA-jogador.w))
    jogador.y = math.max(0, math.min(jogador.y, TELA_ALTURA-jogador.h))
    ui.cls(0)
    ui.rectfill(jogador.x, jogador.y, jogador.x+jogador.w, jogador.y+jogador.h,2)
end 