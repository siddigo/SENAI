programa
{
	inclua biblioteca Texto
	inclua biblioteca Tipos
	inclua biblioteca Util

	const inteiro maxFilas=30,maxColunas=10
	const logico v=verdadeiro
	const logico f=falso
	const cadeia t="\t",n="\n",w="|"
	const inteiro tamCelula=15,larguraCabecalho=60

	
	inteiro aviao[maxFilas][maxColunas]
	cadeia cliente[maxFilas*maxColunas][4]
	
	inteiro totalFilas=0,totalColunas=0,opcao=0
	cadeia nomeCompanhia="SWEET FLIGHT",tela=""

	inteiro totalClientes=1

	funcao inicio()
	{

		cliente[0][0]="Vazio"
		cliente[0][1]=""
		cliente[0][2]=""

		AbrirMenu()
		
	}
	
	funcao AbrirMenu()
	{	
		logico sair=f
		
		enquanto (nao sair)
		{
			EscreverMenu(0)
			
			opcao=LerOpcao()
			escolha(opcao)
			{
				caso 1: CadastrarPoltronas() pare
				caso 2: ReservarPoltrona() pare
				caso 3: VerPoltronasDisponiveis() pare
				caso 4: VerPoltronasOcupadas() pare
				caso 5: VerPassageiro() pare
				caso 6: TotalizarPoltronas() pare
				caso 7: sair=v pare
				caso contrario: ImprimirErro(tela+n+"Opção Inválida! Escolha de 1 a 7!") pare
			}
		}
	}
	
	funcao CadastrarPoltronas()
	{
		logico sair=f

		enquanto (nao sair)
		{
			MostrarMenu(1)
			
			opcao=LerOpcao()
			escolha(opcao)
			{
				caso 1: CadastrarFilas() pare
				caso 2: CadastrarColunas() pare
				caso 3: sair=v pare
				caso contrario: MostrarErro(tela+"Opção Inválida! Escolha de 1 a 3!") pare
			}
			
			ValidarSairPoltronas(sair)
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
		cadeia acaoPoltrona=ObterAcaoPoltronas()
		cadeia tituloPagina=acaoPoltrona+" Poltronas"
		logico continuar
		
		se(totalFilas==0)
		{
			LimparTela()
			tela=ObterCabecalho(tituloPagina)
			continuar=LerSN(tela+n+"O número de filas não foi preenchido!"+n+"Deseja sair mesmo assim?")
		}

		se(nao continuar)
		{
			sair=f
		}
	}

	funcao ValidarColunas(logico &sair)
	{	
		cadeia acaoPoltrona=ObterAcaoPoltronas()
		cadeia tituloPagina=acaoPoltrona+" Poltronas"
		logico continuar=v
		
		se(totalColunas==0)
		{
			LimparTela()
			tela=ObterCabecalho(tituloPagina)
			continuar=LerSN(tela+n+"O número de colunas não foi preenchido!\nDeseja sair mesmo assim?")
		}

		se(nao continuar)
		{
			sair=f
		}
	}
		
	funcao CadastrarFilas()
	{
		cadeia acaoFila=ObterAcaoFilas()
		cadeia tituloPagina=acaoFila+" Filas"
		cadeia cab=ObterCabecalho(tituloPagina)

		tela=cab+n+"Quantas FILAS de poltronas possui a aeronave?"
		
		inteiro filas
		faca 
		{
			limpa()
			
			filas=LerInteiroPositivo(tela,f)
			se (filas<totalFilas ou filas>maxFilas)
			{
				cadeia erro="A quantidade de filas deve ser igual superior ao atual ("+totalFilas+")!"
				se(filas>maxFilas) {erro="O avião pode ter no máximo "+maxFilas+" filas!"}
				
				ImprimirErro(tela+erro)
			}
		}
		enquanto(filas<totalFilas ou filas>maxFilas)

		totalFilas=filas
	}
	
	funcao CadastrarColunas()
	{
		cadeia acaoColuna=ObterAcaoColunas()
		cadeia tituloPagina=acaoColuna+" Colunas"
		cadeia cab=ObterCabecalho(tituloPagina)
		
		inteiro colunas
		faca 
		{
			LimparTela()
			colunas=LerInteiroPositivo(cab+n+"Quantas COLUNAS de poltronas possui a aeronave?",f)
			se (colunas<totalColunas ou colunas>maxColunas)
			{
				cadeia erro="A quantidade de colunas deve ser igual superior ao atual ("+totalColunas+")!"
				se(colunas>maxColunas) {erro="O avião pode ter no máximo "+maxColunas+" colunas!"}
				
				ImprimirErro(erro)
			}
		}
		enquanto(colunas<totalColunas ou colunas>maxColunas)

		totalColunas=colunas
		
		
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

		LimparTela()
		tela=ObterCabecalho(tituloPagina)
		
		enquanto(nao poltronaDisponivel)
		{
			limpa()
			fila=ObterFilaReserva()
			ObterColunaReserva(tituloPagina,coluna)

			ValidarPoltronaDisponivel(fila,coluna,poltronaDisponivel)

			se (nao poltronaDisponivel)
			{
				ImprimirErro(tela+n+"A poltrona "+fila+"-"+coluna+" já está reservada!\nPor favor, escolha outra poltrona.")
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

	funcao inteiro ObterFilaReserva()
	{
		logico filaValida=f,maisFilas=f
		inteiro fila
		faca
		{	

			fila=LerInteiroPositivo(tela+n+"Qual é a Fila da reserva?",f)
			se(fila<=totalFilas)
			{
				filaValida=v
			}
			senao
			{
				ImprimirErro(tela+n+"A fila não existe no avião!\nMáximo de filas = "+totalFilas)
				limpa()
				maisFilas=LerSN(tela+n+"Deseja cadastrar mais filas?")
				se(maisFilas)
				{
					CadastrarFilas()
				}
				
			}
		}
		enquanto(nao filaValida)

		retorne fila
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

	funcao MostrarMenu(inteiro opcaoMenu)
	{
		LimparTela()
		escolha(opcaoMenu)
		{
			caso 0:tela=ObterMenuPrincipal() pare
			caso 1:tela=ObterMenuPoltronas() pare
			caso 2:tela=ObterMenuReservaPoltornas() pare
		}
		escreva(tela)		
	}

	funcao MostrarErro(cadeia mensagem)
	{
		limpa()
		escreva(tela+mensagem)
		AguardarEnter()
	}

	funcao MostrarMensagem(cadeia mensagem,real countDown)
	{
		limpa()
		escreva(mensagem)
		Util.aguarde(countDown*1000)
	}
	
	funcao cadeia ObterCabecalho(cadeia tituloPagina)
	{
		cadeia nomeCentro=nomeCompanhia
		cadeia tituloCentro=tituloPagina
		cadeia linhaBranco=""
		cadeia linhaTraco=ObterLinha(larguraCabecalho)

		CentralizarTexto(nomeCentro,larguraCabecalho-2)
		CentralizarTexto(tituloCentro,larguraCabecalho-2)
		CentralizarTexto(linhaBranco,larguraCabecalho-2)

		cadeia cabecalho=""
		cabecalho+=linhaTraco
		cabecalho+=n+w+nomeCentro+w
		cabecalho+=n+w+linhaBranco+w
		cabecalho+=n+w+tituloCentro+w
		cabecalho+=n+w+linhaTraco
		cabecalho+=n+n
		
		retorne cabecalho
	}

	funcao cadeia ObterLinha(inteiro numeroCaracteres)
	{
		cadeia linha="-"
		
		para(inteiro i=1;i<=numeroCaracteres;i++)
		{
			linha += "-"
		}

		retorne linha
	}
	
	funcao cadeia ObterMenuPrincipal()
	{		
		cadeia acaoPoltrona=ObterAcaoPoltronas()
		cadeia menu=""
		inteiro i=0
		menu+=ObterCabecalho("Controle de Voo")
		menu+=(i++)+" - "+acaoPoltrona+" Poltronas"
		menu+=n+(i++)+" - "+"Reservar Poltrona"
		menu+=n+(i++)+" - "+"Ver Poltronas Disponíveis"
		menu+=n+(i++)+" - "+"Ver Poltronas Reservadas"
		menu+=n+(i++)+" - "+"Consultar Passageiro"
		menu+=n+(i++)+" - "+"Totalizador do Voo"
		menu+=n+(i++)+" - "+"- Sair"
		menu+=n+n

		retorne menu
	}

	funcao cadeia ObterMenuPoltronas()
	{
		cadeia acaoPoltrona=ObterAcaoPoltronas()
		cadeia tituloPagina=acaoPoltrona+" Poltronas"
		cadeia acaoFila=ObterAcaoFilas()
		cadeia acaoColuna=ObterAcaoColunas()
		cadeia menu=""
		inteiro i=0
		
		menu+=ObterCabecalho(tituloPagina)
		menu+="Quantidade de FILAS atual: "+totalFilas
		menu+=n+"Quantidade de COLUNAS atual: "+totalColunas
		menu+=n+n+(i++)+" - "+acaoFila+" Filas"
		menu+=n+(i++)+" - "+acaoColuna+" Colunas"
		menu+=n+(i++)+" - Voltar"
		menu+=n+n

		retorne menu
	}
		
	funcao cadeia ObterMenuReservaPoltornas()
	{
		cadeia tituloPagina="Reservar Poltrona"
		cadeia menu=""
		inteiro i=0
		
		menu+=ObterCabecalho(tituloPagina)
		menu+=n+(i++)+" - Cadastrar Reserva"
		menu+=n+(i++)+" - Remover Reserva"
		menu+=n+(i++)+" - Voltar"
		menu+=n+n

		retorne menu
	}
	
	funcao cadeia ObterAcaoPoltronas()
	{
		cadeia acao="Editar"

		se(totalFilas*totalColunas==0) {acao="Cadastrar"}

		retorne acao
	}

	funcao cadeia ObterAcaoFilas()
	{
		cadeia acao="Editar"

		se(totalFilas==0) {acao="Cadastrar"}

		retorne acao
	}
	
	funcao cadeia ObterAcaoColunas()
	{
		cadeia acao="Editar"

		se(totalColunas==0) {acao="Cadastrar"}

		retorne acao
	}

	funcao inteiro LerOpcao()
	{
		inteiro respostaInteiro=-1
		cadeia respostaCadeia
		
		leia(respostaCadeia)
		se (Tipos.cadeia_e_inteiro(respostaCadeia, 10))
			{
				respostaInteiro=Tipos.cadeia_para_inteiro(respostaCadeia, 10)
			}
			
		retorne respostaInteiro
	}

	funcao inteiro LerInteiro(cadeia pergunta)
	{
		cadeia respostaCadeia
		inteiro respostaInteiro
		
		faca
		{	
			limpa()
			escreva(pergunta+n+n)
			leia(respostaCadeia)
			se (Tipos.cadeia_e_inteiro(respostaCadeia, 10))
			{
				respostaInteiro=Tipos.cadeia_para_inteiro(respostaCadeia, 10)
			}
			senao
			{
				MostrarErro("A resposta precisa ser número inteiro!")
			}
		}
		enquanto (nao Tipos.cadeia_e_inteiro(respostaCadeia, 10))

		retorne respostaInteiro
	}
		
	funcao inteiro LerInteiroPositivo(cadeia pergunta,logico comZero)
	{
		inteiro respostaInteiro
		cadeia tipo="positivo"
		se(comZero){tipo=+" ou zero"}
		
		faca
		{	
			respostaInteiro=LerInteiro(pergunta)
			se (respostaInteiro<0 ou (nao comZero e respostaInteiro==0))
			{
				MostrarErro("O número precisa ser "+tipo+"!")
			}
			senao
			{
				retorne respostaInteiro
			}
		}
		enquanto (v)

		retorne respostaInteiro
	}

	funcao cadeia LerCadeiaNaoNula(cadeia pergunta)
	{
		cadeia respostaCadeia=""
		
		faca
		{	
			limpa()
			escreva(tela+pergunta+" (S/N)"+n+n)
			escreva("\n")
			leia(respostaCadeia)
			se (respostaCadeia=="")
			{
				MostrarErro("A resposta não pode ficar em branco!")
			}
		}
		enquanto (respostaCadeia=="")

		retorne respostaCadeia
	}

	funcao logico LerSN(cadeia perguntaSN)
	{
		cadeia SN=""
		logico respostaSN=v
		
		faca
		{	
			limpa()
			escreva(tela+perguntaSN+" (S/N)"+n+n)
			
			leia(SN)
			se(Texto.caixa_baixa(SN)=="s" ou Texto.caixa_baixa(SN)=="sim"){
				respostaSN=v
				retorne respostaSN
			} 
	
			se(Texto.caixa_baixa(SN)=="n" ou Texto.caixa_baixa(SN)=="nao" ou Texto.caixa_baixa(SN)=="não")
			{
				respostaSN=f
				retorne respostaSN
			} 

			MostrarErro("Reposta Inválida!"+n+"A resposta deve ser S ou N")
		}
		enquanto(v)
		
		retorne respostaSN
	}
	
	funcao AguardarEnter()
	{	
		cadeia enter
		leia(enter)
	}

	funcao LimparTela()
	{
		limpa()
		tela=""
	}
}
