require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmActionBar()
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
    obj:setName("frmActionBar");
    obj:setWidth(500);
    obj:setScale(0.9);
    obj:setHeight(210);


	function VerificaTipoSkill(AtributoSkill, UtilidadeSkill, DanoSkill, CustoSkill) 		
		if UtilidadeSkill == "Dano" then			
			RolaHabilidadeDano(AtributoSkill, UtilidadeSkill, DanoSkill, CustoSkill);
		end;		
	end;




	


			
	function RolaHabilidadeDano(AtributoSkill, UtilidadeSkill, DanoSkill, CustoSkill)	
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);
		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;		
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade Ofensiva",
		function (rolado)					
			if sheet.AcertoMagico + 1 > rolado.resultado then
				if sheet.CMagico +1 > rolado.resultado then 
					mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. DanoSkill * 2 .. "[§K9,0] »");
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. DanoSkill .. "[§K9,0] »");
				end;	
				showMessage(CustoSkill)
				local mesa = Firecast.getMesaDe(sheet); 
				local Custo2 = sheet.MPAtual;
				Custo2 = sheet.MPAtual;
				Custo2 = (tonumber(Custo2) or 0) - (tonumber(CustoSkill) or 0);
				sheet.MPAtual = Custo2;
				mesa.meuJogador:requestSetBarValue(2, Custo2);
			else
				mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
			end;	
		end);					
	end;
	







			function AtaqueBasico(SelfHabilidade, nodeHabilidade, SelfcmbInimigosH, cmbTipoDeGrupoFH, nodeExterno)
				SincronizaTurnoEfeito() 
				if SelfcmbInimigosH == "Alvo Simulado" then
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);                      

                        -- se o usuário não preencheu modificador, vamos usar o valor 0
                        sheet.Acerto = sheet.Acerto or 0;                        

                        mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acerto, "Ataque Basico",
							function (rolado)
								local soDado = rolado.resultado - sheet.acerto;
									if soDado >= sheet.Critical then
										if sheet.EscolheAtaqueBasico == 'PA' then
											sheet.AtaqueBasicoDano = math.floor((sheet.PA * 2))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");
										elseif sheet.EscolheAtaqueBasico == 'PF' then	
											if sheet.AtualFlecha ~= 0 then									
												sheet.AtualFlecha = (tonumber(sheet.AtualFlecha) or 0) - 1;
												sheet.AtaqueBasicoDano = math.floor((sheet.PF * 2))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");											
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.Nome) .. "[§K3] tentou puxar uma flecha e percebeu que estava sem na aljava");
											end;
										elseif sheet.EscolheAtaqueBasico == 'PM' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PM * 2))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");


										elseif sheet.EscolheAtaqueBasico == 'PA+M/PA' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PA * 3))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");
										elseif sheet.EscolheAtaqueBasico == 'PF+M/PF' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PF * 3))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");
										elseif sheet.EscolheAtaqueBasico == 'PM+M/PM' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PM * 3))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");

										elseif sheet.EscolheAtaqueBasico == 'M/PA' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PA))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");
										elseif sheet.EscolheAtaqueBasico == 'M/PF' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PF))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");
										elseif sheet.EscolheAtaqueBasico == 'M/PM' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PM))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");	

										elseif sheet.EscolheAtaqueBasico == 'PA+PF' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PA + sheet.PF) * 2))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");
										elseif sheet.EscolheAtaqueBasico == 'PF+PM' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PF + sheet.PM) * 2))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");								
										elseif sheet.EscolheAtaqueBasico == 'PA+PM' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PA + sheet.PM) * 2))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");

										elseif sheet.EscolheAtaqueBasico == 'M/PA+PF' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PA + (sheet.PF * 2))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");	
										elseif sheet.EscolheAtaqueBasico == 'M/PA+PM' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PA + (sheet.PM * 2))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");	
										elseif sheet.EscolheAtaqueBasico == 'M/PF+PM' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PF + (sheet.PM * 2))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");	
										elseif sheet.EscolheAtaqueBasico == 'M/PF+PA' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PF + (sheet.PA * 2))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");	
										elseif sheet.EscolheAtaqueBasico == 'M/PM+PF' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PM + (sheet.PF * 2))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");	
										elseif sheet.EscolheAtaqueBasico == 'M/PM+PA' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PM + (sheet.PA * 2))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");	

										elseif sheet.EscolheAtaqueBasico == 'M/PA+M/PF' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PA + sheet.PF)))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");	
										elseif sheet.EscolheAtaqueBasico == 'M/PF+M/PM' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PF + sheet.PM)))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");	
										elseif sheet.EscolheAtaqueBasico == 'M/PA+M/PM' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PA + sheet.PM)))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");	


										elseif sheet.EscolheAtaqueBasico == 'Real PA' then								
											sheet.AtaqueBasicoDano = math.floor((sheet.PM + (sheet.PA * 2)))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");										
										elseif sheet.EscolheAtaqueBasico == 'Real PF' then								
											sheet.AtaqueBasicoDano = math.floor((sheet.PM + (sheet.PF * 2)))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");										
										elseif sheet.EscolheAtaqueBasico == 'Real PM' then								
											sheet.AtaqueBasicoDano = math.floor((sheet.PM + (sheet.PF * 2)))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] » CRITICAL :dinofauro:");										
										end;
									else
										if sheet.EscolheAtaqueBasico == 'PA' then
											sheet.AtaqueBasicoDano = math.floor((sheet.PA))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));
										elseif sheet.EscolheAtaqueBasico == 'PF' then	
											if sheet.AtualFlecha ~= 0 then									
												sheet.AtualFlecha = (tonumber(sheet.AtualFlecha) or 0) - 1;
												sheet.AtaqueBasicoDano = math.floor((sheet.PF))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));											
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.Nome) .. "[§K3] tentou puxar uma flecha e percebeu que estava sem na aljava");
											end;
										elseif sheet.EscolheAtaqueBasico == 'PM' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PM))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));

										elseif sheet.EscolheAtaqueBasico == 'PA+M/PA' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PA * 1.5))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] »");
										elseif sheet.EscolheAtaqueBasico == 'PF+M/PF' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PF * 1.5))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] »");
										elseif sheet.EscolheAtaqueBasico == 'PM+M/PM' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PM * 1.5))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] »");

										elseif sheet.EscolheAtaqueBasico == 'M/PA' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PA / 2))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));
										elseif sheet.EscolheAtaqueBasico == 'M/PF' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PF / 2))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));
										elseif sheet.EscolheAtaqueBasico == 'M/PM' then				
											sheet.AtaqueBasicoDano = math.floor((sheet.PM / 2))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	

										elseif sheet.EscolheAtaqueBasico == 'PA+PF' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PA + sheet.PF)))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));
										elseif sheet.EscolheAtaqueBasico == 'PF+PM' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PF + sheet.PM)))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));								
										elseif sheet.EscolheAtaqueBasico == 'PA+PM' then								
											sheet.AtaqueBasicoDano = math.floor(((sheet.PA + sheet.PM)))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));

										elseif sheet.EscolheAtaqueBasico == 'M/PA+PF' then								
											sheet.AtaqueBasicoDano = math.floor((((sheet.PA / 2) + (sheet.PF))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	
										elseif sheet.EscolheAtaqueBasico == 'M/PA+PM' then								
											sheet.AtaqueBasicoDano = math.floor((((sheet.PA / 2) + (sheet.PM))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	
										elseif sheet.EscolheAtaqueBasico == 'M/PF+PM' then								
											sheet.AtaqueBasicoDano = math.floor((((sheet.PF / 2) + (sheet.PM))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	
										elseif sheet.EscolheAtaqueBasico == 'M/PF+PA' then								
											sheet.AtaqueBasicoDano = math.floor((((sheet.PF / 2) + (sheet.PA))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	
										elseif sheet.EscolheAtaqueBasico == 'M/PM+PF' then								
											sheet.AtaqueBasicoDano = math.floor((((sheet.PM / 2) + (sheet.PF))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	
										elseif sheet.EscolheAtaqueBasico == 'M/PM+PA' then								
											sheet.AtaqueBasicoDano = math.floor((((sheet.PM / 2) + (sheet.PA))))									
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	

										elseif sheet.EscolheAtaqueBasico == 'M/PA+M/PF' then
											sheet.AtaqueBasicoDano = math.floor(((sheet.PA / 2) + (sheet.PF / 2)))
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))
										elseif sheet.EscolheAtaqueBasico == 'M/PF+M/PM' then
											sheet.AtaqueBasicoDano = math.floor(((sheet.PF / 2) + (sheet.PM / 2)))
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))
										elseif sheet.EscolheAtaqueBasico == 'M/PA+M/PM' then
											sheet.AtaqueBasicoDano = math.floor(((sheet.PA / 2) + (sheet.PM / 2)))
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))

										elseif sheet.EscolheAtaqueBasico == 'Real PA' then
											sheet.AtaqueBasicoDano = math.floor((sheet.PM + sheet.PA))
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))
										elseif sheet.EscolheAtaqueBasico == 'Real PF' then
											sheet.AtaqueBasicoDano = math.floor((sheet.PM + sheet.PF))
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))
										elseif sheet.EscolheAtaqueBasico == 'Real PM' then
											sheet.AtaqueBasicoDano = math.floor((sheet.PM + sheet.PM))
											mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))
										end;
											
									end;

							end); 
				else				
					local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
					if sheet.EscolheAtaqueBasico == 'PA' then
						sheet.AtaqueBasicoDano = math.floor((sheet.PA))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));
					elseif sheet.EscolheAtaqueBasico == 'PF' then	
						if sheet.AtualFlecha ~= 0 then									
							sheet.AtualFlecha = (tonumber(sheet.AtualFlecha) or 0) - 1;
							sheet.AtaqueBasicoDano = math.floor((sheet.PF))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));											
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.Nome) .. "[§K3] tentou puxar uma flecha e percebeu que estava sem na aljava");
						end;
					elseif sheet.EscolheAtaqueBasico == 'PM' then				
						sheet.AtaqueBasicoDano = math.floor((sheet.PM))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));

					elseif sheet.EscolheAtaqueBasico == 'M/PA' then				
						sheet.AtaqueBasicoDano = math.floor((sheet.PA / 2))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));
					elseif sheet.EscolheAtaqueBasico == 'M/PF' then				
						sheet.AtaqueBasicoDano = math.floor((sheet.PF / 2))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));
					elseif sheet.EscolheAtaqueBasico == 'M/PM' then				
						sheet.AtaqueBasicoDano = math.floor((sheet.PM / 2))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	

					elseif sheet.EscolheAtaqueBasico == 'PA+M/PA' then				
						sheet.AtaqueBasicoDano = math.floor((sheet.PA * 1.5))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] »");
					elseif sheet.EscolheAtaqueBasico == 'PF+M/PF' then				
						sheet.AtaqueBasicoDano = math.floor((sheet.PF * 1.5))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] »");
					elseif sheet.EscolheAtaqueBasico == 'PM+M/PM' then				
						sheet.AtaqueBasicoDano = math.floor((sheet.PM * 1.5))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano) .. " [§K9,0] »");

					elseif sheet.EscolheAtaqueBasico == 'PA+PF' then								
						sheet.AtaqueBasicoDano = math.floor(((sheet.PA + sheet.PF)))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));
					elseif sheet.EscolheAtaqueBasico == 'PF+PM' then								
						sheet.AtaqueBasicoDano = math.floor(((sheet.PF + sheet.PM)))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));								
					elseif sheet.EscolheAtaqueBasico == 'PA+PM' then								
						sheet.AtaqueBasicoDano = math.floor(((sheet.PA + sheet.PM)))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));

					elseif sheet.EscolheAtaqueBasico == 'M/PA+PF' then								
						sheet.AtaqueBasicoDano = math.floor((((sheet.PA / 2) + (sheet.PF))))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	
					elseif sheet.EscolheAtaqueBasico == 'M/PA+PM' then								
						sheet.AtaqueBasicoDano = math.floor((((sheet.PA / 2) + (sheet.PM))))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	
					elseif sheet.EscolheAtaqueBasico == 'M/PF+PM' then								
						sheet.AtaqueBasicoDano = math.floor((((sheet.PF / 2) + (sheet.PM))))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	
					elseif sheet.EscolheAtaqueBasico == 'M/PF+PA' then								
						sheet.AtaqueBasicoDano = math.floor((((sheet.PF / 2) + (sheet.PA))))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	
					elseif sheet.EscolheAtaqueBasico == 'M/PM+PF' then								
						sheet.AtaqueBasicoDano = math.floor((((sheet.PM / 2) + (sheet.PF))))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	
					elseif sheet.EscolheAtaqueBasico == 'M/PM+PA' then								
						sheet.AtaqueBasicoDano = math.floor((((sheet.PM / 2) + (sheet.PA))))									
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano));	

					elseif sheet.EscolheAtaqueBasico == 'M/PA+M/PF' then
						sheet.AtaqueBasicoDano = math.floor(((sheet.PA / 2) + (sheet.PF / 2)))
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))
					elseif sheet.EscolheAtaqueBasico == 'M/PF+M/PM' then
						sheet.AtaqueBasicoDano = math.floor(((sheet.PF / 2) + (sheet.PM / 2)))
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))
					elseif sheet.EscolheAtaqueBasico == 'M/PA+M/PM' then
						sheet.AtaqueBasicoDano = math.floor(((sheet.PA / 2) + (sheet.PM / 2)))
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))

					elseif sheet.EscolheAtaqueBasico == 'Real PA' then
						sheet.AtaqueBasicoDano = math.floor((sheet.PM + sheet.PA))
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))
					elseif sheet.EscolheAtaqueBasico == 'Real PF' then
						sheet.AtaqueBasicoDano = math.floor((sheet.PM + sheet.PF))
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))
					elseif sheet.EscolheAtaqueBasico == 'Real PM' then
						sheet.AtaqueBasicoDano = math.floor((sheet.PM + sheet.PM))
						mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (sheet.AtaqueBasicoDano))
					end;

					nodeExterno.TipoRecebido = nil

					local mesaDoPersonagem = rrpg.getMesaDe(sheet)
					sheet.Acerto = tonumber(sheet.Acerto) or 0
					
					nodeExterno.UsuarioEnvio = sheet.Nome
					nodeExterno.AcertoDoJogador = sheet.Acerto
					nodeExterno.UsuarioEnviouCusto = 0
					nodeExterno.EscolheTipoAtaque = sheet.EscolheAtaqueBasico
					nodeExterno.DanoRecebido = math.floor((sheet.AtaqueBasicoDano))
					nodeExterno.VezdeQuem = sheet.Nome
					
					nodeExterno.AlvoRecebido = SelfcmbInimigosH
					nodeExterno.GrupoRecebido = cmbTipoDeGrupoFH

					nodeExterno.TesteDecidido = "AtaqueBasico"
					nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
					
				end
			end;
        


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'AtivaBuff', 'AtivaAtaque', 'AtivaDefesa', 'cmbTipoDeGrupoF'});
    obj.dataLink1:setName("dataLink1");

    obj.areaDeAcoes = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.areaDeAcoes:setParent(obj);
    obj.areaDeAcoes:setName("areaDeAcoes");
    obj.areaDeAcoes:setScale(1.2);
    obj.areaDeAcoes:setAlign("top");
    obj.areaDeAcoes:setHeight(50);

    obj.btnFinalizarBuff = GUI.fromHandle(_obj_newObject("button"));
    obj.btnFinalizarBuff:setParent(obj.areaDeAcoes);
    obj.btnFinalizarBuff:setName("btnFinalizarBuff");
    obj.btnFinalizarBuff:setEnabled(false);
    obj.btnFinalizarBuff:setText("Finalizar Buff");
    obj.btnFinalizarBuff:setWidth(100);

    obj.btnFinalizarAtaque = GUI.fromHandle(_obj_newObject("button"));
    obj.btnFinalizarAtaque:setParent(obj.areaDeAcoes);
    obj.btnFinalizarAtaque:setName("btnFinalizarAtaque");
    obj.btnFinalizarAtaque:setEnabled(false);
    obj.btnFinalizarAtaque:setText("Finalizar Ataque");
    obj.btnFinalizarAtaque:setWidth(100);

    obj.btnFinalizarDefesa = GUI.fromHandle(_obj_newObject("button"));
    obj.btnFinalizarDefesa:setParent(obj.areaDeAcoes);
    obj.btnFinalizarDefesa:setName("btnFinalizarDefesa");
    obj.btnFinalizarDefesa:setEnabled(false);
    obj.btnFinalizarDefesa:setText("Finalizar Defesa");
    obj.btnFinalizarDefesa:setWidth(100);

    obj.TargetName = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.TargetName:setParent(obj);
    obj.TargetName:setName("TargetName");
    obj.TargetName:setScale(1.2);
    obj.TargetName:setAlign("top");
    obj.TargetName:setHeight(30);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.TargetName);
    obj.label1:setText("Alvo:");
    obj.label1:setFontColor("red");
    obj.label1:setAlign("right");
    obj.label1:setWidth(75);
    obj.label1:setName("label1");

    obj.cmbInimigos = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigos:setParent(obj.TargetName);
    obj.cmbInimigos:setItems({'Inimigo 1', 'Inimigo 2', 'Inimigo 3'});
    obj.cmbInimigos:setValues({'1', '2', '3'});
    obj.cmbInimigos:setValue("1");
    obj.cmbInimigos:setFontColor("#FF6347");
    obj.cmbInimigos:setName("cmbInimigos");
    obj.cmbInimigos:setWidth(150);
    obj.cmbInimigos:setHeight(25);

    obj.NameTipoDeGrupo = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.NameTipoDeGrupo:setParent(obj);
    obj.NameTipoDeGrupo:setName("NameTipoDeGrupo");
    obj.NameTipoDeGrupo:setScale(1.2);
    obj.NameTipoDeGrupo:setAlign("top");
    obj.NameTipoDeGrupo:setHeight(40);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.NameTipoDeGrupo);
    obj.label2:setText("Grupo:");
    obj.label2:setFontColor("green");
    obj.label2:setAlign("right");
    obj.label2:setWidth(75);
    obj.label2:setName("label2");

    obj.cmbTipoGrupo = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbTipoGrupo:setParent(obj.NameTipoDeGrupo);
    obj.cmbTipoGrupo:setItems({'Jogadores', 'Inimigos'});
    obj.cmbTipoGrupo:setValues({'1', '2'});
    obj.cmbTipoGrupo:setValue("1");
    obj.cmbTipoGrupo:setFontColor("#00FF7F");
    obj.cmbTipoGrupo:setName("cmbTipoGrupo");
    obj.cmbTipoGrupo:setField("cmbTipoDeGrupoF");
    obj.cmbTipoGrupo:setWidth(150);
    obj.cmbTipoGrupo:setHeight(25);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("cmbTipoDeGrupoF");
    obj.dataLink2:setName("dataLink2");

    obj.rclListaDosItens3 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens3:setParent(obj);
    obj.rclListaDosItens3:setName("rclListaDosItens3");
    obj.rclListaDosItens3:setScale(1.2);
    obj.rclListaDosItens3:setField("ListaDeHabilidades");
    obj.rclListaDosItens3:setTemplateForm("frmItemDaLista3");
    obj.rclListaDosItens3:setAlign("top");
    obj.rclListaDosItens3:setSelectable(true);
    obj.rclListaDosItens3:setLayout("horizontal");
    obj.rclListaDosItens3:setHeight(70);

    obj.ListaJutsus3 = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.ListaJutsus3:setParent(obj);
    obj.ListaJutsus3:setName("ListaJutsus3");
    obj.ListaJutsus3:setVisible(false);
    obj.ListaJutsus3:setOpacity(0.0);
    obj.ListaJutsus3:setWidth(480);
    obj.ListaJutsus3:setHeight(580);
    obj.ListaJutsus3:setLeft(540);
    obj.ListaJutsus3:setTop(60);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.ListaJutsus3);
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setColor("Transparent");
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setWidth(460);
    obj.rectangle1:setHeight(560);
    obj.rectangle1:setLeft(1);
    obj.rectangle1:setTop(1);
    obj.rectangle1:setName("rectangle1");

    obj.imghability = GUI.fromHandle(_obj_newObject("image"));
    obj.imghability:setParent(obj.rectangle1);
    obj.imghability:setName("imghability");
    obj.imghability:setAlign("client");
    obj.imghability:setStyle("stretch");
    obj.imghability.animate = true;
    obj.imghability:setSRC("https://i.pinimg.com/originals/91/95/f4/9195f4dd1b69f90038f627c8af422429.gif");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(60);
    obj.label3:setTop(10);
    obj.label3:setWidth(200);
    obj.label3:setHeight(40);
    obj.label3:setFontFamily("Nyala");
    obj.label3:setFontColor("Black");
    obj.label3:setFontSize(20);
    obj.label3:setText("Habilidade:");
    obj.label3:setName("label3");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(140);
    obj.image1:setTop(15);
    obj.image1:setWidth(40);
    obj.image1:setHeight(30);
    obj.image1:setVisible(true);
    obj.image1:setField("fldImgIconSkill");
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(180);
    obj.edit1:setTop(15);
    obj.edit1:setWidth(230);
    obj.edit1:setHeight(30);
    obj.edit1:setField("NomeHabilidade");
    obj.edit1:setName("edit1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setLeft(60);
    obj.textEditor1:setTop(60);
    obj.textEditor1:setWidth(350);
    obj.textEditor1:setHeight(280);
    obj.textEditor1:setField("DescriHabilidade1");
    obj.textEditor1:setName("textEditor1");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(60);
    obj.label4:setTop(350);
    obj.label4:setWidth(120);
    obj.label4:setHeight(40);
    obj.label4:setFontFamily("Nyala");
    obj.label4:setFontColor("Black");
    obj.label4:setFontSize(20);
    obj.label4:setText("Dano");
    obj.label4:setName("label4");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(115);
    obj.edit2:setTop(355);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(30);
    obj.edit2:setType("number");
    obj.edit2:setField("DanoHabilidade1");
    obj.edit2:setName("edit2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(310);
    obj.label5:setTop(350);
    obj.label5:setWidth(60);
    obj.label5:setHeight(40);
    obj.label5:setFontFamily("Nyala");
    obj.label5:setFontColor("Black");
    obj.label5:setFontSize(20);
    obj.label5:setText("Fixo");
    obj.label5:setName("label5");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(350);
    obj.edit3:setTop(355);
    obj.edit3:setWidth(60);
    obj.edit3:setHeight(30);
    obj.edit3:setType("number");
    obj.edit3:setField("FixoHabilidade1");
    obj.edit3:setName("edit3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(180);
    obj.label6:setTop(350);
    obj.label6:setWidth(60);
    obj.label6:setHeight(40);
    obj.label6:setFontFamily("Nyala");
    obj.label6:setFontColor("Black");
    obj.label6:setFontSize(20);
    obj.label6:setText("Cura");
    obj.label6:setName("label6");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(230);
    obj.edit4:setTop(355);
    obj.edit4:setWidth(70);
    obj.edit4:setHeight(30);
    obj.edit4:setType("number");
    obj.edit4:setField("CuraHabilidade1");
    obj.edit4:setName("edit4");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(60);
    obj.label7:setTop(400);
    obj.label7:setWidth(120);
    obj.label7:setHeight(40);
    obj.label7:setFontFamily("Nyala");
    obj.label7:setFontColor("Black");
    obj.label7:setFontSize(20);
    obj.label7:setText("Custo");
    obj.label7:setName("label7");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(115);
    obj.edit5:setTop(405);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(30);
    obj.edit5:setType("number");
    obj.edit5:setField("CustoHabilidade");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(400);
    obj.edit6:setTop(380);
    obj.edit6:setWidth(40);
    obj.edit6:setHeight(30);
    obj.edit6:setVisible(false);
    obj.edit6:setType("number");
    obj.edit6:setField("Custo2");
    obj.edit6:setName("edit6");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(180);
    obj.label8:setTop(400);
    obj.label8:setWidth(120);
    obj.label8:setHeight(40);
    obj.label8:setFontFamily("Nyala");
    obj.label8:setFontColor("Black");
    obj.label8:setFontSize(20);
    obj.label8:setText("Tipo");
    obj.label8:setName("label8");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(230);
    obj.comboBox1:setTop(413);
    obj.comboBox1:setWidth(70);
    obj.comboBox1:setHeight(18);
    obj.comboBox1:setField("DanoAtributo1");
    obj.comboBox1:setItems({'PA', 'PM', 'PF', 'Cura', 'Cura Fixa', 'Fixo', 'BUFF', 'M/PA', 'M/PM', 'M/PF'});
    obj.comboBox1:setName("comboBox1");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setLeft(310);
    obj.label9:setTop(400);
    obj.label9:setWidth(60);
    obj.label9:setHeight(40);
    obj.label9:setFontFamily("Nyala");
    obj.label9:setFontColor("Black");
    obj.label9:setFontSize(20);
    obj.label9:setText("Level");
    obj.label9:setName("label9");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(350);
    obj.button1:setTop(405);
    obj.button1:setWidth(16);
    obj.button1:setHeight(30);
    obj.button1:setText("-");
    obj.button1:setName("button1");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setLeft(366);
    obj.edit7:setTop(405);
    obj.edit7:setWidth(27);
    obj.edit7:setHeight(30);
    obj.edit7:setCanFocus(true);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setHitTest(true);
    obj.edit7:setType("number");
    obj.edit7:setField("LevelHabilidade");
    obj.edit7:setName("edit7");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(393);
    obj.button2:setTop(405);
    obj.button2:setWidth(16);
    obj.button2:setHeight(30);
    obj.button2:setText("+");
    obj.button2:setName("button2");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle1);
    obj.label10:setLeft(60);
    obj.label10:setTop(420);
    obj.label10:setWidth(120);
    obj.label10:setHeight(40);
    obj.label10:setFontFamily("Nyala");
    obj.label10:setFontColor("Black");
    obj.label10:setFontSize(20);
    obj.label10:setText("CD");
    obj.label10:setName("label10");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setLeft(90);
    obj.edit8:setTop(425);
    obj.edit8:setWidth(40);
    obj.edit8:setHeight(30);
    obj.edit8:setType("number");
    obj.edit8:setField("CDHabilidade");
    obj.edit8:setName("edit8");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle1);
    obj.label11:setLeft(135);
    obj.label11:setTop(420);
    obj.label11:setWidth(120);
    obj.label11:setHeight(40);
    obj.label11:setFontFamily("Nyala");
    obj.label11:setFontColor("Black");
    obj.label11:setFontSize(20);
    obj.label11:setText("Recarga");
    obj.label11:setName("label11");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setLeft(210);
    obj.edit9:setTop(425);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(30);
    obj.edit9:setType("number");
    obj.edit9:setField("RecargaHabilidade");
    obj.edit9:setName("edit9");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle1);
    obj.label12:setLeft(255);
    obj.label12:setTop(420);
    obj.label12:setWidth(120);
    obj.label12:setHeight(40);
    obj.label12:setVisible(false);
    obj.label12:setFontFamily("Nyala");
    obj.label12:setFontColor("Black");
    obj.label12:setFontSize(20);
    obj.label12:setText("CONTA");
    obj.label12:setName("label12");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setLeft(325);
    obj.edit10:setTop(425);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(30);
    obj.edit10:setVisible(false);
    obj.edit10:setType("number");
    obj.edit10:setField("ContaRecarga");
    obj.edit10:setName("edit10");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle1);
    obj.label13:setLeft(220);
    obj.label13:setTop(450);
    obj.label13:setWidth(120);
    obj.label13:setHeight(40);
    obj.label13:setFontFamily("Nyala");
    obj.label13:setFontColor("blue");
    obj.label13:setFontSize(20);
    obj.label13:setText("Intensidade");
    obj.label13:setName("label13");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setLeft(330);
    obj.edit11:setTop(455);
    obj.edit11:setWidth(80);
    obj.edit11:setHeight(30);
    obj.edit11:setEnabled(false);
    obj.edit11:setFontColor("Red");
    obj.edit11:setType("number");
    obj.edit11:setField("Hintensidade1");
    obj.edit11:setName("edit11");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setLeft(60);
    obj.image2:setTop(420);
    obj.image2:setWidth(150);
    obj.image2:setHeight(150);
    obj.image2:setSRC("/imagens/magia.png");
    obj.image2:setName("image2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(250);
    obj.button3:setTop(510);
    obj.button3:setFontColor("red");
    obj.button3:setText("Apagar!");
    obj.button3:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button3:setWidth(150);
    obj.button3:setName("button3");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle1);
    obj.edit12:setWidth(120);
    obj.edit12:setVisible(false);
    obj.edit12:setField("naoEBuff");
    obj.edit12:setName("edit12");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj);
    obj.image3:setLeft(440);
    obj.image3:setTop(30);
    obj.image3:setWidth(100);
    obj.image3:setHeight(100);
    obj.image3:setSRC("/imagens/TAGS/AtaqueBasic.png");
    obj.image3:setName("image3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj);
    obj.button4:setLeft(440);
    obj.button4:setTop(30);
    obj.button4:setWidth(100);
    obj.button4:setHeight(100);
    obj.button4:setOpacity(0.1);
    obj.button4:setName("button4");


        
        -- Inicializa as ações e índices se não estiverem definidos
        if sheet then
            if not sheet.acoes then
                sheet.acoes = {"Ação De Buff", "Ação de Ataque", "Ação de Defesa"}
            end

            if sheet.AcaoAtualIndex == nil then
                sheet.AcaoAtualIndex = 1
            end

            if sheet.JogadorAtualIndex == nil then
                sheet.JogadorAtualIndex = 1
            end
        end

        -- Função para finalizar turno de Buff
        function finalizarBuff()
            local minhaMesa = Firecast.getRoomOf(sheet)
            local chat = minhaMesa.chat
            chat:enviarNarracao("Turno de Buff finalizado por " .. sheet.nome)
            -- Adicione aqui o código necessário para processar o fim do turno de Buff
        end

        -- Função para finalizar turno de Ataque
        function finalizarAtaque()
            local minhaMesa = Firecast.getRoomOf(sheet)
            local chat = minhaMesa.chat
            chat:enviarNarracao("Turno de Ataque finalizado por " .. sheet.nome)
            -- Adicione aqui o código necessário para processar o fim do turno de Ataque
        end

        -- Função para finalizar turno de Defesa
        function finalizarDefesa()
            local minhaMesa = Firecast.getRoomOf(sheet)
            local chat = minhaMesa.chat
            chat:enviarNarracao("Turno de Defesa finalizado por " .. sheet.nome)
            -- Adicione aqui o código necessário para processar o fim do turno de Defesa
        end

        -- Função para lidar com a seleção do inimigo
        function selecionarInimigo()
            local inimigoSelecionado = cmbInimigos.text
            local minhaMesa = Firecast.getRoomOf(sheet)
            local chat = minhaMesa.chat
            chat:enviarNarracao(sheet.nome .. " selecionou " .. inimigoSelecionado)
            -- Adicione aqui o código necessário para processar a seleção do inimigo
        end

        
    


    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AtivaBuff == true then
            							self.btnFinalizarBuff.enabled = true
            					    end
            						
            						if sheet.AtivaAtaque == true then
            							self.btnFinalizarAtaque.enabled = true
            					    end
            						
            						if sheet.AtivaDefesa == true then
            							self.btnFinalizarDefesa.enabled = true
            					    end
            						
            						if sheet.AtivaBuff == false then
            							self.btnFinalizarBuff.enabled = false
            					    end
            						
            						if sheet.AtivaAtaque == false then
            							self.btnFinalizarAtaque.enabled = false
            					    end
            						
            						if sheet.AtivaDefesa == false then
            							self.btnFinalizarDefesa.enabled = false
            					    end
        end);

    obj._e_event1 = obj.btnFinalizarBuff:addEventListener("onClick",
        function (event)
            if sheet.AtivaBuff == true then
            							sheet.AtivaBuff = false
            					    end
        end);

    obj._e_event2 = obj.btnFinalizarAtaque:addEventListener("onClick",
        function (event)
            if sheet.AtivaAtaque == true then
            							sheet.AtivaAtaque = false
            					    end
        end);

    obj._e_event3 = obj.btnFinalizarDefesa:addEventListener("onClick",
        function (event)
            if sheet.AtivaDefesa == true then
            							sheet.AtivaDefesa = false
            					    end	
            
            						sheet.AtivaBuff = true
            						sheet.AtivaAtaque = true 					
            						sheet.AtivaDefesa = true
        end);

    obj._e_event4 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if self.rclListaDosItens3.selectedNode then
            						local node = self.rclListaDosItens3.selectedNode; 
            						self.ListaJutsus3.node = node;                       
            						self.ListaJutsus3.visible = (node ~= nil);
            
            						if self.cmbTipoGrupo.value == "1" then
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            								
            								lista = {}
            
            								local function obterNomesRecursivoCMB1(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            
            									
            									
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivoCMB1(bibItemFilho) or "";
            
            										if nomesDoFilho == "Sistema de Combaate Velen" then
            											-- Obter ID do personagem Loan
            											local idPersonagem = bibItemFilho;
            
            											-- Solicita acesso à ficha do personagem
            											local promise = bibItemFilho:asyncOpenNDB();
            
            											-- Aguarda até que a ficha esteja carregada
            											local nodeExterno = await(promise);
            											
            											local nodesO = ndb.getChildNodes(nodeExterno.NomeOponentes)											
            											
            											for _, node in ipairs(nodesO) do
            												if node.NomeDoOponenteVez then  -- Verifica se o campo NomeDoOponenteVez existe
            													table.insert(lista, node.NomeDoOponenteVez)  -- Adiciona o valor do campo NomeDoOponenteVez à lista
            													
            												end
            											end
            											
            											table.sort(lista)
            											
            										end
            									end
            									return nomes
            								end
            
            								
            
            								local function atualizarComboBox()
            									local comboBox = self.cmbInimigos
            									comboBox.items = lista
            									comboBox.values = lista
            									comboBox.value = lista[1] or ""
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivoCMB1(bibliotecaAtual);
            								atualizarComboBox()
            							end
            
            							if self.cmbTipoGrupo.value == "2" then
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            								
            								lista = {}
            
            								local function obterNomesRecursivoCMB2(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            									
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivoCMB2(bibItemFilho) or "";
            
            										if nomesDoFilho == "Sistema de Combaate Velen" then
            											-- Obter ID do personagem Loan
            											local idPersonagem = bibItemFilho;
            
            											-- Solicita acesso à ficha do personagem
            											local promise = bibItemFilho:asyncOpenNDB();
            
            											-- Aguarda até que a ficha esteja carregada
            											local nodeExterno = await(promise);
            											
            											local nodesJ = ndb.getChildNodes(nodeExterno.NomeJogador)
            											
            											for _, node in ipairs(nodesJ) do
            												if node.NomeDoPersonagemVez then  -- Verifica se o campo NomeDoPersonagemVez existe
            													table.insert(lista, node.NomeDoPersonagemVez)  -- Adiciona o valor do campo NomeDoPersonagemVez à lista
            												end
            											end
            											
            											table.sort(lista)
            											
            										end
            									end
            									return nomes
            								end
            
            								local function atualizarComboBox()
            									local comboBox = self.cmbInimigos
            									comboBox.items = lista
            									comboBox.values = lista
            									comboBox.value = lista[1] or ""  -- Defina o primeiro item como selecionado por padrão
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivoCMB2(bibliotecaAtual);
            								atualizarComboBox()
            							end;
            
            											if node.DanoAtributo1 == 'Cura' or node.DanoAtributo1 == 'Cura Fixa' then
            												if self.cmbTipoGrupo.value == "1" then
            												local mesas = rrpg.getRooms();
            												local bibliotecaAtual = mesas[1].library;
            												
            												lista = {}
            
            												local function obterNomesRecursivoH(bibItem)
            													local itensFilhos = bibItem.children;
            													local nomes = bibItem.name;
            
            													
            													
            													for i = 1, #itensFilhos, 1 do
            														local bibItemFilho = itensFilhos[i];
            														local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            														if nomesDoFilho == "Sistema de Combaate Velen" then
            															-- Obter ID do personagem Loan
            															local idPersonagem = bibItemFilho;
            
            															-- Solicita acesso à ficha do personagem
            															local promise = bibItemFilho:asyncOpenNDB();
            
            															-- Aguarda até que a ficha esteja carregada
            															local nodeExterno = await(promise);
            															
            															local nodesO = ndb.getChildNodes(nodeExterno.NomeJogador)								
            															
            															for _, node in ipairs(nodesO) do
            																if node.NomeDoPersonagemVez then  -- Verifica se o campo NomeDoPersonagemVez existe
            																	table.insert(lista, node.NomeDoPersonagemVez)  -- Adiciona o valor do campo NomeDoPersonagemVez à lista
            																end
            															end
            															
            															table.sort(lista)
            															
            														end
            													end
            													return nomes
            												end
            
            												
            
            												local function atualizarComboBoxH()
            													local comboBox = self.cmbInimigos
            													comboBox.items = lista
            													comboBox.values = lista
            													comboBox.value = lista[1] or ""
            												end
            
            												local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            												atualizarComboBoxH()
            											end
            
            											if self.cmbTipoGrupo.value == "2" then
            												local mesas = rrpg.getRooms();
            												local bibliotecaAtual = mesas[1].library;
            												
            												lista = {}
            
            												local function obterNomesRecursivoH(bibItem)
            													local itensFilhos = bibItem.children;
            													local nomes = bibItem.name;
            													
            													for i = 1, #itensFilhos, 1 do
            														local bibItemFilho = itensFilhos[i];
            														local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            														if nomesDoFilho == "Sistema de Combaate Velen" then
            															-- Obter ID do personagem Loan
            															local idPersonagem = bibItemFilho;
            
            															-- Solicita acesso à ficha do personagem
            															local promise = bibItemFilho:asyncOpenNDB();
            
            															-- Aguarda até que a ficha esteja carregada
            															local nodeExterno = await(promise);
            															
            															local nodesJ = ndb.getChildNodes(nodeExterno.NomeJogador)
            															
            															for _, node in ipairs(nodesJ) do
            																
            																if node.NomeDoOponenteVez then  -- Verifica se o campo NomeDoOponenteVez existe
            																	table.insert(lista, node.NomeDoOponenteVez)  -- Adiciona o valor do campo NomeDoOponenteVez à lista
            																	
            																end
            															end
            															
            															table.sort(lista)
            															
            														end
            													end
            													return nomes
            												end
            
            												local function atualizarComboBoxH()
            													local comboBox = self.cmbInimigos
            													comboBox.items = lista
            													comboBox.values = lista
            													comboBox.value = lista[1] or ""  -- Defina o primeiro item como selecionado por padrão
            												end
            
            												local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            												atualizarComboBoxH()
            											end;
            					else
            					end;
            				end;
        end);

    obj._e_event5 = obj.rclListaDosItens3:addEventListener("onSelect",
        function ()
            globalForm = self;
            				fieldficha = sheet;
            				nodeSelecionado = self.rclListaDosItens3.selectedNode; 
            				if node then
            					nodeSelecionado = node; -- Salva o nó selecionado no `sheet`.
            				end
            
            				local node = self.rclListaDosItens3.selectedNode; 
            				self.ListaJutsus3.node = node;                       
            				self.ListaJutsus3.visible = (node ~= nil);
            
            				if self.ListaJutsus3.visible == true then
            					self.ListaJutsus3.node.NomeHabilidade = self.ListaJutsus3.node.NomeHabilidade or 'Nome da Habilidade';
            					self.ListaJutsus3.node.DescriHabilidade1 = self.ListaJutsus3.node.DescriHabilidade1 or 'Descrição da Habilidade';
            					self.ListaJutsus3.node.DanoHabilidade1 = tonumber(self.ListaJutsus3.node.DanoHabilidade1) or 0;
            					self.ListaJutsus3.node.FixoHabilidade1 = tonumber(self.ListaJutsus3.node.FixoHabilidade1) or 0;
            					self.ListaJutsus3.node.CuraHabilidade1 = tonumber(self.ListaJutsus3.node.CuraHabilidade1) or 0;
            					self.ListaJutsus3.node.CustoHabilidade =tonumber( self.ListaJutsus3.node.CustoHabilidade) or 0;
            					self.ListaJutsus3.node.DanoAtributo1 = self.ListaJutsus3.node.DanoAtributo1 or 'Escolha';
            					self.ListaJutsus3.node.Hintensidade1 = tonumber(self.ListaJutsus3.node.Hintensidade1) or 0;	
            					self.ListaJutsus3.node.LevelHabilidade = tonumber(self.ListaJutsus3.node.LevelHabilidade) or 0;	
            					self.ListaJutsus3.node.CDHabilidade = tonumber(self.ListaJutsus3.node.CDHabilidade) or 0;	
            					self.ListaJutsus3.node.RecargaHabilidade = tonumber(self.ListaJutsus3.node.RecargaHabilidade) or 0;	
            					self.ListaJutsus3.node.ContaRecarga = tonumber(self.ListaJutsus3.node.ContaRecarga) or 0;	
            					self.ListaJutsus3.node.TurnoAtual = tonumber(self.ListaJutsus3.node.TurnoAtual) or 0;
            				end;
            
            				local mesas = rrpg.getRooms();
            				local bibliotecaAtual = mesas[1].library;
            				
            				local function obterNomesRecursivoH(bibItem)
            					local itensFilhos = bibItem.children;
            					local nomes = bibItem.name;
            					
            					for i = 1, #itensFilhos, 1 do
            						local bibItemFilho = itensFilhos[i];
            						local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            						if nomesDoFilho == "Sistema de Combaate Velen" then
            							-- Obter ID do personagem Loan
            							local idPersonagem = bibItemFilho;
            
            							-- Solicita acesso à ficha do personagem
            							local promise = bibItemFilho:asyncOpenNDB();
            
            							-- Aguarda até que a ficha esteja carregada
            							local nodeExterno = await(promise);
            
            							if nodeExterno.TurnoAtualControle ~= nil and nodeExterno.TurnoAtualControle ~= "" then
            								self.ListaJutsus3.node.TurnoAtual = tonumber(nodeExterno.TurnoAtualControle)
            							end;
            
            						end
            					end
            					return nomes
            				end
            
            				if self.ListaJutsus3.node.TurnoAtual == 0 then 
            					self.ListaJutsus3.node.ContaRecarga = 0
            					self.ListaJutsus3.node.RecargaHabilidade = 0
            				end;
            
            				local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            
            				if self.ListaJutsus3.node.ContaRecarga ~= nil and self.ListaJutsus3.node.ContaRecarga ~= "" and self.ListaJutsus3.node.ContaRecarga > 0 then
            					self.ListaJutsus3.node.RecargaHabilidade = tonumber(self.ListaJutsus3.node.ContaRecarga) + tonumber(self.ListaJutsus3.node.CDHabilidade) + 1 -  tonumber(self.ListaJutsus3.node.TurnoAtual)
            				end;
            
            				if  0 > self.ListaJutsus3.node.RecargaHabilidade then
            					self.ListaJutsus3.node.RecargaHabilidade = 0
            				end;
        end);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (event)
            local node = self.ListaJutsus3.node;
            						sheet.PontoHabilidade = tonumber(sheet.PontoHabilidade) or 0;
            						node.LevelHabilidade = tonumber(node.LevelHabilidade) or 0;
            						
            						if node.LevelHabilidade > 0 then 
            							node.LevelHabilidade = tonumber(node.LevelHabilidade) - 1;
            							sheet.PontoHabilidade = tonumber(sheet.PontoHabilidade) + 1;
            						else
            							showMessage("Voce não pode reduzir mais o nivel da sua Habilidade");
            						end;
        end);

    obj._e_event7 = obj.button2:addEventListener("onClick",
        function (event)
            local node = self.ListaJutsus3.node;
            						sheet.PontoHabilidade = tonumber(sheet.PontoHabilidade) or 0;
            						node.LevelHabilidade = tonumber(node.LevelHabilidade) or 0;
            						
            						if sheet.PontoHabilidade > 0 then 
            							if 4 >= node.LevelHabilidade then
            								node.LevelHabilidade = tonumber(node.LevelHabilidade) + 1;
            								sheet.PontoHabilidade = tonumber(sheet.PontoHabilidade) - 1;
            							else
            								showMessage("Sua habilidade chegou ao nivel Maximo");
            							end;
            						else							
            							showMessage("Voce não te mais pontos de Habilidade para Destribuir");
            						end;
        end);

    obj._e_event8 = obj.button3:addEventListener("onClick",
        function (event)
            NDB.deleteNode(self.ListaJutsus3.node);
        end);

    obj._e_event9 = obj.button4:addEventListener("onClick",
        function (event)
            local node = self.rclListaDosItens3.selectedNode; 
            				self.ListaJutsus3.node = node;                       
            				Dialogs.confirmYesNo("Deseja causar ATAQUE BASICO no " .. self.cmbInimigos.value,
            				function (confirmado)
            					if confirmado then
            						AtaqueBasico()
            					else
            					end;
            				end);
        end);

    function obj:_releaseEvents()
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

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.ListaJutsus3 ~= nil then self.ListaJutsus3:destroy(); self.ListaJutsus3 = nil; end;
        if self.btnFinalizarAtaque ~= nil then self.btnFinalizarAtaque:destroy(); self.btnFinalizarAtaque = nil; end;
        if self.cmbTipoGrupo ~= nil then self.cmbTipoGrupo:destroy(); self.cmbTipoGrupo = nil; end;
        if self.NameTipoDeGrupo ~= nil then self.NameTipoDeGrupo:destroy(); self.NameTipoDeGrupo = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.cmbInimigos ~= nil then self.cmbInimigos:destroy(); self.cmbInimigos = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.imghability ~= nil then self.imghability:destroy(); self.imghability = nil; end;
        if self.rclListaDosItens3 ~= nil then self.rclListaDosItens3:destroy(); self.rclListaDosItens3 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.areaDeAcoes ~= nil then self.areaDeAcoes:destroy(); self.areaDeAcoes = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.btnFinalizarDefesa ~= nil then self.btnFinalizarDefesa:destroy(); self.btnFinalizarDefesa = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.btnFinalizarBuff ~= nil then self.btnFinalizarBuff:destroy(); self.btnFinalizarBuff = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.TargetName ~= nil then self.TargetName:destroy(); self.TargetName = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmActionBar()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmActionBar();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmActionBar = {
    newEditor = newfrmActionBar, 
    new = newfrmActionBar, 
    name = "frmActionBar", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmActionBar = _frmActionBar;
Firecast.registrarForm(_frmActionBar);

return _frmActionBar;
