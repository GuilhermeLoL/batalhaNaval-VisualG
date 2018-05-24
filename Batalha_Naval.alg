algoritmo "Batalha Naval"
var
  mapa:vetor [1..10,1..10] de caracter
  tela:vetor [1..10,1..10] de caracter
  barco1:vetor [1..3,1..2] de inteiro
  barco2:vetor [1..3,1..2] de inteiro
  cruzador1:vetor [1..2,1..2] de inteiro
  cruzador2:vetor [1..2,1..2] de inteiro
  cruzador3:vetor [1..2,1..2] de inteiro
  teste:vetor [1..50,1..2] de inteiro
  x,l,c,poc,pol,tt,life,end,score,cont,start,z:inteiro
  nome:literal
  win,test:logico
  
//------------------------------------------------------------------------------
procedimento menu_art
inicio
  escreval("**********************************************************************************")
  escreval("        ______       _        _ _             _   _                  _   ")
  escreval("        | ___ \     | |      | | |           | \ | |                | |  ")
  escreval("        | |_/ / __ _| |_ __ _| | |__   __ _  |  \| | __ ___   ____ _| |  ")
  escreval("        | ___ \/ _` | __/ _` | | '_ \ / _` | | . ` |/ _` \ \ / / _` | |  ")
  escreval("        | |_/ / (_| | || (_| | | | | | (_| | | |\  | (_| |\ V / (_| | |  ")
  escreval("        \____/ \__,_|\__\__,_|_|_| |_|\__,_| \_| \_/\__,_| \_/ \__,_|_|  ")
  escreval("**********************************************************************************")
  escreval("                                                           Guilherme Beidaki Peres")
  escreval
  escreval
  escreval
  escreval
  escreva("                        DIGITE 1 PARA INICIAR O JOGO: ")
  leia(start)
fimprocedimento
//------------------------------------------------------------------------------
procedimento win_art
inicio
  escreval("**********************************************************************************")
  escreval("      $$\     $$\                         $$\      $$\                 ")
  escreval("      \$$\   $$  |                        $$ | $\  $$ |                ")
  escreval("       \$$\ $$  /$$$$$$\  $$\   $$\       $$ |$$$\ $$ |$$\ $$$$$$$\    ")
  escreval("        \$$$$  /$$  __$$\ $$ |  $$ |      $$ $$ $$\$$ |$$ |$$  __$$\   ")
  escreval("         \$$  / $$ /  $$ |$$ |  $$ |      $$$$  _$$$$ |$$ |$$ |  $$ |  ")
  escreval("          $$ |  $$ |  $$ |$$ |  $$ |      $$$  / \$$$ |$$ |$$ |  $$ |  ")
  escreval("          $$ |  \$$$$$$  |\$$$$$$  |      $$  /   \$$ |$$ |$$ |  $$ |  ")
  escreval("          \__|   \______/  \______/       \__/     \__|\__|\__|  \__|  ")
  escreval("**********************************************************************************")
fimprocedimento
//------------------------------------------------------------------------------
procedimento lose_art
inicio
  escreval("**********************************************************************************")
  escreval("  $$\     $$\                         $$\                                      ")
  escreval("  \$$\   $$  |                        $$ |                                     ")
  escreval("   \$$\ $$  /$$$$$$\  $$\   $$\       $$ |      $$$$$$\   $$$$$$$\  $$$$$$\    ")
  escreval("    \$$$$  /$$  __$$\ $$ |  $$ |      $$ |     $$  __$$\ $$  _____|$$  __$$\   ")
  escreval("     \$$  / $$ /  $$ |$$ |  $$ |      $$ |     $$ /  $$ |\$$$$$$\  $$$$$$$$ |  ")
  escreval("      $$ |  $$ |  $$ |$$ |  $$ |      $$ |     $$ |  $$ | \____$$\ $$   ____|  ")
  escreval("      $$ |  \$$$$$$  |\$$$$$$  |      $$$$$$$$\\$$$$$$  |$$$$$$$  |\$$$$$$$\   ")
  escreval("      \__|   \______/  \______/       \________|\______/ \_______/  \_______|  ")
  escreval("**********************************************************************************")
