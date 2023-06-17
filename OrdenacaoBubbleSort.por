programa
{
	inclua biblioteca Tipos
	inclua biblioteca Util
	
	inteiro maxVetor=999
	inteiro vetor[999]
	inteiro valor1,valor2,tamanhoVetor=0,valor=0
	cadeia resposta
	
	funcao inicio()
	{	
		ler_vetor()
		bubble_sort(vetor)
		
		para (inteiro i=0;i<tamanhoVetor;i++)
		{
			escreva(vetor[i])
			
			se (tamanhoVetor-1>i)
			{
				escreva(", ")	
			}
			

		}
	}

	funcao bubble_sort(inteiro vetorDesordenado[])
	{
		para (inteiro j=0;j<tamanhoVetor-1;j++)
		{	
			
			para (inteiro i=0;i<tamanhoVetor-1;i++)
			{	
				valor1=vetor[i]
				valor2=vetor[i+1]
	
				
				se (valor1>valor2)
				{
					vetor[i]=valor2
					vetor[i+1]=valor1
				}
			}
		}
	}

	funcao ler_vetor()
	{
		limpa()
		escreva("Quantos números serão ordenados?\n")
		leia(tamanhoVetor)
		limpa()
		para (inteiro i=0;i<tamanhoVetor;i++)
		{
			limpa()
			resposta_inteiro("Digite o "+(i+1)+"º número: ", valor)
			vetor[i]=valor
		}
	}

	funcao resposta_inteiro(cadeia pergunta, inteiro &valorResposta)
	{
		logico leu=falso
		enquanto (nao leu)
		{
			limpa()
			escreva(pergunta)
			leia(resposta)

			se (Tipos.cadeia_e_inteiro(resposta,10))
			{
				valorResposta=Tipos.cadeia_para_inteiro(resposta, 10)
				leu=verdadeiro
			}
			
		}

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1048; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */