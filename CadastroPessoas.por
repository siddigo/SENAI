programa
{
	inclua biblioteca Tipos

	const inteiro maxPonteiro=999
	
	inteiro opcao=0, indice=0, numeroCadastros=0
	cadeia nome[maxPonteiro]
	inteiro idade[maxPonteiro]
	
	funcao inicio()
	{
		limpa()
		menu()
		leiaOpcao(opcao)
		
		escolha(opcao)
		{
			caso 1: sequenciaCadastro()  inicio () pare
			caso 2: listagem()  inicio () pare
			caso 3: pare
			caso contrario: opcaoInvalida(1) inicio () pare
		}
		
	}
	
	funcao cabecalho()
	{
		escreva("---------------------------")
		escreva("\n||  Cadastro de Pessoas  ||")
		escreva("\n---------------------------")
		escreva("\n")
	}
	
	funcao menu()
	{
		limpa()
		cabecalho()
		escreva("\n1 - Cadastro")
		escreva("\n2 - Listagem")
		escreva("\n3 - Sair")
		escreva("\n")
		escreva("\n")
	}

	funcao cadastro()
	{
		limpa()
		cabecalho()
		escreva("\nNome: ")
		leia(nome[indice])
		escreva("\nIdade: ")
		leiaIdade()

		indice++
		escreva("\n")
		escreva("\nCadastro Realizado com sucesso!")
		leiaEnter()
		
	}

	funcao sequenciaCadastro()
	{
		limpa()
		cabecalho()
		escreva("\nCadastros a realizar: ")
		leiaNumeroCadastros(numeroCadastros)

		para(inteiro i=0;i<numeroCadastros;i++)
		{
			cadastro()
		}
	}
	
	funcao listagem()
	{
		limpa()
		cabecalho()
		para (inteiro i=0;i<indice;i++)
		{
			escreva("\n"+nome[i]+" - "+idade[i]+" Anos")
		}
		leiaEnter()
	}

	funcao leiaEnter()
	{	
		cadeia enter
		leia(enter)
	}

	funcao opcaoInvalida(inteiro tipoMensagem)
	{
		limpa()
		escolha(tipoMensagem)
		{
			caso 1: escreva("A opção precisa ser um inteiro de 1 a 3!") pare
			caso 2: escreva("A quantidade precisa ser inteiro positivo!") pare
			caso 3: escreva("A Idade precisa ser um inteiro positivo!") pare
			caso contrario: escreva("Erro na resposta!") pare
		}
		leiaEnter()
	}
	
	funcao leiaOpcao(inteiro &respostaInteiro)
	{
		cadeia respostaCadeia
		
		faca
		{	
			limpa()
			menu()
			leia(respostaCadeia)
			se (Tipos.cadeia_e_inteiro(respostaCadeia, 10))
			{
				respostaInteiro=Tipos.cadeia_para_inteiro(respostaCadeia, 10)
			}
			senao
			{
				opcaoInvalida(1) 
			}
		}
		enquanto (nao Tipos.cadeia_e_inteiro(respostaCadeia, 10))
	}

	funcao leiaNumeroCadastros(inteiro &respostaInteiro)
	{
		cadeia respostaCadeia
		
		faca
		{	
			limpa()
			cabecalho()
			escreva("\nCadastros a realizar: ")
			leia(respostaCadeia)
			se (Tipos.cadeia_e_inteiro(respostaCadeia, 10))
			{
				respostaInteiro=Tipos.cadeia_para_inteiro(respostaCadeia, 10)
			}
			senao
			{
				opcaoInvalida(2) 
			}
		}
		enquanto (nao Tipos.cadeia_e_inteiro(respostaCadeia, 10))
	}
	
	funcao leiaIdade()
	{
		cadeia respostaCadeia
		
		faca
		{	
			leia(respostaCadeia)
			se (Tipos.cadeia_e_inteiro(respostaCadeia, 10))
			{
				idade[indice]=Tipos.cadeia_para_inteiro(respostaCadeia, 10)
				se (idade[indice]<0)
				{
					opcaoInvalida(3) 
					respostaCadeia=""
				}
			}
			senao
			{
				opcaoInvalida(3)
				limpa()
				cabecalho()
				escreva("\nNome: "+nome[indice])
				escreva("\nIdade: ")
			}
		}
		enquanto (nao Tipos.cadeia_e_inteiro(respostaCadeia, 10))
	}	
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1258; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {maxPonteiro, 5, 15, 11}-{indice, 7, 18, 6}-{nome, 8, 8, 4}-{idade, 9, 9, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */