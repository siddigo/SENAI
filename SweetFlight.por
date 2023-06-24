programa
{
	inclua biblioteca Texto
	inclua biblioteca Tipos
	inclua biblioteca Util

	const inteiro maxFilas=30,maxColunas=10
	const logico v=verdadeiro
	const logico f=falso
	const cadeia t="\t"
	const inteiro tamCelula=15,larguraCabecalho=60

	
	inteiro aviao[maxFilas][maxColunas]
	cadeia cliente[maxFilas*maxColunas][4]
	
	inteiro totalFilas=0,totalColunas=0,opcao=0
	cadeia nomeCompanhia="SWEET FLIGHT",acaoPoltrona="Cadastrar"

	inteiro totalClientes=1

	funcao inicio()
	{
		logico sair=f

		cliente[0][0]="Vazio"
		cliente[0][1]=""
		cliente[0][2]=""
		
		enquanto (nao sair)
		{
			ImprimirMenu()
			
			LerOpcao(opcao)
			escolha(opcao)
			{
				caso 1: CadastrarPoltronas() pare
				caso 2: ReservarPoltrona() pare
				caso 3: VerPoltronasDisponiveis() pare
				caso 4: VerPoltronasOcupadas() pare
				caso 5: VerPassageiro() pare
				caso 6: TotalizarPoltronas() pare
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
		inteiro idCliente=totalClientes
		
		enquanto(nao poltronaDisponivel)
		{
			limpa()
			ObterFilaReserva(tituloPagina,fila)
			ObterColunaReserva(tituloPagina,coluna)

			ValidarPoltronaDisponivel(fila,coluna,poltronaDisponivel)

			se (nao poltronaDisponivel)
			{
				ImprimirErro("A poltrona "+fila+"-"+coluna+" já está reservada!\nPor favor, escolha outra poltrona.")
			}
		}

		CadastrarCliente(fila,coluna)
		aviao[fila-1][coluna-1]=idCliente
		
		ImprimirMensagem("Poltrona "+fila+"-"+coluna+" reservada com sucesso para o cliente "+cliente[idCliente][0],1.5)
	}

	funcao CadastrarCliente(inteiro fila, inteiro coluna)
	{
		cadeia tituloPagina="Cadastro Cliente"
		cadeia nome=""
		inteiro idade=0
		
		limpa()
		ImprimirCabecalho(tituloPagina)
		
		LerRepostaNaoNula("Nome do cliente?", nome, tituloPagina)
		
		limpa()
		ImprimirCabecalho(tituloPagina)
		
		LerInteiroPositivo("Idade do cliente?", idade, tituloPagina)

		cliente[totalClientes][0]=nome
		cliente[totalClientes][1]=Tipos.inteiro_para_cadeia(idade, 10)
		cliente[totalClientes][2]=Tipos.inteiro_para_cadeia(fila, 10)
		cliente[totalClientes][3]=Tipos.inteiro_para_cadeia(coluna, 10)

		totalClientes++
		
	}

	funcao RemoverCliente(inteiro idCliente)
	{
		para (inteiro i=idCliente;i<totalClientes-1;i++)
		{
			cliente[i][0]=cliente[i+1][0]
			cliente[i][1]=cliente[i+1][1]
			cliente[i][2]=cliente[i+1][2]
		}
		
		totalClientes--
		cliente[totalClientes][0]=""
		cliente[totalClientes][1]=""
		cliente[totalClientes][2]=""
		
	}
	
	funcao ValidarPoltronaDisponivel(inteiro fila,inteiro coluna, logico &poltronaDisponivel)
	{
		inteiro idFil=fila-1
		inteiro idCol=coluna-1

		inteiro idCliente=aviao[idFil][idCol]

		poltronaDisponivel=v
		
		se(idCliente>0)
		{
			poltronaDisponivel=f
		}
		
	}

	funcao RemoverReserva()
	{
		cadeia tituloPagina="Remover Reserva"
		
		limpa()
		ImprimirCabecalho(tituloPagina)
		
		escreva("Ainda não é possível remover reservas!")
		AguardarEnter()
	}

	funcao ObterFilaReserva(cadeia tituloPagina,inteiro &fila)
	{
		logico filaValida=f,maisFilas=f
		faca
		{	
			limpa()
			ImprimirCabecalho(tituloPagina)
			
			LerInteiroPositivo("Qual é a Fila da reserva?",fila,tituloPagina)
			se(fila<=totalFilas)
			{
				filaValida=v
			}
			senao
			{
				ImprimirErro("A fila não existe no avião!\nMáximo de filas = "+totalFilas)
				limpa()
				LerSN("Deseja cadastrar mais filas?",maisFilas)
				se(maisFilas)
				{
					CadastrarFilas()
				}
				
			}
		}
		enquanto(nao filaValida)
	}
	
	funcao ObterColunaReserva(cadeia tituloPagina,inteiro &coluna)
	{
		logico colunaValida=f,maisColunas=f
		faca
		{
			limpa()
			ImprimirCabecalho(tituloPagina)
			
			LerInteiroPositivo("Qual é a Coluna da reserva?",coluna,tituloPagina)
			se(coluna<=totalColunas)
			{
				colunaValida=v
			}
			senao
			{
				ImprimirErro("A coluna não existe no avião!\nMáximo de Colunas = "+totalColunas)
				limpa()
				LerSN("Deseja cadastrar mais colunas?",maisColunas)
				se(maisColunas)
				{
					CadastrarColunas()
				}
			}
		}
		enquanto(nao colunaValida)	
	}

	funcao VerPoltronasDisponiveis()
	{
		cadeia tituloPagina="Poltronas Disponíveis"
		limpa()
		ImprimirCabecalho(tituloPagina)
		logico primeiraLinha=v

		para(inteiro i=0;i<totalFilas;i++)
		{
			cadeia linhaEscrever=""
			cadeia cabFila="Fila "+(i+1)+":"
			logico primeiraCelula=v
			
			CentralizarTexto(cabFila,tamCelula)
			
			//Centralizar Cada texto de célula
			// Inserir texto vaziocentralizado nas celulas vaizas
			para(inteiro j=0;j<totalColunas;j++)
			{
				cadeia textoCelula=""

				se(primeiraCelula)
				{
					linhaEscrever=cabFila
					primeiraCelula=f

					se(primeiraLinha)
					{
						textoCelula=" "
						CentralizarTexto(textoCelula,tamCelula)
						escreva(textoCelula)
					}
				}
				
				se(primeiraLinha)
				{
					textoCelula="Coluna "+(j+1)
					CentralizarTexto(textoCelula,tamCelula)
					escreva(textoCelula)	
				}
				
				se(aviao[i][j]==0)
				{
					textoCelula=(i+1)+"-"+(j+1)
					CentralizarTexto(textoCelula,tamCelula)
					linhaEscrever=linhaEscrever+textoCelula
				}
				senao
				{
					textoCelula="Ocupada"
					CentralizarTexto(textoCelula,tamCelula)
					linhaEscrever=linhaEscrever+textoCelula
				}
				
			}
			se(primeiraLinha) 
			{
				primeiraLinha=f
				escreva("\n")
			}
			escreva(linhaEscrever)
			escreva("\n")
		}
		escreva("\n\nPressione ENTER para continuar!")
		AguardarEnter()
	}

	funcao VerPoltronasOcupadas()
	{
		cadeia tituloPagina="Poltronas Reservadas"
		limpa()
		ImprimirCabecalho(tituloPagina)

		se(totalClientes>1)
			{
			
			cadeia nome="Nome"
			cadeia idade="Idade"
			cadeia fila="Fila"
			cadeia coluna="Coluna"
			
			CentralizarTexto(nome,tamCelula)
			CentralizarTexto(idade,tamCelula)
			CentralizarTexto(fila,tamCelula)
			CentralizarTexto(coluna,tamCelula)
	
			escreva(fila+coluna+nome+idade)
			escreva("\n")
					
			para(inteiro i=1;i<totalClientes;i++)
			{
				nome=cliente[i][0]
				idade=cliente[i][1]
				fila=cliente[i][2]
				coluna=cliente[i][3]
				
				CentralizarTexto(nome,tamCelula)
				CentralizarTexto(idade,tamCelula)
				CentralizarTexto(fila,tamCelula)
				CentralizarTexto(coluna,tamCelula)
	
				escreva(fila+coluna+nome+idade)
				escreva("\n")
				
			}
		}
		senao
		{
			escreva("Não há Poltronas Reservadas!")
		}
		escreva("\n\nPressione ENTER para continuar!")
		AguardarEnter()
	}

	funcao VerPassageiro()
	{
		cadeia tituloPagina="Consultar Passageiro"
		limpa()
		ImprimirCabecalho(tituloPagina)

		cadeia nomeFiltro=""
		logico achou=f
		
		LerRepostaNaoNula("Qual o nome do cliente?", nomeFiltro, tituloPagina)
		
		cadeia nome="Nome"
		cadeia idade="Idade"
		cadeia fila="Fila"
		cadeia coluna="Coluna"
		
		CentralizarTexto(nome,tamCelula)
		CentralizarTexto(idade,tamCelula)
		CentralizarTexto(fila,tamCelula)
		CentralizarTexto(coluna,tamCelula)
			
		para(inteiro i=1;i<totalClientes;i++)
		{
			inteiro posicao=Texto.posicao_texto(nomeFiltro, nome, 0)

			se(posicao>=0)
			{
				se(nao achou)
				{
					escreva(nome+idade+fila+coluna)
					escreva("\n")
				}
				achou=v
				
				nome=cliente[i][0]
				idade=cliente[i][1]
				fila=cliente[i][2]
				coluna=cliente[i][3]
				
				CentralizarTexto(nome,tamCelula)
				CentralizarTexto(idade,tamCelula)
				CentralizarTexto(fila,tamCelula)
				CentralizarTexto(coluna,tamCelula)
	
				escreva(nome+idade+fila+coluna)
				escreva("\n")
			}
		}

		se(nao achou)
		{
			escreva("Não há reservas realziadas com este nome de passageiro!")
		}
	}

	funcao TotalizarPoltronas()
	{
		cadeia tituloPagina="Totalizado do Voo"
		limpa()
		ImprimirCabecalho(tituloPagina)

		inteiro totalPoltronas=totalFilas*totalColunas
		inteiro totalReservas=totalClientes-1
		inteiro totalDisponiveis=totalPoltronas-totalReservas
		
		real percentualReservas=(Tipos.inteiro_para_real(totalReservas)/Tipos.inteiro_para_real(totalPoltronas))*100
		real percentualDisponiveis=(Tipos.inteiro_para_real(totalDisponiveis)/Tipos.inteiro_para_real(totalPoltronas))*100

	}
	funcao ImprimirCabecalho(cadeia tituloPagina)
	{
		cadeia nomeCentro=nomeCompanhia
		cadeia tituloCentro=tituloPagina
		cadeia linhaBranco=""

		CentralizarTexto(nomeCentro,larguraCabecalho-2)
		CentralizarTexto(tituloCentro,larguraCabecalho-2)
		CentralizarTexto(linhaBranco,larguraCabecalho-2)
		
		escreva(EscreverLinha(larguraCabecalho,f))
		escreva("\n|"+nomeCentro+"|")
		escreva("\n|"+linhaBranco+"|")
		escreva("\n|"+tituloCentro+"|")
		escreva(EscreverLinha(larguraCabecalho,v))
		escreva("\n")
		escreva("\n")
	}

	funcao CentralizarTexto(cadeia &texto,inteiro numeroCaracteres)
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

	funcao cadeia EscreverLinha(inteiro numeroCaracteres,logico comEnter)
	{
		cadeia linha = ""
		
		se (comEnter)
		{
			linha += "\n"
		}
		para(inteiro i=1;i<=numeroCaracteres;i++)
		{
			linha += "-"
		}
		retorne linha
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
		escreva("\n6 - Totalizador do Voo")
		escreva("\n7 - Sair")
		escreva("\n")
		escreva("\n")
	}
	
	funcao ImprimirMenuCadastroPoltornas()
	{
		cadeia tituloPagina=acaoPoltrona+" Poltronas"
		cadeia acaoFila="Cadastrar"
		cadeia acaoColuna="Cadastrar"
		
		se(totalFilas>0){acaoFila="Editar"}
		se(totalColunas>0){acaoColuna="Editar"}
		
		limpa()
		ImprimirCabecalho(tituloPagina)

		escreva("\nQuantidade de FILAS atual: "+totalFilas)
		escreva("\nQuantidade de COLUNAS atual: "+totalColunas)
		escreva("\n")
		escreva("\n1 - "+acaoFila+" Filas")
		escreva("\n2 - "+acaoColuna+" Colunas")
		escreva("\n3 - Voltar")
		escreva("\n")
		escreva("\n")
	}
	
	funcao ImprimirMenuReservaPoltornas()
	{
		cadeia tituloPagina="Reservar Poltrona"
		
		limpa()
		ImprimirCabecalho(tituloPagina)
		escreva("\n1 - Cadastrar Reserva")
		escreva("\n2 - Remover Reserva")
		escreva("\n3 - Voltar")
		escreva("\n")
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
					ImprimirErro("A resposta precisa ser inteiro positivo!")
					limpa()
					ImprimirCabecalho(tituloPagina)
					respostaCadeia=""
				}
			}
			senao
			{
				ImprimirErro("A resposta precisa ser inteiro positivo!")
				limpa()
				ImprimirCabecalho(tituloPagina)
			}
		}
		enquanto (nao Tipos.cadeia_e_inteiro(respostaCadeia, 10))
	}
		
	funcao LerRepostaNaoNula(cadeia pergunta,cadeia &resposta,cadeia tituloPagina)
	{
		cadeia respostaCadeia=""
		
		faca
		{	
			escreva(pergunta)
			escreva("\n")
			escreva("\n")
			leia(respostaCadeia)
			se (respostaCadeia!="")
			{
				resposta=respostaCadeia
			}
			senao
			{
				ImprimirErro("A resposta não pode ficar em branco!")
				limpa()
				ImprimirCabecalho(tituloPagina)
			}
		}
		enquanto (respostaCadeia=="")
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