fimprocedimento
//------------------------------------------------------------------------------
procedimento easter_egg
inicio
  escreval
  escreval
  escreval
  escreval
  escreval
  escreval
  escreval
  escreval("**********************************************************************************")
  escreval("*                                                                                *")
  escreval("*  Criado por Guilherme Beidaki Peres                                            *")
  escreval("*                                                                                *")
  escreval("*  Engenharia de Software 1° Ano - Unicesumar - 2016                             *")
  escreval("*  Professor: Edson Alexandre Moreno - Algoritmos                                *")
  escreval("*                                                                                *")
  escreval("**********************************************************************************")
  escreval
  escreval
  escreval
  escreval
  escreval
  escreval
  escreval
fimprocedimento
//------------------------------------------------------------------------------
procedimento spawn_cruzador
inicio
  //Cruzadores
   para x de 1 ate 2 faca
    repita
      poc:=randi(11)
      pol:=randi(11)
      cruzador1[x,1]:=pol
      cruzador1[x,2]:=poc
    ate((poc<>0) e (pol<>0))
   se(mapa[pol,poc]="X") entao
     mapa[pol,poc]:="C"
       senao
         repita
           poc:=randi(11)
           pol:=randi(11)
           cruzador1[x,1]:=pol
           cruzador1[x,2]:=poc
        ate((poc<>0) e (pol<>0))
        se(mapa[pol,poc]="X") entao
          mapa[pol,poc]:="C"
        fimse
   fimse
   tt:=randi(2)
   se(tt=0) entao
     cruzador2[x,1]:=cruzador1[x,1]+1
     cruzador2[x,2]:=cruzador1[x,2]
     cruzador3[x,1]:=cruzador1[x,1]+2
     cruzador3[x,2]:=cruzador1[x,2]
     se(cruzador2[x,1]>9) entao
       cruzador2[x,1]:=cruzador1[x,1]-1
       cruzador3[x,1]:=cruzador1[x,1]-2
     fimse
     mapa[cruzador2[x,1],cruzador2[x,2]]:="C"
     mapa[cruzador3[x,1],cruzador3[x,2]]:="C"

       senao
         cruzador2[x,1]:=cruzador1[x,1]
         cruzador2[x,2]:=cruzador1[x,2]+1
         cruzador3[x,1]:=cruzador1[x,1]
         cruzador3[x,2]:=cruzador1[x,2]+2
         se(cruzador2[x,2]>9) entao
           cruzador2[x,2]:=cruzador1[x,2]-1
           cruzador3[x,2]:=cruzador1[x,2]-2
         fimse
         mapa[cruzador2[x,1],cruzador2[x,2]]:="C"
         mapa[cruzador3[x,1],cruzador3[x,2]]:="C"
   fimse
  fimpara
fimprocedimento
//------------------------------------------------------------------------------
procedimento spawn_barco
inicio
  //Barcos
   para x de 1 ate 3 faca
    repita
      poc:=randi(11)
      pol:=randi(11)
      barco1[x,1]:=pol
      barco1[x,2]:=poc
    ate((poc<>0) e (pol<>0))
   se(mapa[pol,poc]="X") entao
     mapa[pol,poc]:="B"
       senao
         repita
           poc:=randi(11)
           pol:=randi(11)
           barco1[x,1]:=pol
           barco1[x,2]:=poc
        ate((poc<>0) e (pol<>0))
        se(mapa[pol,poc]="X") entao
          mapa[pol,poc]:="B"
        fimse
   fimse
   tt:=randi(2)
   se(tt=0) entao
     barco2[x,1]:=barco1[x,1]+1
     barco2[x,2]:=barco1[x,2]
     se(barco2[x,1]>10) entao
       barco2[x,1]:=barco1[x,1]-1
     fimse
     mapa[barco2[x,1],barco2[x,2]]:="B"

       senao
         barco2[x,1]:=barco1[x,1]
         barco2[x,2]:=barco1[x,2]+1
         se(barco2[x,2]>10) entao
           barco2[x,2]:=barco1[x,2]-1
         fimse
         mapa[barco2[x,1],barco2[x,2]]:="B"
   fimse
  fimpara
