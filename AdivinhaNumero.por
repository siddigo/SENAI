programa
{
	inclua biblioteca Matematica --> Ma
	inclua biblioteca Tipos --> Ti
	inclua biblioteca Texto --> Te
	
	caracter respostaSN
	cadeia SN,enter
	inteiro totalDePerguntas=0
	inteiro numeroMaximo,numeroMinimo,numeroMedio,maxPerguntas
	real medioCalculo,rangeInicial
	
	funcao inicio()
	{
		escreva("Olá! Essa é uma máquina de adivinhação de números.")
		escreva("\nConsigo adivinhar qualquer inteiro positivo que você está pensado.")
		escreva("\nE pra isso, vou utilizar somente perguntas de sim e não.")
		escreva("\nMas claro, pra isso eu preciso de um número mínimo e um máximo.")
		escreva("\n")
		escreva("\nAperte ENTER para continuar")
		leia(enter)

		limpa()
		//funcao* *real* logaritmo(*real* numero, *real* base)
		escreva("Número mínimo: ")
		leia(numeroMinimo)
		
		escreva("\nNúmero máximo: ")
		leia(numeroMaximo)

		rangeInicial=numeroMaximo-numeroMinimo
		maxPerguntas=Ti.real_para_inteiro(Ma.logaritmo(rangeInicial,2.00))+1
		
		limpa()
		
		escreva("Vamos deixar um pouco mais desafiador?")
		escreva("\nAposto que descubro o número com no máximo "+maxPerguntas+" perguntas!")
		escreva("\n")
		escreva("\nAperte ENTER para continuar")
		leia(enter)
		
		medioCalculo=(numeroMinimo+numeroMaximo)/2
		numeroMedio=Ti.real_para_inteiro(medioCalculo)
		
		enquanto(numeroMaximo>numeroMinimo){
			totalDePerguntas=totalDePerguntas+1
			escreva("Pergunta número "+totalDePerguntas)
			respostaSN=RespostaSN("Pergunta "+totalDePerguntas+": Seu número é maior que "+numeroMedio+"?")
	
			se(respostaSN=='s'){
				numeroMinimo=numeroMedio+1
				medioCalculo=(numeroMinimo+numeroMaximo)/2

				numeroMedio=Ti.real_para_inteiro(medioCalculo)
			} senao {
				numeroMaximo=numeroMedio
				medioCalculo=(numeroMinimo+numeroMaximo)/2

				numeroMedio=Ti.real_para_inteiro(medioCalculo)			
			}
		}
		limpa()
		escreva("O número é "+numeroMinimo+"!")
		escreva("\nRespondido com apenas "+totalDePerguntas+" perguntas!")
		escreva("\n")
		escreva("\nAperte ENTER para continuar")
		leia(enter)
		
		inicio()	
	}
	
	funcao caracter RespostaSN(cadeia perguntaSN){

		caracter resposta='e'
		enquanto(resposta=='e'){
			limpa()
			escreva(perguntaSN+" (S/N)\n")
			
			leia(SN)
			se(Te.caixa_baixa(SN)=="s" ou Te.caixa_baixa(SN)=="sim"){
				resposta='s'
			} senao {
				se(Te.caixa_baixa(SN)=="n" ou Te.caixa_baixa(SN)=="nao"){
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
 * @POSICAO-CURSOR = 152; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */