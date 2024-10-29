require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmVelenSobreposi()
    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("frmVelenSobreposi");
    obj:setScale(0.9);
    obj:setWidth(650);
    obj:setHeight(700);


			local function AtaqueBasico()      
				-- obter a mesa do personagem
				local mesaDoPersonagem = Firecast.getMesaDe(sheet);
				local mesas = rrpg.getRooms();
				local bibliotecaAtual = mesas[1].library;

					--[[local function obterNomesRecursivo(bibItem)
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
										RESAlvo = node.RES
										DefAlvo = node.DEF 
									end
								end
							end
						end
						return nomes
					end

					local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);]]

				
				------------------------------------------------------------------

				-- se o usuário não preencheu modificador, vamos usar o valor 0
				sheet.Acerto = sheet.Acerto or 0;                        
				if sheet.EscolheAtaqueBasico == nil then
					showMessage("Escolha uma Base de Dano para seu Ataque Basico na lista acima");
				else				
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acerto, "[§K2]Ataque Basico",						
						function (rolado)	
						--[[EsqAlvo = EsqAlvo + 1
						local soDado = rolado.resultado;
							if soDado > EsqAlvo then]]
								if rolado.resultado > sheet.Critical then
									if sheet.EscolheAtaqueBasico == 'PA' then
										--[[nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = (sheet.PA * 2) * (1 - (DefAlvo / 100))]]
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.PA * 2) .. " [§K9,0] » CRITICAL :dinofauro:");
										
									elseif sheet.EscolheAtaqueBasico == 'PF' then	
										if sheet.AtualFlecha ~= 0 then									
											sheet.AtualFlecha = (tonumber(sheet.AtualFlecha) or 0) - 1;
											--[[nodeExterno.AlvoRecebido = self.cmbInimigos.value
											nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value	
											nodeExterno.DanoRecebido = (sheet.PF * 2) * (1 - (DefAlvo / 100))]]
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico a distancia « [§K4,0] " .. (sheet.PF * 2) .. " [§K9,0]» CRITICAL :dinofauro:");											
										else
											mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.nome) .. "[§K3] tentou puxar uma flecha e percebeu que estava sem na aljava");
										end;
									end;	
								else
									if sheet.EscolheAtaqueBasico == 'PA' then
										--[[nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = (sheet.PA) * (1 - (DefAlvo / 100))]]
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico a distancia « [§K4,0] " .. (sheet.PA) .. " [§K9,0]»");
									elseif sheet.EscolheAtaqueBasico == 'PF' then		
										if sheet.AtualFlecha ~= 0 then									
											sheet.AtualFlecha = (tonumber(sheet.AtualFlecha) or 0) - 1;
											--[[nodeExterno.AlvoRecebido = self.cmbInimigos.value
											nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
											nodeExterno.DanoRecebido = (sheet.PF) * (1 - (DefAlvo / 100))]]
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico a distancia « [§K4,0] " .. (sheet.PF) .. " [§K9,0]»");
										else
											mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.nome) .. "[§K3] tentou puxar uma flecha e percebeu que estava sem na aljava");
										end;
									end;							
								end;
							--[[else
								mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.nome) .. "[§K3] Errou o ataque no oponente");
							end;]]
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

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(600);
    obj.button1:setVisible(false);
    obj.button1:setTop(10);
    obj.button1:setText("Ficha1");
    obj.button1:setName("button1");

    obj.btnSelecionaFicha1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnSelecionaFicha1:setParent(obj.scrollBox1);
    obj.btnSelecionaFicha1:setName("btnSelecionaFicha1");
    obj.btnSelecionaFicha1:setVisible(false);
    obj.btnSelecionaFicha1:setLeft(10);
    obj.btnSelecionaFicha1:setWidth(150);
    obj.btnSelecionaFicha1:setTop(820);
    obj.btnSelecionaFicha1:setText("Seleciona Ficha 1");

    obj.btnSelecionaFicha2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnSelecionaFicha2:setParent(obj.scrollBox1);
    obj.btnSelecionaFicha2:setName("btnSelecionaFicha2");
    obj.btnSelecionaFicha2:setVisible(false);
    obj.btnSelecionaFicha2:setLeft(10);
    obj.btnSelecionaFicha2:setWidth(150);
    obj.btnSelecionaFicha2:setTop(850);
    obj.btnSelecionaFicha2:setText("Seleciona Ficha 2");

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
		'Necromance', 'Sacerdote', 'Juiz', 'Barbaro', 'Tanker', 'Acrobata', 'Assassino', 'Arcanista', 'Elementalista', 'Summoner', 'Duelista', 'Pirata', 'Guardião Espiritual', 'Guardião da Serenidade',
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

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(175);
    obj.button2:setTop(288);
    obj.button2:setWidth(30);
    obj.button2:setFontSize(18);
    obj.button2:setText("-");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(208);
    obj.button3:setTop(288);
    obj.button3:setWidth(30);
    obj.button3:setFontSize(18);
    obj.button3:setText("+");
    obj.button3:setName("button3");

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

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(175);
    obj.button4:setTop(350);
    obj.button4:setWidth(30);
    obj.button4:setFontSize(18);
    obj.button4:setText("-");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(208);
    obj.button5:setTop(350);
    obj.button5:setWidth(30);
    obj.button5:setFontSize(18);
    obj.button5:setText("+");
    obj.button5:setName("button5");

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

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox1);
    obj.button6:setLeft(175);
    obj.button6:setTop(411);
    obj.button6:setWidth(30);
    obj.button6:setFontSize(18);
    obj.button6:setText("-");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox1);
    obj.button7:setLeft(208);
    obj.button7:setTop(411);
    obj.button7:setWidth(30);
    obj.button7:setFontSize(18);
    obj.button7:setText("+");
    obj.button7:setName("button7");

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

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox1);
    obj.button8:setLeft(175);
    obj.button8:setTop(472);
    obj.button8:setWidth(30);
    obj.button8:setFontSize(18);
    obj.button8:setText("-");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox1);
    obj.button9:setLeft(208);
    obj.button9:setTop(472);
    obj.button9:setWidth(30);
    obj.button9:setFontSize(18);
    obj.button9:setText("+");
    obj.button9:setName("button9");

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

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox1);
    obj.button10:setLeft(175);
    obj.button10:setTop(533);
    obj.button10:setWidth(30);
    obj.button10:setFontSize(18);
    obj.button10:setText("-");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox1);
    obj.button11:setLeft(208);
    obj.button11:setTop(533);
    obj.button11:setWidth(30);
    obj.button11:setFontSize(18);
    obj.button11:setText("+");
    obj.button11:setName("button11");

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

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(290);
    obj.image2:setTop(650);
    obj.image2:setWidth(60);
    obj.image2:setHeight(60);
    obj.image2:setVisible(false);
    obj.image2:setSRC("/imagens/info.png");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setLeft(190);
    obj.image3:setTop(580);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setVisible(false);
    obj.image3:setSRC("/imagens/TAGS/StatusAtt.png");
    obj.image3:setName("image3");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.scrollBox1);
    obj.button12:setLeft(290);
    obj.button12:setTop(650);
    obj.button12:setWidth(60);
    obj.button12:setOpacity(0.1);
    obj.button12:setHeight(60);
    obj.button12:setVisible(false);
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox1);
    obj.button13:setLeft(80);
    obj.button13:setTop(603);
    obj.button13:setWidth(38);
    obj.button13:setOpacity(0.1);
    obj.button13:setHeight(32);
    obj.button13:setVisible(false);
    obj.button13:setName("button13");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.scrollBox1);
    obj.progressBar1:setLeft(148);
    obj.progressBar1:setTop(603);
    obj.progressBar1:setColor("red");
    obj.progressBar1:setWidth(100);
    obj.progressBar1:setPosition(100);
    obj.progressBar1:setMax(100);
    obj.progressBar1:setHeight(30);
    obj.progressBar1:setName("progressBar1");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.scrollBox1);
    obj.label15:setLeft(150);
    obj.label15:setFontSize(20);
    obj.label15:setTop(603);
    obj.label15:setWidth(100);
    obj.label15:setFontColor("white");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setHeight(30);
    obj.label15.format = "%d";
    obj.label15:setField("HPTotal");
    obj.label15:setName("label15");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.scrollBox1);
    obj.button14:setLeft(80);
    obj.button14:setTop(637);
    obj.button14:setWidth(38);
    obj.button14:setOpacity(0.1);
    obj.button14:setHeight(32);
    obj.button14:setVisible(false);
    obj.button14:setName("button14");

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

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.scrollBox1);
    obj.label16:setLeft(150);
    obj.label16:setFontSize(20);
    obj.label16:setTop(640);
    obj.label16:setWidth(100);
    obj.label16:setFontColor("white");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setHeight(30);
    obj.label16.format = "%d";
    obj.label16:setField("MPTotal");
    obj.label16:setName("label16");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox1);
    obj.rectangle13:setLeft(168);
    obj.rectangle13:setTop(702);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setWidth(75);
    obj.rectangle13:setHeight(20);
    obj.rectangle13:setName("rectangle13");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.scrollBox1);
    obj.label17:setLeft(170);
    obj.label17:setTop(702);
    obj.label17:setWidth(75);
    obj.label17:setHeight(20);
    obj.label17:setField("Esquiva");
    obj.label17:setName("label17");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.scrollBox1);
    obj.rectangle14:setLeft(168);
    obj.rectangle14:setTop(732);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setWidth(75);
    obj.rectangle14:setHeight(20);
    obj.rectangle14:setName("rectangle14");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.scrollBox1);
    obj.label18:setLeft(170);
    obj.label18:setTop(732);
    obj.label18:setWidth(75);
    obj.label18:setHeight(20);
    obj.label18.format = "%d";
    obj.label18:setField("Persistencia");
    obj.label18:setName("label18");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.scrollBox1);
    obj.rectangle15:setLeft(498);
    obj.rectangle15:setTop(610);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setWidth(75);
    obj.rectangle15:setHeight(20);
    obj.rectangle15:setName("rectangle15");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.scrollBox1);
    obj.label19:setLeft(500);
    obj.label19:setTop(610);
    obj.label19:setWidth(75);
    obj.label19:setHeight(20);
    obj.label19:setField("Acerto");
    obj.label19:setName("label19");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.scrollBox1);
    obj.rectangle16:setLeft(498);
    obj.rectangle16:setTop(640);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setWidth(75);
    obj.rectangle16:setHeight(20);
    obj.rectangle16:setName("rectangle16");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.scrollBox1);
    obj.label20:setLeft(500);
    obj.label20:setTop(640);
    obj.label20:setWidth(75);
    obj.label20:setHeight(20);
    obj.label20:setField("AcertoMagico");
    obj.label20:setName("label20");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.scrollBox1);
    obj.rectangle17:setLeft(498);
    obj.rectangle17:setTop(702);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setWidth(75);
    obj.rectangle17:setHeight(20);
    obj.rectangle17:setName("rectangle17");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.scrollBox1);
    obj.label21:setLeft(500);
    obj.label21:setTop(702);
    obj.label21:setWidth(75);
    obj.label21:setHeight(20);
    obj.label21:setField("Critical");
    obj.label21:setName("label21");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.scrollBox1);
    obj.rectangle18:setLeft(498);
    obj.rectangle18:setTop(732);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setWidth(75);
    obj.rectangle18:setHeight(20);
    obj.rectangle18:setName("rectangle18");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.scrollBox1);
    obj.label22:setLeft(500);
    obj.label22:setTop(732);
    obj.label22:setWidth(75);
    obj.label22:setHeight(20);
    obj.label22:setField("CMagico");
    obj.label22:setName("label22");

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

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.scrollBox1);
    obj.button15:setLeft(33);
    obj.button15:setTop(160);
    obj.button15:setWidth(60);
    obj.button15:setHeight(60);
    obj.button15:setOpacity(0.1);
    obj.button15:setName("button15");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox1);
    obj.image4:setLeft(-40);
    obj.image4:setTop(110);
    obj.image4:setWidth(200);
    obj.image4:setHeight(200);
    obj.image4:setSRC("/imagens/TAGS/TIER.png");
    obj.image4:setName("image4");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.scrollBox1);
    obj.button16:setLeft(120);
    obj.button16:setTop(160);
    obj.button16:setWidth(60);
    obj.button16:setHeight(60);
    obj.button16:setOpacity(0.1);
    obj.button16:setName("button16");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox1);
    obj.image5:setLeft(47);
    obj.image5:setTop(110);
    obj.image5:setWidth(200);
    obj.image5:setHeight(200);
    obj.image5:setSRC("/imagens/TAGS/SKILL.png");
    obj.image5:setName("image5");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.scrollBox1);
    obj.button17:setLeft(460);
    obj.button17:setTop(160);
    obj.button17:setWidth(60);
    obj.button17:setHeight(60);
    obj.button17:setOpacity(0.1);
    obj.button17:setName("button17");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox1);
    obj.image6:setLeft(390);
    obj.image6:setTop(110);
    obj.image6:setWidth(200);
    obj.image6:setHeight(200);
    obj.image6:setSRC("/imagens/TAGS/HISTORIA.png");
    obj.image6:setName("image6");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.scrollBox1);
    obj.button18:setLeft(287);
    obj.button18:setTop(290);
    obj.button18:setWidth(60);
    obj.button18:setHeight(60);
    obj.button18:setOpacity(0.1);
    obj.button18:setName("button18");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox1);
    obj.image7:setLeft(216);
    obj.image7:setTop(243);
    obj.image7:setWidth(200);
    obj.image7:setHeight(200);
    obj.image7:setSRC("/imagens/TAGS/SUMMON.png");
    obj.image7:setName("image7");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.scrollBox1);
    obj.button19:setLeft(542);
    obj.button19:setTop(160);
    obj.button19:setWidth(60);
    obj.button19:setHeight(60);
    obj.button19:setOpacity(0.1);
    obj.button19:setName("button19");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.scrollBox1);
    obj.image8:setLeft(467);
    obj.image8:setTop(110);
    obj.image8:setWidth(200);
    obj.image8:setHeight(200);
    obj.image8:setSRC("/imagens/TAGS/Sobre.png");
    obj.image8:setName("image8");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.scrollBox1);
    obj.button20:setLeft(388);
    obj.button20:setTop(255);
    obj.button20:setWidth(60);
    obj.button20:setHeight(55);
    obj.button20:setOpacity(0.1);
    obj.button20:setName("button20");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.scrollBox1);
    obj.image9:setLeft(317);
    obj.image9:setTop(205);
    obj.image9:setWidth(200);
    obj.image9:setHeight(200);
    obj.image9:setSRC("/imagens/TAGS/PA.png");
    obj.image9:setName("image9");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.scrollBox1);
    obj.button21:setLeft(388);
    obj.button21:setTop(317);
    obj.button21:setWidth(60);
    obj.button21:setHeight(55);
    obj.button21:setOpacity(0.1);
    obj.button21:setName("button21");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.scrollBox1);
    obj.image10:setLeft(317);
    obj.image10:setTop(267);
    obj.image10:setWidth(200);
    obj.image10:setHeight(200);
    obj.image10:setSRC("/imagens/TAGS/PM.png");
    obj.image10:setName("image10");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.scrollBox1);
    obj.button22:setLeft(388);
    obj.button22:setTop(377);
    obj.button22:setWidth(60);
    obj.button22:setHeight(55);
    obj.button22:setOpacity(0.1);
    obj.button22:setName("button22");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.scrollBox1);
    obj.image11:setLeft(317);
    obj.image11:setTop(327);
    obj.image11:setWidth(200);
    obj.image11:setHeight(200);
    obj.image11:setSRC("/imagens/TAGS/PF.png");
    obj.image11:setName("image11");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.scrollBox1);
    obj.button23:setLeft(388);
    obj.button23:setTop(435);
    obj.button23:setWidth(60);
    obj.button23:setHeight(55);
    obj.button23:setOpacity(0.1);
    obj.button23:setName("button23");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.scrollBox1);
    obj.image12:setLeft(317);
    obj.image12:setTop(385);
    obj.image12:setWidth(200);
    obj.image12:setHeight(200);
    obj.image12:setSRC("/imagens/TAGS/DEF.png");
    obj.image12:setName("image12");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.scrollBox1);
    obj.button24:setLeft(388);
    obj.button24:setTop(493);
    obj.button24:setWidth(60);
    obj.button24:setHeight(55);
    obj.button24:setOpacity(0.1);
    obj.button24:setName("button24");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.scrollBox1);
    obj.image13:setLeft(317);
    obj.image13:setTop(443);
    obj.image13:setWidth(200);
    obj.image13:setHeight(200);
    obj.image13:setSRC("/imagens/TAGS/RES.png");
    obj.image13:setName("image13");

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

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.scrollBox1);
    obj.button25:setLeft(273);
    obj.button25:setTop(380);
    obj.button25:setWidth(90);
    obj.button25:setHeight(30);
    obj.button25:setFontSize(12);
    obj.button25:setFontColor("#00FFFF");
    obj.button25:setText("Ataque Basico");
    obj.button25:setName("button25");

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

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.scrollBox1);
    obj.label23:setWidth(35);
    obj.label23:setHeight(20);
    obj.label23:setTop(675);
    obj.label23:setLeft(205);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontColor("black");
    obj.label23:setField("XPNecessario");
    obj.label23:setName("label23");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
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

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmPVPMod");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event2 = obj.btnSelecionaFicha1:addEventListener("onClick",
        function (event)
            Ficha1 = sheet
            				self.btnSelecionaFicha1.fontColor="red"
            				self.btnSelecionaFicha1.text= Ficha1.Nome
        end);

    obj._e_event3 = obj.btnSelecionaFicha2:addEventListener("onClick",
        function (event)
            Ficha2 = sheet
            				self.btnSelecionaFicha2.fontColor="red"
            				self.btnSelecionaFicha2.text= Ficha2.Nome
        end);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (event)
            DiminuirPontosForca();
        end);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (event)
            AumentarPontosForca();
        end);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (event)
            DiminuirPontosInteligencia();
        end);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (event)
            AumentarPontosInteligencia();
        end);

    obj._e_event8 = obj.button6:addEventListener("onClick",
        function (event)
            DiminuirPontosDestreza();
        end);

    obj._e_event9 = obj.button7:addEventListener("onClick",
        function (event)
            AumentarPontosDestreza();
        end);

    obj._e_event10 = obj.button8:addEventListener("onClick",
        function (event)
            DiminuirPontosAgilidade();
        end);

    obj._e_event11 = obj.button9:addEventListener("onClick",
        function (event)
            AumentarPontosAgilidade();
        end);

    obj._e_event12 = obj.button10:addEventListener("onClick",
        function (event)
            DiminuirPontosVitalidade();
        end);

    obj._e_event13 = obj.button11:addEventListener("onClick",
        function (event)
            AumentarPontosVitalidade();
        end);

    obj._e_event14 = obj.button12:addEventListener("onClick",
        function (event)
            AtualizaStatusMesa()
        end);

    obj._e_event15 = obj.button13:addEventListener("onClick",
        function (event)
            IgualarHPMesa()
        end);

    obj._e_event16 = obj.button14:addEventListener("onClick",
        function (event)
            IgualarMPMesa()
        end);

    obj._e_event17 = obj.button15:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmequip");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event18 = obj.button16:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmhabilidade");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event19 = obj.button17:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmHistoria");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event20 = obj.button18:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmsummon");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event21 = obj.button19:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmpersonagem");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event22 = obj.button20:addEventListener("onClick",
        function (event)
            showMessage('P.A = Poder de Ataque 2x a Força, Se for Monge 4x Força');
        end);

    obj._e_event23 = obj.button21:addEventListener("onClick",
        function (event)
            showMessage('P.M = Poder Magico 2x a Inteligencia');
        end);

    obj._e_event24 = obj.button22:addEventListener("onClick",
        function (event)
            showMessage('P.F = Poder de Fogo 2x a Destreza');
        end);

    obj._e_event25 = obj.button23:addEventListener("onClick",
        function (event)
            showMessage('DEF = Defesa Fisica que é Armadura + Metade da Vitalidade e Metade da Agilidade');
        end);

    obj._e_event26 = obj.button24:addEventListener("onClick",
        function (event)
            showMessage('RES = Resistencia Magica que é Metade da Força + Metade da Vitalidade + Metade da Defesa');
        end);

    obj._e_event27 = obj.button25:addEventListener("onClick",
        function (event)
            AtaqueBasico()
        end);

    function obj:_releaseEvents()
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
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.btnSelecionaFicha1 ~= nil then self.btnSelecionaFicha1:destroy(); self.btnSelecionaFicha1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.btnSelecionaFicha2 ~= nil then self.btnSelecionaFicha2:destroy(); self.btnSelecionaFicha2 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.BarraXP ~= nil then self.BarraXP:destroy(); self.BarraXP = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.cmbEspecializa ~= nil then self.cmbEspecializa:destroy(); self.cmbEspecializa = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
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
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmVelenSobreposi()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmVelenSobreposi();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmVelenSobreposi = {
    newEditor = newfrmVelenSobreposi, 
    new = newfrmVelenSobreposi, 
    name = "frmVelenSobreposi", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmVelenSobreposi = _frmVelenSobreposi;
Firecast.registrarForm(_frmVelenSobreposi);

return _frmVelenSobreposi;
