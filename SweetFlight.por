programa
{
	inclua biblioteca Texto
	inclua biblioteca Tipos
	inclua biblioteca Util
	inclua biblioteca Matematica

	const inteiro maxFilas=30,maxColunas=10
	const logico v=verdadeiro
	const logico f=falso
	const cadeia t="\t",n="\n"
	const inteiro tamCelula=15,larguraCabecalho=120

	
	inteiro aviao[maxFilas][maxColunas]
	cadeia cliente[maxFilas*maxColunas][4]

	inteiro criancas[maxFilas*maxColunas]
	inteiro adolescentes[maxFilas*maxColunas]
	inteiro adultos[maxFilas*maxColunas]
	inteiro idosos[maxFilas*maxColunas]

	inteiro totalPoltronas,totalReservas,totalDisponiveis
	real percentualReservas,percentualDisponiveis,percentualTotal=100.00
	
	inteiro totalFilas=0,totalColunas=0,opcao=0
	cadeia nomeCompanhia="SWEET FLIGHT",tela=""

	inteiro totalClientes=1,totalCriancas=0,totalAdolescentes=0,totalAdultos=0,totalIdosos=0
	real percentualCriancas,percentualAdolescentes,percentualAdultos,percentualIdosos

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
			LimparTela()
			tela=ObterMenuPrincipal() 
			escreva(tela)
			
			opcao=LerOpcao()
			escolha(opcao)
			{
				caso 1: CadastrarPoltronas() pare
				caso 2: ReservarPoltrona() pare
				caso 3: VerPoltronasDisponiveis() pare
				caso 4: VerPoltronasOcupadas() pare
				caso 5: VerPassageiro() pare
				caso 6: TotalizarVoo() pare
				caso 7: sair=v pare
				caso contrario: MostrarErro("Opção Inválida! Escolha de 1 a 7!") pare
			}
		}
	}
	
	funcao CadastrarPoltronas()
	{
		logico sair=f

		enquanto (nao sair)
		{
			LimparTela()
			tela=ObterMenuPoltronas()
			escreva(tela)
			
			opcao=LerOpcao()
			escolha(opcao)
			{
				caso 1: CadastrarFilas() pare
				caso 2: CadastrarColunas() pare
				caso 3: sair=v pare
				caso contrario: MostrarErro("Opção Inválida! Escolha de 1 a 3!") pare
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
		logico continuar=v
		
		se(totalFilas==0)
		{
			LimparTela()
			tela=ObterCabecalho(tituloPagina)
			continuar=LerSN("O número de filas não foi preenchido!"+n+"Deseja sair mesmo assim?")
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
			continuar=LerSN("O número de colunas não foi preenchido!\nDeseja sair mesmo assim?")
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

		LimparTela()
		tela=ObterCabecalho(tituloPagina)

		inteiro filas=0
		
		logico sair=f
		enquanto (nao sair) 
		{
			limpa()
			
			filas=LerInteiroPositivo("Quantas FILAS de poltronas possui a aeronave?",f)

			se(filas>=totalFilas e filas<=maxFilas)
			{
				sair=v
			}
			senao
			{
				MostrarErro("O número de filas deve ser maior ou igual a "+totalFilas+" e menor ou igual a "+maxFilas)
			}
		}
		
		totalFilas=filas
		
	}
			
	funcao CadastrarColunas()
	{
		cadeia acaoColuna=ObterAcaoColunas()
		cadeia tituloPagina=acaoColuna+" Colunas"

		LimparTela()
		tela=ObterCabecalho(tituloPagina)

		inteiro colunas=0
		
		logico sair=f
		enquanto (nao sair) 
		{
			limpa()
			
			colunas=LerInteiroPositivo("Quantas COLUNAS de poltronas possui a aeronave?",f)

			se(colunas>=totalColunas e colunas<=maxColunas)
			{
				sair=v
			}
			senao
			{
				MostrarErro("O número de colunas deve ser maior ou igual a "+totalColunas+" e menor ou igual a "+maxColunas)
			}
		}
		
		totalColunas=colunas
		
	}

	funcao ReservarPoltrona()
	{
		logico sair=f

		enquanto (nao sair)
		{

			LimparTela()
			tela=ObterMenuReservaPoltornas()
			escreva(tela)
			
			opcao=LerOpcao()
			escolha(opcao)
			{
				caso 1: CadastrarReserva() pare
				caso 2: RemoverReserva() pare
				caso 3: sair=v pare
				caso contrario: MostrarErro("Escolha uma opção entre 1 e 3!") pare
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
			fila=ObterFilaReserva()
			coluna=ObterColunaReserva()

			ValidarPoltronaDisponivel(fila,coluna,poltronaDisponivel)

			se (nao poltronaDisponivel)
			{
				MostrarErro("A poltrona "+fila+"-"+coluna+" já está reservada!\nPor favor, escolha outra poltrona.")
			}
		}

		CadastrarCliente(fila,coluna)
		aviao[fila-1][coluna-1]=idCliente
		
		MostrarMensagem("Poltrona "+fila+"-"+coluna+" reservada com sucesso para o cliente "+cliente[idCliente][0],1.5)
	}

	funcao CadastrarCliente(inteiro fila, inteiro coluna)
	{
		cadeia tituloPagina="Cadastro Cliente"
		
		LimparTela()
		tela=ObterCabecalho(tituloPagina)
		
		cadeia nome=LerCadeiaNaoNula("Qual o nome do cliente?")

		inteiro idade=LerInteiroPositivo("Idade do cliente?",v)

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
		
		LimparTela()
		tela=ObterCabecalho(tituloPagina)
		
		MostrarErro("Ainda não é possível remover reservas!")
	}

	funcao VerPoltronasDisponiveis()
	{
		cadeia tituloPagina="Poltronas Disponíveis"
		LimparTela()
		tela=ObterCabecalho(tituloPagina)

		tela+=ObterPoltronasVazias()
		tela+="Pressione ENTER para continuar!"

		escreva(tela)
		
		AguardarEnter()
	}
	
	funcao VerPoltronasOcupadas()
	{
		cadeia tituloPagina="Poltronas Reservadas"
		LimparTela()
		tela=ObterCabecalho(tituloPagina)
		
		tela+=ObterRelatorioOcupacao()
		tela+="Pressione ENTER para continuar!"
		
		escreva(tela)
		AguardarEnter()
	}

	funcao cadeia ObterRelatorioOcupacao()
	{
		cadeia relatorio=""
		cadeia matrizImprimir[99][99]

		inteiro linhas=0
		
		se(totalClientes>1)
		{
			matrizImprimir[0][0]="Nome"
			matrizImprimir[0][1]="Idade"
			matrizImprimir[0][2]="Fila"
			matrizImprimir[0][3]="Coluna"

			linhas++
			
			para(inteiro i=1;i<totalClientes;i++)
			{
				matrizImprimir[i][0]=cliente[i][0]
				matrizImprimir[i][1]=cliente[i][1]
				matrizImprimir[i][2]=cliente[i][2]
				matrizImprimir[i][3]=cliente[i][3]
				
				linhas++
			}

			relatorio+=MontarTabela(matrizImprimir,larguraCabecalho,linhas,4)+n+n
		}
		senao
		{
			relatorio="Não há Poltronas Reservadas!"
		}
		
		retorne relatorio
	}
	
	funcao VerPassageiro()
	{
		cadeia tituloPagina="Consultar Passageiro"
		LimparTela()
		tela=ObterCabecalho(tituloPagina)

		cadeia nomeFiltro=LerCadeiaNaoNula("Qual o nome do cliente?")
		
		tela+=ObterRelatorioPassageiro(nomeFiltro)
		tela+="Pressione ENTER para continuar!"
		limpa()
		escreva(tela)
		AguardarEnter()
		

	}

	funcao cadeia ObterRelatorioPassageiro(cadeia nomeFiltro)
	{
		cadeia relatorio=""
		cadeia matrizImprimir[99][99]

		inteiro totalResultados=0,linhas=0

		matrizImprimir[0][0]="Nome"
		matrizImprimir[0][1]="Idade"
		matrizImprimir[0][2]="Fila"
		matrizImprimir[0][3]="Coluna"

		linhas++
		
		para(inteiro i=1;i<totalClientes;i++)
		{
			
			cadeia nomePassageiro=cliente[i][0]
			inteiro posicao=Texto.posicao_texto(nomeFiltro, nomePassageiro, 0)
			se(posicao>=0)
			{
				totalResultados++
				
				matrizImprimir[totalResultados][0]=cliente[i][0]
				matrizImprimir[totalResultados][1]=cliente[i][1]
				matrizImprimir[totalResultados][2]=cliente[i][2]
				matrizImprimir[totalResultados][3]=cliente[i][3]

				linhas++
			}

		}

		se(totalResultados==0)
		{
			relatorio="Não há reservas realizadas com nome de passageiro "+nomeFiltro+"!"+n+n
		}
		senao
		{
			relatorio+=MontarTabela(matrizImprimir,larguraCabecalho,linhas,4)+n+n
		}
		
		retorne relatorio
	}

	funcao TotalizarVoo()
	{		
		cadeia tituloPagina="Totalizador do Voo"

		LimparTela()
		tela=ObterCabecalho(tituloPagina)

		CalcularTotaisPoltronas()
		
		CalcularTotaisPassageiros()

		tela += ObterRelatorioVoo()
		
		escreva(tela)
		
		AguardarEnter()
		
	}

	funcao CalcularTotaisPoltronas()
	{
		totalPoltronas=totalFilas*totalColunas
		totalReservas=totalClientes-1
		totalDisponiveis=totalPoltronas-totalReservas
		
		percentualReservas=Matematica.arredondar(Tipos.inteiro_para_real(totalReservas)/Tipos.inteiro_para_real(totalPoltronas)*100,2)
		percentualDisponiveis=Matematica.arredondar(Tipos.inteiro_para_real(totalDisponiveis)/Tipos.inteiro_para_real(totalPoltronas)*100,2)
		
	}

	funcao CalcularTotaisPassageiros()
	{				
			cadeia nome=""
			inteiro idade=0,fila=0,coluna=0
			totalCriancas=0
			totalAdolescentes=0
			totalAdultos=0
			totalIdosos=0

			se(totalClientes>1)
			{
				
				para(inteiro i=1;i<totalClientes;i++)
				{
					ObterDadosPassageiro(i,nome,idade,fila,coluna)
	
					se(idade<=12)
					{
						criancas[totalCriancas]=i
						totalCriancas++
					}
	
					se(idade>12 e idade<18)
					{
						adolescentes[totalAdolescentes]=i
						totalAdolescentes++
					}
	
					se(idade>=18 e idade<60)
					{
						adultos[totalAdultos]=i
						totalAdultos++
					}
	
					se(idade>=60)
					{
						idosos[totalIdosos]=i
						totalIdosos++
					}							
				}				
				percentualCriancas=Matematica.arredondar(Tipos.inteiro_para_real(totalCriancas)/Tipos.inteiro_para_real(totalClientes-1)*100,2)
				percentualAdolescentes=Matematica.arredondar(Tipos.inteiro_para_real(totalAdolescentes)/Tipos.inteiro_para_real(totalClientes-1)*100,2)
				percentualAdultos=Matematica.arredondar(Tipos.inteiro_para_real(totalAdultos)/Tipos.inteiro_para_real(totalClientes-1)*100,2)
				percentualIdosos=Matematica.arredondar(Tipos.inteiro_para_real(totalIdosos)/Tipos.inteiro_para_real(totalClientes-1)*100,2)
			}
			senao 
			{
				MostrarErro("Nenhuma reserva efetuada, o voo está vazio!")
			}
	}

	funcao ObterDadosPassageiro(inteiro indicePassageiro,cadeia &nome, inteiro &idade, inteiro &fila, inteiro &coluna)
	{
		nome=cliente[indicePassageiro][0]
		idade=Tipos.cadeia_para_inteiro(cliente[indicePassageiro][1],10)
		fila=Tipos.cadeia_para_inteiro(cliente[indicePassageiro][2],10)
		coluna=Tipos.cadeia_para_inteiro(cliente[indicePassageiro][3],10)
	}

	funcao cadeia ObterRelatorioVoo()
	{
		cadeia relatorio=""

		relatorio += ObterRelatorioPoltronas()
		relatorio += ObterTraco(larguraCabecalho)+n+n
		relatorio += ObterRelatorioPassageiros()
		
		retorne relatorio
	}

	funcao cadeia ObterRelatorioPoltronas()
	{
		cadeia relatorio=CentralizarTexto("Relatório de Poltronas:",larguraCabecalho)+n+n

		cadeia matrizTabela[4][3]

		matrizTabela[0][0]="Tipo"
		matrizTabela[0][1]="Total"
		matrizTabela[0][2]="Percentual"
		
		matrizTabela[1][0]="Reservas"
		matrizTabela[1][1]=Tipos.inteiro_para_cadeia(totalReservas,10)
		matrizTabela[1][2]=Tipos.real_para_cadeia(percentualReservas)
		
		matrizTabela[2][0]="Disponíveis"
		matrizTabela[2][1]=Tipos.inteiro_para_cadeia(totalDisponiveis,10)
		matrizTabela[2][2]=Tipos.real_para_cadeia(percentualDisponiveis)

		matrizTabela[3][0]="Total"
		matrizTabela[3][1]=Tipos.inteiro_para_cadeia(totalPoltronas,10)
		matrizTabela[3][2]=Tipos.real_para_cadeia(percentualTotal)

		relatorio  +=  MontarTabela(matrizTabela,larguraCabecalho,4,3)+n+n
		
		retorne relatorio
	}

	funcao cadeia ObterRelatorioPassageiros()
	{
		cadeia relatorio=CentralizarTexto("Relatório de Passageiros:",larguraCabecalho)+n+n

		cadeia matrizTabela[5][4]

		matrizTabela[0][0]="Descrição"
		matrizTabela[0][1]="Faixa Etária"
		matrizTabela[0][2]="Total"
		matrizTabela[0][3]="Percentual"
		
		matrizTabela[1][0]="Crianças"
		matrizTabela[1][1]="0 ~ 12 anos"
		matrizTabela[1][2]=Tipos.inteiro_para_cadeia(totalCriancas,10)
		matrizTabela[1][3]=Tipos.real_para_cadeia(percentualCriancas)
		
		matrizTabela[2][0]="Adolescentes"
		matrizTabela[2][1]="13 ~ 17 anos"
		matrizTabela[2][2]=Tipos.inteiro_para_cadeia(totalAdolescentes,10)
		matrizTabela[2][3]=Tipos.real_para_cadeia(percentualAdolescentes)
		
		matrizTabela[3][0]="Adultos"
		matrizTabela[3][1]="18 ~ 59 anos"
		matrizTabela[3][2]=Tipos.inteiro_para_cadeia(totalAdultos,10)
		matrizTabela[3][3]=Tipos.real_para_cadeia(percentualAdultos)
		
		matrizTabela[4][0]="Idosos"
		matrizTabela[4][1]="60 anos +"
		matrizTabela[4][2]=Tipos.inteiro_para_cadeia(totalIdosos,10)
		matrizTabela[4][3]=Tipos.real_para_cadeia(percentualIdosos)

		relatorio  +=  MontarTabela(matrizTabela,larguraCabecalho,5,4)+n+n
		
		retorne relatorio
	}

	funcao cadeia ObterPoltronasVazias()
	{
		cadeia relatorio=""
		inteiro linhas=0,colunas=0
		se(totalColunas*totalFilas>0)
		{
			cadeia matrizImprimir[99][99]

			matrizImprimir[0][0]=""
			colunas++
			linhas++
			//Monta Cabecalho
			para (inteiro k=0;k<totalColunas;k++)
			{
				matrizImprimir[0][k+1]="C "+(k+1)
				colunas++
			}

			//Monta Avião
			para(inteiro i=0;i<totalFilas;i++)
			{
				matrizImprimir[i+1][0]="F "+(i+1)
				linhas++
				
				para(inteiro j=0;j<totalColunas;j++)
				{
					se(aviao[i][j]==0)
					{
						matrizImprimir[i+1][j+1]="✔"
					}
					senao
					{
						matrizImprimir[i+1][j+1]="X"
					
					}
				}
			}
			relatorio+=MontarTabela(matrizImprimir,larguraCabecalho,linhas,colunas)+n+n
		}
		
		retorne relatorio
	}
	
	funcao inteiro ObterFilaReserva()
	{
		cadeia tituloPagina="Cadastrar Reserva"
		logico poltronaDisponivel=f
		inteiro idCliente=totalClientes

		LimparTela()
		tela=ObterCabecalho(tituloPagina)
		
		logico filaValida=f,maisFilas=f
		inteiro fila=0
		faca
		{	

			
			fila=LerInteiroPositivo("Qual é a Fila da reserva?",f)
			se(fila<=totalFilas)
			{
				filaValida=v
			}
			senao
			{
				MostrarErro("A fila não existe no avião!"+n+"Máximo de filas = "+totalFilas)
				maisFilas=LerSN("Deseja cadastrar mais filas?")
				se(maisFilas)
				{
					CadastrarFilas()
				}
				
			}
		}
		enquanto(nao filaValida)

		retorne fila
	}

	funcao inteiro ObterColunaReserva()
	{
		cadeia tituloPagina="Cadastrar Reserva"
		logico poltronaDisponivel=f
		inteiro idCliente=totalClientes

		LimparTela()
		tela=ObterCabecalho(tituloPagina)
		
		logico colunaValida=f,maisColunas=f
		inteiro coluna=0
		faca
		{	

			
			coluna=LerInteiroPositivo("Qual é a Coluna da reserva?",f)
			se(coluna<=totalColunas)
			{
				colunaValida=v
			}
			senao
			{
				MostrarErro("A coluna não existe no avião!\nMáximo de Colunas = "+totalColunas)
				maisColunas=LerSN("Deseja cadastrar mais colunas?")
				se(maisColunas)
				{
					CadastrarColunas()
				}
			}
		}
		enquanto(nao colunaValida)

		retorne coluna
	}	
	
	funcao cadeia ObterMenuPrincipal()
	{		
		cadeia acaoPoltrona=ObterAcaoPoltronas()
		cadeia menu=""
		
		menu += ObterCabecalho("Controle de Voo")
		menu += "1 - "+acaoPoltrona+" Poltronas"
		menu += n+"2 - Reservar Poltrona"
		menu += n+"3 - Ver Poltronas Disponíveis"
		menu += n+"4 - Ver Poltronas Reservadas"
		menu += n+"5 - Consultar Passageiro"
		menu += n+"6 - Totalizador do Voo"
		menu += n+"7 - Sair"
		menu += n+n

		retorne menu
	}

	funcao cadeia ObterMenuPoltronas()
	
	{
		cadeia acaoPoltrona=ObterAcaoPoltronas()
		cadeia tituloPagina=acaoPoltrona+" Poltronas"
		cadeia acaoFila=ObterAcaoFilas()
		cadeia acaoColuna=ObterAcaoColunas()
		cadeia menu=""
		
		menu += ObterCabecalho(tituloPagina)
		menu += "Quantidade de FILAS atual: "+totalFilas
		menu += n+"Quantidade de COLUNAS atual: "+totalColunas
		menu += n+n+"1 - "+acaoFila+" Filas"
		menu += n+"2 - "+acaoColuna+" Colunas"
		menu += n+"3 - Voltar"
		menu += n+n

		retorne menu
	}
		
	funcao cadeia ObterMenuReservaPoltornas()
	{
		cadeia tituloPagina="Reservar Poltrona"
		cadeia menu=""
		
		menu += ObterCabecalho(tituloPagina)
		menu += "1 - Cadastrar Reserva"
		menu += n+"2 - Remover Reserva"
		menu += n+"3 - Voltar"
		menu += n+n

		retorne menu
	}
		
	funcao cadeia ObterCabecalho(cadeia tituloPagina)
	{
		cadeia nomeFormatado=CentralizarTexto(nomeCompanhia,larguraCabecalho-2)
		cadeia tituloFormatado=CentralizarTexto(tituloPagina,larguraCabecalho-2)
		
		cadeia linhaBranco=ObterEspaco(larguraCabecalho-2)
		cadeia linhaTraco=ObterTraco(larguraCabecalho)
		
		cadeia cabecalho=""
		cabecalho += linhaTraco
		cabecalho += n+"|"+nomeFormatado+"|"
		cabecalho += n+"|"+linhaBranco+"|"
		cabecalho += n+"|"+tituloFormatado+"|"
		cabecalho += n+linhaTraco
		cabecalho += n+n
		
		retorne cabecalho
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
		
	funcao cadeia CentralizarTexto(cadeia texto,inteiro numeroCaracteres)
	{
		cadeia novoTexto=""
		inteiro tamanhoTexto=Texto.numero_caracteres(texto)

		
		se(tamanhoTexto<=numeroCaracteres)
		{
			inteiro numeroEspacos=numeroCaracteres-tamanhoTexto
			inteiro espacoAntes=numeroEspacos/2
			inteiro espacoDepois=numeroEspacos-espacoAntes

			novoTexto=ObterEspaco(espacoAntes)+texto+ObterEspaco(espacoDepois)
		}
		senao
		{
			novoTexto=Texto.extrair_subtexto(texto,0,numeroCaracteres)
		}
		retorne novoTexto
		
	}

	funcao cadeia ObterTraco(inteiro numeroCaracteres)
	{
		cadeia traco=""
		
		para(inteiro i=1;i<=numeroCaracteres;i++)
		{
			traco  +=  "-"
		}

		retorne traco
	}

	funcao cadeia ObterEspaco(inteiro numeroCaracteres)
	{
		cadeia espaco=""
		
		para(inteiro i=1;i<=numeroCaracteres;i++)
		{
			espaco  +=  " "
		}

		retorne espaco
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
		inteiro respostaInteiro=0
		
		faca
		{	
			limpa()
			escreva(tela+pergunta+n+n)
			leia(respostaCadeia)
			se (Tipos.cadeia_e_inteiro(respostaCadeia, 10))
			{
				respostaInteiro=Tipos.cadeia_para_inteiro(respostaCadeia, 10)
			}
			senao
			{
				escreva("A resposta precisa ser número inteiro!")
			}
		}
		enquanto (nao Tipos.cadeia_e_inteiro(respostaCadeia, 10))

		retorne respostaInteiro
	}
		
	funcao inteiro LerInteiroPositivo(cadeia pergunta,logico comZero)
	{
		inteiro respostaInteiro=-1
		cadeia tipo="positivo"
		se(comZero){tipo=+" ou zero"}
		
		faca
		{	
			respostaInteiro=LerInteiro(pergunta)
			se (respostaInteiro<0 ou (nao comZero e respostaInteiro==0))
			{
				escreva("O número precisa ser "+tipo+"!")
			}
			senao
			{
				retorne respostaInteiro
			}
		}
		enquanto (respostaInteiro<0)

		retorne respostaInteiro
	}

	funcao logico LerSN(cadeia perguntaSN)
	{
		cadeia SN=""
		logico respostaSN=v
		logico sair=f
		
		enquanto(nao sair)
		{	
			limpa()
			escreva(tela+perguntaSN+" (S/N)"+n+n)
			
			leia(SN)
			se(Texto.caixa_baixa(SN)=="s" ou Texto.caixa_baixa(SN)=="sim"){
				respostaSN=v
				sair=v
				retorne respostaSN
			} 
	
			se(Texto.caixa_baixa(SN)=="n" ou Texto.caixa_baixa(SN)=="nao" ou Texto.caixa_baixa(SN)=="não")
			{
				respostaSN=f
				sair=v
				retorne respostaSN
			} 

			MostrarErro("Reposta Inválida!"+n+"A resposta deve ser S ou N")
		}

		
		retorne respostaSN
	}

	funcao cadeia LerCadeiaNaoNula(cadeia pergunta)
	{
		cadeia respostaCadeia=""
		
		enquanto (respostaCadeia=="")
		{	
			limpa()
			escreva(tela+pergunta+n+n)
			leia(respostaCadeia)
			se (respostaCadeia=="")
			{
				MostrarErro("A resposta não pode ficar em branco!")
			}
		}


		retorne respostaCadeia
	}

	funcao cadeia MontarTabela(cadeia dados[][],inteiro larguraTabela,inteiro linhas,inteiro colunas)
	{
		cadeia tabela=""
		
		inteiro larguraRestante,larguraPadrao,colunasRestantes,largura
		
		cadeia traco=ObterTraco(larguraTabela)
		tabela += traco+n

		larguraPadrao=larguraTabela/colunas
		
		para(inteiro i=0;i<linhas;i++)
		{
			larguraRestante=larguraTabela
			colunasRestantes=colunas
			
			tabela += "|"
			larguraRestante--
			
			para(inteiro j=0;j<colunas;j++)
			{
				
				largura=larguraRestante/colunasRestantes
				tabela += CentralizarTexto(dados[i][j],largura-1)+"|"

				larguraRestante -= largura
				colunasRestantes--
			}

			tabela += n+traco+n
		}
		
		retorne tabela
	}
	
	funcao MostrarMensagem(cadeia mensagem,real countDown)
	{
		limpa()
		escreva(tela+mensagem)
		Util.aguarde(Tipos.real_para_inteiro(countDown*1000))
		limpa()
	}
	
	funcao MostrarErro(cadeia mensagem)
	{
		limpa()
		escreva(tela+mensagem)
		AguardarEnter()
		limpa()
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
