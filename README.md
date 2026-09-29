# UALGANOID

Um clone do clássico **Arkanoid / Breakout**, desenvolvido em **Processing** (Java) como projeto em dupla para a cadeira de **Laboratório de Programação** da **Universidade do Algarve (UAlg)**, em 2024.

> O projeto foi desenvolvido em 2024 sem controle de versão. Este repositório foi publicado depois, por isso todo o histórico está num único commit.

## Funcionalidades

- **5 níveis** carregados a partir de arquivos de texto (`level_N.lvl`), escolhidos pelas teclas `1` a `5`
- **9 tipos de bloco**, cada um com cor e pontuação próprias:

  | Código | Bloco | Pontos | Comportamento |
  |:---:|---|:---:|---|
  | 1 | Branco | 50 | quebra com 1 batida |
  | 2 | Laranja | 60 | quebra com 1 batida |
  | 3 | Ciano | 70 | quebra com 1 batida |
  | 4 | Verde | 80 | quebra com 1 batida |
  | 5 | Vermelho | 90 | quebra com 1 batida |
  | 6 | Azul | 100 | quebra com 1 batida |
  | 7 | Roxo | 110 | quebra com 1 batida |
  | 8 | Prata | 200 | racha na 1ª batida, quebra na 2ª |
  | 9 | Ouro | — | indestrutível |

- **Física de colisão**: calcula o ponto do bloco mais próximo da bola para saber qual lado foi atingido e inverter o eixo certo da velocidade
- **Deflexão na raquete**: o ângulo de saída da bola depende de onde ela bate na raquete (até 45°)
- **Lançamento com ângulo**: mover a raquete no momento do lançamento faz a bola sair a 45°
- **Vidas e pontuação**: 3 vidas, pontuação na tela, telas de *Victory!* e *Game Over!*
- **Efeitos sonoros** (colisão, vitória e game over) com a biblioteca Minim
- Imagem de fundo com tema espacial

## Controles

| Tecla | Ação |
|---|---|
| `1` – `5` | Carregar um nível |
| `←` / `→` | Mover a raquete |
| `Espaço` | Lançar a bola |

## Como executar

1. Instale o [Processing 4](https://processing.org/download).
2. No Processing, vá em **Sketch → Import Library → Manage Libraries** e instale a biblioteca **Minim**.
3. Clone o repositório:
   ```bash
   git clone https://github.com/FelipeVassiliadis/UALGNOID.git
   ```
4. Abra o arquivo `ualg.pde` no Processing e clique em **Run** (▶).
   - Se o Processing pedir para mover o arquivo para uma pasta com o mesmo nome do sketch, aceite, ou renomeie a pasta para `ualg`.
5. Pressione uma tecla de `1` a `5` para escolher o nível e `Espaço` para começar.

## Estrutura do projeto

```
├── ualg.pde          # Sketch principal: constantes, setup(), draw(), HUD, vitória e game over
├── ball.pde          # Classe Ball: movimento, colisões com paredes, teto, raquete e chão
├── Pad.pde           # Classe Pad: movimento e limites da raquete
├── Block.pde         # Classe Block: detecção de colisão, tipos de bloco, pontuação
├── Levels.pde        # Classe Levels: carrega os .lvl, conta blocos, mostra o nível
├── PowerUp.pde       # Classe PowerUp (iniciada, ainda não integrada ao jogo)
├── level_1..5.lvl    # Mapas dos níveis (15 linhas × 13 colunas, códigos de 0 a 9)
├── *.mp3             # Efeitos sonoros
└── spaceImage*.jpg   # Imagens de fundo
```

### Formato dos níveis

Cada arquivo `.lvl` é uma grade de 15 × 13 números separados por vírgula. `0` é um espaço vazio e `1` a `9` são os tipos de bloco da tabela acima. Exemplo (`level_1.lvl`):

```
0,0,5,5,5,5,5,5,5,5,5,0,0
0,0,4,4,4,4,4,4,4,4,4,0,0
0,0,3,3,3,3,3,3,3,3,3,0,0
...
```

Dá para criar níveis novos editando esses arquivos.

## Tecnologias

- [Processing](https://processing.org/) (Java)
- [Minim](https://code.compartmental.net/minim/) para áudio

## Autores

Projeto em dupla para a cadeira de Laboratório de Programação, UAlg, 2024.

- **Felipe Vassiliadis** — [@FelipeVassiliadis](https://github.com/FelipeVassiliadis)
- **[Nome do colega de dupla]**
