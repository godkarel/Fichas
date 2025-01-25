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
				sheet.TurnoAtualControle = tonumber(sheet.TurnoAtualControle) + 1
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
				sheet.TurnoAtualControle = tonumber(sheet.TurnoAtualControle) - 1
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

			if sheet.TurnoAtualControle < 0 then
				sheet.TurnoAtualControle = 0
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

    obj.popEffect = GUI.fromHandle(_obj_newObject("popup"));
    obj.popEffect:setParent(obj.layout1);
    obj.popEffect:setName("popEffect");
    obj.popEffect:setWidth(600);
    obj.popEffect:setHeight(300);
    obj.popEffect:setBackOpacity(0.5);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.popEffect);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({bottom=4});
    obj.layout2:setName("layout2");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout2);
    obj.button5:setText("Criar Novo Item");
    obj.button5:setWidth(150);
    obj.button5:setAlign("left");
    obj.button5:setName("button5");

    obj.rclBuffs = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclBuffs:setParent(obj.popEffect);
    obj.rclBuffs:setName("rclBuffs");
    obj.rclBuffs:setField("campoDosItens");
    obj.rclBuffs:setTemplateForm("frmEffect");
    obj.rclBuffs:setAlign("top");
    obj.rclBuffs:setSelectable(true);
    obj.rclBuffs:setLayout("horizontal");
    obj.rclBuffs:setHeight(40);

    obj.dscBuffSlot = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dscBuffSlot:setParent(obj.popEffect);
    obj.dscBuffSlot:setName("dscBuffSlot");
    obj.dscBuffSlot:setVisible(false);
    obj.dscBuffSlot:setAlign("client");
    obj.dscBuffSlot:setMargins({left=4, right=4, top=2});

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.dscBuffSlot);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle2:setName("rectangle2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({bottom=4});
    obj.layout3:setName("layout3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setAlign("left");
    obj.label6:setText("PA");
    obj.label6:setWidth(50);
    obj.label6:setMargins({left=15, right=-10});
    obj.label6:setName("label6");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(50);
    obj.edit2:setMargins({left=15, right=-10});
    obj.edit2:setField("PAEffect");
    obj.edit2:setName("edit2");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setAlign("left");
    obj.label7:setText("PM");
    obj.label7:setWidth(50);
    obj.label7:setMargins({left=15, right=-10});
    obj.label7:setName("label7");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(50);
    obj.edit3:setMargins({left=15, right=-10});
    obj.edit3:setField("PMEffect");
    obj.edit3:setName("edit3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setAlign("left");
    obj.label8:setText("PF");
    obj.label8:setWidth(50);
    obj.label8:setMargins({left=15, right=-10});
    obj.label8:setName("label8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(50);
    obj.edit4:setMargins({left=15, right=-10});
    obj.edit4:setField("PFEffect");
    obj.edit4:setName("edit4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setAlign("left");
    obj.label9:setText("DEF");
    obj.label9:setWidth(50);
    obj.label9:setMargins({left=15, right=-10});
    obj.label9:setName("label9");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(50);
    obj.edit5:setMargins({left=15, right=-10});
    obj.edit5:setField("DEFEffect");
    obj.edit5:setName("edit5");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout3);
    obj.label10:setAlign("left");
    obj.label10:setText("RES");
    obj.label10:setWidth(50);
    obj.label10:setMargins({left=15, right=-10});
    obj.label10:setName("label10");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(50);
    obj.edit6:setMargins({left=15, right=-10});
    obj.edit6:setField("RESEffect");
    obj.edit6:setName("edit6");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout3);
    obj.button6:setAlign("right");
    obj.button6:setFontColor("red");
    obj.button6:setVisible(false);
    obj.button6:setText("Apagar!");
    obj.button6:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button6:setWidth(150);
    obj.button6:setName("button6");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(30);
    obj.layout4:setMargins({bottom=4});
    obj.layout4:setName("layout4");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout4);
    obj.label11:setAlign("left");
    obj.label11:setText("AC");
    obj.label11:setWidth(50);
    obj.label11:setMargins({left=15, right=-10});
    obj.label11:setName("label11");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout4);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(50);
    obj.edit7:setMargins({left=15, right=-10});
    obj.edit7:setField("ACEffect");
    obj.edit7:setName("edit7");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout4);
    obj.label12:setAlign("left");
    obj.label12:setText("ACM");
    obj.label12:setWidth(50);
    obj.label12:setMargins({left=15, right=-10});
    obj.label12:setName("label12");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout4);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(50);
    obj.edit8:setMargins({left=15, right=-10});
    obj.edit8:setField("ACMEffect");
    obj.edit8:setName("edit8");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout4);
    obj.label13:setAlign("left");
    obj.label13:setText("CR");
    obj.label13:setWidth(50);
    obj.label13:setMargins({left=15, right=-10});
    obj.label13:setName("label13");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout4);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(50);
    obj.edit9:setMargins({left=15, right=-10});
    obj.edit9:setField("CREffect");
    obj.edit9:setName("edit9");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout4);
    obj.label14:setAlign("left");
    obj.label14:setText("CRM");
    obj.label14:setWidth(50);
    obj.label14:setMargins({left=15, right=-10});
    obj.label14:setName("label14");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout4);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(50);
    obj.edit10:setMargins({left=15, right=-10});
    obj.edit10:setField("CRMEffect");
    obj.edit10:setName("edit10");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout4);
    obj.label15:setAlign("left");
    obj.label15:setText("Proc");
    obj.label15:setFontColor("#FF1493");
    obj.label15:setWidth(50);
    obj.label15:setMargins({left=15, right=-10});
    obj.label15:setName("label15");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout4);
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(50);
    obj.edit11:setFontColor("#FF1493");
    obj.edit11:setMargins({left=15, right=-10});
    obj.edit11:setField("DadoEffect");
    obj.edit11:setName("edit11");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle2);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(30);
    obj.layout5:setMargins({bottom=4});
    obj.layout5:setName("layout5");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout5);
    obj.label16:setAlign("left");
    obj.label16:setText("ESQ");
    obj.label16:setWidth(50);
    obj.label16:setMargins({left=15, right=-10});
    obj.label16:setName("label16");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout5);
    obj.edit12:setAlign("left");
    obj.edit12:setWidth(50);
    obj.edit12:setMargins({left=15, right=-10});
    obj.edit12:setField("ESQEffect");
    obj.edit12:setName("edit12");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout5);
    obj.label17:setAlign("left");
    obj.label17:setText("Pers");
    obj.label17:setWidth(50);
    obj.label17:setMargins({left=15, right=-10});
    obj.label17:setName("label17");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout5);
    obj.edit13:setAlign("left");
    obj.edit13:setWidth(50);
    obj.edit13:setMargins({left=15, right=-10});
    obj.edit13:setField("PersEffect");
    obj.edit13:setName("edit13");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout5);
    obj.label18:setAlign("left");
    obj.label18:setText("VEZ");
    obj.label18:setFontColor("green");
    obj.label18:setWidth(50);
    obj.label18:setMargins({left=15, right=-10});
    obj.label18:setName("label18");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout5);
    obj.edit14:setAlign("left");
    obj.edit14:setWidth(50);
    obj.edit14:setFontColor("green");
    obj.edit14:setMargins({left=15, right=-10});
    obj.edit14:setField("VezEffect");
    obj.edit14:setName("edit14");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout5);
    obj.label19:setAlign("left");
    obj.label19:setText("Dano");
    obj.label19:setFontColor("red");
    obj.label19:setWidth(50);
    obj.label19:setMargins({left=15, right=-10});
    obj.label19:setName("label19");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout5);
    obj.edit15:setAlign("left");
    obj.edit15:setWidth(50);
    obj.edit15:setMargins({left=15, right=-10});
    obj.edit15:setField("DanoEffect");
    obj.edit15:setName("edit15");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout5);
    obj.label20:setAlign("left");
    obj.label20:setText("Mana");
    obj.label20:setFontColor("blue");
    obj.label20:setWidth(50);
    obj.label20:setMargins({left=15, right=-10});
    obj.label20:setName("label20");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout5);
    obj.edit16:setAlign("left");
    obj.edit16:setWidth(50);
    obj.edit16:setFontColor("blue");
    obj.edit16:setMargins({left=15, right=-10});
    obj.edit16:setField("ManaEffect");
    obj.edit16:setName("edit16");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle2);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(30);
    obj.layout6:setMargins({bottom=4});
    obj.layout6:setName("layout6");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout6);
    obj.label21:setAlign("left");
    obj.label21:setText("CD");
    obj.label21:setWidth(50);
    obj.label21:setMargins({left=15, right=-10});
    obj.label21:setName("label21");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout6);
    obj.edit17:setAlign("left");
    obj.edit17:setWidth(50);
    obj.edit17:setMargins({left=15, right=-10});
    obj.edit17:setField("CDEffect");
    obj.edit17:setName("edit17");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout6);
    obj.label22:setAlign("left");
    obj.label22:setText("Duração");
    obj.label22:setWidth(50);
    obj.label22:setMargins({left=15, right=-10});
    obj.label22:setName("label22");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout6);
    obj.edit18:setAlign("left");
    obj.edit18:setWidth(50);
    obj.edit18:setMargins({left=15, right=-10});
    obj.edit18:setField("DuraEffect");
    obj.edit18:setName("edit18");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout6);
    obj.label23:setAlign("left");
    obj.label23:setText("Conta");
    obj.label23:setWidth(50);
    obj.label23:setMargins({left=15, right=-10});
    obj.label23:setName("label23");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout6);
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(50);
    obj.edit19:setMargins({left=15, right=-10});
    obj.edit19:setField("ContaEffect");
    obj.edit19:setName("edit19");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout6);
    obj.label24:setAlign("left");
    obj.label24:setText("Tipo");
    obj.label24:setWidth(50);
    obj.label24:setMargins({left=15, right=-10});
    obj.label24:setName("label24");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout6);
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(50);
    obj.edit20:setMargins({left=15, right=-10});
    obj.edit20:setField("TipoEffect");
    obj.edit20:setName("edit20");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout6);
    obj.label25:setAlign("left");
    obj.label25:setText("Outro");
    obj.label25:setWidth(50);
    obj.label25:setMargins({left=15, right=-10});
    obj.label25:setName("label25");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout6);
    obj.edit21:setAlign("left");
    obj.edit21:setWidth(50);
    obj.edit21:setMargins({left=15, right=-10});
    obj.edit21:setField("OutroEffect");
    obj.edit21:setName("edit21");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle2);
    obj.layout7:setAlign("client");
    obj.layout7:setMargins({top=5, left=5 , bottom=4});
    obj.layout7:setName("layout7");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout7);
    obj.textEditor1:setAlign("top");
    obj.textEditor1:setField("DescriBuff");
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setName("textEditor1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(50);
    obj.layout8:setMargins({right=1});
    obj.layout8:setName("layout8");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout8);
    obj.label26:setAlign("top");
    obj.label26:setText("PA:");
    obj.label26:setWidth(50);
    obj.label26:setMargins({left=10});
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout8);
    obj.label27:setAlign("top");
    obj.label27:setText("PM:");
    obj.label27:setWidth(50);
    obj.label27:setMargins({left=10});
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout8);
    obj.label28:setAlign("top");
    obj.label28:setText("PF:");
    obj.label28:setWidth(50);
    obj.label28:setMargins({left=10});
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout8);
    obj.label29:setAlign("top");
    obj.label29:setText("DEF:");
    obj.label29:setWidth(50);
    obj.label29:setMargins({left=10});
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout8);
    obj.label30:setAlign("top");
    obj.label30:setText("RES:");
    obj.label30:setWidth(50);
    obj.label30:setMargins({left=10});
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout8);
    obj.label31:setAlign("top");
    obj.label31:setText("---");
    obj.label31:setWidth(50);
    obj.label31:setMargins({left=10});
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout8);
    obj.label32:setAlign("top");
    obj.label32:setText("AC:");
    obj.label32:setWidth(50);
    obj.label32:setMargins({left=10});
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout8);
    obj.label33:setAlign("top");
    obj.label33:setText("ACM:");
    obj.label33:setWidth(50);
    obj.label33:setMargins({left=10});
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout8);
    obj.label34:setAlign("top");
    obj.label34:setText("CR:");
    obj.label34:setWidth(50);
    obj.label34:setMargins({left=10});
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout8);
    obj.label35:setAlign("top");
    obj.label35:setText("CRM:");
    obj.label35:setWidth(50);
    obj.label35:setMargins({left=10});
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout8);
    obj.label36:setAlign("top");
    obj.label36:setText("---");
    obj.label36:setWidth(50);
    obj.label36:setMargins({left=10});
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout8);
    obj.label37:setAlign("top");
    obj.label37:setText("ESQ:");
    obj.label37:setWidth(50);
    obj.label37:setMargins({left=10});
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout8);
    obj.label38:setAlign("top");
    obj.label38:setText("Pers:");
    obj.label38:setWidth(50);
    obj.label38:setMargins({left=10});
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout8);
    obj.label39:setAlign("top");
    obj.label39:setText("---");
    obj.label39:setWidth(50);
    obj.label39:setMargins({left=10});
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout8);
    obj.label40:setAlign("top");
    obj.label40:setText("Vez:");
    obj.label40:setFontColor("green");
    obj.label40:setWidth(50);
    obj.label40:setMargins({left=10});
    obj.label40:setName("label40");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(50);
    obj.layout9:setMargins({right=1});
    obj.layout9:setName("layout9");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout9);
    obj.label41:setAlign("top");
    obj.label41:setField("PA");
    obj.label41:setWidth(50);
    obj.label41:setMargins({left=10});
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout9);
    obj.label42:setAlign("top");
    obj.label42:setField("PM");
    obj.label42:setWidth(50);
    obj.label42:setMargins({left=10});
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout9);
    obj.label43:setAlign("top");
    obj.label43:setField("PF");
    obj.label43:setWidth(50);
    obj.label43:setMargins({left=10});
    obj.label43:setName("label43");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout9);
    obj.label44:setAlign("top");
    obj.label44:setField("DEF");
    obj.label44:setWidth(50);
    obj.label44:setMargins({left=10});
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout9);
    obj.label45:setAlign("top");
    obj.label45:setField("RES");
    obj.label45:setWidth(50);
    obj.label45:setMargins({left=10});
    obj.label45:setName("label45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout9);
    obj.label46:setAlign("top");
    obj.label46:setText("---");
    obj.label46:setWidth(50);
    obj.label46:setMargins({left=10});
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout9);
    obj.label47:setAlign("top");
    obj.label47:setField("AC");
    obj.label47:setWidth(50);
    obj.label47:setMargins({left=10});
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout9);
    obj.label48:setAlign("top");
    obj.label48:setField("ACM");
    obj.label48:setWidth(50);
    obj.label48:setMargins({left=10});
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout9);
    obj.label49:setAlign("top");
    obj.label49:setField("CR");
    obj.label49:setWidth(50);
    obj.label49:setMargins({left=10});
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout9);
    obj.label50:setAlign("top");
    obj.label50:setField("CRM");
    obj.label50:setWidth(50);
    obj.label50:setMargins({left=10});
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout9);
    obj.label51:setAlign("top");
    obj.label51:setText("---");
    obj.label51:setWidth(50);
    obj.label51:setMargins({left=10});
    obj.label51:setName("label51");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout9);
    obj.label52:setAlign("top");
    obj.label52:setField("ESQ");
    obj.label52:setWidth(50);
    obj.label52:setMargins({left=10});
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout9);
    obj.label53:setAlign("top");
    obj.label53:setField("Pers");
    obj.label53:setWidth(50);
    obj.label53:setMargins({left=10});
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout9);
    obj.label54:setAlign("top");
    obj.label54:setText("---");
    obj.label54:setWidth(50);
    obj.label54:setMargins({left=10});
    obj.label54:setName("label54");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout9);
    obj.edit22:setAlign("top");
    obj.edit22:setField("Vez");
    obj.edit22:setFontColor("green");
    obj.edit22:setWidth(50);
    obj.edit22:setMargins({left=10});
    obj.edit22:setName("edit22");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(75);
    obj.layout10:setMargins({right=1});
    obj.layout10:setName("layout10");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout10);
    obj.label55:setAlign("top");
    obj.label55:setText("Atletismo:");
    obj.label55:setAutoSize(true);
    obj.label55:setMargins({left=10});
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout10);
    obj.label56:setAlign("top");
    obj.label56:setText("Sabedoria:");
    obj.label56:setAutoSize(true);
    obj.label56:setMargins({left=10});
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout10);
    obj.label57:setAlign("top");
    obj.label57:setText("Percepcao:");
    obj.label57:setAutoSize(true);
    obj.label57:setMargins({left=10});
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout10);
    obj.label58:setAlign("top");
    obj.label58:setText("Acrobacia:");
    obj.label58:setAutoSize(true);
    obj.label58:setMargins({left=10});
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout10);
    obj.label59:setAlign("top");
    obj.label59:setText("Vigor:");
    obj.label59:setAutoSize(true);
    obj.label59:setMargins({left=10});
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout10);
    obj.label60:setAlign("top");
    obj.label60:setText("---");
    obj.label60:setWidth(50);
    obj.label60:setMargins({left=10});
    obj.label60:setName("label60");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle1);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(50);
    obj.layout11:setMargins({right=1});
    obj.layout11:setName("layout11");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout11);
    obj.label61:setAlign("top");
    obj.label61:setField("Atletismo");
    obj.label61:setWidth(50);
    obj.label61:setMargins({left=10});
    obj.label61:setName("label61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout11);
    obj.label62:setAlign("top");
    obj.label62:setField("Sabedoria");
    obj.label62:setWidth(50);
    obj.label62:setMargins({left=10});
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout11);
    obj.label63:setAlign("top");
    obj.label63:setField("Percepcao");
    obj.label63:setWidth(50);
    obj.label63:setMargins({left=10});
    obj.label63:setName("label63");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout11);
    obj.label64:setAlign("top");
    obj.label64:setField("Acrobacia");
    obj.label64:setWidth(50);
    obj.label64:setMargins({left=10});
    obj.label64:setName("label64");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout11);
    obj.label65:setAlign("top");
    obj.label65:setField("Vigor");
    obj.label65:setWidth(50);
    obj.label65:setMargins({left=10});
    obj.label65:setName("label65");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout11);
    obj.label66:setAlign("top");
    obj.label66:setText("---");
    obj.label66:setWidth(50);
    obj.label66:setMargins({left=10});
    obj.label66:setName("label66");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj);
    obj.label67:setText("Controle de Turnos");
    obj.label67:setLeft(620);
    obj.label67:setWidth(150);
    obj.label67:setTop(10);
    obj.label67:setFontSize(15);
    obj.label67:setName("label67");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj);
    obj.layout12:setLeft(620);
    obj.layout12:setTop(40);
    obj.layout12:setWidth(200);
    obj.layout12:setHeight(60);
    obj.layout12:setName("layout12");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout12);
    obj.label68:setText("Turno Atual:");
    obj.label68:setAlign("top");
    obj.label68:setAutoSize(true);
    obj.label68:setFontSize(16);
    obj.label68:setFontColor("white");
    obj.label68:setName("label68");

    obj.editTurnoAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.editTurnoAtual:setParent(obj.layout12);
    obj.editTurnoAtual:setName("editTurnoAtual");
    obj.editTurnoAtual:setField("TurnoAtualControle");
    obj.editTurnoAtual:setAlign("top");
    obj.editTurnoAtual:setWidth(200);
    obj.editTurnoAtual:setHeight(20);
    obj.editTurnoAtual:setHorzTextAlign("center");

    obj.btnTurnoAnterior = GUI.fromHandle(_obj_newObject("button"));
    obj.btnTurnoAnterior:setParent(obj.layout12);
    obj.btnTurnoAnterior:setName("btnTurnoAnterior");
    obj.btnTurnoAnterior:setText("AnteriorRR");
    obj.btnTurnoAnterior:setAlign("left");
    obj.btnTurnoAnterior:setWidth(90);
    obj.btnTurnoAnterior:setHeight(20);
    obj.btnTurnoAnterior:setTop(40);

    obj.btnTurnoProximo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnTurnoProximo:setParent(obj.layout12);
    obj.btnTurnoProximo:setName("btnTurnoProximo");
    obj.btnTurnoProximo:setText("Próximo");
    obj.btnTurnoProximo:setAlign("right");
    obj.btnTurnoProximo:setWidth(90);
    obj.btnTurnoProximo:setHeight(20);
    obj.btnTurnoProximo:setTop(40);

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj);
    obj.layout13:setLeft(620);
    obj.layout13:setTop(120);
    obj.layout13:setWidth(200);
    obj.layout13:setHeight(60);
    obj.layout13:setName("layout13");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout13);
    obj.label69:setText("Vez Atual:");
    obj.label69:setAlign("top");
    obj.label69:setAutoSize(true);
    obj.label69:setFontSize(16);
    obj.label69:setFontColor("white");
    obj.label69:setName("label69");

    obj.editVezAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.editVezAtual:setParent(obj.layout13);
    obj.editVezAtual:setName("editVezAtual");
    obj.editVezAtual:setField("VezAtualControle");
    obj.editVezAtual:setAlign("top");
    obj.editVezAtual:setWidth(200);
    obj.editVezAtual:setHeight(20);
    obj.editVezAtual:setReadOnly(true);
    obj.editVezAtual:setHorzTextAlign("center");

    obj.btnVezAnterior = GUI.fromHandle(_obj_newObject("button"));
    obj.btnVezAnterior:setParent(obj.layout13);
    obj.btnVezAnterior:setName("btnVezAnterior");
    obj.btnVezAnterior:setText("Anterior");
    obj.btnVezAnterior:setAlign("left");
    obj.btnVezAnterior:setWidth(90);
    obj.btnVezAnterior:setHeight(20);
    obj.btnVezAnterior:setTop(40);

    obj.btnVezProximo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnVezProximo:setParent(obj.layout13);
    obj.btnVezProximo:setName("btnVezProximo");
    obj.btnVezProximo:setText("PRÓXIMO");
    obj.btnVezProximo:setAlign("right");
    obj.btnVezProximo:setWidth(90);
    obj.btnVezProximo:setHeight(20);
    obj.btnVezProximo:setTop(40);

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj);
    obj.layout14:setLeft(620);
    obj.layout14:setTop(200);
    obj.layout14:setWidth(200);
    obj.layout14:setHeight(60);
    obj.layout14:setName("layout14");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout14);
    obj.label70:setText("Ação Atual:");
    obj.label70:setAlign("top");
    obj.label70:setAutoSize(true);
    obj.label70:setFontSize(16);
    obj.label70:setFontColor("white");
    obj.label70:setName("label70");

    obj.editAcaoAtual = GUI.fromHandle(_obj_newObject("edit"));
    obj.editAcaoAtual:setParent(obj.layout14);
    obj.editAcaoAtual:setName("editAcaoAtual");
    obj.editAcaoAtual:setField("AcaoAtual");
    obj.editAcaoAtual:setAlign("top");
    obj.editAcaoAtual:setWidth(200);
    obj.editAcaoAtual:setHeight(20);
    obj.editAcaoAtual:setReadOnly(false);
    obj.editAcaoAtual:setHorzTextAlign("center");

    obj.btnAcaoAnterior = GUI.fromHandle(_obj_newObject("button"));
    obj.btnAcaoAnterior:setParent(obj.layout14);
    obj.btnAcaoAnterior:setName("btnAcaoAnterior");
    obj.btnAcaoAnterior:setText("Anterior");
    obj.btnAcaoAnterior:setAlign("left");
    obj.btnAcaoAnterior:setWidth(90);
    obj.btnAcaoAnterior:setHeight(20);
    obj.btnAcaoAnterior:setTop(40);

    obj.btnAcaoProximo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnAcaoProximo:setParent(obj.layout14);
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


			


	


    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj);
    obj.button7:setTop(10);
    obj.button7:setLeft(830);
    obj.button7:setText("Adicionar Oponentes");
    obj.button7:setWidth(150);
    obj.button7:setHeight(30);
    obj.button7:setName("button7");

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

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.BoxDetalheOponentes);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setHeight(180);
    obj.rectangle3:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle3:setName("rectangle3");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle3);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(150);
    obj.layout15:setMargins({right=2});
    obj.layout15:setName("layout15");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout15);
    obj.image3:setAlign("top");
    obj.image3:setWidth(100);
    obj.image3:setMargins({top=1});
    obj.image3:setField("imagemInimigo");
    obj.image3:setSRC("http://fc03.deviantart.net/fs70/i/2011/234/5/4/dragon_aspects_by_rattlesnakedefender-d47ii5y.jpg");
    obj.image3:setName("image3");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout15);
    obj.label71:setAlign("top");
    obj.label71:setText("Jogador:");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setWidth(150);
    obj.label71:setMargins({top=1});
    obj.label71:setName("label71");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout15);
    obj.edit23:setAlign("top");
    obj.edit23:setWidth(150);
    obj.edit23:setField("NomeDoOponente");
    obj.edit23:setMargins({top=1});
    obj.edit23:setName("edit23");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout15);
    obj.button8:setAlign("top");
    obj.button8:setWidth(150);
    obj.button8:setText("Sincronizar");
    obj.button8:setMargins({right=1});
    obj.button8:setName("button8");

    obj.progressBar3 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar3:setParent(obj.layout15);
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

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.progressBar3);
    obj.label72:setAlign("client");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setText("/");
    obj.label72:setName("label72");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.progressBar3);
    obj.label73:setAlign("right");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setField("HPBarMaxO");
    obj.label73:setName("label73");

    obj.progressBar4 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar4:setParent(obj.layout15);
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

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.progressBar4);
    obj.label74:setAlign("right");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setText("---/---");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.progressBar4);
    obj.label75:setAlign("right");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setField("MPBarMaxO");
    obj.label75:setName("label75");

    obj.btnEditStatusI = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEditStatusI:setParent(obj.layout15);
    obj.btnEditStatusI:setName("btnEditStatusI");
    obj.btnEditStatusI:setAlign("top");
    obj.btnEditStatusI:setFontColor("white");
    obj.btnEditStatusI:setWidth(150);
    obj.btnEditStatusI:setText("Editar ✎");
    obj.btnEditStatusI:setMargins({top=1});

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle3);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(50);
    obj.layout16:setMargins({right=1});
    obj.layout16:setName("layout16");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout16);
    obj.label76:setAlign("top");
    obj.label76:setText("PA:");
    obj.label76:setWidth(50);
    obj.label76:setMargins({left=10});
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout16);
    obj.label77:setAlign("top");
    obj.label77:setText("PM:");
    obj.label77:setWidth(50);
    obj.label77:setMargins({left=10});
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout16);
    obj.label78:setAlign("top");
    obj.label78:setText("PF:");
    obj.label78:setWidth(50);
    obj.label78:setMargins({left=10});
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout16);
    obj.label79:setAlign("top");
    obj.label79:setText("DEF:");
    obj.label79:setWidth(50);
    obj.label79:setMargins({left=10});
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout16);
    obj.label80:setAlign("top");
    obj.label80:setText("RES:");
    obj.label80:setWidth(50);
    obj.label80:setMargins({left=10});
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout16);
    obj.label81:setAlign("top");
    obj.label81:setText("---");
    obj.label81:setWidth(50);
    obj.label81:setMargins({left=10});
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout16);
    obj.label82:setAlign("top");
    obj.label82:setText("AC:");
    obj.label82:setWidth(50);
    obj.label82:setMargins({left=10});
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout16);
    obj.label83:setAlign("top");
    obj.label83:setText("ACM:");
    obj.label83:setWidth(50);
    obj.label83:setMargins({left=10});
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout16);
    obj.label84:setAlign("top");
    obj.label84:setText("CR:");
    obj.label84:setWidth(50);
    obj.label84:setMargins({left=10});
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout16);
    obj.label85:setAlign("top");
    obj.label85:setText("CRM:");
    obj.label85:setWidth(50);
    obj.label85:setMargins({left=10});
    obj.label85:setName("label85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout16);
    obj.label86:setAlign("top");
    obj.label86:setText("---");
    obj.label86:setWidth(50);
    obj.label86:setMargins({left=10});
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout16);
    obj.label87:setAlign("top");
    obj.label87:setText("ESQ:");
    obj.label87:setWidth(50);
    obj.label87:setMargins({left=10});
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout16);
    obj.label88:setAlign("top");
    obj.label88:setText("Pers:");
    obj.label88:setWidth(50);
    obj.label88:setMargins({left=10});
    obj.label88:setName("label88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout16);
    obj.label89:setAlign("top");
    obj.label89:setText("---");
    obj.label89:setWidth(50);
    obj.label89:setMargins({left=10});
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout16);
    obj.label90:setAlign("top");
    obj.label90:setText("Vez:");
    obj.label90:setFontColor("green");
    obj.label90:setWidth(50);
    obj.label90:setMargins({left=10});
    obj.label90:setName("label90");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle3);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(50);
    obj.layout17:setMargins({right=1});
    obj.layout17:setName("layout17");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout17);
    obj.label91:setAlign("top");
    obj.label91:setField("PA");
    obj.label91:setWidth(50);
    obj.label91:setMargins({left=10});
    obj.label91:setName("label91");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout17);
    obj.label92:setAlign("top");
    obj.label92:setField("PM");
    obj.label92:setWidth(50);
    obj.label92:setMargins({left=10});
    obj.label92:setName("label92");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout17);
    obj.label93:setAlign("top");
    obj.label93:setField("PF");
    obj.label93:setWidth(50);
    obj.label93:setMargins({left=10});
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout17);
    obj.label94:setAlign("top");
    obj.label94:setField("DEF");
    obj.label94:setWidth(50);
    obj.label94:setMargins({left=10});
    obj.label94:setName("label94");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout17);
    obj.label95:setAlign("top");
    obj.label95:setField("RES");
    obj.label95:setWidth(50);
    obj.label95:setMargins({left=10});
    obj.label95:setName("label95");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout17);
    obj.label96:setAlign("top");
    obj.label96:setText("---");
    obj.label96:setWidth(50);
    obj.label96:setMargins({left=10});
    obj.label96:setName("label96");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout17);
    obj.label97:setAlign("top");
    obj.label97:setField("AC");
    obj.label97:setWidth(50);
    obj.label97:setMargins({left=10});
    obj.label97:setName("label97");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout17);
    obj.label98:setAlign("top");
    obj.label98:setField("ACM");
    obj.label98:setWidth(50);
    obj.label98:setMargins({left=10});
    obj.label98:setName("label98");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout17);
    obj.label99:setAlign("top");
    obj.label99:setField("CR");
    obj.label99:setWidth(50);
    obj.label99:setMargins({left=10});
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout17);
    obj.label100:setAlign("top");
    obj.label100:setField("CRM");
    obj.label100:setWidth(50);
    obj.label100:setMargins({left=10});
    obj.label100:setName("label100");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout17);
    obj.label101:setAlign("top");
    obj.label101:setText("---");
    obj.label101:setWidth(50);
    obj.label101:setMargins({left=10});
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout17);
    obj.label102:setAlign("top");
    obj.label102:setField("ESQ");
    obj.label102:setWidth(50);
    obj.label102:setMargins({left=10});
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout17);
    obj.label103:setAlign("top");
    obj.label103:setField("Pers");
    obj.label103:setWidth(50);
    obj.label103:setMargins({left=10});
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout17);
    obj.label104:setAlign("top");
    obj.label104:setText("---");
    obj.label104:setWidth(50);
    obj.label104:setMargins({left=10});
    obj.label104:setName("label104");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout17);
    obj.edit24:setAlign("top");
    obj.edit24:setField("Vez");
    obj.edit24:setFontColor("green");
    obj.edit24:setWidth(50);
    obj.edit24:setMargins({left=10});
    obj.edit24:setName("edit24");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle3);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(75);
    obj.layout18:setMargins({right=1});
    obj.layout18:setName("layout18");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout18);
    obj.label105:setAlign("top");
    obj.label105:setText("Atletismo:");
    obj.label105:setAutoSize(true);
    obj.label105:setMargins({left=10});
    obj.label105:setName("label105");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout18);
    obj.label106:setAlign("top");
    obj.label106:setText("Sabedoria:");
    obj.label106:setAutoSize(true);
    obj.label106:setMargins({left=10});
    obj.label106:setName("label106");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout18);
    obj.label107:setAlign("top");
    obj.label107:setText("Percepcao:");
    obj.label107:setAutoSize(true);
    obj.label107:setMargins({left=10});
    obj.label107:setName("label107");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout18);
    obj.label108:setAlign("top");
    obj.label108:setText("Acrobacia:");
    obj.label108:setAutoSize(true);
    obj.label108:setMargins({left=10});
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout18);
    obj.label109:setAlign("top");
    obj.label109:setText("Vigor:");
    obj.label109:setAutoSize(true);
    obj.label109:setMargins({left=10});
    obj.label109:setName("label109");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout18);
    obj.label110:setAlign("top");
    obj.label110:setText("---");
    obj.label110:setWidth(50);
    obj.label110:setMargins({left=10});
    obj.label110:setName("label110");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle3);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(50);
    obj.layout19:setMargins({right=1});
    obj.layout19:setName("layout19");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout19);
    obj.label111:setAlign("top");
    obj.label111:setField("Atletismo");
    obj.label111:setWidth(50);
    obj.label111:setMargins({left=10});
    obj.label111:setName("label111");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout19);
    obj.label112:setAlign("top");
    obj.label112:setField("Sabedoria");
    obj.label112:setWidth(50);
    obj.label112:setMargins({left=10});
    obj.label112:setName("label112");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout19);
    obj.label113:setAlign("top");
    obj.label113:setField("Percepcao");
    obj.label113:setWidth(50);
    obj.label113:setMargins({left=10});
    obj.label113:setName("label113");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout19);
    obj.label114:setAlign("top");
    obj.label114:setField("Acrobacia");
    obj.label114:setWidth(50);
    obj.label114:setMargins({left=10});
    obj.label114:setName("label114");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout19);
    obj.label115:setAlign("top");
    obj.label115:setField("Vigor");
    obj.label115:setWidth(50);
    obj.label115:setMargins({left=10});
    obj.label115:setName("label115");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout19);
    obj.label116:setAlign("top");
    obj.label116:setText("---");
    obj.label116:setWidth(50);
    obj.label116:setMargins({left=10});
    obj.label116:setName("label116");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'ACAOTURNO'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            sheet.ACAOTURNO = (tonumber(sheet.ACAOTURNO) or 0); 
            		sheet.EditarStatus = sheet.EditarStatus or false
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
            
            			if	self.BoxDetalheJogadores.visible == true then
            				local node = self.rclGrupoJogadores.selectedNode;   
            				self.rclGrupoJogadores.node = node;
            
            				if node.NomeDoPersonagemVez ~= nil or node.NomeDoPersonagemVez ~= "" then
            				
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
            									node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
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
            									node.imagemDoPersonagem = nodeExterno.imgInimigo
            								end;
            							end
            						end
            					return nomes								
            						
            					end
            
            					local nomesDeTodosOsItens = obterNomesRecursivo(bibliotecaAtual);
            				end;
            								
            			end;
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
            												node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
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
            												node.imagemDoPersonagem = nodeExterno.imgInimigo
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
            
            											nodeExterno.HPTotal = tonumber(node.HPBarMax);
            											nodeExterno.MPTotal = tonumber(node.MPBarMax);
            
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
            												node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
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
            self.popEffect:show();
        end);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (event)
            -- Usuário clicou no botão de criar novo item.
            									-- Vamos inserir um novo item no nosso recordList                              
            									self.rclBuffs:append();
        end);

    obj._e_event10 = obj.rclBuffs:addEventListener("onSelect",
        function ()
            local node = self.rclBuffs.selectedNode;  
            								self.dscBuffSlot.node = node;                       
            								self.dscBuffSlot.visible = (node ~= nil);
        end);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (event)
            ndb.deleteNode(self.dscBuffSlot.node);
        end);

    obj._e_event12 = obj.btnTurnoAnterior:addEventListener("onClick",
        function (event)
            AnteriorTurno();
        end);

    obj._e_event13 = obj.btnTurnoProximo:addEventListener("onClick",
        function (event)
            ProximoTurno();
        end);

    obj._e_event14 = obj.btnVezAnterior:addEventListener("onClick",
        function (event)
            AnteriorVez();
        end);

    obj._e_event15 = obj.btnVezProximo:addEventListener("onClick",
        function (event)
            ProximaVez();
        end);

    obj._e_event16 = obj.btnAcaoAnterior:addEventListener("onClick",
        function (event)
            AnteriorAcao();
        end);

    obj._e_event17 = obj.btnAcaoProximo:addEventListener("onClick",
        function (event)
            ProximaAcao();
        end);

    obj._e_event18 = obj.TrocadorDeAcao:addEventListener("onTimer",
        function ()
            AcaoAtualControlador()
        end);

    obj._e_event19 = obj.AvisoDeTempo:addEventListener("onTimer",
        function ()
            AvisoDeTempoControlador()
        end);

    obj._e_event20 = obj.button7:addEventListener("onClick",
        function (event)
            self.rclGrupoOponentes:append();
        end);

    obj._e_event21 = obj.rclGrupoOponentes:addEventListener("onSelect",
        function ()
            local node = self.rclGrupoOponentes.selectedNode; 
            				
            			self.BoxDetalheOponentes.node = node; 
            
            			self.rclGrupoOponentes:sort();
            			
            			self.BoxDetalheOponentes.visible = (node ~= nil);
            
            			
            			
            				if	self.BoxDetalheOponentes.visible == true then
            					local node = self.rclGrupoOponentes.selectedNode;   
            					self.rclGrupoOponentes.node = node;
            					
            					if node.NomeDoOponenteVez ~= nil or node.NomeDoOponenteVez ~= "" then
            
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
            										node.imagemInimigo = nodeExterno.imagemDoPersonagem
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
            										node.HPBarMaxO = nodeExterno.HPTotal or '0';
            										node.MPBarMaxO = nodeExterno.MPTotal or '0';
            										node.HPBarO = nodeExterno.HPAtual or '0';
            										node.MPBarO = nodeExterno.MPAtual or '0';
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
        end);

    obj._e_event22 = obj.rclGrupoOponentes:addEventListener("onCompare",
        function (nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.Vez, nodeB.Vez);
        end);

    obj._e_event23 = obj.button8:addEventListener("onClick",
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
            											node.imagemInimigo = nodeExterno.imagemDoPersonagem
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
            											node.HPBarMaxO = nodeExterno.HPTotal or '0';
            											node.MPBarMaxO = nodeExterno.MPTotal or '0';
            											node.HPBarO = nodeExterno.HPAtual or '0';
            											node.MPBarO = nodeExterno.MPAtual or '0';
            											node.NomeDoOponenteVez = node.Vez .. " - " ..  nodeExterno.Nome
            											node.imagemInimigo = nodeExterno.imgInimigo
            										end;
            									end
            								end
            							return nomes
            							end
            							local nomesDeTodosOsItens = obterNomesRecursivoO(bibliotecaAtual);
            						end;
        end);

    obj._e_event24 = obj.btnEditStatusI:addEventListener("onClick",
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
            
            											nodeExterno.HPTotal = tonumber(node.HPBarMaxO);
            											nodeExterno.MPTotal = tonumber(node.MPBarMaxO);
            											
            											if node.HPBarResolveO ~= 0 then 
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
            
            											node.HPBarResolveO = 0
            											end;
            
            											if node.MPBarResolveO ~= 0 then 
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
            
            												node.MPBarResolveO = 0
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
            												node.HPBarMaxO = nodeExterno.HPTotal or '0';
            												node.MPBarMaxO = nodeExterno.MPTotal or '0';
            												node.HPBarO = nodeExterno.HPAtual or '0';
            												node.MPBarO = nodeExterno.MPAtual or '0';
            												node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoOponente
            												node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
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
            												node.HPBarMaxO = nodeExterno.HPTotal or '0';
            												node.MPBarMaxO = nodeExterno.MPTotal or '0';
            												node.HPBarO = nodeExterno.HPAtual or '0';
            												node.MPBarO = nodeExterno.MPAtual or '0';
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

    obj._e_event25 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AlvoRecebido ~= nil and sheet.AlvoRecebido ~= "" then
            				-- Acessa o RecordList do grupo de jogadores
            				local nodes = ndb.getChildNodes(sheet.NomeJogador) -- Substitua pelo campo correto
            
            				for _, node in ipairs(nodes) do
            					-- Verifica se o NomeDoPersonagem coincide com o AlvoRecebido
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
            					-- Verifica se o NomeDoPersonagem coincide com o AlvoRecebido
            					if node.NomeDoPersonagemVez == sheet.AlvoRecebido then
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
            
            										-- Sincronizando
            
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
            											node.NomeDoPersonagemVez = node.Vez .. " - " ..  node.NomeDoOponente
            											node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
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
            											node.imagemDoPersonagem = nodeExterno.imgInimigo
            										end;
            
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
            
            										-- Sincronizando
            
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
            											node.imagemDoPersonagem = nodeExterno.imagemDoPersonagem
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
            											node.imagemDoPersonagem = nodeExterno.imgInimigo
            										end;
            
            										
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
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edtMPAtualO ~= nil then self.edtMPAtualO:destroy(); self.edtMPAtualO = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.btnVezProximo ~= nil then self.btnVezProximo:destroy(); self.btnVezProximo = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.gambiMPO ~= nil then self.gambiMPO:destroy(); self.gambiMPO = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.btnEditStatusI ~= nil then self.btnEditStatusI:destroy(); self.btnEditStatusI = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.editAcaoAtual ~= nil then self.editAcaoAtual:destroy(); self.editAcaoAtual = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.rclGrupoJogadores ~= nil then self.rclGrupoJogadores:destroy(); self.rclGrupoJogadores = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.progressBar4 ~= nil then self.progressBar4:destroy(); self.progressBar4 = nil; end;
        if self.gambiHPO ~= nil then self.gambiHPO:destroy(); self.gambiHPO = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.dscBuffSlot ~= nil then self.dscBuffSlot:destroy(); self.dscBuffSlot = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.btnAcaoProximo ~= nil then self.btnAcaoProximo:destroy(); self.btnAcaoProximo = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.editVezAtual ~= nil then self.editVezAtual:destroy(); self.editVezAtual = nil; end;
        if self.rclGrupoOponentes ~= nil then self.rclGrupoOponentes:destroy(); self.rclGrupoOponentes = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rclBuffs ~= nil then self.rclBuffs:destroy(); self.rclBuffs = nil; end;
        if self.popEffect ~= nil then self.popEffect:destroy(); self.popEffect = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.btnTurnoProximo ~= nil then self.btnTurnoProximo:destroy(); self.btnTurnoProximo = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.TrocadorDeAcao ~= nil then self.TrocadorDeAcao:destroy(); self.TrocadorDeAcao = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.btnVezAnterior ~= nil then self.btnVezAnterior:destroy(); self.btnVezAnterior = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.BoxDetalheJogadores ~= nil then self.BoxDetalheJogadores:destroy(); self.BoxDetalheJogadores = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.progressBar3 ~= nil then self.progressBar3:destroy(); self.progressBar3 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.btnEditStatus ~= nil then self.btnEditStatus:destroy(); self.btnEditStatus = nil; end;
        if self.gambiMP ~= nil then self.gambiMP:destroy(); self.gambiMP = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.BoxDetalheOponentes ~= nil then self.BoxDetalheOponentes:destroy(); self.BoxDetalheOponentes = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.editTurnoAtual ~= nil then self.editTurnoAtual:destroy(); self.editTurnoAtual = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edtHPAtualO ~= nil then self.edtHPAtualO:destroy(); self.edtHPAtualO = nil; end;
        if self.gambiHP ~= nil then self.gambiHP:destroy(); self.gambiHP = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.btnTurnoAnterior ~= nil then self.btnTurnoAnterior:destroy(); self.btnTurnoAnterior = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edtHPAtual ~= nil then self.edtHPAtual:destroy(); self.edtHPAtual = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edtMPAtual ~= nil then self.edtMPAtual:destroy(); self.edtMPAtual = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.AvisoDeTempo ~= nil then self.AvisoDeTempo:destroy(); self.AvisoDeTempo = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.btnAcaoAnterior ~= nil then self.btnAcaoAnterior:destroy(); self.btnAcaoAnterior = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.btnEffect ~= nil then self.btnEffect:destroy(); self.btnEffect = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
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
