require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmACSVelen()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("br.com.rrpg.ACSVelen");
    obj:setTitle("Sistema de Combate Velen");
    obj:setName("frmACSVelen");

		
		function ProximaAcao()
			local minhaMesa = Firecast.getRoomOf(sheet)
			local chat = minhaMesa.chat
			acoes = {"Ação De Buff", "Ação de Ataque", "Ação de Defesa"}
			lista2 = criarEIncrementarLista();
			
			if acoes == nil then
				acoes = sheet.AcaoAtual
			end;
			
			if sheet.VezAtualIndex > #lista2 then
				sheet.VezAtualIndex = 1 -- reinicia o player para começar dnv
			end;
			
			if sheet.VezAtualIndex == nil then
				sheet.VezAtualIndex = 1
			else
				sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
			end;

			if sheet.AcaoAtualIndex == nil then
				sheet.AcaoAtualIndex = 1  -- Inicializa com a primeira ação
				sheet.AcaoAtualControle = acoes[sheet.AcaoAtualIndex]
				ProximoTurno();	
			else
				sheet.AcaoAtualIndex = sheet.AcaoAtualIndex + 1
				if sheet.AcaoAtualIndex > #acoes then
					sheet.AcaoAtualIndex = 1  -- Reinicia o ciclo das ações
					
					
					sheet.VezAtualIndex = sheet.VezAtualIndex + 1
					sheet.AcaoAtualControle = acoes[sheet.AcaoAtualIndex]
					
					sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
					if sheet.VezAtualControle == nil or sheet.VezAtualControle == "" then
						sheet.VezAtualIndex = 1
					else
						sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
					end;
					ProximoTurno();	
				end
			end

			sheet.AcaoAtual = acoes[sheet.AcaoAtualIndex]
			sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
			
			
			chat:enviarNarracao("[§K4]" .. sheet.AcaoAtual .. " [§K1]| do personagem | [§K4]" .. sheet.VezAtualControle .. "[§K1] | do Turno | [§K4]" .. sheet.TurnoAtualControle)
			
			if sheet.VezAtualIndex == nil then
				sheet.VezAtualIndex = 1
			else
				sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
			end;
		end;
		
		



		function AnteriorAcao()
			local minhaMesa = Firecast.getRoomOf(sheet)
			local chat = minhaMesa.chat
			acoes = {"Ação De Buff", "Ação de Ataque", "Ação de Defesa"}
			lista2 = criarEIncrementarLista();
			
			if sheet.VezAtualIndex < 1 then
				sheet.VezAtualIndex = #lista2
				sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
			end;

			if sheet.AcaoAtualIndex == nil then
				sheet.AcaoAtualIndex = 3  -- Inicializa com a primeira ação
				sheet.AcaoAtualControle = acoes[sheet.AcaoAtualIndex]
				AnteriorTurno();
			else
				sheet.AcaoAtualIndex = sheet.AcaoAtualIndex - 1
				if sheet.AcaoAtualIndex < 1 then
					sheet.AcaoAtualIndex = 3  -- Reinicia o ciclo das ações
					
					sheet.VezAtualIndex = sheet.VezAtualIndex - 1
					sheet.AcaoAtualControle = acoes[sheet.AcaoAtualIndex]
					sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
					if sheet.VezAtualControle == nil or sheet.VezAtualControle == "" then
						sheet.VezAtualIndex = #lista2
					else
						sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
					end;
					AnteriorTurno();
				end
			end

			sheet.AcaoAtual = acoes[sheet.AcaoAtualIndex]
			sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
			
			chat:enviarNarracao("[§K4]" .. sheet.AcaoAtual .. " [§K1]| do personagem | [§K4]" .. sheet.VezAtualControle .. "[§K1] | do Turno | [§K4]" .. sheet.TurnoAtualControle)
			
			if sheet.VezAtualIndex == nil then
				sheet.VezAtualIndex = 3
			else
				sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
			end;
		end;
		



		
	


		
		function ProximaVez()
			local minhaMesa = Firecast.getRoomOf(sheet)
			local chat = minhaMesa.chat
			acoes = {"Ação De Buff", "Ação de Ataque", "Ação de Defesa"}
			lista2 = criarEIncrementarListaVez();
			
			if acoes == nil then
				acoes = sheet.AcaoAtual
			end;
			
			if sheet.VezAtualIndex == nil then
				sheet.VezAtualIndex = 1
			end;

			sheet.VezAtualIndex = tonumber(sheet.VezAtualIndex) + 1

			if sheet.VezAtualIndex > #lista2 then
				sheet.VezAtualIndex = 1 -- reinicia o player para começar dnv
				ProximoTurno();	
			end;

			sheet.VezAtualControle = lista2[sheet.VezAtualIndex]

			if sheet.VezAtualControle == nil or sheet.VezAtualControle == "" then
				sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
			end;

			chat:enviarNarracao("[§K4]VEZ [§K1]ALTERADA PELO MESTRE [§K4]" .. sheet.VezAtualControle .. "[§K4] VEZ [§K1]DO TURNO [§K4]" .. sheet.TurnoAtualControle)
						
		end;
		
		



		function AnteriorVez()
			local minhaMesa = Firecast.getRoomOf(sheet)
			local chat = minhaMesa.chat
			acoes = {"Ação De Buff", "Ação de Ataque", "Ação de Defesa"}
			lista2 = criarEIncrementarListaVez();
			
			if acoes == nil then
				acoes = sheet.AcaoAtual
			end;
			
			if sheet.VezAtualIndex == nil then
				sheet.VezAtualIndex = #lista2
			end;

			sheet.VezAtualIndex = tonumber(sheet.VezAtualIndex) - 1

			if sheet.VezAtualIndex < 1 then
				sheet.VezAtualIndex = #lista2 -- reinicia o player para começar dnv
				AnteriorTurno();
			end;

			sheet.VezAtualControle = lista2[sheet.VezAtualIndex]

			if sheet.VezAtualControle == nil or sheet.VezAtualControle == "" then
				sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
			end;

			if sheet.TurnoAtualControle < 0 then
				sheet.TurnoAtualControle = 0
			end;

			chat:enviarNarracao("[§K4]VEZ [§K1]ALTERADA PELO MESTRE [§K4]" .. sheet.VezAtualControle .. "[§K4] VEZ [§K1]DO TURNO [§K4]" .. sheet.TurnoAtualControle)
						
		end;
		



		
		function criarEIncrementarListaVez()
		if sheet ~= nil then
			local nodesJ = ndb.getChildNodes(sheet.NomeJogador)  -- Obtém todos os nós filhos do campo NomeJogador
			local nodesO = ndb.getChildNodes(sheet.NomeOponentes)  -- Obtém todos os nós filhos do campo NomeOponentes
			
			lista = {}  -- Cria uma nova lista

			-- Itera sobre os nós e adiciona o NomeDoPersonagemVez de cada um à lista
			for _, node in ipairs(nodesJ) do
				if node.NomeDoPersonagemVez then  -- Verifica se o campo NomeDoPersonagemVez existe
					table.insert(lista, node.NomeDoPersonagemVez)  -- Adiciona o valor do campo NomeDoPersonagemVez à lista
				end
			end
			
			-- Itera sobre os nós e adiciona o NomeDoOponenteVez de cada um à lista
			for _, node in ipairs(nodesO) do
				if node.NomeDoOponenteVez then  -- Verifica se o campo NomeDoOponenteVez existe
					table.insert(lista, node.NomeDoOponenteVez)  -- Adiciona o valor do campo NomeDoOponenteVez à lista
				end
			end

			-- Ordena a lista em ordem alfabética
			table.sort(lista)

			-- Concatena todos os itens da lista em uma única string
			local listaStr = ""
			for i, item in ipairs(lista) do
				listaStr = listaStr .. "Item " .. i .. ": " .. tostring(item) .. "\n"
			end

			-- Exibe a lista concatenada em um único showMessage
			sheet.PersonagensEmCombate = listaStr
		else
			showMessage("A 'sheet' não está definida.")
		end

		return lista
		end
	



    function ProximoTurno()
        ASCPrincipal = sheet
        local minhaMesa = Firecast.getRoomOf(sheet)
        local chat = minhaMesa.chat
        acoes = {"Ação De Buff", "Ação de Ataque", "Ação de Defesa"}
        lista2 = criarEIncrementarLista();

        if acoes == nil then
            acoes = sheet.AcaoAtual
        end;

        if sheet.TurnoAtualControle == nil or sheet.TurnoAtualControle == "" then
            sheet.TurnoAtualControle = 1
        end;

        sheet.TurnoAtualControle = tonumber(sheet.TurnoAtualControle) + 1

        chat:enviarNarracao("[§K4]TURNO [§K1]ALTERADO PELO MESTRE | [§K4]" .. sheet.TurnoAtualControle)

        -- [[ INÍCIO DA MODIFICAÇÃO COM CALLBACK ]] --

        -- 1. Chamamos a primeira função e passamos a segunda como callback.
        SincronizaUmJogadorPorVezProximo(ndb.getChildNodes(ASCPrincipal.NomeJogador), function()
            -- 2. Este código só será executado DEPOIS que a função acima
            --    terminar 100% sua sincronização.
        end)
		 SincronizaUmOponentePorVezProximo(ndb.getChildNodes(ASCPrincipal.NomeOponentes), function()
			showMessage(0)
            -- 2. Este código só será executado DEPOIS que a função acima
            --    terminar 100% sua sincronização.
        end)

        -- [[ FIM DA MODIFICAÇÃO COM CALLBACK ]] --
    end

    



    function AnteriorTurno()
        -- (código da função AnteriorTurno permanece o mesmo)
        local minhaMesa = Firecast.getRoomOf(sheet)
        local chat = minhaMesa.chat
        acoes = {"Ação De Buff", "Ação de Ataque", "Ação de Defesa"}
        lista2 = criarEIncrementarLista();

        if acoes == nil then
            acoes = sheet.AcaoAtual
        end;

        if sheet.TurnoAtualControle == nil or sheet.TurnoAtualControle == "" then
            sheet.TurnoAtualControle = 1
        end;

        sheet.TurnoAtualControle = tonumber(sheet.TurnoAtualControle) - 1

        if sheet.TurnoAtualControle < 0 then
            sheet.TurnoAtualControle = 0
        end;

        chat:enviarNarracao("[§K4]TURNO [§K1]ALTERADO PELO MESTRE | [§K4]" .. sheet.TurnoAtualControle)
		-- [[ INÍCIO DA MODIFICAÇÃO COM CALLBACK ]] --

        -- 1. Chamamos a primeira função e passamos a segunda como callback.
        SincronizaUmJogadorPorVezAnterior(ndb.getChildNodes(ASCPrincipal.NomeJogador), function()
            -- 2. Este código só será executado DEPOIS que a função acima
            --    terminar 100% sua sincronização.
        end)
		        SincronizaUmOponentePorVezAnterior(ndb.getChildNodes(ASCPrincipal.NomeOponentes), function()
            -- 2. Este código só será executado DEPOIS que a função acima
            --    terminar 100% sua sincronização.)
        end)

        -- [[ FIM DA MODIFICAÇÃO COM CALLBACK ]] --
    end;
    


		
		function atualizarLog()
			-- Obtém o texto atual do log
			local logAtual = sheet.FieldLogCombat or ""

			-- Obtém a hora atual no formato HH:MM:SS
			local horaAtual = os.date("%H:%M:%S")

			-- Nova entrada formatada com a hora e duas quebras de linha
			local novaEntrada = "[" .. horaAtual .. "] " ..
								(sheet.VezdeQuem or "Alguém") .. " causou " .. 
								(sheet.DanoProLog or "0") .. " no alvo " .. 
								(sheet.AlvoRecebido or "Desconhecido") .. "\n\n"

			-- Adiciona a nova entrada no INÍCIO do log
			sheet.FieldLogCombat = novaEntrada .. logAtual

		end

		function atualizarLogCritical()
			-- Obtém o texto atual do log
			local logAtual = sheet.FieldLogCombat or ""

			-- Obtém a hora atual no formato HH:MM:SS
			local horaAtual = os.date("%H:%M:%S")

			-- Nova entrada formatada com a hora e duas quebras de linha
			local novaEntrada = "[" .. horaAtual .. "] " .. "⚡⚡CRITICAL⚡⚡ " ..
								(sheet.VezdeQuem or "Alguém") .. " causou " .. 
								(sheet.DanoProLog or "0") .. " no alvo " .. 
								(sheet.AlvoRecebido or "Desconhecido") .. "\n\n"
			-- Adiciona a nova entrada no INÍCIO do log
			sheet.FieldLogCombat = novaEntrada .. logAtual

		end

		function ResetaLog()
			Dialogs.confirmYesNo("Deseja realmente resetar o log?", function(confirmado)
				if confirmado then
					sheet.FieldLogCombat = nil					
				end
			end)
		end
	


		
		function VerificaDanoEmAreaGPUm(FamosoGrupoAlvo)
			for i, oponente in ipairs(FamosoGrupoAlvo) do
				SelfFichPrincipalASC.rclGrupoOponentes.selectedNode = oponente
				local nodes = ndb.getChildNodes(sheet.NomeOponentes)

				for _, node in ipairs(nodes) do						
					if oponente.NomeDoOponente == self.rclGrupoOponentes.node.NomeDoOponente then
						if	self.BoxDetalheOponentes.visible == true then
							local node = self.rclGrupoOponentes.selectedNode;   
							self.rclGrupoOponentes.node = node;
							
							local mesas = rrpg.getRooms();
							local bibliotecaAtual = mesas[1].library;

							local function obterNomesRecursivoI(bibItem)
								local itensFilhos = bibItem.children;
								local nomes = bibItem.name;								

								for i = 1, #itensFilhos, 1 do
									local bibItemFilho = itensFilhos[i];
									local nomesDoFilho = obterNomesRecursivoI(bibItemFilho) or "";									

									if nomesDoFilho == node.NomeDoOponente then
										-- Obter ID do personagem Loan
										local idPersonagem = bibItemFilho;
										

										-- Solicita acesso à ficha do personagem
										local promise = bibItemFilho:asyncOpenNDB();
										
										-- Aguarda até que a ficha esteja carregada
										local nodeExterno = await(promise);

										-- Sincronizando

										if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
											node.PA = tonumber(nodeExterno.PA) or '0';
											node.PM = tonumber(nodeExterno.PM) or '0';
											node.PF = tonumber(nodeExterno.PF) or '0';
											node.DEF = tonumber(nodeExterno.DEFRED) or '0';
											node.RES = tonumber(nodeExterno.RESRED) or '0';
											node.AC = tonumber(nodeExterno.Acerto) or '0';
											node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
											node.CR = tonumber(nodeExterno.Critical) or '0';
											node.CRM = tonumber(nodeExterno.CMagico) or '0';
											node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
											node.Pers = math.floor(tonumber(nodeExterno.Persistencia)) or '0';
											node.Vez = node.Vez or '0';
											node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
											node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
											node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
											node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
											node.Vigor = tonumber(nodeExterno.TVigor) or '0';
											node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
											node.MPBarMaxO = math.floor(tonumber(nodeExterno.MPTotal)) or '0';
											node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
											node.MPBarO = math.floor(tonumber(nodeExterno.MPAtual)) or '0';
											node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoOponente
											node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
										else
											node.PA = tonumber(nodeExterno.Dano) or '0';
											node.PM = tonumber(nodeExterno.DanoMagico) or '0';
											node.PF = "NPC";
											node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
											node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
											node.AC = tonumber(nodeExterno.Acerto) or '0';
											node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
											node.CR = tonumber(nodeExterno.Critical) or '0';
											node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
											node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
											node.Pers = math.floor(tonumber(nodeExterno.Persistencia)) or '0';
											node.Vez = node.Vez or '0';
											node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
											node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
											node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
											node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
											node.Vigor = tonumber(nodeExterno.TVigor) or '0';
											node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
											node.MPBarMaxO = math.floor(tonumber(nodeExterno.MPTotal)) or '0';
											node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
											node.MPBarO = math.floor(tonumber(nodeExterno.MPAtual)) or '0';
											node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
											node.imagemDoPersonagem = nodeExterno.imgInimigo
										end;

										node.HPBarO = tonumber(node.HPBarO - await(sheet.DanoRecebido or 0))
										nodeExterno.HPAtual = tonumber(node.HPBarO or '0');
										atualizarLog()

									end
								end
							return nomes
							end
							
							local nomesDeTodosOsItens = obterNomesRecursivoI(bibliotecaAtual);
						end;
						break
					end;
					
					
				end
			end;
				

		end
		
		
	


		
		function VerificaDanoEmAreaGPDois(FamosoGrupoAlvo)
			for i, oponente in ipairs(FamosoGrupoAlvo) do
				SelfFichPrincipalASC.rclGrupoJogadores.selectedNode = oponente
				local nodes = ndb.getChildNodes(sheet.NomeJogador)
				local nodex = SelfFichPrincipalASC.rclGrupoJogadores.selectedNode;   
				self.rclGrupoJogadores.node = nodex;

				for _, node in ipairs(nodes) do
					if oponente.NomeDoPersonagem == self.rclGrupoJogadores.node.NomeDoPersonagem then
						if	self.BoxDetalheJogadores.visible == true then
							local node = self.rclGrupoJogadores.selectedNode;   
							self.rclGrupoJogadores.node = node;
							
							local mesas = rrpg.getRooms();
							local bibliotecaAtual = mesas[1].library;

							local function obterNomesRecursivoP(bibItem)
								local itensFilhos = bibItem.children;
								local nomes = bibItem.name;

								for i = 1, #itensFilhos, 1 do
									local bibItemFilho = itensFilhos[i];
									local nomesDoFilho = obterNomesRecursivoP(bibItemFilho) or "";

									if nomesDoFilho == node.NomeDoPersonagem then
										-- Obter ID do personagem Loan
										local idPersonagem = bibItemFilho;

										-- Solicita acesso à ficha do personagem
										local promise = bibItemFilho:asyncOpenNDB();

										-- Aguarda até que a ficha esteja carregada
										local nodeExterno = await(promise);

										-- Sincronizando

										if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
											node.PA = tonumber(nodeExterno.PA) or '0';
											node.PM = tonumber(nodeExterno.PM) or '0';
											node.PF = tonumber(nodeExterno.PF) or '0';
											node.DEF = tonumber(nodeExterno.DEFRED) or '0';
											node.RES = tonumber(nodeExterno.RESRED) or '0';
											node.AC = tonumber(nodeExterno.Acerto) or '0';
											node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
											node.CR = tonumber(nodeExterno.Critical) or '0';
											node.CRM = tonumber(nodeExterno.CMagico) or '0';
											node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
											node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
											node.Vez = node.Vez or '0';
											node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
											node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
											node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
											node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
											node.Vigor = tonumber(nodeExterno.TVigor) or '0';
											node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
											node.MPBarMax = tonumber(math.floor(tonumber(nodeExterno.MPTotal)) or '0');
											node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
											node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
											node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoPersonagem
											node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
										else
											node.PA = tonumber(nodeExterno.Dano) or '0';
											node.PM = tonumber(nodeExterno.DanoMagico) or '0';
											node.PF = "NPC";
											node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
											node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
											node.AC = tonumber(nodeExterno.Acerto) or '0';
											node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
											node.CR = tonumber(nodeExterno.Critical) or '0';
											node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
											node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
											node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
											node.Vez = node.Vez or '0';
											node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
											node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
											node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
											node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
											node.Vigor = tonumber(nodeExterno.TVigor) or '0';
											node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
											node.MPBarMax = tonumber(math.floor(tonumber(nodeExterno.MPTotal)) or '0');
											node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
											node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
											node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
											node.imagemDoPersonagem = nodeExterno.imgInimigo
										end;

										
										node.HPBar = tonumber(node.HPBar - await(sheet.DanoRecebido or 0))
										nodeExterno.HPAtual = tonumber(node.HPBar) or '0';
										atualizarLog()
										
									end
								end
							return nomes
							end
							local nomesDeTodosOsItens = obterNomesRecursivoP(bibliotecaAtual);
						end;
						break
					end;
				end
			end;
				

		end
		
		
	


		
		function VerificaCuraEmAreaGPUm(FamosoGrupoAlvo)
			for i, oponente in ipairs(FamosoGrupoAlvo) do
				SelfFichPrincipalASC.rclGrupoOponentes.selectedNode = oponente
				local nodes = ndb.getChildNodes(sheet.NomeOponentes)

				for _, node in ipairs(nodes) do						
					if oponente.NomeDoOponente == self.rclGrupoOponentes.node.NomeDoOponente then
						if	self.BoxDetalheOponentes.visible == true then
							local node = self.rclGrupoOponentes.selectedNode;   
							self.rclGrupoOponentes.node = node;
							
							local mesas = rrpg.getRooms();
							local bibliotecaAtual = mesas[1].library;

							local function obterNomesRecursivoI(bibItem)
								local itensFilhos = bibItem.children;
								local nomes = bibItem.name;								

								for i = 1, #itensFilhos, 1 do
									local bibItemFilho = itensFilhos[i];
									local nomesDoFilho = obterNomesRecursivoI(bibItemFilho) or "";									

									if nomesDoFilho == node.NomeDoOponente then
										-- Obter ID do personagem Loan
										local idPersonagem = bibItemFilho;
										

										-- Solicita acesso à ficha do personagem
										local promise = bibItemFilho:asyncOpenNDB();
										
										-- Aguarda até que a ficha esteja carregada
										local nodeExterno = await(promise);

										-- Sincronizando

										if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
											node.PA = tonumber(nodeExterno.PA) or '0';
											node.PM = tonumber(nodeExterno.PM) or '0';
											node.PF = tonumber(nodeExterno.PF) or '0';
											node.DEF = tonumber(nodeExterno.DEFRED) or '0';
											node.RES = tonumber(nodeExterno.RESRED) or '0';
											node.AC = tonumber(nodeExterno.Acerto) or '0';
											node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
											node.CR = tonumber(nodeExterno.Critical) or '0';
											node.CRM = tonumber(nodeExterno.CMagico) or '0';
											node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
											node.Pers = math.floor(tonumber(nodeExterno.Persistencia)) or '0';
											node.Vez = node.Vez or '0';
											node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
											node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
											node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
											node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
											node.Vigor = tonumber(nodeExterno.TVigor) or '0';
											node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
											node.MPBarMaxO = math.floor(tonumber(nodeExterno.MPTotal)) or '0';
											node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
											node.MPBarO = math.floor(tonumber(nodeExterno.MPAtual)) or '0';
											node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoOponente
											node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
										else
											node.PA = tonumber(nodeExterno.Dano) or '0';
											node.PM = tonumber(nodeExterno.DanoMagico) or '0';
											node.PF = "NPC";
											node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
											node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
											node.AC = tonumber(nodeExterno.Acerto) or '0';
											node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
											node.CR = tonumber(nodeExterno.Critical) or '0';
											node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
											node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
											node.Pers = math.floor(tonumber(nodeExterno.Persistencia)) or '0';
											node.Vez = node.Vez or '0';
											node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
											node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
											node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
											node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
											node.Vigor = tonumber(nodeExterno.TVigor) or '0';
											node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
											node.MPBarMaxO = math.floor(tonumber(nodeExterno.MPTotal)) or '0';
											node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
											node.MPBarO = math.floor(tonumber(nodeExterno.MPAtual)) or '0';
											node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
											node.imagemDoPersonagem = nodeExterno.imgInimigo
										end;

										node.HPBarO = tonumber(node.HPBarO + await(math.abs(sheet.DanoRecebido)))
										nodeExterno.HPAtual = tonumber(node.HPBarO or '0');
										atualizarLog()

									end
								end
							return nomes
							end
							
							local nomesDeTodosOsItens = obterNomesRecursivoI(bibliotecaAtual);
						end;
						break
					end;
					
					
				end
			end;
				

		end
		
		
	


		
		function VerificaCuraEmAreaGPDois(FamosoGrupoAlvo)
			for i, oponente in ipairs(FamosoGrupoAlvo) do
				SelfFichPrincipalASC.rclGrupoJogadores.selectedNode = oponente
				local nodes = ndb.getChildNodes(sheet.NomeJogador)
				local nodex = SelfFichPrincipalASC.rclGrupoJogadores.selectedNode;   
				self.rclGrupoJogadores.node = nodex;

				for _, node in ipairs(nodes) do
					if oponente.NomeDoPersonagem == self.rclGrupoJogadores.node.NomeDoPersonagem then
						if	self.BoxDetalheJogadores.visible == true then
							local node = self.rclGrupoJogadores.selectedNode;   
							self.rclGrupoJogadores.node = node;
							
							local mesas = rrpg.getRooms();
							local bibliotecaAtual = mesas[1].library;

							local function obterNomesRecursivoP(bibItem)
								local itensFilhos = bibItem.children;
								local nomes = bibItem.name;

								for i = 1, #itensFilhos, 1 do
									local bibItemFilho = itensFilhos[i];
									local nomesDoFilho = obterNomesRecursivoP(bibItemFilho) or "";

									if nomesDoFilho == node.NomeDoPersonagem then
										-- Obter ID do personagem Loan
										local idPersonagem = bibItemFilho;

										-- Solicita acesso à ficha do personagem
										local promise = bibItemFilho:asyncOpenNDB();

										-- Aguarda até que a ficha esteja carregada
										local nodeExterno = await(promise);

										-- Sincronizando

										if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
											node.PA = tonumber(nodeExterno.PA) or '0';
											node.PM = tonumber(nodeExterno.PM) or '0';
											node.PF = tonumber(nodeExterno.PF) or '0';
											node.DEF = tonumber(nodeExterno.DEFRED) or '0';
											node.RES = tonumber(nodeExterno.RESRED) or '0';
											node.AC = tonumber(nodeExterno.Acerto) or '0';
											node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
											node.CR = tonumber(nodeExterno.Critical) or '0';
											node.CRM = tonumber(nodeExterno.CMagico) or '0';
											node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
											node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
											node.Vez = node.Vez or '0';
											node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
											node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
											node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
											node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
											node.Vigor = tonumber(nodeExterno.TVigor) or '0';
											node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
											node.MPBarMax = tonumber(math.floor(tonumber(nodeExterno.MPTotal)) or '0');
											node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
											node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
											node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoPersonagem
											node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
										else
											node.PA = tonumber(nodeExterno.Dano) or '0';
											node.PM = tonumber(nodeExterno.DanoMagico) or '0';
											node.PF = "NPC";
											node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
											node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
											node.AC = tonumber(nodeExterno.Acerto) or '0';
											node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
											node.CR = tonumber(nodeExterno.Critical) or '0';
											node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
											node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
											node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
											node.Vez = node.Vez or '0';
											node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
											node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
											node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
											node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
											node.Vigor = tonumber(nodeExterno.TVigor) or '0';
											node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
											node.MPBarMax = tonumber(math.floor(tonumber(nodeExterno.MPTotal)) or '0');
											node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
											node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
											node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
											node.imagemDoPersonagem = nodeExterno.imgInimigo
										end;

										
										node.HPBar = tonumber(node.HPBar + await(math.abs(sheet.DanoRecebido)))
										nodeExterno.HPAtual = tonumber(node.HPBar) or '0';
										atualizarLog()
										
									end
								end
							return nomes
							end
							local nomesDeTodosOsItens = obterNomesRecursivoP(bibliotecaAtual);
						end;
						break
					end;
				end
			end;
				

		end
		
		
	


		
		function DiminuiDuracaoEfeito(EffeitoVez)
			EffeitoVez.DuraEffect = tonumber(EffeitoVez.DuraEffect) - 1
		end

		function AumentaDuracaoEfeito(EffeitoVez)
			EffeitoVez.DuraEffect = tonumber(EffeitoVez.DuraEffect) + 1			
		end


		
		
	


		
		function AchaQuemEnviou(Usuario, Jogador, Oponente)
			local nodes = ndb.getChildNodes(Jogador) -- Obtém os nós da recordList
			function trim(s)
				return (s:gsub("^%s*(.-)%s*$", "%1"))
			end
			
			if #nodes > 0 then  -- Verifica se há elementos na lista
				for i, node in ipairs(nodes) do
					if trim(node.NomeDoPersonagem) == trim(Usuario) then
						return node
					end;
				end
			else
				
			end

			local nodes = ndb.getChildNodes(Oponente) -- Obtém os nós da recordList
			
			if #nodes > 0 then  -- Verifica se há elementos na lista
				for i, node in ipairs(nodes) do
					if trim(node.NomeDoOponente) == trim(Usuario) then
						return node
					end;
				end
			else
				
			end

			

		end


	


		
		function VerificaAlvo(Usuario, Jogador, Oponente)
			local nodes = ndb.getChildNodes(Jogador)

			function trim(s)
				return (s:gsub("^%s*(.-)%s*$", "%1"))
			end

			function limparNome(s)
				return s:match("%d+%s*%-%s*(.+)") or s
			end

			local usuarioLimpo = limparNome(trim(Usuario))

			if #nodes > 0 then
				for i, node in ipairs(nodes) do
					local nomeLimpo = limparNome(trim(node.NomeDoPersonagem))

					if nomeLimpo == usuarioLimpo then
						return node
					end
				end
			end

			nodes = ndb.getChildNodes(Oponente)

			if #nodes > 0 then
				for i, node in ipairs(nodes) do
					local nomeLimpo = limparNome(trim(node.NomeDoOponente))

					if nomeLimpo == usuarioLimpo then
						return node
					end
				end
			end
		end

	



    function DecideOqueRolar(UsuarioEnvio, AlvoEnviou, TipoDeEnvio, UsuarioEnvioCusto, BoxDetalheJogadores, BoxDetalheOponentes, depoisDoResultado)
        local mesaDoPersonagem = Firecast.getRoomOf(sheet)
        if sheet.TesteDecidido == "AtaqueBasico" then
            UsuarioEnvio.ACEffectTotal = tonumber(UsuarioEnvio.ACEffectTotal or 0)
            UsuarioEnvio.AC = tonumber(UsuarioEnvio.AC or 0)
            UsuarioEnvio.CREffectTotal = tonumber(UsuarioEnvio.CREffectTotal or 0)
            UsuarioEnvio.CR = tonumber(UsuarioEnvio.CR or 0)

            local TestedeExecucao = UsuarioEnvio.ACEffectTotal + UsuarioEnvio.AC
            local TestedeCR = UsuarioEnvio.CREffectTotal + UsuarioEnvio.CR
            sheet.AcertouPergunta = nil -- zera antes do teste

            mesaDoPersonagem.chat:rolarDados("1d20 + " .. TestedeExecucao, "Ataquinho Basiquinho",
                function (rolado)
                    -- controlador de critical para ataque basico --
                    local SoDadoAtaqueBasico = tonumber(rolado.resultado - TestedeExecucao)
                    if SoDadoAtaqueBasico >= TestedeCR then 
                        sheet.DanoRecebido = tonumber(sheet.DanoRecebido * 2) or 0
                        sheet.FoiCriticalLog = true;
                    else
                        sheet.FoiCriticalLog = false;
                    end

                    -- valida o acerto contra esquiva --
                    if rolado.resultado > AlvoEnviou.ESQ then                         
                        sheet.AcertouPergunta = "True"
                        CustoDeManaJogador(UsuarioEnvio, UsuarioEnvioCusto, BoxDetalheJogadores, BoxDetalheOponentes)
                    else
                        sheet.AcertouPergunta = "False"
                        mesaDoPersonagem.chat:enviarMensagem("Errou o Ataque no Alvo - " .. rolado.resultado)
                        
                    end

                    if depoisDoResultado then
                        depoisDoResultado()
                    end
                end)
        else
            -- Magia
            UsuarioEnvio.ACMEffectTotal = UsuarioEnvio.ACMEffectTotal or 0
            UsuarioEnvio.ACM = UsuarioEnvio.ACM or 0
            UsuarioEnvio.CRMEffectTotal = tonumber(UsuarioEnvio.CRMEffectTotal or 0)
            UsuarioEnvio.CRM = tonumber(UsuarioEnvio.CRM or 0)

            local TestedeExecucaoM = UsuarioEnvio.ACMEffectTotal + UsuarioEnvio.ACM
            local AcertoMagico = TestedeExecucaoM or 20
            local TestedeCRM = UsuarioEnvio.CRMEffectTotal + UsuarioEnvio.CRM

            sheet.AcertouPergunta = nil

            mesaDoPersonagem.chat:rolarDados("1d20", "Execucao de Habilidade",
                function (rolado)
                    -- controlador de critical para ataque basico --
                    if TestedeCRM >= rolado.resultado then 
                        sheet.DanoRecebido = tonumber(sheet.DanoRecebido * 2) or 0
                        sheet.FoiCriticalLog = true;
                    else
                        sheet.FoiCriticalLog = false;
                    end

                    if AcertoMagico >= rolado.resultado then                        
                        sheet.AcertouPergunta = "True"
                        CustoDeManaJogador(UsuarioEnvio, UsuarioEnvioCusto, BoxDetalheJogadores, BoxDetalheOponentes)
                    else
                        sheet.AcertouPergunta = "False"
                        mesaDoPersonagem.chat:enviarMensagem("Falha ao conjurar - " .. rolado.resultado)
                        
                    end

                    if depoisDoResultado then
                        depoisDoResultado()
                    end
                end)
        end
    end



		
		function CustoDeManaJogador(Usuario, Custo, BoxDetalheJogadores, BoxDetalheOponentes)
			

			local nodes = ndb.getChildNodes(sheet.NomeOponentes) -- Substitua pelo campo correto
			
			for _, node in ipairs(nodes) do
				if node.NomeDoOponenteVez == Usuario.NomeDoOponenteVez then
					
					self.rclGrupoOponentes.selectedNode = node
					break
				end
			end


			local nodes = ndb.getChildNodes(sheet.NomeJogador) -- Substitua pelo campo correto

			for _, node in ipairs(nodes) do
				if node.NomeDoPersonagemVez == Usuario.NomeDoPersonagemVez then
					
					self.rclGrupoJogadores.selectedNode = node
					break
				end
			end

			if sheet.GrupoRecebido == "2" then
				local nodes = ndb.getChildNodes(sheet.NomeOponentes)
				for _, node in ipairs(nodes) do
					if node.NomeDoOponenteVez == UsuarioEnvio.NomeDoOponenteVez then						

						if BoxDetalheOponentes.visible == true then
							local mesas = rrpg.getRooms()
							local bibliotecaAtual = mesas[1].library
							local node = self.rclGrupoOponentes.selectedNode   
							self.rclGrupoOponentes.node = node

							-- Função para remover espaços antes e depois do nome
							local function trim(str)
								return (str or ""):gsub("^%s*(.-)%s*$", "%1")
							end

							local function obterNomesRecursivoI(bibItem)
								local itensFilhos = bibItem.children
								local nomes = bibItem.name			

								for i = 1, #itensFilhos do
									local bibItemFilho = itensFilhos[i]
									local nomesDoFilho = obterNomesRecursivoI(bibItemFilho) or ""			

									if trim(nomesDoFilho):lower() == trim(node.NomeDoOponente):lower() then
										local idPersonagem = bibItemFilho
										local promise = bibItemFilho:asyncOpenNDB()
										local nodeExterno = await(promise)

										node.MPBarO = tonumber(math.floor((node.MPBarO or 0) - (tonumber(Custo) or 0)))
										nodeExterno.MPAtual = tonumber(node.MPBarO or 0)
										return nomes
									end
								end

								return nomes
							end

							local nomesDeTodosOsItens = obterNomesRecursivoI(bibliotecaAtual)
						end
					end
				end
			end



			if sheet.GrupoRecebido == "1" then
				local nodes = ndb.getChildNodes(sheet.NomeJogador)
				for _, node in ipairs(nodes) do

					if node.NomeDoPersonagemVez == UsuarioEnvio.NomeDoPersonagemVez then

						if BoxDetalheJogadores.visible == true then							
							local node = self.rclGrupoJogadores.selectedNode
							self.rclGrupoJogadores.node = node

							local mesas = rrpg.getRooms();
							local bibliotecaAtual = mesas[1].library;

							local function trim(str)
								return (str or ""):gsub("^%s*(.-)%s*$", "%1")
							end

							local function obterNomesRecursivoP(bibItem)
								local itensFilhos = bibItem.children
								local nomes = bibItem.name

								for i = 1, #itensFilhos do
									local bibItemFilho = itensFilhos[i]
									local nomesDoFilho = obterNomesRecursivoP(bibItemFilho) or ""

									if trim(nomesDoFilho):lower() == trim(node.NomeDoPersonagem):lower() then

										local idPersonagem = bibItemFilho
										local promise = bibItemFilho:asyncOpenNDB()
										local nodeExterno = await(promise)
										
										node.MPBar = tonumber(math.floor((node.MPBar or 0) - (tonumber(Custo) or 0)))
										nodeExterno.MPAtual = tonumber(node.MPBar or 0)
										return nomes
									end
								end

								return nomes
							end

							local nomesDeTodosOsItens = obterNomesRecursivoP(bibliotecaAtual)
						end
					end
				end
			end

			local nodes = ndb.getChildNodes(sheet.NomeOponentes) -- Substitua pelo campo correto
			
			for _, node in ipairs(nodes) do
				if node.NomeDoOponenteVez == Usuario.NomeDoOponenteVez then
					
					self.rclGrupoOponentes.selectedNode = node
					break
				end
			end


			local nodes = ndb.getChildNodes(sheet.NomeJogador) -- Substitua pelo campo correto

			for _, node in ipairs(nodes) do
				if node.NomeDoPersonagemVez == Usuario.NomeDoPersonagemVez then
					
					self.rclGrupoJogadores.selectedNode = node
					break
				end
			end


		end


	


		
		function SincronizaJogadorTurno(FamosoGrupoAlvo)
			if	self.BoxDetalheJogadores.visible == true then
				local node = FamosoGrupoAlvo;   
				
				local mesas = rrpg.getRooms();
				local bibliotecaAtual = mesas[1].library;

				local function obterNomesRecursivoP(bibItem)
					local itensFilhos = bibItem.children;
					local nomes = bibItem.name;

					for i = 1, #itensFilhos, 1 do
						local bibItemFilho = itensFilhos[i];
						local nomesDoFilho = obterNomesRecursivoP(bibItemFilho) or "";

						if nomesDoFilho == node.NomeDoPersonagem then
							-- Obter ID do personagem Loan
							local idPersonagem = bibItemFilho;

							-- Solicita acesso à ficha do personagem
							local promise = bibItemFilho:asyncOpenNDB();

							-- Aguarda até que a ficha esteja carregada
							local nodeExterno = await(promise);

							-- Sincronizando

							nodeExterno.HPAtual = tonumber(node.HPBar) or '0';	
							nodeExterno.MPAtual = tonumber(node.MPBar) or '0';									
						end
					end
				return nomes
				end
				local nomesDeTodosOsItens = obterNomesRecursivoP(bibliotecaAtual);
			end;	

		end		
	


		
		function SincronizaOponenteTurno(FamosoGrupoAlvo)
			if	self.BoxDetalheOponentes.visible == true then
				local node = FamosoGrupoAlvo;   
				
				local mesas = rrpg.getRooms();
				local bibliotecaAtual = mesas[1].library;

				local function obterNomesRecursivoP(bibItem)
					local itensFilhos = bibItem.children;
					local nomes = bibItem.name;

					for i = 1, #itensFilhos, 1 do
						local bibItemFilho = itensFilhos[i];
						local nomesDoFilho = obterNomesRecursivoP(bibItemFilho) or "";

						if nomesDoFilho == node.NomeDoOponente then
							-- Obter ID do personagem Loan
							local idPersonagem = bibItemFilho;

							-- Solicita acesso à ficha do personagem
							local promise = bibItemFilho:asyncOpenNDB();

							-- Aguarda até que a ficha esteja carregada
							local nodeExterno = await(promise);

							-- Sincronizando

							nodeExterno.HPAtual = tonumber(node.HPBarO) or '0';	
							nodeExterno.MPAtual = tonumber(node.MPBarO) or '0';									
						end
					end
				return nomes
				end
				local nomesDeTodosOsItens = obterNomesRecursivoP(bibliotecaAtual);
			end;	

		end		
	



    function SincronizaUmJogadorPorVezProximo(FamosoGrupoAlvo)
        for i, oponente in ipairs(FamosoGrupoAlvo) do
            SelfFichPrincipalASC.rclGrupoJogadores.selectedNode = oponente
			RclSelecionadoDaVez = SelfFichPrincipalASC.rclGrupoJogadores.selectedNode

            if RclSelecionadoDaVez.GlobalTurnoAnterior ~= ASCPrincipal.TurnoAtualControle then
                if ASCPrincipal ~= nil then
                    if sheet.ExpiraEffect ~= ASCPrincipal.TurnoAtualControle then
                        if RclSelecionadoDaVez ~= nil then
                            RclSelecionadoDaVez.DanoEffectTotal = 0
                            RclSelecionadoDaVez.CustoEffectTotal = 0
                            RclSelecionadoDaVez.CuraEffectTotal = 0
                            RclSelecionadoDaVez.RegMPEffectTotal = 0
                            if RclSelecionadoDaVez ~= nil then
                                local nodes = ndb.getChildNodes(RclSelecionadoDaVez.listaBuffs) -- Substitua pelo campo correto
                                for _, node in ipairs(nodes) do
                                    RclSelecionadoDaVez.DanoEffectTotal = tonumber(RclSelecionadoDaVez.DanoEffectTotal or 0) + tonumber(node.DanoEffect or 0)
                                    RclSelecionadoDaVez.CustoEffectTotal = tonumber(RclSelecionadoDaVez.CustoEffectTotal or 0) + tonumber(node.CustoEffect or 0)
                                    RclSelecionadoDaVez.CuraEffectTotal = tonumber(RclSelecionadoDaVez.CuraEffectTotal or 0) + tonumber(node.CuraEffect or 0)
                                    RclSelecionadoDaVez.RegMPEffectTotal = tonumber(RclSelecionadoDaVez.RegMPEffectTotal or 0) + tonumber(node.RegMPEffect or 0)
                                    DiminuiDuracaoEfeito(node)
                                end
                            end
                        end;
                    end;
                end;
                
                RclSelecionadoDaVez.HPBar = tonumber(math.floor(RclSelecionadoDaVez.HPBar) - (RclSelecionadoDaVez.DanoEffectTotal) or 0);
                RclSelecionadoDaVez.MPBar = tonumber(math.floor(RclSelecionadoDaVez.MPBar) - (RclSelecionadoDaVez.CustoEffectTotal) or 0);
                RclSelecionadoDaVez.HPBar = tonumber(math.floor(RclSelecionadoDaVez.HPBar) + (RclSelecionadoDaVez.CuraEffectTotal) or 0);
                RclSelecionadoDaVez.MPBar = tonumber(math.floor(RclSelecionadoDaVez.MPBar) + (RclSelecionadoDaVez.RegMPEffectTotal) or 0);

                -- 1. Chamamos a primeira função e passamos a segunda como callback.
                SincronizaJogadorTurno((RclSelecionadoDaVez), function()

                end)
                
            end;
            
        end
        RclSelecionadoDaVez.GlobalTurnoAnterior = tonumber(ASCPrincipal.TurnoAtualControle or 0)
    end

    function SincronizaUmJogadorPorVezAnterior(FamosoGrupoAlvo)
        for i, oponente in ipairs(FamosoGrupoAlvo) do
            SelfFichPrincipalASC.rclGrupoJogadores.selectedNode = oponente
			RclSelecionadoDaVez = SelfFichPrincipalASC.rclGrupoJogadores.selectedNode

            if RclSelecionadoDaVez.GlobalTurnoAnterior ~= ASCPrincipal.TurnoAtualControle then
                if ASCPrincipal ~= nil then
                    if sheet.ExpiraEffect ~= ASCPrincipal.TurnoAtualControle then
                        if RclSelecionadoDaVez ~= nil then
                            RclSelecionadoDaVez.DanoEffectTotal = 0
                            RclSelecionadoDaVez.CustoEffectTotal = 0
                            RclSelecionadoDaVez.CuraEffectTotal = 0
                            RclSelecionadoDaVez.RegMPEffectTotal = 0
                            if RclSelecionadoDaVez ~= nil then
                                local nodes = ndb.getChildNodes(RclSelecionadoDaVez.listaBuffs) -- Substitua pelo campo correto
                                for _, node in ipairs(nodes) do
                                    RclSelecionadoDaVez.DanoEffectTotal = tonumber(RclSelecionadoDaVez.DanoEffectTotal or 0) + tonumber(node.DanoEffect or 0)
                                    RclSelecionadoDaVez.CustoEffectTotal = tonumber(RclSelecionadoDaVez.CustoEffectTotal or 0) + tonumber(node.CustoEffect or 0)
                                    RclSelecionadoDaVez.CuraEffectTotal = tonumber(RclSelecionadoDaVez.CuraEffectTotal or 0) + tonumber(node.CuraEffect or 0)
                                    RclSelecionadoDaVez.RegMPEffectTotal = tonumber(RclSelecionadoDaVez.RegMPEffectTotal or 0) + tonumber(node.RegMPEffect or 0)
                                    AumentaDuracaoEfeito(node)
                                end
                            end
                        end;
                    end;
                end;
                
                RclSelecionadoDaVez.HPBar = tonumber(math.floor(RclSelecionadoDaVez.HPBar) + (RclSelecionadoDaVez.DanoEffectTotal) or 0);
                RclSelecionadoDaVez.MPBar = tonumber(math.floor(RclSelecionadoDaVez.MPBar) + (RclSelecionadoDaVez.CustoEffectTotal) or 0);
                RclSelecionadoDaVez.HPBar = tonumber(math.floor(RclSelecionadoDaVez.HPBar) - (RclSelecionadoDaVez.CuraEffectTotal) or 0);
                RclSelecionadoDaVez.MPBar = tonumber(math.floor(RclSelecionadoDaVez.MPBar) - (RclSelecionadoDaVez.RegMPEffectTotal) or 0);

                -- 1. Chamamos a primeira função e passamos a segunda como callback.
                SincronizaJogadorTurno((RclSelecionadoDaVez), function()

                end)
                
            end;
            
        end
        RclSelecionadoDaVez.GlobalTurnoAnterior = tonumber(ASCPrincipal.TurnoAtualControle or 0)
    end




    function SincronizaUmOponentePorVezProximo(FamosoGrupoAlvo)
        for i, oponente in ipairs(FamosoGrupoAlvo) do
            SelfFichPrincipalASC.rclGrupoOponentes.selectedNode = oponente
			RclSelecionadoDaVez = SelfFichPrincipalASC.rclGrupoOponentes.selectedNode

            if RclSelecionadoDaVez.GlobalTurnoAnterior ~= ASCPrincipal.TurnoAtualControle then
                if ASCPrincipal ~= nil then
                    if sheet.ExpiraEffect ~= ASCPrincipal.TurnoAtualControle then
                        if RclSelecionadoDaVez ~= nil then
                            RclSelecionadoDaVez.DanoEffectTotal = 0
                            RclSelecionadoDaVez.CustoEffectTotal = 0
                            RclSelecionadoDaVez.CuraEffectTotal = 0
                            RclSelecionadoDaVez.RegMPEffectTotal = 0
                            if RclSelecionadoDaVez ~= nil then
                                local nodes = ndb.getChildNodes(RclSelecionadoDaVez.listaBuffsO) -- Substitua pelo campo correto
                                for _, node in ipairs(nodes) do
                                    RclSelecionadoDaVez.DanoEffectTotal = tonumber(RclSelecionadoDaVez.DanoEffectTotal or 0) + tonumber(node.DanoEffect or 0)
                                    RclSelecionadoDaVez.CustoEffectTotal = tonumber(RclSelecionadoDaVez.CustoEffectTotal or 0) + tonumber(node.CustoEffect or 0)
                                    RclSelecionadoDaVez.CuraEffectTotal = tonumber(RclSelecionadoDaVez.CuraEffectTotal or 0) + tonumber(node.CuraEffect or 0)
                                    RclSelecionadoDaVez.RegMPEffectTotal = tonumber(RclSelecionadoDaVez.RegMPEffectTotal or 0) + tonumber(node.RegMPEffect or 0)
                                    DiminuiDuracaoEfeito(node)
                                end
                            end
                        end;
                    end;
                end;
                
                RclSelecionadoDaVez.HPBarO = tonumber(math.floor(RclSelecionadoDaVez.HPBarO) - (RclSelecionadoDaVez.DanoEffectTotal) or 0);
                RclSelecionadoDaVez.MPBarO = tonumber(math.floor(RclSelecionadoDaVez.MPBarO) - (RclSelecionadoDaVez.CustoEffectTotal) or 0);
                RclSelecionadoDaVez.HPBarO = tonumber(math.floor(RclSelecionadoDaVez.HPBarO) + (RclSelecionadoDaVez.CuraEffectTotal) or 0);
                RclSelecionadoDaVez.MPBarO = tonumber(math.floor(RclSelecionadoDaVez.MPBarO) + (RclSelecionadoDaVez.RegMPEffectTotal) or 0);
                
                -- 1. Chamamos a primeira função e passamos a segunda como callback.
                SincronizaOponenteTurno((RclSelecionadoDaVez), function()

                end)
                
            end;
            
        end
        RclSelecionadoDaVez.GlobalTurnoAnterior = tonumber(ASCPrincipal.TurnoAtualControle or 0)
    end

    function SincronizaUmOponentePorVezAnterior(FamosoGrupoAlvo)
        for i, oponente in ipairs(FamosoGrupoAlvo) do
            SelfFichPrincipalASC.rclGrupoOponentes.selectedNode = oponente
			RclSelecionadoDaVez = SelfFichPrincipalASC.rclGrupoOponentes.selectedNode

            if RclSelecionadoDaVez.GlobalTurnoAnterior ~= ASCPrincipal.TurnoAtualControle then
                if ASCPrincipal ~= nil then
                    if sheet.ExpiraEffect ~= ASCPrincipal.TurnoAtualControle then
                        if RclSelecionadoDaVez ~= nil then
                            RclSelecionadoDaVez.DanoEffectTotal = 0
                            RclSelecionadoDaVez.CustoEffectTotal = 0
                            RclSelecionadoDaVez.CuraEffectTotal = 0
                            RclSelecionadoDaVez.RegMPEffectTotal = 0
                            if RclSelecionadoDaVez ~= nil then
                                local nodes = ndb.getChildNodes(RclSelecionadoDaVez.listaBuffsO) -- Substitua pelo campo correto
                                for _, node in ipairs(nodes) do
                                    RclSelecionadoDaVez.DanoEffectTotal = tonumber(RclSelecionadoDaVez.DanoEffectTotal or 0) + tonumber(node.DanoEffect or 0)
                                    RclSelecionadoDaVez.CustoEffectTotal = tonumber(RclSelecionadoDaVez.CustoEffectTotal or 0) + tonumber(node.CustoEffect or 0)
                                    RclSelecionadoDaVez.CuraEffectTotal = tonumber(RclSelecionadoDaVez.CuraEffectTotal or 0) + tonumber(node.CuraEffect or 0)
                                    RclSelecionadoDaVez.RegMPEffectTotal = tonumber(RclSelecionadoDaVez.RegMPEffectTotal or 0) + tonumber(node.RegMPEffect or 0)
                                    AumentaDuracaoEfeito(node)
                                end
                            end
                        end;
                    end;
                end;
                
                RclSelecionadoDaVez.HPBarO = tonumber(math.floor(RclSelecionadoDaVez.HPBarO) + (RclSelecionadoDaVez.DanoEffectTotal) or 0);
                RclSelecionadoDaVez.MPBarO = tonumber(math.floor(RclSelecionadoDaVez.MPBarO) + (RclSelecionadoDaVez.CustoEffectTotal) or 0);
                RclSelecionadoDaVez.HPBarO = tonumber(math.floor(RclSelecionadoDaVez.HPBarO) - (RclSelecionadoDaVez.CuraEffectTotal) or 0);
                RclSelecionadoDaVez.MPBarO = tonumber(math.floor(RclSelecionadoDaVez.MPBarO) - (RclSelecionadoDaVez.RegMPEffectTotal) or 0);

                -- 1. Chamamos a primeira função e passamos a segunda como callback.
                SincronizaOponenteTurno((RclSelecionadoDaVez), function()

                end)
                
            end;
            
        end
        RclSelecionadoDaVez.GlobalTurnoAnterior = tonumber(ASCPrincipal.TurnoAtualControle or 0)
    end



		
		function HabilidadeCura(FamosoGrupoAlvo)
			--[[local mesaDoPersonagem = Firecast.getRoomOf(sheet); 
										if sheet.AlvoRecebido == "Dano em Área" then
											if sheet.GrupoRecebido == "1" then
												SelfFichPrincipalASC = self
												VerificaDanoEmAreaGPUm(ndb.getChildNodes(sheet.NomeOponentes))
												
											end;
											if sheet.GrupoRecebido == "2" then
												SelfFichPrincipalASC = self
												VerificaDanoEmAreaGPDois(ndb.getChildNodes(sheet.NomeJogador))
											end;

										elseif sheet.AlvoRecebido == "Cura em Área" then
											if sheet.GrupoRecebido == "1" then
												SelfFichPrincipalASC = self
												VerificaCuraEmAreaGPDois(ndb.getChildNodes(sheet.NomeJogador))
											end;
											if sheet.GrupoRecebido == "2" then
												SelfFichPrincipalASC = self
												VerificaCuraEmAreaGPUm(ndb.getChildNodes(sheet.NomeOponentes))
											end;

										else						
											
										if sheet.TipoRecebido == "Cura" or sheet.TipoRecebido == "Cura Fixa" then					
											if sheet.AlvoRecebido ~= nil and sheet.AlvoRecebido ~= "" then
												local nodes = ndb.getChildNodes(sheet.NomeOponentes) -- Substitua pelo campo correto
												
												for _, node in ipairs(nodes) do
													if node.NomeDoOponenteVez == sheet.AlvoRecebido then
														
														self.rclGrupoOponentes.selectedNode = node
														break
													end
												end
											end

											if sheet.AlvoRecebido ~= nil and sheet.AlvoRecebido ~= "" then
												local nodes = ndb.getChildNodes(sheet.NomeJogador) -- Substitua pelo campo correto

												for _, node in ipairs(nodes) do
													if node.NomeDoPersonagemVez == sheet.AlvoRecebido then
														
														self.rclGrupoJogadores.selectedNode = node
														break
													end
												end
											end

											if sheet.GrupoRecebido == "2" then
												local nodes = ndb.getChildNodes(sheet.NomeOponentes)
													
												for _, node in ipairs(nodes) do
													if node.NomeDoOponente == sheet.AlvoRecebido then						
														
														--AQUI--
														if	self.BoxDetalheOponentes.visible == true then
															local node = self.rclGrupoOponentes.selectedNode;   
															self.rclGrupoOponentes.node = node;
															
															local mesas = rrpg.getRooms();
															local bibliotecaAtual = mesas[1].library;

															local function obterNomesRecursivoO(bibItem)
																local itensFilhos = bibItem.children;
																local nomes = bibItem.name;								

																for i = 1, #itensFilhos, 1 do
																	local bibItemFilho = itensFilhos[i];
																	local nomesDoFilho = obterNomesRecursivoO(bibItemFilho) or "";									

																	if nomesDoFilho == node.NomeDoOponente then
																		-- Obter ID do personagem Loan
																		local idPersonagem = bibItemFilho;

																		-- Solicita acesso à ficha do personagem
																		local promise = bibItemFilho:asyncOpenNDB();
																		
																		

																		-- Aguarda até que a ficha esteja carregada
																		local nodeExterno = await(promise);

																		-- Sincronizando

																		if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
																			node.PA = tonumber(nodeExterno.PA or '0');
																			node.PM = tonumber(nodeExterno.PM or '0');
																			node.PF = tonumber(nodeExterno.PF or '0');
																			node.DEF = tonumber(nodeExterno.DEFRED or '0');
																			node.RES = tonumber(nodeExterno.RESRED or '0');
																			node.AC = tonumber(nodeExterno.Acerto or '0');
																			node.ACM = tonumber(nodeExterno.AcertoMagico or '0');
																			node.CR = tonumber(nodeExterno.Critical or '0');
																			node.CRM = tonumber(nodeExterno.CMagico or '0');
																			node.ESQ = tonumber(nodeExterno.Esquiva or '0');
																			node.Pers = math.floor(tonumber(nodeExterno.Persistencia) or '0');
																			node.Vez = node.Vez or '0';
																			node.Atletismo = tonumber(nodeExterno.TAtletismo or '0');
																			node.Sabedoria = tonumber(nodeExterno.TSabedoria or '0');
																			node.Percepcao = tonumber(nodeExterno.TPercepcao or '0');
																			node.Acrobacia = tonumber(nodeExterno.TAcrobacia or '0');
																			node.Vigor = tonumber(nodeExterno.TVigor or '0');
																			node.HPBarMaxO = tonumber(nodeExterno.HPTotal or '0');
																			node.MPBarMaxO = math.floor(tonumber(nodeExterno.MPTotal)) or '0';
																			node.HPBarO = tonumber(nodeExterno.HPAtual or '0');
																			node.MPBarO = math.floor(tonumber(nodeExterno.MPAtual)) or '0';
																			node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoOponente
																			node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
																		else
																			node.PA = tonumber(nodeExterno.Dano or '0');
																			node.PM = tonumber(nodeExterno.DanoMagico or '0');
																			node.PF = "NPC";
																			node.DEF = tonumber(nodeExterno.DefesaPorCent or '0');
																			node.RES = tonumber(nodeExterno.ResistenciaPorCent or '0');
																			node.AC = tonumber(nodeExterno.Acerto or '0');
																			node.ACM = tonumber(nodeExterno.AcertoMagico or '0');
																			node.CR = tonumber(nodeExterno.Critical or '0');
																			node.CRM = tonumber(nodeExterno.CriticalMagico or '0');
																			node.ESQ = tonumber(nodeExterno.Esquiva or '0');
																			node.Pers = math.floor(tonumber(nodeExterno.Persistencia) or '0');
																			node.Vez = node.Vez or '0';
																			node.Atletismo = tonumber(nodeExterno.Atletismo or '0');
																			node.Sabedoria = tonumber(nodeExterno.Sabedoria or '0');
																			node.Percepcao = tonumber(nodeExterno.Percepcao or '0');
																			node.Acrobacia = tonumber(nodeExterno.Acrobacia or '0');
																			node.Vigor = tonumber(nodeExterno.TVigor or '0');
																			node.HPBarMaxO = tonumber(nodeExterno.HPTotal or '0');
																			node.MPBarMaxO = math.floor(tonumber(nodeExterno.MPTotal)) or '0';
																			node.HPBarO = tonumber(nodeExterno.HPAtual or '0');
																			node.MPBarO = math.floor(tonumber(nodeExterno.MPAtual)) or '0';
																			node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
																			node.imagemDoPersonagem = nodeExterno.imgInimigo
																		end;

																		if sheet.TipoRecebido == "Cura" then 
																			UsuarioEnvio.PMEffectTotal = 0
																			sheet.DanoRecebido = tonumber(sheet.DanoRecebido) + tonumber(UsuarioEnvio.PMEffectTotal)
																		end;

																		node.HPBarO = tonumber(node.HPBarO + await(math.abs(sheet.DanoRecebido)))
																		nodeExterno.HPAtual = tonumber(node.HPBarO or '0');
																		atualizarLog()

																	end
																end
															return nomes
															end
															local nomesDeTodosOsItens = obterNomesRecursivoO(bibliotecaAtual);
														end;
														
													end
												end
											end;

											if sheet.GrupoRecebido == "1" then
												local nodes = ndb.getChildNodes(sheet.NomeJogador)
													
												for _, node in ipairs(nodes) do
													if node.NomeDoPersonagemVez == sheet.AlvoRecebido then
														if	self.BoxDetalheJogadores.visible == true then
															local node = self.rclGrupoJogadores.selectedNode;   
															self.rclGrupoJogadores.node = node;
															
															local mesas = rrpg.getRooms();
															local bibliotecaAtual = mesas[1].library;

															local function obterNomesRecursivoj(bibItem)
																local itensFilhos = bibItem.children;
																local nomes = bibItem.name;

																for i = 1, #itensFilhos, 1 do
																	local bibItemFilho = itensFilhos[i];
																	local nomesDoFilho = obterNomesRecursivoj(bibItemFilho) or "";

																	if nomesDoFilho == node.NomeDoPersonagem then
																		-- Obter ID do personagem Loan
																		local idPersonagem = bibItemFilho;

																		-- Solicita acesso à ficha do personagem
																		local promise = bibItemFilho:asyncOpenNDB();

																		-- Aguarda até que a ficha esteja carregada
																		local nodeExterno = await(promise);

																		-- Sincronizando

																		if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
																			node.PA = tonumber(nodeExterno.PA) or '0';
																			node.PM = tonumber(nodeExterno.PM) or '0';
																			node.PF = tonumber(nodeExterno.PF) or '0';
																			node.DEF = tonumber(nodeExterno.DEFRED) or '0';
																			node.RES = tonumber(nodeExterno.RESRED) or '0';
																			node.AC = tonumber(nodeExterno.Acerto) or '0';
																			node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
																			node.CR = tonumber(nodeExterno.Critical) or '0';
																			node.CRM = tonumber(nodeExterno.CMagico) or '0';
																			node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
																			node.Pers = math.floor(tonumber(nodeExterno.Persistencia) or '0');
																			node.Vez = node.Vez or '0';
																			node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
																			node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
																			node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
																			node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
																			node.Vigor = tonumber(nodeExterno.TVigor) or '0';
																			node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
																			node.MPBarMax = math.floor(tonumber(nodeExterno.MPTotal)) or '0';
																			node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
																			node.MPBar = math.floor(tonumber(nodeExterno.MPAtual)) or '0';
																			node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoPersonagem
																			node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
																		else
																			node.PA = tonumber(nodeExterno.Dano) or '0';
																			node.PM = tonumber(nodeExterno.DanoMagico or '0');
																			node.PF = "NPC";
																			node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
																			node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
																			node.AC = tonumber(nodeExterno.Acerto) or '0';
																			node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
																			node.CR = tonumber(nodeExterno.Critical) or '0';
																			node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
																			node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
																			node.Pers = math.floor(tonumber(nodeExterno.Persistencia) or '0');
																			node.Vez = node.Vez or '0';
																			node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
																			node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
																			node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
																			node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
																			node.Vigor = tonumber(nodeExterno.TVigor) or '0';
																			node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
																			node.MPBarMax = math.floor(tonumber(nodeExterno.MPTotal)) or '0';
																			node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
																			node.MPBar = math.floor(tonumber(nodeExterno.MPAtual)) or '0';
																			node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
																			node.imagemDoPersonagem = nodeExterno.imgInimigo
																		end;

																		if sheet.TipoRecebido == "Cura" then 
																			UsuarioEnvio.PMEffectTotal = 0
																			sheet.DanoRecebido = tonumber(sheet.DanoRecebido) + tonumber(UsuarioEnvio.PMEffectTotal)
																		end;

																		node.HPBar = tonumber(node.HPBar + await(math.abs(sheet.DanoRecebido)))
																		nodeExterno.HPAtual = tonumber(node.HPBar) or '0';
																		atualizarLog()
																		
																	end
																end
															return nomes
															end
															local nomesDeTodosOsItens = obterNomesRecursivoj(bibliotecaAtual);
														end;
														
													end
												end
											end
										else
										end;
									end;]]
			showMessage("curou 1")	

		end
		
		
		
	


    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setTop(10);
    obj.button1:setLeft(10);
    obj.button1:setText("Adicionar Jogador");
    obj.button1:setWidth(150);
    obj.button1:setHeight(30);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setTop(10);
    obj.button2:setLeft(200);
    obj.button2:setText("Combatentes");
    obj.button2:setWidth(150);
    obj.button2:setHeight(30);
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setTop(10);
    obj.button3:setLeft(400);
    obj.button3:setText("Inicia Combate");
    obj.button3:setWidth(150);
    obj.button3:setHeight(30);
    obj.button3:setName("button3");

    obj.rclGrupoJogadores = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclGrupoJogadores:setParent(obj);
    obj.rclGrupoJogadores:setTop(40);
    obj.rclGrupoJogadores:setLeft(10);
    obj.rclGrupoJogadores:setWidth(600);
    obj.rclGrupoJogadores:setHeight(300);
    obj.rclGrupoJogadores:setName("rclGrupoJogadores");
    obj.rclGrupoJogadores:setField("NomeJogador");
    obj.rclGrupoJogadores:setTemplateForm("frmItemJogador");
    obj.rclGrupoJogadores:setSelectable(true);

    obj.BoxDetalheJogadores = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.BoxDetalheJogadores:setParent(obj);
    obj.BoxDetalheJogadores:setTop(350);
    obj.BoxDetalheJogadores:setLeft(10);
    obj.BoxDetalheJogadores:setName("BoxDetalheJogadores");
    obj.BoxDetalheJogadores:setVisible(false);
    obj.BoxDetalheJogadores:setHeight(350);
    obj.BoxDetalheJogadores:setWidth(600);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.BoxDetalheJogadores);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setHeight(180);
    obj.rectangle1:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(150);
    obj.layout1:setMargins({right=2});
    obj.layout1:setName("layout1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout1);
    obj.image1:setAlign("top");
    obj.image1:setWidth(100);
    obj.image1:setMargins({top=1});
    obj.image1:setField("imagemDoPersonagem");
    obj.image1:setSRC("http://fc03.deviantart.net/fs70/i/2011/234/5/4/dragon_aspects_by_rattlesnakedefender-d47ii5y.jpg");
    obj.image1:setName("image1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("top");
    obj.label1:setText("Jogador:");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWidth(150);
    obj.label1:setMargins({top=1});
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("top");
    obj.edit1:setWidth(150);
    obj.edit1:setField("NomeDoPersonagem");
    obj.edit1:setMargins({top=1});
    obj.edit1:setName("edit1");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout1);
    obj.button4:setAlign("top");
    obj.button4:setWidth(150);
    obj.button4:setText("Sincronizar");
    obj.button4:setMargins({right=1});
    obj.button4:setName("button4");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout1);
    obj.progressBar1:setAlign("top");
    obj.progressBar1:setWidth(150);
    obj.progressBar1:setColor("red");
    obj.progressBar1:setField("HPBar");
    obj.progressBar1:setFieldMax("HPBarMax");
    obj.progressBar1:setMargins({top=1});
    obj.progressBar1:setName("progressBar1");

    obj.gambiHP = GUI.fromHandle(_obj_newObject("edit"));
    obj.gambiHP:setParent(obj.progressBar1);
    obj.gambiHP:setName("gambiHP");
    obj.gambiHP:setAlign("left");
    obj.gambiHP:setTransparent(true);
    obj.gambiHP:setHitTest(false);
    obj.gambiHP:setHorzTextAlign("center");
    obj.gambiHP:setField("HPBar");

    obj.edtHPAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtHPAtual:setParent(obj.progressBar1);
    obj.edtHPAtual:setName("edtHPAtual");
    obj.edtHPAtual:setVisible(false);
    obj.edtHPAtual:setAlign("left");
    obj.edtHPAtual:setCanFocus(false);
    obj.edtHPAtual:setTransparent(true);
    obj.edtHPAtual:setHitTest(false);
    obj.edtHPAtual:setHorzTextAlign("center");
    obj.edtHPAtual:setField("HPBarResolve");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.progressBar1);
    obj.label2:setAlign("client");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("/");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.progressBar1);
    obj.label3:setAlign("right");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setField("HPBarMax");
    obj.label3:setName("label3");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.layout1);
    obj.progressBar2:setAlign("top");
    obj.progressBar2:setWidth(150);
    obj.progressBar2:setColor("blue");
    obj.progressBar2:setField("MPBar");
    obj.progressBar2:setFieldMax("MPBarMax");
    obj.progressBar2:setMargins({top=1});
    obj.progressBar2:setName("progressBar2");

    obj.gambiMP = GUI.fromHandle(_obj_newObject("edit"));
    obj.gambiMP:setParent(obj.progressBar2);
    obj.gambiMP:setName("gambiMP");
    obj.gambiMP:setAlign("left");
    obj.gambiMP:setTransparent(true);
    obj.gambiMP:setHitTest(false);
    obj.gambiMP:setHorzTextAlign("center");
    obj.gambiMP:setField("MPBar");

    obj.edtMPAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtMPAtual:setParent(obj.progressBar2);
    obj.edtMPAtual:setName("edtMPAtual");
    obj.edtMPAtual:setVisible(false);
    obj.edtMPAtual:setAlign("left");
    obj.edtMPAtual:setCanFocus(false);
    obj.edtMPAtual:setTransparent(true);
    obj.edtMPAtual:setHitTest(false);
    obj.edtMPAtual:setHorzTextAlign("center");
    obj.edtMPAtual:setField("MPBarResolve");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.progressBar2);
    obj.label4:setAlign("right");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("---/---");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.progressBar2);
    obj.label5:setAlign("right");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setField("MPBarMax");
    obj.label5:setName("label5");

    obj.btnEditStatus = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEditStatus:setParent(obj.layout1);
    obj.btnEditStatus:setName("btnEditStatus");
    obj.btnEditStatus:setAlign("top");
    obj.btnEditStatus:setFontColor("white");
    obj.btnEditStatus:setWidth(150);
    obj.btnEditStatus:setText("Editar ✎");
    obj.btnEditStatus:setMargins({top=1});

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout1);
    obj.image2:setAlign("top");
    obj.image2:setWidth(64);
    obj.image2:setHeight(64);
    obj.image2:setSRC("./imagens/buff.png");
    obj.image2:setMargins({top=5});
    obj.image2:setName("image2");

    obj.btnEffect = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEffect:setParent(obj.image2);
    obj.btnEffect:setName("btnEffect");
    obj.btnEffect:setOpacity(0.0);
    obj.btnEffect:setAlign("client");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(50);
    obj.layout2:setMargins({right=1});
    obj.layout2:setName("layout2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setAlign("top");
    obj.label6:setText("Status");
    obj.label6:setWidth(50);
    obj.label6:setMargins({left=10});
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setAlign("top");
    obj.label7:setText("PA:");
    obj.label7:setWidth(50);
    obj.label7:setMargins({left=10});
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setAlign("top");
    obj.label8:setText("PM:");
    obj.label8:setWidth(50);
    obj.label8:setMargins({left=10});
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setAlign("top");
    obj.label9:setText("PF:");
    obj.label9:setWidth(50);
    obj.label9:setMargins({left=10});
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setAlign("top");
    obj.label10:setText("DEF:");
    obj.label10:setWidth(50);
    obj.label10:setMargins({left=10});
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setAlign("top");
    obj.label11:setText("RES:");
    obj.label11:setWidth(50);
    obj.label11:setMargins({left=10});
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setAlign("top");
    obj.label12:setText("---");
    obj.label12:setWidth(50);
    obj.label12:setMargins({left=10});
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setAlign("top");
    obj.label13:setText("AC:");
    obj.label13:setWidth(50);
    obj.label13:setMargins({left=10});
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setAlign("top");
    obj.label14:setText("ACM:");
    obj.label14:setWidth(50);
    obj.label14:setMargins({left=10});
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setAlign("top");
    obj.label15:setText("CR:");
    obj.label15:setWidth(50);
    obj.label15:setMargins({left=10});
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setAlign("top");
    obj.label16:setText("CRM:");
    obj.label16:setWidth(50);
    obj.label16:setMargins({left=10});
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setAlign("top");
    obj.label17:setText("---");
    obj.label17:setWidth(50);
    obj.label17:setMargins({left=10});
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout2);
    obj.label18:setAlign("top");
    obj.label18:setText("ESQ:");
    obj.label18:setWidth(50);
    obj.label18:setMargins({left=10});
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout2);
    obj.label19:setAlign("top");
    obj.label19:setText("Pers:");
    obj.label19:setWidth(50);
    obj.label19:setMargins({left=10});
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout2);
    obj.label20:setAlign("top");
    obj.label20:setText("---");
    obj.label20:setWidth(50);
    obj.label20:setMargins({left=10});
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout2);
    obj.label21:setAlign("top");
    obj.label21:setText("Vez:");
    obj.label21:setFontColor("green");
    obj.label21:setWidth(50);
    obj.label21:setMargins({left=10});
    obj.label21:setName("label21");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(50);
    obj.layout3:setMargins({right=1});
    obj.layout3:setName("layout3");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout3);
    obj.label22:setAlign("top");
    obj.label22:setText("Valor");
    obj.label22:setWidth(50);
    obj.label22:setMargins({left=10});
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout3);
    obj.label23:setAlign("top");
    obj.label23:setField("PA");
    obj.label23:setWidth(50);
    obj.label23:setMargins({left=10});
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout3);
    obj.label24:setAlign("top");
    obj.label24:setField("PM");
    obj.label24:setWidth(50);
    obj.label24:setMargins({left=10});
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout3);
    obj.label25:setAlign("top");
    obj.label25:setField("PF");
    obj.label25:setWidth(50);
    obj.label25:setMargins({left=10});
    obj.label25:setName("label25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout3);
    obj.label26:setAlign("top");
    obj.label26:setField("DEF");
    obj.label26:setWidth(50);
    obj.label26:setMargins({left=10});
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout3);
    obj.label27:setAlign("top");
    obj.label27:setField("RES");
    obj.label27:setWidth(50);
    obj.label27:setMargins({left=10});
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout3);
    obj.label28:setAlign("top");
    obj.label28:setText("---");
    obj.label28:setWidth(50);
    obj.label28:setMargins({left=10});
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout3);
    obj.label29:setAlign("top");
    obj.label29:setField("AC");
    obj.label29:setWidth(50);
    obj.label29:setMargins({left=10});
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout3);
    obj.label30:setAlign("top");
    obj.label30:setField("ACM");
    obj.label30:setWidth(50);
    obj.label30:setMargins({left=10});
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout3);
    obj.label31:setAlign("top");
    obj.label31:setField("CR");
    obj.label31:setWidth(50);
    obj.label31:setMargins({left=10});
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout3);
    obj.label32:setAlign("top");
    obj.label32:setField("CRM");
    obj.label32:setWidth(50);
    obj.label32:setMargins({left=10});
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout3);
    obj.label33:setAlign("top");
    obj.label33:setText("---");
    obj.label33:setWidth(50);
    obj.label33:setMargins({left=10});
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout3);
    obj.label34:setAlign("top");
    obj.label34:setField("ESQ");
    obj.label34:setWidth(50);
    obj.label34:setMargins({left=10});
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout3);
    obj.label35:setAlign("top");
    obj.label35:setField("Pers");
    obj.label35:setWidth(50);
    obj.label35:setMargins({left=10});
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout3);
    obj.label36:setAlign("top");
    obj.label36:setText("---");
    obj.label36:setWidth(50);
    obj.label36:setMargins({left=10});
    obj.label36:setName("label36");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setAlign("top");
    obj.edit2:setField("Vez");
    obj.edit2:setFontColor("green");
    obj.edit2:setWidth(50);
    obj.edit2:setMargins({left=10});
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(50);
    obj.layout4:setMargins({right=1});
    obj.layout4:setName("layout4");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout4);
    obj.label37:setAlign("top");
    obj.label37:setText("Efeitos");
    obj.label37:setWidth(50);
    obj.label37:setMargins({left=10});
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout4);
    obj.label38:setAlign("top");
    obj.label38:setField("PAEffectTotal");
    obj.label38:setWidth(50);
    obj.label38:setMargins({left=10});
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout4);
    obj.label39:setAlign("top");
    obj.label39:setField("PMEffectTotal");
    obj.label39:setWidth(50);
    obj.label39:setMargins({left=10});
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout4);
    obj.label40:setAlign("top");
    obj.label40:setField("PFEffectTotal");
    obj.label40:setWidth(50);
    obj.label40:setMargins({left=10});
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout4);
    obj.label41:setAlign("top");
    obj.label41:setField("DEFEffectTotal");
    obj.label41:setWidth(50);
    obj.label41:setMargins({left=10});
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout4);
    obj.label42:setAlign("top");
    obj.label42:setField("RESEffectTotal");
    obj.label42:setWidth(50);
    obj.label42:setMargins({left=10});
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout4);
    obj.label43:setAlign("top");
    obj.label43:setText("---");
    obj.label43:setWidth(50);
    obj.label43:setMargins({left=10});
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout4);
    obj.label44:setAlign("top");
    obj.label44:setField("ACEffectTotal");
    obj.label44:setWidth(50);
    obj.label44:setMargins({left=10});
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout4);
    obj.label45:setAlign("top");
    obj.label45:setField("ACMEffectTotal");
    obj.label45:setWidth(50);
    obj.label45:setMargins({left=10});
    obj.label45:setName("label45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout4);
    obj.label46:setAlign("top");
    obj.label46:setField("CREffectTotal");
    obj.label46:setWidth(50);
    obj.label46:setMargins({left=10});
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout4);
    obj.label47:setAlign("top");
    obj.label47:setField("CRMEffectTotal");
    obj.label47:setWidth(50);
    obj.label47:setMargins({left=10});
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout4);
    obj.label48:setAlign("top");
    obj.label48:setText("---");
    obj.label48:setWidth(50);
    obj.label48:setMargins({left=10});
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout4);
    obj.label49:setAlign("top");
    obj.label49:setField("ESQEffectTotal");
    obj.label49:setWidth(50);
    obj.label49:setMargins({left=10});
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout4);
    obj.label50:setAlign("top");
    obj.label50:setField("PersEffectTotal");
    obj.label50:setWidth(50);
    obj.label50:setMargins({left=10});
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout4);
    obj.label51:setAlign("top");
    obj.label51:setText("---");
    obj.label51:setWidth(50);
    obj.label51:setMargins({left=10});
    obj.label51:setName("label51");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(50);
    obj.layout5:setMargins({right=1});
    obj.layout5:setName("layout5");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout5);
    obj.label52:setAlign("top");
    obj.label52:setText("Total");
    obj.label52:setWidth(50);
    obj.label52:setMargins({left=10});
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout5);
    obj.label53:setAlign("top");
    obj.label53:setField("PATotal");
    obj.label53:setWidth(50);
    obj.label53:setMargins({left=10});
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout5);
    obj.label54:setAlign("top");
    obj.label54:setField("PMTotal");
    obj.label54:setWidth(50);
    obj.label54:setMargins({left=10});
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout5);
    obj.label55:setAlign("top");
    obj.label55:setField("PFTotal");
    obj.label55:setWidth(50);
    obj.label55:setMargins({left=10});
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout5);
    obj.label56:setAlign("top");
    obj.label56:setField("DEFTotal");
    obj.label56:setWidth(50);
    obj.label56:setMargins({left=10});
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout5);
    obj.label57:setAlign("top");
    obj.label57:setField("RESTotal");
    obj.label57:setWidth(50);
    obj.label57:setMargins({left=10});
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout5);
    obj.label58:setAlign("top");
    obj.label58:setText("---");
    obj.label58:setWidth(50);
    obj.label58:setMargins({left=10});
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout5);
    obj.label59:setAlign("top");
    obj.label59:setField("ACTotal");
    obj.label59:setWidth(50);
    obj.label59:setMargins({left=10});
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout5);
    obj.label60:setAlign("top");
    obj.label60:setField("ACMTotal");
    obj.label60:setWidth(50);
    obj.label60:setMargins({left=10});
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout5);
    obj.label61:setAlign("top");
    obj.label61:setField("CRTotal");
    obj.label61:setWidth(50);
    obj.label61:setMargins({left=10});
    obj.label61:setName("label61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout5);
    obj.label62:setAlign("top");
    obj.label62:setField("CRMTotal");
    obj.label62:setWidth(50);
    obj.label62:setMargins({left=10});
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout5);
    obj.label63:setAlign("top");
    obj.label63:setText("---");
    obj.label63:setWidth(50);
    obj.label63:setMargins({left=10});
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout5);
    obj.label64:setAlign("top");
    obj.label64:setField("ESQTotal");
    obj.label64:setWidth(50);
    obj.label64:setMargins({left=10});
    obj.label64:setName("label64");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout5);
    obj.label65:setAlign("top");
    obj.label65:setField("PersTotal");
    obj.label65:setWidth(50);
    obj.label65:setMargins({left=10});
    obj.label65:setName("label65");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout5);
    obj.label66:setAlign("top");
    obj.label66:setText("---");
    obj.label66:setWidth(50);
    obj.label66:setMargins({left=10});
    obj.label66:setName("label66");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(75);
    obj.layout6:setMargins({right=1});
    obj.layout6:setName("layout6");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout6);
    obj.label67:setAlign("top");
    obj.label67:setText("Vitais");
    obj.label67:setWidth(75);
    obj.label67:setMargins({left=10});
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout6);
    obj.label68:setAlign("top");
    obj.label68:setText("HPTotal");
    obj.label68:setWidth(75);
    obj.label68:setMargins({left=10});
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout6);
    obj.label69:setAlign("top");
    obj.label69:setText("MPTotal");
    obj.label69:setWidth(75);
    obj.label69:setMargins({left=10});
    obj.label69:setName("label69");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(50);
    obj.layout7:setMargins({right=1});
    obj.layout7:setName("layout7");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout7);
    obj.label70:setAlign("top");
    obj.label70:setText("Valor");
    obj.label70:setWidth(50);
    obj.label70:setMargins({left=10});
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout7);
    obj.label71:setAlign("top");
    obj.label71:setField("HPEffectTotals");
    obj.label71:setWidth(50);
    obj.label71:setMargins({left=10});
    obj.label71:setName("label71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout7);
    obj.label72:setAlign("top");
    obj.label72:setField("MPEffectTotals");
    obj.label72:setWidth(50);
    obj.label72:setMargins({left=10});
    obj.label72:setName("label72");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(50);
    obj.layout8:setMargins({right=1});
    obj.layout8:setName("layout8");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout8);
    obj.label73:setAlign("top");
    obj.label73:setText("Total");
    obj.label73:setWidth(50);
    obj.label73:setMargins({left=10});
    obj.label73:setName("label73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout8);
    obj.label74:setAlign("top");
    obj.label74:setField("HPTotalTotal");
    obj.label74:setWidth(50);
    obj.label74:setMargins({left=10});
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout8);
    obj.label75:setAlign("top");
    obj.label75:setField("MPTotalTotal");
    obj.label75:setWidth(50);
    obj.label75:setMargins({left=10});
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj);
    obj.label76:setText("Controle de Turnos");
    obj.label76:setLeft(620);
    obj.label76:setWidth(150);
    obj.label76:setTop(10);
    obj.label76:setFontSize(15);
    obj.label76:setName("label76");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj);
    obj.layout9:setLeft(620);
    obj.layout9:setTop(40);
    obj.layout9:setWidth(200);
    obj.layout9:setHeight(60);
    obj.layout9:setName("layout9");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout9);
    obj.label77:setText("Turno Atual:");
    obj.label77:setAlign("top");
    obj.label77:setAutoSize(true);
    obj.label77:setFontSize(16);
    obj.label77:setFontColor("white");
    obj.label77:setName("label77");

    obj.editTurnoAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.editTurnoAtual:setParent(obj.layout9);
    obj.editTurnoAtual:setName("editTurnoAtual");
    obj.editTurnoAtual:setField("TurnoAtualControle");
    obj.editTurnoAtual:setAlign("top");
    obj.editTurnoAtual:setWidth(200);
    obj.editTurnoAtual:setHeight(20);
    obj.editTurnoAtual:setHorzTextAlign("center");

    obj.btnTurnoAnterior = GUI.fromHandle(_obj_newObject("button"));
    obj.btnTurnoAnterior:setParent(obj.layout9);
    obj.btnTurnoAnterior:setName("btnTurnoAnterior");
    obj.btnTurnoAnterior:setText("AnteriorRR");
    obj.btnTurnoAnterior:setAlign("left");
    obj.btnTurnoAnterior:setWidth(90);
    obj.btnTurnoAnterior:setHeight(20);
    obj.btnTurnoAnterior:setTop(40);

    obj.btnTurnoProximo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnTurnoProximo:setParent(obj.layout9);
    obj.btnTurnoProximo:setName("btnTurnoProximo");
    obj.btnTurnoProximo:setText("Próximo");
    obj.btnTurnoProximo:setAlign("right");
    obj.btnTurnoProximo:setWidth(90);
    obj.btnTurnoProximo:setHeight(20);
    obj.btnTurnoProximo:setTop(40);

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj);
    obj.layout10:setLeft(620);
    obj.layout10:setTop(120);
    obj.layout10:setWidth(200);
    obj.layout10:setHeight(60);
    obj.layout10:setName("layout10");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout10);
    obj.label78:setText("Vez Atual:");
    obj.label78:setAlign("top");
    obj.label78:setAutoSize(true);
    obj.label78:setFontSize(16);
    obj.label78:setFontColor("white");
    obj.label78:setName("label78");

    obj.editVezAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.editVezAtual:setParent(obj.layout10);
    obj.editVezAtual:setName("editVezAtual");
    obj.editVezAtual:setField("VezAtualControle");
    obj.editVezAtual:setAlign("top");
    obj.editVezAtual:setWidth(200);
    obj.editVezAtual:setHeight(20);
    obj.editVezAtual:setReadOnly(true);
    obj.editVezAtual:setHorzTextAlign("center");

    obj.btnVezAnterior = GUI.fromHandle(_obj_newObject("button"));
    obj.btnVezAnterior:setParent(obj.layout10);
    obj.btnVezAnterior:setName("btnVezAnterior");
    obj.btnVezAnterior:setText("Anterior");
    obj.btnVezAnterior:setAlign("left");
    obj.btnVezAnterior:setWidth(90);
    obj.btnVezAnterior:setHeight(20);
    obj.btnVezAnterior:setTop(40);

    obj.btnVezProximo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnVezProximo:setParent(obj.layout10);
    obj.btnVezProximo:setName("btnVezProximo");
    obj.btnVezProximo:setText("PRÓXIMO");
    obj.btnVezProximo:setAlign("right");
    obj.btnVezProximo:setWidth(90);
    obj.btnVezProximo:setHeight(20);
    obj.btnVezProximo:setTop(40);

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj);
    obj.layout11:setLeft(620);
    obj.layout11:setTop(200);
    obj.layout11:setWidth(200);
    obj.layout11:setHeight(60);
    obj.layout11:setName("layout11");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout11);
    obj.label79:setText("Ação Atual:");
    obj.label79:setAlign("top");
    obj.label79:setAutoSize(true);
    obj.label79:setFontSize(16);
    obj.label79:setFontColor("white");
    obj.label79:setName("label79");

    obj.editAcaoAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.editAcaoAtual:setParent(obj.layout11);
    obj.editAcaoAtual:setName("editAcaoAtual");
    obj.editAcaoAtual:setField("AcaoAtual");
    obj.editAcaoAtual:setAlign("top");
    obj.editAcaoAtual:setWidth(200);
    obj.editAcaoAtual:setHeight(20);
    obj.editAcaoAtual:setReadOnly(false);
    obj.editAcaoAtual:setHorzTextAlign("center");

    obj.btnAcaoAnterior = GUI.fromHandle(_obj_newObject("button"));
    obj.btnAcaoAnterior:setParent(obj.layout11);
    obj.btnAcaoAnterior:setName("btnAcaoAnterior");
    obj.btnAcaoAnterior:setText("Anterior");
    obj.btnAcaoAnterior:setAlign("left");
    obj.btnAcaoAnterior:setWidth(90);
    obj.btnAcaoAnterior:setHeight(20);
    obj.btnAcaoAnterior:setTop(40);

    obj.btnAcaoProximo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnAcaoProximo:setParent(obj.layout11);
    obj.btnAcaoProximo:setName("btnAcaoProximo");
    obj.btnAcaoProximo:setText("Próximo");
    obj.btnAcaoProximo:setAlign("right");
    obj.btnAcaoProximo:setWidth(90);
    obj.btnAcaoProximo:setHeight(20);
    obj.btnAcaoProximo:setTop(40);

    obj.TrocadorDeAcao = GUI.fromHandle(_obj_newObject("timer"));
    obj.TrocadorDeAcao:setParent(obj);
    obj.TrocadorDeAcao:setName("TrocadorDeAcao");
    obj.TrocadorDeAcao:setInterval(10000);
    obj.TrocadorDeAcao:setEnabled(false);

    obj.AvisoDeTempo = GUI.fromHandle(_obj_newObject("timer"));
    obj.AvisoDeTempo:setParent(obj);
    obj.AvisoDeTempo:setName("AvisoDeTempo");
    obj.AvisoDeTempo:setInterval(1000);
    obj.AvisoDeTempo:setEnabled(false);


		local tempoDecorrido = 0
		local tempoTotal = 30
		
		
		
		function AcaoAtualControlador()
			local minhaMesa = Firecast.getRoomOf(sheet)
			local chat = minhaMesa.chat
			acoes = {"Ação De Buff", "Ação de Ataque", "Ação de Defesa"}
			criarEIncrementarLista();
			
			if acoes == nil then
				acoes = sheet.AcaoAtual
			end;
			
			if sheet.VezAtualIndex == nil then
				sheet.VezAtualIndex = 1
			else
				sheet.VezAtualControle = lista[sheet.VezAtualIndex]
			end;
			
			if sheet.VezAtualIndex >= #lista then
				sheet.VezAtualIndex = 1 -- reinicia o player para começar dnv
			end;

			if sheet.AcaoAtualIndex == nil then
				sheet.AcaoAtualIndex = 1  -- Inicializa com a primeira ação
				sheet.AcaoAtualControle = acoes[sheet.AcaoAtualIndex]
				sheet.TurnoAtualControle = (sheet.TurnoAtualControle or 0) + 1
			else
				sheet.AcaoAtualIndex = sheet.AcaoAtualIndex + 1
				if sheet.AcaoAtualIndex > #acoes then
					sheet.AcaoAtualIndex = 1  -- Reinicia o ciclo das ações
					sheet.TurnoAtualControle = (sheet.TurnoAtualControle or 0) + 1
					sheet.VezAtualIndex = sheet.VezAtualIndex + 1
					sheet.AcaoAtualControle = acoes[sheet.AcaoAtualIndex]
					sheet.VezAtualControle = lista[sheet.VezAtualIndex]
				end
			end

			sheet.AcaoAtual = acoes[sheet.AcaoAtualIndex]
			chat:enviarNarracao(sheet.AcaoAtual)

			-- Reiniciar o contador de tempo
			
			self.AvisoDeTempo.interval = 1000  -- Restaurar o intervalo do timer para 1 segundo
			self.AvisoDeTempo.enabled = true  -- Iniciar o timer de aviso de tempo
			AvisoDeTempoControlador()
		end


		function AvisoDeTempoControlador()
			local minhaMesa = Firecast.getRoomOf(sheet)
			local chat = minhaMesa.chat

			-- Incrementar o tempo decorrido
			tempoDecorrido = tempoDecorrido + 1
			local tempoRestante = tempoTotal - tempoDecorrido

			if tempoRestante == 10 then
				chat:enviarNarracao("Faltam " .. tempoRestante .. " segundos para a próxima ação, vez de " .. sheet.VezAtualControle)
			end
			
			if tempoRestante == 5 then
				chat:enviarNarracao("Faltam " .. tempoRestante .. " segundos para a próxima ação, vez de " .. sheet.VezAtualControle)
			end
			
			if tempoRestante == 5 then
				chat:enviarNarracao("Faltam " .. tempoRestante .. " segundos para a próxima ação, vez de " .. sheet.VezAtualControle)
			end
			
			if tempoRestante == 1 then
				-- Enviar mensagem de ação perdida
				chat:enviarNarracao("Você perdeu a ação!")

				-- Reiniciar o contador de tempo
				tempoDecorrido = 0
				self.AvisoDeTempo.interval = 10000  -- Restaurar o intervalo do timer para 10 segundos
				self.AvisoDeTempo.enabled = true  -- Reiniciar o timer de aviso de tempo
			end
		end

		function Aviso1SegundoControlador()
			local minhaMesa = Firecast.getRoomOf(sheet)
			local chat = minhaMesa.chat

			-- Enviar mensagem de ação perdida
			chat:enviarNarracao("Você perdeu a ação!")

			-- Reiniciar o contador de tempo
			tempoDecorrido = 0
			self.AvisoDeTempo.interval = 10000  -- Restaurar o intervalo do timer para 10 segundos
			self.AvisoDeTempo.enabled = true  -- Reiniciar o timer de aviso de tempo
		end
	
	function criarEIncrementarLista()
    if sheet ~= nil then
        local nodesJ = ndb.getChildNodes(sheet.NomeJogador)  -- Obtém todos os nós filhos do campo NomeJogador
        local nodesO = ndb.getChildNodes(sheet.NomeOponentes)  -- Obtém todos os nós filhos do campo NomeOponentes
        
        lista = {}  -- Cria uma nova lista

        -- Itera sobre os nós e adiciona o NomeDoPersonagemVez de cada um à lista
        for _, node in ipairs(nodesJ) do
            if node.NomeDoPersonagemVez then  -- Verifica se o campo NomeDoPersonagemVez existe
                table.insert(lista, node.NomeDoPersonagemVez)  -- Adiciona o valor do campo NomeDoPersonagemVez à lista
            end
        end
        
        -- Itera sobre os nós e adiciona o NomeDoOponenteVez de cada um à lista
        for _, node in ipairs(nodesO) do
            if node.NomeDoOponenteVez then  -- Verifica se o campo NomeDoOponenteVez existe
                table.insert(lista, node.NomeDoOponenteVez)  -- Adiciona o valor do campo NomeDoOponenteVez à lista
            end
        end

        -- Ordena a lista em ordem alfabética
        table.sort(lista)

        -- Concatena todos os itens da lista em uma única string
        local listaStr = ""
        for i, item in ipairs(lista) do
            listaStr = listaStr .. "Item " .. i .. ": " .. tostring(item) .. "\n"
        end

        -- Exibe a lista concatenada em um único showMessage
        sheet.PersonagensEmCombate = listaStr
    else
        showMessage("A 'sheet' não está definida.")
    end

    return lista
	end


			


	


    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj);
    obj.button5:setTop(10);
    obj.button5:setLeft(830);
    obj.button5:setText("Adicionar Oponentes");
    obj.button5:setWidth(150);
    obj.button5:setHeight(30);
    obj.button5:setName("button5");

    obj.rclGrupoOponentes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclGrupoOponentes:setParent(obj);
    obj.rclGrupoOponentes:setTop(40);
    obj.rclGrupoOponentes:setLeft(830);
    obj.rclGrupoOponentes:setWidth(600);
    obj.rclGrupoOponentes:setHeight(300);
    obj.rclGrupoOponentes:setName("rclGrupoOponentes");
    obj.rclGrupoOponentes:setField("NomeOponentes");
    obj.rclGrupoOponentes:setTemplateForm("frmItemOponente");
    obj.rclGrupoOponentes:setSelectable(true);

    obj.BoxDetalheOponentes = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.BoxDetalheOponentes:setParent(obj);
    obj.BoxDetalheOponentes:setTop(350);
    obj.BoxDetalheOponentes:setLeft(830);
    obj.BoxDetalheOponentes:setName("BoxDetalheOponentes");
    obj.BoxDetalheOponentes:setVisible(false);
    obj.BoxDetalheOponentes:setHeight(350);
    obj.BoxDetalheOponentes:setWidth(600);

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.BoxDetalheOponentes);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setHeight(180);
    obj.rectangle2:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle2:setName("rectangle2");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle2);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(150);
    obj.layout12:setMargins({right=2});
    obj.layout12:setName("layout12");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout12);
    obj.image3:setAlign("top");
    obj.image3:setWidth(100);
    obj.image3:setMargins({top=1});
    obj.image3:setField("imagemInimigo");
    obj.image3:setSRC("http://fc03.deviantart.net/fs70/i/2011/234/5/4/dragon_aspects_by_rattlesnakedefender-d47ii5y.jpg");
    obj.image3:setName("image3");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout12);
    obj.label80:setAlign("top");
    obj.label80:setText("Jogador:");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setWidth(150);
    obj.label80:setMargins({top=1});
    obj.label80:setName("label80");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout12);
    obj.edit3:setAlign("top");
    obj.edit3:setWidth(150);
    obj.edit3:setField("NomeDoOponente");
    obj.edit3:setMargins({top=1});
    obj.edit3:setName("edit3");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout12);
    obj.button6:setAlign("top");
    obj.button6:setWidth(150);
    obj.button6:setText("Sincronizar");
    obj.button6:setMargins({right=1});
    obj.button6:setName("button6");

    obj.progressBar3 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar3:setParent(obj.layout12);
    obj.progressBar3:setAlign("top");
    obj.progressBar3:setWidth(150);
    obj.progressBar3:setColor("red");
    obj.progressBar3:setField("HPBarO");
    obj.progressBar3:setFieldMax("HPBarMaxO");
    obj.progressBar3:setMargins({top=1});
    obj.progressBar3:setName("progressBar3");

    obj.gambiHPO = GUI.fromHandle(_obj_newObject("edit"));
    obj.gambiHPO:setParent(obj.progressBar3);
    obj.gambiHPO:setName("gambiHPO");
    obj.gambiHPO:setAlign("left");
    obj.gambiHPO:setTransparent(true);
    obj.gambiHPO:setHitTest(false);
    obj.gambiHPO:setHorzTextAlign("center");
    obj.gambiHPO:setField("HPBarO");

    obj.edtHPAtualO = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtHPAtualO:setParent(obj.progressBar3);
    obj.edtHPAtualO:setName("edtHPAtualO");
    obj.edtHPAtualO:setVisible(false);
    obj.edtHPAtualO:setAlign("left");
    obj.edtHPAtualO:setCanFocus(false);
    obj.edtHPAtualO:setTransparent(true);
    obj.edtHPAtualO:setHitTest(false);
    obj.edtHPAtualO:setHorzTextAlign("center");
    obj.edtHPAtualO:setField("HPBarResolveO");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.progressBar3);
    obj.label81:setAlign("client");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setText("/");
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.progressBar3);
    obj.label82:setAlign("right");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setField("HPBarMaxO");
    obj.label82:setName("label82");

    obj.progressBar4 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar4:setParent(obj.layout12);
    obj.progressBar4:setAlign("top");
    obj.progressBar4:setWidth(150);
    obj.progressBar4:setColor("blue");
    obj.progressBar4:setField("MPBarO");
    obj.progressBar4:setFieldMax("MPBarMaxO");
    obj.progressBar4:setMargins({top=1});
    obj.progressBar4:setName("progressBar4");

    obj.gambiMPO = GUI.fromHandle(_obj_newObject("edit"));
    obj.gambiMPO:setParent(obj.progressBar4);
    obj.gambiMPO:setName("gambiMPO");
    obj.gambiMPO:setAlign("left");
    obj.gambiMPO:setTransparent(true);
    obj.gambiMPO:setHitTest(false);
    obj.gambiMPO:setHorzTextAlign("center");
    obj.gambiMPO:setField("MPBarO");

    obj.edtMPAtualO = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtMPAtualO:setParent(obj.progressBar4);
    obj.edtMPAtualO:setName("edtMPAtualO");
    obj.edtMPAtualO:setVisible(false);
    obj.edtMPAtualO:setAlign("left");
    obj.edtMPAtualO:setCanFocus(false);
    obj.edtMPAtualO:setTransparent(true);
    obj.edtMPAtualO:setHitTest(false);
    obj.edtMPAtualO:setHorzTextAlign("center");
    obj.edtMPAtualO:setField("MPBarResolveO");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.progressBar4);
    obj.label83:setAlign("right");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setText("---/---");
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.progressBar4);
    obj.label84:setAlign("right");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setField("MPBarMaxO");
    obj.label84:setName("label84");

    obj.btnEditStatusI = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEditStatusI:setParent(obj.layout12);
    obj.btnEditStatusI:setName("btnEditStatusI");
    obj.btnEditStatusI:setAlign("top");
    obj.btnEditStatusI:setFontColor("white");
    obj.btnEditStatusI:setWidth(150);
    obj.btnEditStatusI:setText("Editar ✎");
    obj.btnEditStatusI:setMargins({top=1});

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout12);
    obj.image4:setAlign("top");
    obj.image4:setWidth(64);
    obj.image4:setHeight(64);
    obj.image4:setSRC("./imagens/buff.png");
    obj.image4:setMargins({top=5});
    obj.image4:setName("image4");

    obj.btnEffectO = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEffectO:setParent(obj.image4);
    obj.btnEffectO:setName("btnEffectO");
    obj.btnEffectO:setOpacity(0.0);
    obj.btnEffectO:setAlign("client");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle2);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(50);
    obj.layout13:setMargins({right=1});
    obj.layout13:setName("layout13");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout13);
    obj.label85:setAlign("top");
    obj.label85:setText("Status");
    obj.label85:setWidth(50);
    obj.label85:setMargins({left=10});
    obj.label85:setName("label85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout13);
    obj.label86:setAlign("top");
    obj.label86:setText("PA:");
    obj.label86:setWidth(50);
    obj.label86:setMargins({left=10});
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout13);
    obj.label87:setAlign("top");
    obj.label87:setText("PM:");
    obj.label87:setWidth(50);
    obj.label87:setMargins({left=10});
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout13);
    obj.label88:setAlign("top");
    obj.label88:setText("PF:");
    obj.label88:setWidth(50);
    obj.label88:setMargins({left=10});
    obj.label88:setName("label88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout13);
    obj.label89:setAlign("top");
    obj.label89:setText("DEF:");
    obj.label89:setWidth(50);
    obj.label89:setMargins({left=10});
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout13);
    obj.label90:setAlign("top");
    obj.label90:setText("RES:");
    obj.label90:setWidth(50);
    obj.label90:setMargins({left=10});
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout13);
    obj.label91:setAlign("top");
    obj.label91:setText("---");
    obj.label91:setWidth(50);
    obj.label91:setMargins({left=10});
    obj.label91:setName("label91");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout13);
    obj.label92:setAlign("top");
    obj.label92:setText("AC:");
    obj.label92:setWidth(50);
    obj.label92:setMargins({left=10});
    obj.label92:setName("label92");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout13);
    obj.label93:setAlign("top");
    obj.label93:setText("ACM:");
    obj.label93:setWidth(50);
    obj.label93:setMargins({left=10});
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout13);
    obj.label94:setAlign("top");
    obj.label94:setText("CR:");
    obj.label94:setWidth(50);
    obj.label94:setMargins({left=10});
    obj.label94:setName("label94");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout13);
    obj.label95:setAlign("top");
    obj.label95:setText("CRM:");
    obj.label95:setWidth(50);
    obj.label95:setMargins({left=10});
    obj.label95:setName("label95");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout13);
    obj.label96:setAlign("top");
    obj.label96:setText("---");
    obj.label96:setWidth(50);
    obj.label96:setMargins({left=10});
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout13);
    obj.label97:setAlign("top");
    obj.label97:setText("ESQ:");
    obj.label97:setWidth(50);
    obj.label97:setMargins({left=10});
    obj.label97:setName("label97");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout13);
    obj.label98:setAlign("top");
    obj.label98:setText("Pers:");
    obj.label98:setWidth(50);
    obj.label98:setMargins({left=10});
    obj.label98:setName("label98");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout13);
    obj.label99:setAlign("top");
    obj.label99:setText("---");
    obj.label99:setWidth(50);
    obj.label99:setMargins({left=10});
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout13);
    obj.label100:setAlign("top");
    obj.label100:setText("Vez:");
    obj.label100:setFontColor("green");
    obj.label100:setWidth(50);
    obj.label100:setMargins({left=10});
    obj.label100:setName("label100");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle2);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(50);
    obj.layout14:setMargins({right=1});
    obj.layout14:setName("layout14");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout14);
    obj.label101:setAlign("top");
    obj.label101:setText("Valor");
    obj.label101:setWidth(50);
    obj.label101:setMargins({left=10});
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout14);
    obj.label102:setAlign("top");
    obj.label102:setField("PA");
    obj.label102:setWidth(50);
    obj.label102:setMargins({left=10});
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout14);
    obj.label103:setAlign("top");
    obj.label103:setField("PM");
    obj.label103:setWidth(50);
    obj.label103:setMargins({left=10});
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout14);
    obj.label104:setAlign("top");
    obj.label104:setField("PF");
    obj.label104:setWidth(50);
    obj.label104:setMargins({left=10});
    obj.label104:setName("label104");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout14);
    obj.label105:setAlign("top");
    obj.label105:setField("DEF");
    obj.label105:setWidth(50);
    obj.label105:setMargins({left=10});
    obj.label105:setName("label105");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout14);
    obj.label106:setAlign("top");
    obj.label106:setField("RES");
    obj.label106:setWidth(50);
    obj.label106:setMargins({left=10});
    obj.label106:setName("label106");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout14);
    obj.label107:setAlign("top");
    obj.label107:setText("---");
    obj.label107:setWidth(50);
    obj.label107:setMargins({left=10});
    obj.label107:setName("label107");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout14);
    obj.label108:setAlign("top");
    obj.label108:setField("AC");
    obj.label108:setWidth(50);
    obj.label108:setMargins({left=10});
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout14);
    obj.label109:setAlign("top");
    obj.label109:setField("ACM");
    obj.label109:setWidth(50);
    obj.label109:setMargins({left=10});
    obj.label109:setName("label109");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout14);
    obj.label110:setAlign("top");
    obj.label110:setField("CR");
    obj.label110:setWidth(50);
    obj.label110:setMargins({left=10});
    obj.label110:setName("label110");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout14);
    obj.label111:setAlign("top");
    obj.label111:setField("CRM");
    obj.label111:setWidth(50);
    obj.label111:setMargins({left=10});
    obj.label111:setName("label111");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout14);
    obj.label112:setAlign("top");
    obj.label112:setText("---");
    obj.label112:setWidth(50);
    obj.label112:setMargins({left=10});
    obj.label112:setName("label112");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout14);
    obj.label113:setAlign("top");
    obj.label113:setField("ESQ");
    obj.label113:setWidth(50);
    obj.label113:setMargins({left=10});
    obj.label113:setName("label113");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout14);
    obj.label114:setAlign("top");
    obj.label114:setField("Pers");
    obj.label114:setWidth(50);
    obj.label114:setMargins({left=10});
    obj.label114:setName("label114");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout14);
    obj.label115:setAlign("top");
    obj.label115:setText("---");
    obj.label115:setWidth(50);
    obj.label115:setMargins({left=10});
    obj.label115:setName("label115");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout14);
    obj.edit4:setAlign("top");
    obj.edit4:setField("Vez");
    obj.edit4:setFontColor("green");
    obj.edit4:setWidth(50);
    obj.edit4:setMargins({left=10});
    obj.edit4:setName("edit4");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle2);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(50);
    obj.layout15:setMargins({right=1});
    obj.layout15:setName("layout15");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout15);
    obj.label116:setAlign("top");
    obj.label116:setText("Efeitos");
    obj.label116:setWidth(50);
    obj.label116:setMargins({left=10});
    obj.label116:setName("label116");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout15);
    obj.label117:setAlign("top");
    obj.label117:setField("PAEffectTotal");
    obj.label117:setWidth(50);
    obj.label117:setMargins({left=10});
    obj.label117:setName("label117");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout15);
    obj.label118:setAlign("top");
    obj.label118:setField("PMEffectTotal");
    obj.label118:setWidth(50);
    obj.label118:setMargins({left=10});
    obj.label118:setName("label118");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout15);
    obj.label119:setAlign("top");
    obj.label119:setField("PFEffectTotal");
    obj.label119:setWidth(50);
    obj.label119:setMargins({left=10});
    obj.label119:setName("label119");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout15);
    obj.label120:setAlign("top");
    obj.label120:setField("DEFEffectTotal");
    obj.label120:setWidth(50);
    obj.label120:setMargins({left=10});
    obj.label120:setName("label120");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout15);
    obj.label121:setAlign("top");
    obj.label121:setField("RESEffectTotal");
    obj.label121:setWidth(50);
    obj.label121:setMargins({left=10});
    obj.label121:setName("label121");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout15);
    obj.label122:setAlign("top");
    obj.label122:setText("---");
    obj.label122:setWidth(50);
    obj.label122:setMargins({left=10});
    obj.label122:setName("label122");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout15);
    obj.label123:setAlign("top");
    obj.label123:setField("ACEffectTotal");
    obj.label123:setWidth(50);
    obj.label123:setMargins({left=10});
    obj.label123:setName("label123");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout15);
    obj.label124:setAlign("top");
    obj.label124:setField("ACMEffectTotal");
    obj.label124:setWidth(50);
    obj.label124:setMargins({left=10});
    obj.label124:setName("label124");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout15);
    obj.label125:setAlign("top");
    obj.label125:setField("CREffectTotal");
    obj.label125:setWidth(50);
    obj.label125:setMargins({left=10});
    obj.label125:setName("label125");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout15);
    obj.label126:setAlign("top");
    obj.label126:setField("CRMEffectTotal");
    obj.label126:setWidth(50);
    obj.label126:setMargins({left=10});
    obj.label126:setName("label126");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout15);
    obj.label127:setAlign("top");
    obj.label127:setText("---");
    obj.label127:setWidth(50);
    obj.label127:setMargins({left=10});
    obj.label127:setName("label127");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout15);
    obj.label128:setAlign("top");
    obj.label128:setField("ESQEffectTotal");
    obj.label128:setWidth(50);
    obj.label128:setMargins({left=10});
    obj.label128:setName("label128");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout15);
    obj.label129:setAlign("top");
    obj.label129:setField("PersEffectTotal");
    obj.label129:setWidth(50);
    obj.label129:setMargins({left=10});
    obj.label129:setName("label129");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout15);
    obj.label130:setAlign("top");
    obj.label130:setText("---");
    obj.label130:setWidth(50);
    obj.label130:setMargins({left=10});
    obj.label130:setName("label130");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle2);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(50);
    obj.layout16:setMargins({right=1});
    obj.layout16:setName("layout16");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout16);
    obj.label131:setAlign("top");
    obj.label131:setText("Total");
    obj.label131:setWidth(50);
    obj.label131:setMargins({left=10});
    obj.label131:setName("label131");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout16);
    obj.label132:setAlign("top");
    obj.label132:setField("PATotal");
    obj.label132:setWidth(50);
    obj.label132:setMargins({left=10});
    obj.label132:setName("label132");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout16);
    obj.label133:setAlign("top");
    obj.label133:setField("PMTotal");
    obj.label133:setWidth(50);
    obj.label133:setMargins({left=10});
    obj.label133:setName("label133");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout16);
    obj.label134:setAlign("top");
    obj.label134:setField("PFTotal");
    obj.label134:setWidth(50);
    obj.label134:setMargins({left=10});
    obj.label134:setName("label134");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout16);
    obj.label135:setAlign("top");
    obj.label135:setField("DEFTotal");
    obj.label135:setWidth(50);
    obj.label135:setMargins({left=10});
    obj.label135:setName("label135");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout16);
    obj.label136:setAlign("top");
    obj.label136:setField("RESTotal");
    obj.label136:setWidth(50);
    obj.label136:setMargins({left=10});
    obj.label136:setName("label136");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout16);
    obj.label137:setAlign("top");
    obj.label137:setText("---");
    obj.label137:setWidth(50);
    obj.label137:setMargins({left=10});
    obj.label137:setName("label137");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout16);
    obj.label138:setAlign("top");
    obj.label138:setField("ACTotal");
    obj.label138:setWidth(50);
    obj.label138:setMargins({left=10});
    obj.label138:setName("label138");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout16);
    obj.label139:setAlign("top");
    obj.label139:setField("ACMTotal");
    obj.label139:setWidth(50);
    obj.label139:setMargins({left=10});
    obj.label139:setName("label139");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout16);
    obj.label140:setAlign("top");
    obj.label140:setField("CRTotal");
    obj.label140:setWidth(50);
    obj.label140:setMargins({left=10});
    obj.label140:setName("label140");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout16);
    obj.label141:setAlign("top");
    obj.label141:setField("CRMTotal");
    obj.label141:setWidth(50);
    obj.label141:setMargins({left=10});
    obj.label141:setName("label141");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout16);
    obj.label142:setAlign("top");
    obj.label142:setText("---");
    obj.label142:setWidth(50);
    obj.label142:setMargins({left=10});
    obj.label142:setName("label142");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout16);
    obj.label143:setAlign("top");
    obj.label143:setField("ESQTotal");
    obj.label143:setWidth(50);
    obj.label143:setMargins({left=10});
    obj.label143:setName("label143");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout16);
    obj.label144:setAlign("top");
    obj.label144:setField("PersTotal");
    obj.label144:setWidth(50);
    obj.label144:setMargins({left=10});
    obj.label144:setName("label144");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout16);
    obj.label145:setAlign("top");
    obj.label145:setText("---");
    obj.label145:setWidth(50);
    obj.label145:setMargins({left=10});
    obj.label145:setName("label145");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle2);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(75);
    obj.layout17:setMargins({right=1});
    obj.layout17:setName("layout17");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout17);
    obj.label146:setAlign("top");
    obj.label146:setText("Vitais");
    obj.label146:setWidth(75);
    obj.label146:setMargins({left=10});
    obj.label146:setName("label146");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout17);
    obj.label147:setAlign("top");
    obj.label147:setText("HPTotal");
    obj.label147:setWidth(75);
    obj.label147:setMargins({left=10});
    obj.label147:setName("label147");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout17);
    obj.label148:setAlign("top");
    obj.label148:setText("MPTotal");
    obj.label148:setWidth(75);
    obj.label148:setMargins({left=10});
    obj.label148:setName("label148");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle2);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(50);
    obj.layout18:setMargins({right=1});
    obj.layout18:setName("layout18");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout18);
    obj.label149:setAlign("top");
    obj.label149:setText("Valor");
    obj.label149:setWidth(50);
    obj.label149:setMargins({left=10});
    obj.label149:setName("label149");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout18);
    obj.label150:setAlign("top");
    obj.label150:setField("HPEffectTotals");
    obj.label150:setWidth(50);
    obj.label150:setMargins({left=10});
    obj.label150:setName("label150");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout18);
    obj.label151:setAlign("top");
    obj.label151:setField("MPEffectTotals");
    obj.label151:setWidth(50);
    obj.label151:setMargins({left=10});
    obj.label151:setName("label151");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle2);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(50);
    obj.layout19:setMargins({right=1});
    obj.layout19:setName("layout19");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout19);
    obj.label152:setAlign("top");
    obj.label152:setText("Total");
    obj.label152:setWidth(50);
    obj.label152:setMargins({left=10});
    obj.label152:setName("label152");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout19);
    obj.label153:setAlign("top");
    obj.label153:setField("HPTotalTotal");
    obj.label153:setWidth(50);
    obj.label153:setMargins({left=10});
    obj.label153:setName("label153");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout19);
    obj.label154:setAlign("top");
    obj.label154:setField("MPTotalTotal");
    obj.label154:setWidth(50);
    obj.label154:setMargins({left=10});
    obj.label154:setName("label154");

    obj.LogCombat = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.LogCombat:setParent(obj);
    obj.LogCombat:setName("LogCombat");
    obj.LogCombat:setLeft(615);
    obj.LogCombat:setTop(350);
    obj.LogCombat:setWidth(210);
    obj.LogCombat:setHeight(350);
    obj.LogCombat:setField("FieldLogCombat");

    obj.btnResetLog = GUI.fromHandle(_obj_newObject("button"));
    obj.btnResetLog:setParent(obj);
    obj.btnResetLog:setName("btnResetLog");
    obj.btnResetLog:setLeft(615);
    obj.btnResetLog:setWidth(210);
    obj.btnResetLog:setTop(710);
    obj.btnResetLog:setText("Reset Log");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'ACAOTURNO'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'RecargaNome', 'QuemRecarregou'});
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            sheet.ACAOTURNO = (tonumber(sheet.ACAOTURNO) or 0); 
            		sheet.EditarStatus = sheet.EditarStatus or false
            		sheet.AlvoRecebido = nil
            		sheet.VezdeQuem = nil
            
            		local personagem = rrpg.getPersonagemDe(sheet);                                
            		
            		if (personagem ~= nil) then
            			local mesa = personagem.mesa;
            
            			if not mesa.meuJogador.isMestre then  
            			    self.rclGrupoJogadores.opacity = 0.0
            				self.rclGrupoOponentes.opacity = 0.0
            				self.BoxDetalheJogadores.opacity = 0.0
            				self.BoxDetalheOponentes.opacity = 0.0
            				self.LogCombat.opacity = 0.0
            				self.btnResetLog.opacity = 0.0
            			end;
            
            			if (mesa.meuJogador.id) == 51345 then
            				self.rclGrupoJogadores.opacity = 1.0
            				self.rclGrupoOponentes.opacity = 1.0
            				self.BoxDetalheJogadores.opacity = 1.0
            				self.BoxDetalheOponentes.opacity = 1.0
            				self.LogCombat.opacity = 1.0
            				self.btnResetLog.opacity = 1.0
            			end
            		end; 
            
            		ASCPrincipal = sheet     
            		SelfFichPrincipalASC = self
            		sheet.UsuarioEnvio = nil
            		sheet.AcertouPergunta = nil
        end);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (event)
            self.rclGrupoJogadores:append();
        end);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (event)
            -- Chama a função para criar e incrementar a lista
            			criarEIncrementarLista()
            			criarEIncrementarListaVez();
            			showMessage(sheet.PersonagensEmCombate)
        end);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (event)
            if self.TrocadorDeAcao.enabled == false then
            			self.TrocadorDeAcao.enabled = true
            			self.AvisoDeTempo.enabled = true
            		else 
            			self.TrocadorDeAcao.enabled = false
            			self.AvisoDeTempo.enabled = false
            			sheet.AcaoAtual = nil
            		end
        end);

    obj._e_event4 = obj.rclGrupoJogadores:addEventListener("onSelect",
        function ()
            if sheet ~= nil then
            				ASCPrincipal = sheet
            				SelfFichPrincipalASC = self
            				RclSelecionadoDaVez = self.rclGrupoJogadores.selectedNode
            				RclSelecionado = sheet.NomeEfeito
            				
            			end;
            			local node = self.rclGrupoJogadores.selectedNode; 
            			
            			self.BoxDetalheJogadores.node = node;
            
            			
            			
            			self.BoxDetalheJogadores.visible = (node ~= nil);
            
            			if	self.BoxDetalheJogadores.visible == true then
            				local node = self.rclGrupoJogadores.selectedNode;   
            				self.rclGrupoJogadores.node = node;
            
            				if node.NomeDoPersonagemVez ~= nil and node.NomeDoPersonagemVez ~= "" then
            				
            					local mesas = rrpg.getRooms();
            					local bibliotecaAtual = mesas[1].library;
            
            					local function obterNomesRecursivo(bibItem)
            						local itensFilhos = bibItem.children;
            						local nomes = bibItem.name;
            
            						for i = 1, #itensFilhos, 1 do
            							local bibItemFilho = itensFilhos[i];
            							local nomesDoFilho = obterNomesRecursivo(bibItemFilho) or "";
            
            							if nomesDoFilho == node.NomeDoPersonagem then
            								-- Obter ID do personagem Loan
            								local idPersonagem = bibItemFilho;
            
            								-- Solicita acesso à ficha do personagem
            								local promise = bibItemFilho:asyncOpenNDB();
            
            								-- Aguarda até que a ficha esteja carregada
            								local nodeExterno = await(promise);
            
            								-- Acessa o valor da força do personagem
            
            								if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
            									node.PA = tonumber(nodeExterno.PA) or '0';
            									node.PM = tonumber(nodeExterno.PM) or '0';
            									node.PF = tonumber(nodeExterno.PF) or '0';
            									node.DEF = tonumber(nodeExterno.DEFRED) or '0';
            									node.RES = tonumber(nodeExterno.RESRED) or '0';
            									node.AC = tonumber(nodeExterno.Acerto) or '0';
            									node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            									node.CR = tonumber(nodeExterno.Critical or '0');
            									node.CRM = tonumber(nodeExterno.CMagico or '0');
            									node.ESQ = tonumber(nodeExterno.Esquiva or '0');
            									node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            									node.Vez = node.Vez or '0';
            									node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
            									node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
            									node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
            									node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
            									node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            									node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
            									node.MPBarMax = tonumber(nodeExterno.MPTotal) or '0';
            									node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
            									node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
            									node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoPersonagem
            									node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
            								else
            									node.PA = tonumber(nodeExterno.Dano) or '0';
            									node.PM = tonumber(nodeExterno.DanoMagico) or '0';
            									node.PF = "NPC";
            									node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
            									node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
            									node.AC = tonumber(nodeExterno.Acerto) or '0';
            									node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            									node.CR = tonumber(nodeExterno.Critical) or '0';
            									node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
            									node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            									node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            									node.Vez = node.Vez or '0';
            									node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
            									node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
            									node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
            									node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
            									node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            									node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
            									node.MPBarMax = tonumber(nodeExterno.MPTotal) or '0';
            									node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
            									node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
            									node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
            									node.imagemDoPersonagem = nodeExterno.imgInimigo
            								end;
            							end
            						end
            					return nomes								
            						
            					end
            
            					local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);
            				end;
            								
            			end;	
            
            			self.rclGrupoJogadores:sort();
        end);

    obj._e_event5 = obj.rclGrupoJogadores:addEventListener("onCompare",
        function (nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.Vez, nodeB.Vez);
        end);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (event)
            if	self.BoxDetalheJogadores.visible == true then
            								local node = self.rclGrupoJogadores.selectedNode;   
            								self.rclGrupoJogadores.node = node;
            								
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            
            								local function obterNomesRecursivo(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivo(bibItemFilho) or "";
            
            										if nomesDoFilho == node.NomeDoPersonagem then
            											-- Obter ID do personagem Loan
            											local idPersonagem = bibItemFilho;
            
            											-- Solicita acesso à ficha do personagem
            											local promise = bibItemFilho:asyncOpenNDB();
            
            											-- Aguarda até que a ficha esteja carregada
            											local nodeExterno = await(promise);
            
            											-- Acessa o valor da força do personagem
            
            											if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
            												node.PA = tonumber(nodeExterno.PA) or '0';
            												node.PM = tonumber(nodeExterno.PM) or '0';
            												node.PF = tonumber(nodeExterno.PF) or '0';
            												node.DEF = tonumber(nodeExterno.DEFRED) or '0';
            												node.RES = tonumber(nodeExterno.RESRED) or '0';
            												node.AC = tonumber(nodeExterno.Acerto) or '0';
            												node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            												node.CR = tonumber(nodeExterno.Critical) or '0';
            												node.CRM = tonumber(nodeExterno.CMagico) or '0';
            												node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            												node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            												node.Vez = node.Vez or '0';
            												node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
            												node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
            												node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
            												node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
            												node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            												node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
            												node.MPBarMax = tonumber(nodeExterno.MPTotal) or '0';
            												node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
            												node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
            												node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoPersonagem
            												node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
            
            												node.PAEffectTotal = 0;
            												node.PMEffectTotal = 0;
            												node.PFEffectTotal = 0;
            												node.DEFEffectTotal = 0;
            												node.RESEffectTotal = 0;
            												node.ACEffectTotal = 0;
            												node.ACMEffectTotal = 0;
            												node.CREffectTotal = 0;
            												node.CRMEffectTotal = 0;
            												node.ESQEffectTotal = 0;
            												node.PersEffectTotal = 0;
            												node.HPTotalEffect = 0;
            												node.MPTotalEffect = 0;
            												node.DanoEffect = 0
            												node.CustoEffect = 0 
            												node.CuraEffect = 0  
            												node.RegMPEffect = 0 
            											else
            												node.PA = tonumber(nodeExterno.Dano) or '0';
            												node.PM = tonumber(nodeExterno.DanoMagico) or '0';
            												node.PF = "NPC";
            												node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
            												node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
            												node.AC = tonumber(nodeExterno.Acerto) or '0';
            												node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            												node.CR = tonumber(nodeExterno.Critical) or '0';
            												node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
            												node.ESQ = tonumber(nodeExterno.Esquiva or '0');
            												node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            												node.Vez = node.Vez or '0';
            												node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
            												node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
            												node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
            												node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
            												node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            												node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
            												node.MPBarMax = tonumber(nodeExterno.MPTotal) or '0';
            												node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
            												node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
            												node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
            												node.imagemDoPersonagem = nodeExterno.imgInimigo
            
            												node.PAEffectTotal = 0;
            												node.PMEffectTotal = 0;
            												node.PFEffectTotal = 0;
            												node.DEFEffectTotal = 0;
            												node.RESEffectTotal = 0;
            												node.ACEffectTotal = 0;
            												node.ACMEffectTotal = 0;
            												node.CREffectTotal = 0;
            												node.CRMEffectTotal = 0;
            												node.ESQEffectTotal = 0;
            												node.PersEffectTotal = 0;
            												node.HPTotalEffect = 0;
            												node.MPTotalEffect = 0;
            												node.DanoEffect = 0
            												node.CustoEffect = 0 
            												node.CuraEffect = 0  
            												node.RegMPEffect = 0 
            											end;
            										end
            									end
            								return nomes								
            									
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);
            								
            							end;
        end);

    obj._e_event7 = obj.btnEditStatus:addEventListener("onClick",
        function (event)
            -- Obtém o nó selecionado do recordList
            							local node = self.rclGrupoJogadores.selectedNode;
            							if not node then
            								showMessage("Nenhum item foi selecionado!");
            								return;
            							end
            
            							-- Localiza o botão dentro do contexto do item selecionado
            							local btn = self:findControlByName("btnEditStatus");
            							local gambiHP = self:findControlByName("gambiHP");
            							local edtHP = self:findControlByName("edtHPAtual");
            							local gambiMP = self:findControlByName("gambiMP");
            							local edtMP = self:findControlByName("edtMPAtual");
            							if not btn then
            								showMessage("Botão não encontrado no item selecionado!");
            								return;
            							end
            
            							-- Lógica para alternar entre editar e aplicar
            							if btn.text == "Editar ✎" then
            								btn.fontColor = "red";
            								btn.text = "Aplicar 💾";
            								edtHP.transparent = false
            								edtHP.hitTest = true								
            								edtHP.visible = true;
            								edtHP.canFocus = true;
            								gambiHP.visible = false;
            								
            								edtMP.transparent = false
            								edtMP.hitTest = true
            								edtMP.visible = true;
            								edtMP.canFocus = true;
            								gambiMP.visible = false;
            
            								if self.BoxDetalheJogadores.visible == true then
            									local node = self.rclGrupoJogadores.selectedNode;   
            									self.rclGrupoJogadores.node = node;
            									
            									local mesas = rrpg.getRooms();
            									local bibliotecaAtual = mesas[1].library;
            
            									local function obterNomesRecursivo(bibItem)
            										local itensFilhos = bibItem.children;
            										local nomes = bibItem.name;
            
            										for i = 1, #itensFilhos, 1 do
            											local bibItemFilho = itensFilhos[i];
            											local nomesDoFilho = obterNomesRecursivo(bibItemFilho) or "";
            
            											if nomesDoFilho == node.NomeDoPersonagem then
            												-- Obter ID do personagem Loan
            												local idPersonagem = bibItemFilho;
            
            												-- Solicita acesso à ficha do personagem
            												local promise = bibItemFilho:asyncOpenNDB();
            
            												-- Aguarda até que a ficha esteja carregada
            												local nodeExterno = await(promise);
            
            												-- Acessa o valor da força do personagem
            												node.HPBarMax = tonumber(nodeExterno.HPTotal);
            												node.MPBarMax = tonumber(nodeExterno.MPTotal);
            												node.HPBar = tonumber(nodeExterno.HPAtual);
            												node.MPBar = tonumber(nodeExterno.MPAtual);
            											end
            										end
            										return nomes;
            									end
            
            									-- Certifique-se de chamar a função, se necessário
            									obterNomesRecursivo(bibliotecaAtual);
            								end
            							else
            								btn.fontColor = "white";
            								btn.text = "Editar ✎";
            								edtHP.transparent = true
            								edtHP.hitTest = false
            								edtHP.visible = false;
            								gambiHP.visible = true;
            
            								edtMP.transparent = true
            								edtMP.hitTest = false
            								edtMP.visible = false;
            								gambiMP.visible = true;
            
            								if	self.BoxDetalheJogadores.visible == true then
            								local node = self.rclGrupoJogadores.selectedNode;   
            								self.rclGrupoJogadores.node = node;
            								
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            
            								local function obterNomesRecursivo(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivo(bibItemFilho) or "";
            
            										if nomesDoFilho == node.NomeDoPersonagem then
            											-- Obter ID do personagem Loan
            											local idPersonagem = bibItemFilho;
            
            											-- Solicita acesso à ficha do personagem
            											local promise = bibItemFilho:asyncOpenNDB();
            
            											-- Aguarda até que a ficha esteja carregada
            											local nodeExterno = await(promise);
            
            											-- Acessa o valor da força do personagem
            
            											if node.HPBarResolve ~= 0 and node.HPBarResolve ~= nil and node.HPBarResolve ~= "" then 
            												local hpBarInput = tostring(node.HPBarResolve) -- Converte o valor para string, caso não seja
            												if hpBarInput:match("^%+%d+$") then
            													-- Se começar com "+", soma ao valor existente
            													local valor = tonumber(hpBarInput:sub(2)) -- Remove o "+" e converte para número
            													nodeExterno.HPAtual = (tonumber(node.HPBar) or 0) + valor
            												elseif hpBarInput:match("^%-%d+$") then
            													-- Se começar com "-", subtrai do valor existente
            													local valor = tonumber(hpBarInput:sub(2)) -- Remove o "-" e converte para número
            													nodeExterno.HPAtual = (tonumber(node.HPBar) or 0) - valor
            												else
            													-- Se não tiver "+" ou "-", aplica o valor diretamente
            													nodeExterno.HPAtual = tonumber(hpBarInput)
            												end
            											end;
            
            											if node.MPBarResolve ~= 0 and node.MPBarResolve ~= nil and node.MPBarResolve ~= "" then
            												-- Ajuste para MPAtual
            												local mpBarInput = tostring(node.MPBarResolve) -- Converte o valor para string, caso não seja
            												if mpBarInput:match("^%+%d+$") then
            													-- Se começar com "+", soma ao valor existente
            													local valor = tonumber(mpBarInput:sub(2)) -- Remove o "+" e converte para número
            													nodeExterno.MPAtual = (tonumber(node.MPBar) or 0) + valor
            												elseif mpBarInput:match("^%-%d+$") then
            													-- Se começar com "-", subtrai do valor existente
            													local valor = tonumber(mpBarInput:sub(2)) -- Remove o "-" e converte para número
            													nodeExterno.MPAtual = (tonumber(node.MPBar) or 0) - valor
            												else
            													-- Se não tiver "+" ou "-", aplica o valor diretamente
            													nodeExterno.MPAtual = tonumber(mpBarInput)
            												end
            											end;
            										end
            									end
            								return nomes								
            									
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);
            								
            							end;	
            
            							if	self.BoxDetalheJogadores.visible == true then
            								local node = self.rclGrupoJogadores.selectedNode;   
            								self.rclGrupoJogadores.node = node;
            								
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            
            								local function obterNomesRecursivo(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivo(bibItemFilho) or "";
            
            										if nomesDoFilho == node.NomeDoPersonagem then
            											-- Obter ID do personagem Loan
            											local idPersonagem = bibItemFilho;
            
            											-- Solicita acesso à ficha do personagem
            											local promise = bibItemFilho:asyncOpenNDB();
            
            											-- Aguarda até que a ficha esteja carregada
            											local nodeExterno = await(promise);
            
            											-- Acessa o valor da força do personagem
            
            											if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
            												node.PA = tonumber(nodeExterno.PA) or '0';
            												node.PM = tonumber(nodeExterno.PM) or '0';
            												node.PF = tonumber(nodeExterno.PF) or '0';
            												node.DEF = tonumber(nodeExterno.DEFRED) or '0';
            												node.RES = tonumber(nodeExterno.RESRED) or '0';
            												node.AC = tonumber(nodeExterno.Acerto) or '0';
            												node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            												node.CR = tonumber(nodeExterno.Critical) or '0';
            												node.CRM = tonumber(nodeExterno.CMagico) or '0';
            												node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            												node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            												node.Vez = node.Vez or '0';
            												node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
            												node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
            												node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
            												node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
            												node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            												node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
            												node.MPBarMax = tonumber(nodeExterno.MPTotal) or '0';
            												node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
            												node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
            												node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoPersonagem
            												node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
            											else
            												node.PA = tonumber(nodeExterno.Dano) or '0';
            												node.PM = tonumber(nodeExterno.DanoMagico) or '0';
            												node.PF = "NPC";
            												node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
            												node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
            												node.AC = tonumber(nodeExterno.Acerto) or '0';
            												node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            												node.CR = tonumber(nodeExterno.Critical) or '0';
            												node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
            												node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            												node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            												node.Vez = node.Vez or '0';
            												node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
            												node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
            												node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
            												node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
            												node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            												node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
            												node.MPBarMax = tonumber(nodeExterno.MPTotal) or '0';
            												node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
            												node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
            												node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
            												node.imagemDoPersonagem = nodeExterno.imgInimigo
            											end;
            										end
            									end
            								return nomes								
            									
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);
            								
            							end;	
            
            							end
        end);

    obj._e_event8 = obj.btnEffect:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("FrmEffectTeste");
            							novoForm:setNodeObject(self.rclGrupoJogadores.selectedNode);
            							novoForm:show();
        end);

    obj._e_event9 = obj.btnTurnoAnterior:addEventListener("onClick",
        function (event)
            AnteriorTurno();
        end);

    obj._e_event10 = obj.btnTurnoProximo:addEventListener("onClick",
        function (event)
            ProximoTurno();
        end);

    obj._e_event11 = obj.btnVezAnterior:addEventListener("onClick",
        function (event)
            AnteriorVez();
        end);

    obj._e_event12 = obj.btnVezProximo:addEventListener("onClick",
        function (event)
            ProximaVez();
        end);

    obj._e_event13 = obj.btnAcaoAnterior:addEventListener("onClick",
        function (event)
            AnteriorAcao();
        end);

    obj._e_event14 = obj.btnAcaoProximo:addEventListener("onClick",
        function (event)
            ProximaAcao();
        end);

    obj._e_event15 = obj.TrocadorDeAcao:addEventListener("onTimer",
        function ()
            AcaoAtualControlador()
        end);

    obj._e_event16 = obj.AvisoDeTempo:addEventListener("onTimer",
        function ()
            AvisoDeTempoControlador()
        end);

    obj._e_event17 = obj.button5:addEventListener("onClick",
        function (event)
            self.rclGrupoOponentes:append();
        end);

    obj._e_event18 = obj.rclGrupoOponentes:addEventListener("onSelect",
        function ()
            if sheet ~= nil then
            				ASCPrincipal = sheet
            				SelfFichPrincipalASC = self
            				RclSelecionadoDaVezO = self.rclGrupoOponentes.selectedNode
            				RclSelecionadoO = sheet.NomeEfeitoO
            				
            			end;
            
            			local node = self.rclGrupoOponentes.selectedNode; 
            				
            			self.BoxDetalheOponentes.node = node; 
            
            			
            			
            			self.BoxDetalheOponentes.visible = (node ~= nil);
            
            			
            			
            				if	self.BoxDetalheOponentes.visible == true then
            					local node = self.rclGrupoOponentes.selectedNode;   
            					self.rclGrupoOponentes.node = node;
            					
            					if node.NomeDoOponenteVez ~= nil and node.NomeDoOponenteVez ~= "" then
            
            						local mesas = rrpg.getRooms();
            						local bibliotecaAtual = mesas[1].library;
            
            						local function obterNomesRecursivoO(bibItem)
            							local itensFilhos = bibItem.children;
            							local nomes = bibItem.name;
            
            							for i = 1, #itensFilhos, 1 do
            								local bibItemFilho = itensFilhos[i];
            								local nomesDoFilho = obterNomesRecursivoO(bibItemFilho) or "";
            
            								if nomesDoFilho == node.NomeDoOponente then
            									-- Obter ID do personagem Loan
            									local idPersonagem = bibItemFilho;
            
            									-- Solicita acesso à ficha do personagem
            									local promise = bibItemFilho:asyncOpenNDB();
            
            									-- Aguarda até que a ficha esteja carregada
            									local nodeExterno = await(promise);
            
            									-- Acessa o valor da força do personagem
            									
            									if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
            										node.PA = tonumber(nodeExterno.PA) or '0';
            										node.PM = tonumber(nodeExterno.PM) or '0';
            										node.PF = tonumber(nodeExterno.PF) or '0';
            										node.DEF = tonumber(nodeExterno.DEFRED) or '0';
            										node.RES = tonumber(nodeExterno.RESRED) or '0';
            										node.AC = tonumber(nodeExterno.Acerto) or '0';
            										node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            										node.CR = tonumber(nodeExterno.Critical) or '0';
            										node.CRM = tonumber(nodeExterno.CMagico) or '0';
            										node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            										node.Pers = tonumber(nodeExterno.Persistencia) or '0';
            										node.Vez = node.Vez or '0';
            										node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
            										node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
            										node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
            										node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
            										node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            										node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
            										node.MPBarMaxO = tonumber(nodeExterno.MPTotal) or '0';
            										node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
            										node.MPBarO = tonumber(nodeExterno.MPAtual) or '0';
            										node.NomeDoOponenteVez = node.Vez .. " - " ..  node.NomeDoOponente
            										node.imagemInimigo = nodeExterno.imagemDoPersonagem
            									else
            										node.PA = tonumber(nodeExterno.Dano) or '0';
            										node.PM = tonumber(nodeExterno.DanoMagico) or '0';
            										node.PF = "NPC";
            										node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
            										node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
            										node.AC = tonumber(nodeExterno.Acerto) or '0';
            										node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            										node.CR = tonumber(nodeExterno.Critical) or '0';
            										node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
            										node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            										node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            										node.Vez = node.Vez or '0';
            										node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
            										node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
            										node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
            										node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
            										node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            										node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
            										node.MPBarMaxO = tonumber(nodeExterno.MPTotal) or '0';
            										node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
            										node.MPBarO = tonumber(nodeExterno.MPAtual) or '0';
            										node.NomeDoOponenteVez = node.Vez .. " - " ..  nodeExterno.Nome
            										node.imagemInimigo = nodeExterno.imgInimigo
            									end;
            								end
            							end
            						return nomes
            						end
            						local nomesDeTodosOsItens = obterNomesRecursivoO(bibliotecaAtual);
            					end;
            				end;
            				
            				self.rclGrupoOponentes:sort();
        end);

    obj._e_event19 = obj.rclGrupoOponentes:addEventListener("onCompare",
        function (nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.Vez, nodeB.Vez);
        end);

    obj._e_event20 = obj.button6:addEventListener("onClick",
        function (event)
            if	self.BoxDetalheOponentes.visible == true then
            							local node = self.rclGrupoOponentes.selectedNode;   
            							self.rclGrupoOponentes.node = node;
            							
            							local mesas = rrpg.getRooms();
            							local bibliotecaAtual = mesas[1].library;
            
            							local function obterNomesRecursivoO(bibItem)
            								local itensFilhos = bibItem.children;
            								local nomes = bibItem.name;
            
            								for i = 1, #itensFilhos, 1 do
            									local bibItemFilho = itensFilhos[i];
            									local nomesDoFilho = obterNomesRecursivoO(bibItemFilho) or "";
            
            									if nomesDoFilho == node.NomeDoOponente then
            										-- Obter ID do personagem Loan
            										local idPersonagem = bibItemFilho;
            
            										-- Solicita acesso à ficha do personagem
            										local promise = bibItemFilho:asyncOpenNDB();
            
            										-- Aguarda até que a ficha esteja carregada
            										local nodeExterno = await(promise);
            
            										-- Acessa o valor da força do personagem
            										
            										if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
            											node.PA = tonumber(nodeExterno.PA) or '0';
            											node.PM = tonumber(nodeExterno.PM) or '0';
            											node.PF = tonumber(nodeExterno.PF) or '0';
            											node.DEF = tonumber(nodeExterno.DEFRED) or '0';
            											node.RES = tonumber(nodeExterno.RESRED) or '0';
            											node.AC = tonumber(nodeExterno.Acerto) or '0';
            											node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            											node.CR = tonumber(nodeExterno.Critical) or '0';
            											node.CRM = tonumber(nodeExterno.CMagico) or '0';
            											node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            											node.Pers = tonumber(nodeExterno.Persistencia) or '0';
            											node.Vez = node.Vez or '0';
            											node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
            											node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
            											node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
            											node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
            											node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            											node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
            											node.MPBarMaxO = tonumber(nodeExterno.MPTotal) or '0';
            											node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
            											node.MPBarO = tonumber(nodeExterno.MPAtual) or '0';
            											node.NomeDoOponenteVez = node.Vez .. " - " ..  node.NomeDoOponente
            											node.imagemInimigo = nodeExterno.imagemDoPersonagem
            
            											node.PAEffectTotal = 0;
            											node.PMEffectTotal = 0;
            											node.PFEffectTotal = 0;
            											node.DEFEffectTotal = 0;
            											node.RESEffectTotal = 0;
            											node.ACEffectTotal = 0;
            											node.ACMEffectTotal = 0;
            											node.CREffectTotal = 0;
            											node.CRMEffectTotal = 0;
            											node.ESQEffectTotal = 0;
            											node.PersEffectTotal = 0;
            											node.HPEffectTotals = 0;
            											node.MPEffectTotals = 0;
            											node.DanoEffect = 0
            											node.CustoEffect = 0 
            											node.CuraEffect = 0  
            											node.RegMPEffect = 0 
            										else
            											node.PA = tonumber(nodeExterno.Dano) or '0';
            											node.PM = tonumber(nodeExterno.DanoMagico) or '0';
            											node.PF = "NPC";
            											node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
            											node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
            											node.AC = tonumber(nodeExterno.Acerto) or '0';
            											node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            											node.CR = tonumber(nodeExterno.Critical) or '0';
            											node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
            											node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            											node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            											node.Vez = node.Vez or '0';
            											node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
            											node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
            											node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
            											node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
            											node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            											node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
            											node.MPBarMaxO = tonumber(nodeExterno.MPTotal) or '0';
            											node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
            											node.MPBarO = tonumber(nodeExterno.MPAtual) or '0';
            											node.NomeDoOponenteVez = node.Vez .. " - " ..  nodeExterno.Nome
            											node.imagemInimigo = nodeExterno.imgInimigo
            
            											node.PAEffectTotal = 0;
            											node.PMEffectTotal = 0;
            											node.PFEffectTotal = 0;
            											node.DEFEffectTotal = 0;
            											node.RESEffectTotal = 0;
            											node.ACEffectTotal = 0;
            											node.ACMEffectTotal = 0;
            											node.CREffectTotal = 0;
            											node.CRMEffectTotal = 0;
            											node.ESQEffectTotal = 0;
            											node.PersEffectTotal = 0;
            											node.HPEffectTotals = 0;
            											node.MPEffectTotals = 0;
            											node.DanoEffect = 0
            											node.CustoEffect = 0 
            											node.CuraEffect = 0  
            											node.RegMPEffect = 0 
            										end;
            									end
            								end
            							return nomes
            							end
            							local nomesDeTodosOsItens = obterNomesRecursivoO(bibliotecaAtual);
            						end;
        end);

    obj._e_event21 = obj.btnEditStatusI:addEventListener("onClick",
        function (event)
            -- Obtém o nó selecionado do recordList
            							local node = self.rclGrupoOponentes.selectedNode;
            							if not node then
            								showMessage("Nenhum item foi selecionado!");
            								return;
            							end
            
            							-- Localiza o botão dentro do contexto do item selecionado
            							local btn = self:findControlByName("btnEditStatusI");
            							local gambiHP = self:findControlByName("gambiHPO");
            							local edtHP = self:findControlByName("edtHPAtualO");
            							local gambiMP = self:findControlByName("gambiMPO");
            							local edtMP = self:findControlByName("edtMPAtualO");
            							if not btn then
            								showMessage("Botão não encontrado no item selecionado!");
            								return;
            							end
            
            							-- Lógica para alternar entre editar e aplicar
            							if btn.text == "Editar ✎" then
            								btn.fontColor = "red";
            								btn.text = "Aplicar 💾";
            								edtHP.transparent = false
            								edtHP.hitTest = true
            								edtHP.visible = true;
            								edtHP.canFocus = true;
            								gambiHP.visible = false;
            
            								edtMP.transparent = false
            								edtMP.hitTest = true
            								edtMP.visible = true;
            								edtMP.canFocus = true;
            								gambiMP.visible = false;
            
            								if self.BoxDetalheOponentes.visible == true then
            									local node = self.rclGrupoOponentes.selectedNode;   
            									self.rclGrupoOponentes.node = node;
            									
            									local mesas = rrpg.getRooms();
            									local bibliotecaAtual = mesas[1].library;
            
            									local function obterNomesRecursivo(bibItem)
            										local itensFilhos = bibItem.children;
            										local nomes = bibItem.name;
            
            										for i = 1, #itensFilhos, 1 do
            											local bibItemFilho = itensFilhos[i];
            											local nomesDoFilho = obterNomesRecursivo(bibItemFilho) or "";
            
            											if nomesDoFilho == node.NomeDoOponente then
            												-- Obter ID do personagem Loan
            												local idPersonagem = bibItemFilho;
            
            												-- Solicita acesso à ficha do personagem
            												local promise = bibItemFilho:asyncOpenNDB();
            
            												-- Aguarda até que a ficha esteja carregada
            												local nodeExterno = await(promise);
            
            												-- Acessa o valor da força do personagem
            												node.HPBarMaxO = tonumber(nodeExterno.HPTotal);
            												node.MPBarMaxO = tonumber(nodeExterno.MPTotal);
            												node.HPBarO = tonumber(nodeExterno.HPAtual);
            												node.MPBarO = tonumber(nodeExterno.MPAtual);
            											end
            										end
            										return nomes;
            									end
            
            									-- Certifique-se de chamar a função, se necessário
            									obterNomesRecursivo(bibliotecaAtual);
            								end
            
            							else
            								btn.fontColor = "white";
            								btn.text = "Editar ✎";
            								edtHP.transparent = true
            								edtHP.hitTest = false
            								edtHP.visible = false;
            								gambiHP.visible = true;
            
            								edtMP.transparent = true
            								edtMP.hitTest = false
            								edtMP.visible = false;
            								gambiMP.visible = true;
            
            								if	self.BoxDetalheOponentes.visible == true then
            								local node = self.rclGrupoOponentes.selectedNode;   
            								self.rclGrupoOponentes.node = node;
            								
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            
            								local function obterNomesRecursivo(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivo(bibItemFilho) or "";
            
            										if nomesDoFilho == node.NomeDoOponente then
            											-- Obter ID do personagem Loan
            											local idPersonagem = bibItemFilho;
            
            											-- Solicita acesso à ficha do personagem
            											local promise = bibItemFilho:asyncOpenNDB();
            
            											-- Aguarda até que a ficha esteja carregada
            											local nodeExterno = await(promise);
            
            											-- Acessa o valor da força do personagem
            											
            											if node.HPBarResolveO ~= 0 and node.HPBarResolveO ~= nil and node.HPBarResolveO ~= "" then 
            												local hpBarInput = tostring(node.HPBarResolveO) -- Converte o valor para string, caso não seja
            												if hpBarInput:match("^%+%d+$") then
            													-- Se começar com "+", soma ao valor existente
            													local valor = tonumber(hpBarInput:sub(2)) -- Remove o "+" e converte para número
            													nodeExterno.HPAtual = (tonumber(node.HPBarO) or 0) + valor
            												elseif hpBarInput:match("^%-%d+$") then
            													-- Se começar com "-", subtrai do valor existente
            													local valor = tonumber(hpBarInput:sub(2)) -- Remove o "-" e converte para número
            													nodeExterno.HPAtual = (tonumber(node.HPBarO) or 0) - valor
            												else
            													-- Se não tiver "+" ou "-", aplica o valor diretamente
            													nodeExterno.HPAtual = tonumber(hpBarInput)
            												end
            											end;
            
            											if node.MPBarResolveO ~= 0 and node.MPBarResolveO ~= nil and node.MPBarResolveO ~= "" then 
            												-- Ajuste para MPAtual
            												local mpBarInput = tostring(node.MPBarResolveO) -- Converte o valor para string, caso não seja
            												if mpBarInput:match("^%+%d+$") then
            													-- Se começar com "+", soma ao valor existente
            													local valor = tonumber(mpBarInput:sub(2)) -- Remove o "+" e converte para número
            													nodeExterno.MPAtual = (tonumber(node.MPBarO) or 0) + valor
            												elseif mpBarInput:match("^%-%d+$") then
            													-- Se começar com "-", subtrai do valor existente
            													local valor = tonumber(mpBarInput:sub(2)) -- Remove o "-" e converte para número
            													nodeExterno.MPAtual = (tonumber(node.MPBarO) or 0) - valor
            												else
            													-- Se não tiver "+" ou "-", aplica o valor diretamente
            													nodeExterno.MPAtual = tonumber(mpBarInput)
            												end
            											end;
            
            										end
            									end
            								return nomes								
            									
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);
            								
            							end;	
            
            							if	self.BoxDetalheOponentes.visible == true then
            								local node = self.rclGrupoOponentes.selectedNode;   
            								self.rclGrupoOponentes.node = node;
            								
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            
            								local function obterNomesRecursivo(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivo(bibItemFilho) or "";
            
            										if nomesDoFilho == node.NomeDoOponente then
            											-- Obter ID do personagem Loan
            											local idPersonagem = bibItemFilho;
            
            											-- Solicita acesso à ficha do personagem
            											local promise = bibItemFilho:asyncOpenNDB();
            
            											-- Aguarda até que a ficha esteja carregada
            											local nodeExterno = await(promise);
            
            											-- Acessa o valor da força do personagem
            
            											if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
            												node.PA = tonumber(nodeExterno.PA) or '0';
            												node.PM = tonumber(nodeExterno.PM) or '0';
            												node.PF = tonumber(nodeExterno.PF) or '0';
            												node.DEF = tonumber(nodeExterno.DEFRED) or '0';
            												node.RES = tonumber(nodeExterno.RESRED) or '0';
            												node.AC = tonumber(nodeExterno.Acerto) or '0';
            												node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            												node.CR = tonumber(nodeExterno.Critical) or '0';
            												node.CRM = tonumber(nodeExterno.CMagico) or '0';
            												node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            												node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            												node.Vez = node.Vez or '0';
            												node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
            												node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
            												node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
            												node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
            												node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            												node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
            												node.MPBarMaxO = tonumber(nodeExterno.MPTotal) or '0';
            												node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
            												node.MPBarO = tonumber(nodeExterno.MPAtual) or '0';
            												node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoOponente
            												node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
            											else
            												node.PA = tonumber(nodeExterno.Dano) or '0';
            												node.PM = tonumber(nodeExterno.DanoMagico) or '0';
            												node.PF = "NPC";
            												node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
            												node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
            												node.AC = tonumber(nodeExterno.Acerto) or '0';
            												node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            												node.CR = tonumber(nodeExterno.Critical) or '0';
            												node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
            												node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            												node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            												node.Vez = node.Vez or '0';
            												node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
            												node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
            												node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
            												node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
            												node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            												node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
            												node.MPBarMaxO = tonumber(nodeExterno.MPTotal) or '0';
            												node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
            												node.MPBarO = tonumber(nodeExterno.MPAtual) or '0';
            												node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
            												node.imagemDoPersonagem = nodeExterno.imgInimigo
            											end;
            										end
            									end
            								return nomes								
            									
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);
            								
            							end;	
            
            							end
        end);

    obj._e_event22 = obj.btnEffectO:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("FrmEffectTesteO");
            							novoForm:setNodeObject(self.rclGrupoOponentes.selectedNode);
            							novoForm:show();
        end);

    obj._e_event23 = obj.btnResetLog:addEventListener("onClick",
        function (event)
            ResetaLog()
        end);

    obj._e_event24 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            local personagem = rrpg.getPersonagemDe(sheet); 
            
            								          
            											
            								if (personagem ~= nil) then
            									local mesa = personagem.mesa;
            									if (mesa.meuJogador.id) == 51345 then
            
            										
            										if sheet.UsuarioEnvio ~= nil and sheet.EscolheTipoAtaque ~= "Cura" and sheet.EscolheTipoAtaque ~= "Cura Fixa" then
            											UsuarioEnvio = AchaQuemEnviou(sheet.UsuarioEnvio, sheet.NomeJogador, sheet.NomeOponentes)
            										end;
            
            										if sheet.AlvoRecebido ~= nil and sheet.EscolheTipoAtaque ~= "Cura" and sheet.EscolheTipoAtaque ~= "Cura Fixa" then
            											AlvoEnviou = VerificaAlvo(sheet.AlvoRecebido, sheet.NomeJogador, sheet.NomeOponentes)
            										end;
            																			
            												
            										local mesaDoPersonagem = Firecast.getRoomOf(sheet); 
            
            										if sheet.TipoRecebido == "Cura" or sheet.TipoRecebido == "Cura Fixa" then
            											HabilidadeCura(nil)
            										end;          
            
            											if sheet.AlvoRecebido ~= nil and sheet.AlvoRecebido ~= "" then
            												-- Acessa o RecordList do grupo de jogadores
            												local nodes = ndb.getChildNodes(sheet.NomeJogador) -- Substitua pelo campo correto
            
            												for _, node in ipairs(nodes) do
            													if node.NomeDoPersonagemVez == sheet.AlvoRecebido then
            														-- Seleciona automaticamente o item no RecordList
            														self.rclGrupoJogadores.selectedNode = node
            														break -- Encerra o loop ao encontrar o item correspondente
            													end
            												end
            											end
            
            											if sheet.AlvoRecebido ~= nil and sheet.AlvoRecebido ~= "" then
            												-- Acessa o RecordList do grupo de jogadores
            												local nodes = ndb.getChildNodes(sheet.NomeOponentes) -- Substitua pelo campo correto
            
            												for _, node in ipairs(nodes) do
            													if node.NomeDoOponenteVez == sheet.AlvoRecebido then
            														-- Seleciona automaticamente o item no RecordList
            														self.rclGrupoOponentes.selectedNode = node
            														break -- Encerra o loop ao encontrar o item correspondente
            													end
            												end
            											end
            
            											
            
            											if sheet.GrupoRecebido == "1" then
            												local nodes = ndb.getChildNodes(sheet.NomeOponentes)
            													
            												for _, node in ipairs(nodes) do
            													if node.NomeDoOponenteVez == sheet.AlvoRecebido then						
            														
            														--AQUI--
            														if	self.BoxDetalheOponentes.visible == true then
            															local node = self.rclGrupoOponentes.selectedNode;   
            															self.rclGrupoOponentes.node = node;
            															
            															local mesas = rrpg.getRooms();
            															local bibliotecaAtual = mesas[1].library;
            
            															local function obterNomesRecursivoI(bibItem)
            																local itensFilhos = bibItem.children;
            																local nomes = bibItem.name;								
            
            																for i = 1, #itensFilhos, 1 do
            																	local bibItemFilho = itensFilhos[i];
            																	local nomesDoFilho = obterNomesRecursivoI(bibItemFilho) or "";									
            
            																	if nomesDoFilho == node.NomeDoOponente then
            																		-- Obter ID do personagem Loan
            																		local idPersonagem = bibItemFilho;
            																		
            
            																		-- Solicita acesso à ficha do personagem
            																		local promise = bibItemFilho:asyncOpenNDB();
            																		
            																		-- Aguarda até que a ficha esteja carregada
            																		local nodeExterno = await(promise);
            
            																		-- Sincronizando
            
            																		if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
            																			node.PA = tonumber(nodeExterno.PA) or '0';
            																			node.PM = tonumber(nodeExterno.PM) or '0';
            																			node.PF = tonumber(nodeExterno.PF) or '0';
            																			node.DEF = tonumber(nodeExterno.DEFRED) or '0';
            																			node.RES = tonumber(nodeExterno.RESRED) or '0';
            																			node.AC = tonumber(nodeExterno.Acerto) or '0';
            																			node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            																			node.CR = tonumber(nodeExterno.Critical) or '0';
            																			node.CRM = tonumber(nodeExterno.CMagico) or '0';
            																			node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            																			node.Pers = math.floor(tonumber(nodeExterno.Persistencia)) or '0';
            																			node.Vez = node.Vez or '0';
            																			node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
            																			node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
            																			node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
            																			node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
            																			node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            																			node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
            																			node.MPBarMaxO = math.floor(tonumber(nodeExterno.MPTotal)) or '0';
            																			node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
            																			node.MPBarO = math.floor(tonumber(nodeExterno.MPAtual)) or '0';
            																			node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoOponente
            																			node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
            																		else
            																			node.PA = tonumber(nodeExterno.Dano) or '0';
            																			node.PM = tonumber(nodeExterno.DanoMagico) or '0';
            																			node.PF = "NPC";
            																			node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
            																			node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
            																			node.AC = tonumber(nodeExterno.Acerto) or '0';
            																			node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            																			node.CR = tonumber(nodeExterno.Critical) or '0';
            																			node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
            																			node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            																			node.Pers = math.floor(tonumber(nodeExterno.Persistencia)) or '0';
            																			node.Vez = node.Vez or '0';
            																			node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
            																			node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
            																			node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
            																			node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
            																			node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            																			node.HPBarMaxO = tonumber(nodeExterno.HPTotal) or '0';
            																			node.MPBarMaxO = math.floor(tonumber(nodeExterno.MPTotal)) or '0';
            																			node.HPBarO = tonumber(nodeExterno.HPAtual) or '0';
            																			node.MPBarO = math.floor(tonumber(nodeExterno.MPAtual)) or '0';
            																			node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
            																			node.imagemDoPersonagem = nodeExterno.imgInimigo
            																		end;
            		
            																		if sheet.EscolheTipoAtaque == 'PA' or sheet.EscolheTipoAtaque == 'DF' or sheet.EscolheTipoAtaque == 'PA+PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PAEffectTotal) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/PA' or sheet.EscolheTipoAtaque == 'M/DF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PAEffectTotal / 2)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'PA+M/PA' or sheet.EscolheTipoAtaque == 'DF' or sheet.EscolheTipoAtaque == 'PA+PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PAEffectTotal) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'DF+M/DF' or sheet.EscolheTipoAtaque == 'DF' or sheet.EscolheTipoAtaque == 'PA+PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PAEffectTotal) or 0)
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PFEffectTotal) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/PF' or sheet.EscolheTipoAtaque == 'M/DF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PFEffectTotal / 2)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'PF+M/PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PFEffectTotal) or 0)
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'PM' or sheet.EscolheTipoAtaque == 'DM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PMEffectTotal or 0)) or 0)
            																		end;	
            																		if sheet.EscolheTipoAtaque == 'PM+M/PM' or sheet.EscolheTipoAtaque == 'DM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PMEffectTotal or 0)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'DM+M/DM' or sheet.EscolheTipoAtaque == 'DM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PMEffectTotal or 0)) or 0)
            																		end;	
            
            																		if sheet.EscolheTipoAtaque == 'PA+PM' or sheet.EscolheTipoAtaque == 'DF+DM' or sheet.EscolheTipoAtaque == 'PF+PM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PMEffectTotal or 0) + (UsuarioEnvio.PFEffectTotal or 0) ) or 0)
            																		end;
            																		
            
            																		if sheet.EscolheTipoAtaque == 'M/PA+PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PAEffectTotal / 2) + (UsuarioEnvio.PFEffectTotal)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/PF+PA' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PFEffectTotal / 2) + (UsuarioEnvio.PAEffectTotal)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/PF+M/PA' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PFEffectTotal / 2) + (UsuarioEnvio.PAEffectTotal / 2)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/PM' or sheet.EscolheTipoAtaque == 'M/DM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PMEffectTotal / 2) or 0)
            																		end;								
            
            																		
            																		if sheet.EscolheTipoAtaque == 'M/PM+PA' or sheet.EscolheTipoAtaque == 'M/DM+DF' or sheet.EscolheTipoAtaque == 'M/PM+PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + ((UsuarioEnvio.PMEffectTotal / 2) or 0) + (UsuarioEnvio.PAEffectTotal or 0)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/DF+DM' or sheet.EscolheTipoAtaque == 'M/PA+PM' or sheet.EscolheTipoAtaque == 'M/PF+PM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + ((UsuarioEnvio.PAEffectTotal / 2) or 0) + (UsuarioEnvio.PMEffectTotal or 0)) or 0)
            																		end;
            
            
            																		if sheet.EscolheTipoAtaque == 'M/PA+M/PM' or sheet.EscolheTipoAtaque == 'M/PF+M/PM' or sheet.EscolheTipoAtaque == 'M/DF+M/DM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + ((UsuarioEnvio.PAEffectTotal / 2) or 0) + (UsuarioEnvio.PMEffectTotal /2) or 0) or 0)
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'REAL PA' or sheet.EscolheTipoAtaque == 'REAL PF' or sheet.EscolheTipoAtaque == 'REAL PM' or sheet.EscolheTipoAtaque == 'REAL DM' or sheet.EscolheTipoAtaque == 'REAL DF' or sheet.EscolheTipoAtaque == 'Real' then
            																			sheet.RedutivelAtual = 0
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'Buff' or sheet.EscolheTipoAtaque == 'Defensiva' then
            																			sheet.RedutivelAtual = 0
            																		end;	
            
            																		if sheet.EscolheTipoAtaque == 'Efeito' then
            																			sheet.RedutivelAtual = 0
            																		end;		
            
            																		if sheet.EscolheTipoAtaque == 'M/PA+M/PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PAEffectTotal / 2) + (UsuarioEnvio.PFEffectTotal / 2)) or 0)
            																		end;					
            																		
            																		if sheet.UsuarioEnvio ~= nil then
            																			DecideOqueRolar(
            																			UsuarioEnvio, 
            																			AlvoEnviou, 
            																			sheet.TipoRecebido, 
            																			sheet.UsuarioEnviouCusto,
            																			self.BoxDetalheJogadores, 
            																			self.BoxDetalheOponentes,
            																			function()
            																				-- Este código só executa DEPOIS que DecideOqueRolar terminar
            																				if sheet.AcertouPergunta == "True" then
            																					mesaDoPersonagem.chat:enviarMensagem("[§K1]---ACERTOU O ALVO---")
            																					local danoFinal = (sheet.DanoRecebido or 0) * (1 - (tonumber(sheet.RedutivelAtual or 0) / 100))
            																					sheet.DanoProLog = danoFinal
            																					node.HPBarO = tonumber(math.floor(node.HPBarO - danoFinal))
            																					nodeExterno.HPAtual = tonumber(node.HPBarO) or '0'
            																					if sheet.FoiCriticalLog == true then																			
            																						atualizarLogCritical()
            																						mesaDoPersonagem.chat:enviarMensagem(string.rep("-", 50) .. "\n[§K1][§K4]⚡⚡ CRITICAL ⚡⚡ --- ACERTOU O ALVO ---\n" .. string.rep("-", 50))
            																					else
            																						atualizarLog()
            																					end;
            																				elseif sheet.AcertouPergunta == "False" then
            																					mesaDoPersonagem.chat:enviarMensagem("[§K2]--ERROU O ALVO--")
            																				else 
            																				end
            																			end
            																			)
            																		end
            
            
            																	end
            																end
            															return nomes
            															end
            															
            															local nomesDeTodosOsItens = obterNomesRecursivoI(bibliotecaAtual);
            														end;
            														
            													end
            												end
            											end;
            
            											if sheet.GrupoRecebido == "2" then
            												local nodes = ndb.getChildNodes(sheet.NomeJogador)
            													
            												for _, node in ipairs(nodes) do
            													if node.NomeDoPersonagemVez == sheet.AlvoRecebido then
            														if	self.BoxDetalheJogadores.visible == true then
            															local node = self.rclGrupoJogadores.selectedNode;   
            															self.rclGrupoJogadores.node = node;
            															
            															local mesas = rrpg.getRooms();
            															local bibliotecaAtual = mesas[1].library;
            
            															local function obterNomesRecursivoP(bibItem)
            																local itensFilhos = bibItem.children;
            																local nomes = bibItem.name;
            
            																for i = 1, #itensFilhos, 1 do
            																	local bibItemFilho = itensFilhos[i];
            																	local nomesDoFilho = obterNomesRecursivoP(bibItemFilho) or "";
            
            																	if nomesDoFilho == node.NomeDoPersonagem then
            																		-- Obter ID do personagem Loan
            																		local idPersonagem = bibItemFilho;
            
            																		-- Solicita acesso à ficha do personagem
            																		local promise = bibItemFilho:asyncOpenNDB();
            
            																		-- Aguarda até que a ficha esteja carregada
            																		local nodeExterno = await(promise);
            
            																		-- Sincronizando
            
            																		if nodeExterno.PA ~= nil or nodeExterno.PA == ""  then
            																			node.PA = tonumber(nodeExterno.PA) or '0';
            																			node.PM = tonumber(nodeExterno.PM) or '0';
            																			node.PF = tonumber(nodeExterno.PF) or '0';
            																			node.DEF = tonumber(nodeExterno.DEFRED) or '0';
            																			node.RES = tonumber(nodeExterno.RESRED) or '0';
            																			node.AC = tonumber(nodeExterno.Acerto) or '0';
            																			node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            																			node.CR = tonumber(nodeExterno.Critical) or '0';
            																			node.CRM = tonumber(nodeExterno.CMagico) or '0';
            																			node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            																			node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            																			node.Vez = node.Vez or '0';
            																			node.Atletismo = tonumber(nodeExterno.TAtletismo) or '0';
            																			node.Sabedoria = tonumber(nodeExterno.TSabedoria) or '0';
            																			node.Percepcao = tonumber(nodeExterno.TPercepcao) or '0';
            																			node.Acrobacia = tonumber(nodeExterno.TAcrobacia) or '0';
            																			node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            																			node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
            																			node.MPBarMax = tonumber(math.floor(tonumber(nodeExterno.MPTotal)) or '0');
            																			node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
            																			node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
            																			node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoPersonagem
            																			node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
            																		else
            																			node.PA = tonumber(nodeExterno.Dano) or '0';
            																			node.PM = tonumber(nodeExterno.DanoMagico) or '0';
            																			node.PF = "NPC";
            																			node.DEF = tonumber(nodeExterno.DefesaPorCent) or '0';
            																			node.RES = tonumber(nodeExterno.ResistenciaPorCent) or '0';
            																			node.AC = tonumber(nodeExterno.Acerto) or '0';
            																			node.ACM = tonumber(nodeExterno.AcertoMagico) or '0';
            																			node.CR = tonumber(nodeExterno.Critical) or '0';
            																			node.CRM = tonumber(nodeExterno.CriticalMagico) or '0';
            																			node.ESQ = tonumber(nodeExterno.Esquiva) or '0';
            																			node.Pers = tonumber(math.floor(nodeExterno.Persistencia) or '0');
            																			node.Vez = node.Vez or '0';
            																			node.Atletismo = tonumber(nodeExterno.Atletismo) or '0';
            																			node.Sabedoria = tonumber(nodeExterno.Sabedoria) or '0';
            																			node.Percepcao = tonumber(nodeExterno.Percepcao) or '0';
            																			node.Acrobacia = tonumber(nodeExterno.Acrobacia) or '0';
            																			node.Vigor = tonumber(nodeExterno.TVigor) or '0';
            																			node.HPBarMax = tonumber(nodeExterno.HPTotal) or '0';
            																			node.MPBarMax = tonumber(math.floor(tonumber(nodeExterno.MPTotal)) or '0');
            																			node.HPBar = tonumber(nodeExterno.HPAtual) or '0';
            																			node.MPBar = tonumber(nodeExterno.MPAtual) or '0';
            																			node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
            																			node.imagemDoPersonagem = nodeExterno.imgInimigo
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'PA' or sheet.EscolheTipoAtaque == 'DF' or sheet.EscolheTipoAtaque == 'PA+PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PAEffectTotal) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/PA' or sheet.EscolheTipoAtaque == 'M/DF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PAEffectTotal / 2)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'PA+M/PA' or sheet.EscolheTipoAtaque == 'DF' or sheet.EscolheTipoAtaque == 'PA+PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PAEffectTotal) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'DF+M/DF' or sheet.EscolheTipoAtaque == 'DF' or sheet.EscolheTipoAtaque == 'PA+PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PAEffectTotal) or 0)
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PFEffectTotal) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/PF' or sheet.EscolheTipoAtaque == 'M/DF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PFEffectTotal / 2)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'PF+M/PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PFEffectTotal) or 0)
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'PM' or sheet.EscolheTipoAtaque == 'DM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PMEffectTotal or 0)) or 0)
            																		end;	
            																		if sheet.EscolheTipoAtaque == 'PM+M/PM' or sheet.EscolheTipoAtaque == 'DM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PMEffectTotal or 0)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'DM+M/DM' or sheet.EscolheTipoAtaque == 'DM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PMEffectTotal or 0)) or 0)
            																		end;	
            																																		
            																		if sheet.EscolheTipoAtaque == 'PA+PM' or sheet.EscolheTipoAtaque == 'DF+DM' or sheet.EscolheTipoAtaque == 'PF+PM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PMEffectTotal or 0) + (UsuarioEnvio.PFEffectTotal or 0) ) or 0)
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'M/PA+PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PAEffectTotal / 2) + (UsuarioEnvio.PFEffectTotal)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/PF+PA' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PFEffectTotal / 2) + (UsuarioEnvio.PAEffectTotal)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/PF+M/PA' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PFEffectTotal / 2) + (UsuarioEnvio.PAEffectTotal / 2)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/PM' or sheet.EscolheTipoAtaque == 'M/DM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + UsuarioEnvio.PMEffectTotal / 2) or 0)
            																		end;								
            
            																		
            																		if sheet.EscolheTipoAtaque == 'M/PM+PA' or sheet.EscolheTipoAtaque == 'M/DM+DF' or sheet.EscolheTipoAtaque == 'M/PM+PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + ((UsuarioEnvio.PMEffectTotal / 2) or 0) + (UsuarioEnvio.PAEffectTotal or 0)) or 0)
            																		end;
            																		if sheet.EscolheTipoAtaque == 'M/DF+DM' or sheet.EscolheTipoAtaque == 'M/PA+PM' or sheet.EscolheTipoAtaque == 'M/PF+PM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + ((UsuarioEnvio.PAEffectTotal / 2) or 0) + (UsuarioEnvio.PMEffectTotal or 0)) or 0)
            																		end;
            
            
            																		if sheet.EscolheTipoAtaque == 'M/PA+M/PM' or sheet.EscolheTipoAtaque == 'M/PF+M/PM' or sheet.EscolheTipoAtaque == 'M/DF+M/DM' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.RES + node.RESEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + ((UsuarioEnvio.PAEffectTotal / 2) or 0) + (UsuarioEnvio.PMEffectTotal /2) or 0) or 0)
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'REAL PA' or sheet.EscolheTipoAtaque == 'REAL PF' or sheet.EscolheTipoAtaque == 'REAL PM' or sheet.EscolheTipoAtaque == 'REAL DM' or sheet.EscolheTipoAtaque == 'REAL DF' or sheet.EscolheTipoAtaque == 'Real' then
            																			sheet.RedutivelAtual = 0
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'Buff' or sheet.EscolheTipoAtaque == 'Defensiva' then
            																			sheet.RedutivelAtual = 0
            																		end;
            
            																		if sheet.EscolheTipoAtaque == 'Efeito' then
            																			sheet.RedutivelAtual = 0
            																		end;			
            
            																		if sheet.EscolheTipoAtaque == 'M/PA+M/PF' then
            																			sheet.RedutivelAtual = tonumber(math.floor(node.DEF + node.DEFEffectTotal))
            																			sheet.DanoRecebido = tonumber(math.floor(sheet.DanoRecebido + (UsuarioEnvio.PAEffectTotal / 2) + (UsuarioEnvio.PFEffectTotal / 2)) or 0)
            																		end;
            					
            																		
            																	
            																		if sheet.UsuarioEnvio ~= nil then
            																			DecideOqueRolar(
            																			UsuarioEnvio, 
            																			AlvoEnviou, 
            																			sheet.TipoRecebido, 
            																			sheet.UsuarioEnviouCusto,
            																			self.BoxDetalheJogadores, 
            																			self.BoxDetalheOponentes,
            																			function()
            
            																				-- Este código só executa DEPOIS que DecideOqueRolar terminar
            																				if sheet.AcertouPergunta == "True" then
            																					mesaDoPersonagem.chat:enviarMensagem("[§K1]---ACERTOU O ALVO---")
            																					local danoFinal = (sheet.DanoRecebido or 0) * (1 - (tonumber(sheet.RedutivelAtual or 0) / 100))
            																					sheet.DanoProLog = danoFinal
            																					node.HPBar = tonumber(math.floor(node.HPBar - danoFinal))
            																					nodeExterno.HPAtual = tonumber(node.HPBar) or '0'																					
            																					if sheet.FoiCriticalLog == true then
            																						atualizarLogCritical()
            																						mesaDoPersonagem.chat:enviarMensagem(string.rep("-", 50) .. "\n[§K1][§K4]⚡⚡ CRITICAL ⚡⚡ --- ACERTOU O ALVO ---\n" .. string.rep("-", 50))
            																					else																						
            																						atualizarLog()
            																					end;
            																				elseif sheet.AcertouPergunta == "False" then
            																					mesaDoPersonagem.chat:enviarMensagem("[§K2]--ERROU O ALVO--")
            																				else 
            																					showMessage('erro, reutilizar habilidade')
            																				end
            																			end
            																			)
            																		end
            																	end
            																end
            															return nomes
            															end
            															local nomesDeTodosOsItens = obterNomesRecursivoP(bibliotecaAtual);
            														end;
            														
            													end
            												end
            											end
            										
            									
            										
            
            									end
            									sheet.UsuarioEnvio = nil
            									sheet.TesteDecidido = nil
            									sheet.AcertouPergunta = nil
            								end;
        end);

    obj._e_event25 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.QuemRecarregou ~= nil then
            				sheet.QuemRecarregou = nil  -- Reseta o campo para evitar múltiplas mensagens
            			end
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.LogCombat ~= nil then self.LogCombat:destroy(); self.LogCombat = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edtMPAtualO ~= nil then self.edtMPAtualO:destroy(); self.edtMPAtualO = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.btnVezProximo ~= nil then self.btnVezProximo:destroy(); self.btnVezProximo = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.btnResetLog ~= nil then self.btnResetLog:destroy(); self.btnResetLog = nil; end;
        if self.gambiMPO ~= nil then self.gambiMPO:destroy(); self.gambiMPO = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.btnEditStatusI ~= nil then self.btnEditStatusI:destroy(); self.btnEditStatusI = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.editAcaoAtual ~= nil then self.editAcaoAtual:destroy(); self.editAcaoAtual = nil; end;
        if self.rclGrupoJogadores ~= nil then self.rclGrupoJogadores:destroy(); self.rclGrupoJogadores = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.progressBar4 ~= nil then self.progressBar4:destroy(); self.progressBar4 = nil; end;
        if self.gambiHPO ~= nil then self.gambiHPO:destroy(); self.gambiHPO = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.btnAcaoProximo ~= nil then self.btnAcaoProximo:destroy(); self.btnAcaoProximo = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.editVezAtual ~= nil then self.editVezAtual:destroy(); self.editVezAtual = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.rclGrupoOponentes ~= nil then self.rclGrupoOponentes:destroy(); self.rclGrupoOponentes = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.btnTurnoProximo ~= nil then self.btnTurnoProximo:destroy(); self.btnTurnoProximo = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.TrocadorDeAcao ~= nil then self.TrocadorDeAcao:destroy(); self.TrocadorDeAcao = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.btnEffectO ~= nil then self.btnEffectO:destroy(); self.btnEffectO = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.btnVezAnterior ~= nil then self.btnVezAnterior:destroy(); self.btnVezAnterior = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.BoxDetalheJogadores ~= nil then self.BoxDetalheJogadores:destroy(); self.BoxDetalheJogadores = nil; end;
        if self.progressBar3 ~= nil then self.progressBar3:destroy(); self.progressBar3 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.btnEditStatus ~= nil then self.btnEditStatus:destroy(); self.btnEditStatus = nil; end;
        if self.gambiMP ~= nil then self.gambiMP:destroy(); self.gambiMP = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.BoxDetalheOponentes ~= nil then self.BoxDetalheOponentes:destroy(); self.BoxDetalheOponentes = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.editTurnoAtual ~= nil then self.editTurnoAtual:destroy(); self.editTurnoAtual = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edtHPAtualO ~= nil then self.edtHPAtualO:destroy(); self.edtHPAtualO = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.gambiHP ~= nil then self.gambiHP:destroy(); self.gambiHP = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.btnTurnoAnterior ~= nil then self.btnTurnoAnterior:destroy(); self.btnTurnoAnterior = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edtHPAtual ~= nil then self.edtHPAtual:destroy(); self.edtHPAtual = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edtMPAtual ~= nil then self.edtMPAtual:destroy(); self.edtMPAtual = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.AvisoDeTempo ~= nil then self.AvisoDeTempo:destroy(); self.AvisoDeTempo = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.btnAcaoAnterior ~= nil then self.btnAcaoAnterior:destroy(); self.btnAcaoAnterior = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.btnEffect ~= nil then self.btnEffect:destroy(); self.btnEffect = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmACSVelen()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmACSVelen();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmACSVelen = {
    newEditor = newfrmACSVelen, 
    new = newfrmACSVelen, 
    name = "frmACSVelen", 
    dataType = "br.com.rrpg.ACSVelen", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Sistema de Combate Velen", 
    description=""};

frmACSVelen = _frmACSVelen;
Firecast.registrarForm(_frmACSVelen);
Firecast.registrarDataType(_frmACSVelen);

return _frmACSVelen;
