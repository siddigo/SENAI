programa
{
	inclua biblioteca Texto --> t

	caracter decisao='e'
	cadeia SN="N"
	cadeia nome=""
	cadeia continuar
	logico finalizar=falso
	
	funcao inicio()
	{
		
		Introducao()

		PrimeiraFase()
		
		se (nao finalizar) {
			SegundaFase()
		}
		se (nao finalizar) {
			TerceiraFase()
		}
		se (nao finalizar) {
			QuartaFase()
		}
		se (nao finalizar) {
			QuintaFase()
		}
	}

	funcao Introducao(){
	
		enquanto(nome==""){
			limpa()
			escreva("Olá jovem aventureiro!\nQual é seu nome?\n")
			leia(nome)
		}

		limpa()
		escreva("Você é um jovem aventureiro chamado "+nome+", que vive em uma pequena vila no Reino de Arden.")

		Pausa()
		
		escreva("Sua família é humilde, e você cresceu ouvindo histórias sobre grandes heróis e vilões que vagam pelo reino.")

		Pausa()
	
	}

	funcao PrimeiraFase(){
		limpa()
		escreva("Um dia, enquanto caminha pela floresta próxima à sua casa, você encontra um velho sábio que lhe oferece uma missão:")
		escreva("\nEncontrar um artefato mágico que foi roubado da Torre do Mago Real.")
		
		Pausa()

		decisao=Decisao("Você aceita esse desafio?")
		se(decisao=='n'){
			FimDaJornada(1)
		}
		
	}

	funcao SegundaFase(){
		limpa()
		escreva("Você aceita a tarefa e começa sua jornada.")
		Pausa()
		
		escreva("Depois de algumas horas de caminhada, você chega a uma pequena cidade chamada Portville.")
		Pausa()
		escreva("Conversando com os moradores, você descobre que o artefato foi visto pela última vez em uma caverna ao norte da cidade.")
		
		decisao=Decisao("Você quer se arriscar e explorar a caverna?")
		se(decisao=='n'){
			FimDaJornada(2)
		}
		
	}
		
	funcao TerceiraFase(){
		limpa()
		escreva("Você decide investigar a caverna e encontra uma série de desafios, incluindo armadilhas, criaturas mágicas e inimigos.")
		Pausa()
		
		decisao=Decisao("Você quer seguir em frente?") 
		se(decisao=='n'){
			FimDaJornada(2) 
			
		}
		limpa()
		escreva("Você encontrou o artefato, uma esfera de cristal brilhante que irradia energia mágica.")
		Pausa()
	}
	funcao QuartaFase(){
		limpa()
		escreva("Você pega a esfera e começa a deixar a caverna, mas é surpreendido por um grupo de bandidos que o atacam.")
		Pausa()
		
		decisao=Decisao("Você encara os bandidos? Mesmo em desvantagem?") 
		se(decisao=='n'){
			FimDaJornada(2) 
		}
		limpa()
		escreva("Você luta bravamente e consegue derrotá-los, mas fica ferido no processo.")
		Pausa()
	}
		funcao QuintaFase(){
		limpa()
		escreva("Ao voltar para a vila, você entrega a esfera ao velho sábio e descobre que ela é um poderoso amuleto mágico capaz de conceder poderes especiais a quem a possuir.")
		Pausa()

		escreva("O velho sábio lhe dá a escolha de ficar com o amuleto ou entregá-lo ao Mago Real em troca de uma recompensa.")
		Pausa()
		
		decisao=Decisao("Você quer entregar o amuleto?") 
		se(decisao=='n'){
			FimDaJornada(3) 
		}
		limpa()
		escreva("Você segue em sua jornada para entregar o amuleto ao Mago Real.")
		Pausa()
		se(decisao=='s'){
		FimDaJornada(4) 
		}
	}
		funcao FimDaJornada(inteiro tipoFim){
		limpa()
		escolha (tipoFim){
			caso 1:
			escreva("Você se recusa a ajudar o estranho e volta para casa rapidamente, pois o jantar já está servido")
			Pausa()
			escreva("Naquela noite, você não conseguiu dormir pensando no que teria acontecido caso tivesse ajudado o velho sábio.")
			Pausa()
			escreva("Fim!")
			Pausa()
			Reinicio()
			pare
			caso 2:
			escreva("Você sente medo e foge correndo para casa o mais rápido possível.")
			Pausa()
			escreva("Você passa os dias se questionando se não deveria ao menos ter tentado.")
			Pausa()
			Reinicio()
			pare
			caso 3: 
			escreva("Você ficou com o amuleto e ganhou poderes")
			escreva("\nAs pessoas da sua vila ficaram com medo de você")
			escreva("\nTe acusaram de magia negra e foste à morte na fogueira") 
			Pausa() 
			Reinicio()
			caso 4:
			escreva("Depois de 3 anos você chega ao final da sua jornada, entrega o amuleto para o Mago Real, recebe a recompensa de 30 moedas de ouro e percebe que nâo valeu a pena.") 
			Pausa() 
			Reinicio()
		}
		
	}

	funcao Reinicio(){
		limpa()
		escreva(decisao)
		decisao=Decisao("Você gostaria de reiniciar a jornada?")
		escreva(decisao)
		se(decisao=='s'){
			inicio()
		}
		se(decisao=='n'){
			limpa()
			finalizar=verdadeiro
		}
			
	}

	funcao Pausa(){
		
		escreva("\n\nPressione Enter para continuar")
		leia(continuar)
		limpa()
		
	}

	funcao caracter Decisao(cadeia perguntaSN){

		caracter resposta='e'
		enquanto(resposta=='e'){
			limpa()
			escreva(perguntaSN+" (S/N)\n")
			
			leia(SN)
			se(t.caixa_baixa(SN)=="s" ou t.caixa_baixa(SN)=="sim"){
				resposta='s'
			} senao {
				se(t.caixa_baixa(SN)=="n" ou t.caixa_baixa(SN)=="nao"){
					resposta='n'
				} senao {
					resposta='e'
				}
			}
		}

		retorne resposta
	}
}
	
		


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3810; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */