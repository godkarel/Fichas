require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmsummon()
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
    obj:setName("frmsummon");
    obj:setWidth(650);
    obj:setHeight(920);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({bottom=4});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("Nova Summon");
    obj.button1:setWidth(150);
    obj.button1:setAlign("left");
    obj.button1:setName("button1");

    obj.rclSummon = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSummon:setParent(obj);
    obj.rclSummon:setName("rclSummon");
    obj.rclSummon:setField("CampoSummon");
    obj.rclSummon:setTemplateForm("frmSummon2");
    obj.rclSummon:setAlign("top");
    obj.rclSummon:setSelectable(true);
    obj.rclSummon:setLayout("horizontal");
    obj.rclSummon:setHeight(40);

    obj.FichaSummon = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.FichaSummon:setParent(obj);
    obj.FichaSummon:setName("FichaSummon");
    obj.FichaSummon:setVisible(false);
    obj.FichaSummon:setAlign("client");
    obj.FichaSummon:setMargins({left=4, right=4, top=2});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.FichaSummon);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setWidth(620);
    obj.image1:setHeight(920);
    obj.image1:setCenter(true);
    obj.image1:setSRC("/imagens/5.png");
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setTop(105);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(20);
    obj.edit1:setLeft(100);
    obj.edit1:setField("NomeSummon");
    obj.edit1:setName("edit1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setTop(30);
    obj.button2:setLeft(430);
    obj.button2:setText("Apagar!");
    obj.button2:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button2:setWidth(150);
    obj.button2:setName("button2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.scrollBox1);
    obj.comboBox1:setLeft(350);
    obj.comboBox1:setTop(105);
    obj.comboBox1:setWidth(75);
    obj.comboBox1:setField("Raca");
    obj.comboBox1:setItems({'Escolha', 'Tanker', 'Dps', 'Suport', 'Outros' });
    obj.comboBox1:setName("comboBox1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(560);
    obj.edit2:setTop(105);
    obj.edit2:setWidth(40);
    obj.edit2:setHeight(20);
    obj.edit2:setMin(1);
    obj.edit2:setMax(30);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setType("number");
    obj.edit2:setField("LevelSummon");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(170);
    obj.edit3:setTop(170);
    obj.edit3:setWidth(70);
    obj.edit3:setHeight(22);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setType("number");
    obj.edit3:setField("DanoFisicoSummon");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(170);
    obj.edit4:setTop(202);
    obj.edit4:setWidth(70);
    obj.edit4:setHeight(22);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setType("number");
    obj.edit4:setField("DanoMagicoSummon");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(170);
    obj.edit5:setTop(236);
    obj.edit5:setWidth(70);
    obj.edit5:setHeight(22);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setType("number");
    obj.edit5:setField("ReducaoSummon");
    obj.edit5:setName("edit5");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(268);
    obj.rectangle1:setTop(170);
    obj.rectangle1:setWidth(70);
    obj.rectangle1:setHeight(22);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(268);
    obj.label1:setTop(170);
    obj.label1:setWidth(70);
    obj.label1:setHeight(22);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("0");
    obj.label1:setField("DanoFisicoSummonTotal");
    obj.label1:setName("label1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(268);
    obj.rectangle2:setTop(202);
    obj.rectangle2:setWidth(70);
    obj.rectangle2:setHeight(22);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setLeft(268);
    obj.label2:setTop(202);
    obj.label2:setWidth(70);
    obj.label2:setHeight(22);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("0");
    obj.label2:setField("DanoMagicoSummonTotal");
    obj.label2:setName("label2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'DanoFisicoSummon', 'DanoMagicoSummon'});
    obj.dataLink1:setName("dataLink1");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(350);
    obj.button3:setTop(170);
    obj.button3:setWidth(145);
    obj.button3:setHeight(22);
    obj.button3:setFontColor("#00FFFF");
    obj.button3:setHorzTextAlign("center");
    obj.button3:setText("👊 Ataque da Summon");
    obj.button3:setName("button3");


							local function AtaqueBasicoSummon()      
								-- obter a mesa do personagem
								local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
								local node = self.FichaSummon.node;
								
								node.AcertoSummon = node.AcertoSummon or 0;                        
								
									mesaDoPersonagem.chat:rolarDados("1d20 + " .. node.AcertoSummon, "[§K2]Ataque Basico da Summon",						
										function (rolado)						
										local soDado = rolado.resultado + 1 - node.AcertoSummon;
											
											if soDado > node.CriticalSummon then
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]A SUMMON CRITOU ESSE ARROMBADO  :awyeah: « " .. node.DanoFisicoSummonTotal * 2 .. " »");	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico corpo a corpo « [§K4,0] " .. node.DanoFisicoSummonTotal .. " [§K9,0]»");
											end;						
									end); 
							end; 		   
						


    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(170);
    obj.edit6:setTop(270);
    obj.edit6:setWidth(70);
    obj.edit6:setHeight(20);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setField("AcertoSummon");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox1);
    obj.edit7:setLeft(170);
    obj.edit7:setTop(304);
    obj.edit7:setWidth(70);
    obj.edit7:setHeight(20);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setType("number");
    obj.edit7:setField("EsquivaSummon");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox1);
    obj.edit8:setLeft(170);
    obj.edit8:setTop(338);
    obj.edit8:setWidth(70);
    obj.edit8:setHeight(20);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setField("CriticalSummon");
    obj.edit8:setName("edit8");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(207);
    obj.button4:setTop(388);
    obj.button4:setWidth(40);
    obj.button4:setOpacity(0.1);
    obj.button4:setHeight(40);
    obj.button4:setName("button4");

    obj.BarraHP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.BarraHP:setParent(obj.scrollBox1);
    obj.BarraHP:setName("BarraHP");
    obj.BarraHP:setLeft(90);
    obj.BarraHP:setTop(400);
    obj.BarraHP:setWidth(110);
    obj.BarraHP:setColor("red");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox1);
    obj.edit9:setLeft(100);
    obj.edit9:setTop(400);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(20);
    obj.edit9:setTransparent(true);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setField("HPSummonAtual");
    obj.edit9:setName("edit9");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(143);
    obj.label3:setTop(400);
    obj.label3:setWidth(10);
    obj.label3:setHeight(20);
    obj.label3:setText("/");
    obj.label3:setName("label3");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.scrollBox1);
    obj.edit10:setLeft(150);
    obj.edit10:setTop(400);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(20);
    obj.edit10:setTransparent(true);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setField("HPSummonTotal");
    obj.edit10:setName("edit10");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(207);
    obj.button5:setTop(428);
    obj.button5:setWidth(40);
    obj.button5:setOpacity(0.1);
    obj.button5:setHeight(40);
    obj.button5:setName("button5");

    obj.BarraMP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.BarraMP:setParent(obj.scrollBox1);
    obj.BarraMP:setName("BarraMP");
    obj.BarraMP:setLeft(90);
    obj.BarraMP:setTop(430);
    obj.BarraMP:setWidth(110);
    obj.BarraMP:setColor("blue");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.scrollBox1);
    obj.edit11:setLeft(100);
    obj.edit11:setTop(430);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(20);
    obj.edit11:setTransparent(true);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setField("MPSummonAtual");
    obj.edit11:setName("edit11");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox1);
    obj.label4:setLeft(143);
    obj.label4:setTop(430);
    obj.label4:setWidth(10);
    obj.label4:setHeight(20);
    obj.label4:setText("/");
    obj.label4:setName("label4");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.scrollBox1);
    obj.edit12:setLeft(150);
    obj.edit12:setTop(430);
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(20);
    obj.edit12:setTransparent(true);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setField("MPSummonTotal");
    obj.edit12:setName("edit12");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setField("FotoSummon");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(294);
    obj.image2:setTop(331);
    obj.image2:setWidth(295);
    obj.image2:setHeight(161);
    obj.image2:setName("image2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.scrollBox1);
    obj.textEditor1:setLeft(25);
    obj.textEditor1:setTop(520);
    obj.textEditor1:setWidth(500);
    obj.textEditor1:setHeight(150);
    obj.textEditor1:setField("HabilidadeSummon1");
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.scrollBox1);
    obj.textEditor2:setLeft(25);
    obj.textEditor2:setTop(720);
    obj.textEditor2:setWidth(500);
    obj.textEditor2:setHeight(150);
    obj.textEditor2:setField("HabilidadeSummon2");
    obj.textEditor2:setName("textEditor2");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox1);
    obj.button6:setLeft(130);
    obj.button6:setTop(480);
    obj.button6:setFontSize(20);
    obj.button6:setHeight(30);
    obj.button6:setWidth(70);
    obj.button6:setText("Usar");
    obj.button6:setFontColor("White");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox1);
    obj.button7:setLeft(130);
    obj.button7:setTop(680);
    obj.button7:setFontSize(20);
    obj.button7:setHeight(30);
    obj.button7:setWidth(70);
    obj.button7:setText("Usar");
    obj.button7:setFontColor("White");
    obj.button7:setName("button7");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.FichaSummon);
    obj.dataLink2:setFields({'HPSummonAtual', 'HPSummonTotal'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.FichaSummon);
    obj.dataLink3:setFields({'MPSummonAtual', 'MPSummonTotal'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.FichaSummon);
    obj.dataLink4:setField("HPRetirado");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.FichaSummon);
    obj.dataLink5:setField("MPRetirado");
    obj.dataLink5:setName("dataLink5");


						local function ToparHPSummon()      
							local node = self.FichaSummon.node;
												
							node.HPSummonAtual = (tonumber(node.HPSummonTotal) or (tonumber(node.HPSummonAtual)));
						end; 		   
					



						local function ToparMPSummon()      
							local node = self.FichaSummon.node;
												
							node.MPSummonAtual = (tonumber(node.MPSummonTotal) or (tonumber(node.MPSummonAtual)));
						end; 		   
					


    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.FichaSummon);
    obj.dataLink6:setField("LevelSummon");
    obj.dataLink6:setName("dataLink6");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList 
                                            self.rclSummon:append();
        end, obj);

    obj._e_event1 = obj.rclSummon:addEventListener("onSelect",
        function (_)
            --[[
                                    Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário
            						selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no
            						objeto Nodo (NodeDatabase) do item selecionado.
                              --]]                      
                              local node = self.rclSummon.selectedNode;  
                                     self.FichaSummon.node = node;                       
                              -- a caixa de detalhe só ficará visível se houver item selecionado
                                      self.FichaSummon.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.rclSummon:addEventListener("onEndEnumeration",
        function (_)
            if self.rclSummon.selectedNode == nil and sheet ~= nil then
            								local nodes = ndb.getChildNodes(sheet.CampoSummon);           
            								if #nodes > 0 then
            										self.rclSummon.selectedNode = nodes[1];
            								end;
            						end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            NDB.deleteNode(self.FichaSummon.node);
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.FichaSummon.node;
            									node.DanoFisicoSummonTotal = (tonumber(node.DanoFisicoSummon) or 0);
            									node.DanoMagicoSummonTotal = (tonumber(node.DanoMagicoSummon) or 0);
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            AtaqueBasicoSummon()
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (_)
            ToparHPSummon()
        end, obj);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (_)
            ToparMPSummon()
        end, obj);

    obj._e_event8 = obj.button6:addEventListener("onClick",
        function (_)
            local node = self.FichaSummon.node;
            
            							local rolagem = Firecast.interpretarRolagem(sheet.ataqueDoPersonagem); 
            
            							if not rolagem.possuiAlgumDado then
            									rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            							end; 
            
            							local mesaDoPersonagem = Firecast.getMesaDe(sheet);					
            
            							   if mesaDoPersonagem ~= nil then
            									   mesaDoPersonagem.chat:rolarDados(rolagem, node.HabilidadeSummon1);
            									   
            							   end;
        end, obj);

    obj._e_event9 = obj.button7:addEventListener("onClick",
        function (_)
            local node = self.FichaSummon.node;
            
            									local rolagem = Firecast.interpretarRolagem(sheet.ataqueDoPersonagem); 
            
            									if not rolagem.possuiAlgumDado then
            											-- se o usuario não tiver preenchido qual dado rolar,
            											-- vamos adicionar um 1d20 + na "fórmula da rolagem"
            											rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            									end; 
            									local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            								
            
            								   if mesaDoPersonagem ~= nil then
            										   mesaDoPersonagem.chat:rolarDados(rolagem, node.HabilidadeSummon2);
            								   end;
        end, obj);

    obj._e_event10 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.FichaSummon.node;
            							
            							self.BarraHP.value = tonumber(node.HPSummonAtual);
            							self.BarraHP.max = tonumber(node.HPSummonTotal);
        end, obj);

    obj._e_event11 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.FichaSummon.node;
            							
            							self.BarraMP.value = tonumber(node.MPSummonAtual);
            							self.BarraMP.max = tonumber(node.MPSummonTotal);
        end, obj);

    obj._e_event12 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.FichaSummon.node;
            							
            							node.HPSummonAtual = (tonumber(node.HPSummonAtual) or 0) + (tonumber(node.HPRetirado) or 0);
            							node.HPRetiradoCrtZ = (tonumber(node.HPRetirado) or 0);
            										
            							self.BarraHP.value = tonumber(node.HPSummonAtual);
            							self.BarraHP.max = tonumber(node.HPSummonTotal);
        end, obj);

    obj._e_event13 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.FichaSummon.node;
            							
            							node.MPSummonAtual = (tonumber(node.MPSummonAtual) or 0) + (tonumber(node.MPRetirado));
            							node.MPRetiradoCrtZ = (tonumber(node.MPRetirado) or 0);
            										
            							self.BarraMP.value = tonumber(node.MPSummonAtual);
            							self.BarraMP.max = tonumber(node.MPSummonTotal);
        end, obj);

    obj._e_event14 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.FichaSummon ~= nil then self.FichaSummon:destroy(); self.FichaSummon = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.BarraMP ~= nil then self.BarraMP:destroy(); self.BarraMP = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rclSummon ~= nil then self.rclSummon:destroy(); self.rclSummon = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.BarraHP ~= nil then self.BarraHP:destroy(); self.BarraHP = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmsummon()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmsummon();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmsummon = {
    newEditor = newfrmsummon, 
    new = newfrmsummon, 
    name = "frmsummon", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmsummon = _frmsummon;
Firecast.registrarForm(_frmsummon);

return _frmsummon;
