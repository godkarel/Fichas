require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmvelen()
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
    obj:setDataType("com.velen");
    obj:setTitle("Velen 4");
    obj:setName("frmvelen");


			local function AtaqueBasico()      
				-- obter a mesa do personagem
				local mesaDoPersonagem = Firecast.getMesaDe(sheet);
				local mesas = rrpg.getRooms();
				local bibliotecaAtual = mesas[1].library;

					local function obterNomesRecursivo(bibItem)
						local itensFilhos = bibItem.children;
						local nomes = bibItem.name;
						
						for i = 1, #itensFilhos, 1 do
							local bibItemFilho = itensFilhos[i];
							local nomesDoFilho = obterNomesRecursivo(bibItemFilho) or "";

							if nomesDoFilho == "Sistema de Combaate Velen" then
								-- Obter ID do personagem Loan
								local idPersonagem = self.cmbInimigos.value;
								
								-- Solicita acesso à ficha do personagem
								local promise = bibItemFilho:asyncOpenNDB();

								-- Aguarda até que a ficha esteja carregada
								nodeExterno = await(promise);
								
								local nodesO = ndb.getChildNodes(nodeExterno.NomeOponentes)
						
								for _, node in ipairs(nodesO) do
									if node.NomeDoOponenteVez == idPersonagem then  -- Verifica se o campo NomeDoOponenteVez existe
										EsqAlvo = node.ESQ
										showMessage(node.ESQ)
										RESAlvo = node.RES
										DefAlvo = node.DEF 
									end
								end
							end
						end
						return nomes
					end

					local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);

				
				------------------------------------------------------------------

				-- se o usuário não preencheu modificador, vamos usar o valor 0
				sheet.Acerto = sheet.Acerto or 0;                        
				if sheet.EscolheAtaqueBasico == nil then
					showMessage("Escolha uma Base de Dano para seu Ataque Basico na lista acima");
				else				
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acerto, "[§K2]Ataque Basico",						
						function (rolado)	
						EsqAlvo = EsqAlvo + 1
						local soDado = rolado.resultado;
							if soDado > EsqAlvo then
								if rolado.resultado > sheet.Critical then
									if sheet.EscolheAtaqueBasico == 'PA' then
										nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = math.floor((sheet.PA * 2) * (1 - (DefAlvo / 100)))
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0] » CRITICAL :dinofauro:");
										
									elseif sheet.EscolheAtaqueBasico == 'PF' then	
										if sheet.AtualFlecha ~= 0 then									
											sheet.AtualFlecha = (tonumber(sheet.AtualFlecha) or 0) - 1;
											nodeExterno.AlvoRecebido = self.cmbInimigos.value
											nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value	
											nodeExterno.DanoRecebido = math.floor((sheet.PF * 2) * (1 - (DefAlvo / 100)))
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico a distancia « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0]» CRITICAL :dinofauro:");											
										else
											mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.nome) .. "[§K3] tentou puxar uma flecha e percebeu que estava sem na aljava");
										end;
									end;	
								else
									if sheet.EscolheAtaqueBasico == 'PA' then
										nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = math.floor((sheet.PA) * (1 - (DefAlvo / 100)))
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico a distancia « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0]»");
									elseif sheet.EscolheAtaqueBasico == 'PF' then		
										if sheet.AtualFlecha ~= 0 then									
											sheet.AtualFlecha = (tonumber(sheet.AtualFlecha) or 0) - 1;
											nodeExterno.AlvoRecebido = self.cmbInimigos.value
											nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
											nodeExterno.DanoRecebido = math.floor((sheet.PF) * (1 - (DefAlvo / 100)))
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico a distancia « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0]»");
										else
											mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.nome) .. "[§K3] tentou puxar uma flecha e percebeu que estava sem na aljava");
										end;
									end;							
								end;
							else
								mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.nome) .. "[§K3] Errou o ataque no oponente");
							end;
					end); 
				end;
			end; 		   
        



			function DiminuirPontosForca()
                if tonumber(sheet.Forca) > 0 then
					sheet.Forca = tonumber(sheet.Forca) - 1;
					sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) + 1;
                else
					showMessage("Atributo Força não tem valor suficiente para ser subtraido");
                end;
			end;
			
			function AumentarPontosForca()
                if tonumber(sheet.ControladorAtributos) > 0 then
					sheet.Forca = tonumber(sheet.Forca) + 1;
					sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) - 1;
                else
					showMessage("Voce não possui pontos de atributo para destribuir, vai caçar XP");
                end;
			end;
			
			function DiminuirPontosInteligencia()
                if tonumber(sheet.Inteligencia) > 0 then
					sheet.Inteligencia = tonumber(sheet.Inteligencia) - 1;
					sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) + 1;
                else
					showMessage("Atributo Inteligencia não tem valor suficiente para ser subtraido");
                end;
			end;
			
			function AumentarPontosInteligencia()
                if tonumber(sheet.ControladorAtributos) > 0 then
					sheet.Inteligencia = tonumber(sheet.Inteligencia) + 1;
					sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) - 1;
                else
					showMessage("Voce não possui pontos de atributo para destribuir, vai caçar XP");
                end;
			end;
			
			function DiminuirPontosDestreza()
                if tonumber(sheet.Destreza) > 0 then
					sheet.Destreza = tonumber(sheet.Destreza) - 1;
					sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) + 1;
                else
					showMessage("Atributo Destreza não tem valor suficiente para ser subtraido");
                end;
			end;
			
			function AumentarPontosDestreza()
                if tonumber(sheet.ControladorAtributos) > 0 then
					sheet.Destreza = tonumber(sheet.Destreza) + 1;
					sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) - 1;
                else
					showMessage("Voce não possui pontos de atributo para destribuir, vai caçar XP");
                end;
			end;
			
			function DiminuirPontosAgilidade()
                if tonumber(sheet.Agilidade) > 0 then
					sheet.Agilidade = tonumber(sheet.Agilidade) - 1;
					sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) + 1;
                else
					showMessage("Atributo Agilidade não tem valor suficiente para ser subtraido");
                end;
			end;
			
			function AumentarPontosAgilidade()
                if tonumber(sheet.ControladorAtributos) > 0 then
					sheet.Agilidade = tonumber(sheet.Agilidade) + 1;
					sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) - 1;
                else
					showMessage("Voce não possui pontos de atributo para destribuir, vai caçar XP");
                end;
			end;
			
			function DiminuirPontosVitalidade()
                if tonumber(sheet.Vitalidade) > 0 then
					sheet.Vitalidade = tonumber(sheet.Vitalidade) - 1;
					sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) + 1;
                else
					showMessage("Atributo Vitalidade não tem valor suficiente para ser subtraido");
                end;
			end;
			
			function AumentarPontosVitalidade()
                if tonumber(sheet.ControladorAtributos) > 0 then
					sheet.Vitalidade = tonumber(sheet.Vitalidade) + 1;
					sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) - 1;
                else
					showMessage("Voce não possui pontos de atributo para destribuir, vai caçar XP");
                end;
			end;			
		



	


 
		function self.ControlaClasseMP()
			
			sheet.RHPNivelAte20 = sheet.Level;
			
			if sheet.RHPNivelAte20 > 20 then
				sheet.RHPNivelAte20 = 20;
			end;
						
			if sheet.Classe == 'Animago' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 4 + 130;
			end;
			
			if sheet.Classe == 'Arqueiro' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 3 + 120;
			end;
			
			if sheet.Classe == 'Bardo' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 4 + 130;
			end;
			
			if sheet.Classe == 'Bispo' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 4 + 140;
			end;
			
			if sheet.Classe == 'Caçador de Almas' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 4 + 130;
			end;
			
			if sheet.Classe == 'Guerreiro' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 2 + 110;
			end;
			
			if sheet.Classe == 'Ladino' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 2 + 100;
			end;
			
			if sheet.Classe == 'Mago' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 4 + 135;
			end;
			
			if sheet.Classe == 'Mercenario' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 3 + 115;
			end;
			
			if sheet.Classe == 'Monge' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 3 + 120;
			end;
			
			if sheet.Classe == 'Paladino' then
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20 	) or 0) * 3 + 120;
			end;
		end;					
	


	
    



	


 
		function self.ControlaEspecMP()
		
			if sheet.Level < 21 then
				sheet.EMPNivel = 0;
			end;	
		     
			sheet.RHPNivelAte30 = math.floor((sheet.Level) - 20);
			
			if sheet.RHPNivelAte30 > 10 then
				sheet.RHPNivelAte30 = 10;
			end;

			if sheet.RHPNivelAte30 < 0 then
				sheet.RHPNivelAte30 = 0;
			end;

			if sheet.Espec == 'Druida' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
			
			if sheet.Espec == 'Shaman' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 2;
			end;
			
			if sheet.Espec == 'Caçador' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
			
			if sheet.Espec == 'Sentinela Lunar' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 4;
			end;
			
			if sheet.Espec == 'Encantador de Almas' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
			
			if sheet.Espec == 'Musicista da Guerra' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 4;
			end;
			
			if sheet.Espec == 'Necromance' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
			
			if sheet.Espec == 'Sacerdote' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 5;
			end;
			
			if sheet.Espec == 'Juiz' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
			
			if sheet.Espec == 'Barbaro' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
			
			if sheet.Espec == 'Tanker' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 2;
			end;
			
			if sheet.Espec == 'Acrobata' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
			
			if sheet.Espec == 'Assassino' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 2;
			end;
			
			if sheet.Espec == 'Arcanista' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
			
			if sheet.Espec == 'Elementalista' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
			
			if sheet.Espec == 'Summoner' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 4;
			end;
			
			if sheet.Espec == 'Duelista' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
			
			if sheet.Espec == 'Pirata' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 2;
			end;
			
			if sheet.Espec == 'Guardião da Serenidade' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 2;
			end;
			
			if sheet.Espec == 'Guardião Espiritual' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 2;
			end;
			
			if sheet.Espec == 'Cavaleiro das Trevas' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 2;
			end;
			
			if sheet.Espec == 'Templario' then
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
			end;
		end;
	


	
    


		
	


 
		function self.CalculaHP()
			if sheet.Level < 21 then
				sheet.EHPNivel = 0;
				sheet.HPRACAATE30 = 0;
			end;
			
			sheet.HPTotal = (tonumber(sheet.VitalidadeTotal) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + 
			(tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
			(tonumber(sheet.PHPRacial) or 0) + (tonumber(sheet.PHPBasica) or 0) + (tonumber(sheet.HPRACAATE20) or 0) + (tonumber(sheet.CHPNivel) or 0) + 
			(tonumber(sheet.EHPNivel) or 0) + (tonumber(sheet.HPRACAATE30) or 0);
		end;
	


		
    



	


 
		function CalculaMP()
			if sheet.Level < 21 then
				sheet.EMPNivel = 0;
			end;

			sheet.MPTotal = (tonumber(sheet.InteligenciaTotal * 1.5) or 0) + (tonumber(sheet.ArmaMP) or 0) + 
			(tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) + (tonumber(sheet.MPMont) or 0) +
			(tonumber(sheet.PMPRacial) or 0) + (tonumber(sheet.PMPBasica) or 0) + (tonumber(sheet.CMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0) + (tonumber(sheet.DMP) or 0)+ 
			(tonumber(sheet.ConEscolhidoBlume) or 0);	
		end;
	


	
    


	
	



		function self.ControlaRacaHPAte20()
			sheet.RHPNivelAte20 = sheet.Level;
			
			if sheet.RHPNivelAte20 > 20 then
				sheet.RHPNivelAte20 = 20;
			end;
			
			if sheet.Raca == 'Humano' then
				sheet.HPRACAATE20 = (tonumber(sheet.RHPNivelAte20) or 0) * 10;
			end;
			
			if sheet.Raca == 'Elfo' then
				sheet.HPRACAATE20 = (tonumber(sheet.RHPNivelAte20) or 0) * 8;
			end;					
			
			if sheet.Raca == 'Elfo Negro' then
				sheet.HPRACAATE20 = (tonumber(sheet.RHPNivelAte20) or 0) * 8;
			end;
			
			if sheet.Raca == 'Anão' then
				sheet.HPRACAATE20 = (tonumber(sheet.RHPNivelAte20) or 0) * 12;
			end;	
			
			if sheet.Raca == 'Orc' then
				sheet.HPRACAATE20 = (tonumber(sheet.RHPNivelAte20) or 0) * 11;
			end;
			
			if sheet.Raca == 'Kamael' then
				sheet.HPRACAATE20 = (tonumber(sheet.RHPNivelAte20) or 0) * 8;
			end;
			
			if sheet.Raca == 'Thiefling' then
				sheet.HPRACAATE20 = (tonumber(sheet.RHPNivelAte20) or 0) * 9;				
			end;
			
		end;		
	


		
	



	



		function self.ControlaRacaHPAte30()   
			sheet.HPRACAATE30 = 0;        
			sheet.RHPNivelAte30 = math.floor((sheet.Level) - 20);
			
			if sheet.RHPNivelAte30 > 10 then
				sheet.RHPNivelAte30 = 10;
			end;

			if sheet.RHPNivelAte30 < 0 then
				sheet.RHPNivelAte30 = 0;
			end;		
							
			if sheet.Raca == 'Humano' then
				sheet.HPRACAATE30 = (tonumber(sheet.RHPNivelAte30) or 0) * 20;
			end;
			
			if sheet.Raca == 'Elfo' then						
				sheet.HPRACAATE30 = (tonumber(sheet.RHPNivelAte30) or 0) * 16;
			end;
			
			if sheet.Raca == 'Elfo Negro' then					
				sheet.HPRACAATE30 = (tonumber(sheet.RHPNivelAte30) or 0) * 16;						
			end;
			
			if sheet.Raca == 'Anão' then						
				sheet.HPRACAATE30 = (tonumber(sheet.RHPNivelAte30) or 0) * 24;				
			end;
			
			if sheet.Raca == 'Orc' then
				sheet.HPRACAATE30 = (tonumber(sheet.RHPNivelAte30) or 0) * 22;						
			end;
			
			if sheet.Raca == 'Kamael' then					
				sheet.HPRACAATE30 = (tonumber(sheet.RHPNivelAte30) or 0) * 16;					
			end;
			
			if sheet.Raca == 'Thiefling' then				
				sheet.HPRACAATE30 = (tonumber(sheet.RHPNivelAte30) or 0) * 18;				
			end;
		end;
	


		
	


		
	


 
		function self.ControlaClasseEspecialHPAte20()	
			if sheet.classe == 'Cavaleiro Draconico' then
				sheet.RHPNivelAte20 = sheet.Level;
			
				if sheet.RHPNivelAte20 > 20 then
					sheet.RHPNivelAte20 = 20;
				end;
			
				sheet.HPRACAATE20 = (tonumber(sheet.RHPNivelAte20) or 0) * 11;
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 17  + 200;
			end;					
		end;
	



    



	



		function self.ControlaClasseHPAte20()	
			sheet.RHPNivelAte20 = sheet.Level;
			
			if sheet.RHPNivelAte20 > 20 then
				sheet.RHPNivelAte20 = 20;
			end;
		
			if sheet.Classe == 'Animago' then		
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 14 + 170;
			end;	
				
			if sheet.Classe == 'Arqueiro' then
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 16 + 170;
			end;	
				
			if sheet.Classe == 'Bardo' then
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 12 + 150;
			end;	
				
			if sheet.Classe == 'Bispo' then
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 14 + 160;
			end;	
				
			if sheet.Classe == 'Caçador de Almas' then
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 15 + 170;
			end;	
				
			if sheet.Classe == 'Guerreiro' then
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 20 + 220;
			end;	
				
			if sheet.Classe == 'Ladino' then
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 14 + 150;
			end;	
				
			if sheet.Classe == 'Mago' then
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 12 + 140;
			end;	
				
			if sheet.Classe == 'Mercenario' then
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 16 + 170;
			end;	
				
			if sheet.Classe == 'Monge' then
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 16 + 180;
			end;	
				
			if sheet.Classe == 'Paladino' then
				sheet.CHPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 18 + 200;
			end;
		end;
	


	
	



	



		function self.ControlaEspecHPAte30()
			if sheet.Level > 20 then        
				sheet.RHPNivelAte30 = math.floor((sheet.Level) - 20);
				sheet.EHPNivel = 0;	
				
				if sheet.RHPNivelAte30 > 10 then
					sheet.RHPNivelAte30 = 10;
				end;

				if sheet.RHPNivelAte30 < 0 then
					sheet.RHPNivelAte30 = 0;
				end;							
				
				if sheet.Espec == 'Druida' then
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 22 + 600;					
				end;
				
				if sheet.Espec == 'Shaman' then
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 24 + 600;
				end;
				
				if sheet.Espec == 'Caçador' then
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 22 + 600;
				end;
				
				if sheet.Espec == 'Sentinela Lunar' then
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 21 + 600;
				end;
				
				if sheet.Espec == 'Encantador de Almas' then						
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 21 + 600;
				end;
				
				if sheet.Espec == 'Musicista da Guerra' then						
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 23 + 600;
				end;
				
				if sheet.Espec == 'Necromance' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 22 + 600;
				end;
				
				if sheet.Espec == 'Sacerdote' then
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 25 + 600;
				end;
				
				if sheet.Espec == 'Juiz' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 28 + 600;
				end;
				
				if sheet.Espec == 'Barbaro' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 28 + 600;
				end;
				
				if sheet.Espec == 'Tanker' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 30 + 600;
				end;
				
				if sheet.Espec == 'Acrobata' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 23 + 600;
				end;
				
				if sheet.Espec == 'Assassino' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 21 + 600;
				end;
				
				if sheet.Espec == 'Arcanista' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 20 + 600;
				end;
				
				if sheet.Espec == 'Elementalista' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 22 + 600;
				end;
				
				if sheet.Espec == 'Summoner' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 20 + 600;
				end;
				
				if sheet.Espec == 'Duelista' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 24 + 600;
				end;
				
				if sheet.Espec == 'Pirata' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 26 + 600;
				end;
				
				if sheet.Espec == 'Guardião da Serenidade' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 27 + 600;
				end;
				
				if sheet.Espec == 'Guardião Espiritual' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 26 + 600;
				end;
				
				if sheet.Espec == 'Cavaleiro das Trevas' then							
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 29 + 600;
				end;
				
				if sheet.Espec == 'Templario' then						
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 27 + 600;
				end;
				
				if sheet.Level < 19 then
					sheet.EHPNivel = 0;
				end;
			end;
		end;	
	


	
	


		
	


 
		function self.ControlaClasseEspecialHPAte30()		
			if sheet.classe == 'Cavaleiro Draconico' then
				if sheet.Level > 20 then
					sheet.HPRACAATE30 = 0;        
					sheet.RHPNivelAte30 = math.floor((sheet.Level) - 20);
					sheet.EHPNivel = 0;	
					
					if sheet.RHPNivelAte30 > 10 then
						sheet.RHPNivelAte30 = 10;
					end;

					if sheet.RHPNivelAte30 < 0 then
						sheet.RHPNivelAte30 = 0;
					end;
					
					sheet.HPRACAATE30 = (tonumber(sheet.RHPNivelAte30) or 0) * 22;
					sheet.EHPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 28 + 600;
				end;	
			end;
		end;
	


		
    



		


 
			function IgualarHPMesa()
				local mesa = Firecast.getMesaDe(sheet); 
				if mesa.meuJogador.isJogador == true then;	
					local HPTotalMesa = (tonumber(sheet.HPTotal) or 0);
					mesa.meuJogador:requestSetBarValue(1, nil, HPTotalMesa);
				end;
			end;
		



		
		


 
			function AtualizaStatusMesa()	
				if sheet.SequenciaInicial == true then	
					local mesa = Firecast.getMesaDe(sheet);					
					
					IgualarHPMesa();
					IgualarMPMesa();
					
					if mesa.meuJogador.isJogador == true then;					
						if sheet.Espec == "Juiz" then
							local Linha1 = "(PA" .. (sheet.PA or 0) .. ")" .. "(PF" .. (sheet.PF or 0) .. ")(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
							local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")" .. ")(CR" .. (sheet.Critical) .. ")";
							mesa.meuJogador:requestSetEditableLine(1, Linha1);
							mesa.meuJogador:requestSetEditableLine(2, Linha2);
							showMessage("Status das Linhas, HP e MP Atualizados");
							return
						end;
						
						if sheet.Espec == "Encantador de Almas" or sheet.Espec == "Necromance" or sheet.Espec == "Sacerdote" or sheet.Espec == "Arcanista" or sheet.Espec == "Elementalista" or sheet.Espec == "Summoner" or sheet.Espec == "Musicista da Guerra" then
							local Linha1 = "(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
							local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")(CR" .. (sheet.Critical) .. ")";
							mesa.meuJogador:requestSetEditableLine(1, Linha1);
							mesa.meuJogador:requestSetEditableLine(2, Linha2);
							showMessage("Status das Linhas, HP e MP Atualizados");
							return
						end;	

						if sheet.Espec == "Shaman" or sheet.Espec == "Druida" then
							local Linha1 = "(PA" .. (sheet.PA or 0) .. ")" .. "(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
							local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")(CR" .. (sheet.Critical) .. ")";
							mesa.meuJogador:requestSetEditableLine(1, Linha1);
							mesa.meuJogador:requestSetEditableLine(2, Linha2);
							showMessage("Status das Linhas, HP e MP Atualizados");
							return
						end;
						
						if sheet.Espec == "Barbaro" or sheet.Espec == "Acrobata" or sheet.Espec == "Assassino" or sheet.Espec == "Tanker" or sheet.Espec == "Duelista" or sheet.Espec == "Guardião Espiritual" or sheet.Espec == "Cavaleiro das Trevas" or sheet.Espec == "Templario" or sheet.Espec == "Guardião da Serenidade" then
							local Linha1 = "(PA" .. (sheet.PA or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")(CM" .. (sheet.CMagico) .. ")(CR" .. (sheet.Critical) .. ")";
							local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")";
							mesa.meuJogador:requestSetEditableLine(1, Linha1);
							mesa.meuJogador:requestSetEditableLine(2, Linha2);
							showMessage("Status das Linhas, HP e MP Atualizados");
							return
						end;
						
						if sheet.Espec == "Pirata" or sheet.Espec == "Juiz" then
							local Linha1 = "(PA" .. (sheet.PA or 0) .. ")" .. "(PF" .. (sheet.PF or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
							local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")(CR" .. (sheet.Critical) .. ")";
							mesa.meuJogador:requestSetEditableLine(1, Linha1);
							mesa.meuJogador:requestSetEditableLine(2, Linha2);
							showMessage("Status das Linhas, HP e MP Atualizados");
							return
						end;
						
						if sheet.Espec == "Sentinela Lunar" or sheet.Espec == "Caçador" then
							local Linha1 = "(PF" .. (sheet.PF or 0) .. ")" .. "(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
							local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")(CR" .. (sheet.Critical) .. ")";
							mesa.meuJogador:requestSetEditableLine(1, Linha1);
							mesa.meuJogador:requestSetEditableLine(2, Linha2);
							showMessage("Status das Linhas, HP e MP Atualizados");
							return
						end;
						
						---------------------------------------
						
						if sheet.Classe == "Animago" or sheet.Classe == "Bardo" or sheet.Classe == "Bispo" or sheet.Classe == "Mago" then
							local Linha1 = "(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")(CM" .. (sheet.CMagico) .. ")" .. ")(CR" .. (sheet.Critical) .. ")";
							local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")";
							mesa.meuJogador:requestSetEditableLine(1, Linha1);
							mesa.meuJogador:requestSetEditableLine(2, Linha2);
							showMessage("Status das Linhas, HP e MP Atualizados");
							return
						end;
						
						if sheet.Classe == "Arqueiro" then
							local Linha1 = "(PF" .. (sheet.PF or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")(CM" .. (sheet.CMagico) .. ")" .. ")(CR" .. (sheet.Critical) .. ")";
							local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")";
							mesa.meuJogador:requestSetEditableLine(1, Linha1);
							mesa.meuJogador:requestSetEditableLine(2, Linha2);
							showMessage("Status das Linhas, HP e MP Atualizados");
							return
						end;
						
						if sheet.Classe == "Guerreiro" or sheet.Classe == "Ladino" or sheet.Classe == "Mercenario" or sheet.Classe == "Monge" or sheet.Classe == "Paladino" or sheet.Classe == "Cavaleiro Draconico" then
							local Linha1 = "(PA" .. (sheet.PA or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")(CM" .. (sheet.CMagico) .. ")" .. ")(CR" .. (sheet.Critical) .. ")";
							local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")";
							mesa.meuJogador:requestSetEditableLine(1, Linha1);
							mesa.meuJogador:requestSetEditableLine(2, Linha2);
							showMessage("Status das Linhas, HP e MP Atualizados");
							return
						end;
						
						if sheet.Classe == "Caçador de Almas" or sheet.Espec == "Juiz" then
							local Linha1 = "(PA" .. (sheet.PA or 0) .. ")" .. "(PF" .. (sheet.PF or 0) .. ")(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
							local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")" .. ")(CR" .. (sheet.Critical) .. ")";
							mesa.meuJogador:requestSetEditableLine(1, Linha1);
							mesa.meuJogador:requestSetEditableLine(2, Linha2);
							showMessage("Status das Linhas, HP e MP Atualizados");
							return
						end;
					end;
				end;
			end;
		



		
		


 
			function AtualizaStatusMesaSilencioso()	
				if sheet.SequenciaInicial == true then	
					local mesa = Firecast.getMesaDe(sheet);
					
					if sheet.Espec == "Juiz" then
						local Linha1 = "(PA" .. (sheet.PA or 0) .. ")" .. "(PF" .. (sheet.PF or 0) .. ")(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
						local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")" .. ")(CR" .. (sheet.Critical) .. ")";
						mesa.meuJogador:requestSetEditableLine(1, Linha1);
						mesa.meuJogador:requestSetEditableLine(2, Linha2);
						return
					end;
					
					if sheet.Espec == "Encantador de Almas" or sheet.Espec == "Necromance" or sheet.Espec == "Sacerdote" or sheet.Espec == "Arcanista" or sheet.Espec == "Elementalista" or sheet.Espec == "Summoner" then
						local Linha1 = "(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
						local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")(CR" .. (sheet.Critical) .. ")";
						mesa.meuJogador:requestSetEditableLine(1, Linha1);
						mesa.meuJogador:requestSetEditableLine(2, Linha2);
						return
					end;	

					if sheet.Espec == "Shaman" or sheet.Espec == "Druida" then
						local Linha1 = "(PA" .. (sheet.PA or 0) .. ")" .. "(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
						local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")(CR" .. (sheet.Critical) .. ")";
						mesa.meuJogador:requestSetEditableLine(1, Linha1);
						mesa.meuJogador:requestSetEditableLine(2, Linha2);
						return
					end;
					
					if sheet.Espec == "Barbaro" or sheet.Espec == "Acrobata" or sheet.Espec == "Assassino" or sheet.Espec == "Tanker" or sheet.Espec == "Duelista" or sheet.Espec == "Guardião Espiritual" or sheet.Espec == "Cavaleiro das Trevas" or sheet.Espec == "Templario" or sheet.Espec == "Guardião da Serenidade" then
						local Linha1 = "(PA" .. (sheet.PA or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")(CM" .. (sheet.CMagico) .. ")(CR" .. (sheet.Critical) .. ")";
						local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")";
						mesa.meuJogador:requestSetEditableLine(1, Linha1);
						mesa.meuJogador:requestSetEditableLine(2, Linha2);
						return
					end;
					
					if sheet.Espec == "Pirata" or sheet.Espec == "Juiz" then
						local Linha1 = "(PA" .. (sheet.PA or 0) .. ")" .. "(PF" .. (sheet.PF or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
						local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")(CR" .. (sheet.Critical) .. ")";
						mesa.meuJogador:requestSetEditableLine(1, Linha1);
						mesa.meuJogador:requestSetEditableLine(2, Linha2);
						return
					end;
					
					if sheet.Espec == "Sentinela Lunar" or sheet.Espec == "Caçador" then
						local Linha1 = "(PF" .. (sheet.PF or 0) .. ")" .. "(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
						local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")(CR" .. (sheet.Critical) .. ")";
						mesa.meuJogador:requestSetEditableLine(1, Linha1);
						mesa.meuJogador:requestSetEditableLine(2, Linha2);
						return
					end;
					
					---------------------------------------
					
					if sheet.Classe == "Animago" or sheet.Classe == "Bardo" or sheet.Classe == "Bispo" or sheet.Classe == "Mago" then
						local Linha1 = "(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")(CM" .. (sheet.CMagico) .. ")" .. ")(CR" .. (sheet.Critical) .. ")";
						local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")";
						mesa.meuJogador:requestSetEditableLine(1, Linha1);
						mesa.meuJogador:requestSetEditableLine(2, Linha2);
						return
					end;
					
					if sheet.Classe == "Arqueiro" then
						local Linha1 = "(PF" .. (sheet.PF or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")(CM" .. (sheet.CMagico) .. ")" .. ")(CR" .. (sheet.Critical) .. ")";
						local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")";
						mesa.meuJogador:requestSetEditableLine(1, Linha1);
						mesa.meuJogador:requestSetEditableLine(2, Linha2);
						return
					end;
					
					if sheet.Classe == "Guerreiro" or sheet.Classe == "Ladino" or sheet.Classe == "Mercenario" or sheet.Classe == "Monge" or sheet.Classe == "Paladino" or sheet.Classe == "Cavaleiro Draconico" then
						local Linha1 = "(PA" .. (sheet.PA or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")(CM" .. (sheet.CMagico) .. ")" .. ")(CR" .. (sheet.Critical) .. ")";
						local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")";
						mesa.meuJogador:requestSetEditableLine(1, Linha1);
						mesa.meuJogador:requestSetEditableLine(2, Linha2);
						return
					end;
					
					if sheet.Classe == "Caçador de Almas" or sheet.Espec == "Juiz" then
						local Linha1 = "(PA" .. (sheet.PA or 0) .. ")" .. "(PF" .. (sheet.PF or 0) .. ")(PM" .. (sheet.PM or 0) .. ")(A" .. (sheet.Acerto) ..  ")(AM" .. (sheet.AcertoMagico) .. ")"
						local Linha2 = "(D" .. (sheet.DEFRED or 0) .. ") (R" .. (sheet.RESRED or 0) .. ") (E" .. (sheet.Esquiva) .. ") (P" .. math.floor(sheet.Persistencia) .. ")(CM" .. (sheet.CMagico) .. ")" .. ")(CR" .. (sheet.Critical) .. ")";
						mesa.meuJogador:requestSetEditableLine(1, Linha1);
						mesa.meuJogador:requestSetEditableLine(2, Linha2);
						return
					end;
									
				end;
			end;
		



		
    



		


 
			function IgualarMPMesa()			
				local mesa = Firecast.getMesaDe(sheet); 
				if mesa.meuJogador.isJogador == true then;	
					local MPTotalMesa = (tonumber(sheet.MPTotal) or 0);
					mesa.meuJogador:requestSetBarValue(2, nil, MPTotalMesa);
				end;
			end;
		



		
    



	


 
		function self.ControlaClasseEspecialMPAte20()			
			if sheet.Classe == 'Cavaleiro Draconico' then
				sheet.RHPNivelAte20 = sheet.Level;
				
				if sheet.RHPNivelAte20 > 20 then
					sheet.RHPNivelAte20 = 20;
				end;
						
				sheet.CMPNivel = (tonumber(sheet.RHPNivelAte20) or 0) * 4 + 125;
				
				if sheet.Level < 21 then
					sheet.EMPNivel = 0;
				end;	
			 
				sheet.RHPNivelAte30 = math.floor((sheet.Level) - 20);
				
				if sheet.RHPNivelAte30 > 10 then
					sheet.RHPNivelAte30 = 10;
				end;

				if sheet.RHPNivelAte30 < 0 then
					sheet.RHPNivelAte30 = 0;
				end;	
					
				sheet.EMPNivel = (tonumber(sheet.RHPNivelAte30) or 0) * 3;
				
			end;			
		end;
	


		
    



				local function RolarAtributoPorUpar()            
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
					sheet.modificador = sheet.modificador or 0;                        
					if sheet.LiberarRolagemUp > 0 then
						sheet.LiberarRolagemUp = tonumber(sheet.LiberarRolagemUp) - 1;
						mesaDoPersonagem.chat:rolarDados("1d4", "[§K8]« Rolagem de Atributo por Level UP »",
							function (rolado)
								if rolado.resultado > 0 then
									sheet.PPN = tonumber(rolado.resultado);  
								else
									showMessage("Aconteceu alguma coisa errada ai meu bom");
								end;                                        
								sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) + tonumber(rolado.resultado)
						end);
					else
						showMessage("Voce ja rolou todos seus dados de Level UP");
					end;
				if sheet.LiberarRolagemUp > 0 then
					self.btnUpaLevel.visible = true;
				else
					self.btnUpaLevel.visible = false
				end;					
				end;               
	



		


 
			function StatusDeChances()			
				sheet.DestrezaAcerto = math.floor((tonumber(sheet.DestrezaTotal) or 0) /4);
					
					sheet.AgilidadeESQ = math.floor((tonumber(sheet.AgilidadeTotal) or 0) /5);

					sheet.ForcaPer =  ((tonumber(sheet.ForcaTotal) or 0) /30);
						
					sheet.Acerto = math.floor((tonumber(sheet.ClasseAcerto) or 0) + (tonumber(sheet.EspecAcerto) or 0) + (tonumber(sheet.DestrezaAcerto) or 0) + (tonumber(sheet.AcertoBasica) or 0) + (tonumber(sheet.AcertoRacial) or 0) + (tonumber(sheet.ConBoaMira) or 0));

					if sheet.Level > 20 then
						sheet.AcertoMagico = math.floor((tonumber(sheet.ClasseAM) or 0) + (tonumber(sheet.EspecAM) or 0) + (tonumber(sheet.AMBasica) or 0) + (tonumber(sheet.ConMestreMagico) or 0) + (tonumber(sheet.AMRacial) or 0));
					else 
						sheet.AcertoMagico = math.floor((tonumber(sheet.ClasseAM) or 0) + (tonumber(sheet.AMBasica) or 0) + (tonumber(sheet.AMRacial) or 0) + (tonumber(sheet.ConMestreMagico) or 0));
					end;
					
					if sheet.Level > 20 then
						sheet.Critical = math.floor((tonumber(sheet.ClasseCR) or 0) - (tonumber(sheet.EspecCR) or 0) - (tonumber(sheet.CritBasica) or 0) - (tonumber(sheet.CritRacial) or 0) - (tonumber(sheet.ConEstrategista) or 0));
					else 
						sheet.Critical = math.floor((tonumber(sheet.ClasseCR) or 0) - (tonumber(sheet.CritBasica) or 0) - (tonumber(sheet.CritRacial) or 0) - (tonumber(sheet.ConEstrategista) or 0));
					end;
					
					if sheet.Level > 20 then
						sheet.CMagico = math.floor((tonumber(sheet.ClasseCM) or 0) + (tonumber(sheet.EspecCM) or 0) + (tonumber(sheet.CMBasica) or 0) + (tonumber(sheet.CMRacial) or 0) + (tonumber(sheet.ConCriticalMagico) or 0));
					else 
						sheet.CMagico = math.floor((tonumber(sheet.ClasseCM) or 0) + (tonumber(sheet.CMBasica) or 0) + (tonumber(sheet.CMRacial) or 0) + (tonumber(sheet.ConCriticalMagico) or 0));
					end;
					
					if sheet.Level > 20 then
						sheet.Esquiva = math.floor((tonumber(sheet.ClasseEsquiva) or 0) + (tonumber(sheet.EspecEsquiva) or 0) + (tonumber(sheet.ESQBasica) or 0) + (tonumber(sheet.ESQRacial) or 0) + (tonumber(sheet.ConEvasivo) or 0) + (tonumber(sheet.AgilidadeESQ) or 0) - (tonumber(sheet.OutraDebuffShield) or 0));
					else 
						sheet.Esquiva = math.floor((tonumber(sheet.ClasseEsquiva) or 0) + (tonumber(sheet.ESQBasica) or 0) + (tonumber(sheet.ESQRacial) or 0) + (tonumber(sheet.AgilidadeESQ) or 0) + (tonumber(sheet.ConEvasivo) or 0) - (tonumber(sheet.OutraDebuffShield) or 0));
					end;

					if sheet.Level > 20 then
						sheet.Persistencia = (tonumber(sheet.ClassePer) or 0) + (tonumber(sheet.EspecPer) or 0) + (tonumber(sheet.PersistBasica) or 0) + (tonumber(sheet.PersistRacial) or 0) + (tonumber(sheet.ForcaPer) or 0) + (tonumber(sheet.ConPersistente) or 0); 
					else 
						sheet.Persistencia = (tonumber(sheet.ClassePer) or 0) + (tonumber(sheet.PersistBasica) or 0) + (tonumber(sheet.PersistRacial) or 0) + (tonumber(sheet.ForcaPer) or 0) + (tonumber(sheet.ConPersistente) or 0); 
					end;		
						
					if sheet.Esquiva > 14 then
						sheet.Esquiva = 14;
					end;
							
					if sheet.Acerto > 6 then
						sheet.Acerto = 6;
					end;
					
					if sheet.Persistencia > 5 then
						sheet.Persistencia = 5;
					end;	
			end;
		



		
    



	



		function self.StatusClasseAte20()				
			sheet.ClasseAcerto = 0;
			sheet.ClasseAM = 0;
			sheet.ClasseCR = 0;
			sheet.ClasseCM = 0;
			sheet.ClasseEsquiva = 0;
			sheet.ClassePer = 0;
		
					
			if sheet.Classe == 'Animago' then					
				sheet.ClasseAcerto = 1
				sheet.ClasseAM = 15
				sheet.ClasseCR = 20
				sheet.ClasseCM = 1
				sheet.ClasseEsquiva = 11
				sheet.ClassePer = 1		
			end;	
				
			if sheet.Classe == 'Arqueiro' then
				sheet.ClasseAcerto = 2;
				sheet.ClasseAM = 15;
				sheet.ClasseCR = 20;
				sheet.ClasseCM = 1;
				sheet.ClasseEsquiva = 11;
				sheet.ClassePer = 1;
			end;	
				
			if sheet.Classe == 'Bardo' then
				sheet.ClasseAcerto = 1;
				sheet.ClasseAM = 16;
				sheet.ClasseCR = 20;
				sheet.ClasseCM = 1;
				sheet.ClasseEsquiva = 11;
				sheet.ClassePer = 1;
			end;	
				
			if sheet.Classe == 'Bispo' then
				sheet.ClasseAcerto = 1;
				sheet.ClasseAM = 16;
				sheet.ClasseCR = 20;
				sheet.ClasseCM = 1;
				sheet.ClasseEsquiva = 11;
				sheet.ClassePer = 1;
			end;	
				
			if sheet.Classe == 'Caçador de Almas' then
				sheet.ClasseAcerto = 1;
				sheet.ClasseAM = 15;
				sheet.ClasseCR = 20;
				sheet.ClasseCM = 2;
				sheet.ClasseEsquiva = 11;
				sheet.ClassePer = 1;
			end;	
				
			if sheet.Classe == 'Guerreiro' then
				sheet.ClasseAcerto = 1;
				sheet.ClasseAM = 14;
				sheet.ClasseCR = 19;
				sheet.ClasseCM = 1;
				sheet.ClasseEsquiva = 11;
				sheet.ClassePer = 2;
			end;	
				
			if sheet.Classe == 'Ladino' then
				sheet.ClasseAcerto = 1;
				sheet.ClasseAM = 15;
				sheet.ClasseCR = 20;
				sheet.ClasseCM = 1;
				sheet.ClasseEsquiva = 12;
				sheet.ClassePer = 1;
			end;	
				
			if sheet.Classe == 'Mago' then
				sheet.ClasseAcerto = 1;
				sheet.ClasseAM = 16;
				sheet.ClasseCR = 20;
				sheet.ClasseCM = 1;
				sheet.ClasseEsquiva = 11;
				sheet.ClassePer = 1;

			end;	
				
			if sheet.Classe == 'Mercenario' then
				sheet.ClasseAcerto = 1;
				sheet.ClasseAM = 15;
				sheet.ClasseCR = 19;
				sheet.ClasseCM = 2;
				sheet.ClasseEsquiva = 11;
				sheet.ClassePer = 1;
			end;	
				
			if sheet.Classe == 'Monge' then
				sheet.ClasseAcerto = 1;
				sheet.ClasseAM = 15;
				sheet.ClasseCR = 20;
				sheet.ClasseCM = 1;
				sheet.ClasseEsquiva = 12;
				sheet.ClassePer = 1;
			end;	
				
			if sheet.Classe == 'Paladino' then
				sheet.ClasseAcerto = 1;
				sheet.ClasseAM = 15;
				sheet.ClasseCR= 20;
				sheet.ClasseCM = 1;
				sheet.ClasseEsquiva = 11;
				sheet.ClassePer = 1;
			end;
		end;	
	


	
	



	



		function self.StatusEspecAteLevel30() 
			if sheet.Level < 20 then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;	
			end;
			
			if sheet.Espec == 'Druida' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 1;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;							
			end;
			
			if sheet.Espec == 'Shaman' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 1;
			end;
			
			if sheet.Espec == 'Caçador' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 1;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Sentinela Lunar' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 0;
				sheet.EspecCM = 1;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Encantador de Almas' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 1;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 1;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Musicista da Guerra' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 0;
				sheet.EspecCM = 1;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Necromance' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 0;
				sheet.EspecCM = 1;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Sacerdote' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 1;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Juiz' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 1;
				sheet.EspecCM = 1;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Barbaro' then
				sheet.EspecAcerto = 1;
				sheet.EspecAM = 0;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Tanker' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 1;
			end;
			
			if sheet.Espec == 'Acrobata' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 1;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Assassino' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 1;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Arcanista' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 1;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Elementalista' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 1;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Summoner' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 1;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Duelista' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 1;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Pirata' then
				sheet.EspecAcerto = 1;
				sheet.EspecAM = 0;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Guardião Espiritual' then
				sheet.EspecAcerto = 1;
				sheet.EspecAM = 1;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Guardião da Serenidade' then
				sheet.EspecAcerto = 1;
				sheet.EspecAM = 1;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Cavaleiro das Trevas' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 0;
				sheet.EspecCR = 0;
				sheet.EspecCM = 1;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
			
			if sheet.Espec == 'Templario' then
				sheet.EspecAcerto = 0;
				sheet.EspecAM = 1;
				sheet.EspecCR = 0;
				sheet.EspecCM = 0;
				sheet.EspecEsquiva = 0;
				sheet.EspecPer = 0;
			end;
		end;	
	


	
	


		
	


 
		function self.StatusClasseEspecialAteLevel20()	
			if sheet.classe == 'Cavaleiro Draconico' then						
				sheet.Deslocamento = 9;
				sheet.Correndo = 18 + (tonumber(sheet.CorridaBasica) or 0) + (tonumber(sheet.ConMeioMaratonista) or 0);
				sheet.visao = 10;
				sheet.RegenMP = (tonumber(sheet.VitalidadeTotal / 5) or 0) + 4 + (tonumber(sheet.REGMPBasica) or 0) + (tonumber(sheet.OutraRegenMP) or 0) + (tonumber(sheet.ConTaRegenerando) or 0);
				sheet.ClasseAcerto = 1;
				sheet.ClasseAM = 14;
				sheet.ClasseCR = 20;
				sheet.ClasseCM = 2;
				sheet.ClasseEsquiva = 10;
				sheet.ClassePer = 1;
			end;
		end;
	


		
    


		
	


 
		function self.StatusClasseEspecialAteLevel30()
			if sheet.classe == 'Cavaleiro Draconico' then
				if sheet.level > 20 then
					sheet.EspecAcerto = 0;
					sheet.EspecAM = 1;
					sheet.EspecCR = 0;
					sheet.EspecCM = 0;
					sheet.EspecEsquiva = 0;
					sheet.EspecPer = 0;
				end;
			end;
		end;
	


		
    


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'Raca', 'Level'});
    obj.dataLink1:setName("dataLink1");


	



		function StatusPorRaca()
			sheet.Deslocamento = 0;
			sheet.Correndo = 0;
			sheet.visao = 0;
			sheet.RegenMP = 0;      
			
			if sheet.Raca == 'Humano' then
				sheet.Deslocamento = 9;
				sheet.Correndo = 18 + (tonumber(sheet.CorridaBasica) or 0) + (tonumber(sheet.ConMeioMaratonista) or 0);
				sheet.visao = 10;
				sheet.RegenMP = (tonumber(sheet.VitalidadeTotal / 5) or 0) + 4 + (tonumber(sheet.REGMPBasica) or 0) + (tonumber(sheet.OutraRegenMP) or 0) + (tonumber(sheet.ConTaRegenerando) or 0);	
			end;
			
			if sheet.Raca == 'Elfo' then
				sheet.Deslocamento = 8;
				sheet.Correndo = 20 + (tonumber(sheet.CorridaBasica) or 0) + (tonumber(sheet.ConMeioMaratonista) or 0);
				sheet.visao = 10;
				sheet.RegenMP = (tonumber(sheet.VitalidadeTotal / 5) or 0) + 5 + (tonumber(sheet.REGMPBasica) or 0) + (tonumber(sheet.OutraRegenMP) or 0) + (tonumber(sheet.ConTaRegenerando) or 0);
			end;					
			
			if sheet.Raca == 'Elfo Negro' then
				sheet.Deslocamento = 10;
				sheet.Correndo = 17 + (tonumber(sheet.CorridaBasica) or 0) + (tonumber(sheet.ConMeioMaratonista) or 0);
				sheet.visao = 11;
				sheet.RegenMP = (tonumber(sheet.VitalidadeTotal / 5) or 0) + 4 + (tonumber(sheet.REGMPBasica) or 0) + (tonumber(sheet.OutraRegenMP) or 0) + (tonumber(sheet.ConTaRegenerando) or 0);	
			end;
			
			if sheet.Raca == 'Anão' then
				sheet.Deslocamento = 7;
				sheet.Correndo = 15 + (tonumber(sheet.CorridaBasica) or 0) + (tonumber(sheet.ConMeioMaratonista) or 0);
				sheet.visao = 10;
				sheet.RegenMP = (tonumber(sheet.VitalidadeTotal / 5) or 0) + 4 + (tonumber(sheet.REGMPBasica) or 0) + (tonumber(sheet.OutraRegenMP) or 0) + (tonumber(sheet.ConTaRegenerando) or 0);	
			end;	
			
			if sheet.Raca == 'Orc' then
				sheet.Deslocamento = 8;
				sheet.Correndo = 16 + (tonumber(sheet.CorridaBasica) or 0) + (tonumber(sheet.ConMeioMaratonista) or 0);
				sheet.visao = 10;
				sheet.RegenMP = (tonumber(sheet.VitalidadeTotal / 5) or 0) + 4 + (tonumber(sheet.REGMPBasica) or 0) + (tonumber(sheet.OutraRegenMP) or 0) + (tonumber(sheet.ConTaRegenerando) or 0);	
			end;
			
			if sheet.Raca == 'Kamael' then
				sheet.Deslocamento = 8;
				sheet.Correndo = 18 + (tonumber(sheet.CorridaBasica) or 0) + (tonumber(sheet.ConMeioMaratonista) or 0);
				sheet.visao = 12;
				sheet.RegenMP = (tonumber(sheet.VitalidadeTotal / 5) or 0) + 5 + (tonumber(sheet.REGMPBasica) or 0) + (tonumber(sheet.OutraRegenMP) or 0) + (tonumber(sheet.ConTaRegenerando) or 0);
			end;
			
			if sheet.Raca == 'Thiefling' then
				sheet.Deslocamento = 9;
				sheet.Correndo = 20 + (tonumber(sheet.CorridaBasica) or 0) + (tonumber(sheet.ConMeioMaratonista) or 0);
				sheet.visao = 11;
				sheet.RegenMP = (tonumber(sheet.VitalidadeTotal / 5) or 0) + 4 + (tonumber(sheet.REGMPBasica) or 0) + (tonumber(sheet.OutraRegenMP) or 0) + (tonumber(sheet.ConTaRegenerando) or 0);	
			end;
		end;							
	


		
	



		


 
			function self.ChecaLevel20()	
				if sheet.SequenciaInicial == true then	
					if sheet.Level >= 20 then
						self.cmbEspecializa.enabled = true;
					else	
						self.cmbEspecializa.enabled = false;
					end;

					if sheet.classe == 'Cavaleiro Draconico' then
						self.cmbEspecializa.enabled = false;
					else	
					
					end;	
				end;
			end;
		



		
    


		
		function AtualizaAtributos()
			sheet.ForcaTotal = (math.floor((tonumber(sheet.Forca) or 0) + (tonumber(sheet.FNIvel) or 0) + (tonumber(sheet.DForca) or 0)  + (tonumber(sheet.ConForte) or 0)) or 0) or 1;
			sheet.InteligenciaTotal	= math.floor((tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.INivel) or 0) + (tonumber(sheet.DInteligencia) or 0) + (tonumber(sheet.ConInteligente) or 0));
			sheet.DestrezaTotal = math.floor((tonumber(sheet.Destreza) or 0) + (tonumber(sheet.DNivel) or 0) + (tonumber(sheet.DDestreza) or 0) + (tonumber(sheet.ConHabilidoso) or 0));
			sheet.AgilidadeTotal = math.floor((tonumber(sheet.Agilidade) or 0) + (tonumber(sheet.ANIvel) or 0) + (tonumber(sheet.DAgilidade) or 0) + (tonumber(sheet.ConAgil) or 0));
			sheet.VitalidadeTotal = math.floor((tonumber(sheet.Vitalidade) or 0) + (tonumber(sheet.VNIvel) or 0) + (tonumber(sheet.DVitalidade) or 0) + (tonumber(sheet.ConResistente) or 0));
		end;
	


		
		function AtualizaStatusMapa()
			sheet.ADeslocamento = (tonumber(sheet.AgilidadeTotal / 10) or 0);
			sheet.RealDeslocamento = math.floor(
				(tonumber(sheet.ConMeioMaratonista) or 0) + 
				(tonumber(sheet.Deslocamento) or 0) + 
				(tonumber(sheet.DeslocamentoBasica) or 0) + 
				(tonumber(sheet.ConPassoLargo) or 0)
			);		
			sheet.DVisao = (tonumber(sheet.ConVisaoAguia) or 0) + (tonumber(sheet.DestrezaTotal / 10) or 0);
			sheet.RealVisao = (tonumber(sheet.DVisao) or 0) + (tonumber(sheet.Visao) or 0) + (tonumber(sheet.VisaoBasica) or 0);
		end;
	


		
		function ORCRacial()
			sheet.ORCRacial = 0;											 
			if sheet.SequenciaInicial == true then
				if sheet.Classe == 'Monge' then
					if sheet.Raca == 'Orc' then
						sheet.ORCRacial = (math.floor((tonumber(sheet.ForcaTotal) or 0) *4 + (tonumber(sheet.ArmaPA) or 0) + (tonumber(sheet.OutraPA) or 0) + (tonumber(sheet.ArmaduraPA) or 0) + (tonumber(sheet.AcessorioPA) or 0) +
											 (tonumber(sheet.PARacial) or 0) + (tonumber(sheet.MontPA) or 0) + (tonumber(sheet.PABasica) or 0)) * 0.10);
											 
						sheet.PA = math.floor((tonumber(sheet.ForcaTotal) or 0) *4 + (tonumber(sheet.ArmaPA) or 0) + (tonumber(sheet.OutraPA) or 0) + (tonumber(sheet.ArmaduraPA) or 0) + (tonumber(sheet.AcessorioPA) or 0) +
											 (tonumber(sheet.PARacial) or 0) + (tonumber(sheet.MontPA) or 0) + (tonumber(sheet.PABasica) or 0) + (tonumber(sheet.ORCRacial) or 0));
					else
						sheet.PA = math.floor((tonumber(sheet.ForcaTotal) or 0) *4 + (tonumber(sheet.ArmaPA) or 0) + (tonumber(sheet.OutraPA) or 0) + (tonumber(sheet.ArmaduraPA) or 0) + (tonumber(sheet.AcessorioPA) or 0) +
											 (tonumber(sheet.PARacial) or 0) + (tonumber(sheet.MontPA) or 0) + (tonumber(sheet.PABasica) or 0));
					end;
				else 
					if sheet.Raca == 'Orc' then 
						sheet.ORCRacial = (math.floor((tonumber(sheet.ForcaTotal) or 0) *2 + (tonumber(sheet.ArmaPA) or 0) + (tonumber(sheet.OutraPA) or 0) + (tonumber(sheet.ArmaduraPA) or 0) + (tonumber(sheet.AcessorioPA) or 0) +
											 (tonumber(sheet.PARacial) or 0) + (tonumber(sheet.MontPA) or 0) + (tonumber(sheet.PABasica) or 0)) * 0.10);
											 
						sheet.PA =  math.floor((tonumber(sheet.ForcaTotal) or 0) *2 + (tonumber(sheet.ArmaPA) or 0) + (tonumber(sheet.OutraPA) or 0) + (tonumber(sheet.ArmaduraPA) or 0) + (tonumber(sheet.AcessorioPA) or 0) +
											  (tonumber(sheet.PARacial) or 0) + (tonumber(sheet.MontPA) or 0) + (tonumber(sheet.PABasica) or 0) + (tonumber(sheet.ORCRacial) or 0));									
					else
						sheet.PA =  math.floor((tonumber(sheet.ForcaTotal) or 0) *2 + (tonumber(sheet.ArmaPA) or 0) + (tonumber(sheet.OutraPA) or 0) + (tonumber(sheet.ArmaduraPA) or 0) + (tonumber(sheet.AcessorioPA) or 0) +
											  (tonumber(sheet.PARacial) or 0) + (tonumber(sheet.MontPA) or 0) + (tonumber(sheet.PABasica) or 0));
					end;
				end;
				 
				sheet.PM =  math.floor((tonumber(sheet.InteligenciaTotal) or 0) *2 + (tonumber(sheet.ArmaPM) or 0) + (tonumber(sheet.OutraPM) or 0) + (tonumber(sheet.ArmaduraPM) or 0) + (tonumber(sheet.AcessorioPM) or 0) +
									  (tonumber(sheet.PMRacial) or 0) + (tonumber(sheet.MontPM) or 0) + (tonumber(sheet.PMBasica) or 0));
				sheet.PF =  math.floor((tonumber(sheet.DestrezaTotal) or 0) *2 + (tonumber(sheet.ArmaPF) or 0) + (tonumber(sheet.OutraPF) or 0) + (tonumber(sheet.ArmaduraPF) or 0) + (tonumber(sheet.AcessorioPF) or 0) +
									  (tonumber(sheet.PFRacial) or 0) + (tonumber(sheet.MontPF) or 0) + (tonumber(sheet.PFBasica) or 0));			
				sheet.Defesa =  math.floor((tonumber(sheet.VitalidadeTotal) or 0) /2 + (tonumber(sheet.AgilidadeTotal) or 0) /2 + (tonumber(sheet.ArmaDEF) or 0) + 
										  (tonumber(sheet.OutraDEF) or 0) + (tonumber(sheet.ArmaduraDEF) or 0) + (tonumber(sheet.AcessorioDEF) or 0) + (tonumber(sheet.DEFRacial) or 0) + (tonumber(sheet.DEFBasica) or 0));
				sheet.Resistencia = math.floor((tonumber(sheet.VitalidadeTotal) or 0) /2) + ((tonumber(sheet.Defesa) or 0) /2) +
											   ((tonumber(sheet.InteligenciaTotal) or 0) /2) + (tonumber(sheet.ArmaRES) or 0) + (tonumber(sheet.OutraRES) or 0) + 
											   (tonumber(sheet.ArmaduraRES) or 0) + (tonumber(sheet.AcessorioRES) or 0) + (tonumber(sheet.RESRacial) or 0) + (tonumber(sheet.RESBasica	) or 0) + math.floor(tonumber(sheet.ForcaTotal * 0.25) or 0);
			end;
		end;
	


		
		function CalculaDefesaResistenciaPorNivel()
			if sheet.SequenciaInicial == true then	
				CalculadorRESISTLevel();
				
				if sheet.Level == 30 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /6);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /6);
				end;	
					
				if sheet.level == 29 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /5.6);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /5.6);
				end;
				
				if sheet.level == 28 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /5.3);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /5.3);
				end;
				
				if sheet.level == 27 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /5);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /5);
				end;
				
				if sheet.level == 26 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /4.75);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /4.75);
				end;

				if sheet.level == 25 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /4.6);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /4.6);
				end;
				
				if sheet.level == 24 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /4.3);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /4.3);
				end;
				
				if sheet.level == 23 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /4);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /4);
				end;
				
				if sheet.level == 22 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /3.8);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /3.8);
				end;
				
				if sheet.level == 21 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /3.6);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /3.6);
				end;
				
				if sheet.level == 20 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /3.4);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /3.4);
				end;
				
				if sheet.level == 19 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /3.2);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /3.2);
				end;
				
				if sheet.level == 18 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /3);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /3);
				end;
				
				if sheet.level == 17 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /2.7);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /2.7);
				end;
				
				if sheet.level == 16 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /2.55);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /2.55);
				end;
				
				if sheet.level == 15 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /2.4);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /2.4);
				end;
				
				if sheet.level == 14 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /2.2);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /2.2);
				end;
				
				if sheet.level == 13 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /2);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /2);
				end;
				
				if sheet.level == 12 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /1.8);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /1.8);
				end;
				
				if sheet.level == 11 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /1.65);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /1.65);
				end;
				
				if sheet.level == 10 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /1.55);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /1.55);
				end;
				
				if sheet.level == 9 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /1.35);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /1.35);
				end;
				
				if sheet.level == 8 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /1.25);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /1.25);
				end;
				
				if sheet.level == 7 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /1);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /1);
				end;
				
				if sheet.level == 6 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /0.9);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /0.9);
				end;
				
				if sheet.level == 5 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /0.8);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /0.8);
				end;
				
				if sheet.level == 4 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /0.65);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /0.65);
				end;
				
				if sheet.level == 3 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /0.47);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /0.47);
				end;
				
				if sheet.level == 2 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /0.37);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /0.37);
				end;
				
				if sheet.level == 1 then 
					sheet.DEFRED = math.floor((tonumber(sheet.Defesa) or 0) /0.25);
					sheet.RESRED = math.floor((tonumber(sheet.Resistencia) or 0) /0.25);
				end;
				
				sheet.RESRED = (tonumber(sheet.RESRED) or 0) + (tonumber(sheet.ResistenciaPadrao) or 0);
				
				sheet.DEFRED = math.floor(tonumber(sheet.DEFRED) or 0);
				sheet.RESRED = math.floor(tonumber(sheet.RESRED) or 0);
			end;
		end;
	


		
		function SistemaXPLevel()
			if sheet.SequenciaInicial == true then	
				sheet.XPAtual = tonumber(sheet.XPAtual) or 0;
				
				if sheet.Level > 20 then 
					if sheet.Elevel > 0 then
						sheet.XPNecessario = tonumber(sheet.Elevel) * 100;
					end;
				else
					sheet.XPNecessario = 100 + tonumber(sheet.level) * 50;
				end;
				
				if sheet.XPAtual >= sheet.XPNecessario then
					sheet.XPAtual = tonumber(sheet.XPAtual) - tonumber(sheet.XPNecessario);
					sheet.level = tonumber(sheet.level) + 1;
					sheet.ELevel = tonumber(sheet.level) - 20;
					sheet.PontoHabilidade = tonumber(sheet.PontoHabilidade) + 1;
										
					sheet.LiberarRolagemUp = tonumber(sheet.LiberarRolagemUp) + 1;
					AtualizaStatusMesaSilencioso()
				end;			
				
				self.BarraXP.value = tonumber(sheet.XPAtual);
				self.BarraXP.max = tonumber(sheet.XPNecessario);
				
				if sheet.LiberarRolagemUp > 0 then
					self.btnUpaLevel.visible = true;
				else
					self.btnUpaLevel.visible = false
				end;
				
				if sheet.Level > 30 then
					sheet.Level = 30;
				end;
			end;	
		end;
	


		
		function XPTotalPraUpar()
			if sheet.SequenciaInicial == true then				
				if sheet.Level > 20 then 
					if sheet.Elevel > 0 then
						sheet.XPNecessario = 1050 + tonumber(sheet.ELevel) * 100;
					end;
				else
					sheet.XPNecessario = 100 + tonumber(sheet.level) * 50;
				end;
			end;
		end;
	


		
		function ComandoADM()		
			
			local personagem = rrpg.getPersonagemDe(sheet);  
			local mesa = personagem.mesa;
		
			if mesa.meuJogador.isJogador == false then;						
					if sheet.Nome == 'DeLevel' then	
						sheet.level = tonumber(sheet.level) - 1;
						sheet.LiberarRolagemUp = tonumber(sheet.LiberarRolagemUp) - 1;
						sheet.Nome = 'Feito';			
					end;

					if sheet.Nome == 'ADD1PTS' then	
						sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) + 1;					
						sheet.Nome = 'Feito';			
					end;
					
					if sheet.Nome == 'LevelUP' then	
						ssheet.level = tonumber(sheet.level) + 1;
						sheet.ELevel = tonumber(sheet.level) - 20;
						sheet.PontoSkill = tonumber(sheet.PontoSkill) + 1;
						
						if sheet.Level == 6 then
							sheet.PontosUlt = tonumber(sheet.PontosUlt) + 1;
						end;
						if sheet.Level == 12 then
							sheet.PontosUlt = tonumber(sheet.PontosUlt) + 1;
						end;
						if sheet.Level == 18 then
							sheet.PontosUlt = tonumber(sheet.PontosUlt) + 1;
						end;
						if sheet.Level == 24 then
							sheet.PontosUlt = tonumber(sheet.PontosUlt) + 1;
						end;
						if sheet.Level == 30 then
							sheet.PontosUlt = tonumber(sheet.PontosUlt) + 1;
						end;
						
						sheet.LiberarRolagemUp = tonumber(sheet.LiberarRolagemUp) + 1;
						AtualizaStatusMesaSilencioso()
						
						if sheet.LiberarRolagemUp > 0 then
							self.btnUpaLevel.visible = true;
						else
							self.btnUpaLevel.visible = false
						end;
						
						if sheet.Level > 30 then
							sheet.Level = 30;
						end;					
						
						sheet.Nome = 'Feito';								
					end;
				end;
		end;
	


		
		function CalculadorRESISTLevel()
			if sheet.SequenciaInicial == true then	
				if sheet.Level > 39 then 
					sheet.ResistenciaPadrao = 5;
				end;

				if sheet.Level > 29 then 
					sheet.ResistenciaPadrao = 4;
				end;	

				if sheet.Level > 19 then 
					sheet.ResistenciaPadrao = 3;
				end;

				if sheet.Level > 9 then 
					sheet.ResistenciaPadrao = 2;
				end;				
				
				if sheet.Level > 0 then 
					sheet.ResistenciaPadrao = 1;
				end;
			end;
		end;
	


		
		function IniciaListaConhecimento(PegaSelfPersonagem)
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();
			PegaSelfPersonagem.rclListaConhecimento:append();	
		end;			
	


		
		function AdicionaConhecimentoNomes()
			local nodes = ndb.getChildNodes(sheet.ListaConhecimento); 
			if nodes[1].NomeConhecimento == nil then			
				nodes[1].NomeConhecimento = "Aniglóta";
				nodes[1].DescricaoConhecimento = "Pode falar com os Mamíferos de uma florestas e entendem os gestos deles como resposta."
				nodes[2].NomeConhecimento = "Armadilhas";
				nodes[2].DescricaoConhecimento = "Armadilhas : +3 para descobrir armadilhas no local"
				nodes[3].NomeConhecimento = "Alma da velha tumba";
				nodes[3].DescricaoConhecimento = "Você pode se curar com energia negativa e levar\ndano por energia positiva como um morto-vivo. Este talento não\nfornece nenhuma outra penalidade ou benefício de ser um tipo\nmorto-vivo. ( O Invocador não poderá utilizar magias em si proprio para se curar )"
				nodes[4].NomeConhecimento = "Acalmar sentimentos";
				nodes[4].DescricaoConhecimento = "1 Vez por dia a pessoa sabe diminuir a tenção entre duas pessoas que estejam discutindo"
				nodes[5].NomeConhecimento = "Artista de Circo";
				nodes[5].DescricaoConhecimento = "Recebe + 2 de Acrobacia"
				nodes[6].NomeConhecimento = "Ágil";
				nodes[6].DescricaoConhecimento = "Recebe +3 Pontos de Agilidade"
				nodes[7].NomeConhecimento = "Andarilho do Deserto";
				nodes[7].DescricaoConhecimento = "Recebe + 3 de procurar e esconder quando estiver no deserto"
				nodes[8].NomeConhecimento = "A Arte do Roubo";
				nodes[8].DescricaoConhecimento = "Ao invés de rolar 1d20 no resultado das moedas roubadas ele rolará 10 + d20"
				nodes[9].NomeConhecimento = "Atleta";
				nodes[9].DescricaoConhecimento = "Recebe + 2 de atletismo "
				nodes[10].NomeConhecimento = "Ataque Furtivo Aprimorado";
				nodes[10].DescricaoConhecimento = "Quando rolar a chance de um ataque furtivo não contara a defesa e resistência do oponente"
				nodes[11].NomeConhecimento = "Aumentar Cura";
				nodes[11].DescricaoConhecimento = "Tão próximo da base de sua magia de regeneração e a entende tão bem que amplifica a cura total em 10%\nOBS 1: Esse conhecimento não pode ser pego junto de Voto de Castidade"
				nodes[12].NomeConhecimento = "Ambidestria";
				nodes[12].DescricaoConhecimento = "O Personagem poderá usar 2 armas médias ou pequenas de status diferente, uma em cada mão, perdendo o bônus secundário de cada uma\nExemplo: Adaga critical, Arma Média -1 CD, etc.\nOBS: Não poderá ter equipado 2 armas com mesmo status, e ao receber esse conhecimento, você receberá -1 de acerto mágico e -1 de acerto\n(Na dúvida, converse com o mestre sobre a escolha)"
				nodes[13].NomeConhecimento = "A Primeira é por minha conta";
				nodes[13].DescricaoConhecimento = "O Primeiro golpe ou magia usado na batalha não terá custo de mana OBS : Não funciona com Ultimas "
				nodes[14].NomeConhecimento = "Boa mira";
				nodes[14].DescricaoConhecimento = "Recebe +1 de acerto"
				nodes[15].NomeConhecimento = "Caverna";
				nodes[15].DescricaoConhecimento = "Recebe + 3  para o bônus de procura e esconder-se em cavernas"
				nodes[16].NomeConhecimento = "Crente Fanático";
				nodes[16].DescricaoConhecimento = "Recebe + 1 level de sua Divindade"
				nodes[17].NomeConhecimento = "Criaturas";
				nodes[17].DescricaoConhecimento = "Criaturas: 1d20 + 1d4 para o conhecimento e se tirar a soma maior que o level da criatura dividido por 2, você saberá o HP e MP da criatura\nExemplo: Rolo 1d20 (Tiro 10 + 4 do bônus 10 + 4 = 14) para saber o status de um Demonoide (Level 16). 16 dividido por 2 = 8. [14 > 8] passou no teste"
				nodes[18].NomeConhecimento = "Criaturas Aprimorado";
				nodes[18].DescricaoConhecimento = "Alem de Conhecer o habitate das criaturas ele também pode saber os demais status da criatura = toda a ficha da criatura"
				nodes[19].NomeConhecimento = "Critical Magico";
				nodes[19].DescricaoConhecimento = "Potencializa suas Habilidades antes de lança las e recebe ( +1 De Critical Magico ) "
				nodes[20].NomeConhecimento = "Carismático";
				nodes[20].DescricaoConhecimento = "Recebe +2 teste de Sabedoria"
				nodes[21].NomeConhecimento = "Corrida Deslocada";
				nodes[21].DescricaoConhecimento = "1 vez por batalha poderá usar toda sua corrida como deslocamento total sem perder a ação de ataque"
				nodes[22].NomeConhecimento = "Combatente";
				nodes[22].DescricaoConhecimento = "Recebe + 5 no teste de conhecimento magico ( muito util contra boss )"
				nodes[23].NomeConhecimento = "Deserto";
				nodes[23].DescricaoConhecimento = "Recebe + 3  para o bônus de procura e esconder-se em desertos"
				nodes[24].NomeConhecimento = "Distrair";
				nodes[24].DescricaoConhecimento = "1 Vez por dia poderá ganhar tempo distraindo seu oponente de alguma forma logica"
				nodes[25].NomeConhecimento = "Detetive";
				nodes[25].DescricaoConhecimento = "Recebe +2 teste de Percepção"
				nodes[26].NomeConhecimento = "Diplomata";
				nodes[26].DescricaoConhecimento = "Recebe +2 teste de Sabedoria"
				nodes[27].NomeConhecimento = "Economizador de mana";
				nodes[27].DescricaoConhecimento = "Sabe utilizar bem sua mana sobrando mais mana pra ele ( cada habilidade terá o custo de -3 de Mana )"
				nodes[28].NomeConhecimento = "Escolhido de Blume";
				nodes[28].DescricaoConhecimento = "Pessoas com esse talento natural já nascem com uma quantidade extra de mana ( + 40 de mana )"
				nodes[29].NomeConhecimento = "Equilibrado";
				nodes[29].DescricaoConhecimento = "Ao Invés de rolar no primeiro nível 1d4 + 8 ele rolará 1d6 + 10"
				nodes[30].NomeConhecimento = "Espião";
				nodes[30].DescricaoConhecimento = "Recebe +2 teste de esconder em qualquer Local"
				nodes[31].NomeConhecimento = "Evasivo";
				nodes[31].DescricaoConhecimento = "Recebe +1 de esquiva"
				nodes[32].NomeConhecimento = "Estrategista";
				nodes[32].DescricaoConhecimento = "Recebe +5% de chance de Critical  "
				nodes[33].NomeConhecimento = "Estudando o Oponente";
				nodes[33].DescricaoConhecimento = "O Guerreiro rolará 1d4 de rodadas e no fim dela ele terá direito de saber 1 das mecânicas do boss"
				nodes[34].NomeConhecimento = "Floresta";
				nodes[34].DescricaoConhecimento = "Recebe + 3 para o bônus de procura e esconder-se em Florestas"
				nodes[35].NomeConhecimento = "Forte";
				nodes[35].DescricaoConhecimento = "Recebe +3 Pontos de Força"
				nodes[36].NomeConhecimento = "Golada Rápida";
				nodes[36].DescricaoConhecimento = "1 Vez por Dia você poderá beber 2 poções como em sistema de combate contra exercito"
				nodes[37].NomeConhecimento = "Habilidoso";
				nodes[37].DescricaoConhecimento = "Recebe +3 Pontos de Destreza"
				nodes[38].NomeConhecimento = "Inimigo Predileto";
				nodes[38].DescricaoConhecimento = "Marca uma determinada espécie entre (réptil, inseto, extraplanar, feras, etc.) para ser seu inimigo predileto e receberá sempre, quando lutar contra essa determinada espécie, +10% de critical\nOBS 1: Se você estiver em combate contra 2 inimigos de raças diferentes e uma delas for a sua escolhida, seu personagem só causará critical se o golpe causado for apenas no inimigo declarado. Em caso de dano em área, não contará o bônus desse conhecimento."
				nodes[39].DescricaoConhecimento = "Escolhe um idioma extra para falar"
				nodes[40].NomeConhecimento = "Inteligente";
				nodes[40].DescricaoConhecimento = "Recebe +3 Pontos de Inteligencia"
				nodes[41].NomeConhecimento = "Linguagem Demoníaca";
				nodes[41].DescricaoConhecimento = ""
				nodes[42].NomeConhecimento = "Linguagem das Criaturas Antigas:";
				nodes[42].DescricaoConhecimento = ""
				nodes[43].NomeConhecimento = "Mestre das Estruturas";
				nodes[43].DescricaoConhecimento = "Ao Utilizar Estruturas de combate causará + 50% de Dano nas Estruturas e sua estrutura terá 20% + HP"
				nodes[44].NomeConhecimento = "Magia";
				nodes[44].DescricaoConhecimento = "Recebe +3 de bônus para tentar desvendar o que a habilidade do oponente faz "
				nodes[45].NomeConhecimento = "Mago Oportunista";
				nodes[45].DescricaoConhecimento = "1 vez por batalha o mago poderá utilizar sua magia selecionada como ataque basico ( bola de fogo, pulso magico, energia da natureza e etc. ) como ataque de oportunidade, caso o inimigo chegue a 1.5 metros de distancia"
				nodes[46].NomeConhecimento = "Mestre Navegador";
				nodes[46].DescricaoConhecimento = "Conhece o mapa marítimo e sabe chegar  na maioria dos locais conhecidos!"
				nodes[47].NomeConhecimento = "Mestre Magico";
				nodes[47].DescricaoConhecimento = "Era estudioso na escola de magia por isso tem mais chance de acerto (+1 no Acerto de Magias )"
				nodes[48].NomeConhecimento = "Meio maratonista";
				nodes[48].DescricaoConhecimento = "+1.5m de deslocamento +3m de corrida"
				nodes[49].NomeConhecimento = "Medo da Morte";
				nodes[49].DescricaoConhecimento = "O Personagem tem tanto medo da morte que caso o HP dele zere ele terá +10 no dado para tentar sobreviver na hora de rolar o Vigor"
				nodes[50].NomeConhecimento = "Mestre do Equilíbrio";
				nodes[50].DescricaoConhecimento = "Reduz em -1 a Penalidade de Carregar uma Aljava"
				nodes[51].NomeConhecimento = "Mago de Combate";
				nodes[51].DescricaoConhecimento = "Caso o mago fique sem mana ele poderá atacar o oponente com uma cajadada que causará 20% do P.M da sua arma como Dano P.A Real"
				nodes[52].NomeConhecimento = "Nadador";
				nodes[52].DescricaoConhecimento = "Recebe +2 teste de Vigor para nadar em qualquer Local"
				nodes[53].NomeConhecimento = "Nascido Das Sombras";
				nodes[53].DescricaoConhecimento = "Adiciona +2 no teste de percepção pra invisibilidade do Elfo Negro ( Racial )"
				nodes[54].NomeConhecimento = "Ofidioglóta";
				nodes[54].DescricaoConhecimento = "Pode falar com as cobras e elas entendem oque você diz e respondem mentalmente"
				nodes[55].NomeConhecimento = "Olho Grande";
				nodes[55].DescricaoConhecimento = "Na Hora de pegar os Loots terá + 5 no D20 para começar rodando o dado "
				nodes[56].NomeConhecimento = "Operador";
				nodes[56].DescricaoConhecimento = "Sabe Operar maquinas avançadas"
				nodes[57].NomeConhecimento = "O Sortudo das Carteiras";
				nodes[57].DescricaoConhecimento = "1 Vez por dia ele terá 10% de chance de achar dinheiro perdido na cidade 1d10"
				nodes[58].NomeConhecimento = "Ódio Declarado";
				nodes[58].DescricaoConhecimento = "Você escolherá uma raça, assim como no inimigo predileto. A diferença é que você receberá +10% de chance de crítico mágico e normal quando lutar contra aquela raça (seja ela extraplanar, réptil, orc, etc.)\nOBS 1: Se você estiver em combate contra 2 inimigos de raças diferentes e uma delas for a sua escolhida, seu personagem só causará crítico se o golpe causado for apenas no inimigo declarado. Em caso de dano em área, não contará o bônus desse conhecimento.";
				nodes[59].NomeConhecimento = "O Estocador de Potes"
				nodes[59].DescricaoConhecimento = "Aumenta em +1 o uso de potes por batalha "
				nodes[60].NomeConhecimento = "Personalidade Magnética";
				nodes[60].DescricaoConhecimento = "Tem Facilidade em fazer amigos ( NPC )"
				nodes[61].NomeConhecimento = "Persistente";
				nodes[61].DescricaoConhecimento = "Recebe +1 de Persistência"
				nodes[62].NomeConhecimento = "Pronto para aventura";
				nodes[62].DescricaoConhecimento = "ao invés de rolar 1d4 de atributos toda vez ele receberá fixamente 3"
				nodes[63].NomeConhecimento = "Passo Largo";
				nodes[63].DescricaoConhecimento = "Recebe +1.5m de deslocamento"
				nodes[64].NomeConhecimento = "Perceptivo";
				nodes[64].DescricaoConhecimento = "Recebe + 2 em testes de percepção em qualquer Local"
				nodes[65].NomeConhecimento = "Perito em Escudo";
				nodes[65].DescricaoConhecimento = "Reduz -1 da penalidade de esquiva ao utilizar um escudo"
				nodes[66].NomeConhecimento = "Perito em Escudo Aprimorado";
				nodes[66].DescricaoConhecimento = "Reduz -1 da penalidade de esquiva ao utilizar um escudo"
				nodes[67].NomeConhecimento = "Queda Suave";
				nodes[67].DescricaoConhecimento = "Ao cair de um local você recebe apenas a metade do dano total"
				nodes[68].NomeConhecimento = "Quero Ficar com esse";
				nodes[68].DescricaoConhecimento = "O Personagem escolherá um dos buffs que não poderá ser roubado ou cancelado de primeira ( Nome da skill : ?????? ) só funciona na primeira vez que ele for dissipado ou cancelado durante o combate."
				nodes[69].NomeConhecimento = "Rituais";
				nodes[69].DescricaoConhecimento = "recebe + 2 no bônus de decifrar ritual ou reconhecer runas"
				nodes[70].NomeConhecimento = "Resistente a Ferimentos";
				nodes[70].DescricaoConhecimento = "recebe -10% de dano para dano por rodada"
				nodes[71].NomeConhecimento = "Resistente a Dano Real";
				nodes[71].DescricaoConhecimento = "recebe -10% de Dano para dano Real"
				nodes[72].NomeConhecimento = "Resposta Rápida ";
				nodes[72].DescricaoConhecimento = "Sempre que rolar iniciativa terá um bônus de +4 no dado "
				nodes[73].NomeConhecimento = "Resistente";
				nodes[73].DescricaoConhecimento = "Recebe +3 Pontos de Vitalidade"
				nodes[74].NomeConhecimento = " Runas";
				nodes[74].DescricaoConhecimento = "Recebe + 3 no bônus de reconhecer runas"
				nodes[75].NomeConhecimento = "Sobrevivência";
				nodes[75].DescricaoConhecimento = "recebe + 2 no bônus de procurar e esconder em qualquer local"
				nodes[76].NomeConhecimento = "Sortudo";
				nodes[76].DescricaoConhecimento = "O primeiro ataque corpo a corpo que ele tiver na batalha resultará em crítico. Caso ele erre ou o oponente de alguma forma escape ou bloqueie o golpe, ele não surtirá efeito e não estará guardado para a próxima rodada (só funciona para ataques básicos).\nOBS: Esse conhecimento não combina com habilidades de crítico."
				nodes[77].NomeConhecimento = "Saque Rápido";
				nodes[77].DescricaoConhecimento = "Pode trocar de arma sem precisar perder a ação de rodada para isso "
				nodes[78].NomeConhecimento = "Sem tempo irmão";
				nodes[78].DescricaoConhecimento = "Recarrega as flechas em sua aljava como ação de Buff"
				nodes[79].NomeConhecimento = "Ta Regenerando";
				nodes[79].DescricaoConhecimento = "Recebe +2 de Regen de mana"
				nodes[80].NomeConhecimento = "Usar Ferramentas";
				nodes[80].DescricaoConhecimento = "Recebe +3 de Bônus em testes de usar ferramentas"
				nodes[81].NomeConhecimento = "Voto de Castidade";
				nodes[81].DescricaoConhecimento = "Sua cura irá curar +5% e você receberá +10 de Defesa e Resistência, que irão durar enquanto seu voto permanecer. Após você quebrar o seu Voto, os status serão retirados.\n\nOBS: Esse conhecimento não pode ser pego junto de Aumentar Cura."
				nodes[82].NomeConhecimento = "Visão na penumbra";
				nodes[82].DescricaoConhecimento = "Não recebe penalidade na escuridão"
				nodes[83].NomeConhecimento = "Visão de Águia";
				nodes[83].DescricaoConhecimento = "Recebe + 3M de Visão"
				nodes[84].NomeConhecimento = "Vigoroso";
				nodes[84].DescricaoConhecimento = "Recebe +2 testes de Vigor em qualquer Local"
				nodes[85].NomeConhecimento = "vazio";
				nodes[86].NomeConhecimento = "vazio";
				nodes[87].NomeConhecimento = "vazio";
			end;	
		end;			
	


		
		function AtivarConhecimento()
			if sheet ~= nil then
				local nodes = ndb.getChildNodes(sheet.ListaConhecimento); 
				
				if nodes[5].DConhecimento == true then
					sheet.ConArtistaCirco = 2;
				else
					sheet.ConArtistaCirco = 0;
				end;
				
				if nodes[6].DConhecimento == true then
					sheet.ConAgil = 3;
				else
					sheet.ConAgil = 0;
				end;
				
				if nodes[9].DConhecimento == true then
					sheet.ConAtleta = 2;
				else
					sheet.ConAtleta = 0;
				end;
				
				if nodes[14].DConhecimento == true then
					sheet.ConBoaMira = 1;
				else
					sheet.ConBoaMira = 0;
				end;
							
				if nodes[19].DConhecimento == true then
					sheet.ConCriticalMagico = 1;
				else
					sheet.ConCriticalMagico = 0;
				end;
				
				if nodes[20].DConhecimento == true then
					sheet.ConCarismatico = 2;
				else
					sheet.ConCarismatico = 0;
				end;
				
				if nodes[25].DConhecimento == true then
					sheet.ConDetetive = 2;
				else
					sheet.ConDetetive = 0;
				end;
				
				if nodes[26].DConhecimento == true then
					sheet.ConDiplomata = 2;
				else
					sheet.ConDiplomata = 0;
				end;
				
				if nodes[28].DConhecimento == true then
					sheet.ConEscolhidoBlume = 40;
				else
					sheet.ConEscolhidoBlume = 0;
				end;
				
				if nodes[31].DConhecimento == true then
					sheet.ConEvasivo = 1;
				else
					sheet.ConEvasivo = 0;
				end;
				
				if nodes[32].DConhecimento == true then
					sheet.ConEstrategista = 1;
				else
					sheet.ConEstrategista = 0;
				end;
				
				if nodes[35].DConhecimento == true then
					sheet.ConForte = 3;
				else
					sheet.ConForte = 0;
				end;
				
				if nodes[37].DConhecimento == true then
					sheet.ConHabilidoso = 3;
				else
					sheet.ConHabilidoso = 0;
				end;
				
				if nodes[40].DConhecimento == true then
					sheet.ConInteligente = 3;
				else
					sheet.ConInteligente = 0;
				end;
				
				if nodes[47].DConhecimento == true then
					sheet.ConMestreMagico = 1;
				else
					sheet.ConMestreMagico = 0;
				end;
				
				if nodes[48].DConhecimento == true then
					sheet.ConMeioMaratonista = 3 or 0;
				else
					sheet.ConMeioMaratonista = 0;
				end;
				
				if nodes[61].DConhecimento == true then
					sheet.ConPersistente = 1;
				else
					sheet.ConPersistente = 0;
				end;
				
				if nodes[63].DConhecimento == true then
					sheet.ConPassoLargo = 1,5;
				else
					sheet.ConPassoLargo = 0;
				end;
				
				if nodes[64].DConhecimento == true then
					sheet.ConPerseptivo = 2;
				else
					sheet.ConPerseptivo = 0;
				end;
				
				if nodes[73].DConhecimento == true then
					sheet.ConResistente = 3;
				else
					sheet.ConResistente = 0;
				end;
				
				if nodes[79].DConhecimento == true then
					sheet.ConTaRegenerando = 2;
				else
					sheet.ConTaRegenerando = 0;
				end;
				
				if nodes[83].DConhecimento == true then
					sheet.ConVisaoAguia = 3;
				else
					sheet.ConVisaoAguia = 0;
				end;
				
				if nodes[84].DConhecimento == true then
					sheet.ConVigoroso = 2;
				else
					sheet.ConVigoroso = 0;
				end;		
				
			end;
		end;			
	


		
		function AtualizaStatusPericia()			
			sheet.TAtletismo = (tonumber(sheet.ForcaTotal / 20) or 0) + (tonumber(sheet.Atletismo) or 0) + (tonumber(sheet.MontAtletismo) or 0) + (tonumber(sheet.RAtletismo) or 0) + (tonumber(sheet.ConAtleta) or 0);
			sheet.TSabedoria = (tonumber(sheet.InteligenciaTotal / 20) or 0) + (tonumber(sheet.Sabedoria) or 0) + (tonumber(sheet.MontSabedoria) or 0) + (tonumber(sheet.RSabedoria) or 0) + (tonumber(sheet.ConCarismatico) or 0) + (tonumber(sheet.ConDiplomata) or 0);
			sheet.TPercepcao = (tonumber(sheet.DestrezaTotal / 20) or 0) + (tonumber(sheet.Percepcao) or 0) + (tonumber(sheet.MontPercepcao) or 0) + (tonumber(sheet.RPercepcao) or 0) + (tonumber(sheet.ConDetetive) or 0) + (tonumber(sheet.ConPerseptivo) or 0);
			sheet.TVigor = (tonumber(sheet.VitalidadeTotal / 20) or 0) + (tonumber(sheet.Vigor) or 0) + (tonumber(sheet.MontVigor) or 0) + (tonumber(sheet.RVigor) or 0) + (tonumber(sheet.ConVigoroso) or 0);
			sheet.TAcrobacia = (tonumber(sheet.AgilidadeTotal / 20) or 0) + (tonumber(sheet.Acrobacia) or 0) + (tonumber(sheet.MontAcrobacia) or 0) + (tonumber(sheet.RAcrobacia) or 0) + (tonumber(sheet.ConArtistaCirco) or 0);
			
			sheet.TAtletismo = math.floor(tonumber(sheet.TAtletismo) or 0)
			sheet.TSabedoria = math.floor(tonumber(sheet.TSabedoria) or 0)
			sheet.TPercepcao = math.floor(tonumber(sheet.TPercepcao) or 0)
			sheet.TVigor = math.floor(tonumber(sheet.TVigor) or 0)
			sheet.TAcrobacia = math.floor(tonumber(sheet.TAcrobacia) or 0)
		end;
	


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(5);
    obj.image1:setTop(5);
    obj.image1:setWidth(620);
    obj.image1:setHeight(920);
    obj.image1:setSRC("/imagens/1.png");
    obj.image1:setName("image1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(288);
    obj.button1:setTop(550);
    obj.button1:setWidth(60);
    obj.button1:setHeight(60);
    obj.button1:setOpacity(0.1);
    obj.button1:setText("Ficha1");
    obj.button1:setName("button1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(288);
    obj.image2:setTop(550);
    obj.image2:setWidth(60);
    obj.image2:setHeight(60);
    obj.image2:setSRC("/imagens/Tok.png");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setLeft(190);
    obj.image3:setTop(475);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setSRC("/imagens/TAGS/Sobreposi.png");
    obj.image3:setName("image3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(160);
    obj.edit1:setTop(60);
    obj.edit1:setWidth(75);
    obj.edit1:setHeight(20);
    obj.edit1:setField("Nome");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(160);
    obj.edit2:setTop(92);
    obj.edit2:setWidth(75);
    obj.edit2:setHeight(20);
    obj.edit2:setField("idade");
    obj.edit2:setName("edit2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(600);
    obj.button2:setVisible(false);
    obj.button2:setTop(10);
    obj.button2:setText("Ficha1");
    obj.button2:setName("button2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.scrollBox1);
    obj.comboBox1:setLeft(305);
    obj.comboBox1:setTop(60);
    obj.comboBox1:setWidth(135);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setField("Classe");
    obj.comboBox1:setItems({'Escolha', 'Animago', 'Arqueiro', 'Bardo', 'Bispo', 'Caçador de Almas', 'Guerreiro', 
		'Ladino', 'Mago', 'Mercenario', 'Monge', 'Paladino','Cavaleiro Draconico' });
    obj.comboBox1:setName("comboBox1");

    obj.cmbEspecializa = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbEspecializa:setParent(obj.scrollBox1);
    obj.cmbEspecializa:setName("cmbEspecializa");
    obj.cmbEspecializa:setLeft(305);
    obj.cmbEspecializa:setTop(92);
    obj.cmbEspecializa:setWidth(135);
    obj.cmbEspecializa:setHeight(20);
    obj.cmbEspecializa:setField("Espec");
    obj.cmbEspecializa:setEnabled(false);
    obj.cmbEspecializa:setItems({'Escolha', 'Druida', 'Shaman', 'Caçador', 'Sentinela Lunar', 'Encantador de Almas', 'Musicista da Guerra',
		'Necromance', 'Sacerdote', 'Juiz', 'Barbaro', 'Tanker', 'Acrobata', 'Assassino', 'Arcanista', 'Elementalista', 'Summoner', 'Duelista', 'Pirata', 'Guardião da Serenidade', 'Guardião Espiritual', 
		'Cavaleiro das Trevas', 'Templario' });

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(490);
    obj.edit3:setTop(60);
    obj.edit3:setWidth(40);
    obj.edit3:setHeight(20);
    obj.edit3:setField("Velis");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(490);
    obj.edit4:setTop(60);
    obj.edit4:setWidth(40);
    obj.edit4:setVisible(false);
    obj.edit4:setHeight(20);
    obj.edit4:setField("PHPRacial");
    obj.edit4:setName("edit4");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.scrollBox1);
    obj.comboBox2:setLeft(490);
    obj.comboBox2:setTop(92);
    obj.comboBox2:setWidth(75);
    obj.comboBox2:setField("Raca");
    obj.comboBox2:setItems({'Escolha', 'Humano', 'Elfo', 'Elfo Negro', 'Anão', 'Orc', 'Kamael', 'Thiefling' });
    obj.comboBox2:setName("comboBox2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(175);
    obj.button3:setTop(288);
    obj.button3:setWidth(30);
    obj.button3:setFontSize(18);
    obj.button3:setText("-");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(208);
    obj.button4:setTop(288);
    obj.button4:setWidth(30);
    obj.button4:setFontSize(18);
    obj.button4:setText("+");
    obj.button4:setName("button4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(170);
    obj.edit5:setTop(265);
    obj.edit5:setWidth(35);
    obj.edit5:setHeight(20);
    obj.edit5:setEnabled(false);
    obj.edit5:setType("number");
    obj.edit5:setField("Forca");
    obj.edit5:setName("edit5");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(208);
    obj.rectangle1:setTop(265);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setWidth(35);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(210);
    obj.label1:setTop(265);
    obj.label1:setWidth(35);
    obj.label1:setHeight(20);
    obj.label1.format = "%d";
    obj.label1:setField("ForcaTotal");
    obj.label1:setName("label1");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(175);
    obj.button5:setTop(350);
    obj.button5:setWidth(30);
    obj.button5:setFontSize(18);
    obj.button5:setText("-");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox1);
    obj.button6:setLeft(208);
    obj.button6:setTop(350);
    obj.button6:setWidth(30);
    obj.button6:setFontSize(18);
    obj.button6:setText("+");
    obj.button6:setName("button6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(170);
    obj.edit6:setTop(327);
    obj.edit6:setWidth(35);
    obj.edit6:setHeight(20);
    obj.edit6:setEnabled(false);
    obj.edit6:setType("number");
    obj.edit6:setField("Inteligencia");
    obj.edit6:setName("edit6");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(208);
    obj.rectangle2:setTop(327);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setWidth(35);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setLeft(210);
    obj.label2:setTop(327);
    obj.label2:setWidth(35);
    obj.label2:setHeight(20);
    obj.label2.format = "%d";
    obj.label2:setField("InteligenciaTotal");
    obj.label2:setName("label2");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox1);
    obj.button7:setLeft(175);
    obj.button7:setTop(411);
    obj.button7:setWidth(30);
    obj.button7:setFontSize(18);
    obj.button7:setText("-");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox1);
    obj.button8:setLeft(208);
    obj.button8:setTop(411);
    obj.button8:setWidth(30);
    obj.button8:setFontSize(18);
    obj.button8:setText("+");
    obj.button8:setName("button8");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox1);
    obj.edit7:setLeft(170);
    obj.edit7:setTop(388);
    obj.edit7:setWidth(35);
    obj.edit7:setHeight(20);
    obj.edit7:setEnabled(false);
    obj.edit7:setType("number");
    obj.edit7:setField("Destreza");
    obj.edit7:setName("edit7");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(208);
    obj.rectangle3:setTop(388);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setWidth(35);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(210);
    obj.label3:setTop(388);
    obj.label3:setWidth(35);
    obj.label3:setHeight(20);
    obj.label3.format = "%d";
    obj.label3:setField("DestrezaTotal");
    obj.label3:setName("label3");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox1);
    obj.button9:setLeft(175);
    obj.button9:setTop(472);
    obj.button9:setWidth(30);
    obj.button9:setFontSize(18);
    obj.button9:setText("-");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox1);
    obj.button10:setLeft(208);
    obj.button10:setTop(472);
    obj.button10:setWidth(30);
    obj.button10:setFontSize(18);
    obj.button10:setText("+");
    obj.button10:setName("button10");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox1);
    obj.edit8:setLeft(170);
    obj.edit8:setTop(449);
    obj.edit8:setWidth(35);
    obj.edit8:setHeight(20);
    obj.edit8:setEnabled(false);
    obj.edit8:setType("number");
    obj.edit8:setField("Agilidade");
    obj.edit8:setName("edit8");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(208);
    obj.rectangle4:setTop(449);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setWidth(35);
    obj.rectangle4:setHeight(20);
    obj.rectangle4:setName("rectangle4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox1);
    obj.label4:setLeft(210);
    obj.label4:setTop(449);
    obj.label4:setWidth(35);
    obj.label4:setHeight(20);
    obj.label4.format = "%d";
    obj.label4:setField("AgilidadeTotal");
    obj.label4:setName("label4");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox1);
    obj.button11:setLeft(175);
    obj.button11:setTop(533);
    obj.button11:setWidth(30);
    obj.button11:setFontSize(18);
    obj.button11:setText("-");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.scrollBox1);
    obj.button12:setLeft(208);
    obj.button12:setTop(533);
    obj.button12:setWidth(30);
    obj.button12:setFontSize(18);
    obj.button12:setText("+");
    obj.button12:setName("button12");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox1);
    obj.edit9:setLeft(170);
    obj.edit9:setTop(510);
    obj.edit9:setWidth(35);
    obj.edit9:setHeight(20);
    obj.edit9:setEnabled(false);
    obj.edit9:setType("number");
    obj.edit9:setField("Vitalidade");
    obj.edit9:setName("edit9");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(208);
    obj.rectangle5:setTop(510);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setWidth(35);
    obj.rectangle5:setHeight(20);
    obj.rectangle5:setName("rectangle5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.scrollBox1);
    obj.label5:setLeft(210);
    obj.label5:setTop(510);
    obj.label5:setWidth(35);
    obj.label5:setHeight(20);
    obj.label5.format = "%d";
    obj.label5:setField("VitalidadeTotal");
    obj.label5:setName("label5");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox1);
    obj.rectangle6:setLeft(480);
    obj.rectangle6:setTop(265);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setWidth(100);
    obj.rectangle6:setHeight(20);
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.scrollBox1);
    obj.label6:setLeft(482);
    obj.label6:setTop(265);
    obj.label6:setWidth(100);
    obj.label6:setHeight(20);
    obj.label6.format = "%d";
    obj.label6:setField("PA");
    obj.label6:setName("label6");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox1);
    obj.rectangle7:setLeft(480);
    obj.rectangle7:setTop(327);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setWidth(100);
    obj.rectangle7:setHeight(20);
    obj.rectangle7:setName("rectangle7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.scrollBox1);
    obj.label7:setLeft(482);
    obj.label7:setTop(327);
    obj.label7:setWidth(100);
    obj.label7:setHeight(20);
    obj.label7.format = "%d";
    obj.label7:setField("PM");
    obj.label7:setName("label7");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.scrollBox1);
    obj.rectangle8:setLeft(480);
    obj.rectangle8:setTop(388);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setWidth(100);
    obj.rectangle8:setHeight(20);
    obj.rectangle8:setName("rectangle8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.scrollBox1);
    obj.label8:setLeft(482);
    obj.label8:setTop(388);
    obj.label8:setWidth(100);
    obj.label8:setHeight(20);
    obj.label8.format = "%d";
    obj.label8:setField("PF");
    obj.label8:setName("label8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.scrollBox1);
    obj.rectangle9:setLeft(480);
    obj.rectangle9:setTop(449);
    obj.rectangle9:setColor("black ");
    obj.rectangle9:setWidth(30);
    obj.rectangle9:setHeight(20);
    obj.rectangle9:setName("rectangle9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.scrollBox1);
    obj.label9:setLeft(482);
    obj.label9:setTop(449);
    obj.label9:setWidth(40);
    obj.label9:setHeight(20);
    obj.label9.format = "%d";
    obj.label9:setField("Defesa");
    obj.label9:setName("label9");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox1);
    obj.rectangle10:setLeft(480);
    obj.rectangle10:setTop(510);
    obj.rectangle10:setColor("black ");
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setHeight(20);
    obj.rectangle10:setName("rectangle10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.scrollBox1);
    obj.label10:setLeft(482);
    obj.label10:setTop(510);
    obj.label10:setWidth(40);
    obj.label10:setHeight(20);
    obj.label10.format = "%d";
    obj.label10:setField("Resistencia");
    obj.label10:setName("label10");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.scrollBox1);
    obj.rectangle11:setLeft(545);
    obj.rectangle11:setTop(449);
    obj.rectangle11:setColor("Navy ");
    obj.rectangle11:setWidth(30);
    obj.rectangle11:setHeight(20);
    obj.rectangle11:setName("rectangle11");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.scrollBox1);
    obj.label11:setLeft(547);
    obj.label11:setTop(449);
    obj.label11:setWidth(40);
    obj.label11:setHeight(20);
    obj.label11:setField("DEFRED");
    obj.label11:setName("label11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.scrollBox1);
    obj.rectangle12:setLeft(545);
    obj.rectangle12:setTop(510);
    obj.rectangle12:setColor("Navy ");
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setHeight(20);
    obj.rectangle12:setName("rectangle12");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.scrollBox1);
    obj.label12:setLeft(547);
    obj.label12:setTop(510);
    obj.label12:setWidth(40);
    obj.label12:setHeight(20);
    obj.label12:setField("RESRED");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.scrollBox1);
    obj.label13:setLeft(490);
    obj.label13:setTop(470);
    obj.label13:setWidth(70);
    obj.label13:setHeight(20);
    obj.label13:setScale(1.5);
    obj.label13:setFontColor("Navy  ");
    obj.label13:setText("Redução");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.scrollBox1);
    obj.label14:setLeft(490);
    obj.label14:setTop(530);
    obj.label14:setWidth(70);
    obj.label14:setHeight(20);
    obj.label14:setScale(1.5);
    obj.label14:setFontColor("Navy  ");
    obj.label14:setText("Redução");
    obj.label14:setName("label14");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox1);
    obj.image4:setLeft(290);
    obj.image4:setTop(650);
    obj.image4:setWidth(60);
    obj.image4:setHeight(60);
    obj.image4:setVisible(false);
    obj.image4:setSRC("/imagens/info.png");
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox1);
    obj.image5:setLeft(190);
    obj.image5:setTop(580);
    obj.image5:setWidth(250);
    obj.image5:setHeight(250);
    obj.image5:setVisible(false);
    obj.image5:setSRC("/imagens/TAGS/StatusAtt.png");
    obj.image5:setName("image5");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox1);
    obj.button13:setLeft(290);
    obj.button13:setTop(650);
    obj.button13:setWidth(60);
    obj.button13:setOpacity(0.1);
    obj.button13:setHeight(60);
    obj.button13:setVisible(false);
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.scrollBox1);
    obj.button14:setLeft(80);
    obj.button14:setTop(603);
    obj.button14:setWidth(38);
    obj.button14:setOpacity(0.1);
    obj.button14:setHeight(32);
    obj.button14:setVisible(false);
    obj.button14:setName("button14");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.scrollBox1);
    obj.progressBar1:setLeft(125);
    obj.progressBar1:setTop(603);
    obj.progressBar1:setColor("red");
    obj.progressBar1:setWidth(130);
    obj.progressBar1:setPosition(100);
    obj.progressBar1:setMax(100);
    obj.progressBar1:setHeight(30);
    obj.progressBar1:setName("progressBar1");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.progressBar1);
    obj.label15:setLeft(-30);
    obj.label15:setFontSize(18);
    obj.label15:setTop(2);
    obj.label15:setAutoSize(true);
    obj.label15:setFontColor("white");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setHeight(30);
    obj.label15.format = "%d";
    obj.label15:setField("HPTotal");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.progressBar1);
    obj.label16:setAlign("client");
    obj.label16:setFontSize(18);
    obj.label16:setTop(2);
    obj.label16:setAutoSize(true);
    obj.label16:setFontColor("white");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setHeight(30);
    obj.label16:setText("/");
    obj.label16:setName("label16");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.scrollBox1);
    obj.button15:setLeft(80);
    obj.button15:setTop(637);
    obj.button15:setWidth(38);
    obj.button15:setOpacity(0.1);
    obj.button15:setHeight(32);
    obj.button15:setVisible(false);
    obj.button15:setName("button15");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.scrollBox1);
    obj.progressBar2:setLeft(148);
    obj.progressBar2:setTop(640);
    obj.progressBar2:setColor("blue");
    obj.progressBar2:setWidth(100);
    obj.progressBar2:setPosition(100);
    obj.progressBar2:setMax(100);
    obj.progressBar2:setHeight(30);
    obj.progressBar2:setName("progressBar2");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.scrollBox1);
    obj.label17:setLeft(150);
    obj.label17:setFontSize(20);
    obj.label17:setTop(640);
    obj.label17:setWidth(100);
    obj.label17:setFontColor("white");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setHeight(30);
    obj.label17.format = "%d";
    obj.label17:setField("MPTotal");
    obj.label17:setName("label17");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox1);
    obj.rectangle13:setLeft(168);
    obj.rectangle13:setTop(702);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setWidth(75);
    obj.rectangle13:setHeight(20);
    obj.rectangle13:setName("rectangle13");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.scrollBox1);
    obj.label18:setLeft(170);
    obj.label18:setTop(702);
    obj.label18:setWidth(75);
    obj.label18:setHeight(20);
    obj.label18:setField("Esquiva");
    obj.label18:setName("label18");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.scrollBox1);
    obj.rectangle14:setLeft(168);
    obj.rectangle14:setTop(732);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setWidth(75);
    obj.rectangle14:setHeight(20);
    obj.rectangle14:setName("rectangle14");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.scrollBox1);
    obj.label19:setLeft(170);
    obj.label19:setTop(732);
    obj.label19:setWidth(75);
    obj.label19:setHeight(20);
    obj.label19.format = "%d";
    obj.label19:setField("Persistencia");
    obj.label19:setName("label19");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.scrollBox1);
    obj.rectangle15:setLeft(498);
    obj.rectangle15:setTop(610);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setWidth(75);
    obj.rectangle15:setHeight(20);
    obj.rectangle15:setName("rectangle15");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.scrollBox1);
    obj.label20:setLeft(500);
    obj.label20:setTop(610);
    obj.label20:setWidth(75);
    obj.label20:setHeight(20);
    obj.label20:setField("Acerto");
    obj.label20:setName("label20");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.scrollBox1);
    obj.rectangle16:setLeft(498);
    obj.rectangle16:setTop(640);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setWidth(75);
    obj.rectangle16:setHeight(20);
    obj.rectangle16:setName("rectangle16");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.scrollBox1);
    obj.label21:setLeft(500);
    obj.label21:setTop(640);
    obj.label21:setWidth(75);
    obj.label21:setHeight(20);
    obj.label21:setField("AcertoMagico");
    obj.label21:setName("label21");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.scrollBox1);
    obj.rectangle17:setLeft(498);
    obj.rectangle17:setTop(702);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setWidth(75);
    obj.rectangle17:setHeight(20);
    obj.rectangle17:setName("rectangle17");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.scrollBox1);
    obj.label22:setLeft(500);
    obj.label22:setTop(702);
    obj.label22:setWidth(75);
    obj.label22:setHeight(20);
    obj.label22:setField("Critical");
    obj.label22:setName("label22");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.scrollBox1);
    obj.rectangle18:setLeft(498);
    obj.rectangle18:setTop(732);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setWidth(75);
    obj.rectangle18:setHeight(20);
    obj.rectangle18:setName("rectangle18");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.scrollBox1);
    obj.label23:setLeft(500);
    obj.label23:setTop(732);
    obj.label23:setWidth(75);
    obj.label23:setHeight(20);
    obj.label23:setField("CMagico");
    obj.label23:setName("label23");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.scrollBox1);
    obj.edit10:setLeft(295);
    obj.edit10:setTop(807);
    obj.edit10:setFontColor("#00008B");
    obj.edit10:setScale(2.0);
    obj.edit10:setWidth(21);
    obj.edit10:setHeight(50);
    obj.edit10:setType("number");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setTextPrompt("0");
    obj.edit10:setCanFocus(false);
    obj.edit10:setHitTest(false);
    obj.edit10:setEnabled(true);
    obj.edit10:setMax(30);
    obj.edit10:setField("Level");
    obj.edit10:setTransparent(true);
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.scrollBox1);
    obj.edit11:setLeft(295);
    obj.edit11:setTop(700);
    obj.edit11:setFontColor("#00008B");
    obj.edit11:setScale(2.0);
    obj.edit11:setWidth(21);
    obj.edit11:setVisible(false);
    obj.edit11:setHeight(50);
    obj.edit11:setField("Elevel");
    obj.edit11:setTransparent(false);
    obj.edit11:setName("edit11");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.scrollBox1);
    obj.button16:setLeft(33);
    obj.button16:setTop(160);
    obj.button16:setWidth(60);
    obj.button16:setHeight(60);
    obj.button16:setOpacity(0.1);
    obj.button16:setName("button16");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox1);
    obj.image6:setLeft(-40);
    obj.image6:setTop(110);
    obj.image6:setWidth(200);
    obj.image6:setHeight(200);
    obj.image6:setSRC("/imagens/TAGS/TIER.png");
    obj.image6:setName("image6");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.scrollBox1);
    obj.button17:setLeft(120);
    obj.button17:setTop(160);
    obj.button17:setWidth(60);
    obj.button17:setHeight(60);
    obj.button17:setOpacity(0.1);
    obj.button17:setName("button17");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox1);
    obj.image7:setLeft(47);
    obj.image7:setTop(110);
    obj.image7:setWidth(200);
    obj.image7:setHeight(200);
    obj.image7:setSRC("/imagens/TAGS/SKILL.png");
    obj.image7:setName("image7");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.scrollBox1);
    obj.button18:setLeft(460);
    obj.button18:setTop(160);
    obj.button18:setWidth(60);
    obj.button18:setHeight(60);
    obj.button18:setOpacity(0.1);
    obj.button18:setName("button18");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.scrollBox1);
    obj.image8:setLeft(390);
    obj.image8:setTop(110);
    obj.image8:setWidth(200);
    obj.image8:setHeight(200);
    obj.image8:setSRC("/imagens/TAGS/HISTORIA.png");
    obj.image8:setName("image8");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.scrollBox1);
    obj.button19:setLeft(287);
    obj.button19:setTop(290);
    obj.button19:setWidth(60);
    obj.button19:setHeight(60);
    obj.button19:setOpacity(0.1);
    obj.button19:setName("button19");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.scrollBox1);
    obj.image9:setLeft(216);
    obj.image9:setTop(243);
    obj.image9:setWidth(200);
    obj.image9:setHeight(200);
    obj.image9:setSRC("/imagens/TAGS/SUMMON.png");
    obj.image9:setName("image9");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.scrollBox1);
    obj.button20:setLeft(542);
    obj.button20:setTop(160);
    obj.button20:setWidth(60);
    obj.button20:setHeight(60);
    obj.button20:setOpacity(0.1);
    obj.button20:setName("button20");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.scrollBox1);
    obj.image10:setLeft(467);
    obj.image10:setTop(110);
    obj.image10:setWidth(200);
    obj.image10:setHeight(200);
    obj.image10:setSRC("/imagens/TAGS/Sobre.png");
    obj.image10:setName("image10");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.scrollBox1);
    obj.button21:setLeft(290);
    obj.button21:setTop(160);
    obj.button21:setWidth(60);
    obj.button21:setHeight(55);
    obj.button21:setOpacity(0.1);
    obj.button21:setName("button21");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.scrollBox1);
    obj.image11:setLeft(290);
    obj.image11:setTop(160);
    obj.image11:setWidth(60);
    obj.image11:setHeight(60);
    obj.image11:setSRC("/imagens/TAGS/ActionBar.png");
    obj.image11:setName("image11");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.scrollBox1);
    obj.dataLink2:setFields({'Forca', 'Inteligencia', 'Destreza', 'Agilidade', 'Vitalidade', 'FNivel', 'FNivel', 'INivel', 'DNivel', 'ANivel', 'VNivel', 'DForca', 'DInteligencia', 'DDestreza', 'DAgilidade', 'DVitalidade', 'ConForte', 'ConInteligente','ConHabilidoso', 'ConAgil', 'ConResistente'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.scrollBox1);
    obj.dataLink3:setFields({'ForcaTotal', 'InteligenciaTotal', 'DestrezaTotal', 'AgilidadeTotal', 'VitalidadeTotal', 'FNivel', 'FNivel', 'INivel', 'DNivel', 'ANivel', 'VNivel', 'DForca', 'DInteligencia', 'DDestreza',
						'DAgilidade', 'DVitalidade', 'ArmaPA', 'ArmaDEF', 'ArmaPM', 'ArmaRES', 'ArmaPF', 'ArmaduraPA', 'ArmaduraPF', 'ArmaduraPM', 'ArmaduraRES', 'ArmaduraDEF', 'OutraPA', 'OutraPF', 'OutraPM', 'OutraRES', 'OutraDEF',
						'OutraRegenMP', 'OutraDebuffShield', 'AcessorioPA', 'AcessorioPF', 'AcessorioPM', 'AcessorioRES', 'AcessorioDEF', 'PABasica', 'PMBasica', 'PFBasica', 'RESBasica', 'DEFBasica', 'PARacial', 'PMRacial', 'PFRacial', 'DEFRacial', 'RESRacial',
						'ConBoaMira', 'ConMestreMagico', 'ConCriticalMagico', 'ConEstrategista', 'ConEvasivo', 'ConPersistente'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.scrollBox1);
    obj.dataLink4:setFields({'ForcaTotal', 'InteligenciaTotal', 'DestrezaTotal', 'AgilidadeTotal', 'VitalidadeTotal', 'FNivel', 'FNivel', 'INivel', 'DNivel', 'ANivel', 'VNivel', 'DForca', 'DInteligencia', 'DDestreza',
						'DAgilidade', 'DVitalidade', 'ArmaPA', 'ArmaDEF', 'ArmaPM', 'ArmaRES', 'ArmaPF', 'ArmaduraPA', 'ArmaduraPF', 'ArmaduraPM', 'ArmaduraRES', 'ArmaduraDEF', 'OutraPA', 'OutraPF', 'OutraPM', 'OutraRES', 'OutraDEF', 'MontPA', 'MontPM', 'MontPF', 'MontNome',
						'AcessorioPA', 'AcessorioPF', 'AcessorioPM', 'AcessorioRES', 'AcessorioDEF', 'PABasica', 'PMBasica', 'PFBasica', 'RESBasica', 'DEFBasica', 'PARacial', 'PMRacial', 'PFRacial', 'DEFRacial', 'RESRacial', 'Classe', 'ORCRacial'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.scrollBox1);
    obj.dataLink5:setFields({'Defesa', 'Resistencia', 'Vitalidade', 'Agilidade', 'VitalidadeTotal', 'AgilidadeTotal', 'ArmaduraDEF', 'ArmaDEF', 'OutraDEF', 'AcessorioDEF', 'DEFBasica', 'Level', 'ArmaRES', 'ArmaduraRES', 'OutraRES', 'AcessorioRES'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.scrollBox1);
    obj.dataLink6:setFields({'Raca', 'Classe', 'Espec', 'Level'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.scrollBox1);
    obj.dataLink7:setFields({'VitalidadeTotal', 'ArmaHP', 'OutraHP', 'ArmaduraHP', 'AcessorioHP', 'PHPBasica', 'PHPRacial', 'Classe', 'Espec', 'RACA', 'Level'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.scrollBox1);
    obj.dataLink8:setFields({'InteligenciaTotal', 'ArmaMP', 'OutraMP', 'ArmaduraMP', 'AcessorioMP', 'PMPBasica', 'PMPRacial', 'Classe', 'Espec', 'Level', 'DMP', 'MPMont', 'ConEscolhidoBlume'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.scrollBox1);
    obj.dataLink9:setFields({'ClasseCR', 'DestrezaTotal', 'AgilidadeTotal', 'ClasseAM', 'AcertoBasica', 'AcertoRacial', 'ESQBasica', 'EspecAM', 'EspecCR', 'ClasseCM', 'EspecCM', 'ClasseEsquiva', 'EspecEsquiva',
						'ClassePer', 'EspecPer', 'ESQRacial', 'CritBasica', 'CritRacial', 'AMRacial', 'AMBasica', 'CMBasica', 'CMRacial', 'PersistBasica', 'PersistRacial', 'VitalidadeTotal', 
						'ForcaTotal', 'Level', 'ClasseAcerto', 'EspecAcerto', 'Classe', 'Espec', 'Raca'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.scrollBox1);
    obj.dataLink10:setFields({'Classe', 'Espec', 'Level'});
    obj.dataLink10:setName("dataLink10");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.scrollBox1);
    obj.button22:setLeft(388);
    obj.button22:setTop(255);
    obj.button22:setWidth(60);
    obj.button22:setHeight(55);
    obj.button22:setOpacity(0.1);
    obj.button22:setName("button22");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.scrollBox1);
    obj.image12:setLeft(317);
    obj.image12:setTop(205);
    obj.image12:setWidth(200);
    obj.image12:setHeight(200);
    obj.image12:setSRC("/imagens/TAGS/PA.png");
    obj.image12:setName("image12");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.scrollBox1);
    obj.button23:setLeft(388);
    obj.button23:setTop(317);
    obj.button23:setWidth(60);
    obj.button23:setHeight(55);
    obj.button23:setOpacity(0.1);
    obj.button23:setName("button23");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.scrollBox1);
    obj.image13:setLeft(317);
    obj.image13:setTop(267);
    obj.image13:setWidth(200);
    obj.image13:setHeight(200);
    obj.image13:setSRC("/imagens/TAGS/PM.png");
    obj.image13:setName("image13");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.scrollBox1);
    obj.button24:setLeft(388);
    obj.button24:setTop(377);
    obj.button24:setWidth(60);
    obj.button24:setHeight(55);
    obj.button24:setOpacity(0.1);
    obj.button24:setName("button24");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.scrollBox1);
    obj.image14:setLeft(317);
    obj.image14:setTop(327);
    obj.image14:setWidth(200);
    obj.image14:setHeight(200);
    obj.image14:setSRC("/imagens/TAGS/PF.png");
    obj.image14:setName("image14");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.scrollBox1);
    obj.button25:setLeft(388);
    obj.button25:setTop(435);
    obj.button25:setWidth(60);
    obj.button25:setHeight(55);
    obj.button25:setOpacity(0.1);
    obj.button25:setName("button25");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.scrollBox1);
    obj.image15:setLeft(317);
    obj.image15:setTop(385);
    obj.image15:setWidth(200);
    obj.image15:setHeight(200);
    obj.image15:setSRC("/imagens/TAGS/DEF.png");
    obj.image15:setName("image15");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.scrollBox1);
    obj.button26:setLeft(388);
    obj.button26:setTop(493);
    obj.button26:setWidth(60);
    obj.button26:setHeight(55);
    obj.button26:setOpacity(0.1);
    obj.button26:setName("button26");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.scrollBox1);
    obj.image16:setLeft(317);
    obj.image16:setTop(443);
    obj.image16:setWidth(200);
    obj.image16:setHeight(200);
    obj.image16:setSRC("/imagens/TAGS/RES.png");
    obj.image16:setName("image16");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.scrollBox1);
    obj.comboBox3:setLeft(273);
    obj.comboBox3:setTop(355);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setField("EscolheAtaqueBasico");
    obj.comboBox3:setFontColor("#00FFFF");
    obj.comboBox3:setItems({'PA', 'PF'});
    obj.comboBox3:setName("comboBox3");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.scrollBox1);
    obj.button27:setLeft(273);
    obj.button27:setTop(380);
    obj.button27:setWidth(90);
    obj.button27:setHeight(30);
    obj.button27:setFontSize(12);
    obj.button27:setFontColor("#00FFFF");
    obj.button27:setText("Ataque Basico");
    obj.button27:setName("button27");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.scrollBox1);
    obj.edit12:setLeft(270);
    obj.edit12:setTop(670);
    obj.edit12:setWidth(90);
    obj.edit12:setType("number");
    obj.edit12:setHeight(30);
    obj.edit12:setVisible(false);
    obj.edit12:setField("ClasseAcerto");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.scrollBox1);
    obj.edit13:setLeft(270);
    obj.edit13:setTop(720);
    obj.edit13:setWidth(90);
    obj.edit13:setType("number");
    obj.edit13:setHeight(30);
    obj.edit13:setVisible(false);
    obj.edit13:setField("DestrezaAcerto");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.scrollBox1);
    obj.edit14:setLeft(270);
    obj.edit14:setTop(770);
    obj.edit14:setWidth(90);
    obj.edit14:setType("number");
    obj.edit14:setHeight(30);
    obj.edit14:setVisible(false);
    obj.edit14:setField("EspecAcerto");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.scrollBox1);
    obj.edit15:setLeft(270);
    obj.edit15:setTop(670);
    obj.edit15:setWidth(90);
    obj.edit15:setType("number");
    obj.edit15:setHeight(30);
    obj.edit15:setVisible(false);
    obj.edit15:setField("ClasseAM");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.scrollBox1);
    obj.edit16:setLeft(270);
    obj.edit16:setTop(770);
    obj.edit16:setWidth(90);
    obj.edit16:setType("number");
    obj.edit16:setHeight(30);
    obj.edit16:setVisible(false);
    obj.edit16:setField("EspecAM");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.scrollBox1);
    obj.edit17:setLeft(270);
    obj.edit17:setTop(670);
    obj.edit17:setWidth(90);
    obj.edit17:setType("number");
    obj.edit17:setHeight(30);
    obj.edit17:setVisible(false);
    obj.edit17:setField("ClasseCR");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.scrollBox1);
    obj.edit18:setLeft(270);
    obj.edit18:setTop(770);
    obj.edit18:setWidth(90);
    obj.edit18:setType("number");
    obj.edit18:setHeight(30);
    obj.edit18:setVisible(false);
    obj.edit18:setField("EspecCR");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.scrollBox1);
    obj.edit19:setLeft(270);
    obj.edit19:setTop(670);
    obj.edit19:setWidth(90);
    obj.edit19:setType("number");
    obj.edit19:setHeight(30);
    obj.edit19:setVisible(false);
    obj.edit19:setField("ClasseCM");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.scrollBox1);
    obj.edit20:setLeft(270);
    obj.edit20:setTop(770);
    obj.edit20:setWidth(90);
    obj.edit20:setType("number");
    obj.edit20:setHeight(30);
    obj.edit20:setVisible(false);
    obj.edit20:setField("EspecCM");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.scrollBox1);
    obj.edit21:setLeft(270);
    obj.edit21:setTop(670);
    obj.edit21:setWidth(90);
    obj.edit21:setType("number");
    obj.edit21:setHeight(30);
    obj.edit21:setVisible(false);
    obj.edit21:setField("ClasseEsquiva");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.scrollBox1);
    obj.edit22:setLeft(270);
    obj.edit22:setTop(770);
    obj.edit22:setWidth(90);
    obj.edit22:setType("number");
    obj.edit22:setHeight(30);
    obj.edit22:setVisible(false);
    obj.edit22:setField("EspecEsquiva");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.scrollBox1);
    obj.edit23:setLeft(270);
    obj.edit23:setTop(670);
    obj.edit23:setWidth(90);
    obj.edit23:setType("number");
    obj.edit23:setHeight(30);
    obj.edit23:setVisible(false);
    obj.edit23:setField("ClassePer");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.scrollBox1);
    obj.edit24:setLeft(270);
    obj.edit24:setTop(770);
    obj.edit24:setWidth(90);
    obj.edit24:setType("number");
    obj.edit24:setHeight(30);
    obj.edit24:setVisible(false);
    obj.edit24:setField("EspecPer");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.scrollBox1);
    obj.edit25:setLeft(270);
    obj.edit25:setTop(770);
    obj.edit25:setWidth(90);
    obj.edit25:setType("number");
    obj.edit25:setHeight(30);
    obj.edit25:setVisible(false);
    obj.edit25:setField("AgilidadeESQ");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.scrollBox1);
    obj.edit26:setLeft(270);
    obj.edit26:setTop(770);
    obj.edit26:setWidth(90);
    obj.edit26:setType("number");
    obj.edit26:setHeight(30);
    obj.edit26:setVisible(false);
    obj.edit26:setField("ForcaPer");
    obj.edit26:setName("edit26");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.scrollBox1);
    obj.button28:setLeft(600);
    obj.button28:setTop(900);
    obj.button28:setWidth(20);
    obj.button28:setHeight(20);
    obj.button28:setOpacity(0.0);
    obj.button28:setName("button28");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.scrollBox1);
    obj.edit27:setTop(440);
    obj.edit27:setLeft(292);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(30);
    obj.edit27:setMax(160);
    obj.edit27:setMin(0);
    obj.edit27:setHitTest(false);
    obj.edit27:setCanFocus(false);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setText("120");
    obj.edit27:setTransparent(true);
    obj.edit27:setFontColor("black");
    obj.edit27:setFontSize(22);
    obj.edit27:setEnabled(true);
    obj.edit27:setField("ControladorAtributos");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.scrollBox1);
    obj.edit28:setTop(530);
    obj.edit28:setLeft(292);
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(30);
    obj.edit28:setMax(160);
    obj.edit28:setMin(0);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setText("120");
    obj.edit28:setVisible(false);
    obj.edit28:setFontColor("RED");
    obj.edit28:setFontSize(22);
    obj.edit28:setEnabled(true);
    obj.edit28:setField("LiberarRolagemUp");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.scrollBox1);
    obj.edit29:setTop(850);
    obj.edit29:setLeft(400);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(30);
    obj.edit29:setMax(20);
    obj.edit29:setMin(0);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setVisible(false);
    obj.edit29:setFontSize(22);
    obj.edit29:setEnabled(true);
    obj.edit29:setField("CLevel");
    obj.edit29:setName("edit29");

    obj.btnUpaLevel = GUI.fromHandle(_obj_newObject("button"));
    obj.btnUpaLevel:setParent(obj.scrollBox1);
    obj.btnUpaLevel:setName("btnUpaLevel");
    obj.btnUpaLevel:setLeft(273);
    obj.btnUpaLevel:setTop(480);
    obj.btnUpaLevel:setWidth(90);
    obj.btnUpaLevel:setHeight(25);
    obj.btnUpaLevel:setFontColor("#FFD700");
    obj.btnUpaLevel:setFontSize(15);
    obj.btnUpaLevel:setText("Level UP");

    obj.BarraXP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.BarraXP:setParent(obj.scrollBox1);
    obj.BarraXP:setName("BarraXP");
    obj.BarraXP:setWidth(100);
    obj.BarraXP:setHeight(20);
    obj.BarraXP:setColor("purple");
    obj.BarraXP:setTop(675);
    obj.BarraXP:setLeft(150);
    obj.BarraXP:setPosition(50);
    obj.BarraXP:setMax(100);

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.scrollBox1);
    obj.edit30:setWidth(35);
    obj.edit30:setHeight(20);
    obj.edit30:setTop(675);
    obj.edit30:setLeft(157);
    obj.edit30:setType("number");
    obj.edit30:setMax(9999);
    obj.edit30:setTransparent(true);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setField("XPAtual");
    obj.edit30:setName("edit30");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.scrollBox1);
    obj.label24:setWidth(35);
    obj.label24:setHeight(20);
    obj.label24:setTop(675);
    obj.label24:setLeft(205);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setFontColor("black");
    obj.label24:setField("XPNecessario");
    obj.label24:setName("label24");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.scrollBox1);
    obj.dataLink11:setFields({'XPAtual', 'Level'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.scrollBox1);
    obj.dataLink12:setFields({'XPAtual', 'XPNecessario'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.scrollBox1);
    obj.dataLink13:setField("Nome");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.scrollBox1);
    obj.dataLink14:setFields({'PA', 'PM', 'PF', 'DEFRED', 'RESRED', 'Acerto', 'AcertoMagico', 'Esquiva', 'Persistencia', 'Critical', 'CMagico', 'Classe', 'Espec'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.scrollBox1);
    obj.dataLink15:setFields({'HPTotal', 'MPTotal'});
    obj.dataLink15:setName("dataLink15");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            sheet.Classe = sheet.Classe or "Animago";
            		sheet.Espec = sheet.Espec or "Escolha";
            		sheet.Raca = sheet.Raca or "Humano";
            		sheet.LiberarRolagemUp = tonumber(sheet.LiberarRolagemUp or 0);
            		
            		if sheet.Level == nil then
            			sheet.Level = 0; 
            		end;
            		
            		if sheet.Velis == nil then
            			sheet.Velis = "D10+10"; 		
            		end;
            		
            		if sheet.Nome == nil then
            			sheet.Nome = "Escolha o Nome";
            		end;	
            
            		if sheet.sloot == nil then
            			sheet.sloot = 4;
            		end;
            		
            		if sheet.Forca == nil then
            			sheet.Forca = 0; 		
            		end;
            		
            		if sheet.Inteligencia == nil then
            			sheet.Inteligencia = 0;
            		end;	
            
            		if sheet.Destreza == nil then
            			sheet.Destreza = 0;
            		end;
            		
            		if sheet.Agilidade == nil then
            			sheet.Agilidade = 0; 		
            		end;
            		
            		if sheet.Vitalidade == nil then
            			sheet.Vitalidade = 0;
            		end;	
            		
            		sheet.ELevel = (tonumber(sheet.Elevel) or 0); 
            		sheet.PontoSkill = (tonumber(sheet.PontoSkill) or 1); 
            		sheet.PontosUlt = (tonumber(sheet.PontosUlt) or 0); 
            		sheet.ForcaTotal = (tonumber(sheet.ForcaTotal) or 0); 
            		sheet.Acerto = (tonumber(sheet.Acerto) or 0); 
            		sheet.AcertoMagico	= (tonumber(sheet.AcertoMagico) or 0); 
            		sheet.Critical = (tonumber(sheet.Critical) or 0); 
            		sheet.CMagico = (tonumber(sheet.CMagico) or 0); 
            		sheet.Esquiva = (tonumber(sheet.Esquiva) or 0); 
            		sheet.Persistencia = (tonumber(sheet.Persistencia) or 0); 
            		sheet.ArmaPA = (tonumber(sheet.ArmaPA) or 0); 
            		sheet.ArmaPM = (tonumber(sheet.ArmaPM) or 0); 
            		sheet.ArmaPF = (tonumber(sheet.ArmaPF) or 0); 
            		sheet.ArmaDEF = (tonumber(sheet.ArmaDEF) or 0); 
            		sheet.ArmaRES = (tonumber(sheet.ArmaRES) or 0); 
            		sheet.ArmaHP = (tonumber(sheet.ArmaHP) or 0); 
            		sheet.ArmaMP = (tonumber(sheet.ArmaMP) or 0); 
            		sheet.OutraPA = (tonumber(sheet.OutraPA) or 0); 
            		sheet.OutraPM = (tonumber(sheet.OutraPM) or 0); 
            		sheet.OutraPF = (tonumber(sheet.OutraPF) or 0); 
            		sheet.OutraDEF = (tonumber(sheet.OutraDEF) or 0); 
            		sheet.OutraRES = (tonumber(sheet.OutraRES) or 0); 
            		sheet.OutraHP = (tonumber(sheet.OutraHP) or 0); 
            		sheet.OutraMP = (tonumber(sheet.OutraMP) or 0); 
            		sheet.ArmaduraPA = (tonumber(sheet.ArmaduraPA) or 0); 
            		sheet.ArmaduraPM = (tonumber(sheet.ArmaduraPM) or 0); 
            		sheet.ArmaduraPF = (tonumber(sheet.ArmaduraPF) or 0); 
            		sheet.ArmaduraDEF = (tonumber(sheet.ArmaduraDEF) or 0); 
            		sheet.ArmaduraRES = (tonumber(sheet.ArmaduraRES) or 0); 
            		sheet.ArmaduraHP = (tonumber(sheet.ArmaduraHP) or 0); 
            		sheet.ArmaduraMP = (tonumber(sheet.ArmaduraMP) or 0); 
            		sheet.AcessorioPA = (tonumber(sheet.AcessorioPA) or 0); 
            		sheet.AcessorioPM = (tonumber(sheet.AcessorioPM) or 0); 
            		sheet.AcessorioPF = (tonumber(sheet.AcessorioPF) or 0); 
            		sheet.AcessorioDEF = (tonumber(sheet.AcessorioDEF) or 0); 
            		sheet.AcessorioRES = (tonumber(sheet.AcessorioRES) or 0); 
            		sheet.AcessorioHP = (tonumber(sheet.AcessorioHP) or 0); 
            		sheet.AcessorioMP = (tonumber(sheet.AcessorioMP) or 0); 
            		sheet.AcessorioRegenMP = (tonumber(sheet.AcessorioRegenMP) or 0); 
            		sheet.ArmaDistancia = (tonumber(sheet.ArmaDistancia) or 0); 
            		sheet.OutraDistancia = (tonumber(sheet.OutraDistancia) or 0); 
            		sheet.ArmaduraDistancia = (tonumber(sheet.ArmaduraDistancia) or 0); 
            		sheet.AcessorioDistancia = (tonumber(sheet.AcessorioDistancia) or 0); 
            		sheet.Sabedoria = (tonumber(sheet.Sabedoria) or 0); 
            		sheet.Atletismo = (tonumber(sheet.Atletismo) or 0); 
            		sheet.Acrobacia = (tonumber(sheet.Acrobacia) or 0); 
            		sheet.Vigor = (tonumber(sheet.Vigor) or 0); 
            		sheet.Percepcao = (tonumber(sheet.Percepcao) or 0); 
            		sheet.Deslocamento = (tonumber(sheet.Deslocamento) or 0); 
            		sheet.Distancia = (tonumber(sheet.Distancia) or 0); 
            		sheet.Potes = (tonumber(sheet.Potes) or 0); 
            		sheet.MontAtletismo = (tonumber(sheet.MontAtletismo) or 0); 
            		sheet.MontAcrobacia = (tonumber(sheet.MontAcrobacia) or 0); 
            		sheet.MontSabedoria = (tonumber(sheet.MontSabedoria) or 0); 
            		sheet.Montpercepcao = (tonumber(sheet.MontPercepcao) or 0); 
            		sheet.MontVigor = (tonumber(sheet.MontVigor) or 0); 
            		sheet.MPMont = (tonumber(sheet.MPMont) or 0); 
            		sheet.MontESPACO = (tonumber(sheet.MontESPACO) or 0); 
            		sheet.idade = sheet.idade or "Depende da sua Raça"; 
            		sheet.HPTotal = (tonumber(sheet.HPTotal) or 0); 
            		sheet.MPTotal = (tonumber(sheet.MPTotal) or 0); 		
            		sheet.DanoHabilidade1 = (tonumber(sheet.DanoHabilidade1) or 0); 
            		sheet.CuraHabilidade1 = (tonumber(sheet.CuraHabilidade1) or 0); 
            		sheet.Current = (tonumber(sheet.Current) or 0); 
            		sheet.DPTHabilidade1 = (tonumber(sheet.DPTHabilidade1) or 0); 
            		sheet.Hintensidade1 = (tonumber(sheet.Hintensidade1) or 0); 		
            		sheet.NomeBasica = (tonumber(sheet.NomeBasica) or 0); 	
            		sheet.BasicaDescri = (sheet.BasicaDescri) or "Adicione suas Habilidades Basicas";
            		sheet.DanoBasica = (tonumber(sheet.DanoBasica) or 0); 	
            		sheet.CustoBasica = (tonumber(sheet.CustoBasica) or 0); 	
            		sheet.DTBasica = (tonumber(sheet.DTBasica) or 0); 
            		sheet.PABasica = (tonumber(sheet.PABasica) or 0); 
            		sheet.PMBasica = (tonumber(sheet.PMBasica) or 0); 	
            		sheet.PFBasica = (tonumber(sheet.PFBasica) or 0); 	
            		sheet.DEFBasica = (tonumber(sheet.DEFBasica) or 0); 	
            		sheet.RESBasica = (tonumber(sheet.RESBasica) or 0); 
            		sheet.AcertoBasica = (tonumber(sheet.AcertoBasica) or 0); 	
            		sheet.AMBasica = (tonumber(sheet.AMBasica) or 0); 	
            		sheet.ESQBasica = (tonumber(sheet.ESQBasica) or 0); 
            		sheet.CritBasica = (tonumber(sheet.CritBasica) or 0); 	
            		sheet.CMBasica = (tonumber(sheet.CMBasica) or 0); 	
            		sheet.PersistBasica = (tonumber(sheet.PersistBasica) or 0); 	
            		sheet.PHPBasica = (tonumber(sheet.PHPBasica) or 0); 	
            		sheet.PMPBasica = (tonumber(sheet.PMPBasica) or 0); 		
            		sheet.NomeRacial = (tonumber(sheet.NomeRacial) or 0); 	
            		sheet.RacialDescri = (tonumber(sheet.RacialDescri) or 0);
            		sheet.DanoRacial = (tonumber(sheet.DanoRacial) or 0); 	
            		sheet.CustoRacial = (tonumber(sheet.CustoRacial) or 0); 	
            		sheet.DTRacial = (tonumber(sheet.DTRacial) or 0); 
            		sheet.PARacial = (tonumber(sheet.PARacial) or 0); 
            		sheet.PMRacial = (tonumber(sheet.PMRacial) or 0); 	
            		sheet.PFRacial = (tonumber(sheet.PFRacial) or 0); 	
            		sheet.DEFRacial = (tonumber(sheet.DEFRacial) or 0); 	
            		sheet.RESRacial = (tonumber(sheet.RESRacial) or 0); 
            		sheet.AcertoRacial = (tonumber(sheet.AcertoRacial) or 0); 	
            		sheet.AMRacial = (tonumber(sheet.AMRacial) or 0); 	
            		sheet.ESQRacial = (tonumber(sheet.ESQRacial) or 0); 
            		sheet.CritRacial = (tonumber(sheet.CritRacial) or 0); 	
            		sheet.CMRacial = (tonumber(sheet.CMRacial) or 0); 	
            		sheet.PersistRacial = (tonumber(sheet.PersistRacial) or 0); 	
            		sheet.PHPRacial = (tonumber(sheet.PHPRacial) or 0); 	
            		sheet.PMPRacial = (tonumber(sheet.PMPRacial) or 0); 		
            		sheet.R30HPNivel = (tonumber(sheet.R30HPNivel) or 0); 	
            		sheet.MHPNivel = (tonumber(sheet.MHPNivel) or 0); 
            		sheet.MMPNivel = (tonumber(sheet.MMPNivel) or 0); 		
            		sheet.HPRACAATE40 = (tonumber(sheet.HPRACAATE40) or 0);		
            		sheet.DForca = (tonumber(sheet.DForca) or 0); 	
            		sheet.DAgilidade = (tonumber(sheet.DAgilidade) or 0); 
            		sheet.DInteligencia = (tonumber(sheet.DInteligencia) or 0); 
            		sheet.DVitalidade = (tonumber(sheet.DVitalidade) or 0); 	
            		sheet.DDestreza = (tonumber(sheet.DDestreza) or 0); 
            		sheet.DMP = (tonumber(sheet.DMP) or 0);
            		sheet.RHPNivel = (tonumber(sheet.RHPNivel) or 0);
            		sheet.CHPNivel = (tonumber(sheet.CHPNivel) or 0); 
            		sheet.EHPNivel = (tonumber(sheet.EHPNivel) or 0); 
            		sheet.R20HPNivel = (tonumber(sheet.R20HPNivel) or 0); 
            		sheet.RMPNivel = (tonumber(sheet.RMPNivel) or 0); 
            		sheet.EMPNivel = (tonumber(sheet.EMPNivel) or 0); 		 
            		sheet.LVDivino = (tonumber(sheet.LVDivino) or 0);
            		sheet.RegenMP = (tonumber(sheet.RegenMP) or 0); 
            		sheet.Visao = (tonumber(sheet.Visao) or 0); 
            		sheet.Deslocamento = (tonumber(sheet.Deslocamento) or 0); 
            		sheet.Correndo = (tonumber(sheet.Correndo) or 0);
            		sheet.Potes = (tonumber(sheet.Potes) or 0); 
            		sheet.Distancia = (tonumber(sheet.Distancia) or 0); 	
            		sheet.RealDeslocamento = (tonumber(sheet.RealDeslocamento) or 0); 	
            		sheet.RealVisao = (tonumber(sheet.RealVisao) or 0);
            		sheet.REGMPBasica = (tonumber(sheet.REGMPBasica) or 0);
            		sheet.VisaoBasica = (tonumber(sheet.VisaoBasica) or 0);
            		sheet.CorridaBasica = (tonumber(sheet.CorridaBasica) or 0);
            		sheet.DeslocamentoBasica = (tonumber(sheet.DeslocamentoBasica) or 0);		
            		sheet.ClasseAM = (tonumber(sheet.ClasseAM) or 0);
            		sheet.ClasseCM = (tonumber(sheet.ClasseCM) or 0);
            		sheet.ClasseCR = (tonumber(sheet.ClasseCR) or 0);
            		sheet.ClasseAcerto = (tonumber(sheet.ClasseAcerto) or 0);
            		sheet.ClasseEsquiva = (tonumber(sheet.ClasseEsquiva) or 0);
            		sheet.ClassePer = (tonumber(sheet.ClassePer) or 0);
            		sheet.AtualFlecha = (tonumber(sheet.AtualFlecha) or 0); 
            		sheet.MaxFlecha = (tonumber(sheet.MaxFlecha) or 0); 		
            		sheet.EspecAM = (tonumber(sheet.EspecAM) or 0);
            		sheet.EspecCM = (tonumber(sheet.EspecCM) or 0);
            		sheet.EspecCR = (tonumber(sheet.EspecCR) or 0);
            		sheet.MontPA = (tonumber(sheet.MontPA) or 0);
            		sheet.MontPM = (tonumber(sheet.MontPM) or 0);
            		sheet.MontPF = (tonumber(sheet.MontPF) or 0);
            		sheet.MontNome = sheet.MontPF or 'Nome da Montaria';
            		sheet.EspecAcerto = (tonumber(sheet.EspecAcerto) or 0);
            		sheet.EspecEsquiva = (tonumber(sheet.EspecEsquiva) or 0);
            		sheet.ResistenciaPadrao = (tonumber(sheet.ResistenciaPadrao) or 0)
            		sheet.EspecPer = (tonumber(sheet.EspecPer) or 0);
            		self.cmbEspecializa.enabled = false;
            		sheet.CLevel = (tonumber(sheet.CLevel) or 0);
            		sheet.ORCRacial = (tonumber(sheet.ORCRacial) or 0);
            		sheet.XPAtualDivino = tonumber(sheet.XPAtualDivino) or 0;
            		sheet.LVDivino = tonumber(sheet.LVDivino) or 0;
            		sheet.XPTotalDivino = tonumber(sheet.XPTotalDivino) or 0;
            		sheet.limitePotion = tonumber(sheet.limitePotion) or 2;		
            		sheet.OutraRegenMP = tonumber(sheet.OutraRegenMP) or 0;	
            		sheet.OutraDebuffShield = tonumber(sheet.OutraDebuffShield) or 0;			
            		sheet.ControladorAtributos = (tonumber(sheet.ControladorAtributos) or 8);
            		sheet.PontoHabilidade = tonumber(sheet.PontoHabilidade) or 1;
            		sheet.jaRecebeu = sheet.jaRecebeu or false;		
            		
            		sheet.ConAgil = tonumber(sheet.ConAgil) or 0;
            		sheet.ConBoaMira = tonumber(sheet.ConBoaMira) or 0;
            		sheet.ConCriticalMagico = tonumber(sheet.ConCriticalMagico) or 0;
            		sheet.ConEvasivo = tonumber(sheet.ConEvasivo) or 0;
            		sheet.ConEstrategista = tonumber(sheet.ConEstrategista) or 0;
            		sheet.ConEscolhidoBlume = tonumber(sheet.ConEscolhidoBlume) or 0;
            		sheet.ConForte = tonumber(sheet.ConForte) or 0;
            		sheet.ConHabilidoso = tonumber(sheet.ConHabilidoso) or 0;
            		sheet.ConInteligente = tonumber(sheet.ConInteligente) or 0;
            		sheet.ConMestreMagico = tonumber(sheet.ConMestreMagico) or 0;
            		sheet.ConPersistente = tonumber(sheet.ConPersistente) or 0;
            		sheet.ConResistente = tonumber(sheet.ConVigoroso) or 0;
            		
            		if sheet.jaRecebeu == false then 
            			showMessage("Bem vindo a velen");
            			showMessage("Por padrão classe, especialização e raça foram selecionadas para seu personagem, mas voce deve alterar e escolher a que for de sua vontade");
            			sheet.jaRecebeu = true;
            		end; 
            		
            		sheet.SequenciaInicial = sheet.SequenciaInicial or true;
            		self.ChecaLevel20();
        end);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.Level ~= nil then	
            				if sheet.level > 0 then
            					if sheet.Raca == 'Humano' then
            						sheet.FNivel = (tonumber(sheet.Level) or 0) * 0.1
            						sheet.INivel = (tonumber(sheet.Level) or 0) * 0.1
            						sheet.DNivel = (tonumber(sheet.Level) or 0) * 0.1
            						sheet.ANivel = (tonumber(sheet.Level) or 0) * 0.1
            						sheet.VNivel = (tonumber(sheet.Level) or 0) * 0.1	
            					else if sheet.Raca == 'Elfo' then
            						sheet.FNivel = (tonumber(sheet.Level) or 0) * 0.0
            						sheet.INivel = (tonumber(sheet.Level) or 0) * 0.3
            						sheet.DNivel = (tonumber(sheet.Level) or 0) * 0.1
            						sheet.ANivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.VNivel = (tonumber(sheet.Level) or 0) * 0.0	
            					else if sheet.Raca == 'Elfo Negro' then
            						sheet.FNivel = (tonumber(sheet.Level) or 0) * 0.0
            						sheet.INivel = (tonumber(sheet.Level) or 0) * 0.1
            						sheet.DNivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.ANivel = (tonumber(sheet.Level) or 0) * 0.3
            						sheet.VNivel = (tonumber(sheet.Level) or 0) * 0.0
            					else if sheet.Raca == 'Anão' then
            						sheet.FNivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.INivel = (tonumber(sheet.Level) or 0) * 0.0
            						sheet.DNivel = (tonumber(sheet.Level) or 0) * 0.0
            						sheet.ANivel = (tonumber(sheet.Level) or 0) * 0.0
            						sheet.VNivel = (tonumber(sheet.Level) or 0) * 0.4
            					else if sheet.Raca == 'Orc' then
            						sheet.FNivel = (tonumber(sheet.Level) or 0) * 0.4
            						sheet.INivel = (tonumber(sheet.Level) or 0) * 0.0
            						sheet.DNivel = (tonumber(sheet.Level) or 0) * 0.0
            						sheet.ANivel = (tonumber(sheet.Level) or 0) * 0.0
            						sheet.VNivel = (tonumber(sheet.Level) or 0) * 0.2
            					else if sheet.Raca == 'Kamael' then
            						sheet.FNivel = (tonumber(sheet.Level) or 0) * 0.0
            						sheet.INivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.DNivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.ANivel = (tonumber(sheet.Level) or 0) * 0.3
            						sheet.VNivel = (tonumber(sheet.Level) or 0) * 0.0
            					else if sheet.Raca == 'Thiefling' then
            						sheet.FNivel = (tonumber(sheet.Level) or 0) * 0.0
            						sheet.INivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.DNivel = (tonumber(sheet.Level) or 0) * 0.3
            						sheet.ANivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.VNivel = (tonumber(sheet.Level) or 0) * 0.0		
            					end	
            					end
            					end
            					end
            					end
            					end
            					end;
            				end;		
            			
            
            					
            			
             
            			if sheet.Level ~= nil then
            				if sheet.Level > 0 then
            					if sheet.classe == 'Cavaleiro Draconico' then
            						sheet.FNivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.INivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.DNivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.ANivel = (tonumber(sheet.Level) or 0) * 0.2
            						sheet.VNivel = (tonumber(sheet.Level) or 0) * 0.2
            					end;	
            				end;
            			end;
            		end;
        end);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmVelenSobreposi");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmPVPMod");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (event)
            DiminuirPontosForca();
        end);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (event)
            AumentarPontosForca();
        end);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (event)
            DiminuirPontosInteligencia();
        end);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (event)
            AumentarPontosInteligencia();
        end);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (event)
            DiminuirPontosDestreza();
        end);

    obj._e_event9 = obj.button8:addEventListener("onClick",
        function (event)
            AumentarPontosDestreza();
        end);

    obj._e_event10 = obj.button9:addEventListener("onClick",
        function (event)
            DiminuirPontosAgilidade();
        end);

    obj._e_event11 = obj.button10:addEventListener("onClick",
        function (event)
            AumentarPontosAgilidade();
        end);

    obj._e_event12 = obj.button11:addEventListener("onClick",
        function (event)
            DiminuirPontosVitalidade();
        end);

    obj._e_event13 = obj.button12:addEventListener("onClick",
        function (event)
            AumentarPontosVitalidade();
        end);

    obj._e_event14 = obj.button13:addEventListener("onClick",
        function (event)
            AtualizaStatusMesa()
        end);

    obj._e_event15 = obj.button14:addEventListener("onClick",
        function (event)
            IgualarHPMesa()
        end);

    obj._e_event16 = obj.button15:addEventListener("onClick",
        function (event)
            IgualarMPMesa()
        end);

    obj._e_event17 = obj.button16:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmequip");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event18 = obj.button17:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmhabilidade");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event19 = obj.button18:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmHistoria");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event20 = obj.button19:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmsummon");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event21 = obj.button20:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmpersonagem");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event22 = obj.button21:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmActionBar");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event23 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            AtualizaAtributos();
        end);

    obj._e_event24 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            AtualizaStatusMapa();
            			StatusPorRaca();
            			StatusDeChances();
        end);

    obj._e_event25 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            ORCRacial();
        end);

    obj._e_event26 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            CalculaDefesaResistenciaPorNivel();
        end);

    obj._e_event27 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.SequenciaInicial == true then
            				StatusPorRaca(); 
            				self.StatusClasseAte20();				
            				self.StatusEspecAteLevel30();				
            				self.StatusClasseEspecialAteLevel20();				
            				self.StatusClasseEspecialAteLevel30();			
            			end;
        end);

    obj._e_event28 = obj.dataLink7:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.SequenciaInicial == true then
            				self.ControlaRacaHPAte20();
            				self.ControlaRacaHPAte30();
            				self.ControlaClasseHPAte20();
            				self.ControlaEspecHPAte30();
            				self.ControlaClasseEspecialHPAte20();
            				self.ControlaClasseEspecialHPAte30();
            				self.CalculaHP();
            				self.ChecaLevel20();
            			end;
        end);

    obj._e_event29 = obj.dataLink8:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.SequenciaInicial == true then
            				self.ControlaClasseMP();
            				self.ControlaEspecMP();			
            				self.ControlaClasseEspecialMPAte20();	
            				CalculaMP();
            				self.ChecaLevel20();	
            			end;
        end);

    obj._e_event30 = obj.dataLink9:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.SequenciaInicial == true then
            				StatusDeChances();
            				self.ChecaLevel20();					
            			end;
        end);

    obj._e_event31 = obj.dataLink10:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.SequenciaInicial == true then
            				self.ChecaLevel20();					
            			end;
        end);

    obj._e_event32 = obj.button22:addEventListener("onClick",
        function (event)
            showMessage('P.A = Poder de Ataque 2x a Força, Se for Monge 4x Força');
        end);

    obj._e_event33 = obj.button23:addEventListener("onClick",
        function (event)
            showMessage('P.M = Poder Magico 2x a Inteligencia');
        end);

    obj._e_event34 = obj.button24:addEventListener("onClick",
        function (event)
            showMessage('P.F = Poder de Fogo 2x a Destreza');
        end);

    obj._e_event35 = obj.button25:addEventListener("onClick",
        function (event)
            showMessage('DEF = Defesa Fisica que é Armadura + Metade da Vitalidade e Metade da Agilidade');
        end);

    obj._e_event36 = obj.button26:addEventListener("onClick",
        function (event)
            showMessage('RES = Resistencia Magica que é Metade da Força + Metade da Vitalidade + Metade da Defesa');
        end);

    obj._e_event37 = obj.button27:addEventListener("onClick",
        function (event)
            AtaqueBasico()
        end);

    obj._e_event38 = obj.button28:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmBasica");
            			novoForm:setNodeObject(sheet);
            			novoForm:show();
        end);

    obj._e_event39 = obj.btnUpaLevel:addEventListener("onClick",
        function (event)
            RolarAtributoPorUpar()
        end);

    obj._e_event40 = obj.dataLink11:addEventListener("onChange",
        function (field, oldValue, newValue)
            SistemaXPLevel();
        end);

    obj._e_event41 = obj.dataLink12:addEventListener("onChange",
        function (field, oldValue, newValue)
            XPTotalPraUpar();
        end);

    obj._e_event42 = obj.dataLink13:addEventListener("onChange",
        function (field, oldValue, newValue)
            ComandoADM();
        end);

    obj._e_event43 = obj.dataLink14:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.SequenciaInicial == true then				
            					if sheet.Level >= 1 then 
            						if (sheet.PA > 0) and (sheet.PM > 0) and (sheet.PF > 0) and (sheet.DEFRED > 0) and (sheet.RESRED > 0) and (sheet.Acerto > 0) and (sheet.AcertoMagico > 0) and (sheet.Esquiva > 0) and (sheet.Persistencia > 0) and (sheet.Critical > 0) and (sheet.CMagico > 0) then
            							AtualizaStatusMesaSilencioso();
            						end;
            					end;							
            				end;
        end);

    obj._e_event44 = obj.dataLink15:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.SequenciaInicial == true then				
            					if sheet.Level >= 1 then 
            						if (sheet.HPTotal > 0) and (sheet.MPTotal > 0)then
            							IgualarHPMesa();
            							IgualarMPMesa();
            						end;
            					end;							
            				end;
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
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

        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.BarraXP ~= nil then self.BarraXP:destroy(); self.BarraXP = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.btnUpaLevel ~= nil then self.btnUpaLevel:destroy(); self.btnUpaLevel = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.cmbEspecializa ~= nil then self.cmbEspecializa:destroy(); self.cmbEspecializa = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmvelen()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmvelen();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmvelen = {
    newEditor = newfrmvelen, 
    new = newfrmvelen, 
    name = "frmvelen", 
    dataType = "com.velen", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Velen 4", 
    description=""};

frmvelen = _frmvelen;
Firecast.registrarForm(_frmvelen);
Firecast.registrarDataType(_frmvelen);

return _frmvelen;
