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

local letras_tela = {}
local alfabeto = { "A", "B", "C"}

function loop(frame)
    
    for i = 1, #Palette do
        local color = Palette[i]
        ui.palset(i - 1, color)
    end

    if frame % 30 == 0 then
        local indice_letra = math.random(1, #alfabeto)

        local nova_letra = {
            char = alfabeto[indice_letra],
            x = math.random(0, TELA_LARGURA - 10),
            y= -20,
            velocidade_queda = math.random(1,3)

        }
        table.insert(letras_tela,nova_letra)
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

    for i = #letras_tela, 1, -1 do
        local letra = letras_tela[i]
        letra.y = letra.y +letra.velocidade_queda
        if letra.y > TELA_ALTURA then
            table.remove(letras_tela,i)
        end
    end


    ui.cls(0)
    ui.rectfill(jogador.x, jogador.y, jogador.x+jogador.w, jogador.y+jogador.h,2)
    for indice, letra in inpairs(letras_tela) do
        ui.print(letra.chart, letra.x, letra.y,4)
    end
end 