programa
{
	inclua biblioteca Texto
	inclua biblioteca Tipos
	inclua biblioteca Util

	const inteiro maxFilas=30,maxColunas=10
	const logico v=verdadeiro
	const logico f=falso
	
	inteiro aviao[maxFilas][maxColunas]
	cadeia clientes[maxFilas*maxColunas][2]
	inteiro totalFilas=0,totalColunas=0,opcao=0
	cadeia nomeCompanhia="SWEET FLIGHT",acaoPoltrona="Cadastrar"
		
	funcao inicio()
	{
		logico sair=f

		enquanto (nao sair)
		{
			ImprimirMenu()
			
			LerOpcao(opcao)
			escolha(opcao)
			{
				caso 1: CadastrarPoltronas() pare
				caso 2: ReservarPoltrona() pare
				caso 3: escreva("Opção 3") AguardarEnter() inicio () pare
				caso 4: escreva("Opção 4") AguardarEnter() inicio () pare
				caso 5: escreva("Opção 5") AguardarEnter() inicio () pare
				caso 6: escreva("Opção 6") AguardarEnter() inicio () pare
				caso 7: sair=v pare
				caso contrario: ImprimirErro("Escolha uma opção entre 1 e 7!") inicio () pare
			}
		}
		
	}

	funcao CadastrarPoltronas()
	{
		logico sair=f

		enquanto (nao sair)
		{
			limpa()
			ImprimirMenuCadastroPoltornas()
			
			LerOpcao(opcao)
			escolha(opcao)
			{
				caso 1: CadastrarFilas() pare
				caso 2: CadastrarColunas() pare
				caso 3: sair=v pare
				caso contrario: ImprimirErro("Escolha uma opção entre 1 e 3!") pare
			}

			AtualizarAcaoPoltronas()
			ValidarSairPoltronas(sair)
		}
	}

	funcao AtualizarAcaoPoltronas()
	{
		se(totalFilas*totalColunas==0)
		{
			acaoPoltrona="Cadastrar"
		}
		senao
		{
			acaoPoltrona="Editar"
		}
	}

	funcao ValidarSairPoltronas(logico &sair)
	{
		se(sair)
		{
			ValidarFilas(sair)
		}
		
		se(sair)
		{
			ValidarColunas(sair)
		}
	}

	funcao ValidarFilas(logico &sair)
	{	
		cadeia tituloPagina=acaoPoltrona+" Poltronas"
		logico continuar=v
		
		se(totalFilas==0)
		{
			limpa()
			ImprimirCabecalho(tituloPagina)
			LerSN("O número de filas não foi preenchido!\nDeseja sair mesmo assim?",continuar)
		}

		se(nao continuar)
		{
			sair=f
		}
	}

	funcao ValidarColunas(logico &sair)
	{	
		cadeia tituloPagina=acaoPoltrona+" Poltronas"
		logico continuar=v
		
		se(totalColunas==0)
		{
			limpa()
			ImprimirCabecalho(tituloPagina)
			LerSN("O número de colunas não foi preenchido!\nDeseja sair mesmo assim?",continuar)
		}

		se(nao continuar)
		{
			sair=f
		}
	}
		
	funcao CadastrarFilas()
	{
		cadeia acaoFila="Cadastrar"
		
		se(totalFilas>0){acaoFila="Editar"}
		cadeia tituloPagina=acaoFila+" Filas"
		
		limpa()
		ImprimirCabecalho(tituloPagina)
		
		inteiro lin=totalFilas
		faca 
		{
			LerInteiroPositivo("Quantas FILAS de poltronas possui a aeronave?",lin,tituloPagina)
			se (lin<totalFilas ou lin>maxFilas)
			{
				cadeia erro="A quantidade de filas deve ser igual superior ao atual ("+totalFilas+")!"
				se(lin>maxFilas) {erro="O avião pode ter no máximo "+maxFilas+" filas!"}
				ImprimirErro(erro)
				limpa()
				ImprimirCabecalho(tituloPagina)
			}
		}
		enquanto(lin<totalFilas ou lin>maxFilas)

		totalFilas=lin
	}
	
	funcao CadastrarColunas()
	{
		cadeia acaoColuna="Cadastrar"
		
		se(totalColunas>0){acaoColuna="Editar"}
		cadeia tituloPagina=acaoColuna+" Colunas"
				
		limpa()
		ImprimirCabecalho(tituloPagina)
		
		inteiro col=totalColunas
		faca 
		{
			LerInteiroPositivo("Quantas COLUNAS de poltronas possui a aeronave?",col,tituloPagina)
			se (col<totalColunas ou col>maxColunas)
			{
				cadeia erro="A quantidade de colunas deve ser igual superior ao atual ("+totalColunas+")!"
				se(col>maxColunas) {erro="O avião pode ter no máximo "+maxColunas+" colunas!"}
				ImprimirErro(erro)
				limpa()
				ImprimirCabecalho(tituloPagina)
			}
		}
		enquanto(col<totalColunas ou col>maxColunas)

		totalColunas=col
		
		
	}

	funcao ReservarPoltrona()
	{
		logico sair=f

		enquanto (nao sair)
		{
			limpa()
			ImprimirMenuReservaPoltornas()
			
			LerOpcao(opcao)
			escolha(opcao)
			{
				caso 1: CadastrarReserva() pare
				caso 2: RemoverReserva() pare
				caso 3: sair=v pare
				caso contrario: ImprimirErro("Escolha uma opção entre 1 e 3!") pare
			}
		}
	}

	funcao CadastrarReserva()
	{
		cadeia tituloPagina="Cadastrar Reserva"
		logico poltronaDisponivel=f
		inteiro fila=0,coluna=0
		enquanto(nao poltronaDisponivel)
		{
			limpa()
			ImprimirCabecalho(tituloPagina)
			ObterFilaReserva(tituloPagina,fila)
			ObterColunaReserva(tituloPagina,coluna)

			ValidarPoltronaDisponivel(fila,coluna,poltronaDisponivel)

			se (nao poltronaDisponivel)
			{
				ImprimirErro("A poltrona "+fila+"-"+coluna+" já está reservada!\nPor favor, escolha outra poltrona.")
			}
		}

		ImprimirMensagem("Poltrona "+fila+"-"+coluna+" reservada com sucesso!",1.5)
	}

	funcao ValidarPoltronaDisponivel(inteiro fila,inteiro coluna, logico &poltronaDisponivel)
	{
		inteiro idFil=fila-1
		inteiro idCol=coluna-1
		
	}

	funcao RemoverReserva()
	{
		cadeia tituloPagina="Remover Reserva"
		
		limpa()
		ImprimirCabecalho(tituloPagina)		
	}

	funcao ObterFilaReserva(cadeia tituloPagina,inteiro &fila)
	{
		logico filaValida=f
		faca
		{
			LerInteiroPositivo("Qual é a Fila da reserva?",fila,tituloPagina)
			se(fila<=totalFilas)
			{
				filaValida=v
			}
			senao
			{
				ImprimirErro("A fila não existe no avião!\n Máximo de filas = "+totalFilas)
			}
		}
		enquanto(nao filaValida)
	}
	
	funcao ObterColunaReserva(cadeia tituloPagina,inteiro &coluna)
	{
		logico colunaValida=f
		faca
		{
			LerInteiroPositivo("Qual é a Coluna da reserva?",coluna,tituloPagina)
			se(coluna<=totalColunas)
			{
				colunaValida=v
			}
			senao
			{
				ImprimirErro("A coluna não existe no avião!\n Máximo de Colunas = "+totalColunas)
			}
		}
		enquanto(nao colunaValida)	
	}
	
	funcao ImprimirCabecalho(cadeia tituloPagina)
	{
		
		inteiro larguraCabecalho=30

		cadeia nomeCentro=nomeCompanhia
		cadeia tituloCentro=tituloPagina
		cadeia linhaBranco=""

		CentralizarTexto(larguraCabecalho-2, nomeCentro)
		CentralizarTexto(larguraCabecalho-2, tituloCentro)
		CentralizarTexto(larguraCabecalho-2, linhaBranco)
		
		EscreverLinha(larguraCabecalho,f)
		escreva("\n|"+nomeCentro+"|")
		escreva("\n|"+linhaBranco+"|")
		escreva("\n|"+tituloCentro+"|")
		EscreverLinha(larguraCabecalho,v)
		escreva("\n")
		escreva("\n")
	}

	funcao CentralizarTexto(inteiro numeroCaracteres, cadeia &texto)
	{
		inteiro tamanhoTexto=Texto.numero_caracteres(texto)

		inteiro numeroEspacos=numeroCaracteres-tamanhoTexto
		inteiro espacoAntes=numeroEspacos/2
		inteiro espacoDepois=numeroEspacos-espacoAntes

		cadeia novoTexto=texto
		
		para (inteiro i=1;i<=espacoAntes;i++)
		{
			novoTexto=" "+novoTexto
		}
		
		para (inteiro i=1;i<=espacoDepois;i++)
		{
			novoTexto=novoTexto+" "
		}
		
		texto=novoTexto
		
	}

	funcao EscreverLinha(inteiro numeroCaracteres,logico comEnter)
	{
		se (comEnter)
		{
			escreva("\n")
		}
		para(inteiro i=1;i<=numeroCaracteres;i++)
		{
			escreva("-")
		}
	}
	
	funcao ImprimirMenu()
	{		
		limpa()
		ImprimirCabecalho("Controle de Voo")
		escreva("\n1 - "+acaoPoltrona+" Poltronas")
		escreva("\n2 - Reservar Poltrona")
		escreva("\n3 - Ver Poltronas Disponíveis")
		escreva("\n4 - Ver Poltronas Reservadas")
		escreva("\n5 - Consultar Passageiro")
		escreva("\n6 - Totalizador de Poltronas")
		escreva("\n7 - Sair")
		escreva("\n")
	}
	
	funcao ImprimirMenuCadastroPoltornas()
	{
		cadeia tituloPagina=acaoPoltrona+" Poltronas"
		
		limpa()
		ImprimirCabecalho(tituloPagina)

		escreva("\nQuantidade de FILAS atual: "+totalFilas)
		escreva("\nQuantidade de COLUNAS atual: "+totalColunas)
		escreva("\n")
		escreva("\n1 - "+acaoPoltrona+" Filas")
		escreva("\n2 - "+acaoPoltrona+" Colunas")
		escreva("\n3 - Voltar")
		escreva("\n")
	}
	
	funcao ImprimirMenuReservaPoltornas()
	{
		cadeia tituloPagina="Reservar Poltrona"
		
		limpa()
		ImprimirCabecalho(tituloPagina)

		escreva("\n")
		escreva("\n1 - Cadastrar Reserva")
		escreva("\n2 - Remover Reserva")
		escreva("\n3 - Voltar")
		escreva("\n")
	}
	
	funcao LerOpcao(inteiro &respostaInteiro)
	{
		cadeia respostaCadeia
		
		faca
		{	
			leia(respostaCadeia)
			se (Tipos.cadeia_e_inteiro(respostaCadeia, 10))
			{
				respostaInteiro=Tipos.cadeia_para_inteiro(respostaCadeia, 10)
			}
			senao
			{
				ImprimirErro("A opção precisa ser um inteiro de 1 a 7!")
				limpa()
				ImprimirMenu()
			}
		}
		enquanto (nao Tipos.cadeia_e_inteiro(respostaCadeia, 10))
	}

	funcao ImprimirErro(cadeia mensagem)
	{
		limpa()
		escreva(mensagem)
		AguardarEnter()
	}

	funcao ImprimirMensagem(cadeia mensagem,real countDown)
	{
		limpa()
		escreva(mensagem)
		Util.aguarde(countDown*1000)
	}
		
	funcao LerInteiroPositivo(cadeia pergunta,inteiro &respostaInteiro,cadeia tituloPagina)
	{
		cadeia respostaCadeia
		
		faca
		{	
			escreva(pergunta)
			escreva("\n")
			escreva("\n")
			leia(respostaCadeia)
			se (Tipos.cadeia_e_inteiro(respostaCadeia, 10))
			{
				respostaInteiro=Tipos.cadeia_para_inteiro(respostaCadeia, 10)
				se (respostaInteiro<=0)
				{
					ImprimirErro("A quantidade precisa ser inteiro positivo!")
					limpa()
					ImprimirCabecalho(tituloPagina)
					respostaCadeia=""
				}
			}
			senao
			{
				ImprimirErro("A quantidade precisa ser inteiro positivo!")
				limpa()
				ImprimirCabecalho(tituloPagina)
			}
		}
		enquanto (nao Tipos.cadeia_e_inteiro(respostaCadeia, 10))
	}

	funcao LerSN(cadeia perguntaSN,logico &respostaSN)
	{
		cadeia SN=""
		logico respostaValida=f
		
		enquanto(nao respostaValida)
		{	
			limpa()
			escreva(perguntaSN+" (S/N)\n")
			
			leia(SN)
			se(Texto.caixa_baixa(SN)=="s" ou Texto.caixa_baixa(SN)=="sim"){
				respostaSN=v
				respostaValida=v
			} 
	
			se(Texto.caixa_baixa(SN)=="n" ou Texto.caixa_baixa(SN)=="nao" ou Texto.caixa_baixa(SN)=="não")
			{
				respostaSN=f
				respostaValida=v
			} 

			se(nao respostaValida)
			{
				limpa()
				escreva("Reposta Inválida!")
				AguardarEnter()
			}

		}
	}
	
	funcao AguardarEnter()	
	{	
		cadeia enter
		leia(enter)
	}
}
