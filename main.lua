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

function colisao (x1, y1, w1, h1, x2, y2, w2, h2)
    return x1, < x2 + w2 and
        x1 + w1 > x2 and
        y1 < y2 + h2 and
        y1 + h1 > y2
end


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
        local pegou_letra = colisao(jogador.x, jogador.y, jogador.w, jogador.h,
                                    letra.x, letra.y, 8,8)

        if pegou_letra then
            table.remove(letras_tela, i)
                                        
        if letra.y > TELA_ALTURA then
            table.remove(letras_tela,i)
        end
    end


    ui.cls(0)
    ui.rectfill(jogador.x, jogador.y, jogador.x+jogador.w, jogador.y+jogador.h,2)
    for indice, letra in ipairs(letras_tela) do
        ui.print(letra.char, letra.x, letra.y,4)
    end
end 