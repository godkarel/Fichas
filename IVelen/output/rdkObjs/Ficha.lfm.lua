require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmIVelen()
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
    obj:setDataType("com.InimigoVelen");
    obj:setTitle("Velen 4 Inimigos");
    obj:setName("frmIVelen");

		
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
	



	


		
		function calcularDanoFisico(level)
			level = tonumber(level)
			if level <= 10 then
				return 34 + (level - 1) * 10 -- Crescimento linear simples para os níveis iniciais
			elseif level <= 20 then
				return 128 + (level - 10) * 12 -- Crescimento moderado
			else
				return 252 + (level - 20) * 12 -- Crescimento mais linear
			end		
		end;
	



	



	


		
		function calcularDanoMagico(level)
			local danoFisico = calcularDanoFisico(level) -- Usando a função de dano físico como base
			return math.floor(danoFisico * 1.1) -- Aumentando o dano em 10% e arredondando para o inteiro mais próximo
		end
	



	



	


		
		function ajusteFinal()
			if self.cmbRacaBoss.value == "1" then
				ajusteBesta();
			end;

			if self.cmbRacaBoss.value == "2" then
				ajusteDesertico();
			end;

			if self.cmbRacaBoss.value == "3" then
				ajusteElementais();
			end;

			if self.cmbRacaBoss.value == "4" then
				ajusteFeras();
			end;

			if self.cmbRacaBoss.value == "5" then
				ajusteGolens();
			end;

			if self.cmbRacaBoss.value == "6" then
				ajusteMaritimo();
			end;

			if self.cmbRacaBoss.value == "7" then
				ajusteMortosVivos();
			end;


			if self.cmbPoderNPC.value == "1" then
				ajusteForte()
			end;

			if self.cmbPoderNPC.value == "2" then
				
			end;

			if self.cmbPoderNPC.value == "3" then
				ajusteFraco()
			end;
		end;

		function ajusteBesta()
			local chance = math.random(1, 10)				
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.HPTotal = math.floor(sheet.HPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)    
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10,
					0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.20
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.MPTotal = math.floor(sheet.MPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.acerto
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.acerto = sheet.acerto + ajuste  -- Aplicando o ajuste
			end

			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Dano = math.floor(sheet.Dano * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.DanoMagico = math.floor(sheet.DanoMagico * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end
		end;

		function ajusteDesertico()
			local chance = math.random(1, 10)    
			if chance > 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10,
					0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.20,
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Defesa = math.floor(sheet.Defesa * (1 + ajuste * 2))  -- Aplicando o ajuste ao HP
			end
			local chance = math.random(1, 10)    
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10,
					0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.20,
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Resistencia = math.floor(sheet.Resistencia * (1 + ajuste * 2))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10) 
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.HPTotal = math.floor(sheet.HPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.Persistencia
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.Persistencia = sheet.Persistencia + ajuste  -- Aplicando o ajuste
			end

		end;

		function ajusteElementais()
			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Dano = math.floor(sheet.Dano * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.DanoMagico = math.floor(sheet.DanoMagico * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.acerto
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.acerto = sheet.acerto + ajuste  -- Aplicando o ajuste
			end

			local chance = math.random(1, 10)				
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.HPTotal = math.floor(sheet.HPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)    
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10,
					0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.20,
					0.21, 0.22, 0.23, 0.24, 0.25, 0.26, 0.27, 0.28, 0.29, 0.30
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.MPTotal = math.floor(sheet.MPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.AcertoMagico
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.AcertoMagico = sheet.AcertoMagico + ajuste  -- Aplicando o ajuste
			end

		end;

		function ajusteFeras()
			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.HPTotal = math.floor(sheet.HPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.acerto
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.acerto = sheet.acerto + ajuste  -- Aplicando o ajuste
			end

			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Dano = math.floor(sheet.Dano * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

		end;

		function ajusteGolens()
			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10,
					0.11, 0.12, 0.13, 0.14, 0.15					
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.HPTotal = math.floor(sheet.HPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.acerto
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.acerto = sheet.acerto + ajuste  -- Aplicando o ajuste
			end

			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					
					0.01, 0.02, 0.03, 0.04, 0.05
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Dano = math.floor(sheet.Dano * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.Persistencia
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.Persistencia = sheet.Persistencia + ajuste  -- Aplicando o ajuste
			end

			local chance = math.random(1, 10)    
			if chance > 5 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Defesa = math.floor(sheet.Defesa * (1 + ajuste * 2))  -- Aplicando o ajuste ao HP
			end
			local chance = math.random(1, 10)    
			if chance > 5 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10,
					0.11, 0.12, 0.13, 0.14, 0.15	
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Resistencia = math.floor(sheet.Resistencia * (1 + ajuste * 2))  -- Aplicando o ajuste ao HP
			end
		end;

		function ajusteMaritimo()
			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.HPTotal = math.floor(sheet.HPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)    
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10,
					0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.20
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.MPTotal = math.floor(sheet.MPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.05, -0.04, -0.03, -0.02, -0.01, 0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Resistencia = math.floor(sheet.Resistencia * (1 + ajuste * 2))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.AcertoMagico
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.AcertoMagico = sheet.AcertoMagico + ajuste  -- Aplicando o ajuste
			end

			local chance = math.random(1, 10)			
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.DanoMagico = math.floor(sheet.DanoMagico * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

		end;

		function ajusteMortosVivos()
			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.HPTotal = math.floor(sheet.HPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10,
					0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.20
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.MPTotal = math.floor(sheet.MPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.acerto
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.acerto = sheet.acerto + ajuste  -- Aplicando o ajuste
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.AcertoMagico
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.AcertoMagico = sheet.AcertoMagico + ajuste  -- Aplicando o ajuste
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório de -1 ou +1 no sheet.Persistencia
				local ajuste = math.random() < 0.5 and -1 or 1  -- -1 ou +1
				sheet.Persistencia = sheet.Persistencia + ajuste  -- Aplicando o ajuste
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Dano = math.floor(sheet.Dano * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)
			if chance == 3 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.10, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01,
					0, 
					0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.10
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.DanoMagico = math.floor(sheet.DanoMagico * (1 + ajuste))  -- Aplicando o ajuste ao HP
			end

			local chance = math.random(1, 10)    
			if chance > 2 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.05, -0.04, -0.03, -0.02, -0.01, 0, 
					0.01, 0.02, 0.03, 0.04, 0.05
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Defesa = math.floor(sheet.Defesa * (1 + ajuste * 2))  -- Aplicando o ajuste ao HP
			end
			local chance = math.random(1, 10)    
			if chance > 2 then
				-- Ajuste aleatório entre -10% a +10%
				local ajustes = {
					-0.05, -0.04, -0.03, -0.02, -0.01, 0, 
					0.01, 0.02, 0.03, 0.04, 0.05
				}
				local ajuste = ajustes[math.random(#ajustes)]
				sheet.Resistencia = math.floor(sheet.Resistencia * (1 + ajuste * 2))  -- Aplicando o ajuste ao HP
			end
		end;

		function ajusteForte()
			-- Ajuste aleatório entre -10% a +10%
			local ajustes = {
				0.05, 0.06, 0.07, 0.08, 0.09, 0.10
			}
			local ajuste = ajustes[math.random(#ajustes)]
			sheet.Dano = math.floor(sheet.Dano * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.DanoMagico = math.floor(sheet.DanoMagico * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.Acerto = math.floor(sheet.Acerto * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.AcertoMagico = math.floor(sheet.AcertoMagico * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.Esquiva = math.floor(sheet.Esquiva * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.Persistencia = math.floor(sheet.Persistencia * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.Defesa = math.floor(sheet.Defesa * (1 + ajuste * 2))  -- Aplicando o ajuste ao HP
			sheet.Resistencia = math.floor(sheet.Resistencia * (1 + ajuste * 2))  -- Aplicando o ajuste ao HP
			sheet.HPTotal = math.floor(sheet.HPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.MPTotal = math.floor(sheet.MPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP

			
		end;

		function ajusteFraco()
			-- Ajuste aleatório entre -10% a +10%
			local ajustes = {
				-0.05, -0.06, -0.07, -0.08, -0.09, -0.10
			}
			local ajuste = ajustes[math.random(#ajustes)]
			sheet.Dano = math.floor(sheet.Dano * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.DanoMagico = math.floor(sheet.DanoMagico * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.Defesa = math.floor(sheet.Defesa * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.Resistencia = math.floor(sheet.Resistencia * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.HPTotal = math.floor(sheet.HPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP
			sheet.MPTotal = math.floor(sheet.MPTotal * (1 + ajuste))  -- Aplicando o ajuste ao HP

		end;

	



	



	


		
		function calcularChancesCriador(level, race)
			if race == '1' then
				sheet.Acerto = 1 + math.floor(tonumber(level / 10))
				sheet.Esquiva = 11 + math.floor(tonumber(level / 15))
				sheet.AcertoMagico = 14 + math.floor(tonumber(level / 10))
				sheet.Critical = 20 - math.floor(tonumber(level / 15))
				sheet.CriticalMagico = 2 + math.floor(tonumber(level / 15))
				sheet.Persistencia = 1 + math.floor(tonumber(level / 15))
			end;
			if race == '2' then
				sheet.Acerto = 1 + math.floor(tonumber(level / 10))
				sheet.Esquiva = 10 + math.floor(tonumber(level / 15))
				sheet.AcertoMagico = 14 + math.floor(tonumber(level / 10))
				sheet.Critical = 20 - math.floor(tonumber(level / 15))
				sheet.CriticalMagico = 1 + math.floor(tonumber(level / 15))
				sheet.Persistencia = 2 + math.floor(tonumber(level / 15))
			end;
			if race == '3' then
				sheet.Acerto = 1 + math.floor(tonumber(level / 10))
				sheet.Esquiva = 10 + math.floor(tonumber(level / 15))
				sheet.AcertoMagico = 14 + math.floor(tonumber(level / 10))
				sheet.Critical = 20 - math.floor(tonumber(level / 15))
				sheet.CriticalMagico = 2 + math.floor(tonumber(level / 15))
				sheet.Persistencia = 3 + math.floor(tonumber(level / 15))
			end;
			if race == '4' then
				sheet.Acerto = 2 + math.floor(tonumber(level / 10))
				sheet.Esquiva = 10 + math.floor(tonumber(level / 15))
				sheet.AcertoMagico = 14 + math.floor(tonumber(level / 10))
				sheet.Critical = 20 - math.floor(tonumber(level / 15))
				sheet.CriticalMagico = 1 + math.floor(tonumber(level / 15))
				sheet.Persistencia = 1 + math.floor(tonumber(level / 15))
			end;
			if race == '6' then
				sheet.Acerto = 1 + math.floor(tonumber(level / 10))
				sheet.Esquiva = 10 + math.floor(tonumber(level / 15))
				sheet.AcertoMagico = 15 + math.floor(tonumber(level / 10))
				sheet.Critical = 19 - math.floor(tonumber(level / 15))
				sheet.CriticalMagico = 1 + math.floor(tonumber(level / 15))
				sheet.Persistencia = 1 + math.floor(tonumber(level / 15))
			end;
			if race == '7' then
				sheet.Acerto = 2 + math.floor(tonumber(level / 10))
				sheet.Esquiva = 11 + math.floor(tonumber(level / 15))
				sheet.AcertoMagico = 15 + math.floor(tonumber(level / 10))
				sheet.Critical = 19 - math.floor(tonumber(level / 15))
				sheet.CriticalMagico = 2 + math.floor(tonumber(level / 15))
				sheet.Persistencia = 2 + math.floor(tonumber(level / 15))
			end;
			if race == '5' then
				sheet.Acerto = 2 + math.floor(tonumber(level / 10))
				sheet.Esquiva = 10 + math.floor(tonumber(level / 15))
				sheet.AcertoMagico = 14 + math.floor(tonumber(level / 10))
				sheet.Critical = 20 - math.floor(tonumber(level / 15))
				sheet.CriticalMagico = 1 + math.floor(tonumber(level / 15))
				sheet.Persistencia = 5
			end;
		end;
	



	



	


		
		function calcularDefCriador(level)
				local divisores = {
				[30] = 6, [29] = 5.6, [28] = 5.3, [27] = 5, [26] = 4.75,
				[25] = 4.6, [24] = 4.3, [23] = 4, [22] = 3.8, [21] = 3.6,
				[20] = 3.4, [19] = 3.2, [18] = 3, [17] = 2.7, [16] = 2.55,
				[15] = 2.4, [14] = 2.2, [13] = 2, [12] = 1.8, [11] = 1.65,
				[10] = 1.55, [9] = 1.35, [8] = 1.25, [7] = 1, [6] = 0.9,
				[5] = 0.8, [4] = 0.65, [3] = 0.47, [2] = 0.37, [1] = 0.25
			}

			-- Verifica se o nível está dentro do intervalo permitido
			if not divisores[level] then
				showMessage("Erro: Nível do NPC fora do intervalo permitido (1 a 30).")
				return nil
			end

			-- Seleciona um valor aleatório para a redução de dano entre 9% e 16%
			local reducaoPercentual = math.random(12, 17)

			-- Calcula a defesa necessária para atingir a redução de dano desejada
			local divisor = divisores[level]
			local defesaNecessaria = reducaoPercentual * divisor

			return math.floor(defesaNecessaria + 0.5) -- Retorna o valor arredondado
		end
	



	



	


		
		function calcularHPCriador(level)
			-- Tabela de HP por nível
			local hpPorNivel = {
				264, 320, 376, 432, 488, 544, 600, 656, 712, 816,
				872, 928, 984, 1040, 1096, 1160, 1224, 1312, 1416, 1456,
				2014, 2173, 2267, 2362, 2488, 2614, 2741, 2867, 3032, 3248, 3600
			}

			-- Verifica se o nível está na tabela
			if level >= 1 and level <= #hpPorNivel then
				return hpPorNivel[level]
			else
				return nil -- Retorna nil para níveis fora do intervalo
			end
		end;
	



	



	


		
		function calcularMPCriador(level)
			local mpPorNivel = {
				114, 116, 118, 120, 122, 124, 126, 128, 130, 133,
				135, 137, 139, 141, 143, 145, 147, 149, 151, 154,
				158, 160, 164, 166, 170, 172, 176, 178, 186, 186, 174
			}

			-- Verifica se o nível está na tabela
			if level >= 1 and level <= #mpPorNivel then
				return mpPorNivel[level]
			else
				return nil -- Retorna nil para níveis fora do intervalo
			end
		end;
	



	



	


		
		function calcularResCriador(level)
			local divisores = {
				[30] = 6, [29] = 5.6, [28] = 5.3, [27] = 5, [26] = 4.75,
				[25] = 4.6, [24] = 4.3, [23] = 4, [22] = 3.8, [21] = 3.6,
				[20] = 3.4, [19] = 3.2, [18] = 3, [17] = 2.7, [16] = 2.55,
				[15] = 2.4, [14] = 2.2, [13] = 2, [12] = 1.8, [11] = 1.65,
				[10] = 1.55, [9] = 1.35, [8] = 1.25, [7] = 1, [6] = 0.9,
				[5] = 0.8, [4] = 0.65, [3] = 0.47, [2] = 0.37, [1] = 0.25
			}

			-- Verifica se o nível está dentro do intervalo permitido
			if not divisores[level] then
				showMessage("Erro: Nível do NPC fora do intervalo permitido (1 a 30).")
				return nil
			end

			-- Seleciona um valor aleatório para a redução de dano entre 9% e 16%
			local reducaoPercentual = math.random(12, 17)

			-- Calcula a defesa necessária para atingir a redução de dano desejada
			local divisor = divisores[level]
			local defesaNecessaria = reducaoPercentual * divisor

			return math.floor(defesaNecessaria + 0.5) -- Retorna o valor arredondado
		end;
	



	



	


		
		function calcularDeBoss(NumeroDeAlvos)
		 -- Certifique-se de que NumeroDeAlvos é um número
			NumeroDeAlvos = tonumber(NumeroDeAlvos)
			
			if NumeroDeAlvos then
				sheet.Dano = math.floor(sheet.Dano * 1.2)
				sheet.DanoMagico = math.floor(sheet.DanoMagico * 1.2)
				sheet.Defesa = math.floor(sheet.Defesa * 1.3)
				sheet.Resistencia = math.floor(sheet.Resistencia * 1.3)
				local percentual = 0.1 + (0.1 * NumeroDeAlvos)
				sheet.HPTotal = math.floor(sheet.HPTotal * 1.2)

				sheet.HPTotal = math.floor(sheet.HPTotal) * tonumber(NumeroDeAlvos)
				sheet.HPTotal = math.floor(sheet.HPTotal * (1 + percentual))

				sheet.MPTotal = math.floor(sheet.MPTotal) * tonumber(NumeroDeAlvos)
				sheet.MPTotal = math.floor(sheet.MPTotal * (1 + percentual))

				sheet.Dano = math.floor(sheet.Dano * (1 + percentual))
				sheet.DanoMagico = math.floor(sheet.DanoMagico * (1 + percentual))
			end;
		end;
	



	



			local function AtaqueBasicoR()   
				
				if sheet.cmbTipoDeGrupoF == "1" then   
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
					if sheet.TipoAtaque == nil then
						showMessage("Escolha uma Base de Dano para seu Ataque Basico na lista acima");
					else				
						mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acerto, "[§K2]Ataque Basico",						
							function (rolado)	
							local soDado = rolado.resultado + 1 - tonumber(sheet.Acerto);
							if rolado.resultado > EsqAlvo then							
								if soDado > tonumber(sheet.Critical) then
									if sheet.TipoAtaque == 'Dano Fisico' then
										nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = math.floor((sheet.Dano * 2) * (1 - (DefAlvo / 100)))
										nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
										sheet.nodeExterno = math.floor(sheet.Dano * 2)										
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0] » CRITICAL :dinofauro:");
									elseif sheet.TipoAtaque == 'Dano Magico' then
										nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = math.floor((sheet.DanoMagico * 2) * (1 - (RESAlvo / 100)))
										nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
										sheet.nodeExterno = math.floor((sheet.DanoMagico * 2))
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Poder Magico + Poder de Ataque « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0]» CRITICAL :dinofauro:");																			
									end;	
								else
									if sheet.TipoAtaque == 'Dano Fisico' then
										nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = math.floor((sheet.Dano) * (1 - (DefAlvo / 100)))
										nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
										sheet.nodeExterno = math.floor(sheet.Dano)										
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0] »");
									elseif sheet.TipoAtaque == 'Dano Magico' then			
										nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = math.floor((sheet.DanoMagico) * (1 - (RESAlvo / 100)))
										nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
										sheet.nodeExterno = math.floor((sheet.DanoMagico))
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Poder Magico + Poder de Ataque « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0]»");
									end;							
								end;	
							else
								mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.nome) .. "[§K3] Errou o ataque no oponente");
								nodeExterno.DanoRecebido = 0
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
							end;
								
						end); 
					end;
				end;

				if sheet.cmbTipoDeGrupoF == "2" then   
						-- obter a mesa do personagem
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
					local mesas = rrpg.getRooms();
					local bibliotecaAtual = mesas[1].library;

						local function obterNomesRecursivo2(bibItem)
							local itensFilhos = bibItem.children;
							local nomes = bibItem.name;
							
							for i = 1, #itensFilhos, 1 do
								local bibItemFilho = itensFilhos[i];
								local nomesDoFilho = obterNomesRecursivo2(bibItemFilho) or "";

								if nomesDoFilho == "Sistema de Combaate Velen" then
									-- Obter ID do personagem Loan
									local idPersonagem = self.cmbInimigos.value;
									
									-- Solicita acesso à ficha do personagem
									local promise = bibItemFilho:asyncOpenNDB();

									-- Aguarda até que a ficha esteja carregada
									nodeExterno = await(promise);
									
									local nodesO = ndb.getChildNodes(nodeExterno.NomeJogador)								
									
									for _, node in ipairs(nodesO) do

										if node.NomeDoPersonagemVez == idPersonagem then  -- Verifica se o campo NomeDoPersonagemVez existe
											EsqAlvo = node.ESQ
											RESAlvo = node.RES
											DefAlvo = node.DEF
										end
									end
								end
							end
							return nomes
						end

						local nomesDeTodosOsItens = obterNomesRecursivo2(bibliotecaAtual);

						
						------------------------------------------------------------------
						
						-- se o usuário não preencheu modificador, vamos usar o valor 0
						sheet.Acerto = sheet.Acerto or 0;                        
						if sheet.TipoAtaque == nil then
							showMessage("Escolha uma Base de Dano para seu Ataque Basico na lista acima");
						else				
							mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acerto, "[§K2]Ataque Basico",						
							function (rolado)	
							local soDado = rolado.resultado + 1 - tonumber(sheet.Acerto);
							if rolado.resultado > EsqAlvo then
								if soDado > tonumber(sheet.Critical) then
									if sheet.TipoAtaque == 'Dano Fisico' then
										nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = math.floor((sheet.Dano * 2) * (1 - (DefAlvo / 100)))
										nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
										sheet.nodeExterno = math.floor(sheet.Dano * 2)										
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0] » CRITICAL :dinofauro:");
									elseif sheet.TipoAtaque == 'Dano Magico' then
										nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = math.floor((sheet.DanoMagico * 2) * (1 - (RESAlvo / 100)))
										nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
										sheet.nodeExterno = math.floor((sheet.DanoMagico * 2))
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Poder Magico + Poder de Ataque « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0]» CRITICAL :dinofauro:");																			
									end;	
								else
									if sheet.TipoAtaque == 'Dano Fisico' then
										nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = math.floor((sheet.Dano) * (1 - (DefAlvo / 100)))
										nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
										sheet.nodeExterno = math.floor(sheet.Dano)										
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0] »");
									elseif sheet.TipoAtaque == 'Dano Magico' then			
										nodeExterno.AlvoRecebido = self.cmbInimigos.value
										nodeExterno.GrupoRecebido = self.cmbTipoGrupo.value
										nodeExterno.DanoRecebido = math.floor((sheet.DanoMagico) * (1 - (RESAlvo / 100)))
										nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
										sheet.nodeExterno = math.floor((sheet.DanoMagico))
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Poder Magico + Poder de Ataque « [§K4,0] " .. (nodeExterno.DanoRecebido) .. " [§K9,0]»");
									end;							
								end;	
							else
								mesaDoPersonagem.chat:enviarMensagem("[§K3]O [§K4]" .. (sheet.nome) .. "[§K3] Errou o ataque no oponente");
								nodeExterno.DanoRecebido = 0
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)
							end;
							end); 
						end;
					end;
				end;

			
        



		local function MecanicaDinamica(TipoMecanica, DanoMecanica, CuraMecanica, FixoMecanica, DescriMecanica, FalhaMecanica, CustoMecanica, CDMecanica, IntensidadeMecanica, cbxMeca) 
		--[[ MECANICA 1 ]]--	
		local mesaDoPersonagem = Firecast.getMesaDe(sheet);
		local mesas = rrpg.getRooms();
		local bibliotecaAtual = mesas[1].library;

		if self.cmbTipoGrupoHM.value == "1" then 
			local function obterNomesRecursivoHM1(bibItem)
			local itensFilhos = bibItem.children;
			local nomes = bibItem.name;
			
			for i = 1, #itensFilhos, 1 do
				local bibItemFilho = itensFilhos[i];
				local nomesDoFilho = obterNomesRecursivoHM1(bibItemFilho) or "";

				if nomesDoFilho == "Sistema de Combaate Velen" then
					-- Obter ID do personagem Loan
					local idPersonagem = self.cmbInimigosHM.value;
					
					-- Solicita acesso à ficha do personagem
					local promise = bibItemFilho:asyncOpenNDB();

					-- Aguarda até que a ficha esteja carregada
					nodeExterno = await(promise);
					
					local nodesO = ndb.getChildNodes(nodeExterno.NomeOponentes)
					
					
					for _, node in ipairs(nodesO) do
						if node.NomeDoOponenteVez == idPersonagem then  -- Verifica se o campo NomeDoOponenteVez existe
							DefAlvo = node.DEF
							PERAlvo = node.Pers
							RESAlvo = node.RES
						end
					end
				end
			end
			return nomes
		end

		local nomesDeTodosOsItens = obterNomesRecursivoHM1(bibliotecaAtual);

		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;	
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
		function (rolado)					
		if TipoMecanica ~= nil then
			if sheet.AcertoMagico + 1 > rolado.resultado then							
				if TipoMecanica == 'Dano' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0) + (tonumber(sheet.Dano) or 0);							
				end;			
				if TipoMecanica == 'Dano Magico' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0) + (tonumber(sheet.DanoMagico) or 0);								
				end;
				if TipoMecanica == 'Cura' then
					IntensidadeMecanica = (tonumber(CuraMecanica) or 0) + (tonumber(sheet.DanoMagico) or 0);	
				end;
				
				if TipoMecanica == 'Real' then
					IntensidadeMecanica = (tonumber(FixoMecanica) or 0);	
				end;

				if sheet.AcertoMagico >= rolado.resultado then
					if cbxMeca then
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. DescriMecanica);
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. FalhaMecanica);
					else					
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. DescriMecanica);
					end;
					if TipoMecanica == 'Cura' then
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (IntensidadeMecanica * 2 or 0) .. "[§K8,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. IntensidadeMecanica or 0 .. "[§K8,0] »");
						end;	
					else
						if TipoMecanica == 'Dano' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2) * (1 - (DefAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] »");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica) * (1 - (DefAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] »");
							end;
						end;
						if TipoMecanica == 'Dano Magico' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] »");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] »");
							end;
						end;
						if TipoMecanica == 'Real' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] » [§K3,0]Dano Real");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] » [§K3,0]Dano Real");
							end;
						end;
					end;
					sheet.MPAtual = tonumber(sheet.MPAtual) - tonumber(CustoMecanica) or 0; 
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
				end;
			else							
				mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");	
			end;
		else
			showMessage("A Habilidade ta sem tipo");
		end;
		end);					
		end;

		if self.cmbTipoGrupoHM.value == "2" then 
		local function obterNomesRecursivoHM2(bibItem)
			local itensFilhos = bibItem.children;
			local nomes = bibItem.name;
			
			for i = 1, #itensFilhos, 1 do
				local bibItemFilho = itensFilhos[i];
				local nomesDoFilho = obterNomesRecursivoHM2(bibItemFilho) or "";

				if nomesDoFilho == "Sistema de Combaate Velen" then
					-- Obter ID do personagem Loan
					local idPersonagem = self.cmbInimigosHM.value;
					
					-- Solicita acesso à ficha do personagem
					local promise = bibItemFilho:asyncOpenNDB();

					-- Aguarda até que a ficha esteja carregada
					nodeExterno = await(promise);
					
					local nodesO = ndb.getChildNodes(nodeExterno.NomeJogador)		
					
					
					for _, node in ipairs(nodesO) do
						if node.NomeDoPersonagemVez == idPersonagem then  -- Verifica se o campo NomeDoPersonagemVez existe
							PERAlvo = node.Pers
							RESAlvo = node.RES
							DefAlvo = node.DEF
						end
					end
				end
			end
			return nomes
		end

		local nomesDeTodosOsItens = obterNomesRecursivoHM2(bibliotecaAtual);

		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;	
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
		function (rolado)					
		if TipoMecanica ~= nil then
			if sheet.AcertoMagico + 1 > rolado.resultado then							
				if TipoMecanica == 'Dano' then
					sIntensidadeMecanica = (tonumber(DanoMecanica) or 0) + (tonumber(sheet.Dano) or 0);							
				end;			
				if TipoMecanica == 'Dano Magico' then
					sIntensidadeMecanica = (tonumber(DanoMecanica) or 0) + (tonumber(sheet.DanoMagico) or 0);								
				end;
				if TipoMecanica == 'Cura' then
					IntensidadeMecanica = (tonumber(CuraMecanica) or 0) + (tonumber(sheet.DanoMagico) or 0);	
				end;
				
				if TipoMecanica == 'Real' then
					IntensidadeMecanica = (tonumber(FixoMecanica) or 0);	
				end;

				if sheet.AcertoMagico >= rolado.resultado then
					if cbxMeca then
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. DescriMecanica);
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. FalhaMecanica);
					else					
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. DescriMecanica);
					end;
					if TipoMecanica == 'Cura' then
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (IntensidadeMecanica * 2 or 0) .. "[§K8,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. IntensidadeMecanica or 0 .. "[§K8,0] »");
						end;	
					else
						if TipoMecanica == 'Dano' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2) * (1 - (DefAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] »");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica) * (1 - (DefAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] »");
							end;
						end;
						if TipoMecanica == 'Dano Magico' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] »");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] »");
							end;
						end;
						if TipoMecanica == 'Real' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] » [§K3,0]Dano Real");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] » [§K3,0]Dano Real");
							end;
						end;		
					end;
					sheet.MPAtual = tonumber(sheet.MPAtual) - tonumber(CustoMecanica) or 0; 
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
				end;
			else							
				mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");	
			end;
		else
			showMessage("A Habilidade ta sem tipo");
		end;
		end);					
		end;
		end; 						
				
    



		local function UsarHabilidades(TipoMecanica, DanoMecanica, CuraMecanica, FixoMecanica, DescriMecanica, FalhaMecanica, CustoMecanica, CDMecanica, IntensidadeMecanica, cbxMeca) 
		--[[ MECANICA 1 ]]--	
		local mesaDoPersonagem = Firecast.getMesaDe(sheet);
		local mesas = rrpg.getRooms();
		local bibliotecaAtual = mesas[1].library;

		if self.cmbTipoGrupoHM.value == "1" then 
			local function obterNomesRecursivoHM1(bibItem)
			local itensFilhos = bibItem.children;
			local nomes = bibItem.name;
			
			for i = 1, #itensFilhos, 1 do
				local bibItemFilho = itensFilhos[i];
				local nomesDoFilho = obterNomesRecursivoHM1(bibItemFilho) or "";

				if nomesDoFilho == "Sistema de Combaate Velen" then
					-- Obter ID do personagem Loan
					local idPersonagem = self.cmbInimigosHM.value;
					
					-- Solicita acesso à ficha do personagem
					local promise = bibItemFilho:asyncOpenNDB();

					-- Aguarda até que a ficha esteja carregada
					nodeExterno = await(promise);
					
					local nodesO = ndb.getChildNodes(nodeExterno.NomeOponentes)
					
					
					for _, node in ipairs(nodesO) do
						if node.NomeDoOponenteVez == idPersonagem then  -- Verifica se o campo NomeDoOponenteVez existe
							DefAlvo = node.DEF
							PERAlvo = node.Pers
							RESAlvo = node.RES
						end
					end
				end
			end
			return nomes
		end

		local nomesDeTodosOsItens = obterNomesRecursivoHM1(bibliotecaAtual);

		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;	
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
		function (rolado)					
		if TipoMecanica ~= nil then
			if sheet.AcertoMagico + 1 > rolado.resultado then							
				if TipoMecanica == 'Dano' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0) + (tonumber(sheet.Dano) or 0);							
				end;			
				if TipoMecanica == 'Dano Magico' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0) + (tonumber(sheet.DanoMagico) or 0);								
				end;
				if TipoMecanica == 'Cura' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0) + (tonumber(sheet.DanoMagico) or 0);	
				end;
				
				if TipoMecanica == 'Real' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0);	
				end;

				if TipoMecanica == 'Defensivo' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0);	
				end;

				if sheet.AcertoMagico >= rolado.resultado then
					if cbxMeca then
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. DescriMecanica);
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. FalhaMecanica);
					else					
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. DescriMecanica);
					end;
					if TipoMecanica == 'Cura' then
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (IntensidadeMecanica * 2 or 0) .. "[§K8,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. IntensidadeMecanica or 0 .. "[§K8,0] »");
						end;	
					else
						if TipoMecanica == 'Dano' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2) * (1 - (DefAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] »");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica) * (1 - (DefAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] »");
							end;
						end;
						if TipoMecanica == 'Dano Magico' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] »");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] »");
							end;
						end;
						if TipoMecanica == 'Buff' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] » [§K3,0]Buff");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] » [§K3,0]Buff");
							end;
						end;
						if TipoMecanica == 'Real' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] » [§K3,0]Dano Real");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] » [§K3,0]Dano Real");
							end;
						end;
						if TipoMecanica == 'Defensivo' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Defensivo com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (IntensidadeMecanica * 2 or 0) .. "[§K8,0] » [§K3,0]Defensivo");
							else
								mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. IntensidadeMecanica or 0 .. "[§K8,0] » [§K3,0]Defensivo");
							end;
						end;			
					end;
					sheet.MPAtual = tonumber(sheet.MPAtual) - tonumber(CustoMecanica) or 0; 
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
				end;
			else							
				mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");	
			end;
		else
			showMessage("A Habilidade ta sem tipo");
		end;
		end);					
		end;

		if self.cmbTipoGrupoHM.value == "2" then 
		local function obterNomesRecursivoHM2(bibItem)
			local itensFilhos = bibItem.children;
			local nomes = bibItem.name;
			
			for i = 1, #itensFilhos, 1 do
				local bibItemFilho = itensFilhos[i];
				local nomesDoFilho = obterNomesRecursivoHM2(bibItemFilho) or "";

				if nomesDoFilho == "Sistema de Combaate Velen" then
					-- Obter ID do personagem Loan
					local idPersonagem = self.cmbInimigosHM.value;
					
					-- Solicita acesso à ficha do personagem
					local promise = bibItemFilho:asyncOpenNDB();

					-- Aguarda até que a ficha esteja carregada
					nodeExterno = await(promise);
					
					local nodesO = ndb.getChildNodes(nodeExterno.NomeJogador)		
					
					
					for _, node in ipairs(nodesO) do
						if node.NomeDoPersonagemVez == idPersonagem then  -- Verifica se o campo NomeDoPersonagemVez existe
							PERAlvo = node.Pers
							RESAlvo = node.RES
							DefAlvo = node.DEF
						end
					end
				end
			end
			return nomes
		end

		local nomesDeTodosOsItens = obterNomesRecursivoHM2(bibliotecaAtual);

		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;	
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
		function (rolado)					
		if TipoMecanica ~= nil then
			if sheet.AcertoMagico + 1 > rolado.resultado then							
				if TipoMecanica == 'Dano' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0) + (tonumber(sheet.Dano) or 0);							
				end;			
				if TipoMecanica == 'Dano Magico' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0) + (tonumber(sheet.DanoMagico) or 0);								
				end;
				if TipoMecanica == 'Cura' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0) + (tonumber(sheet.DanoMagico) or 0);	
				end;
				
				if TipoMecanica == 'Real' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0);	
				end;

				if TipoMecanica == 'Defensivo' then
					IntensidadeMecanica = (tonumber(DanoMecanica) or 0);	
				end;

				if sheet.AcertoMagico >= rolado.resultado then
					if cbxMeca then
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. DescriMecanica);
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. FalhaMecanica);
					else					
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. DescriMecanica);
					end;
					if TipoMecanica == 'Cura' then
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (IntensidadeMecanica * 2 or 0) .. "[§K8,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. IntensidadeMecanica or 0 .. "[§K8,0] »");
						end;	
					else
						if TipoMecanica == 'Dano' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2) * (1 - (DefAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] »");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica) * (1 - (DefAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] »");
							end;
						end;
						if TipoMecanica == 'Dano Magico' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] »");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] »");
							end;
						end;
						if TipoMecanica == 'Buff' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] » [§K3,0]Buff");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica) * (1 - (RESAlvo / 100)))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] » [§K3,0]Buff");
							end;
						end;
						if TipoMecanica == 'Real' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica * 2))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (nodeExterno.DanoRecebido or 0) .. "[§K9,0] » [§K3,0]Dano Real");
							else
								nodeExterno.AlvoRecebido = self.cmbInimigosHM.value
								nodeExterno.GrupoRecebido = self.cmbTipoGrupoHM.value
								nodeExterno.DanoRecebido = math.floor((IntensidadeMecanica))
								nodeExterno.ACAOTURNO = (tonumber(nodeExterno.ACAOTURNO) + 1)	
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. nodeExterno.DanoRecebido or 0 .. "[§K9,0] » [§K3,0]Dano Real");
							end;
						end;
						if TipoMecanica == 'Defensivo' then
							if sheet.CriticalMagico +1 > rolado.resultado then 
								mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Defensivo com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (IntensidadeMecanica * 2 or 0) .. "[§K8,0] » [§K3,0]Defensivo");
							else
								mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. IntensidadeMecanica or 0 .. "[§K8,0] » [§K3,0]Defensivo");
							end;
						end;			
					end;
					sheet.MPAtual = tonumber(sheet.MPAtual) - tonumber(CustoMecanica) or 0; 
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
				end;
			else							
				mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");	
			end;
		else
			showMessage("A Habilidade ta sem tipo");
		end;
		end);					
		end;
		end; 						
				
    


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.URLIMG = GUI.fromHandle(_obj_newObject("image"));
    obj.URLIMG:setParent(obj.scrollBox1);
    obj.URLIMG:setName("URLIMG");
    obj.URLIMG:setLeft(185);
    obj.URLIMG:setTop(-25);
    obj.URLIMG:setWidth(140);
    obj.URLIMG:setHeight(190);
    obj.URLIMG:setEditable(true);
    obj.URLIMG:setStyle("autoFit");
    obj.URLIMG:setField("imgInimigo");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(110);
    obj.image1:setTop(-70);
    obj.image1:setWidth(100);
    obj.image1:setHeight(100);
    obj.image1:setSRC("/imagens/2.png");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(300);
    obj.image2:setTop(-70);
    obj.image2:setWidth(100);
    obj.image2:setHeight(100);
    obj.image2:setSRC("/imagens/2.png");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setLeft(5);
    obj.image3:setTop(-70);
    obj.image3:setWidth(500);
    obj.image3:setHeight(800);
    obj.image3:setSRC("/imagens/1.png");
    obj.image3:setName("image3");

    obj.BarraHP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.BarraHP:setParent(obj.scrollBox1);
    obj.BarraHP:setName("BarraHP");
    obj.BarraHP:setLeft(75);
    obj.BarraHP:setTop(160);
    obj.BarraHP:setWidth(120);
    obj.BarraHP:setHeight(20);
    obj.BarraHP:setColor("red");
    obj.BarraHP:setPosition(50);
    obj.BarraHP:setMax(100);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(75);
    obj.edit1:setTop(160);
    obj.edit1:setWidth(60);
    obj.edit1:setHeight(20);
    obj.edit1:setTransparent(true);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setField("HPAtual");
    obj.edit1:setName("edit1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(75);
    obj.button1:setTop(190);
    obj.button1:setWidth(70);
    obj.button1:setHeight(20);
    obj.button1:setFontSize(12);
    obj.button1:setFontColor("red");
    obj.button1:setText("DANO");
    obj.button1:setName("button1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(150);
    obj.edit2:setTop(190);
    obj.edit2:setWidth(45);
    obj.edit2:setHeight(20);
    obj.edit2:setTransparent(false);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("HPRetirado");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(135);
    obj.edit3:setTop(160);
    obj.edit3:setWidth(60);
    obj.edit3:setHeight(20);
    obj.edit3:setTransparent(true);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setField("HPTotal");
    obj.edit3:setName("edit3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(407);
    obj.button2:setTop(42);
    obj.button2:setWidth(65);
    obj.button2:setHeight(65);
    obj.button2:setOpacity(0);
    obj.button2:setFontSize(12);
    obj.button2:setFontColor("#00FFFF");
    obj.button2:setName("button2");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(35);
    obj.edit4:setTop(48);
    obj.edit4:setWidth(65);
    obj.edit4:setHeight(40);
    obj.edit4:setFontSize(24);
    obj.edit4:setTransparent(true);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontColor("blue");
    obj.edit4:setType("number");
    obj.edit4:setDecimalPlaces(0);
    obj.edit4:setMax(30);
    obj.edit4:setMin(1);
    obj.edit4:setField("level");
    obj.edit4:setName("edit4");

    obj.BarraMP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.BarraMP:setParent(obj.scrollBox1);
    obj.BarraMP:setName("BarraMP");
    obj.BarraMP:setLeft(315);
    obj.BarraMP:setTop(160);
    obj.BarraMP:setWidth(120);
    obj.BarraMP:setHeight(20);
    obj.BarraMP:setColor("cyan");
    obj.BarraMP:setPosition(50);
    obj.BarraMP:setMax(100);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(315);
    obj.edit5:setTop(160);
    obj.edit5:setWidth(60);
    obj.edit5:setHeight(20);
    obj.edit5:setTransparent(true);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setField("MPAtual");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(375);
    obj.edit6:setTop(160);
    obj.edit6:setWidth(60);
    obj.edit6:setHeight(20);
    obj.edit6:setTransparent(true);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setField("MPTotal");
    obj.edit6:setName("edit6");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(315);
    obj.button3:setTop(190);
    obj.button3:setWidth(70);
    obj.button3:setHeight(20);
    obj.button3:setFontSize(12);
    obj.button3:setFontColor("cyan");
    obj.button3:setText("CUSTO");
    obj.button3:setName("button3");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox1);
    obj.edit7:setLeft(390);
    obj.edit7:setTop(190);
    obj.edit7:setWidth(45);
    obj.edit7:setHeight(20);
    obj.edit7:setTransparent(false);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setField("MPRetirado");
    obj.edit7:setName("edit7");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(223);
    obj.button4:setTop(165);
    obj.button4:setWidth(60);
    obj.button4:setHeight(25);
    obj.button4:setFontSize(12);
    obj.button4:setFontColor("white");
    obj.button4:setText("Full💙");
    obj.button4:setName("button4");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.scrollBox1);
    obj.comboBox1:setLeft(200);
    obj.comboBox1:setTop(190);
    obj.comboBox1:setWidth(70);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setFontSize(12);
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setField("TipoRecebido");
    obj.comboBox1:setItems({'% Fisico', '% Magico'});
    obj.comboBox1:setName("comboBox1");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox1);
    obj.edit8:setLeft(145);
    obj.edit8:setTop(215);
    obj.edit8:setWidth(130);
    obj.edit8:setHeight(20);
    obj.edit8:setTransparent(false);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setField("Nome");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox1);
    obj.edit9:setLeft(180);
    obj.edit9:setTop(237);
    obj.edit9:setWidth(95);
    obj.edit9:setHeight(20);
    obj.edit9:setTransparent(false);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setDecimalPlaces(0);
    obj.edit9:setType("number");
    obj.edit9:setField("Dano");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.scrollBox1);
    obj.edit10:setLeft(180);
    obj.edit10:setTop(263);
    obj.edit10:setWidth(95);
    obj.edit10:setHeight(20);
    obj.edit10:setTransparent(false);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setDecimalPlaces(0);
    obj.edit10:setType("number");
    obj.edit10:setField("DanoMagico");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.scrollBox1);
    obj.edit11:setLeft(180);
    obj.edit11:setTop(289);
    obj.edit11:setWidth(35);
    obj.edit11:setHeight(20);
    obj.edit11:setTransparent(false);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setField("Defesa");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.scrollBox1);
    obj.edit12:setLeft(180);
    obj.edit12:setTop(314);
    obj.edit12:setWidth(35);
    obj.edit12:setHeight(20);
    obj.edit12:setTransparent(false);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setField("Resistencia");
    obj.edit12:setName("edit12");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(240);
    obj.rectangle1:setTop(289);
    obj.rectangle1:setWidth(35);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setColor("blue");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.scrollBox1);
    obj.edit13:setLeft(240);
    obj.edit13:setTop(289);
    obj.edit13:setWidth(35);
    obj.edit13:setHeight(20);
    obj.edit13:setTransparent(true);
    obj.edit13:setCanFocus(false);
    obj.edit13:setHitTest(false);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setField("DefesaPorCent");
    obj.edit13:setName("edit13");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(240);
    obj.rectangle2:setTop(314);
    obj.rectangle2:setWidth(35);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setColor("blue");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.scrollBox1);
    obj.edit14:setLeft(240);
    obj.edit14:setTop(314);
    obj.edit14:setWidth(35);
    obj.edit14:setHeight(20);
    obj.edit14:setTransparent(true);
    obj.edit14:setCanFocus(false);
    obj.edit14:setHitTest(false);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setField("ResistenciaPorCent");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.scrollBox1);
    obj.edit15:setLeft(360);
    obj.edit15:setTop(263);
    obj.edit15:setWidth(60);
    obj.edit15:setHeight(20);
    obj.edit15:setTransparent(false);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setField("Acerto");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.scrollBox1);
    obj.edit16:setLeft(360);
    obj.edit16:setTop(289);
    obj.edit16:setWidth(60);
    obj.edit16:setHeight(20);
    obj.edit16:setTransparent(false);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setField("Esquiva");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.scrollBox1);
    obj.edit17:setLeft(360);
    obj.edit17:setTop(314);
    obj.edit17:setWidth(60);
    obj.edit17:setHeight(20);
    obj.edit17:setTransparent(false);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setField("Critical");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.scrollBox1);
    obj.edit18:setLeft(220);
    obj.edit18:setTop(363);
    obj.edit18:setWidth(60);
    obj.edit18:setHeight(20);
    obj.edit18:setTransparent(false);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setField("AcertoMagico");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.scrollBox1);
    obj.edit19:setLeft(220);
    obj.edit19:setTop(388);
    obj.edit19:setWidth(60);
    obj.edit19:setHeight(20);
    obj.edit19:setTransparent(false);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setField("CriticalMagico");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.scrollBox1);
    obj.edit20:setLeft(220);
    obj.edit20:setTop(413);
    obj.edit20:setWidth(60);
    obj.edit20:setHeight(20);
    obj.edit20:setTransparent(false);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setField("Persistencia");
    obj.edit20:setName("edit20");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.scrollBox1);
    obj.comboBox2:setLeft(310);
    obj.comboBox2:setTop(338);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setField("TipoAtaque");
    obj.comboBox2:setFontSize(12);
    obj.comboBox2:setFontColor("red");
    obj.comboBox2:setItems({'Dano Fisico', 'Dano Magico'});
    obj.comboBox2:setName("comboBox2");

    obj.AtkBasicI = GUI.fromHandle(_obj_newObject("button"));
    obj.AtkBasicI:setParent(obj.scrollBox1);
    obj.AtkBasicI:setName("AtkBasicI");
    obj.AtkBasicI:setLeft(310);
    obj.AtkBasicI:setTop(363);
    obj.AtkBasicI:setWidth(100);
    obj.AtkBasicI:setHeight(20);
    obj.AtkBasicI:setFontSize(12);
    obj.AtkBasicI:setFontColor("red");
    obj.AtkBasicI:setText("Ataque Basico");

    obj.popAtaqueBasico = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAtaqueBasico:setParent(obj.scrollBox1);
    obj.popAtaqueBasico:setName("popAtaqueBasico");
    obj.popAtaqueBasico:setWidth(200);
    obj.popAtaqueBasico:setHeight(160);
    obj.popAtaqueBasico:setBackOpacity(0.5);

    obj.TargetName = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.TargetName:setParent(obj.popAtaqueBasico);
    obj.TargetName:setName("TargetName");
    obj.TargetName:setScale(1.2);
    obj.TargetName:setAlign("top");
    obj.TargetName:setHeight(50);

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
    obj.NameTipoDeGrupo:setParent(obj.popAtaqueBasico);
    obj.NameTipoDeGrupo:setName("NameTipoDeGrupo");
    obj.NameTipoDeGrupo:setScale(1.2);
    obj.NameTipoDeGrupo:setTop(70);
    obj.NameTipoDeGrupo:setWidth(200);
    obj.NameTipoDeGrupo:setHeight(50);

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

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.NameTipoDeGrupo);
    obj.dataLink1:setField("cmbTipoDeGrupoF");
    obj.dataLink1:setName("dataLink1");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.popAtaqueBasico);
    obj.button5:setAlign("bottom");
    obj.button5:setWidth(90);
    obj.button5:setHeight(30);
    obj.button5:setFontSize(12);
    obj.button5:setFontColor("#00FFFF");
    obj.button5:setText("Ataque Basico");
    obj.button5:setName("button5");

    obj.PopUPMecanicasHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopUPMecanicasHabilidade:setParent(obj.scrollBox1);
    obj.PopUPMecanicasHabilidade:setName("PopUPMecanicasHabilidade");
    obj.PopUPMecanicasHabilidade:setWidth(200);
    obj.PopUPMecanicasHabilidade:setHeight(160);
    obj.PopUPMecanicasHabilidade:setBackOpacity(0.5);

    obj.TargetNameHM = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.TargetNameHM:setParent(obj.PopUPMecanicasHabilidade);
    obj.TargetNameHM:setName("TargetNameHM");
    obj.TargetNameHM:setScale(1.2);
    obj.TargetNameHM:setAlign("top");
    obj.TargetNameHM:setHeight(50);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.TargetNameHM);
    obj.label3:setText("Alvo:");
    obj.label3:setFontColor("red");
    obj.label3:setAlign("right");
    obj.label3:setWidth(75);
    obj.label3:setName("label3");

    obj.cmbInimigosHM = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigosHM:setParent(obj.TargetNameHM);
    obj.cmbInimigosHM:setItems({'Inimigo 1', 'Inimigo 2', 'Inimigo 3'});
    obj.cmbInimigosHM:setValues({'1', '2', '3'});
    obj.cmbInimigosHM:setValue("1");
    obj.cmbInimigosHM:setFontColor("#FF6347");
    obj.cmbInimigosHM:setName("cmbInimigosHM");
    obj.cmbInimigosHM:setWidth(150);
    obj.cmbInimigosHM:setHeight(25);

    obj.NameTipoDeGrupoHM = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.NameTipoDeGrupoHM:setParent(obj.PopUPMecanicasHabilidade);
    obj.NameTipoDeGrupoHM:setName("NameTipoDeGrupoHM");
    obj.NameTipoDeGrupoHM:setScale(1.2);
    obj.NameTipoDeGrupoHM:setTop(70);
    obj.NameTipoDeGrupoHM:setWidth(200);
    obj.NameTipoDeGrupoHM:setHeight(50);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.NameTipoDeGrupoHM);
    obj.label4:setText("Grupo:");
    obj.label4:setFontColor("green");
    obj.label4:setAlign("right");
    obj.label4:setWidth(75);
    obj.label4:setName("label4");

    obj.cmbTipoGrupoHM = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbTipoGrupoHM:setParent(obj.NameTipoDeGrupoHM);
    obj.cmbTipoGrupoHM:setItems({'Jogadores', 'Inimigos'});
    obj.cmbTipoGrupoHM:setValues({'1', '2'});
    obj.cmbTipoGrupoHM:setValue("1");
    obj.cmbTipoGrupoHM:setFontColor("#00FF7F");
    obj.cmbTipoGrupoHM:setName("cmbTipoGrupoHM");
    obj.cmbTipoGrupoHM:setField("cmbTipoDeGrupoHM");
    obj.cmbTipoGrupoHM:setWidth(150);
    obj.cmbTipoGrupoHM:setHeight(25);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.NameTipoDeGrupoHM);
    obj.dataLink2:setField("cmbTipoDeGrupoHM");
    obj.dataLink2:setName("dataLink2");

    obj.UsarMecanicaAtual = GUI.fromHandle(_obj_newObject("button"));
    obj.UsarMecanicaAtual:setParent(obj.PopUPMecanicasHabilidade);
    obj.UsarMecanicaAtual:setName("UsarMecanicaAtual");
    obj.UsarMecanicaAtual:setAlign("bottom");
    obj.UsarMecanicaAtual:setWidth(90);
    obj.UsarMecanicaAtual:setHeight(30);
    obj.UsarMecanicaAtual:setFontSize(12);
    obj.UsarMecanicaAtual:setFontColor("#00FFFF");
    obj.UsarMecanicaAtual:setText("Lançar Habilidade");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox1);
    obj.button6:setLeft(310);
    obj.button6:setTop(388);
    obj.button6:setWidth(100);
    obj.button6:setHeight(20);
    obj.button6:setFontSize(12);
    obj.button6:setFontColor("#00FFFF");
    obj.button6:setText("Extra");
    obj.button6:setName("button6");

    obj.btnMeca1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnMeca1:setParent(obj.scrollBox1);
    obj.btnMeca1:setName("btnMeca1");
    obj.btnMeca1:setLeft(280);
    obj.btnMeca1:setTop(215);
    obj.btnMeca1:setWidth(75);
    obj.btnMeca1:setHeight(20);
    obj.btnMeca1:setHorzTextAlign("center");
    obj.btnMeca1:setText("Mecanica 1");

    obj.popMecanica1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMecanica1:setParent(obj.scrollBox1);
    obj.popMecanica1:setName("popMecanica1");
    obj.popMecanica1:setWidth(420);
    obj.popMecanica1:setHeight(420);
    obj.popMecanica1:setBackOpacity(0.5);

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.popMecanica1);
    obj.label5:setLeft(10);
    obj.label5:setTop(10);
    obj.label5:setFontSize(22);
    obj.label5:setHeight(25);
    obj.label5:setText("Mecanica 1");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.popMecanica1);
    obj.label6:setLeft(10);
    obj.label6:setTop(45);
    obj.label6:setText("Habilidade :");
    obj.label6:setName("label6");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.popMecanica1);
    obj.edit21:setLeft(100);
    obj.edit21:setTop(40);
    obj.edit21:setWidth(278);
    obj.edit21:setField("NomeMecanica1");
    obj.edit21:setName("edit21");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.popMecanica1);
    obj.label7:setLeft(10);
    obj.label7:setTop(80);
    obj.label7:setText("Descrição Comum:");
    obj.label7:setName("label7");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popMecanica1);
    obj.textEditor1:setLeft(130);
    obj.textEditor1:setTop(80);
    obj.textEditor1:setWidth(248);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("DescriMecanica1");
    obj.textEditor1:setName("textEditor1");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.popMecanica1);
    obj.button7:setLeft(10);
    obj.button7:setTop(100);
    obj.button7:setWidth(105);
    obj.button7:setHeight(80);
    obj.button7:setHorzTextAlign("center");
    obj.button7:setText("Enviar");
    obj.button7:setName("button7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.popMecanica1);
    obj.label8:setLeft(10);
    obj.label8:setTop(190);
    obj.label8:setText("Descrição Completa:");
    obj.label8:setName("label8");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popMecanica1);
    obj.textEditor2:setLeft(130);
    obj.textEditor2:setTop(190);
    obj.textEditor2:setWidth(248);
    obj.textEditor2:setHeight(100);
    obj.textEditor2:setField("FalhaMecanica1");
    obj.textEditor2:setName("textEditor2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.popMecanica1);
    obj.label9:setLeft(10);
    obj.label9:setTop(303);
    obj.label9:setText("Tipo:");
    obj.label9:setName("label9");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.popMecanica1);
    obj.comboBox3:setLeft(50);
    obj.comboBox3:setTop(300);
    obj.comboBox3:setWidth(105);
    obj.comboBox3:setItems({'Dano', 'Dano Magico', 'Cura', 'Real'});
    obj.comboBox3:setField("TipoMecanica1");
    obj.comboBox3:setName("comboBox3");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.popMecanica1);
    obj.label10:setLeft(10);
    obj.label10:setTop(335);
    obj.label10:setText("Dano:");
    obj.label10:setName("label10");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.popMecanica1);
    obj.edit22:setLeft(50);
    obj.edit22:setTop(330);
    obj.edit22:setWidth(75);
    obj.edit22:setField("DanoMecanica1");
    obj.edit22:setName("edit22");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.popMecanica1);
    obj.label11:setLeft(135);
    obj.label11:setTop(335);
    obj.label11:setText("Cura:");
    obj.label11:setName("label11");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.popMecanica1);
    obj.edit23:setLeft(180);
    obj.edit23:setTop(330);
    obj.edit23:setWidth(75);
    obj.edit23:setField("CuraMecanica1");
    obj.edit23:setName("edit23");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.popMecanica1);
    obj.label12:setLeft(265);
    obj.label12:setTop(335);
    obj.label12:setText("Real:");
    obj.label12:setName("label12");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.popMecanica1);
    obj.edit24:setLeft(305);
    obj.edit24:setTop(330);
    obj.edit24:setWidth(75);
    obj.edit24:setField("FixoMecanica1");
    obj.edit24:setName("edit24");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.popMecanica1);
    obj.label13:setLeft(10);
    obj.label13:setTop(370);
    obj.label13:setVisible(true);
    obj.label13:setText("Custo:");
    obj.label13:setName("label13");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.popMecanica1);
    obj.edit25:setLeft(50);
    obj.edit25:setTop(365);
    obj.edit25:setVisible(true);
    obj.edit25:setWidth(75);
    obj.edit25:setField("CustoMecanica1");
    obj.edit25:setName("edit25");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.popMecanica1);
    obj.label14:setLeft(135);
    obj.label14:setTop(370);
    obj.label14:setVisible(true);
    obj.label14:setText("CD:");
    obj.label14:setName("label14");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.popMecanica1);
    obj.edit26:setLeft(180);
    obj.edit26:setTop(365);
    obj.edit26:setVisible(true);
    obj.edit26:setWidth(75);
    obj.edit26:setField("CDMecanica1");
    obj.edit26:setName("edit26");

    obj.CbxMeca1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.CbxMeca1:setParent(obj.popMecanica1);
    obj.CbxMeca1:setName("CbxMeca1");
    obj.CbxMeca1:setLeft(265);
    obj.CbxMeca1:setTop(370);
    obj.CbxMeca1:setWidth(75);
    obj.CbxMeca1:setFontColor("red");
    obj.CbxMeca1:setText("Mecanica Completa");
    obj.CbxMeca1:setField("ConheceMecanica1");

    obj.btnMeca2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnMeca2:setParent(obj.scrollBox1);
    obj.btnMeca2:setName("btnMeca2");
    obj.btnMeca2:setLeft(280);
    obj.btnMeca2:setTop(237);
    obj.btnMeca2:setWidth(75);
    obj.btnMeca2:setHeight(20);
    obj.btnMeca2:setHorzTextAlign("center");
    obj.btnMeca2:setText("Mecanica 2");

    obj.popMecanica2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMecanica2:setParent(obj.scrollBox1);
    obj.popMecanica2:setName("popMecanica2");
    obj.popMecanica2:setWidth(420);
    obj.popMecanica2:setHeight(420);
    obj.popMecanica2:setBackOpacity(0.5);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.popMecanica2);
    obj.label15:setLeft(10);
    obj.label15:setTop(10);
    obj.label15:setFontSize(22);
    obj.label15:setHeight(25);
    obj.label15:setText("Mecanica 2");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.popMecanica2);
    obj.label16:setLeft(10);
    obj.label16:setTop(45);
    obj.label16:setText("Habilidade :");
    obj.label16:setName("label16");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.popMecanica2);
    obj.edit27:setLeft(100);
    obj.edit27:setTop(40);
    obj.edit27:setWidth(278);
    obj.edit27:setField("NomeMecanica2");
    obj.edit27:setName("edit27");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.popMecanica2);
    obj.label17:setLeft(10);
    obj.label17:setTop(80);
    obj.label17:setText("Descrição Comum:");
    obj.label17:setName("label17");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popMecanica2);
    obj.textEditor3:setLeft(130);
    obj.textEditor3:setTop(80);
    obj.textEditor3:setWidth(248);
    obj.textEditor3:setHeight(100);
    obj.textEditor3:setField("DescriMecanica2");
    obj.textEditor3:setName("textEditor3");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.popMecanica2);
    obj.button8:setLeft(10);
    obj.button8:setTop(100);
    obj.button8:setWidth(105);
    obj.button8:setHeight(80);
    obj.button8:setHorzTextAlign("center");
    obj.button8:setText("Enviar");
    obj.button8:setName("button8");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.popMecanica2);
    obj.label18:setLeft(10);
    obj.label18:setTop(190);
    obj.label18:setText("Descrição Completa:");
    obj.label18:setName("label18");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.popMecanica2);
    obj.textEditor4:setLeft(130);
    obj.textEditor4:setTop(190);
    obj.textEditor4:setWidth(248);
    obj.textEditor4:setHeight(100);
    obj.textEditor4:setField("FalhaMecanica2");
    obj.textEditor4:setName("textEditor4");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.popMecanica2);
    obj.label19:setLeft(10);
    obj.label19:setTop(305);
    obj.label19:setText("Tipo:");
    obj.label19:setName("label19");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.popMecanica2);
    obj.comboBox4:setLeft(50);
    obj.comboBox4:setTop(300);
    obj.comboBox4:setWidth(105);
    obj.comboBox4:setItems({'Dano', 'Dano Magico', 'Cura', 'Fixo'});
    obj.comboBox4:setField("TipoMecanica2");
    obj.comboBox4:setName("comboBox4");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.popMecanica2);
    obj.label20:setLeft(10);
    obj.label20:setTop(335);
    obj.label20:setText("Dano:");
    obj.label20:setName("label20");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.popMecanica2);
    obj.edit28:setLeft(50);
    obj.edit28:setTop(330);
    obj.edit28:setWidth(75);
    obj.edit28:setField("DanoMecanica2");
    obj.edit28:setName("edit28");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.popMecanica2);
    obj.label21:setLeft(135);
    obj.label21:setTop(335);
    obj.label21:setText("Cura:");
    obj.label21:setName("label21");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.popMecanica2);
    obj.edit29:setLeft(180);
    obj.edit29:setTop(330);
    obj.edit29:setWidth(75);
    obj.edit29:setField("CuraMecanica2");
    obj.edit29:setName("edit29");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.popMecanica2);
    obj.label22:setLeft(265);
    obj.label22:setTop(335);
    obj.label22:setText("Fixo:");
    obj.label22:setName("label22");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.popMecanica2);
    obj.edit30:setLeft(305);
    obj.edit30:setTop(330);
    obj.edit30:setWidth(75);
    obj.edit30:setField("FixoMecanica2");
    obj.edit30:setName("edit30");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.popMecanica2);
    obj.label23:setLeft(10);
    obj.label23:setTop(370);
    obj.label23:setVisible(true);
    obj.label23:setText("Custo:");
    obj.label23:setName("label23");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.popMecanica2);
    obj.edit31:setLeft(50);
    obj.edit31:setTop(365);
    obj.edit31:setVisible(true);
    obj.edit31:setWidth(75);
    obj.edit31:setField("CustoMecanica2");
    obj.edit31:setName("edit31");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.popMecanica2);
    obj.label24:setLeft(135);
    obj.label24:setTop(370);
    obj.label24:setVisible(true);
    obj.label24:setText("CD:");
    obj.label24:setName("label24");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.popMecanica2);
    obj.edit32:setLeft(180);
    obj.edit32:setTop(365);
    obj.edit32:setVisible(true);
    obj.edit32:setWidth(75);
    obj.edit32:setField("CDMecanica2");
    obj.edit32:setName("edit32");

    obj.CbxMeca2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.CbxMeca2:setParent(obj.popMecanica2);
    obj.CbxMeca2:setName("CbxMeca2");
    obj.CbxMeca2:setLeft(265);
    obj.CbxMeca2:setTop(370);
    obj.CbxMeca2:setWidth(75);
    obj.CbxMeca2:setFontColor("red");
    obj.CbxMeca2:setText("Mecanica Completa");
    obj.CbxMeca2:setField("ConheceMecanica2");

    obj.btnMeca3 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnMeca3:setParent(obj.scrollBox1);
    obj.btnMeca3:setName("btnMeca3");
    obj.btnMeca3:setLeft(360);
    obj.btnMeca3:setTop(215);
    obj.btnMeca3:setWidth(75);
    obj.btnMeca3:setHeight(20);
    obj.btnMeca3:setHorzTextAlign("center");
    obj.btnMeca3:setText("Mecanica 3");

    obj.popMecanica3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMecanica3:setParent(obj.scrollBox1);
    obj.popMecanica3:setName("popMecanica3");
    obj.popMecanica3:setWidth(420);
    obj.popMecanica3:setHeight(420);
    obj.popMecanica3:setBackOpacity(0.5);

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.popMecanica3);
    obj.label25:setLeft(10);
    obj.label25:setTop(10);
    obj.label25:setFontSize(22);
    obj.label25:setHeight(25);
    obj.label25:setText("Mecanica 3");
    obj.label25:setName("label25");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.popMecanica3);
    obj.label26:setLeft(10);
    obj.label26:setTop(45);
    obj.label26:setText("Habilidade :");
    obj.label26:setName("label26");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.popMecanica3);
    obj.edit33:setLeft(100);
    obj.edit33:setTop(40);
    obj.edit33:setWidth(278);
    obj.edit33:setField("NomeMecanica3");
    obj.edit33:setName("edit33");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.popMecanica3);
    obj.label27:setLeft(10);
    obj.label27:setTop(80);
    obj.label27:setText("Descrição Comum:");
    obj.label27:setName("label27");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.popMecanica3);
    obj.textEditor5:setLeft(130);
    obj.textEditor5:setTop(80);
    obj.textEditor5:setWidth(248);
    obj.textEditor5:setHeight(100);
    obj.textEditor5:setField("DescriMecanica3");
    obj.textEditor5:setName("textEditor5");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.popMecanica3);
    obj.button9:setLeft(10);
    obj.button9:setTop(100);
    obj.button9:setWidth(105);
    obj.button9:setHeight(80);
    obj.button9:setHorzTextAlign("center");
    obj.button9:setText("Enviar");
    obj.button9:setName("button9");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.popMecanica3);
    obj.label28:setLeft(10);
    obj.label28:setTop(190);
    obj.label28:setText("Descrição Completa:");
    obj.label28:setName("label28");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.popMecanica3);
    obj.textEditor6:setLeft(130);
    obj.textEditor6:setTop(190);
    obj.textEditor6:setWidth(248);
    obj.textEditor6:setHeight(100);
    obj.textEditor6:setField("FalhaMecanica3");
    obj.textEditor6:setName("textEditor6");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.popMecanica3);
    obj.label29:setLeft(10);
    obj.label29:setTop(303);
    obj.label29:setText("Tipo:");
    obj.label29:setName("label29");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.popMecanica3);
    obj.comboBox5:setLeft(50);
    obj.comboBox5:setTop(300);
    obj.comboBox5:setWidth(105);
    obj.comboBox5:setItems({'Dano', 'Dano Magico', 'Cura', 'Fixo'});
    obj.comboBox5:setField("TipoMecanica3");
    obj.comboBox5:setName("comboBox5");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.popMecanica3);
    obj.label30:setLeft(10);
    obj.label30:setTop(335);
    obj.label30:setText("Dano:");
    obj.label30:setName("label30");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.popMecanica3);
    obj.edit34:setLeft(50);
    obj.edit34:setTop(330);
    obj.edit34:setWidth(75);
    obj.edit34:setField("DanoMecanica3");
    obj.edit34:setName("edit34");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.popMecanica3);
    obj.label31:setLeft(135);
    obj.label31:setTop(335);
    obj.label31:setText("Cura:");
    obj.label31:setName("label31");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.popMecanica3);
    obj.edit35:setLeft(180);
    obj.edit35:setTop(330);
    obj.edit35:setWidth(75);
    obj.edit35:setField("CuraMecanica3");
    obj.edit35:setName("edit35");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.popMecanica3);
    obj.label32:setLeft(265);
    obj.label32:setTop(335);
    obj.label32:setText("Fixo:");
    obj.label32:setName("label32");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.popMecanica3);
    obj.edit36:setLeft(305);
    obj.edit36:setTop(330);
    obj.edit36:setWidth(75);
    obj.edit36:setField("FixoMecanica3");
    obj.edit36:setName("edit36");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.popMecanica3);
    obj.label33:setLeft(10);
    obj.label33:setTop(370);
    obj.label33:setVisible(true);
    obj.label33:setText("Custo:");
    obj.label33:setName("label33");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.popMecanica3);
    obj.edit37:setLeft(50);
    obj.edit37:setTop(365);
    obj.edit37:setVisible(true);
    obj.edit37:setWidth(75);
    obj.edit37:setField("CustoMecanica3");
    obj.edit37:setName("edit37");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.popMecanica3);
    obj.label34:setLeft(135);
    obj.label34:setTop(370);
    obj.label34:setVisible(true);
    obj.label34:setText("CD:");
    obj.label34:setName("label34");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.popMecanica3);
    obj.edit38:setLeft(180);
    obj.edit38:setTop(365);
    obj.edit38:setVisible(true);
    obj.edit38:setWidth(75);
    obj.edit38:setField("CDMecanica3");
    obj.edit38:setName("edit38");

    obj.CbxMeca3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.CbxMeca3:setParent(obj.popMecanica3);
    obj.CbxMeca3:setName("CbxMeca3");
    obj.CbxMeca3:setLeft(265);
    obj.CbxMeca3:setTop(370);
    obj.CbxMeca3:setWidth(75);
    obj.CbxMeca3:setFontColor("red");
    obj.CbxMeca3:setText("Mecanica Completa");
    obj.CbxMeca3:setField("ConheceMecanica3");

    obj.btnMeca4 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnMeca4:setParent(obj.scrollBox1);
    obj.btnMeca4:setName("btnMeca4");
    obj.btnMeca4:setLeft(360);
    obj.btnMeca4:setTop(237);
    obj.btnMeca4:setWidth(75);
    obj.btnMeca4:setHeight(20);
    obj.btnMeca4:setHorzTextAlign("center");
    obj.btnMeca4:setText("Mecanica 4");

    obj.popMecanica4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMecanica4:setParent(obj.scrollBox1);
    obj.popMecanica4:setName("popMecanica4");
    obj.popMecanica4:setWidth(420);
    obj.popMecanica4:setHeight(420);
    obj.popMecanica4:setBackOpacity(0.5);

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.popMecanica4);
    obj.label35:setLeft(10);
    obj.label35:setTop(10);
    obj.label35:setFontSize(22);
    obj.label35:setHeight(25);
    obj.label35:setText("Mecanica 4");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.popMecanica4);
    obj.label36:setLeft(10);
    obj.label36:setTop(45);
    obj.label36:setText("Habilidade :");
    obj.label36:setName("label36");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.popMecanica4);
    obj.edit39:setLeft(100);
    obj.edit39:setTop(40);
    obj.edit39:setWidth(278);
    obj.edit39:setField("NomeMecanica4");
    obj.edit39:setName("edit39");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.popMecanica4);
    obj.label37:setLeft(10);
    obj.label37:setTop(80);
    obj.label37:setText("Descrição Comum:");
    obj.label37:setName("label37");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.popMecanica4);
    obj.textEditor7:setLeft(130);
    obj.textEditor7:setTop(80);
    obj.textEditor7:setWidth(248);
    obj.textEditor7:setHeight(100);
    obj.textEditor7:setField("DescriMecanica4");
    obj.textEditor7:setName("textEditor7");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.popMecanica4);
    obj.button10:setLeft(10);
    obj.button10:setTop(100);
    obj.button10:setWidth(105);
    obj.button10:setHeight(80);
    obj.button10:setHorzTextAlign("center");
    obj.button10:setText("Enviar");
    obj.button10:setName("button10");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.popMecanica4);
    obj.label38:setLeft(10);
    obj.label38:setTop(190);
    obj.label38:setText("Descrição Completa:");
    obj.label38:setName("label38");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.popMecanica4);
    obj.textEditor8:setLeft(130);
    obj.textEditor8:setTop(190);
    obj.textEditor8:setWidth(248);
    obj.textEditor8:setHeight(100);
    obj.textEditor8:setField("FalhaMecanica4");
    obj.textEditor8:setName("textEditor8");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.popMecanica4);
    obj.label39:setLeft(10);
    obj.label39:setTop(303);
    obj.label39:setText("Tipo:");
    obj.label39:setName("label39");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.popMecanica4);
    obj.comboBox6:setLeft(50);
    obj.comboBox6:setTop(300);
    obj.comboBox6:setWidth(105);
    obj.comboBox6:setItems({'Dano', 'Dano Magico', 'Cura', 'Fixo'});
    obj.comboBox6:setField("TipoMecanica4");
    obj.comboBox6:setName("comboBox6");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.popMecanica4);
    obj.label40:setLeft(10);
    obj.label40:setTop(335);
    obj.label40:setText("Dano:");
    obj.label40:setName("label40");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.popMecanica4);
    obj.edit40:setLeft(50);
    obj.edit40:setTop(330);
    obj.edit40:setWidth(75);
    obj.edit40:setField("DanoMecanica4");
    obj.edit40:setName("edit40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.popMecanica4);
    obj.label41:setLeft(135);
    obj.label41:setTop(335);
    obj.label41:setText("Cura:");
    obj.label41:setName("label41");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.popMecanica4);
    obj.edit41:setLeft(180);
    obj.edit41:setTop(330);
    obj.edit41:setWidth(75);
    obj.edit41:setField("CuraMecanica4");
    obj.edit41:setName("edit41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.popMecanica4);
    obj.label42:setLeft(265);
    obj.label42:setTop(335);
    obj.label42:setText("Fixo:");
    obj.label42:setName("label42");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.popMecanica4);
    obj.edit42:setLeft(305);
    obj.edit42:setTop(330);
    obj.edit42:setWidth(75);
    obj.edit42:setField("FixoMecanica4");
    obj.edit42:setName("edit42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.popMecanica4);
    obj.label43:setLeft(10);
    obj.label43:setTop(370);
    obj.label43:setVisible(true);
    obj.label43:setText("Custo:");
    obj.label43:setName("label43");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.popMecanica4);
    obj.edit43:setLeft(50);
    obj.edit43:setTop(365);
    obj.edit43:setVisible(true);
    obj.edit43:setWidth(75);
    obj.edit43:setField("CustoMecanica4");
    obj.edit43:setName("edit43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.popMecanica4);
    obj.label44:setLeft(135);
    obj.label44:setTop(370);
    obj.label44:setVisible(true);
    obj.label44:setText("CD:");
    obj.label44:setName("label44");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.popMecanica4);
    obj.edit44:setLeft(180);
    obj.edit44:setTop(365);
    obj.edit44:setVisible(true);
    obj.edit44:setWidth(75);
    obj.edit44:setField("CDMecanica4");
    obj.edit44:setName("edit44");

    obj.CbxMeca4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.CbxMeca4:setParent(obj.popMecanica4);
    obj.CbxMeca4:setName("CbxMeca4");
    obj.CbxMeca4:setLeft(265);
    obj.CbxMeca4:setTop(370);
    obj.CbxMeca4:setWidth(75);
    obj.CbxMeca4:setFontColor("red");
    obj.CbxMeca4:setText("Mecanica Completa");
    obj.CbxMeca4:setField("ConheceMecanica4");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.scrollBox1);
    obj.dataLink3:setFields({'NomeMecanica1', 'NomeMecanica2', 'NomeMecanica3', 'NomeMecanica4'});
    obj.dataLink3:setName("dataLink3");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox1);
    obj.button11:setText("Nova Habilidade");
    obj.button11:setLeft(310);
    obj.button11:setTop(413);
    obj.button11:setWidth(100);
    obj.button11:setHeight(20);
    obj.button11:setFontSize(12);
    obj.button11:setFontColor("#00FFFF");
    obj.button11:setName("button11");

    obj.rclHabilidadeInimigo = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadeInimigo:setParent(obj.scrollBox1);
    obj.rclHabilidadeInimigo:setName("rclHabilidadeInimigo");
    obj.rclHabilidadeInimigo:setLeft(40);
    obj.rclHabilidadeInimigo:setTop(450);
    obj.rclHabilidadeInimigo:setWidth(190);
    obj.rclHabilidadeInimigo:setHeight(200);
    obj.rclHabilidadeInimigo:setField("campoDosItens");
    obj.rclHabilidadeInimigo:setTemplateForm("frmHabilidadeInimigo");
    obj.rclHabilidadeInimigo:setSelectable(true);

    obj.dscHabilidadeInimigo = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dscHabilidadeInimigo:setParent(obj.scrollBox1);
    obj.dscHabilidadeInimigo:setName("dscHabilidadeInimigo");
    obj.dscHabilidadeInimigo:setTop(445);
    obj.dscHabilidadeInimigo:setLeft(230	);
    obj.dscHabilidadeInimigo:setVisible(false);
    obj.dscHabilidadeInimigo:setWidth(240);
    obj.dscHabilidadeInimigo:setHeight(200);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.dscHabilidadeInimigo);
    obj.rectangle3:setHeight(200);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setColor("grey");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setName("rectangle3");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle3);
    obj.label45:setLeft(10);
    obj.label45:setTop(10);
    obj.label45:setWidth(70);
    obj.label45:setHeight(18);
    obj.label45:setText("Skill");
    obj.label45:setName("label45");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle3);
    obj.edit45:setLeft(40);
    obj.edit45:setTop(10);
    obj.edit45:setWidth(70);
    obj.edit45:setHeight(18);
    obj.edit45:setFontSize(10);
    obj.edit45:setField("NomeSkill");
    obj.edit45:setName("edit45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle3);
    obj.label46:setLeft(115);
    obj.label46:setTop(10);
    obj.label46:setWidth(28);
    obj.label46:setHeight(18);
    obj.label46:setText("Tipo");
    obj.label46:setName("label46");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.rectangle3);
    obj.comboBox7:setLeft(145);
    obj.comboBox7:setTop(10);
    obj.comboBox7:setWidth(90);
    obj.comboBox7:setField("TipoSkill");
    obj.comboBox7:setItems({'Dano', 'Dano Magico', 'Buff', 'Cura', 'Real', 'Defensiva'});
    obj.comboBox7:setName("comboBox7");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle3);
    obj.button12:setLeft(200);
    obj.button12:setTop(162);
    obj.button12:setText("X");
    obj.button12:setFontSize(18);
    obj.button12:setFontColor("red");
    obj.button12:setWidth(35);
    obj.button12:setHeight(35);
    obj.button12:setName("button12");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle3);
    obj.label47:setLeft(10);
    obj.label47:setTop(150);
    obj.label47:setWidth(70);
    obj.label47:setHeight(18);
    obj.label47:setText("Foco");
    obj.label47:setName("label47");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle3);
    obj.edit46:setLeft(45);
    obj.edit46:setTop(150);
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(18);
    obj.edit46:setType("number");
    obj.edit46:setField("Foco");
    obj.edit46:setName("edit46");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle3);
    obj.label48:setLeft(100);
    obj.label48:setTop(150);
    obj.label48:setWidth(70);
    obj.label48:setHeight(18);
    obj.label48:setText("Custo");
    obj.label48:setName("label48");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle3);
    obj.edit47:setLeft(140);
    obj.edit47:setTop(150);
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(18);
    obj.edit47:setType("number");
    obj.edit47:setField("Custo");
    obj.edit47:setName("edit47");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle3);
    obj.label49:setLeft(10);
    obj.label49:setTop(175);
    obj.label49:setWidth(70);
    obj.label49:setHeight(18);
    obj.label49:setText("Intensidade");
    obj.label49:setName("label49");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.rectangle3);
    obj.edit48:setLeft(85);
    obj.edit48:setTop(175);
    obj.edit48:setWidth(70);
    obj.edit48:setCanFocus(false);
    obj.edit48:setType("number");
    obj.edit48:setHeight(18);
    obj.edit48:setField("Intensidade");
    obj.edit48:setName("edit48");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle3);
    obj.textEditor9:setLeft(10);
    obj.textEditor9:setTop(40);
    obj.textEditor9:setWidth(160);
    obj.textEditor9:setHeight(100);
    obj.textEditor9:setFontSize(10);
    obj.textEditor9:setField("DescriHabilidade");
    obj.textEditor9:setName("textEditor9");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle3);
    obj.button13:setLeft(175);
    obj.button13:setTop(60);
    obj.button13:setWidth(60);
    obj.button13:setHeight(60);
    obj.button13:setFontSize(12);
    obj.button13:setFontColor("blue");
    obj.button13:setText("Usar");
    obj.button13:setName("button13");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.scrollBox1);
    obj.dataLink4:setFields({'FieldNPCBOSS'});
    obj.dataLink4:setName("dataLink4");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.scrollBox1);
    obj.button14:setLeft(38);
    obj.button14:setTop(-50);
    obj.button14:setWidth(63);
    obj.button14:setHeight(60);
    obj.button14:setOpacity(1.0);
    obj.button14:setText("Ficha1");
    obj.button14:setName("button14");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox1);
    obj.image4:setLeft(40);
    obj.image4:setTop(-50);
    obj.image4:setWidth(60);
    obj.image4:setHeight(60);
    obj.image4:setSRC("/imagens/Tok.png");
    obj.image4:setName("image4");

    obj.popCriaInimigo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popCriaInimigo:setParent(obj.scrollBox1);
    obj.popCriaInimigo:setName("popCriaInimigo");
    obj.popCriaInimigo:setWidth(400);
    obj.popCriaInimigo:setVisible(false);
    obj.popCriaInimigo:setHeight(400);
    obj.popCriaInimigo:setBackOpacity(0.5);

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.popCriaInimigo);
    obj.label50:setLeft(10);
    obj.label50:setTop(10);
    obj.label50:setWidth(70);
    obj.label50:setHeight(18);
    obj.label50:setText("Tipo");
    obj.label50:setName("label50");

    obj.cmbNpcBoss = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbNpcBoss:setParent(obj.popCriaInimigo);
    obj.cmbNpcBoss:setLeft(40);
    obj.cmbNpcBoss:setTop(10);
    obj.cmbNpcBoss:setWidth(70);
    obj.cmbNpcBoss:setHeight(18);
    obj.cmbNpcBoss:setItems({'NPC', 'Boss'});
    obj.cmbNpcBoss:setValues({'1', '2'});
    obj.cmbNpcBoss:setValue("1");
    obj.cmbNpcBoss:setFontColor("#FF6347");
    obj.cmbNpcBoss:setName("cmbNpcBoss");
    obj.cmbNpcBoss:setField("FieldNPCBOSS");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.popCriaInimigo);
    obj.label51:setLeft(115);
    obj.label51:setTop(10);
    obj.label51:setWidth(100);
    obj.label51:setHeight(18);
    obj.label51:setText("Nivel de Poder");
    obj.label51:setName("label51");

    obj.cmbPoderNPC = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbPoderNPC:setParent(obj.popCriaInimigo);
    obj.cmbPoderNPC:setLeft(205);
    obj.cmbPoderNPC:setTop(10);
    obj.cmbPoderNPC:setWidth(70);
    obj.cmbPoderNPC:setHeight(18);
    obj.cmbPoderNPC:setItems({'Forte', 'Medio', 'Fraco'});
    obj.cmbPoderNPC:setValues({'1', '2', '3'});
    obj.cmbPoderNPC:setValue("1");
    obj.cmbPoderNPC:setFontColor("#FF6347");
    obj.cmbPoderNPC:setName("cmbPoderNPC");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.popCriaInimigo);
    obj.label52:setLeft(280);
    obj.label52:setTop(10);
    obj.label52:setWidth(70);
    obj.label52:setHeight(18);
    obj.label52:setText("Raça");
    obj.label52:setName("label52");

    obj.cmbRacaBoss = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbRacaBoss:setParent(obj.popCriaInimigo);
    obj.cmbRacaBoss:setLeft(310);
    obj.cmbRacaBoss:setTop(10);
    obj.cmbRacaBoss:setWidth(85);
    obj.cmbRacaBoss:setHeight(18);
    obj.cmbRacaBoss:setItems({'Besta', 'Desertico', 'Elementais', 'Feras', 'Golens', 'Maritimos', 'Mortos Vivos'});
    obj.cmbRacaBoss:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.cmbRacaBoss:setValue("1");
    obj.cmbRacaBoss:setFontColor("#FF6347");
    obj.cmbRacaBoss:setField("RacaCriadorNPC");
    obj.cmbRacaBoss:setName("cmbRacaBoss");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.popCriaInimigo);
    obj.label53:setLeft(10);
    obj.label53:setTop(40);
    obj.label53:setWidth(120);
    obj.label53:setHeight(18);
    obj.label53:setText("Level do Inimigo");
    obj.label53:setName("label53");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.popCriaInimigo);
    obj.edit49:setLeft(120);
    obj.edit49:setTop(40);
    obj.edit49:setWidth(70);
    obj.edit49:setHeight(18);
    obj.edit49:setFontSize(10);
    obj.edit49:setField("LevelCriadorInimigo");
    obj.edit49:setName("edit49");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.popCriaInimigo);
    obj.label54:setLeft(200);
    obj.label54:setTop(40);
    obj.label54:setWidth(70);
    obj.label54:setHeight(18);
    obj.label54:setText("Classe");
    obj.label54:setName("label54");

    obj.cmbClasseNpc = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbClasseNpc:setParent(obj.popCriaInimigo);
    obj.cmbClasseNpc:setLeft(240);
    obj.cmbClasseNpc:setTop(40);
    obj.cmbClasseNpc:setWidth(120);
    obj.cmbClasseNpc:setHeight(18);
    obj.cmbClasseNpc:setItems({'Combatente', 'Magico', 'Tanker', 'Agil', 'Guerreiro Magico', 'Arqueiro'});
    obj.cmbClasseNpc:setValues({'1', '2', '3', '4', '5', '6'});
    obj.cmbClasseNpc:setValue("1");
    obj.cmbClasseNpc:setFontColor("#FF6347");
    obj.cmbClasseNpc:setName("cmbClasseNpc");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.popCriaInimigo);
    obj.label55:setLeft(200);
    obj.label55:setTop(70);
    obj.label55:setWidth(120);
    obj.label55:setHeight(18);
    obj.label55:setEnabled(true);
    obj.label55:setText("Numero de Alvos");
    obj.label55:setName("label55");

    obj.edtNdeAlvos = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtNdeAlvos:setParent(obj.popCriaInimigo);
    obj.edtNdeAlvos:setName("edtNdeAlvos");
    obj.edtNdeAlvos:setLeft(310);
    obj.edtNdeAlvos:setTop(70);
    obj.edtNdeAlvos:setWidth(70);
    obj.edtNdeAlvos:setHeight(18);
    obj.edtNdeAlvos:setFontSize(10);
    obj.edtNdeAlvos:setEnabled(false);
    obj.edtNdeAlvos:setField("NumeroDeAlvos");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.popCriaInimigo);
    obj.label56:setLeft(10);
    obj.label56:setTop(100);
    obj.label56:setWidth(120);
    obj.label56:setHeight(18);
    obj.label56:setVisible(false);
    obj.label56:setEnabled(true);
    obj.label56:setText("Maior HP do Grupo");
    obj.label56:setName("label56");

    obj.edtMaiorHP = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtMaiorHP:setParent(obj.popCriaInimigo);
    obj.edtMaiorHP:setName("edtMaiorHP");
    obj.edtMaiorHP:setLeft(130);
    obj.edtMaiorHP:setTop(100);
    obj.edtMaiorHP:setWidth(70);
    obj.edtMaiorHP:setVisible(false);
    obj.edtMaiorHP:setHeight(18);
    obj.edtMaiorHP:setFontSize(10);
    obj.edtMaiorHP:setEnabled(false);
    obj.edtMaiorHP:setField("MaiorHP");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.popCriaInimigo);
    obj.label57:setLeft(215);
    obj.label57:setTop(100);
    obj.label57:setWidth(140);
    obj.label57:setHeight(18);
    obj.label57:setVisible(false);
    obj.label57:setEnabled(true);
    obj.label57:setText("Maior Dano do Grupo");
    obj.label57:setName("label57");

    obj.edtMaiorDano = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtMaiorDano:setParent(obj.popCriaInimigo);
    obj.edtMaiorDano:setName("edtMaiorDano");
    obj.edtMaiorDano:setLeft(345);
    obj.edtMaiorDano:setTop(100);
    obj.edtMaiorDano:setWidth(50);
    obj.edtMaiorDano:setVisible(false);
    obj.edtMaiorDano:setHeight(18);
    obj.edtMaiorDano:setFontSize(10);
    obj.edtMaiorDano:setEnabled(false);
    obj.edtMaiorDano:setField("MaiorDano");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.popCriaInimigo);
    obj.label58:setLeft(10);
    obj.label58:setTop(70);
    obj.label58:setWidth(120);
    obj.label58:setHeight(18);
    obj.label58:setEnabled(true);
    obj.label58:setText("Forte Contra");
    obj.label58:setName("label58");

    obj.cmbForteContra = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbForteContra:setParent(obj.popCriaInimigo);
    obj.cmbForteContra:setLeft(90);
    obj.cmbForteContra:setTop(70);
    obj.cmbForteContra:setWidth(100);
    obj.cmbForteContra:setHeight(18);
    obj.cmbForteContra:setItems({'Cura', 'Tanker', 'Varios Alvos', 'Defesa', 'Resistencia', 'Buffers'});
    obj.cmbForteContra:setEnabled(false);
    obj.cmbForteContra:setValues({'1', '2', '3', '4', '5', '6'});
    obj.cmbForteContra:setValue("1");
    obj.cmbForteContra:setFontColor("#FF6347");
    obj.cmbForteContra:setName("cmbForteContra");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.popCriaInimigo);
    obj.button15:setAlign("bottom");
    obj.button15:setWidth(300);
    obj.button15:setFontColor("#00FFFF");
    lfm_setPropAsString(obj.button15, "fontStyle", "bold");
    obj.button15:setHeight(30);
    obj.button15:setText("Gerar Inimigo Automaticamente");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.scrollBox1);
    obj.button16:setLeft(400);
    obj.button16:setTop(-50);
    obj.button16:setWidth(63);
    obj.button16:setHeight(60);
    obj.button16:setOpacity(1.0);
    obj.button16:setName("button16");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox1);
    obj.image5:setLeft(403);
    obj.image5:setTop(-47);
    obj.image5:setWidth(55);
    obj.image5:setHeight(55);
    obj.image5:setSRC("/imagens/robot.png");
    obj.image5:setName("image5");

    obj.popExtra = GUI.fromHandle(_obj_newObject("popup"));
    obj.popExtra:setParent(obj);
    obj.popExtra:setName("popExtra");
    obj.popExtra:setVisible(false);
    obj.popExtra:setWidth(500);
    obj.popExtra:setHeight(700);
    obj.popExtra:setBackOpacity(0.5);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.popExtra);
    obj.image6:setAlign("client");
    obj.image6:setSRC("/imagens/3.png");
    obj.image6:setName("image6");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.popExtra);
    obj.edit50:setLeft(230);
    obj.edit50:setTop(132);
    obj.edit50:setWidth(50);
    obj.edit50:setHeight(18);
    obj.edit50:setFontSize(12);
    obj.edit50:setField("Atletismo");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.popExtra);
    obj.edit51:setLeft(230);
    obj.edit51:setTop(156);
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(18);
    obj.edit51:setFontSize(12);
    obj.edit51:setField("Sabedoria");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.popExtra);
    obj.edit52:setLeft(230);
    obj.edit52:setTop(180);
    obj.edit52:setWidth(50);
    obj.edit52:setHeight(18);
    obj.edit52:setFontSize(12);
    obj.edit52:setField("Percepcao");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.popExtra);
    obj.edit53:setLeft(230);
    obj.edit53:setTop(204);
    obj.edit53:setWidth(50);
    obj.edit53:setHeight(18);
    obj.edit53:setFontSize(12);
    obj.edit53:setField("Acrobacia");
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.popExtra);
    obj.edit54:setLeft(230);
    obj.edit54:setTop(228);
    obj.edit54:setWidth(50);
    obj.edit54:setHeight(18);
    obj.edit54:setFontSize(12);
    obj.edit54:setField("Vigor");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.popExtra);
    obj.edit55:setLeft(230);
    obj.edit55:setTop(324);
    obj.edit55:setWidth(50);
    obj.edit55:setHeight(18);
    obj.edit55:setFontSize(12);
    obj.edit55:setField("Visao");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.popExtra);
    obj.edit56:setLeft(230);
    obj.edit56:setTop(346);
    obj.edit56:setWidth(50);
    obj.edit56:setHeight(18);
    obj.edit56:setFontSize(12);
    obj.edit56:setField("DistanciaA");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.popExtra);
    obj.edit57:setLeft(230);
    obj.edit57:setTop(368);
    obj.edit57:setWidth(50);
    obj.edit57:setHeight(18);
    obj.edit57:setFontSize(12);
    obj.edit57:setField("RegenMP");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.popExtra);
    obj.edit58:setLeft(230);
    obj.edit58:setTop(390);
    obj.edit58:setWidth(50);
    obj.edit58:setHeight(18);
    obj.edit58:setFontSize(12);
    obj.edit58:setField("Deslocamento");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.popExtra);
    obj.edit59:setLeft(230);
    obj.edit59:setTop(412);
    obj.edit59:setWidth(50);
    obj.edit59:setHeight(18);
    obj.edit59:setFontSize(12);
    obj.edit59:setField("Corrida");
    obj.edit59:setName("edit59");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.popExtra);
    obj.button17:setLeft(83);
    obj.button17:setTop(450);
    obj.button17:setWidth(50);
    obj.button17:setHeight(18);
    obj.button17:setFontSize(12);
    obj.button17:setText("DROP 1");
    obj.button17:setName("button17");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.popExtra);
    obj.label59:setLeft(150);
    obj.label59:setTop(450);
    obj.label59:setWidth(50);
    obj.label59:setHeight(18);
    obj.label59:setFontSize(12);
    obj.label59:setText("CHANCE");
    obj.label59:setName("label59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.popExtra);
    obj.edit60:setLeft(203);
    obj.edit60:setTop(450);
    obj.edit60:setWidth(30);
    obj.edit60:setHeight(18);
    obj.edit60:setFontSize(12);
    obj.edit60:setField("ChanceDrop1");
    obj.edit60:setName("edit60");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.popExtra);
    obj.textEditor10:setLeft(83);
    obj.textEditor10:setTop(475);
    obj.textEditor10:setWidth(150);
    obj.textEditor10:setHeight(50);
    obj.textEditor10:setField("DescDrop1");
    obj.textEditor10:setName("textEditor10");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.popExtra);
    obj.button18:setLeft(250);
    obj.button18:setTop(450);
    obj.button18:setWidth(50);
    obj.button18:setHeight(18);
    obj.button18:setFontSize(12);
    obj.button18:setText("DROP 2");
    obj.button18:setName("button18");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.popExtra);
    obj.label60:setLeft(317);
    obj.label60:setTop(450);
    obj.label60:setWidth(50);
    obj.label60:setHeight(18);
    obj.label60:setFontSize(12);
    obj.label60:setText("CHANCE");
    obj.label60:setName("label60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.popExtra);
    obj.edit61:setLeft(370);
    obj.edit61:setTop(450);
    obj.edit61:setWidth(30);
    obj.edit61:setHeight(18);
    obj.edit61:setFontSize(12);
    obj.edit61:setField("ChanceDrop2");
    obj.edit61:setName("edit61");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.popExtra);
    obj.textEditor11:setLeft(250);
    obj.textEditor11:setTop(475);
    obj.textEditor11:setWidth(150);
    obj.textEditor11:setHeight(50);
    obj.textEditor11:setField("DescDrop2");
    obj.textEditor11:setName("textEditor11");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.popExtra);
    obj.button19:setLeft(83);
    obj.button19:setTop(530);
    obj.button19:setWidth(50);
    obj.button19:setHeight(18);
    obj.button19:setFontSize(12);
    obj.button19:setText("DROP 3");
    obj.button19:setName("button19");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.popExtra);
    obj.label61:setLeft(150);
    obj.label61:setTop(530);
    obj.label61:setWidth(50);
    obj.label61:setHeight(18);
    obj.label61:setFontSize(12);
    obj.label61:setText("CHANCE");
    obj.label61:setName("label61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.popExtra);
    obj.edit62:setLeft(203);
    obj.edit62:setTop(530);
    obj.edit62:setWidth(30);
    obj.edit62:setHeight(18);
    obj.edit62:setFontSize(12);
    obj.edit62:setField("ChanceDrop3");
    obj.edit62:setName("edit62");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.popExtra);
    obj.textEditor12:setLeft(83);
    obj.textEditor12:setTop(555);
    obj.textEditor12:setWidth(150);
    obj.textEditor12:setHeight(50);
    obj.textEditor12:setField("DescDrop3");
    obj.textEditor12:setName("textEditor12");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.popExtra);
    obj.button20:setLeft(250);
    obj.button20:setTop(530);
    obj.button20:setWidth(50);
    obj.button20:setHeight(18);
    obj.button20:setFontSize(12);
    obj.button20:setText("DROP 4");
    obj.button20:setName("button20");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.popExtra);
    obj.label62:setLeft(317);
    obj.label62:setTop(530);
    obj.label62:setWidth(50);
    obj.label62:setHeight(18);
    obj.label62:setFontSize(12);
    obj.label62:setText("CHANCE");
    obj.label62:setName("label62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.popExtra);
    obj.edit63:setLeft(370);
    obj.edit63:setTop(530);
    obj.edit63:setWidth(30);
    obj.edit63:setHeight(18);
    obj.edit63:setFontSize(12);
    obj.edit63:setField("ChanceDrop4");
    obj.edit63:setName("edit63");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.popExtra);
    obj.textEditor13:setLeft(250);
    obj.textEditor13:setTop(555);
    obj.textEditor13:setWidth(150);
    obj.textEditor13:setHeight(50);
    obj.textEditor13:setField("DescDrop4");
    obj.textEditor13:setName("textEditor13");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.popExtra);
    obj.button21:setLeft(300);
    obj.button21:setTop(132);
    obj.button21:setWidth(70);
    obj.button21:setHeight(20);
    obj.button21:setFontSize(12);
    obj.button21:setFontColor("#00FFFF");
    obj.button21:setText("Atletismo");
    obj.button21:setName("button21");


				local function RolarTesteAtletismo()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Atletismo = math.floor(tonumber(sheet.Atletismo or 0));                        
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Atletismo, "[§K2]Teste de Atletismo"); 
				end; 	   
			


    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.popExtra);
    obj.button22:setLeft(300);
    obj.button22:setTop(156);
    obj.button22:setWidth(70);
    obj.button22:setHeight(20);
    obj.button22:setFontSize(12);
    obj.button22:setFontColor("#00FFFF");
    obj.button22:setText("Sabedoria");
    obj.button22:setName("button22");


				local function RolarTesteSabedoria()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Sabedoria = math.floor(tonumber(sheet.Sabedoria or 0));                       
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Sabedoria, "[§K2]Teste de Sabedoria"); 
				end; 	   
			


    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.popExtra);
    obj.button23:setLeft(300);
    obj.button23:setTop(180);
    obj.button23:setWidth(70);
    obj.button23:setHeight(20);
    obj.button23:setFontSize(12);
    obj.button23:setFontColor("#00FFFF");
    obj.button23:setText("Percepção");
    obj.button23:setName("button23");


				local function RolarTestePercepcao()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Percepcao = math.floor(tonumber(sheet.Percepcao or 0));                       
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Percepcao, "[§K2]Teste de Percepcao"); 
				end; 	   
			


    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.popExtra);
    obj.button24:setLeft(300);
    obj.button24:setTop(204);
    obj.button24:setWidth(70);
    obj.button24:setHeight(20);
    obj.button24:setFontSize(12);
    obj.button24:setFontColor("#00FFFF");
    obj.button24:setText("Acrobacia");
    obj.button24:setName("button24");


				local function RolarTesteAcrobacia()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Acrobacia = math.floor(tonumber(sheet.Acrobacia or 0));                         
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acrobacia, "[§K2]Teste de Acrobacia"); 
				end; 	   
			


    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.popExtra);
    obj.button25:setLeft(300);
    obj.button25:setTop(228);
    obj.button25:setWidth(70);
    obj.button25:setHeight(20);
    obj.button25:setFontSize(12);
    obj.button25:setFontColor("#00FFFF");
    obj.button25:setText("Vigor");
    obj.button25:setName("button25");


				local function RolarTesteVigor()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Vigor = math.floor(tonumber(sheet.Vigor or 0));                         
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Vigor, "[§K2]Teste de Vigor"); 
				end; 	   
			


    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setFields({'Defesa', 'Resistencia', 'level'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setFields({'HPAtual', 'HPTotal'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'LevelCriadorInimigo'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setFields({'MPAtual', 'MPTotal'});
    obj.dataLink8:setName("dataLink8");


		local function ToparStatus()   
			sheet.HPAtual = sheet.HPTotal;
						
			sheet.MPAtual = sheet.MPTotal;
		end; 		   
	



		local function AtaqueBasico()      
			local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
			sheet.Acerto = sheet.Acerto or 0;                        
			if sheet.TipoAtaque == nil then
				showMessage("Escolha uma Base de Dano para seu Ataque Basico na lista acima");
			else				
				mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acerto, "[§K2]Ataque Basico",						
					function (rolado)						
					local soDado = rolado.resultado + 1 - tonumber(sheet.Acerto);
						if soDado > tonumber(sheet.Critical) then
							if sheet.TipoAtaque == 'Dano Fisico' then
								mesaDoPersonagem.chat:enviarMensagem("[§K4,0]CRITICO CORPO A CORPO CARAI  :awyeah: « " .. sheet.Dano * 2 .. " »");
							elseif sheet.TipoAtaque == 'Dano Magico' then
								mesaDoPersonagem.chat:enviarMensagem("[§K4,0]CRITICO A DISTANCIA CARAI :awyeah: « " .. sheet.DanoMagico * 2 .. " »");								
							end;	
						else
							if sheet.TipoAtaque == 'Dano Fisico' then
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico corpo a corpo « [§K4,0] " .. sheet.Dano .. " [§K9,0]»");
							elseif sheet.TipoAtaque == 'Dano Magico' then			
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico a distancia « [§K4,0] " .. sheet.DanoMagico .. " [§K9,0]»");
							end;							
						end;							
				end); 
			end;
		end; 		   
	


					
					
	



		local function URL() 
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);	
			if sheet.imgInimigo ~= nil then
				mesaDoPersonagem.chat:enviarMensagem("[§I" .. sheet.imgInimigo .. "]");	
			else
				showMessage("O Inimigo não possui uma imagem para enviar por isso enviaremos uma imagem da sua PRIMA");
			end;
		end;
	



		local function RetiraHP()
			if sheet.TipoRecebido == '% Fisico' then
				sheet.AplicaDefPorCent = (tonumber(sheet.HPRetirado) or 0) * (tonumber(sheet.DefesaPorCent) / 100);
			else
				sheet.AplicaDefPorCent = (tonumber(sheet.HPRetirado) or 0) * (tonumber(sheet.ResistenciaPorCent) / 100);
			end;
			
			sheet.HPRetiradoReal = (tonumber(sheet.HPRetirado) or 0) - (tonumber(sheet.AplicaDefPorCent))		
			sheet.HPRetiradoReal = math.ceil(sheet.HPRetiradoReal)
			
			sheet.HPAtual = (tonumber(sheet.HPAtual) or 0) - (tonumber(sheet.HPRetiradoReal) or 0);
			sheet.HPRetiradoCrtZ = (tonumber(sheet.HPRetirado) or 0);
						
			self.BarraHP.value = tonumber(sheet.HPAtual);
			self.BarraHP.max = tonumber(sheet.HPTotal);	
			
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
			mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Dano que recebido pela criatura " .. sheet.HPRetiradoReal);
			
			sheet.HPRetirado = 0;
			
		end; 		   
	



		local function RetiraMP()      
			sheet.MPAtual = (tonumber(sheet.MPAtual) or 0) - (tonumber(sheet.MPRetirado) or 0);
			sheet.MPRetiradoCrtZ = (tonumber(sheet.MPRetirado) or 0);
						
			self.BarraMP.value = tonumber(sheet.MPAtual);
			self.BarraMP.max = tonumber(sheet.MPTotal);	
			
			sheet.MPRetirado = 0;
		end; 		   
	



		local function Drop1() 								
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
			sheet.ChanceDrop1 = tonumber(sheet.ChanceDrop1) or 0;						
			mesaDoPersonagem.chat:rolarDados("1d100", "[§K3]Chance de Drop",
			function (rolado)					
				if sheet.ChanceDrop1 >= rolado.resultado then							
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0]DROPOU");	
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0] " .. sheet.DescDrop1);					
				else							
					mesaDoPersonagem.chat:enviarMensagem("[§K14,0]SEM SORTE");	
				end;			
			end);					
		end; 				
	



		local function Drop2() 								
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
			sheet.ChanceDrop2 = tonumber(sheet.ChanceDrop2) or 0;						
			mesaDoPersonagem.chat:rolarDados("1d100", "[§K3]Chance de Drop",
			function (rolado)					
				if sheet.ChanceDrop2 >= rolado.resultado then							
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0]DROPOU");	
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0] " .. sheet.DescDrop2);					
				else							
					mesaDoPersonagem.chat:enviarMensagem("[§K14,0]SEM SORTE");	
				end;			
			end);					
		end; 				
	



		local function Drop3() 								
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
			sheet.ChanceDrop3 = tonumber(sheet.ChanceDrop3) or 0;						
			mesaDoPersonagem.chat:rolarDados("1d100", "[§K3]Chance de Drop",
			function (rolado)					
				if sheet.ChanceDrop3 >= rolado.resultado then							
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0]DROPOU");	
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0] " .. sheet.DescDrop3);					
				else							
					mesaDoPersonagem.chat:enviarMensagem("[§K14,0]SEM SORTE");	
				end;			
			end);					
		end; 				
	



		local function Drop4() 								
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
			sheet.ChanceDrop4 = tonumber(sheet.ChanceDrop4) or 0;						
			mesaDoPersonagem.chat:rolarDados("1d100", "[§K3]Chance de Drop",
			function (rolado)					
				if sheet.ChanceDrop4 >= rolado.resultado then							
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0]DROPOU");	
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0] " .. sheet.DescDrop4);					
				else							
					mesaDoPersonagem.chat:enviarMensagem("[§K14,0]SEM SORTE");	
				end;			
			end);					
		end; 				
	


    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            sheet.HPAtual = tonumber(sheet.HPAtual) or 0;
            		sheet.HPRetirado = tonumber(sheet.HPRetirado) or 0;
            		sheet.HPTotal = tonumber(sheet.HPTotal) or 0;
            		sheet.level = tonumber(sheet.level) or 0;
            		sheet.MPAtual = tonumber(sheet.MPAtual) or 0;
            		sheet.MPTotal = tonumber(sheet.MPTotal) or 0;
            		sheet.MPRetirado = tonumber(sheet.MPRetirado) or 0;
            		
            		sheet.Nome = sheet.Nome or "Nome Mob";
            		sheet.Dano = tonumber(sheet.Dano) or 0;
            		sheet.DanoMagico = tonumber(sheet.DanoMagico) or 0;
            		sheet.Defesa = tonumber(sheet.Defesa) or 0;
            		sheet.Resistencia = tonumber(sheet.Resistencia) or 0;
            		sheet.Acerto = tonumber(sheet.Acerto) or 0;
            		sheet.Esquiva = tonumber(sheet.Esquiva) or 0;
            		sheet.Critical = tonumber(sheet.Critical) or 0;
            		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;
            		sheet.CriticalMagico = tonumber(sheet.CriticalMagico) or 0;
            		sheet.Persistencia = tonumber(sheet.Persistencia) or 0;
            		sheet.TipoAtaque = sheet.TipoAtaque or "Dano Fisico";
            		
            		sheet.Atletismo = tonumber(sheet.Atletismo) or 0;
            		sheet.Sabedoria = tonumber(sheet.Sabedoria) or 0;
            		sheet.Percepcao = tonumber(sheet.Percepcao) or 0;
            		sheet.Acrobacia = tonumber(sheet.Acrobacia) or 0;
            		sheet.Vigor = tonumber(sheet.Vigor) or 0;
            		sheet.Visao = tonumber(sheet.Visao) or 0;
            		sheet.DistanciaA = tonumber(sheet.DistanciaA) or 0;
            		sheet.RegenMP = tonumber(sheet.RegenMP) or 0;
            		sheet.Deslocamento = tonumber(sheet.Deslocamento) or 0;
            		sheet.Corrida = tonumber(sheet.Corrida) or 0;
            		
            		sheet.DescDrop1 = (sheet.DescDrop1) or "Item";
            		sheet.DescDrop2 = (sheet.DescDrop2) or "Item";
            		sheet.DescDrop3 = (sheet.DescDrop3) or "Item";
            		sheet.DescDrop4 = (sheet.DescDrop4) or "Item";
            		
            		sheet.ChanceDrop1 = tonumber(sheet.ChanceDrop1) or 0;		
            		sheet.ChanceDrop2 = tonumber(sheet.ChanceDrop2) or 0;		
            		sheet.ChanceDrop3 = tonumber(sheet.ChanceDrop3) or 0;		
            		sheet.ChanceDrop4 = tonumber(sheet.ChanceDrop4) or 0;
            		
            		sheet.NomeMecanica1 = sheet.NomeMecanica1 or '';
            		sheet.DescriMecanica1 = sheet.DescriMecanica1 or 'Descrição da Habilidade';
            		sheet.FalhaMecanica1 = sheet.FalhaMecanica1 or 'Mecanica Completa';
            		sheet.TipoMecanica1 = sheet.TipoMecanica1 or 'Escolha';
            		sheet.DanoMecanica1 = tonumber(sheet.DanoMecanica1) or 0;
            		sheet.CuraMecanica1 = tonumber(sheet.CuraMecanica1) or 0;
            		sheet.FixoMecanica1 = tonumber(sheet.FixoMecanica1) or 0;
            		sheet.CustoMecanica1 = tonumber(sheet.CustoMecanica1) or 0;
            		sheet.CDMecanica1 = tonumber(sheet.CDMecanica1) or 0;
            		
            		sheet.NomeMecanica2 = sheet.NomeMecanica2 or '';
            		sheet.DescriMecanica2 = sheet.DescriMecanica2 or 'Descrição da Habilidade';
            		sheet.FalhaMecanica2 = sheet.FalhaMecanica2 or 'Mecanica Completa';
            		sheet.TipoMecanica2 = sheet.TipoMecanica2 or 'Escolha';
            		sheet.DanoMecanica2 = tonumber(sheet.DanoMecanica2) or 0;
            		sheet.CuraMecanica2 = tonumber(sheet.CuraMecanica2) or 0;
            		sheet.FixoMecanica2 = tonumber(sheet.FixoMecanica2) or 0;
            		sheet.CustoMecanica2 = tonumber(sheet.CustoMecanica2) or 0;
            		sheet.CDMecanica2 = tonumber(sheet.CDMecanica2) or 0;
            		
            		sheet.NomeMecanica3 = sheet.NomeMecanica3 or '';
            		sheet.DescriMecanica3 = sheet.DescriMecanica3 or 'Descrição da Habilidade';
            		sheet.FalhaMecanica3 = sheet.FalhaMecanica3 or 'Mecanica Completa';
            		sheet.TipoMecanica3 = sheet.TipoMecanica3 or 'Escolha';
            		sheet.DanoMecanica3 = tonumber(sheet.DanoMecanica3) or 0;
            		sheet.CuraMecanica3 = tonumber(sheet.CuraMecanica3) or 0;
            		sheet.FixoMecanica3 = tonumber(sheet.FixoMecanica3) or 0;
            		sheet.CustoMecanica3 = tonumber(sheet.CustoMecanica3) or 0;
            		sheet.CDMecanica3 = tonumber(sheet.CDMecanica3) or 0;
            		
            		sheet.NomeMecanica4 = sheet.NomeMecanica4 or '';
            		sheet.DescriMecanica4 = sheet.DescriMecanica4 or 'Descrição da Habilidade';
            		sheet.FalhaMecanica4 = sheet.FalhaMecanica4 or 'Mecanica Completa';
            		sheet.TipoMecanica4 = sheet.TipoMecanica4 or 'Escolha';
            		sheet.DanoMecanica4 = tonumber(sheet.DanoMecanica4) or 0;
            		sheet.CuraMecanica4 = tonumber(sheet.CuraMecanica4) or 0;
            		sheet.FixoMecanica4 = tonumber(sheet.FixoMecanica4) or 0;
            		sheet.CustoMecanica4 = tonumber(sheet.CustoMecanica4) or 0;
            		sheet.CDMecanica4 = tonumber(sheet.CDMecanica4) or 0;
            		
            		sheet.TipoRecebido = sheet.TipoRecebido or "% Fisico";
        end);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (event)
            RetiraHP();
        end);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (event)
            URL()
        end);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (event)
            RetiraMP();
        end);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (event)
            ToparStatus();
        end);

    obj._e_event5 = obj.AtkBasicI:addEventListener("onClick",
        function (event)
            self.popAtaqueBasico:show('bottom', self.AtkBasicI);
        end);

    obj._e_event6 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
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
        end);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (event)
            AtaqueBasicoR();
        end);

    obj._e_event8 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if self.cmbTipoGrupoHM.value == "1" then
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            								
            								lista = {}
            
            								local function obterNomesRecursivoCMB3(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            
            									
            									
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivoCMB3(bibItemFilho) or "";
            
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
            									local comboBox = self.cmbInimigosHM
            									comboBox.items = lista
            									comboBox.values = lista
            									comboBox.value = lista[1] or ""
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivoCMB3(bibliotecaAtual);
            								atualizarComboBox()
            							end
            
            							if self.cmbTipoGrupoHM.value == "2" then
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            								
            								lista = {}
            
            								local function obterNomesRecursivoCMB4(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            									
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivoCMB4(bibItemFilho) or "";
            
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
            									local comboBox = self.cmbInimigosHM
            									comboBox.items = lista
            									comboBox.values = lista
            									comboBox.value = lista[1] or ""  -- Defina o primeiro item como selecionado por padrão
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivoCMB4(bibliotecaAtual);
            								atualizarComboBox()
            							end;
        end);

    obj._e_event9 = obj.button6:addEventListener("onClick",
        function (event)
            self.popExtra:show();
        end);

    obj._e_event10 = obj.btnMeca1:addEventListener("onClick",
        function (event)
            self.popMecanica1:show()
            				self.UsarMecanicaAtual.onClick = function() 
            					MecanicaDinamica(sheet.TipoMecanica1, sheet.DanoMecanica1, sheet.CuraMecanica1, sheet.FixoMecanica1, sheet.DescriMecanica1, sheet.FalhaMecanica1, sheet.CustoMecanica1, sheet.CDMecanica1, sheet.IntensidadeMecanica1, self.CbxMeca1.checked) 
            				end
        end);

    obj._e_event11 = obj.button7:addEventListener("onClick",
        function (event)
            self.PopUPMecanicasHabilidade:show()
        end);

    obj._e_event12 = obj.btnMeca2:addEventListener("onClick",
        function (event)
            self.popMecanica2:show()
            				self.UsarMecanicaAtual.onClick = function() 
            					MecanicaDinamica(sheet.TipoMecanica2, sheet.DanoMecanica2, sheet.CuraMecanica2, sheet.FixoMecanica2, sheet.DescriMecanica2, sheet.FalhaMecanica2, sheet.CustoMecanica2, sheet.CDMecanica2, sheet.IntensidadeMecanica2, self.CbxMeca2.checked) 
            					
            				end
        end);

    obj._e_event13 = obj.button8:addEventListener("onClick",
        function (event)
            self.PopUPMecanicasHabilidade:show()
        end);

    obj._e_event14 = obj.btnMeca3:addEventListener("onClick",
        function (event)
            self.popMecanica3:show()
            				self.UsarMecanicaAtual.onClick = function() 
            					MecanicaDinamica(sheet.TipoMecanica3, sheet.DanoMecanica3, sheet.CuraMecanica3, sheet.FixoMecanica3, sheet.DescriMecanica3, sheet.FalhaMecanica3, sheet.CustoMecanica3, sheet.CDMecanica3, sheet.IntensidadeMecanica3, self.CbxMeca3.checked) 
            				end
        end);

    obj._e_event15 = obj.button9:addEventListener("onClick",
        function (event)
            self.PopUPMecanicasHabilidade:show()
        end);

    obj._e_event16 = obj.btnMeca4:addEventListener("onClick",
        function (event)
            self.popMecanica4:show()
            				self.UsarMecanicaAtual.onClick = function() 
            					MecanicaDinamica(sheet.TipoMecanica4, sheet.DanoMecanica4, sheet.CuraMecanica4, sheet.FixoMecanica4, sheet.DescriMecanica4, sheet.FalhaMecanica4, sheet.CustoMecanica4, sheet.CDMecanica4, sheet.IntensidadeMecanica4, self.CbxMeca4.checked) 
            				end
        end);

    obj._e_event17 = obj.button10:addEventListener("onClick",
        function (event)
            self.PopUPMecanicasHabilidade:show()
        end);

    obj._e_event18 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.btnMeca1.fontColor = 'white'
            					self.btnMeca2.fontColor = 'white'
            					self.btnMeca3.fontColor = 'white'
            					self.btnMeca4.fontColor = 'white'
            					
            					if sheet.NomeMecanica1 ~= nil then
            						self.btnMeca1.fontColor = 'red';
            					end;
            					
            					if sheet.NomeMecanica2 ~= nil then
            						self.btnMeca2.fontColor = 'red';
            					end;
            					if sheet.NomeMecanica3 ~= nil then
            						self.btnMeca3.fontColor = 'red';
            					end;
            					if sheet.NomeMecanica4 ~= nil then
            						self.btnMeca4.fontColor = 'red';
            					end;
        end);

    obj._e_event19 = obj.button11:addEventListener("onClick",
        function (event)
            self.rclHabilidadeInimigo:append();
        end);

    obj._e_event20 = obj.rclHabilidadeInimigo:addEventListener("onSelect",
        function ()
            local node = self.rclHabilidadeInimigo.selectedNode; 
            					self.dscHabilidadeInimigo.node = node;                       
            					self.dscHabilidadeInimigo.visible = (node ~= nil);
            					
            					if self.dscHabilidadeInimigo.visible == true then
            						self.dscHabilidadeInimigo.node.NomeSkill = self.dscHabilidadeInimigo.node.NomeSkill or ''
            						self.dscHabilidadeInimigo.node.TipoSkill = self.dscHabilidadeInimigo.node.TipoSkill or 'Escolha'
            						self.dscHabilidadeInimigo.node.Foco = tonumber(self.dscHabilidadeInimigo.node.Foco) or 0;
            						self.dscHabilidadeInimigo.node.Custo = tonumber(self.dscHabilidadeInimigo.node.Custo) or 0;
            						self.dscHabilidadeInimigo.node.Intensidade = tonumber(self.dscHabilidadeInimigo.node.Intensidade) or 0;
            						self.dscHabilidadeInimigo.node.DescriHabilidade = self.dscHabilidadeInimigo.node.DescriHabilidade or 'Descrição da Habilidade'
            					end;
            
            					if self.dscHabilidadeInimigo.visible == true then
            						if self.dscHabilidadeInimigo.node.TipoSkill == 'Dano' then
            							self.dscHabilidadeInimigo.node.Intensidade = tonumber(sheet.Dano) + (tonumber(self.dscHabilidadeInimigo.node.Foco) or 0);
            						end;
            						if self.dscHabilidadeInimigo.node.TipoSkill == 'Dano Magico' then
            							self.dscHabilidadeInimigo.node.Intensidade = tonumber(sheet.DanoMagico) + (tonumber(self.dscHabilidadeInimigo.node.Foco) or 0);
            						end;
            						if self.dscHabilidadeInimigo.node.TipoSkill == 'Real' or self.dscHabilidadeInimigo.node.TipoSkill == 'Cura' then
            							self.dscHabilidadeInimigo.node.Intensidade = (tonumber(self.dscHabilidadeInimigo.node.Foco) or 0);
            						end;
            					end;
        end);

    obj._e_event21 = obj.rclHabilidadeInimigo:addEventListener("onEndEnumeration",
        function ()
            if self.rclHabilidadeInimigo.selectedNode == nil and sheet ~= nil then
            					local nodes = ndb.getChildNodes(sheet.campoDosItens);	
            					if #nodes > 0 then
            						self.rclHabilidadeInimigo.selectedNode = nodes[1];
            					end;
            				end;
        end);

    obj._e_event22 = obj.button12:addEventListener("onClick",
        function (event)
            NDB.deleteNode(self.dscHabilidadeInimigo.node);
        end);

    obj._e_event23 = obj.button13:addEventListener("onClick",
        function (event)
            local node = self.rclHabilidadeInimigo.selectedNode; 
            						self.PopUPMecanicasHabilidade:show()
            						self.UsarMecanicaAtual.onClick = function() 
            							UsarHabilidades(node.TipoSkill, node.Foco, nil, nil, node.DescriHabilidade, nil, node.Custo, nil, node.Intensidade, nil) 
            						end
        end);

    obj._e_event24 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            if self.cmbNpcBoss.value == '2' then
            					self.edtNdeAlvos.enabled = true
            					self.edtMaiorHP.enabled = true
            					self.edtMaiorDano.enabled = true
            				else
            					self.edtNdeAlvos.enabled = false
            					self.edtMaiorHP.enabled = false
            					self.edtMaiorDano.enabled = false
            				end
        end);

    obj._e_event25 = obj.button14:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmSobrePostaInimigo");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event26 = obj.button15:addEventListener("onClick",
        function (event)
            if sheet.level ~= nil and sheet.level ~= "" and sheet.level > 0 then
            							sheet.LevelCriadorInimigo = tonumber(sheet.level)
            							if sheet.LevelCriadorInimigo ~= nil or sheet.LevelCriadorInimigo ~= "" and sheet.LevelCriadorInimigo > 0 then
            								if self.cmbClasseNpc.value == "1" then
            									sheet.Dano = calcularDanoFisico(sheet.LevelCriadorInimigo);
            									sheet.DanoMagico = math.floor(math.random(1, math.floor(sheet.Dano / 2)));
            									sheet.Defesa = calcularDefCriador(tonumber(sheet.LevelCriadorInimigo));
            									sheet.Resistencia = calcularResCriador(tonumber(sheet.LevelCriadorInimigo))
            									calcularChancesCriador(sheet.LevelCriadorInimigo, sheet.RacaCriadorNPC);
            									sheet.HPTotal = math.floor(calcularHPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.MPTotal = math.floor(calcularMPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									ajusteFinal();
            								end;				
            								if self.cmbClasseNpc.value == "2" then
            									sheet.DanoMagico = calcularDanoMagico(sheet.LevelCriadorInimigo);
            									sheet.Dano = math.floor(math.random((math.floor(sheet.DanoMagico / 2)), math.floor(sheet.DanoMagico)))
            									sheet.Defesa = calcularDefCriador(tonumber(sheet.LevelCriadorInimigo));
            									sheet.Resistencia = calcularResCriador(tonumber(sheet.LevelCriadorInimigo))
            									calcularChancesCriador(sheet.LevelCriadorInimigo, sheet.RacaCriadorNPC);
            									sheet.HPTotal = math.floor(calcularHPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.MPTotal = math.floor(calcularMPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.HPTotal = math.floor(math.random(math.floor(sheet.HPTotal * 0.8), math.floor(sheet.HPTotal * 1.1)))
            									sheet.MPTotal = math.floor(math.random(math.floor(sheet.MPTotal * 1.3), math.floor(sheet.MPTotal * 2.0)))
            									ajusteFinal();
            								end;
            								if self.cmbClasseNpc.value == "3" then
            									sheet.Dano = calcularDanoFisico(sheet.LevelCriadorInimigo);
            									sheet.DanoMagico = math.random(1, sheet.Dano);
            									sheet.Defesa = calcularDefCriador(tonumber(sheet.LevelCriadorInimigo));
            									sheet.Resistencia = calcularResCriador(tonumber(sheet.LevelCriadorInimigo))
            									calcularChancesCriador(sheet.LevelCriadorInimigo, sheet.RacaCriadorNPC);
            									sheet.Defesa = math.random(math.floor(sheet.Defesa * 1.3), math.floor(sheet.Defesa * 1.5))
            									sheet.Resistencia = math.random(math.floor(sheet.Resistencia * 1.3), math.floor(sheet.Resistencia * 1.5))
            									sheet.HPTotal = math.floor(calcularHPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.MPTotal = math.floor(calcularMPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.HPTotal = math.floor(math.random(math.floor(sheet.HPTotal * 1.1), math.floor(sheet.HPTotal * 1.3)))
            									ajusteFinal();
            								end;
            								if self.cmbClasseNpc.value == "4" then
            									sheet.Dano = calcularDanoFisico(sheet.LevelCriadorInimigo);
            									sheet.DanoMagico = math.random(1, sheet.Dano);
            									sheet.Defesa = calcularDefCriador(tonumber(sheet.LevelCriadorInimigo));
            									sheet.Resistencia = calcularResCriador(tonumber(sheet.LevelCriadorInimigo))
            									calcularChancesCriador(sheet.LevelCriadorInimigo, sheet.RacaCriadorNPC);
            									sheet.HPTotal = math.floor(calcularHPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.MPTotal = math.floor(calcularMPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.HPTotal = math.floor(math.random(math.floor(sheet.HPTotal * 0.9), math.floor(sheet.HPTotal * 1.1)))
            									sheet.MPTotal = math.floor(math.random(math.floor(sheet.MPTotal * 0.9), math.floor(sheet.MPTotal * 1.1)))
            									ajusteFinal();
            								end;
            								if self.cmbClasseNpc.value == "5" then
            									sheet.Dano = calcularDanoFisico(sheet.LevelCriadorInimigo);
            									sheet.DanoMagico = calcularDanoMagico(sheet.LevelCriadorInimigo);
            									sheet.Defesa = calcularDefCriador(tonumber(sheet.LevelCriadorInimigo));
            									sheet.Resistencia = calcularResCriador(tonumber(sheet.LevelCriadorInimigo))
            									calcularChancesCriador(sheet.LevelCriadorInimigo, sheet.RacaCriadorNPC);
            									sheet.HPTotal = math.floor(calcularHPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.MPTotal = math.floor(calcularMPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.MPTotal = math.floor(math.random(math.floor(sheet.MPTotal * 1.2), math.floor(sheet.MPTotal * 1.5)))
            									ajusteFinal();
            								end;
            								if self.cmbClasseNpc.value == "6" then
            									sheet.Dano = calcularDanoFisico(sheet.LevelCriadorInimigo);
            									sheet.DanoMagico = calcularDanoMagico(sheet.LevelCriadorInimigo);
            									sheet.Defesa = calcularDefCriador(tonumber(sheet.LevelCriadorInimigo));
            									sheet.Resistencia = calcularResCriador(tonumber(sheet.LevelCriadorInimigo))
            									calcularChancesCriador(sheet.LevelCriadorInimigo, sheet.RacaCriadorNPC);
            									sheet.Dano = math.random(math.floor(sheet.Dano * 1.1), math.floor(sheet.Dano * 1.2))
            									sheet.HPTotal = math.floor(calcularHPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.MPTotal = math.floor(calcularMPCriador(tonumber(sheet.LevelCriadorInimigo)))
            									sheet.MPTotal = math.floor(math.random(math.floor(sheet.MPTotal * 0.8), math.floor(sheet.MPTotal * 1.2)))
            									ajusteFinal();
            								end;
            							else
            								showMessage("Level tem que ser maior que 0 e diferente de vazio")
            							end;
            						end;
            
            						if self.cmbNpcBoss.value == '2' then
            							calcularDeBoss(sheet.NumeroDeAlvos)
            						end
        end);

    obj._e_event27 = obj.button16:addEventListener("onClick",
        function (event)
            self.popCriaInimigo:show();
            				sheet.LevelCriadorInimigo = tonumber(sheet.level)
        end);

    obj._e_event28 = obj.button17:addEventListener("onClick",
        function (event)
            Drop1();
        end);

    obj._e_event29 = obj.button18:addEventListener("onClick",
        function (event)
            Drop2();
        end);

    obj._e_event30 = obj.button19:addEventListener("onClick",
        function (event)
            Drop3();
        end);

    obj._e_event31 = obj.button20:addEventListener("onClick",
        function (event)
            Drop4();
        end);

    obj._e_event32 = obj.button21:addEventListener("onClick",
        function (event)
            RolarTesteAtletismo()
        end);

    obj._e_event33 = obj.button22:addEventListener("onClick",
        function (event)
            RolarTesteSabedoria()
        end);

    obj._e_event34 = obj.button23:addEventListener("onClick",
        function (event)
            RolarTestePercepcao()
        end);

    obj._e_event35 = obj.button24:addEventListener("onClick",
        function (event)
            RolarTesteAcrobacia()
        end);

    obj._e_event36 = obj.button25:addEventListener("onClick",
        function (event)
            RolarTesteVigor()
        end);

    obj._e_event37 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            CalculadorRESISTLevel();
            			
            			if sheet.Level == 30 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /6);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /6);
            			end;	
            				
            			if sheet.level == 29 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /5.6);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /5.6);
            			end;
            			
            			if sheet.level == 28 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /5.3);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /5.3);
            			end;
            			
            			if sheet.level == 27 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /5);
            			end;
            			
            			if sheet.level == 26 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /4.75);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /4.75);
            			end;
            
            			if sheet.level == 25 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /4.6);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /4.6);
            			end;
            			
            			if sheet.level == 24 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /4.3);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /4.3);
            			end;
            			
            			if sheet.level == 23 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /4);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /4);
            			end;
            			
            			if sheet.level == 22 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.8);
            			end;
            			
            			if sheet.level == 21 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.6);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.6);
            			end;
            			
            			if sheet.level == 20 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.4);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.4);
            			end;
            			
            			if sheet.level == 19 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.2);
            			end;
            			
            			if sheet.level == 18 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3);
            			end;
            			
            			if sheet.level == 17 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.7);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.7);
            			end;
            			
            			if sheet.level == 16 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.55);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.55);
            			end;
            			
            			if sheet.level == 15 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.4);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.4);
            			end;
            			
            			if sheet.level == 14 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.2);
            			end;
            			
            			if sheet.level == 13 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2);
            			end;
            			
            			if sheet.level == 12 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.8);
            			end;
            			
            			if sheet.level == 11 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.65);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.65);
            			end;
            			
            			if sheet.level == 10 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.55);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.55);
            			end;
            			
            			if sheet.level == 9 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.35);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.35);
            			end;
            			
            			if sheet.level == 8 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.25);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.25);
            			end;
            			
            			if sheet.level == 7 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1);
            			end;
            			
            			if sheet.level == 6 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.9);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.9);
            			end;
            			
            			if sheet.level == 5 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.8);
            			end;
            			
            			if sheet.level == 4 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.65);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.65);
            			end;
            			
            			if sheet.level == 3 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.47);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.47);
            			end;
            			
            			if sheet.level == 2 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.37);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.37);
            			end;
            			
            			if sheet.level == 1 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.25);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.25);
            			end;
            			
            			sheet.ResistenciaPorCent = (tonumber(sheet.ResistenciaPorCent) or 0) + (tonumber(sheet.ResistenciaPadrao) or 0);
            			
            			sheet.DefesaPorCent = math.floor(tonumber(sheet.DefesaPorCent) or 0);
            			sheet.ResistenciaPorCent = math.floor(tonumber(sheet.ResistenciaPorCent) or 0);
        end);

    obj._e_event38 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.BarraHP.value = tonumber(sheet.HPAtual);
            			self.BarraHP.max = tonumber(sheet.HPTotal);
        end);

    obj._e_event39 = obj.dataLink7:addEventListener("onChange",
        function (field, oldValue, newValue)
            sheet.level = tonumber(sheet.LevelCriadorInimigo)
        end);

    obj._e_event40 = obj.dataLink8:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.BarraMP.value = tonumber(sheet.MPAtual);
            			self.BarraMP.max = tonumber(sheet.MPTotal);
        end);

    function obj:_releaseEvents()
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
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.CbxMeca2 ~= nil then self.CbxMeca2:destroy(); self.CbxMeca2 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.btnMeca4 ~= nil then self.btnMeca4:destroy(); self.btnMeca4 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.cmbInimigosHM ~= nil then self.cmbInimigosHM:destroy(); self.cmbInimigosHM = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.BarraMP ~= nil then self.BarraMP:destroy(); self.BarraMP = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.NameTipoDeGrupo ~= nil then self.NameTipoDeGrupo:destroy(); self.NameTipoDeGrupo = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.cmbTipoGrupoHM ~= nil then self.cmbTipoGrupoHM:destroy(); self.cmbTipoGrupoHM = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.cmbInimigos ~= nil then self.cmbInimigos:destroy(); self.cmbInimigos = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.BarraHP ~= nil then self.BarraHP:destroy(); self.BarraHP = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.rclHabilidadeInimigo ~= nil then self.rclHabilidadeInimigo:destroy(); self.rclHabilidadeInimigo = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.CbxMeca3 ~= nil then self.CbxMeca3:destroy(); self.CbxMeca3 = nil; end;
        if self.TargetNameHM ~= nil then self.TargetNameHM:destroy(); self.TargetNameHM = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.cmbForteContra ~= nil then self.cmbForteContra:destroy(); self.cmbForteContra = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.btnMeca3 ~= nil then self.btnMeca3:destroy(); self.btnMeca3 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.popMecanica1 ~= nil then self.popMecanica1:destroy(); self.popMecanica1 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.NameTipoDeGrupoHM ~= nil then self.NameTipoDeGrupoHM:destroy(); self.NameTipoDeGrupoHM = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.popAtaqueBasico ~= nil then self.popAtaqueBasico:destroy(); self.popAtaqueBasico = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.cmbPoderNPC ~= nil then self.cmbPoderNPC:destroy(); self.cmbPoderNPC = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.UsarMecanicaAtual ~= nil then self.UsarMecanicaAtual:destroy(); self.UsarMecanicaAtual = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.cmbRacaBoss ~= nil then self.cmbRacaBoss:destroy(); self.cmbRacaBoss = nil; end;
        if self.AtkBasicI ~= nil then self.AtkBasicI:destroy(); self.AtkBasicI = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.popExtra ~= nil then self.popExtra:destroy(); self.popExtra = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.btnMeca2 ~= nil then self.btnMeca2:destroy(); self.btnMeca2 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edtNdeAlvos ~= nil then self.edtNdeAlvos:destroy(); self.edtNdeAlvos = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.cmbNpcBoss ~= nil then self.cmbNpcBoss:destroy(); self.cmbNpcBoss = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.cmbClasseNpc ~= nil then self.cmbClasseNpc:destroy(); self.cmbClasseNpc = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edtMaiorDano ~= nil then self.edtMaiorDano:destroy(); self.edtMaiorDano = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.CbxMeca4 ~= nil then self.CbxMeca4:destroy(); self.CbxMeca4 = nil; end;
        if self.TargetName ~= nil then self.TargetName:destroy(); self.TargetName = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.CbxMeca1 ~= nil then self.CbxMeca1:destroy(); self.CbxMeca1 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.btnMeca1 ~= nil then self.btnMeca1:destroy(); self.btnMeca1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.popMecanica4 ~= nil then self.popMecanica4:destroy(); self.popMecanica4 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.URLIMG ~= nil then self.URLIMG:destroy(); self.URLIMG = nil; end;
        if self.popMecanica3 ~= nil then self.popMecanica3:destroy(); self.popMecanica3 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.cmbTipoGrupo ~= nil then self.cmbTipoGrupo:destroy(); self.cmbTipoGrupo = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.PopUPMecanicasHabilidade ~= nil then self.PopUPMecanicasHabilidade:destroy(); self.PopUPMecanicasHabilidade = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.popMecanica2 ~= nil then self.popMecanica2:destroy(); self.popMecanica2 = nil; end;
        if self.dscHabilidadeInimigo ~= nil then self.dscHabilidadeInimigo:destroy(); self.dscHabilidadeInimigo = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edtMaiorHP ~= nil then self.edtMaiorHP:destroy(); self.edtMaiorHP = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.popCriaInimigo ~= nil then self.popCriaInimigo:destroy(); self.popCriaInimigo = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmIVelen()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmIVelen();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmIVelen = {
    newEditor = newfrmIVelen, 
    new = newfrmIVelen, 
    name = "frmIVelen", 
    dataType = "com.InimigoVelen", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Velen 4 Inimigos", 
    description=""};

frmIVelen = _frmIVelen;
Firecast.registrarForm(_frmIVelen);
Firecast.registrarDataType(_frmIVelen);

return _frmIVelen;
