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
				sheet.TurnoAtualControle = (sheet.TurnoAtualControle or 0) + 1
			else
				sheet.AcaoAtualIndex = sheet.AcaoAtualIndex + 1
				if sheet.AcaoAtualIndex > #acoes then
					sheet.AcaoAtualIndex = 1  -- Reinicia o ciclo das ações
					
					sheet.TurnoAtualControle = (sheet.TurnoAtualControle or 0) + 1
					sheet.VezAtualIndex = sheet.VezAtualIndex + 1
					sheet.AcaoAtualControle = acoes[sheet.AcaoAtualIndex]
					
					sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
					if sheet.VezAtualControle == nil or sheet.VezAtualControle == "" then
						sheet.VezAtualIndex = 1
					else
						sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
					end;
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
				sheet.TurnoAtualControle = (sheet.TurnoAtualControle or 0) - 1
			else
				sheet.AcaoAtualIndex = sheet.AcaoAtualIndex - 1
				if sheet.AcaoAtualIndex < 1 then
					sheet.AcaoAtualIndex = 3  -- Reinicia o ciclo das ações
					sheet.TurnoAtualControle = (sheet.TurnoAtualControle or 0) - 1
					sheet.VezAtualIndex = sheet.VezAtualIndex - 1
					sheet.AcaoAtualControle = acoes[sheet.AcaoAtualIndex]
					sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
					if sheet.VezAtualControle == nil or sheet.VezAtualControle == "" then
						sheet.VezAtualIndex = #lista2
					else
						sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
					end;
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
			lista2 = criarEIncrementarLista();
			
			if acoes == nil then
				acoes = sheet.AcaoAtual
			end;
			
			if sheet.VezAtualIndex == nil then
				sheet.VezAtualIndex = 1
			end;

			sheet.VezAtualIndex = tonumber(sheet.VezAtualIndex) + 1

			if sheet.VezAtualIndex > #lista2 then
				sheet.VezAtualIndex = 1 -- reinicia o player para começar dnv
			end;

			sheet.VezAtualControle = lista2[sheet.VezAtualIndex]

			if sheet.VezAtualControle == nil or sheet.VezAtualControle == "" then
				sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
			end;

			chat:enviarNarracao("[§K4]VEZ [§K1]ALTERADA PELO MESTRE [§K4]" .. sheet.VezAtualControle)
						
		end;
		
		



		function AnteriorVez()
			local minhaMesa = Firecast.getRoomOf(sheet)
			local chat = minhaMesa.chat
			acoes = {"Ação De Buff", "Ação de Ataque", "Ação de Defesa"}
			lista2 = criarEIncrementarLista();
			
			if acoes == nil then
				acoes = sheet.AcaoAtual
			end;
			
			if sheet.VezAtualIndex == nil then
				sheet.VezAtualIndex = #lista2
			end;

			sheet.VezAtualIndex = tonumber(sheet.VezAtualIndex) - 1

			if sheet.VezAtualIndex < 1 then
				sheet.VezAtualIndex = #lista2 -- reinicia o player para começar dnv
			end;

			sheet.VezAtualControle = lista2[sheet.VezAtualIndex]

			if sheet.VezAtualControle == nil or sheet.VezAtualControle == "" then
				sheet.VezAtualControle = lista2[sheet.VezAtualIndex]
			end;

			chat:enviarNarracao("[§K4]VEZ [§K1]ALTERADA PELO MESTRE [§K4]" .. sheet.VezAtualControle)
						
		end;
		



		
	


		
		function ProximoTurno()
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
						
		end;
		
		



		function AnteriorTurno()
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

			if sheet.TurnoAtualControle < 1 then
				sheet.TurnoAtualControle = 1
			end;

			chat:enviarNarracao("[§K4]TURNO [§K1]ALTERADO PELO MESTRE | [§K4]" .. sheet.TurnoAtualControle)
						
		end;
		



		
	


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

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.progressBar1);
    obj.label2:setAlign("left");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setField("HPBar");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.progressBar1);
    obj.label3:setAlign("client");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("/");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.progressBar1);
    obj.label4:setAlign("right");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setField("HPBarMax");
    obj.label4:setName("label4");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.layout1);
    obj.progressBar2:setAlign("top");
    obj.progressBar2:setWidth(150);
    obj.progressBar2:setColor("blue");
    obj.progressBar2:setField("MPBar");
    obj.progressBar2:setFieldMax("MPBarMax");
    obj.progressBar2:setMargins({top=1});
    obj.progressBar2:setName("progressBar2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.progressBar2);
    obj.label5:setAlign("left");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setField("MPBar");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.progressBar2);
    obj.label6:setAlign("right");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setText("---/---");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.progressBar2);
    obj.label7:setAlign("right");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setField("MPBarMax");
    obj.label7:setName("label7");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(50);
    obj.layout2:setMargins({right=1});
    obj.layout2:setName("layout2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setAlign("top");
    obj.label8:setText("PA:");
    obj.label8:setWidth(50);
    obj.label8:setMargins({left=10});
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setAlign("top");
    obj.label9:setText("PM:");
    obj.label9:setWidth(50);
    obj.label9:setMargins({left=10});
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setAlign("top");
    obj.label10:setText("PF:");
    obj.label10:setWidth(50);
    obj.label10:setMargins({left=10});
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setAlign("top");
    obj.label11:setText("DEF:");
    obj.label11:setWidth(50);
    obj.label11:setMargins({left=10});
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setAlign("top");
    obj.label12:setText("RES:");
    obj.label12:setWidth(50);
    obj.label12:setMargins({left=10});
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setAlign("top");
    obj.label13:setText("---");
    obj.label13:setWidth(50);
    obj.label13:setMargins({left=10});
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setAlign("top");
    obj.label14:setText("AC:");
    obj.label14:setWidth(50);
    obj.label14:setMargins({left=10});
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setAlign("top");
    obj.label15:setText("ACM:");
    obj.label15:setWidth(50);
    obj.label15:setMargins({left=10});
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setAlign("top");
    obj.label16:setText("CR:");
    obj.label16:setWidth(50);
    obj.label16:setMargins({left=10});
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setAlign("top");
    obj.label17:setText("CRM:");
    obj.label17:setWidth(50);
    obj.label17:setMargins({left=10});
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout2);
    obj.label18:setAlign("top");
    obj.label18:setText("---");
    obj.label18:setWidth(50);
    obj.label18:setMargins({left=10});
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout2);
    obj.label19:setAlign("top");
    obj.label19:setText("ESQ:");
    obj.label19:setWidth(50);
    obj.label19:setMargins({left=10});
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout2);
    obj.label20:setAlign("top");
    obj.label20:setText("Pers:");
    obj.label20:setWidth(50);
    obj.label20:setMargins({left=10});
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout2);
    obj.label21:setAlign("top");
    obj.label21:setText("---");
    obj.label21:setWidth(50);
    obj.label21:setMargins({left=10});
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout2);
    obj.label22:setAlign("top");
    obj.label22:setText("Vez:");
    obj.label22:setFontColor("red");
    obj.label22:setWidth(50);
    obj.label22:setMargins({left=10});
    obj.label22:setName("label22");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(50);
    obj.layout3:setMargins({right=1});
    obj.layout3:setName("layout3");

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
    obj.edit2:setFontColor("red");
    obj.edit2:setWidth(50);
    obj.edit2:setMargins({left=10});
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(75);
    obj.layout4:setMargins({right=1});
    obj.layout4:setName("layout4");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout4);
    obj.label37:setAlign("top");
    obj.label37:setText("Atletismo:");
    obj.label37:setAutoSize(true);
    obj.label37:setMargins({left=10});
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout4);
    obj.label38:setAlign("top");
    obj.label38:setText("Sabedoria:");
    obj.label38:setAutoSize(true);
    obj.label38:setMargins({left=10});
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout4);
    obj.label39:setAlign("top");
    obj.label39:setText("Percepcao:");
    obj.label39:setAutoSize(true);
    obj.label39:setMargins({left=10});
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout4);
    obj.label40:setAlign("top");
    obj.label40:setText("Acrobacia:");
    obj.label40:setAutoSize(true);
    obj.label40:setMargins({left=10});
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout4);
    obj.label41:setAlign("top");
    obj.label41:setText("Vigor:");
    obj.label41:setAutoSize(true);
    obj.label41:setMargins({left=10});
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout4);
    obj.label42:setAlign("top");
    obj.label42:setText("---");
    obj.label42:setWidth(50);
    obj.label42:setMargins({left=10});
    obj.label42:setName("label42");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(50);
    obj.layout5:setMargins({right=1});
    obj.layout5:setName("layout5");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout5);
    obj.label43:setAlign("top");
    obj.label43:setField("Atletismo");
    obj.label43:setWidth(50);
    obj.label43:setMargins({left=10});
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout5);
    obj.label44:setAlign("top");
    obj.label44:setField("Sabedoria");
    obj.label44:setWidth(50);
    obj.label44:setMargins({left=10});
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout5);
    obj.label45:setAlign("top");
    obj.label45:setField("Percepcao");
    obj.label45:setWidth(50);
    obj.label45:setMargins({left=10});
    obj.label45:setName("label45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout5);
    obj.label46:setAlign("top");
    obj.label46:setField("Acrobacia");
    obj.label46:setWidth(50);
    obj.label46:setMargins({left=10});
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout5);
    obj.label47:setAlign("top");
    obj.label47:setField("Vigor");
    obj.label47:setWidth(50);
    obj.label47:setMargins({left=10});
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout5);
    obj.label48:setAlign("top");
    obj.label48:setText("---");
    obj.label48:setWidth(50);
    obj.label48:setMargins({left=10});
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj);
    obj.label49:setText("Controle de Turnos");
    obj.label49:setLeft(620);
    obj.label49:setWidth(150);
    obj.label49:setTop(10);
    obj.label49:setFontSize(15);
    obj.label49:setName("label49");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj);
    obj.layout6:setLeft(620);
    obj.layout6:setTop(40);
    obj.layout6:setWidth(200);
    obj.layout6:setHeight(60);
    obj.layout6:setName("layout6");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout6);
    obj.label50:setText("Turno Atual:");
    obj.label50:setAlign("top");
    obj.label50:setAutoSize(true);
    obj.label50:setFontSize(16);
    obj.label50:setFontColor("white");
    obj.label50:setName("label50");

    obj.editTurnoAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.editTurnoAtual:setParent(obj.layout6);
    obj.editTurnoAtual:setName("editTurnoAtual");
    obj.editTurnoAtual:setField("TurnoAtualControle");
    obj.editTurnoAtual:setAlign("top");
    obj.editTurnoAtual:setWidth(200);
    obj.editTurnoAtual:setHeight(20);
    obj.editTurnoAtual:setHorzTextAlign("center");

    obj.btnTurnoAnterior = GUI.fromHandle(_obj_newObject("button"));
    obj.btnTurnoAnterior:setParent(obj.layout6);
    obj.btnTurnoAnterior:setName("btnTurnoAnterior");
    obj.btnTurnoAnterior:setText("AnteriorRR");
    obj.btnTurnoAnterior:setAlign("left");
    obj.btnTurnoAnterior:setWidth(90);
    obj.btnTurnoAnterior:setHeight(20);
    obj.btnTurnoAnterior:setTop(40);

    obj.btnTurnoProximo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnTurnoProximo:setParent(obj.layout6);
    obj.btnTurnoProximo:setName("btnTurnoProximo");
    obj.btnTurnoProximo:setText("Próximo");
    obj.btnTurnoProximo:setAlign("right");
    obj.btnTurnoProximo:setWidth(90);
    obj.btnTurnoProximo:setHeight(20);
    obj.btnTurnoProximo:setTop(40);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj);
    obj.layout7:setLeft(620);
    obj.layout7:setTop(120);
    obj.layout7:setWidth(200);
    obj.layout7:setHeight(60);
    obj.layout7:setName("layout7");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout7);
    obj.label51:setText("Vez Atual:");
    obj.label51:setAlign("top");
    obj.label51:setAutoSize(true);
    obj.label51:setFontSize(16);
    obj.label51:setFontColor("white");
    obj.label51:setName("label51");

    obj.editVezAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.editVezAtual:setParent(obj.layout7);
    obj.editVezAtual:setName("editVezAtual");
    obj.editVezAtual:setField("VezAtualControle");
    obj.editVezAtual:setAlign("top");
    obj.editVezAtual:setWidth(200);
    obj.editVezAtual:setHeight(20);
    obj.editVezAtual:setReadOnly(true);
    obj.editVezAtual:setHorzTextAlign("center");

    obj.btnVezAnterior = GUI.fromHandle(_obj_newObject("button"));
    obj.btnVezAnterior:setParent(obj.layout7);
    obj.btnVezAnterior:setName("btnVezAnterior");
    obj.btnVezAnterior:setText("Anterior");
    obj.btnVezAnterior:setAlign("left");
    obj.btnVezAnterior:setWidth(90);
    obj.btnVezAnterior:setHeight(20);
    obj.btnVezAnterior:setTop(40);

    obj.btnVezProximo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnVezProximo:setParent(obj.layout7);
    obj.btnVezProximo:setName("btnVezProximo");
    obj.btnVezProximo:setText("PRÓXIMO");
    obj.btnVezProximo:setAlign("right");
    obj.btnVezProximo:setWidth(90);
    obj.btnVezProximo:setHeight(20);
    obj.btnVezProximo:setTop(40);

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj);
    obj.layout8:setLeft(620);
    obj.layout8:setTop(200);
    obj.layout8:setWidth(200);
    obj.layout8:setHeight(60);
    obj.layout8:setName("layout8");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout8);
    obj.label52:setText("Ação Atual:");
    obj.label52:setAlign("top");
    obj.label52:setAutoSize(true);
    obj.label52:setFontSize(16);
    obj.label52:setFontColor("white");
    obj.label52:setName("label52");

    obj.editAcaoAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.editAcaoAtual:setParent(obj.layout8);
    obj.editAcaoAtual:setName("editAcaoAtual");
    obj.editAcaoAtual:setField("AcaoAtual");
    obj.editAcaoAtual:setAlign("top");
    obj.editAcaoAtual:setWidth(200);
    obj.editAcaoAtual:setHeight(20);
    obj.editAcaoAtual:setReadOnly(false);
    obj.editAcaoAtual:setHorzTextAlign("center");

    obj.btnAcaoAnterior = GUI.fromHandle(_obj_newObject("button"));
    obj.btnAcaoAnterior:setParent(obj.layout8);
    obj.btnAcaoAnterior:setName("btnAcaoAnterior");
    obj.btnAcaoAnterior:setText("Anterior");
    obj.btnAcaoAnterior:setAlign("left");
    obj.btnAcaoAnterior:setWidth(90);
    obj.btnAcaoAnterior:setHeight(20);
    obj.btnAcaoAnterior:setTop(40);

    obj.btnAcaoProximo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnAcaoProximo:setParent(obj.layout8);
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

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle2);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(150);
    obj.layout9:setMargins({right=2});
    obj.layout9:setName("layout9");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout9);
    obj.image2:setAlign("top");
    obj.image2:setWidth(100);
    obj.image2:setMargins({top=1});
    obj.image2:setSRC("http://fc03.deviantart.net/fs70/i/2011/234/5/4/dragon_aspects_by_rattlesnakedefender-d47ii5y.jpg");
    obj.image2:setName("image2");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout9);
    obj.label53:setAlign("top");
    obj.label53:setText("Jogador:");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setWidth(150);
    obj.label53:setMargins({top=1});
    obj.label53:setName("label53");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout9);
    obj.edit3:setAlign("top");
    obj.edit3:setWidth(150);
    obj.edit3:setField("NomeDoOponente");
    obj.edit3:setMargins({top=1});
    obj.edit3:setName("edit3");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout9);
    obj.button6:setAlign("top");
    obj.button6:setWidth(150);
    obj.button6:setText("Sincronizar");
    obj.button6:setMargins({right=1});
    obj.button6:setName("button6");

    obj.progressBar3 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar3:setParent(obj.layout9);
    obj.progressBar3:setAlign("top");
    obj.progressBar3:setWidth(150);
    obj.progressBar3:setColor("yellow");
    obj.progressBar3:setField("HPBarO");
    obj.progressBar3:setFieldMax("HPBarMaxO");
    obj.progressBar3:setMargins({top=1});
    obj.progressBar3:setName("progressBar3");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.progressBar3);
    obj.label54:setAlign("left");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setField("HPBarO");
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.progressBar3);
    obj.label55:setAlign("client");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setText("/");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.progressBar3);
    obj.label56:setAlign("right");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setField("HPBarMaxO");
    obj.label56:setName("label56");

    obj.progressBar4 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar4:setParent(obj.layout9);
    obj.progressBar4:setAlign("top");
    obj.progressBar4:setWidth(150);
    obj.progressBar4:setColor("blue");
    obj.progressBar4:setField("MPBarO");
    obj.progressBar4:setFieldMax("MPBarMaxO");
    obj.progressBar4:setMargins({top=1});
    obj.progressBar4:setName("progressBar4");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.progressBar4);
    obj.label57:setAlign("left");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setField("MPBarO");
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.progressBar4);
    obj.label58:setAlign("right");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setText("---/---");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.progressBar4);
    obj.label59:setAlign("right");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setField("MPBarMaxO");
    obj.label59:setName("label59");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle2);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(50);
    obj.layout10:setMargins({right=1});
    obj.layout10:setName("layout10");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout10);
    obj.label60:setAlign("top");
    obj.label60:setText("PA:");
    obj.label60:setWidth(50);
    obj.label60:setMargins({left=10});
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout10);
    obj.label61:setAlign("top");
    obj.label61:setText("PM:");
    obj.label61:setWidth(50);
    obj.label61:setMargins({left=10});
    obj.label61:setName("label61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout10);
    obj.label62:setAlign("top");
    obj.label62:setText("PF:");
    obj.label62:setWidth(50);
    obj.label62:setMargins({left=10});
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout10);
    obj.label63:setAlign("top");
    obj.label63:setText("DEF:");
    obj.label63:setWidth(50);
    obj.label63:setMargins({left=10});
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout10);
    obj.label64:setAlign("top");
    obj.label64:setText("RES:");
    obj.label64:setWidth(50);
    obj.label64:setMargins({left=10});
    obj.label64:setName("label64");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout10);
    obj.label65:setAlign("top");
    obj.label65:setText("---");
    obj.label65:setWidth(50);
    obj.label65:setMargins({left=10});
    obj.label65:setName("label65");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout10);
    obj.label66:setAlign("top");
    obj.label66:setText("AC:");
    obj.label66:setWidth(50);
    obj.label66:setMargins({left=10});
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout10);
    obj.label67:setAlign("top");
    obj.label67:setText("ACM:");
    obj.label67:setWidth(50);
    obj.label67:setMargins({left=10});
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout10);
    obj.label68:setAlign("top");
    obj.label68:setText("CR:");
    obj.label68:setWidth(50);
    obj.label68:setMargins({left=10});
    obj.label68:setName("label68");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout10);
    obj.label69:setAlign("top");
    obj.label69:setText("CRM:");
    obj.label69:setWidth(50);
    obj.label69:setMargins({left=10});
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout10);
    obj.label70:setAlign("top");
    obj.label70:setText("---");
    obj.label70:setWidth(50);
    obj.label70:setMargins({left=10});
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout10);
    obj.label71:setAlign("top");
    obj.label71:setText("ESQ:");
    obj.label71:setWidth(50);
    obj.label71:setMargins({left=10});
    obj.label71:setName("label71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout10);
    obj.label72:setAlign("top");
    obj.label72:setText("Pers:");
    obj.label72:setWidth(50);
    obj.label72:setMargins({left=10});
    obj.label72:setName("label72");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout10);
    obj.label73:setAlign("top");
    obj.label73:setText("---");
    obj.label73:setWidth(50);
    obj.label73:setMargins({left=10});
    obj.label73:setName("label73");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout10);
    obj.label74:setAlign("top");
    obj.label74:setText("Vez:");
    obj.label74:setFontColor("red");
    obj.label74:setWidth(50);
    obj.label74:setMargins({left=10});
    obj.label74:setName("label74");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle2);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(50);
    obj.layout11:setMargins({right=1});
    obj.layout11:setName("layout11");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout11);
    obj.label75:setAlign("top");
    obj.label75:setField("PA");
    obj.label75:setWidth(50);
    obj.label75:setMargins({left=10});
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout11);
    obj.label76:setAlign("top");
    obj.label76:setField("PM");
    obj.label76:setWidth(50);
    obj.label76:setMargins({left=10});
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout11);
    obj.label77:setAlign("top");
    obj.label77:setField("PF");
    obj.label77:setWidth(50);
    obj.label77:setMargins({left=10});
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout11);
    obj.label78:setAlign("top");
    obj.label78:setField("DEF");
    obj.label78:setWidth(50);
    obj.label78:setMargins({left=10});
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout11);
    obj.label79:setAlign("top");
    obj.label79:setField("RES");
    obj.label79:setWidth(50);
    obj.label79:setMargins({left=10});
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout11);
    obj.label80:setAlign("top");
    obj.label80:setText("---");
    obj.label80:setWidth(50);
    obj.label80:setMargins({left=10});
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout11);
    obj.label81:setAlign("top");
    obj.label81:setField("AC");
    obj.label81:setWidth(50);
    obj.label81:setMargins({left=10});
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout11);
    obj.label82:setAlign("top");
    obj.label82:setField("ACM");
    obj.label82:setWidth(50);
    obj.label82:setMargins({left=10});
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout11);
    obj.label83:setAlign("top");
    obj.label83:setField("CR");
    obj.label83:setWidth(50);
    obj.label83:setMargins({left=10});
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout11);
    obj.label84:setAlign("top");
    obj.label84:setField("CRM");
    obj.label84:setWidth(50);
    obj.label84:setMargins({left=10});
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout11);
    obj.label85:setAlign("top");
    obj.label85:setText("---");
    obj.label85:setWidth(50);
    obj.label85:setMargins({left=10});
    obj.label85:setName("label85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout11);
    obj.label86:setAlign("top");
    obj.label86:setField("ESQ");
    obj.label86:setWidth(50);
    obj.label86:setMargins({left=10});
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout11);
    obj.label87:setAlign("top");
    obj.label87:setField("Pers");
    obj.label87:setWidth(50);
    obj.label87:setMargins({left=10});
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout11);
    obj.label88:setAlign("top");
    obj.label88:setText("---");
    obj.label88:setWidth(50);
    obj.label88:setMargins({left=10});
    obj.label88:setName("label88");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout11);
    obj.edit4:setAlign("top");
    obj.edit4:setField("Vez");
    obj.edit4:setFontColor("red");
    obj.edit4:setWidth(50);
    obj.edit4:setMargins({left=10});
    obj.edit4:setName("edit4");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle2);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(75);
    obj.layout12:setMargins({right=1});
    obj.layout12:setName("layout12");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout12);
    obj.label89:setAlign("top");
    obj.label89:setText("Atletismo:");
    obj.label89:setAutoSize(true);
    obj.label89:setMargins({left=10});
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout12);
    obj.label90:setAlign("top");
    obj.label90:setText("Sabedoria:");
    obj.label90:setAutoSize(true);
    obj.label90:setMargins({left=10});
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout12);
    obj.label91:setAlign("top");
    obj.label91:setText("Percepcao:");
    obj.label91:setAutoSize(true);
    obj.label91:setMargins({left=10});
    obj.label91:setName("label91");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout12);
    obj.label92:setAlign("top");
    obj.label92:setText("Acrobacia:");
    obj.label92:setAutoSize(true);
    obj.label92:setMargins({left=10});
    obj.label92:setName("label92");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout12);
    obj.label93:setAlign("top");
    obj.label93:setText("Vigor:");
    obj.label93:setAutoSize(true);
    obj.label93:setMargins({left=10});
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout12);
    obj.label94:setAlign("top");
    obj.label94:setText("---");
    obj.label94:setWidth(50);
    obj.label94:setMargins({left=10});
    obj.label94:setName("label94");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle2);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(50);
    obj.layout13:setMargins({right=1});
    obj.layout13:setName("layout13");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout13);
    obj.label95:setAlign("top");
    obj.label95:setField("Atletismo");
    obj.label95:setWidth(50);
    obj.label95:setMargins({left=10});
    obj.label95:setName("label95");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout13);
    obj.label96:setAlign("top");
    obj.label96:setField("Sabedoria");
    obj.label96:setWidth(50);
    obj.label96:setMargins({left=10});
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout13);
    obj.label97:setAlign("top");
    obj.label97:setField("Percepcao");
    obj.label97:setWidth(50);
    obj.label97:setMargins({left=10});
    obj.label97:setName("label97");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout13);
    obj.label98:setAlign("top");
    obj.label98:setField("Acrobacia");
    obj.label98:setWidth(50);
    obj.label98:setMargins({left=10});
    obj.label98:setName("label98");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout13);
    obj.label99:setAlign("top");
    obj.label99:setField("Vigor");
    obj.label99:setWidth(50);
    obj.label99:setMargins({left=10});
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout13);
    obj.label100:setAlign("top");
    obj.label100:setText("---");
    obj.label100:setWidth(50);
    obj.label100:setMargins({left=10});
    obj.label100:setName("label100");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'ACAOTURNO'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            sheet.ACAOTURNO = (tonumber(sheet.ACAOTURNO) or 0);
        end);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (event)
            self.rclGrupoJogadores:append();
        end);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (event)
            -- Chama a função para criar e incrementar a lista
            			criarEIncrementarLista()
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
            local node = self.rclGrupoJogadores.selectedNode; 
            			
            			self.BoxDetalheJogadores.node = node;
            
            			self.rclGrupoJogadores:sort();
            			
            			self.BoxDetalheJogadores.visible = (node ~= nil);
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
            												node.PA = nodeExterno.PA or '0';
            												node.PM = nodeExterno.PM or '0';
            												node.PF = nodeExterno.PF or '0';
            												node.DEF = nodeExterno.DEFRED or '0';
            												node.RES = nodeExterno.RESRED or '0';
            												node.AC = nodeExterno.Acerto or '0';
            												node.ACM = nodeExterno.AcertoMagico or '0';
            												node.CR = nodeExterno.Critical or '0';
            												node.CRM = nodeExterno.CMagico or '0';
            												node.ESQ = nodeExterno.Esquiva or '0';
            												node.Pers = math.floor(nodeExterno.Persistencia) or '0';
            												node.Vez = node.Vez or '0';
            												node.Atletismo = nodeExterno.TAtletismo or '0';
            												node.Sabedoria = nodeExterno.TSabedoria or '0';
            												node.Percepcao = nodeExterno.TPercepcao or '0';
            												node.Acrobacia = nodeExterno.TAcrobacia or '0';
            												node.Vigor = nodeExterno.TVigor or '0';
            												node.HPBarMax = nodeExterno.HPTotal or '0';
            												node.MPBarMax = nodeExterno.MPTotal or '0';
            												node.HPBar = nodeExterno.HPAtual or '0';
            												node.MPBar = nodeExterno.MPAtual or '0';
            												node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoPersonagem
            											else
            												node.PA = nodeExterno.Dano or '0';
            												node.PM = nodeExterno.DanoMagico or '0';
            												node.PF = "NPC";
            												node.DEF = nodeExterno.DefesaPorCent or '0';
            												node.RES = nodeExterno.ResistenciaPorCent or '0';
            												node.AC = nodeExterno.Acerto or '0';
            												node.ACM = nodeExterno.AcertoMagico or '0';
            												node.CR = nodeExterno.Critical or '0';
            												node.CRM = nodeExterno.CriticalMagico or '0';
            												node.ESQ = nodeExterno.Esquiva or '0';
            												node.Pers = math.floor(nodeExterno.Persistencia) or '0';
            												node.Vez = node.Vez or '0';
            												node.Atletismo = nodeExterno.Atletismo or '0';
            												node.Sabedoria = nodeExterno.Sabedoria or '0';
            												node.Percepcao = nodeExterno.Percepcao or '0';
            												node.Acrobacia = nodeExterno.Acrobacia or '0';
            												node.Vigor = nodeExterno.TVigor or '0';
            												node.HPBarMax = nodeExterno.HPTotal or '0';
            												node.MPBarMax = nodeExterno.MPTotal or '0';
            												node.HPBar = nodeExterno.HPAtual or '0';
            												node.MPBar = nodeExterno.MPAtual or '0';
            												node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
            											end;
            										end
            									end
            								return nomes								
            									
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);
            								
            							end;
        end);

    obj._e_event7 = obj.btnTurnoAnterior:addEventListener("onClick",
        function (event)
            AnteriorTurno();
        end);

    obj._e_event8 = obj.btnTurnoProximo:addEventListener("onClick",
        function (event)
            ProximoTurno();
        end);

    obj._e_event9 = obj.btnVezAnterior:addEventListener("onClick",
        function (event)
            AnteriorVez();
        end);

    obj._e_event10 = obj.btnVezProximo:addEventListener("onClick",
        function (event)
            ProximaVez();
        end);

    obj._e_event11 = obj.btnAcaoAnterior:addEventListener("onClick",
        function (event)
            AnteriorAcao();
        end);

    obj._e_event12 = obj.btnAcaoProximo:addEventListener("onClick",
        function (event)
            ProximaAcao();
        end);

    obj._e_event13 = obj.TrocadorDeAcao:addEventListener("onTimer",
        function ()
            AcaoAtualControlador()
        end);

    obj._e_event14 = obj.AvisoDeTempo:addEventListener("onTimer",
        function ()
            AvisoDeTempoControlador()
        end);

    obj._e_event15 = obj.button5:addEventListener("onClick",
        function (event)
            self.rclGrupoOponentes:append();
        end);

    obj._e_event16 = obj.rclGrupoOponentes:addEventListener("onSelect",
        function ()
            local node = self.rclGrupoOponentes.selectedNode; 
            				
            			self.BoxDetalheOponentes.node = node; 
            			
            			self.BoxDetalheOponentes.visible = (node ~= nil);
            			
            			self.rclGrupoOponentes:sort();
        end);

    obj._e_event17 = obj.rclGrupoOponentes:addEventListener("onCompare",
        function (nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.Vez, nodeB.Vez);
        end);

    obj._e_event18 = obj.button6:addEventListener("onClick",
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
            											node.PA = nodeExterno.PA or '0';
            											node.PM = nodeExterno.PM or '0';
            											node.PF = nodeExterno.PF or '0';
            											node.DEF = nodeExterno.DEFRED or '0';
            											node.RES = nodeExterno.RESRED or '0';
            											node.AC = nodeExterno.Acerto or '0';
            											node.ACM = nodeExterno.AcertoMagico or '0';
            											node.CR = nodeExterno.Critical or '0';
            											node.CRM = nodeExterno.CMagico or '0';
            											node.ESQ = nodeExterno.Esquiva or '0';
            											node.Pers = (nodeExterno.Persistencia) or '0';
            											node.Vez = node.Vez or '0';
            											node.Atletismo = nodeExterno.TAtletismo or '0';
            											node.Sabedoria = nodeExterno.TSabedoria or '0';
            											node.Percepcao = nodeExterno.TPercepcao or '0';
            											node.Acrobacia = nodeExterno.TAcrobacia or '0';
            											node.Vigor = nodeExterno.TVigor or '0';
            											node.HPBarMaxO = nodeExterno.HPTotal or '0';
            											node.MPBarMaxO = nodeExterno.MPTotal or '0';
            											node.HPBarO = nodeExterno.HPAtual or '0';
            											node.MPBarO = nodeExterno.MPAtual or '0';
            											node.NomeDoOponenteVez = node.Vez .. " - " ..  node.NomeDoOponente
            										else
            											node.PA = nodeExterno.Dano or '0';
            											node.PM = nodeExterno.DanoMagico or '0';
            											node.PF = "NPC";
            											node.DEF = nodeExterno.DefesaPorCent or '0';
            											node.RES = nodeExterno.ResistenciaPorCent or '0';
            											node.AC = nodeExterno.Acerto or '0';
            											node.ACM = nodeExterno.AcertoMagico or '0';
            											node.CR = nodeExterno.Critical or '0';
            											node.CRM = nodeExterno.CriticalMagico or '0';
            											node.ESQ = nodeExterno.Esquiva or '0';
            											node.Pers = math.floor(nodeExterno.Persistencia) or '0';
            											node.Vez = node.Vez or '0';
            											node.Atletismo = nodeExterno.Atletismo or '0';
            											node.Sabedoria = nodeExterno.Sabedoria or '0';
            											node.Percepcao = nodeExterno.Percepcao or '0';
            											node.Acrobacia = nodeExterno.Acrobacia or '0';
            											node.Vigor = nodeExterno.TVigor or '0';
            											node.HPBarMax = nodeExterno.HPTotal or '0';
            											node.MPBarMax = nodeExterno.MPTotal or '0';
            											node.HPBar = nodeExterno.HPAtual or '0';
            											node.MPBar = nodeExterno.MPAtual or '0';
            											node.NomeDoPersonagemVez = node.Vez .. " - " ..  nodeExterno.Nome
            										end;
            									end
            								end
            							return nomes
            							end
            							local nomesDeTodosOsItens = obterNomesRecursivoO(bibliotecaAtual);
            						end;
        end);

    obj._e_event19 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
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
            										node.HPBarO = (node.HPBarO - await(sheet.DanoRecebido))
            										nodeExterno.HPAtual = node.HPBarO or '0';
            
            									end
            								end
            							return nomes
            							end
            							local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);
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
            
            							local function obterNomesRecursivoO(bibItem)
            								local itensFilhos = bibItem.children;
            								local nomes = bibItem.name;
            
            								for i = 1, #itensFilhos, 1 do
            									local bibItemFilho = itensFilhos[i];
            									local nomesDoFilho = obterNomesRecursivoO(bibItemFilho) or "";
            
            									if nomesDoFilho == node.NomeDoPersonagem then
            										-- Obter ID do personagem Loan
            										local idPersonagem = bibItemFilho;
            
            										-- Solicita acesso à ficha do personagem
            										local promise = bibItemFilho:asyncOpenNDB();
            
            										-- Aguarda até que a ficha esteja carregada
            										local nodeExterno = await(promise);
            										node.HPBar = (node.HPBar - await(sheet.DanoRecebido))
            										nodeExterno.HPAtual = node.HPBar or '0';
            										
            									end
            								end
            							return nomes
            							end
            							local nomesDeTodosOsItens = obterNomesRecursivoO(bibliotecaAtual);
            						end;
            						
            					end
            				end
            			end
        end);

    function obj:_releaseEvents()
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
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.TrocadorDeAcao ~= nil then self.TrocadorDeAcao:destroy(); self.TrocadorDeAcao = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.btnVezAnterior ~= nil then self.btnVezAnterior:destroy(); self.btnVezAnterior = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.BoxDetalheJogadores ~= nil then self.BoxDetalheJogadores:destroy(); self.BoxDetalheJogadores = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.progressBar3 ~= nil then self.progressBar3:destroy(); self.progressBar3 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.BoxDetalheOponentes ~= nil then self.BoxDetalheOponentes:destroy(); self.BoxDetalheOponentes = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.btnVezProximo ~= nil then self.btnVezProximo:destroy(); self.btnVezProximo = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.editTurnoAtual ~= nil then self.editTurnoAtual:destroy(); self.editTurnoAtual = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.editAcaoAtual ~= nil then self.editAcaoAtual:destroy(); self.editAcaoAtual = nil; end;
        if self.rclGrupoJogadores ~= nil then self.rclGrupoJogadores:destroy(); self.rclGrupoJogadores = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.progressBar4 ~= nil then self.progressBar4:destroy(); self.progressBar4 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.btnAcaoProximo ~= nil then self.btnAcaoProximo:destroy(); self.btnAcaoProximo = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.btnTurnoAnterior ~= nil then self.btnTurnoAnterior:destroy(); self.btnTurnoAnterior = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.editVezAtual ~= nil then self.editVezAtual:destroy(); self.editVezAtual = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.rclGrupoOponentes ~= nil then self.rclGrupoOponentes:destroy(); self.rclGrupoOponentes = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.AvisoDeTempo ~= nil then self.AvisoDeTempo:destroy(); self.AvisoDeTempo = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.btnAcaoAnterior ~= nil then self.btnAcaoAnterior:destroy(); self.btnAcaoAnterior = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.btnTurnoProximo ~= nil then self.btnTurnoProximo:destroy(); self.btnTurnoProximo = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
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