fimprocedimento
//------------------------------------------------------------------------------
procedimento spawn_subs
inicio
  //Submarinos
  para x de 1 ate 4 faca
    repita
      poc:=randi(11)
      pol:=randi(11)
    ate((poc<>0) e (pol<>0))
   se(mapa[pol,poc]="X") entao
     mapa[pol,poc]:="S"
       senao
         repita
           poc:=randi(11)
           pol:=randi(11)
        ate((poc<>0) e (pol<>0))
        mapa[pol,poc]:="S"
   fimse
  fimpara
fimprocedimento
//------------------------------------------------------------------------------
inicio
  para l de 1 ate 10 faca
    para c de 1 ate 10 faca
      mapa[l,c]:="X"
    fimpara
  fimpara
  para l de 1 ate 10 faca
    para c de 1 ate 10 faca
      tela[l,c]:="X"
    fimpara
  fimpara
  spawn_cruzador
  spawn_barco
  spawn_subs
  life:=45
  win:=falso
  end:=0
  score:=0
  cont:=1
  menu_art
  escolha(start)
    caso 1
      limpatela
      escreva("Digite seu nome: ")
      leia(nome)
      repita
        limpatela
        escreval(nome,":",score)
        escreval
        escreval("Life:",life)
        escreval
        escreval("    1   2   3   4   5   6   7   8   9   10")
        z:=1
        para l de 1 ate 10 faca
          escreva(z:2,"  ")
          z:=z+1
          para c de 1 ate 10 faca
            escreva(tela[l,c]:4)
          fimpara
          escreval
        fimpara
        escreval
        repita
          escreva("Digite a linha para tentar destruir um inimigo: ")
          leia(pol)
          escreva("Digite uma coluna para tentar destruir um inimigo: ")
          leia(poc)
        ate((pol>0) e(pol<=10) e (poc>0) e (poc<=10))
        se(mapa[pol,poc]<>"X") entao
          end:=end+1
          score:=score+100
          se(mapa[pol,poc]="S") entao
            tela[pol,poc]:="S"
          fimse
          se(mapa[pol,poc]="B") entao
            tela[pol,poc]:="B"
          fimse
          se(mapa[pol,poc]="C") entao
            tela[pol,poc]:="C"
          fimse
            senao
              tela[pol,poc]:="A"
              life:=life-1
        fimse
        se(end=16) entao
          win:=verdadeiro
          life:=0
        fimse
      ate(life=0)
      se(win=verdadeiro) entao
        limpatela
        win_art
        escreval
        escreval
        escreval
        escreval
        score:=score*life
        escreval("Score:",score)
          senao
            limpatela
            lose_art
            escreval
            escreval
            escreval
            escreval
            escreval("Score:",score)
      fimse
    caso 2
      repita
        limpatela
        escreval("Modo Programador!!!")
        escreval
        escreval
        escreval("    1   2   3   4   5   6   7   8   9   10")
        z:=1
        para l de 1 ate 10 faca
          escreva(z:2,"  ")
          z:=z+1
          para c de 1 ate 10 faca
            escreva(mapa[l,c]:4)
          fimpara
          escreval
        fimpara
        escreval
        repita
          escreva("Digite a linha para tentar destruir um inimigo: ")
          leia(pol)
          escreva("Digite uma coluna para tentar destruir um inimigo: ")
          leia(poc)
        ate((pol>0) e(pol<=10) e (poc>0) e (poc<=10))
        se(mapa[pol,poc]<>"X") entao
          end:=end+1
          score:=score+100
          se(mapa[pol,poc]="S") entao
            tela[pol,poc]:="S"
          fimse
          se(mapa[pol,poc]="B") entao
            tela[pol,poc]:="B"
          fimse
          se(mapa[pol,poc]="C") entao
            tela[pol,poc]:="C"
          fimse
            senao
              tela[pol,poc]:="A"
              life:=life-1
        fimse
        se(end=16) entao
          win:=verdadeiro
          life:=0
        fimse
      ate(life=0)
      se(win=verdadeiro) entao
        limpatela
        win_art
        escreval
        escreval
        escreval
        escreval
        score:=score*life
        escreval("Score:",score)
          senao
            limpatela
            lose_art
            escreval
            escreval
            escreval
            escreval
            escreval("Score:",score)
      fimse
    caso 2016
      limpatela
      easter_egg
    caso 0
      x:=0
    outrocaso
      escreval
      escreval("Comando Inválido")
      escreval
  fimescolha
fimalgoritmo
