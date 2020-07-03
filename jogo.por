programa
{
	//Professor, nao estou conseguindo colocar acento!!
	inclua biblioteca Tipos --> tp
	inclua biblioteca Util --> ut
	//define a vez de quem
	inteiro vezDeQuem = 0
	
	//posiçao das cartas - O numero -1 e usado como um auxiliar para a condiçao
	inteiro cartasJogador[6] = {-1, -1, -1, -1, -1, -1}
	inteiro cartasPc[6] = {-1, -1, -1, -1, -1, -1}

	//define alguns atributos possiveis para o computador sortear
	inteiro atributosPossiveisPc[3] = {-1, -1, -1}
	
	//carta do topo
	inteiro cartaTopo
	
	//resposta da pergunta do atributo
	inteiro resposta = 0
	
	//variavel para comparar os resultados
	real auxCompareJogador
	real auxComparePc
	
	//auxiliares
	inteiro aux
	inteiro cartaRecebida

	//variavel para mostrar o atributo
	cadeia auxAtributo
	
	//carta impressa
	cadeia cartaImpressa[8][2] = {{"Nome: ", ""},
							{"Ranking: ", ""},
							{"Velocidade Maxima: ", ""},
							{"Aceleraçao: ", ""},
							{"Cavalos: ", ""},
							{"Cilindradas: ", ""},
							{"Peso: ", ""},
							{"=====================", ""}}

	//numero de cartas na mao
	inteiro cartasNaMaoJogador=3
	inteiro cartasNaMaoJogadorPc=3

	//Vetor que auxilia as cartas a serem distribuidas
	inteiro cartasPossiveis[21] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20} 

	//variaveis indices para os loops
	inteiro i, j
	//Define as cartas
	cadeia carros[21][7] = { 
										  //tipo/VelMax/0-100/cavalos/cilindradas/peso
			{"Mitsubishi Lancer 2014",             "A", "198", "10.7", "160", "1998", "1360"},
			{"Mitsubishi Pajero 2016",             "A", "117", "13.9", "180", "3200", "2070"},
			{"Honda Civic SI 2015",                "A", "231", "7.9",  "206", "2354", "1359"},
			{"Honda City 2015",                    "A", "176", "11.3", "116", "1497", "1126"},
			{"GM Vectra 2011",                     "A", "197", "10.2", "140", "2000", "1268"},
			{"VW Gol GTI 1994",                    "B", "185", "8.8",  "120", "1984", "1025"},
			{"Fiat Doblò 2009",                    "B", "175", "11.6", "132", "1747", "1338"},
			{"GM Celta 2008",                      "B", "157", "13.0", "70",  "999",  "890" },
			{"GM Monza 1996",                      "B", "172", "14.6", "110", "1999", "1105"},
			{"Fiat Idea 2008",                     "B", "182", "10.9", "114", "1796", "1305"},
            	{"VW Parati 1990",                     "C", "169", "10.3", "96",  "1781", "1035"},
            	{"Fiat Palio 2002",                    "C", "183", "11.0", "106", "1580", "1010"},
            	{"GM Corsa 1995",                      "C", "192", "9.8",  "108", "1598", "945" },
            	{"GM Kadett 1998",                     "C", "181", "11.9", "109", "1997", "1050"},
            	{"Ford Fiesta 1998",                   "C", "178", "11.4", "89",  "1388", "1009"},
            	{"VW fusca 1969",                      "D", "105", "45.0", "46",  "1288", "780" },
            	{"Fiat 147 1979",                      "D", "139", "18.6", "61",  "1297", "810" },
            	{"VW Kombi 1987",                      "D", "108", "57.8", "50",  "1588", "1305"},
            	{"Gurgel BR-800 1989",                 "D", "107", "43.5", "32",  "792",  "634" },
            	{"GM Chevette 1973",                   "D", "135", "19.1", "68",  "1398", "870" },
            	{"SUPER TRUNFO UNO C/ ESCADA NO TETO", "S", "184", "11.2", "75",  "998",  "1200" }}

	//Embaralha as cartas possiveis
	funcao embaralhar() {
		para (i = 0; i < 21; i++) {
			inteiro r = ut.sorteia(0, 20)
			aux = cartasPossiveis[i]
			cartasPossiveis[i] = cartasPossiveis[r]
			cartasPossiveis[r] = aux
		}
	}

	//distribue as cartas para cada jogador
	funcao distribuir_cartas() {
		para (i = 0; i < 3; i++) {
			cartasJogador[i] = cartasPossiveis[i]
		}
		i = 0
		para (j = 17; j < 20; j++) {
			cartasPc[i] = cartasPossiveis[j]
			i++
		}
	}

	//pega os dados e imprime a carta do jogador
	funcao vez_jogador() {
		imprimir_carta_jogador()
		escreva("Escolha o atributo:\n1 - Velocidade Maxima\n2 - Aceleraçao\n3 - Cavalos\n4 - Cilindros\n5 - Peso\n--------> ")
		i = 0
		faca {
			leia(resposta)
			se ((resposta == 1) ou (resposta == 2) ou (resposta == 3) ou (resposta == 4) ou (resposta == 5)) {
				i = 1
			} senao {
				escreva("Digite apenas numeros de 1 a 5 --> ")
			}
		} enquanto (i != 1)
		
	}

	//pega os dados e imprime a carta do pc
	funcao vez_pc() {		
		imprimir_carta_pc()
	}

	//embaralha os atributos que o pc vai usar
	funcao embaralhar_atributos() {
		para (i = 0; i < 3; i++) {
			inteiro r = ut.sorteia(0, 2)
			aux = atributosPossiveisPc[i]
			atributosPossiveisPc[i] = atributosPossiveisPc[r]
			atributosPossiveisPc[r] = aux
		}
	}

	//define os atributos que vao ser mostrados
	funcao mostrar_atributo(inteiro atributo) {
		escolha (atributo) {
			caso 1:
				auxAtributo = "VELOCIDADE MAXIMA"
				pare
			caso 2:
				auxAtributo = "0 - 100"
				pare
			caso 3:
				auxAtributo = "CAVALOS"
				pare
			caso 4:
				auxAtributo = "CILINDRADAS"
				pare
			caso 5:
				auxAtributo = "PESO"
				pare
		}
	}
	
	//escolhe o atributo baseado no melhor atributo da carta ja pre-definido
	funcao escolher_carta_pc() {
		escolha (cartasPc[0]) {
			caso 0:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 3
				atributosPossiveisPc[2] = 4
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 1:
				atributosPossiveisPc[0] = 2
				atributosPossiveisPc[1] = 3
				atributosPossiveisPc[2] = 4
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 2:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 2
				atributosPossiveisPc[2] = 3
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 3:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 4
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 4:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 3
				atributosPossiveisPc[2] = 4
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 5:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 2
				atributosPossiveisPc[2] = 4
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 6:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 2
				atributosPossiveisPc[2] = 3
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 7:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 2
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 8:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 3
				atributosPossiveisPc[2] = 4
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 9:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 2
				atributosPossiveisPc[2] = 4
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 10:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 2
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 11:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 2
				atributosPossiveisPc[2] = 4
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 12:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 2
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 13:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 4
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 14:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 2
				atributosPossiveisPc[2] = 4
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 15:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 4
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 16:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 4
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 17:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 4
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 18:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 3
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 19:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 4
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				resposta = atributosPossiveisPc[0]
				mostrar_atributo(resposta)
				escreva("\nO jogador escolheu o atributo ", auxAtributo)
				pare
			caso 20:
				atributosPossiveisPc[0] = 1
				atributosPossiveisPc[1] = 2
				atributosPossiveisPc[2] = 5
				embaralhar_atributos()
				escreva("\nO oponente tem o super trunfo")
				se (carros[cartasJogador[0]][1] == "A") {
					resposta = atributosPossiveisPc[0]
					mostrar_atributo(resposta)
					escreva("\nO jogador escolheu o atributo ", auxAtributo, "\n")
				} senao {
					escreva("O oponente tem o super trunfo")
					escreva("Voce perdeu a rodada porque sua carta tem ranking menor que A :(")
					pc_ganhou()
				}
				pare
			}
	}

	//quanto o jogador ganha a rodada
	funcao jogador_ganhou() {
		aux = cartasJogador[0]
		cartaRecebida = cartasPc[0]

		//shift-left carta do jogador
		para (i = 0; i < 5; i++) {
			cartasJogador[i] = cartasJogador[i + 1]
		}

		//recebe a carta do oponente e coloca na parte de tras da mao
		para (i = 0; i < 5; i++) {
			se (cartasJogador[i] == -1) {
				cartasJogador[i] = cartaRecebida
				cartasJogador[i + 1] = aux
				i = 5
			}
		}
		
		//Shift-left carta do oponente
		para (i = 0; i < 5; i++) {
			cartasPc[i] = cartasPc[i + 1]
		}
		
		cartasNaMaoJogador = cartasNaMaoJogador + 1
		cartasNaMaoJogadorPc = cartasNaMaoJogadorPc - 1
		
		vezDeQuem = 0
	}

	//quanto o pc ganha a rodada
	funcao pc_ganhou() {
		aux = cartasPc[0]
		cartaRecebida = cartasJogador[0]

		//shift-left carta jogador
		para (i = 0; i < 5; i++) {
			cartasPc[i] = cartasPc[i + 1]
		}
		

		//recebe a carta do jogador e coloca na parte de tras da mao
		para (i = 0; i < 5; i++) {
			se (cartasPc[i] == -1) {
				cartasPc[i] = cartaRecebida
				cartasPc[i + 1] = aux
				i = 5
			}
		}
		
		//Shift-left carta do jogador
		para (i = 0; i < 3; i++) {
			cartasJogador[i] = cartasJogador[i + 1]
		}
		cartasNaMaoJogador = cartasNaMaoJogador - 1
		cartasNaMaoJogadorPc = cartasNaMaoJogadorPc + 1

		vezDeQuem = 1
	}

	//imprime a carta do pc no console
	funcao imprimir_carta_pc() {
		cartaTopo = cartasPc[0]
		
		cartaImpressa[0][1] = carros[cartaTopo][0]
		cartaImpressa[1][1] = carros[cartaTopo][1]
		cartaImpressa[2][1] = carros[cartaTopo][2] + "km/h"
		cartaImpressa[3][1] = carros[cartaTopo][3] + "s"
		cartaImpressa[4][1] = carros[cartaTopo][4] + "cv"
		cartaImpressa[5][1] = carros[cartaTopo][5] + "cc"
		cartaImpressa[6][1] = carros[cartaTopo][6] + "kg"
		escreva("======Carta PC=======\n")
		
		para (i = 0; i < 8; i++) {
			para (j = 0; j < 2; j++) {
				escreva(cartaImpressa[i][j])
			}
			escreva("\n")
		}
	}
	
	//imprime a carta do jogador no console
	funcao imprimir_carta_jogador() {
		cartaTopo = cartasJogador[0]
		
		cartaImpressa[0][1] = carros[cartaTopo][0]
		cartaImpressa[1][1] = carros[cartaTopo][1]
		cartaImpressa[2][1] = carros[cartaTopo][2] + "km/h"
		cartaImpressa[3][1] = carros[cartaTopo][3] + "s"
		cartaImpressa[4][1] = carros[cartaTopo][4] + "cv"
		cartaImpressa[5][1] = carros[cartaTopo][5] + "cc"
		cartaImpressa[6][1] = carros[cartaTopo][6] + "kg"
		escreva("======Sua carta======\n")
		
		para (i = 0; i < 8; i++) {
			para (j = 0; j < 2; j++) {
				escreva(cartaImpressa[i][j])
			}
			escreva("\n")
		}
	}

	//se o jogador estiver com o super trundo
	funcao jogar_super_trunfo() {
		imprimir_carta_jogador()
		
		se (carros[cartasPc[0]][1] == "A") {
			escreva("O oponente tem uma carta nivel \"A\" ")
			escreva("\nEscolha o atributo:\n1 - Velocidade Maxima\n2 - Aceleraçao\n3 - Cavalos\n4 - Cilindros\n5 - Peso\n--------> ")
			para (i = 0; i != 1; i = 0) {
			leia(resposta)
			se (resposta != 1 ou resposta != 2 ou resposta != 3 ou resposta != 4 ou resposta != 5) {
				escreva("Digite apenas numeros de 1 a 5")
			} senao {
				i = 1
			}
				quem_ganhou(resposta)
			}
		} senao {
			escreva("\nVoce ganhou a rodada!")
			jogador_ganhou()
		}
	}

	//se o pc estiver com o super trunfo
	funcao jogar_super_trunfo_pc() {
		atributosPossiveisPc[0] = 1
		atributosPossiveisPc[1] = 2
		atributosPossiveisPc[2] = 5
		embaralhar_atributos()
		escreva("O oponente tem o super trunfo\n")
		imprimir_carta_pc()
	}
	
	//verifica quem granhou a rodada
	funcao quem_ganhou(inteiro resp) {
		para (i = 0; i < 1; i++) { 
			escolha (resp) {
				caso 1:
					auxCompareJogador = tp.cadeia_para_real((carros[cartasJogador[0]][2]))
					auxComparePc = tp.cadeia_para_real((carros[cartasPc[0]][2]))

					se (auxCompareJogador > auxComparePc) {
						escreva("\nVoce ganhou a rodada!")
						escreva("\nSeu atributo --> ", carros[cartasJogador[0]][2], "km/h | ", carros[cartasPc[0]][2], "km/h <-- Atributo Pc")
						ut.aguarde(4000)
						jogador_ganhou()
					} senao {
						escreva("\nVoce perdeu a rodada :(")
						escreva("\nSeu atributo --> ", carros[cartasJogador[0]][2], "km/h | ", carros[cartasPc[0]][2], "km/h <-- Atributo Pc")
						ut.aguarde(4000)
						pc_ganhou()
					}
					i = 1
					pare
				caso 2:
					auxCompareJogador = tp.cadeia_para_real((carros[cartasJogador[0]][3]))
					auxComparePc = tp.cadeia_para_real((carros[cartasPc[0]][3]))

					se (auxCompareJogador < auxComparePc) {
						escreva("\nVoce ganhou a rodada!")
						escreva("\nSeu atributo --> ", carros[cartasJogador[0]][3], "s | ", carros[cartasPc[0]][3], "s <-- Atributo Pc")
						ut.aguarde(4000)
						jogador_ganhou()
					} senao {
						escreva("\nVoce perdeu a rodada :(")
						escreva("\nSeu atributo --> ", carros[cartasJogador[0]][3], "s | ", carros[cartasPc[0]][3], "s <-- Atributo Pc")
						ut.aguarde(4000)
						pc_ganhou()
					}
					i = 1
					pare
				caso 3:
					auxCompareJogador = tp.cadeia_para_real((carros[cartasJogador[0]][4]))
					auxComparePc = tp.cadeia_para_real((carros[cartasPc[0]][4]))

					se (auxCompareJogador > auxComparePc) {
						escreva("\nVoce ganhou a rodada!")
						escreva("\nSeu atributo --> ", carros[cartasJogador[0]][4], "cv | ", carros[cartasPc[0]][4], "cv <-- Atributo Pc")
						ut.aguarde(4000)
						jogador_ganhou()
					} senao {
						escreva("\nVoce perdeu a rodada :(")
						escreva("\nSeu atributo --> ", carros[cartasJogador[0]][4], "cv | ", carros[cartasPc[0]][4], "cv <-- Atributo Pc")
						ut.aguarde(4000)
						pc_ganhou()
					}
					i = 1
					pare
				caso 4:
					auxCompareJogador = tp.cadeia_para_real((carros[cartasJogador[0]][5]))
					auxComparePc = tp.cadeia_para_real((carros[cartasPc[0]][5]))

					se (auxCompareJogador > auxComparePc) {
						escreva("\nVoce ganhou a rodada!")
						escreva("\nSeu atributo --> ", carros[cartasJogador[0]][5], "cc | ", carros[cartasPc[0]][5], "cc <-- Atributo Pc")
						ut.aguarde(4000)
						jogador_ganhou()
					} senao {
						escreva("\nVoce perdeu a rodada :(")
						escreva("\nSeu atributo --> ", carros[cartasJogador[0]][5], "cc | ", carros[cartasPc[0]][5], "cc <-- Atributo Pc")
						ut.aguarde(4000)
						pc_ganhou()
					}
					i = 1
					pare
				caso 5:
					auxCompareJogador = tp.cadeia_para_real((carros[cartasJogador[0]][6]))
					auxComparePc = tp.cadeia_para_real((carros[cartasPc[0]][6]))

					se (auxCompareJogador < auxComparePc) {
						escreva("\nVoce ganhou a rodada!")
						escreva("\nSeu atributo --> ", carros[cartasJogador[0]][6], "kg | ", carros[cartasPc[0]][6], "kg <-- Atributo Pc")
						ut.aguarde(4000)
						jogador_ganhou()
					} senao {
						escreva("\nVoce perdeu a rodada :(")
						escreva("\nSeu atributo --> ", carros[cartasJogador[0]][6], "kg | ", carros[cartasPc[0]][6], "kg <-- Atributo Pc")
						ut.aguarde(4000)
						pc_ganhou()
					}
					i = 1
					pare
			}
		}
	}
	
	funcao inicio()
	{
		embaralhar()
		distribuir_cartas()
		faca {
			limpa()
			se (vezDeQuem == 0) {
				se (cartasJogador[0] == 20) {
					jogar_super_trunfo()
				} senao se (cartasPc[0] == 20) {
					jogar_super_trunfo_pc()
					se (carros[cartasJogador[0]][1] == "A") {
						resposta = atributosPossiveisPc[0]
						mostrar_atributo(resposta)
						escreva("\nO jogador escolheu o atributo ", auxAtributo)
						quem_ganhou(resposta)
					} senao {
						escreva("\nVoce perdeu a rodada porque sua carta tem ranking menor que A :(")
						pc_ganhou()
					}
				} senao {
					vez_jogador()
					quem_ganhou(resposta)
				}
			} senao se (vezDeQuem == 1) {
				vez_pc()
				escolher_carta_pc()
				quem_ganhou(resposta)
			}
		} enquanto (cartasNaMaoJogador < 6 e cartasNaMaoJogadorPc < 6) //Verifica se alguem venceu

		//Verifica o ganhador
		se (cartasNaMaoJogador == 6) { 
			limpa()
			escreva("\n-------------------\nVoce Venceu :)\n-------------------\n")
		} senao {
			limpa()
			escreva("\n---------------------\nA Maquina venceu! :(\n---------------------\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 14271; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */