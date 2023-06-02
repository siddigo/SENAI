programa
{
	inclua biblioteca Matematica --> m
	inclua biblioteca Tipos --> t
	inclua biblioteca Util --> u

	const inteiro maximo_valores = 999
	const real percentualDesconto=5.00
	
	cadeia enter="",nome[maximo_valores]
	real valor_unitario[maximo_valores],quantidade[maximo_valores],total_item[maximo_valores],total_compra=0.00,multiplicador=1.00
	inteiro indice=0,resposta
	logico sair=falso
	
	funcao inicio()
	{
		
		menu()
		
		faca
		{
			inserir_item()
			se (nao sair)
			{
				validar_finalizar_compra()
			}
		} enquanto (nao sair)
		
		totalizar_compra()
		nova_compra()
	}

	funcao menu()
	{	
		limpa()
		escreva("Aperte ENTER para iniciar uma nova compra")
		leia(enter)
	}

	funcao inserir_item()
	{	
		limpa()
		escreva("\nDeixe o nome em branco para sair!")
		escreva("\n")
		escreva("\n")
		escreva("\nDigite o nome do item: ")	

		leia(nome[indice])

		se (nome[indice]=="") 
		{
			sair=verdadeiro			
		} 
		senao 
		{
			escreva("\nDigite o valor unitário do item: ")
			leia(valor_unitario[indice])
			escreva("\nDigite o total de itens: ")
			leia(quantidade[indice])
			
			calcular_total_item(indice)

			indice++
		}

	}

	funcao calcular_total_item(inteiro indice_item)
	{
		se (quantidade[indice_item]>3)
		{
			multiplicador=1-percentualDesconto/100
		}
		senao
		{
			multiplicador=1.00
		}

		total_item[indice_item]=m.arredondar(quantidade[indice_item]*valor_unitario[indice_item]*multiplicador,2)
	}

	funcao validar_finalizar_compra()
	{
		limpa()
		escreva("Produto inserido com sucesso!\n")
		
		se (indice==maximo_valores)
		{
			sair=verdadeiro	
			escreva("\n")
			escreva("Aperte ENTER para finalizar a compra")
			leia(enter)
			
		}
		senao
		{
			u.aguarde(1.5)			
		}
	}
	
	funcao totalizar_compra()
	{
		limpa()
		para(inteiro i=0;i<indice;i++)
		{	
			escreva(nome[i],"-> R$ ",valor_unitario[i]," || quantidade: ",quantidade[i]," || Total do Item: R$",total_item[i])
			escreva("\n")
			se (quantidade[i]>3)
			{
				escreva("O item acima recebeu um desconto de "+percentualDesconto+"%!")
				escreva("\n")
			}
			total_compra=total_compra+total_item[i]
		}
		escreva("\n")
		escreva("O total da compra foi de R$ ",total_compra)
		escreva("\n")
		escreva("\n")
		escreva("Aperte ENTER para continuar")
		leia(enter)
	}
	
	funcao nova_compra()
	{
		limpa()
		escreva("O que fazer?\n")
		escreva("1 - Nova compra\n")
		escreva("2 - Finalizar\n")
		escreva("\nResposta: ")
		leia(resposta)
		escolha(resposta)
		{
			caso 1: reiniciar_sistema() pare
			caso 2: pare
			caso contrario: escreva("Resposta Inválida!\n")
		}
	}

	funcao reiniciar_sistema()
	{
		sair=falso
		indice=0
		total_compra=0.00
		multiplicador=1.00
		inicio()
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2028; 
 * @DOBRAMENTO-CODIGO = [32, 39, 81, 130, 122, 138];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */