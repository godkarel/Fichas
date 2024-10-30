require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmhabilidade()
    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

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
    obj:setName("frmhabilidade");
    obj:setWidth(1050);
    obj:setHeight(650);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setWidth(1050);
    obj.image1:setHeight(720);
    obj.image1:setCenter(true);
    obj.image1:setSRC("/imagens/3.png");
    obj.image1:setName("image1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setText("Nova Magia");
    obj.button1:setWidth(125);
    obj.button1:setHeight(40);
    obj.button1:setLeft(10);
    obj.button1:setTop(10);
    obj.button1:setName("button1");

    obj.rclListaDosItens3 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens3:setParent(obj.scrollBox1);
    obj.rclListaDosItens3:setName("rclListaDosItens3");
    obj.rclListaDosItens3:setField("ListaDeHabilidades");
    obj.rclListaDosItens3:setTemplateForm("frmItemDaLista3");
    obj.rclListaDosItens3:setWidth(950);
    obj.rclListaDosItens3:setHeight(550);
    obj.rclListaDosItens3:setLeft(70);
    obj.rclListaDosItens3:setTop(60);
    obj.rclListaDosItens3:setSelectable(true);

    obj.ListaJutsus3 = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.ListaJutsus3:setParent(obj.scrollBox1);
    obj.ListaJutsus3:setName("ListaJutsus3");
    obj.ListaJutsus3:setVisible(false);
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

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(60);
    obj.label1:setTop(10);
    obj.label1:setWidth(200);
    obj.label1:setHeight(40);
    obj.label1:setFontFamily("Nyala");
    obj.label1:setFontColor("Black");
    obj.label1:setFontSize(20);
    obj.label1:setText("Habilidade:");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(170);
    obj.edit1:setTop(15);
    obj.edit1:setWidth(240);
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

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(60);
    obj.label2:setTop(350);
    obj.label2:setWidth(120);
    obj.label2:setHeight(40);
    obj.label2:setFontFamily("Nyala");
    obj.label2:setFontColor("Black");
    obj.label2:setFontSize(20);
    obj.label2:setText("Dano");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(115);
    obj.edit2:setTop(355);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(30);
    obj.edit2:setType("number");
    obj.edit2:setField("DanoHabilidade1");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(310);
    obj.label3:setTop(350);
    obj.label3:setWidth(60);
    obj.label3:setHeight(40);
    obj.label3:setFontFamily("Nyala");
    obj.label3:setFontColor("Black");
    obj.label3:setFontSize(20);
    obj.label3:setText("Fixo");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(350);
    obj.edit3:setTop(355);
    obj.edit3:setWidth(60);
    obj.edit3:setHeight(30);
    obj.edit3:setType("number");
    obj.edit3:setField("FixoHabilidade1");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(180);
    obj.label4:setTop(350);
    obj.label4:setWidth(60);
    obj.label4:setHeight(40);
    obj.label4:setFontFamily("Nyala");
    obj.label4:setFontColor("Black");
    obj.label4:setFontSize(20);
    obj.label4:setText("Cura");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(230);
    obj.edit4:setTop(355);
    obj.edit4:setWidth(70);
    obj.edit4:setHeight(30);
    obj.edit4:setType("number");
    obj.edit4:setField("CuraHabilidade1");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(60);
    obj.label5:setTop(400);
    obj.label5:setWidth(120);
    obj.label5:setHeight(40);
    obj.label5:setFontFamily("Nyala");
    obj.label5:setFontColor("Black");
    obj.label5:setFontSize(20);
    obj.label5:setText("Custo");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(115);
    obj.edit5:setTop(405);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(30);
    obj.edit5:setType("number");
    obj.edit5:setField("Custo");
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

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(180);
    obj.label6:setTop(400);
    obj.label6:setWidth(120);
    obj.label6:setHeight(40);
    obj.label6:setFontFamily("Nyala");
    obj.label6:setFontColor("Black");
    obj.label6:setFontSize(20);
    obj.label6:setText("Tipo");
    obj.label6:setName("label6");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(230);
    obj.comboBox1:setTop(413);
    obj.comboBox1:setWidth(70);
    obj.comboBox1:setHeight(18);
    obj.comboBox1:setField("DanoAtributo1");
    obj.comboBox1:setItems({'PA', 'PM', 'PF', 'Cura', 'Fixo', 'BUFF'});
    obj.comboBox1:setName("comboBox1");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(220);
    obj.label7:setTop(450);
    obj.label7:setWidth(120);
    obj.label7:setHeight(40);
    obj.label7:setFontFamily("Nyala");
    obj.label7:setFontColor("blue");
    obj.label7:setFontSize(20);
    obj.label7:setText("Intensidade");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setLeft(330);
    obj.edit7:setTop(455);
    obj.edit7:setWidth(80);
    obj.edit7:setHeight(30);
    obj.edit7:setEnabled(false);
    obj.edit7:setFontColor("Red");
    obj.edit7:setType("number");
    obj.edit7:setField("Hintensidade1");
    obj.edit7:setName("edit7");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setLeft(60);
    obj.image2:setTop(420);
    obj.image2:setWidth(150);
    obj.image2:setHeight(150);
    obj.image2:setSRC("/imagens/magia.png");
    obj.image2:setName("image2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(250);
    obj.button2:setTop(510);
    obj.button2:setFontColor("red");
    obj.button2:setText("Apagar!");
    obj.button2:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button2:setWidth(150);
    obj.button2:setName("button2");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setWidth(120);
    obj.edit8:setVisible(false);
    obj.edit8:setField("naoEBuff");
    obj.edit8:setName("edit8");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(60);
    obj.button3:setTop(450);
    obj.button3:setFontSize(20);
    obj.button3:setOpacity(0.1);
    obj.button3:setHeight(90);
    obj.button3:setWidth(150);
    obj.button3:setText("Usar");
    obj.button3:setFontColor("White");
    obj.button3:setName("button3");

					
					local function ExecutarH1() 
					--[[ HABILIDADE DE DANO ]]--								
					local node = self.ListaJutsus3.node;
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
					if node.DanoAtributo1 == 'BUFF' then
						if node.naoEBuff == true then
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
						return 
						else															
						end;
					end;										
					sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						
					mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
					function (rolado)					
					if node.DanoAtributo1 ~= nil then
						if sheet.AcertoMagico + 1 > rolado.resultado then							
							if node.DanoAtributo1 == 'PA' then
								node.Hintensidade1 = (tonumber(node.DanoHabilidade1) or 0) + (tonumber(node.CuraHabilidade1) or 0) + (tonumber(sheet.PA) or 0)								
								node.naoEBuff = true;
								node.verificaBuff = node.naoEBuff;
							end;			
							if node.DanoAtributo1 == 'PM' then
								node.Hintensidade1 = (tonumber(node.DanoHabilidade1) or 0) + (tonumber(node.CuraHabilidade1) or 0) + (tonumber(sheet.PM) or 0)						
								node.naoEBuff = true;
								node.verificaBuff = node.naoEBuff;
							end;
							if node.DanoAtributo1 == 'PF' then
								node.Hintensidade1 = (tonumber(node.DanoHabilidade1) or 0) + (tonumber(node.CuraHabilidade1) or 0) + (tonumber(sheet.PF) or 0)	
								node.naoEBuff = true;
								node.verificaBuff = node.naoEBuff;
							end;
							if node.DanoAtributo1 == 'Cura' then
								node.Hintensidade1 =(tonumber(node.CuraHabilidade1) or 0) + (tonumber(sheet.PM) or 0)	
								node.naoEBuff = true;
								node.verificaBuff = node.naoEBuff;
							end;
							if node.DanoAtributo1 == 'Fixo' then
								node.Hintensidade1 = (tonumber(node.FixoHabilidade1) or 0)	
								node.naoEBuff = true;
								node.verificaBuff = node.naoEBuff;
							end;
							if node.DanoAtributo1 == 'BUFF' then
								node.Hintensidade1 = "Habilidade de Buff";
							end;
							if sheet.AcertoMagico >= rolado.resultado then
								mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. node.DescriHabilidade1);
								if node.DanoAtributo1 == 'Cura' then
									if sheet.CMagico +1 > rolado.resultado then 
										mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. node.Hintensidade1 * 2 .. "[§K8,0] »");
									else
										mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. node.Hintensidade1 .. "[§K8,0] »");
									end;	
								else
									if sheet.CMagico +1 > rolado.resultado then 
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. node.Hintensidade1 * 2 .. "[§K9,0] »");
									else
										mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. node.Hintensidade1 .. "[§K9,0] »");
									end;	
								end;									
								local mesa = Firecast.getMesaDe(sheet); 
								local Custo2 = mesa.meuJogador:getBarValue(2);
								node.Custo2 = mesa.meuJogador:getBarValue(2);
								node.Custo2 = (tonumber(node.Custo2) or 0) - (tonumber(node.Custo) or 0);
								mesa.meuJogador:requestSetBarValue(2, node.Custo2);
							else
								mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
							end;
						else							
							mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");
							if node.DanoAtributo1 == 'BUFF' then
								mesaDoPersonagem.chat:enviarMensagem("[§K3,15]ERA BUFF ESSA MERDA");	
							else 	
							end;
						end;
					else
						mesaDoPersonagem.chat:enviarMensagem("[§K3,0] TUA HABILIDADE NÃO TEM TIPO NÃO O FILHA DA PUTA ? ELA É DIFERENTONA ? ESCOLHE O TIPO DA HABILIDADE");
					end;
					end);					
					end; 														
				


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
            					-- Vamos inserir um novo item no nosso recordList                              
            					self.rclListaDosItens3:append();
        end, obj);

    obj._e_event1 = obj.rclListaDosItens3:addEventListener("onSelect",
        function (_)
            --[[
            				Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, 
            				vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            				--]]                      
            				local node = self.rclListaDosItens3.selectedNode; 
            				self.ListaJutsus3.node = node;                       
            				-- a caixa de detalhe só ficará visível se houver item selecionado
            				self.ListaJutsus3.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.rclListaDosItens3:addEventListener("onEndEnumeration",
        function (_)
            if self.rclListaDosItens3.selectedNode == nil and sheet ~= nil then
            							local nodes = ndb.getChildNodes(sheet.ListaDeHabilidades);               
            
            							if #nodes > 0 then
            									self.rclListaDosItens3.selectedNode = nodes[1];
            							end;
            					end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            NDB.deleteNode(self.ListaJutsus3.node);
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            ExecutarH1()
        end, obj);

    function obj:_releaseEvents()
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rclListaDosItens3 ~= nil then self.rclListaDosItens3:destroy(); self.rclListaDosItens3 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.ListaJutsus3 ~= nil then self.ListaJutsus3:destroy(); self.ListaJutsus3 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmhabilidade()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmhabilidade();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmhabilidade = {
    newEditor = newfrmhabilidade, 
    new = newfrmhabilidade, 
    name = "frmhabilidade", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmhabilidade = _frmhabilidade;
Firecast.registrarForm(_frmhabilidade);

return _frmhabilidade;
