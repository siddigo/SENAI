programa
{
	inclua biblioteca Tipos
	inclua biblioteca Util

	const inteiro maxVetor=999
	inteiro vetor[maxVetor]
	inteiro valor1,valor2,tamanhoVetor=0,valor=0
	cadeia resposta
	
	funcao inicio()
	{	
		ler_vetor()
		merge_sort(vetor,0,tamanhoVetor-1)
		escrever_vetor(vetor)

	}

	funcao merge_sort(inteiro vetorDesordenado[],inteiro ini, inteiro fim)
	{
		inteiro meio,a,b,c, vetorAux[maxVetor]

		se (ini < fim)
		{
			meio=(ini+fim)/2
			merge_sort(vetorDesordenado,ini,meio)
			merge_sort(vetorDesordenado,meio+1,fim)

			a=ini
			b=meio+1
			c=ini

			enquanto(a<=meio e b<=fim)
			{
				se(vetorDesordenado[a]<vetorDesordenado[b])
				{
					vetorAux[c]=vetorDesordenado[a]
					a++
				}
				senao
				{
					vetorAux[c]=vetorDesordenado[b]
					b++			
				}
				c++
				
			}
			
			enquanto (a<=	meio)
			{
				vetorAux[c]=vetorDesordenado[a]
				a++
				c++
			}
			
			enquanto (b<=fim)
			{
				vetorAux[c]=vetorDesordenado[b]
				b++
				c++
			}
			
			para(inteiro i=ini;i<=fim;i++)
			{
				vetorDesordenado[i]=vetorAux[i]
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

	funcao escrever_vetor(inteiro vetor_escrever[])
	{		
		para (inteiro i=0;i<tamanhoVetor;i++)
		{
			escreva(vetor_escrever[i])
			
			se (tamanhoVetor-1>i)
			{
				escreva(", ")	
			}
			

		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 684; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */