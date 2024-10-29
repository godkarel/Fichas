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
    obj:setName("frmsummon");
    obj:setScale(0.9);
    obj:setWidth(650);
    obj:setHeight(700);

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
    obj.edit1:setField("NomeSummon2");
    obj.edit1:setName("edit1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setTop(30);
    obj.button2:setLeft(430);
    obj.button2:setText("Apagar!");
    obj.button2:setFontColor("red");
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

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(170);
    obj.edit6:setTop(270);
    obj.edit6:setWidth(70);
    obj.edit6:setHeight(20);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setField("EsquivaSummon");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox1);
    obj.edit7:setLeft(420);
    obj.edit7:setTop(170);
    obj.edit7:setWidth(70);
    obj.edit7:setHeight(20);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setType("number");
    obj.edit7:setField("AcertoSummon");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox1);
    obj.edit8:setLeft(420);
    obj.edit8:setTop(202);
    obj.edit8:setWidth(70);
    obj.edit8:setHeight(20);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setField("AcertoMagicoSummon");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox1);
    obj.edit9:setLeft(420);
    obj.edit9:setTop(236);
    obj.edit9:setWidth(70);
    obj.edit9:setHeight(20);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setField("CriticalSummon");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.scrollBox1);
    obj.edit10:setLeft(420);
    obj.edit10:setTop(270);
    obj.edit10:setWidth(70);
    obj.edit10:setHeight(20);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setField("CriticalMagicoSummon");
    obj.edit10:setName("edit10");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'DanoFisicoSummon', 'DanoMagicoSummon'});
    obj.dataLink1:setName("dataLink1");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(268);
    obj.button3:setTop(140);
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

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.scrollBox1);
    obj.edit11:setLeft(100);
    obj.edit11:setTop(400);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(20);
    obj.edit11:setTransparent(true);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setField("HPSummonAtual");
    obj.edit11:setName("edit11");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(143);
    obj.label1:setTop(400);
    obj.label1:setWidth(10);
    obj.label1:setHeight(20);
    obj.label1:setText("/");
    obj.label1:setName("label1");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.scrollBox1);
    obj.edit12:setLeft(150);
    obj.edit12:setTop(400);
    obj.edit12:setWidth(40);
    obj.edit12:setHeight(20);
    obj.edit12:setTransparent(true);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setField("HPSummonTotal");
    obj.edit12:setName("edit12");

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

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.scrollBox1);
    obj.edit13:setLeft(100);
    obj.edit13:setTop(430);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(20);
    obj.edit13:setTransparent(true);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setType("number");
    obj.edit13:setField("MPSummonAtual");
    obj.edit13:setName("edit13");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setLeft(143);
    obj.label2:setTop(430);
    obj.label2:setWidth(10);
    obj.label2:setHeight(20);
    obj.label2:setText("/");
    obj.label2:setName("label2");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.scrollBox1);
    obj.edit14:setLeft(150);
    obj.edit14:setTop(430);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(20);
    obj.edit14:setTransparent(true);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setType("number");
    obj.edit14:setField("MPSummonTotal");
    obj.edit14:setName("edit14");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setField("FotoSummon");
    obj.image2:setEditable(true);
    obj.image2:setStyle("stretch");
    obj.image2:setLeft(294);
    obj.image2:setTop(331);
    obj.image2:setWidth(295);
    obj.image2:setHeight(161);
    obj.image2:setName("image2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setTop(470);
    obj.layout2:setWidth(150);
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({bottom=4});
    obj.layout2:setName("layout2");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout2);
    obj.button6:setText("Nova Magia");
    obj.button6:setWidth(150);
    obj.button6:setAlign("left");
    obj.button6:setName("button6");

    obj.rclHabilidadeSummon = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadeSummon:setParent(obj.scrollBox1);
    obj.rclHabilidadeSummon:setName("rclHabilidadeSummon");
    obj.rclHabilidadeSummon:setField("CampoItensBag");
    obj.rclHabilidadeSummon:setTemplateForm("frmSummonRCL");
    obj.rclHabilidadeSummon:setTop(500);
    obj.rclHabilidadeSummon:setWidth(200);
    obj.rclHabilidadeSummon:setHeight(400);
    obj.rclHabilidadeSummon:setSelectable(true);

    obj.dscHabilidadeSummon = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dscHabilidadeSummon:setParent(obj.scrollBox1);
    obj.dscHabilidadeSummon:setName("dscHabilidadeSummon");
    obj.dscHabilidadeSummon:setLeft(200);
    obj.dscHabilidadeSummon:setVisible(false);
    obj.dscHabilidadeSummon:setTop(500);
    obj.dscHabilidadeSummon:setWidth(415);
    obj.dscHabilidadeSummon:setHeight(400);
    obj.dscHabilidadeSummon:setMargins({left=4, right=4});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.dscHabilidadeSummon);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setHeight(350);
    obj.rectangle1:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle1:setName("rectangle1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(15);
    obj.label3:setTop(15);
    obj.label3:setWidth(180);
    obj.label3:setText("Nome da Magia da Summon :");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle1);
    obj.edit15:setLeft(200);
    obj.edit15:setTop(10);
    obj.edit15:setWidth(200);
    obj.edit15:setHeight(25);
    obj.edit15:setField("NomeItemBag");
    obj.edit15:setName("edit15");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(15);
    obj.label4:setTop(40);
    obj.label4:setWidth(180);
    obj.label4:setText("Descrição :");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(60);
    obj.textEditor1:setWidth(390);
    obj.textEditor1:setHeight(130);
    obj.textEditor1:setField("DescSummonSkill");
    obj.textEditor1:setName("textEditor1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(15);
    obj.label5:setTop(200);
    obj.label5:setWidth(50);
    obj.label5:setText("Tipo");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle1);
    obj.comboBox2:setLeft(50);
    obj.comboBox2:setTop(200);
    obj.comboBox2:setWidth(70);
    obj.comboBox2:setHeight(18);
    obj.comboBox2:setField("SummonDanoTipo");
    obj.comboBox2:setItems({'PA', 'PM', 'M/PA', 'M/PM', 'Cura', 'Fixo', 'BUFF', 'Defesa'});
    obj.comboBox2:setName("comboBox2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(130);
    obj.label6:setTop(200);
    obj.label6:setWidth(50);
    obj.label6:setText("Foco");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle1);
    obj.edit16:setLeft(170);
    obj.edit16:setTop(200);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(18);
    obj.edit16:setField("FocoSummon");
    obj.edit16:setName("edit16");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(230);
    obj.label7:setTop(200);
    obj.label7:setWidth(50);
    obj.label7:setText("Custo");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle1);
    obj.edit17:setLeft(270);
    obj.edit17:setTop(200);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(18);
    obj.edit17:setField("CustoSummon");
    obj.edit17:setName("edit17");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(330);
    obj.label8:setTop(200);
    obj.label8:setWidth(50);
    obj.label8:setText("CD");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle1);
    obj.edit18:setLeft(360);
    obj.edit18:setTop(200);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(18);
    obj.edit18:setField("CDSummon");
    obj.edit18:setName("edit18");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setLeft(15);
    obj.label9:setTop(230);
    obj.label9:setWidth(70);
    obj.label9:setText("Intensidade");
    obj.label9:setFontColor("red");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle1);
    obj.edit19:setLeft(90);
    obj.edit19:setTop(230);
    obj.edit19:setWidth(70);
    obj.edit19:setHeight(18);
    obj.edit19:setHitTest(false);
    obj.edit19:setCanFocus(false);
    obj.edit19:setField("IntensidadeSummon");
    obj.edit19:setName("edit19");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setLeft(15);
    obj.button7:setTop(260);
    obj.button7:setFontColor("red");
    obj.button7:setText("");
    obj.button7:setHeight(75);
    obj.button7:setWidth(150);
    obj.button7:setName("button7");

					
							local function ExecutarSummon() 
								--[[ HABILIDADE DE DANO ]]--								
								local node = self.dscHabilidadeSummon.node;
								local nodesheet = self.FichaSummon.node;
								local mesaDoPersonagem = rrpg.getMesaDe(sheet);
								if node.SummonDanoTipo == 'BUFF' then
									if node.naoEBuffSummon == true then
										mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FOI PEGO TENTANDO ROLAR UMA HABILIDADE QUE NÃO É BUFF COMO BUFF A PROXIMA VEZ ELE SERA DESCLASSIFICADO DA MESA");
										return											
									else															
									end;
								end;
								
								nodesheet.AcertoMagicoSummon = tonumber(nodesheet.AcertoMagicoSummon) or 0;						
								mesaDoPersonagem.chat:rolarDados("1d20", "[§K2]Executar Habilidade da Summon",
								function (rolado)					
								if node.SummonDanoTipo ~= nil then
									if nodesheet.AcertoMagicoSummon + 1 > rolado.resultado then							
										if node.SummonDanoTipo == 'PA' then
											node.IntensidadeSummon = (tonumber(node.FocoSummon) or 0) + (tonumber(nodesheet.DanoFisicoSummon) or 0)								
											node.naoEBuffSummon = true;
											node.verificaBuffSummon = node.naoEBuffSummon;
										end;	
										
										if node.SummonDanoTipo == 'PM' or node.SummonDanoTipo == 'Cura' then
											node.IntensidadeSummon = (tonumber(node.FocoSummon) or 0) + (tonumber(nodesheet.DanoMagicoSummon) or 0)						
											node.naoEBuffSummon = true;
											node.verificaBuffSummon = node.naoEBuffSummon;
										end;
										
										if node.SummonDanoTipo == 'M/PA' then
											node.IntensidadeSummon = (tonumber(node.FocoSummon) or 0) + (tonumber(nodesheet.DanoFisicoSummon / 2) or 0)								
											node.naoEBuffSummon = true;
											node.verificaBuffSummon = node.naoEBuffSummon;
										end;
										
										if node.SummonDanoTipo == 'M/PM' then
											node.IntensidadeSummon = (tonumber(node.FocoSummon) or 0) + (tonumber(nodesheet.DanoMagicoSummon / 2) or 0)								
											node.naoEBuffSummon = true;
											node.verificaBuffSummon = node.naoEBuffSummon;
										end;
										
										if node.SummonDanoTipo == 'Fixo' then
											node.IntensidadeSummon = (tonumber(node.FocoSummon) or 0)	
											node.naoEBuffSummon = true;
											node.verificaBuffSummon = node.naoEBuffSummon;
										end;
										
										if node.SummonDanoTipo == 'BUFF' then
											node.IntensidadeSummon = "Habilidade de Buff";
										end;
										
										if nodesheet.AcertoMagicoSummon >= rolado.resultado then
											if node.DescSummonSkill ~= nil then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. node.DescSummonSkill);
											end;
											if node.SummonDanoTipo == 'Cura' then
												if nodesheet.CriticalMagicoSummon +1 > rolado.resultado then 
													mesaDoPersonagem.chat:enviarMensagem("[§K2,0](Summon) ,[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. node.IntensidadeSummon * 2 .. "[§K8,0] »");
												else
													mesaDoPersonagem.chat:enviarMensagem("[§K2,0](Summon) ,[§K8,0]Curando « [§K4,0]" .. node.IntensidadeSummon .. "[§K8,0] »");
												end;	
											else
												if nodesheet.CriticalMagicoSummon +1 > rolado.resultado then 
													mesaDoPersonagem.chat:enviarMensagem("[§K2,0](Summon) ,[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. node.IntensidadeSummon * 2 .. "[§K9,0] »");
												else
													mesaDoPersonagem.chat:enviarMensagem("[§K2,0](Summon) ,[§K9,0]Causando « [§K4,0]" .. node.IntensidadeSummon .. "[§K9,0] »");
												end;	
											end;
											
											local mesa = Firecast.getMesaDe(sheet); 
											nodesheet.MPSummonAtual = (tonumber(nodesheet.MPSummonAtual) or 0) - (tonumber(node.CustoSummon) or 0);
										else
											mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
										end;
									else							
										mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");
																						
										if node.SummonDanoTipo == 'BUFF' then
											mesaDoPersonagem.chat:enviarMensagem("[§K3,15]ERA BUFF ESSA MERDA");	
										else 	
										end;
									end;
								else
									mesaDoPersonagem.chat:enviarMensagem("[§K3,0] TUA HABILIDADE NÃO TEM TIPO NÃO O FILHA DA PUTA ? ELA É DIFERENTONA ? ESCOLHE O TIPO DA HABILIDADE");
								end;
								end);					
							end; 														
						


    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle1);
    obj.image3:setLeft(15);
    obj.image3:setTop(260);
    obj.image3:setHeight(75);
    obj.image3:setWidth(150);
    obj.image3:setStyle("stretch");
    obj.image3.animate = true;
    obj.image3:setSRC("https://gifimage.net/wp-content/uploads/2018/11/rune-gif-6.gif");
    obj.image3:setName("image3");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle1);
    obj.button8:setLeft(250);
    obj.button8:setTop(320);
    obj.button8:setFontColor("red");
    obj.button8:setText("Apagar!");
    obj.button8:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button8:setWidth(150);
    obj.button8:setName("button8");

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
        function (event)
            self.rclSummon:append();
        end);

    obj._e_event1 = obj.rclSummon:addEventListener("onSelect",
        function ()
            local node = self.rclSummon.selectedNode;  
            			self.FichaSummon.node = node;                       
            			self.FichaSummon.visible = (node ~= nil);
            			
            			if self.FichaSummon.visible == true then
            				self.FichaSummon.node.NomeSummon2 = self.FichaSummon.node.NomeSummon2 or ''
            				self.FichaSummon.node.Raca = self.FichaSummon.node.Raca or 'Escolha'
            				self.FichaSummon.node.LevelSummon = tonumber(self.FichaSummon.node.LevelSummon) or 1;
            				
            				self.FichaSummon.node.DanoFisicoSummon = tonumber(self.FichaSummon.node.DanoFisicoSummon) or 1;
            				self.FichaSummon.node.DanoMagicoSummon = tonumber(self.FichaSummon.node.DanoMagicoSummon) or 1;
            				self.FichaSummon.node.ReducaoSummon = tonumber(self.FichaSummon.node.ReducaoSummon) or 1;
            				self.FichaSummon.node.EsquivaSummon = tonumber(self.FichaSummon.node.EsquivaSummon) or 1;
            				
            				self.FichaSummon.node.AcertoSummon = tonumber(self.FichaSummon.node.AcertoSummon) or 1;
            				self.FichaSummon.node.AcertoMagicoSummon = tonumber(self.FichaSummon.node.AcertoMagicoSummon) or 1;
            				self.FichaSummon.node.CriticalSummon = tonumber(self.FichaSummon.node.CriticalSummon) or 1;
            				self.FichaSummon.node.CriticalMagicoSummon = tonumber(self.FichaSummon.node.CriticalMagicoSummon) or 1;
            
            				self.FichaSummon.node.HPSummonAtual = tonumber(self.FichaSummon.node.HPSummonAtual) or 1;
            				self.FichaSummon.node.HPSummonTotal = tonumber(self.FichaSummon.node.HPSummonTotal) or 1;
            				
            				self.FichaSummon.node.MPSummonAtual = tonumber(self.FichaSummon.node.MPSummonAtual) or 1;
            				self.FichaSummon.node.MPSummonTotal = tonumber(self.FichaSummon.node.MPSummonTotal) or 1;	
            				
            				self.FichaSummon.node.FotoSummon = self.FichaSummon.node.FotoSummon or 'https://upload.wikimedia.org/wikipedia/commons/f/f8/Drama-icon.png';	
            			end;
        end);

    obj._e_event2 = obj.rclSummon:addEventListener("onEndEnumeration",
        function ()
            if self.rclSummon.selectedNode == nil and sheet ~= nil then
            				local nodes = ndb.getChildNodes(sheet.CampoSummon);           
            				if #nodes > 0 then
            						self.rclSummon.selectedNode = nodes[1];
            				end;
            			end;
        end);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (event)
            NDB.deleteNode(self.FichaSummon.node);
        end);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            local node = self.FichaSummon.node;
            					node.DanoFisicoSummonTotal = (tonumber(node.DanoFisicoSummon) or 0);
            					node.DanoMagicoSummonTotal = (tonumber(node.DanoMagicoSummon) or 0);
        end);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (event)
            AtaqueBasicoSummon()
        end);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (event)
            ToparHPSummon()
        end);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (event)
            ToparMPSummon()
        end);

    obj._e_event8 = obj.button6:addEventListener("onClick",
        function (event)
            self.rclHabilidadeSummon:append();
        end);

    obj._e_event9 = obj.rclHabilidadeSummon:addEventListener("onSelect",
        function ()
            local node = self.rclHabilidadeSummon.selectedNode;  
            					self.dscHabilidadeSummon.node = node;                       
            					self.dscHabilidadeSummon.visible = (node ~= nil);
            					
            					if self.dscHabilidadeSummon.visible == true then
            						self.dscHabilidadeSummon.node.NomeItemBag = self.dscHabilidadeSummon.node.NomeItemBag or '';
            						self.dscHabilidadeSummon.node.DescSummonSkill = self.dscHabilidadeSummon.node.DescSummonSkill or '';
            						self.dscHabilidadeSummon.node.SummonDanoTipo = tonumber(self.dscHabilidadeSummon.node.SummonDanoTipo) or 'PA';
            						self.dscHabilidadeSummon.node.FocoSummon = tonumber(self.dscHabilidadeSummon.node.FocoSummon) or 0;
            						self.dscHabilidadeSummon.node.CustoSummon = tonumber(self.dscHabilidadeSummon.node.CustoSummon) or 0;
            						self.dscHabilidadeSummon.node.CDSummon = tonumber(self.dscHabilidadeSummon.node.CDSummon) or 0;
            						self.dscHabilidadeSummon.node.IntensidadeSummon = tonumber(self.dscHabilidadeSummon.node.IntensidadeSummon) or 0;
            					end;
        end);

    obj._e_event10 = obj.rclHabilidadeSummon:addEventListener("onEndEnumeration",
        function ()
            if self.rclHabilidadeSummon.selectedNode == nil and sheet ~= nil then
            						local nodes = ndb.getChildNodes(sheet.CampoItensBag);               
            
            						if #nodes > 0 then
            							self.rclHabilidadeSummon.selectedNode = nodes[1];
            						end;
            					end;
        end);

    obj._e_event11 = obj.button7:addEventListener("onClick",
        function (event)
            ExecutarSummon()
        end);

    obj._e_event12 = obj.button8:addEventListener("onClick",
        function (event)
            NDB.deleteNode(self.dscHabilidadeSummon.node);
        end);

    obj._e_event13 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            local node = self.FichaSummon.node;				
            				self.BarraHP.value = tonumber(node.HPSummonAtual);
            				self.BarraHP.max = tonumber(node.HPSummonTotal);
        end);

    obj._e_event14 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            local node = self.FichaSummon.node;				
            				self.BarraMP.value = tonumber(node.MPSummonAtual);
            				self.BarraMP.max = tonumber(node.MPSummonTotal);
        end);

    obj._e_event15 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            local node = self.FichaSummon.node;				
            				node.HPSummonAtual = (tonumber(node.HPSummonAtual) or 0) + (tonumber(node.HPRetirado) or 0);
            				node.HPRetiradoCrtZ = (tonumber(node.HPRetirado) or 0);							
            				self.BarraHP.value = tonumber(node.HPSummonAtual);
            				self.BarraHP.max = tonumber(node.HPSummonTotal);
        end);

    obj._e_event16 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            local node = self.FichaSummon.node;				
            				node.MPSummonAtual = (tonumber(node.MPSummonAtual) or 0) + (tonumber(node.MPRetirado));
            				node.MPRetiradoCrtZ = (tonumber(node.MPRetirado) or 0);							
            				self.BarraMP.value = tonumber(node.MPSummonAtual);
            				self.BarraMP.max = tonumber(node.MPSummonTotal);
        end);

    obj._e_event17 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
        end);

    function obj:_releaseEvents()
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

        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.BarraMP ~= nil then self.BarraMP:destroy(); self.BarraMP = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.FichaSummon ~= nil then self.FichaSummon:destroy(); self.FichaSummon = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rclHabilidadeSummon ~= nil then self.rclHabilidadeSummon:destroy(); self.rclHabilidadeSummon = nil; end;
        if self.dscHabilidadeSummon ~= nil then self.dscHabilidadeSummon:destroy(); self.dscHabilidadeSummon = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.BarraHP ~= nil then self.BarraHP:destroy(); self.BarraHP = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rclSummon ~= nil then self.rclSummon:destroy(); self.rclSummon = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
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
    cacheMode = "none", 
    title = "", 
    description=""};

frmsummon = _frmsummon;
Firecast.registrarForm(_frmsummon);

return _frmsummon;
