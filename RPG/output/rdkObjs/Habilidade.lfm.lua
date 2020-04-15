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

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'DanoHabilidade1', 'DanoHabilidade2', 'DanoHabilidade3', 'DanoHabilidade4', 'DanoHabilidade5', 'DanoHabilidade6', 'DanoHabilidade7', 'DanoHabilidade8', 'DanoHabilidade9', 'DanoUltima1', 'DanoUltima2',
	 'CuraHabilidade1', 'CuraHabilidade2', 'CuraHabilidade3', 'CuraHabilidade4', 'CuraHabilidade5', 'CuraHabilidade6', 'CuraHabilidade7', 'CuraHabilidade8', 'CuraHabilidade9', 'CuraUltima1', 'CuraUltima2', 
	 'DPTHabilidade1', 'DPTHabilidade2', 'DPTHabilidade3', 'DPTHabilidade4', 'DPTHabilidade5', 'DPTHabilidade6', 'DPTHabilidade7', 'DPTHabilidade8', 'DPTHabilidade9', 'DPTUltima1', 'DPTUltima2', 'PA', 'PM', 'PF', 'Forca', 'Inteligencia', 'Destreza', 'Agilidade', 'Vitalidade',
	 'ArmaPA', 'ArmaDEF', 'ArmaPM', 'ArmaRES', 'ArmaPF', 'ArmaHP', 'ArmaMP', 'ArmaduraPA', 'ArmaduraDEF', 'ArmaduraPM', 'ArmaduraRES', 'ArmaduraPF', 'ArmaduraHP', 'ArmaduraMP', 'OutraPA', 'OutraDEF', 'OutraPM', 'OutraRES', 'OutraPF', 'OutraHP', 'OutraMP', 
	 'AcessorioPA', 'AcessorioDEF', 'AcessorioPM', 'AcessorioRES', 'AcessorioPF', 'AcessorioHP', 'AcessorioMP', 'HPTotal', 'MPTotal', 'DanoAtributo1', 'DanoAtributo2', 'DanoAtributo3', 'DanoAtributo4', 'DanoAtributo5', 'DanoAtributo6', 'DanoAtributo7', 'DanoAtributo8'
	 , 'DanoAtributo9', 'DanoAtributoU1', 'DanoAtributoU2'});
    obj.dataLink1:setName("dataLink1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setWidth(60);
    obj.image2:setField("HI1");
    obj.image2:setHeight(70);
    obj.image2:setLeft(90);
    obj.image2:setTop(75);
    obj.image2:setName("image2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(78);
    obj.button1:setTop(67);
    obj.button1:setText("Clique");
    obj.button1:setOpacity(0.0);
    obj.button1:setWidth(90);
    obj.button1:setHeight(90);
    obj.button1:setName("button1");

    obj.H1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H1:setParent(obj.scrollBox1);
    obj.H1:setLeft(640);
    obj.H1:setName("H1");
    obj.H1:setVisible(false);
    obj.H1:setTop(44);
    obj.H1:setWidth(150);
    obj.H1:setHeight(22);
    obj.H1:setField("NomeHabilidade1");

    obj.HD1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD1:setParent(obj.scrollBox1);
    obj.HD1:setLeft(610);
    obj.HD1:setName("HD1");
    obj.HD1:setVisible(false);
    obj.HD1:setTop(320);
    obj.HD1:setType("number");
    obj.HD1:setWidth(50);
    obj.HD1:setHeight(20);
    obj.HD1:setField("DanoHabilidade1");

    obj.HPM1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM1:setParent(obj.scrollBox1);
    obj.HPM1:setLeft(720);
    obj.HPM1:setName("HPM1");
    obj.HPM1:setVisible(false);
    obj.HPM1:setTop(320);
    obj.HPM1:setType("number");
    obj.HPM1:setWidth(50);
    obj.HPM1:setHeight(20);
    obj.HPM1:setField("CuraHabilidade1");

    obj.HPA1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA1:setParent(obj.scrollBox1);
    obj.HPA1:setLeft(830);
    obj.HPA1:setName("HPA1");
    obj.HPA1:setVisible(false);
    obj.HPA1:setTop(320);
    obj.HPA1:setType("number");
    obj.HPA1:setWidth(50);
    obj.HPA1:setHeight(20);
    obj.HPA1:setField("current");

    obj.HPF1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF1:setParent(obj.scrollBox1);
    obj.HPF1:setLeft(940);
    obj.HPF1:setName("HPF1");
    obj.HPF1:setVisible(false);
    obj.HPF1:setTop(320);
    obj.HPF1:setType("number");
    obj.HPF1:setWidth(50);
    obj.HPF1:setHeight(20);
    obj.HPF1:setField("DPTHabilidade1");

    obj.HINT1 = GUI.fromHandle(_obj_newObject("label"));
    obj.HINT1:setParent(obj.scrollBox1);
    obj.HINT1:setLeft(880);
    obj.HINT1:setName("HINT1");
    obj.HINT1:setVisible(false);
    obj.HINT1:setTop(413);
    obj.HINT1:setWidth(50);
    obj.HINT1:setHeight(20);
    obj.HINT1:setField("Hintensidade1");

    obj.Combo1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Combo1:setParent(obj.scrollBox1);
    obj.Combo1:setName("Combo1");
    obj.Combo1:setVisible(false);
    obj.Combo1:setLeft(610);
    obj.Combo1:setTop(350);
    obj.Combo1:setWidth(120);
    obj.Combo1:setHeight(20);
    obj.Combo1:setField("DanoAtributo1");
    obj.Combo1:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.HT1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT1:setParent(obj.scrollBox1);
    obj.HT1:setLeft(565);
    obj.HT1:setTop(130);
    obj.HT1:setVisible(false);
    obj.HT1:setName("HT1");
    obj.HT1:setWidth(400);
    obj.HT1:setHeight(170);
    obj.HT1:setField("DescriHabilidade1");

    obj.HL1 = GUI.fromHandle(_obj_newObject("button"));
    obj.HL1:setParent(obj.scrollBox1);
    obj.HL1:setLeft(800);
    obj.HL1:setName("HL1");
    obj.HL1:setVisible(false);
    obj.HL1:setTop(40);
    obj.HL1:setFontSize(20);
    obj.HL1:setHeight(30);
    obj.HL1:setWidth(200);
    obj.HL1:setText("Primeira Habilidade");
    obj.HL1:setFontColor("White");


						
					
                local function ExecutarH1() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoHabilidade1 > sheet.CuraHabilidade1 and sheet.DPTHabilidade1 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade1);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Hintensidade1 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current = mesa.meuJogador:getBarValue(2);
																current = current - (tonumber(sheet.current) or 0);
																mesa.meuJogador:requestSetBarValue(2, current);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraHabilidade1 > sheet.DanoHabilidade1 and sheet.DPTHabilidade1 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade1);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Hintensidade1 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current = mesa.meuJogador:getBarValue(2);
																current = current - (tonumber(sheet.current) or 0);
																mesa.meuJogador:requestSetBarValue(2, current);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTHabilidade1 > sheet.DanoHabilidade1 and sheet.CuraHabilidade1 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade1);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTHabilidade1 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current = mesa.meuJogador:getBarValue(2);
																current = current - (tonumber(sheet.current) or 0);
																mesa.meuJogador:requestSetBarValue(2, current);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end;  

				
							
        


    obj.HI1 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI1:setParent(obj.scrollBox1);
    obj.HI1:setName("HI1");
    obj.HI1:setVisible(false);
    obj.HI1:setField("HI1");
    obj.HI1:setEditable(true);
    obj.HI1:setLeft(564);
    obj.HI1:setTop(397);
    obj.HI1:setWidth(214);
    obj.HI1:setHeight(130);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setWidth(60);
    obj.image3:setField("HI2");
    obj.image3:setHeight(70);
    obj.image3:setLeft(226);
    obj.image3:setTop(78);
    obj.image3:setName("image3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(213);
    obj.button2:setTop(67);
    obj.button2:setText("Clique");
    obj.button2:setOpacity(0.0);
    obj.button2:setWidth(90);
    obj.button2:setHeight(90);
    obj.button2:setName("button2");

    obj.H2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H2:setParent(obj.scrollBox1);
    obj.H2:setLeft(640);
    obj.H2:setName("H2");
    obj.H2:setVisible(false);
    obj.H2:setTop(44);
    obj.H2:setWidth(150);
    obj.H2:setHeight(22);
    obj.H2:setField("NomeHabilidade2");

    obj.HD2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD2:setParent(obj.scrollBox1);
    obj.HD2:setLeft(610);
    obj.HD2:setName("HD2");
    obj.HD2:setVisible(false);
    obj.HD2:setTop(320);
    obj.HD2:setType("number");
    obj.HD2:setWidth(50);
    obj.HD2:setHeight(20);
    obj.HD2:setField("DanoHabilidade2");

    obj.HPM2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM2:setParent(obj.scrollBox1);
    obj.HPM2:setLeft(720);
    obj.HPM2:setName("HPM2");
    obj.HPM2:setVisible(false);
    obj.HPM2:setTop(320);
    obj.HPM2:setType("number");
    obj.HPM2:setWidth(50);
    obj.HPM2:setHeight(20);
    obj.HPM2:setField("CuraHabilidade2");

    obj.HPA2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA2:setParent(obj.scrollBox1);
    obj.HPA2:setLeft(830);
    obj.HPA2:setName("HPA2");
    obj.HPA2:setVisible(false);
    obj.HPA2:setTop(320);
    obj.HPA2:setType("number");
    obj.HPA2:setWidth(50);
    obj.HPA2:setHeight(20);
    obj.HPA2:setField("current2");

    obj.HPF2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF2:setParent(obj.scrollBox1);
    obj.HPF2:setLeft(940);
    obj.HPF2:setName("HPF2");
    obj.HPF2:setVisible(false);
    obj.HPF2:setTop(320);
    obj.HPF2:setType("number");
    obj.HPF2:setWidth(50);
    obj.HPF2:setHeight(20);
    obj.HPF2:setField("DPTHabilidade2");

    obj.HINT2 = GUI.fromHandle(_obj_newObject("label"));
    obj.HINT2:setParent(obj.scrollBox1);
    obj.HINT2:setLeft(880);
    obj.HINT2:setName("HINT2");
    obj.HINT2:setVisible(false);
    obj.HINT2:setTop(413);
    obj.HINT2:setWidth(50);
    obj.HINT2:setHeight(20);
    obj.HINT2:setField("Hintensidade2");

    obj.Combo2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Combo2:setParent(obj.scrollBox1);
    obj.Combo2:setName("Combo2");
    obj.Combo2:setVisible(false);
    obj.Combo2:setLeft(610);
    obj.Combo2:setTop(350);
    obj.Combo2:setWidth(120);
    obj.Combo2:setHeight(20);
    obj.Combo2:setField("DanoAtributo2");
    obj.Combo2:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.HT2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT2:setParent(obj.scrollBox1);
    obj.HT2:setLeft(565);
    obj.HT2:setTop(130);
    obj.HT2:setVisible(false);
    obj.HT2:setName("HT2");
    obj.HT2:setWidth(400);
    obj.HT2:setHeight(170);
    obj.HT2:setField("DescriHabilidade2");

    obj.HL2 = GUI.fromHandle(_obj_newObject("button"));
    obj.HL2:setParent(obj.scrollBox1);
    obj.HL2:setLeft(800);
    obj.HL2:setName("HL2");
    obj.HL2:setVisible(false);
    obj.HL2:setTop(40);
    obj.HL2:setFontSize(20);
    obj.HL2:setHeight(30);
    obj.HL2:setWidth(200);
    obj.HL2:setText("Segunda Habilidade");
    obj.HL2:setFontColor("White");


						
  			
				local function ExecutarH2() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoHabilidade2 > sheet.CuraHabilidade2 and sheet.DPTHabilidade2 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade2);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Hintensidade2 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current2 = mesa.meuJogador:getBarValue(2);
																current2 = current2 - (tonumber(sheet.current2) or 0);
																mesa.meuJogador:requestSetBarValue(2, current2);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraHabilidade2 > sheet.DanoHabilidade2 and sheet.DPTHabilidade2 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade2);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Hintensidade2 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current2 = mesa.meuJogador:getBarValue(2);
																current2 = current2 - (tonumber(sheet.current2) or 0);
																mesa.meuJogador:requestSetBarValue(2, current2);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTHabilidade2 > sheet.DanoHabilidade2 and sheet.CuraHabilidade2 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade2);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTHabilidade2 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current2 = mesa.meuJogador:getBarValue(2);
																current2 = current2 - (tonumber(sheet.current2) or 0);
																mesa.meuJogador:requestSetBarValue(2, current2);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end;  
							
        


    obj.HI2 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI2:setParent(obj.scrollBox1);
    obj.HI2:setName("HI2");
    obj.HI2:setVisible(false);
    obj.HI2:setField("HI2");
    obj.HI2:setEditable(true);
    obj.HI2:setLeft(564);
    obj.HI2:setTop(397);
    obj.HI2:setWidth(214);
    obj.HI2:setHeight(130);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox1);
    obj.image4:setWidth(60);
    obj.image4:setField("HI3");
    obj.image4:setHeight(70);
    obj.image4:setLeft(360);
    obj.image4:setTop(78);
    obj.image4:setName("image4");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(346);
    obj.button3:setTop(67);
    obj.button3:setText("Clique");
    obj.button3:setOpacity(0.0);
    obj.button3:setWidth(90);
    obj.button3:setHeight(90);
    obj.button3:setName("button3");

    obj.H3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H3:setParent(obj.scrollBox1);
    obj.H3:setLeft(640);
    obj.H3:setName("H3");
    obj.H3:setVisible(false);
    obj.H3:setTop(44);
    obj.H3:setWidth(150);
    obj.H3:setHeight(22);
    obj.H3:setField("NomeHabilidade3");

    obj.HD3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD3:setParent(obj.scrollBox1);
    obj.HD3:setLeft(610);
    obj.HD3:setName("HD3");
    obj.HD3:setVisible(false);
    obj.HD3:setTop(320);
    obj.HD3:setType("number");
    obj.HD3:setWidth(50);
    obj.HD3:setHeight(20);
    obj.HD3:setField("DanoHabilidade3");

    obj.HPM3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM3:setParent(obj.scrollBox1);
    obj.HPM3:setLeft(720);
    obj.HPM3:setName("HPM3");
    obj.HPM3:setVisible(false);
    obj.HPM3:setTop(320);
    obj.HPM3:setType("number");
    obj.HPM3:setWidth(50);
    obj.HPM3:setHeight(20);
    obj.HPM3:setField("CuraHabilidade3");

    obj.HPA3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA3:setParent(obj.scrollBox1);
    obj.HPA3:setLeft(830);
    obj.HPA3:setName("HPA3");
    obj.HPA3:setVisible(false);
    obj.HPA3:setTop(320);
    obj.HPA3:setType("number");
    obj.HPA3:setWidth(50);
    obj.HPA3:setHeight(20);
    obj.HPA3:setField("current3");

    obj.HPF3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF3:setParent(obj.scrollBox1);
    obj.HPF3:setLeft(940);
    obj.HPF3:setName("HPF3");
    obj.HPF3:setVisible(false);
    obj.HPF3:setTop(320);
    obj.HPF3:setType("number");
    obj.HPF3:setWidth(50);
    obj.HPF3:setHeight(20);
    obj.HPF3:setField("DPTHabilidade3");

    obj.HINT3 = GUI.fromHandle(_obj_newObject("label"));
    obj.HINT3:setParent(obj.scrollBox1);
    obj.HINT3:setLeft(880);
    obj.HINT3:setName("HINT3");
    obj.HINT3:setVisible(false);
    obj.HINT3:setTop(413);
    obj.HINT3:setWidth(50);
    obj.HINT3:setHeight(20);
    obj.HINT3:setField("Hintensidade3");

    obj.HT3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT3:setParent(obj.scrollBox1);
    obj.HT3:setLeft(565);
    obj.HT3:setName("HT3");
    obj.HT3:setTop(130);
    obj.HT3:setVisible(false);
    obj.HT3:setWidth(400);
    obj.HT3:setHeight(170);
    obj.HT3:setField("DescriHabilidade3");

    obj.Combo3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Combo3:setParent(obj.scrollBox1);
    obj.Combo3:setName("Combo3");
    obj.Combo3:setVisible(false);
    obj.Combo3:setLeft(610);
    obj.Combo3:setTop(350);
    obj.Combo3:setWidth(120);
    obj.Combo3:setHeight(20);
    obj.Combo3:setField("DanoAtributo3");
    obj.Combo3:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.HL3 = GUI.fromHandle(_obj_newObject("button"));
    obj.HL3:setParent(obj.scrollBox1);
    obj.HL3:setLeft(800);
    obj.HL3:setName("HL3");
    obj.HL3:setVisible(false);
    obj.HL3:setTop(40);
    obj.HL3:setFontSize(20);
    obj.HL3:setHeight(30);
    obj.HL3:setWidth(200);
    obj.HL3:setText("Terceira Habilidade");
    obj.HL3:setFontColor("White");


						
                
				local function ExecutarH3() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoHabilidade3 > sheet.CuraHabilidade3 and sheet.DPTHabilidade3 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade3);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Hintensidade3 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current3 = mesa.meuJogador:getBarValue(2);
																current3 = current3 - (tonumber(sheet.current3) or 0);
																mesa.meuJogador:requestSetBarValue(2, current3);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraHabilidade3 > sheet.DanoHabilidade3 and sheet.DPTHabilidade3 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade3);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Hintensidade3 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current3 = mesa.meuJogador:getBarValue(2);
																current3 = current3 - (tonumber(sheet.current3) or 0);
																mesa.meuJogador:requestSetBarValue(2, current3);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTHabilidade3 > sheet.DanoHabilidade3 and sheet.CuraHabilidade3 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade3);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTHabilidade3 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current3 = mesa.meuJogador:getBarValue(2);
																current3 = current3 - (tonumber(sheet.current3) or 0);
																mesa.meuJogador:requestSetBarValue(2, current3);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end;  
							
        


    obj.HI3 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI3:setParent(obj.scrollBox1);
    obj.HI3:setName("HI3");
    obj.HI3:setVisible(false);
    obj.HI3:setEditable(true);
    obj.HI3:setLeft(564);
    obj.HI3:setTop(397);
    obj.HI3:setWidth(214);
    obj.HI3:setHeight(130);
    obj.HI3:setField("HI3");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox1);
    obj.image5:setWidth(60);
    obj.image5:setField("HI4");
    obj.image5:setHeight(70);
    obj.image5:setLeft(90);
    obj.image5:setTop(205);
    obj.image5:setName("image5");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(75);
    obj.button4:setTop(195);
    obj.button4:setText("Clique");
    obj.button4:setOpacity(0.0);
    obj.button4:setWidth(90);
    obj.button4:setHeight(90);
    obj.button4:setName("button4");

    obj.H4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H4:setParent(obj.scrollBox1);
    obj.H4:setLeft(640);
    obj.H4:setName("H4");
    obj.H4:setVisible(false);
    obj.H4:setTop(44);
    obj.H4:setWidth(150);
    obj.H4:setHeight(22);
    obj.H4:setField("NomeHabilidade4");

    obj.HD4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD4:setParent(obj.scrollBox1);
    obj.HD4:setLeft(610);
    obj.HD4:setName("HD4");
    obj.HD4:setVisible(false);
    obj.HD4:setTop(320);
    obj.HD4:setType("number");
    obj.HD4:setWidth(50);
    obj.HD4:setHeight(20);
    obj.HD4:setField("DanoHabilidade4");

    obj.HPM4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM4:setParent(obj.scrollBox1);
    obj.HPM4:setLeft(720);
    obj.HPM4:setName("HPM4");
    obj.HPM4:setVisible(false);
    obj.HPM4:setTop(320);
    obj.HPM4:setType("number");
    obj.HPM4:setWidth(50);
    obj.HPM4:setHeight(20);
    obj.HPM4:setField("CuraHabilidade4");

    obj.HPA4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA4:setParent(obj.scrollBox1);
    obj.HPA4:setLeft(830);
    obj.HPA4:setName("HPA4");
    obj.HPA4:setVisible(false);
    obj.HPA4:setTop(320);
    obj.HPA4:setType("number");
    obj.HPA4:setWidth(50);
    obj.HPA4:setHeight(20);
    obj.HPA4:setField("current4");

    obj.HPF4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF4:setParent(obj.scrollBox1);
    obj.HPF4:setLeft(940);
    obj.HPF4:setName("HPF4");
    obj.HPF4:setVisible(false);
    obj.HPF4:setTop(320);
    obj.HPF4:setType("number");
    obj.HPF4:setWidth(50);
    obj.HPF4:setHeight(20);
    obj.HPF4:setField("DPTHabilidade4");

    obj.HINT4 = GUI.fromHandle(_obj_newObject("label"));
    obj.HINT4:setParent(obj.scrollBox1);
    obj.HINT4:setLeft(880);
    obj.HINT4:setName("HINT4");
    obj.HINT4:setVisible(false);
    obj.HINT4:setTop(413);
    obj.HINT4:setWidth(50);
    obj.HINT4:setHeight(20);
    obj.HINT4:setField("Hintensidade4");

    obj.Combo4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Combo4:setParent(obj.scrollBox1);
    obj.Combo4:setName("Combo4");
    obj.Combo4:setVisible(false);
    obj.Combo4:setLeft(610);
    obj.Combo4:setTop(350);
    obj.Combo4:setWidth(120);
    obj.Combo4:setHeight(20);
    obj.Combo4:setField("DanoAtributo4");
    obj.Combo4:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.HT4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT4:setParent(obj.scrollBox1);
    obj.HT4:setLeft(565);
    obj.HT4:setName("HT4");
    obj.HT4:setTop(130);
    obj.HT4:setVisible(false);
    obj.HT4:setWidth(400);
    obj.HT4:setHeight(170);
    obj.HT4:setField("DescriHabilidade4");

    obj.HL4 = GUI.fromHandle(_obj_newObject("button"));
    obj.HL4:setParent(obj.scrollBox1);
    obj.HL4:setLeft(800);
    obj.HL4:setName("HL4");
    obj.HL4:setVisible(false);
    obj.HL4:setTop(40);
    obj.HL4:setFontSize(20);
    obj.HL4:setHeight(30);
    obj.HL4:setWidth(200);
    obj.HL4:setText("Quarta Habilidade");
    obj.HL4:setFontColor("White");


						
                local function ExecutarH4() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoHabilidade4 > sheet.CuraHabilidade4 and sheet.DPTHabilidade4 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade4);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Hintensidade4 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current4 = mesa.meuJogador:getBarValue(2);
																current4 = current4 - (tonumber(sheet.current4) or 0);
																mesa.meuJogador:requestSetBarValue(2, current4);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraHabilidade4 > sheet.DanoHabilidade4 and sheet.DPTHabilidade4 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade4);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Hintensidade4 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current4 = mesa.meuJogador:getBarValue(2);
																current4 = current4 - (tonumber(sheet.current4) or 0);
																mesa.meuJogador:requestSetBarValue(2, current4);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTHabilidade4 > sheet.DanoHabilidade4 and sheet.CuraHabilidade4 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade4);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTHabilidade4 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current4 = mesa.meuJogador:getBarValue(2);
																current4 = current4 - (tonumber(sheet.current4) or 0);
																mesa.meuJogador:requestSetBarValue(2, current4);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end;  
							
        


    obj.HI4 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI4:setParent(obj.scrollBox1);
    obj.HI4:setName("HI4");
    obj.HI4:setVisible(false);
    obj.HI4:setEditable(true);
    obj.HI4:setLeft(564);
    obj.HI4:setTop(397);
    obj.HI4:setWidth(214);
    obj.HI4:setHeight(130);
    obj.HI4:setField("HI4");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox1);
    obj.image6:setWidth(60);
    obj.image6:setField("HI5");
    obj.image6:setHeight(70);
    obj.image6:setLeft(227);
    obj.image6:setTop(205);
    obj.image6:setName("image6");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(213);
    obj.button5:setTop(195);
    obj.button5:setText("Clique");
    obj.button5:setOpacity(0.0);
    obj.button5:setWidth(90);
    obj.button5:setHeight(90);
    obj.button5:setName("button5");

    obj.H5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H5:setParent(obj.scrollBox1);
    obj.H5:setLeft(640);
    obj.H5:setName("H5");
    obj.H5:setVisible(false);
    obj.H5:setTop(44);
    obj.H5:setWidth(150);
    obj.H5:setHeight(22);
    obj.H5:setField("NomeHabilidade5");

    obj.HD5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD5:setParent(obj.scrollBox1);
    obj.HD5:setLeft(610);
    obj.HD5:setName("HD5");
    obj.HD5:setVisible(false);
    obj.HD5:setTop(320);
    obj.HD5:setType("number");
    obj.HD5:setWidth(50);
    obj.HD5:setHeight(20);
    obj.HD5:setField("DanoHabilidade5");

    obj.HPM5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM5:setParent(obj.scrollBox1);
    obj.HPM5:setLeft(720);
    obj.HPM5:setName("HPM5");
    obj.HPM5:setVisible(false);
    obj.HPM5:setTop(320);
    obj.HPM5:setType("number");
    obj.HPM5:setWidth(50);
    obj.HPM5:setHeight(20);
    obj.HPM5:setField("CuraHabilidade5");

    obj.HPA5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA5:setParent(obj.scrollBox1);
    obj.HPA5:setLeft(830);
    obj.HPA5:setName("HPA5");
    obj.HPA5:setVisible(false);
    obj.HPA5:setTop(320);
    obj.HPA5:setType("number");
    obj.HPA5:setWidth(50);
    obj.HPA5:setHeight(20);
    obj.HPA5:setField("current5");

    obj.HPF5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF5:setParent(obj.scrollBox1);
    obj.HPF5:setLeft(940);
    obj.HPF5:setName("HPF5");
    obj.HPF5:setVisible(false);
    obj.HPF5:setTop(320);
    obj.HPF5:setType("number");
    obj.HPF5:setWidth(50);
    obj.HPF5:setHeight(20);
    obj.HPF5:setField("DPTHabilidade5");

    obj.HINT5 = GUI.fromHandle(_obj_newObject("label"));
    obj.HINT5:setParent(obj.scrollBox1);
    obj.HINT5:setLeft(880);
    obj.HINT5:setName("HINT5");
    obj.HINT5:setVisible(false);
    obj.HINT5:setTop(413);
    obj.HINT5:setWidth(50);
    obj.HINT5:setHeight(20);
    obj.HINT5:setField("Hintensidade5");

    obj.Combo5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Combo5:setParent(obj.scrollBox1);
    obj.Combo5:setName("Combo5");
    obj.Combo5:setVisible(false);
    obj.Combo5:setLeft(610);
    obj.Combo5:setTop(350);
    obj.Combo5:setWidth(120);
    obj.Combo5:setHeight(20);
    obj.Combo5:setField("DanoAtributo5");
    obj.Combo5:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.HT5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT5:setParent(obj.scrollBox1);
    obj.HT5:setLeft(565);
    obj.HT5:setName("HT5");
    obj.HT5:setTop(130);
    obj.HT5:setVisible(false);
    obj.HT5:setWidth(400);
    obj.HT5:setHeight(170);
    obj.HT5:setField("DescriHabilidade5");

    obj.HL5 = GUI.fromHandle(_obj_newObject("button"));
    obj.HL5:setParent(obj.scrollBox1);
    obj.HL5:setLeft(800);
    obj.HL5:setName("HL5");
    obj.HL5:setVisible(false);
    obj.HL5:setTop(40);
    obj.HL5:setFontSize(20);
    obj.HL5:setHeight(30);
    obj.HL5:setWidth(200);
    obj.HL5:setText("Quinta Habilidade");
    obj.HL5:setFontColor("White");


						
                local function ExecutarH5() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoHabilidade5 > sheet.CuraHabilidade5 and sheet.DPTHabilidade5 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade5);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Hintensidade5 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current5 = mesa.meuJogador:getBarValue(2);
																current5 = current5 - (tonumber(sheet.current5) or 0);
																mesa.meuJogador:requestSetBarValue(2, current5);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraHabilidade5 > sheet.DanoHabilidade5 and sheet.DPTHabilidade5 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade5);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Hintensidade5 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current5 = mesa.meuJogador:getBarValue(2);
																current5 = current5 - (tonumber(sheet.current5) or 0);
																mesa.meuJogador:requestSetBarValue(2, current5);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTHabilidade5 > sheet.DanoHabilidade5 and sheet.CuraHabilidade5 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade5);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTHabilidade5 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current5 = mesa.meuJogador:getBarValue(2);
																current5 = current5 - (tonumber(sheet.current5) or 0);
																mesa.meuJogador:requestSetBarValue(2, current5);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end;  
							
        


    obj.HI5 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI5:setParent(obj.scrollBox1);
    obj.HI5:setName("HI5");
    obj.HI5:setVisible(false);
    obj.HI5:setEditable(true);
    obj.HI5:setLeft(564);
    obj.HI5:setTop(397);
    obj.HI5:setWidth(214);
    obj.HI5:setHeight(130);
    obj.HI5:setField("HI5");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox1);
    obj.image7:setWidth(60);
    obj.image7:setField("HI6");
    obj.image7:setHeight(70);
    obj.image7:setLeft(361);
    obj.image7:setTop(205);
    obj.image7:setName("image7");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox1);
    obj.button6:setLeft(346);
    obj.button6:setTop(195);
    obj.button6:setText("Clique");
    obj.button6:setOpacity(0.0);
    obj.button6:setWidth(90);
    obj.button6:setHeight(90);
    obj.button6:setName("button6");

    obj.H6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H6:setParent(obj.scrollBox1);
    obj.H6:setLeft(640);
    obj.H6:setName("H6");
    obj.H6:setVisible(false);
    obj.H6:setTop(44);
    obj.H6:setWidth(150);
    obj.H6:setHeight(22);
    obj.H6:setField("NomeHabilidade6");

    obj.HD6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD6:setParent(obj.scrollBox1);
    obj.HD6:setLeft(610);
    obj.HD6:setName("HD6");
    obj.HD6:setVisible(false);
    obj.HD6:setTop(320);
    obj.HD6:setType("number");
    obj.HD6:setWidth(50);
    obj.HD6:setHeight(20);
    obj.HD6:setField("DanoHabilidade6");

    obj.HPM6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM6:setParent(obj.scrollBox1);
    obj.HPM6:setLeft(720);
    obj.HPM6:setName("HPM6");
    obj.HPM6:setVisible(false);
    obj.HPM6:setTop(320);
    obj.HPM6:setType("number");
    obj.HPM6:setWidth(50);
    obj.HPM6:setHeight(20);
    obj.HPM6:setField("CuraHabilidade6");

    obj.HPA6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA6:setParent(obj.scrollBox1);
    obj.HPA6:setLeft(830);
    obj.HPA6:setName("HPA6");
    obj.HPA6:setVisible(false);
    obj.HPA6:setTop(320);
    obj.HPA6:setType("number");
    obj.HPA6:setWidth(50);
    obj.HPA6:setHeight(20);
    obj.HPA6:setField("current6");

    obj.HPF6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF6:setParent(obj.scrollBox1);
    obj.HPF6:setLeft(940);
    obj.HPF6:setName("HPF6");
    obj.HPF6:setVisible(false);
    obj.HPF6:setTop(320);
    obj.HPF6:setType("number");
    obj.HPF6:setWidth(50);
    obj.HPF6:setHeight(20);
    obj.HPF6:setField("DPTHabilidade6");

    obj.HINT6 = GUI.fromHandle(_obj_newObject("label"));
    obj.HINT6:setParent(obj.scrollBox1);
    obj.HINT6:setLeft(880);
    obj.HINT6:setName("HINT6");
    obj.HINT6:setVisible(false);
    obj.HINT6:setTop(413);
    obj.HINT6:setWidth(50);
    obj.HINT6:setHeight(20);
    obj.HINT6:setField("Hintensidade6");

    obj.Combo6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Combo6:setParent(obj.scrollBox1);
    obj.Combo6:setName("Combo6");
    obj.Combo6:setVisible(false);
    obj.Combo6:setLeft(610);
    obj.Combo6:setTop(350);
    obj.Combo6:setWidth(120);
    obj.Combo6:setHeight(20);
    obj.Combo6:setField("DanoAtributo6");
    obj.Combo6:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.HT6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT6:setParent(obj.scrollBox1);
    obj.HT6:setLeft(565);
    obj.HT6:setName("HT6");
    obj.HT6:setTop(130);
    obj.HT6:setVisible(false);
    obj.HT6:setWidth(400);
    obj.HT6:setHeight(170);
    obj.HT6:setField("DescriHabilidade6");

    obj.HL6 = GUI.fromHandle(_obj_newObject("button"));
    obj.HL6:setParent(obj.scrollBox1);
    obj.HL6:setLeft(800);
    obj.HL6:setName("HL6");
    obj.HL6:setVisible(false);
    obj.HL6:setTop(40);
    obj.HL6:setFontSize(20);
    obj.HL6:setHeight(30);
    obj.HL6:setWidth(200);
    obj.HL6:setText("Sexta Habilidade");
    obj.HL6:setFontColor("White");


						
                local function ExecutarH6() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoHabilidade6 > sheet.CuraHabilidade6 and sheet.DPTHabilidade6 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade6);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Hintensidade6 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current6 = mesa.meuJogador:getBarValue(2);
																current6 = current6 - (tonumber(sheet.current6) or 0);
																mesa.meuJogador:requestSetBarValue(2, current6);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraHabilidade6 > sheet.DanoHabilidade6 and sheet.DPTHabilidade6 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade6);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Hintensidade6 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current6 = mesa.meuJogador:getBarValue(2);
																current6 = current6 - (tonumber(sheet.current6) or 0);
																mesa.meuJogador:requestSetBarValue(2, current6);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTHabilidade6 > sheet.DanoHabilidade6 and sheet.CuraHabilidade6 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade6);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTHabilidade6 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current6 = mesa.meuJogador:getBarValue(2);
																current6 = current6 - (tonumber(sheet.current6) or 0);
																mesa.meuJogador:requestSetBarValue(2, current6);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end;  
							
        


    obj.HI6 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI6:setParent(obj.scrollBox1);
    obj.HI6:setName("HI6");
    obj.HI6:setVisible(false);
    obj.HI6:setEditable(true);
    obj.HI6:setLeft(564);
    obj.HI6:setTop(397);
    obj.HI6:setWidth(214);
    obj.HI6:setHeight(130);
    obj.HI6:setField("HI6");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.scrollBox1);
    obj.image8:setWidth(60);
    obj.image8:setField("HI7");
    obj.image8:setHeight(70);
    obj.image8:setLeft(90);
    obj.image8:setTop(325);
    obj.image8:setName("image8");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox1);
    obj.button7:setLeft(75);
    obj.button7:setTop(315);
    obj.button7:setText("Clique");
    obj.button7:setOpacity(0.0);
    obj.button7:setWidth(90);
    obj.button7:setHeight(90);
    obj.button7:setName("button7");

    obj.H7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H7:setParent(obj.scrollBox1);
    obj.H7:setLeft(640);
    obj.H7:setName("H7");
    obj.H7:setVisible(false);
    obj.H7:setTop(44);
    obj.H7:setWidth(150);
    obj.H7:setHeight(22);
    obj.H7:setField("NomeHabilidade7");

    obj.HD7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD7:setParent(obj.scrollBox1);
    obj.HD7:setLeft(610);
    obj.HD7:setName("HD7");
    obj.HD7:setVisible(false);
    obj.HD7:setTop(320);
    obj.HD7:setType("number");
    obj.HD7:setWidth(50);
    obj.HD7:setHeight(20);
    obj.HD7:setField("DanoHabilidade7");

    obj.HPM7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM7:setParent(obj.scrollBox1);
    obj.HPM7:setLeft(720);
    obj.HPM7:setName("HPM7");
    obj.HPM7:setVisible(false);
    obj.HPM7:setTop(320);
    obj.HPM7:setType("number");
    obj.HPM7:setWidth(50);
    obj.HPM7:setHeight(20);
    obj.HPM7:setField("CuraHabilidade7");

    obj.HPA7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA7:setParent(obj.scrollBox1);
    obj.HPA7:setLeft(830);
    obj.HPA7:setName("HPA7");
    obj.HPA7:setVisible(false);
    obj.HPA7:setTop(320);
    obj.HPA7:setType("number");
    obj.HPA7:setWidth(50);
    obj.HPA7:setHeight(20);
    obj.HPA7:setField("current7");

    obj.HPF7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF7:setParent(obj.scrollBox1);
    obj.HPF7:setLeft(940);
    obj.HPF7:setName("HPF7");
    obj.HPF7:setVisible(false);
    obj.HPF7:setTop(320);
    obj.HPF7:setType("number");
    obj.HPF7:setWidth(50);
    obj.HPF7:setHeight(20);
    obj.HPF7:setField("DPTHabilidade7");

    obj.HINT7 = GUI.fromHandle(_obj_newObject("label"));
    obj.HINT7:setParent(obj.scrollBox1);
    obj.HINT7:setLeft(880);
    obj.HINT7:setName("HINT7");
    obj.HINT7:setVisible(false);
    obj.HINT7:setTop(413);
    obj.HINT7:setWidth(50);
    obj.HINT7:setHeight(20);
    obj.HINT7:setField("Hintensidade7");

    obj.Combo7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Combo7:setParent(obj.scrollBox1);
    obj.Combo7:setName("Combo7");
    obj.Combo7:setVisible(false);
    obj.Combo7:setLeft(610);
    obj.Combo7:setTop(350);
    obj.Combo7:setWidth(120);
    obj.Combo7:setHeight(20);
    obj.Combo7:setField("DanoAtributo7");
    obj.Combo7:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.HT7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT7:setParent(obj.scrollBox1);
    obj.HT7:setLeft(565);
    obj.HT7:setName("HT7");
    obj.HT7:setTop(130);
    obj.HT7:setVisible(false);
    obj.HT7:setWidth(400);
    obj.HT7:setHeight(170);
    obj.HT7:setField("DescriHabilidade7");

    obj.HL7 = GUI.fromHandle(_obj_newObject("button"));
    obj.HL7:setParent(obj.scrollBox1);
    obj.HL7:setLeft(800);
    obj.HL7:setName("HL7");
    obj.HL7:setVisible(false);
    obj.HL7:setTop(40);
    obj.HL7:setFontSize(20);
    obj.HL7:setHeight(30);
    obj.HL7:setWidth(200);
    obj.HL7:setText("Setima Habilidade");
    obj.HL7:setFontColor("White");


						
                local function ExecutarH7() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoHabilidade7 > sheet.CuraHabilidade7 and sheet.DPTHabilidade7 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade7);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Hintensidade7 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current7 = mesa.meuJogador:getBarValue(2);
																current7 = current7 - (tonumber(sheet.current7) or 0);
																mesa.meuJogador:requestSetBarValue(2, current7);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraHabilidade7 > sheet.DanoHabilidade7 and sheet.DPTHabilidade7 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade7);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Hintensidade7 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current7 = mesa.meuJogador:getBarValue(2);
																current7 = current7 - (tonumber(sheet.current7) or 0);
																mesa.meuJogador:requestSetBarValue(2, current7);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTHabilidade7 > sheet.DanoHabilidade7 and sheet.CuraHabilidade7 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade7);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTHabilidade7 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current7 = mesa.meuJogador:getBarValue(2);
																current7 = current7 - (tonumber(sheet.current7) or 0);
																mesa.meuJogador:requestSetBarValue(2, current7);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end;    
							
        


    obj.HI7 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI7:setParent(obj.scrollBox1);
    obj.HI7:setName("HI7");
    obj.HI7:setVisible(false);
    obj.HI7:setEditable(true);
    obj.HI7:setLeft(564);
    obj.HI7:setTop(397);
    obj.HI7:setWidth(214);
    obj.HI7:setHeight(130);
    obj.HI7:setField("HI7");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.scrollBox1);
    obj.image9:setWidth(60);
    obj.image9:setField("HI8");
    obj.image9:setHeight(70);
    obj.image9:setLeft(227);
    obj.image9:setTop(325);
    obj.image9:setName("image9");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox1);
    obj.button8:setLeft(213);
    obj.button8:setTop(315);
    obj.button8:setText("Clique");
    obj.button8:setOpacity(0.0);
    obj.button8:setWidth(90);
    obj.button8:setHeight(90);
    obj.button8:setName("button8");

    obj.H8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H8:setParent(obj.scrollBox1);
    obj.H8:setLeft(640);
    obj.H8:setName("H8");
    obj.H8:setVisible(false);
    obj.H8:setTop(44);
    obj.H8:setWidth(150);
    obj.H8:setHeight(22);
    obj.H8:setField("NomeHabilidade8");

    obj.HD8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD8:setParent(obj.scrollBox1);
    obj.HD8:setLeft(610);
    obj.HD8:setName("HD8");
    obj.HD8:setVisible(false);
    obj.HD8:setTop(320);
    obj.HD8:setType("number");
    obj.HD8:setWidth(50);
    obj.HD8:setHeight(20);
    obj.HD8:setField("DanoHabilidade8");

    obj.HPM8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM8:setParent(obj.scrollBox1);
    obj.HPM8:setLeft(720);
    obj.HPM8:setName("HPM8");
    obj.HPM8:setVisible(false);
    obj.HPM8:setTop(320);
    obj.HPM8:setType("number");
    obj.HPM8:setWidth(50);
    obj.HPM8:setHeight(20);
    obj.HPM8:setField("CuraHabilidade8");

    obj.HPA8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA8:setParent(obj.scrollBox1);
    obj.HPA8:setLeft(830);
    obj.HPA8:setName("HPA8");
    obj.HPA8:setVisible(false);
    obj.HPA8:setTop(320);
    obj.HPA8:setType("number");
    obj.HPA8:setWidth(50);
    obj.HPA8:setHeight(20);
    obj.HPA8:setField("current8");

    obj.HPF8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF8:setParent(obj.scrollBox1);
    obj.HPF8:setLeft(940);
    obj.HPF8:setName("HPF8");
    obj.HPF8:setVisible(false);
    obj.HPF8:setTop(320);
    obj.HPF8:setType("number");
    obj.HPF8:setWidth(50);
    obj.HPF8:setHeight(20);
    obj.HPF8:setField("DPTHabilidade8");

    obj.HINT8 = GUI.fromHandle(_obj_newObject("label"));
    obj.HINT8:setParent(obj.scrollBox1);
    obj.HINT8:setLeft(880);
    obj.HINT8:setName("HINT8");
    obj.HINT8:setVisible(false);
    obj.HINT8:setTop(413);
    obj.HINT8:setWidth(50);
    obj.HINT8:setHeight(20);
    obj.HINT8:setField("Hintensidade8");

    obj.Combo8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Combo8:setParent(obj.scrollBox1);
    obj.Combo8:setName("Combo8");
    obj.Combo8:setVisible(false);
    obj.Combo8:setLeft(610);
    obj.Combo8:setTop(350);
    obj.Combo8:setWidth(120);
    obj.Combo8:setHeight(20);
    obj.Combo8:setField("DanoAtributo8");
    obj.Combo8:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.HT8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT8:setParent(obj.scrollBox1);
    obj.HT8:setLeft(565);
    obj.HT8:setName("HT8");
    obj.HT8:setTop(130);
    obj.HT8:setVisible(false);
    obj.HT8:setWidth(400);
    obj.HT8:setHeight(170);
    obj.HT8:setField("DescriHabilidade8");

    obj.HL8 = GUI.fromHandle(_obj_newObject("button"));
    obj.HL8:setParent(obj.scrollBox1);
    obj.HL8:setLeft(800);
    obj.HL8:setName("HL8");
    obj.HL8:setVisible(false);
    obj.HL8:setTop(40);
    obj.HL8:setFontSize(20);
    obj.HL8:setHeight(30);
    obj.HL8:setWidth(200);
    obj.HL8:setText("Oitava Habilidade");
    obj.HL8:setFontColor("White");


						
                                local function ExecutarH8() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoHabilidade8 > sheet.CuraHabilidade8 and sheet.DPTHabilidade8 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade8);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Hintensidade8 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current8 = mesa.meuJogador:getBarValue(2);
																current8 = current8 - (tonumber(sheet.current8) or 0);
																mesa.meuJogador:requestSetBarValue(2, current8);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraHabilidade8 > sheet.DanoHabilidade8 and sheet.DPTHabilidade8 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade8);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Hintensidade8 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current8 = mesa.meuJogador:getBarValue(2);
																current8 = current8 - (tonumber(sheet.current8) or 0);
																mesa.meuJogador:requestSetBarValue(2, current8);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTHabilidade8 > sheet.DanoHabilidade8 and sheet.CuraHabilidade8 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade8);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTHabilidade8 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current8 = mesa.meuJogador:getBarValue(2);
																current8 = current8 - (tonumber(sheet.current8) or 0);
																mesa.meuJogador:requestSetBarValue(2, current8);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end;  
							
        


    obj.HI8 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI8:setParent(obj.scrollBox1);
    obj.HI8:setName("HI8");
    obj.HI8:setVisible(false);
    obj.HI8:setEditable(true);
    obj.HI8:setLeft(564);
    obj.HI8:setTop(397);
    obj.HI8:setWidth(214);
    obj.HI8:setHeight(130);
    obj.HI8:setField("HI8");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.scrollBox1);
    obj.image10:setWidth(60);
    obj.image10:setField("HI9");
    obj.image10:setHeight(70);
    obj.image10:setLeft(361);
    obj.image10:setTop(325);
    obj.image10:setName("image10");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox1);
    obj.button9:setLeft(346);
    obj.button9:setTop(315);
    obj.button9:setText("Clique");
    obj.button9:setOpacity(0.0);
    obj.button9:setWidth(90);
    obj.button9:setHeight(90);
    obj.button9:setName("button9");

    obj.H9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H9:setParent(obj.scrollBox1);
    obj.H9:setLeft(640);
    obj.H9:setName("H9");
    obj.H9:setVisible(false);
    obj.H9:setTop(44);
    obj.H9:setWidth(150);
    obj.H9:setHeight(22);
    obj.H9:setField("NomeHabilidade9");

    obj.HD9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD9:setParent(obj.scrollBox1);
    obj.HD9:setLeft(610);
    obj.HD9:setName("HD9");
    obj.HD9:setVisible(false);
    obj.HD9:setTop(320);
    obj.HD9:setType("number");
    obj.HD9:setWidth(50);
    obj.HD9:setHeight(20);
    obj.HD9:setField("DanoHabilidade9");

    obj.HPM9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM9:setParent(obj.scrollBox1);
    obj.HPM9:setLeft(720);
    obj.HPM9:setName("HPM9");
    obj.HPM9:setVisible(false);
    obj.HPM9:setTop(320);
    obj.HPM9:setType("number");
    obj.HPM9:setWidth(50);
    obj.HPM9:setHeight(20);
    obj.HPM9:setField("CuraHabilidade9");

    obj.HPA9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA9:setParent(obj.scrollBox1);
    obj.HPA9:setLeft(830);
    obj.HPA9:setName("HPA9");
    obj.HPA9:setVisible(false);
    obj.HPA9:setTop(320);
    obj.HPA9:setType("number");
    obj.HPA9:setWidth(50);
    obj.HPA9:setHeight(20);
    obj.HPA9:setField("current9");

    obj.HPF9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF9:setParent(obj.scrollBox1);
    obj.HPF9:setLeft(940);
    obj.HPF9:setName("HPF9");
    obj.HPF9:setVisible(false);
    obj.HPF9:setTop(320);
    obj.HPF9:setType("number");
    obj.HPF9:setWidth(50);
    obj.HPF9:setHeight(20);
    obj.HPF9:setField("DPTHabilidade9");

    obj.HINT9 = GUI.fromHandle(_obj_newObject("label"));
    obj.HINT9:setParent(obj.scrollBox1);
    obj.HINT9:setLeft(880);
    obj.HINT9:setName("HINT9");
    obj.HINT9:setVisible(false);
    obj.HINT9:setTop(413);
    obj.HINT9:setWidth(50);
    obj.HINT9:setHeight(20);
    obj.HINT9:setField("Hintensidade9");

    obj.Combo9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.Combo9:setParent(obj.scrollBox1);
    obj.Combo9:setName("Combo9");
    obj.Combo9:setVisible(false);
    obj.Combo9:setLeft(610);
    obj.Combo9:setTop(350);
    obj.Combo9:setWidth(120);
    obj.Combo9:setHeight(20);
    obj.Combo9:setField("DanoAtributo9");
    obj.Combo9:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.HT9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT9:setParent(obj.scrollBox1);
    obj.HT9:setLeft(565);
    obj.HT9:setName("HT9");
    obj.HT9:setTop(130);
    obj.HT9:setVisible(false);
    obj.HT9:setWidth(400);
    obj.HT9:setHeight(170);
    obj.HT9:setField("DescriHabilidade9");

    obj.HL9 = GUI.fromHandle(_obj_newObject("button"));
    obj.HL9:setParent(obj.scrollBox1);
    obj.HL9:setLeft(800);
    obj.HL9:setName("HL9");
    obj.HL9:setVisible(false);
    obj.HL9:setTop(40);
    obj.HL9:setFontSize(20);
    obj.HL9:setHeight(30);
    obj.HL9:setWidth(200);
    obj.HL9:setText("Nona Habilidade");
    obj.HL9:setFontColor("White");


						
                                local function ExecutarH9() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoHabilidade9 > sheet.CuraHabilidade9 and sheet.DPTHabilidade9 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade9);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Hintensidade9 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current9 = mesa.meuJogador:getBarValue(2);
																current9 = current9 - (tonumber(sheet.current9) or 0);
																mesa.meuJogador:requestSetBarValue(2, current9);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraHabilidade9 > sheet.DanoHabilidade9 and sheet.DPTHabilidade9 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade9);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Hintensidade9 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current9 = mesa.meuJogador:getBarValue(2);
																current9 = current9 - (tonumber(sheet.current9) or 0);
																mesa.meuJogador:requestSetBarValue(2, current9);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTHabilidade9 > sheet.DanoHabilidade9 and sheet.CuraHabilidade9 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHabilidade9);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTHabilidade9 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local current9 = mesa.meuJogador:getBarValue(2);
																current9 = current9 - (tonumber(sheet.current9) or 0);
																mesa.meuJogador:requestSetBarValue(2, current9);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end;       
							
        


    obj.HI9 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI9:setParent(obj.scrollBox1);
    obj.HI9:setName("HI9");
    obj.HI9:setVisible(false);
    obj.HI9:setEditable(true);
    obj.HI9:setLeft(564);
    obj.HI9:setTop(397);
    obj.HI9:setWidth(214);
    obj.HI9:setHeight(130);
    obj.HI9:setField("HI9");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.scrollBox1);
    obj.image11:setWidth(80);
    obj.image11:setField("UI1");
    obj.image11:setHeight(100);
    obj.image11:setLeft(133);
    obj.image11:setTop(455);
    obj.image11:setName("image11");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox1);
    obj.button10:setLeft(120);
    obj.button10:setTop(450);
    obj.button10:setText("Clique");
    obj.button10:setOpacity(0.0);
    obj.button10:setWidth(110);
    obj.button10:setHeight(110);
    obj.button10:setName("button10");

    obj.U1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.U1:setParent(obj.scrollBox1);
    obj.U1:setLeft(640);
    obj.U1:setName("U1");
    obj.U1:setVisible(false);
    obj.U1:setTop(44);
    obj.U1:setWidth(150);
    obj.U1:setHeight(22);
    obj.U1:setField("NomeUltima1");

    obj.UD1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UD1:setParent(obj.scrollBox1);
    obj.UD1:setLeft(610);
    obj.UD1:setName("UD1");
    obj.UD1:setVisible(false);
    obj.UD1:setTop(320);
    obj.UD1:setType("number");
    obj.UD1:setWidth(50);
    obj.UD1:setHeight(20);
    obj.UD1:setField("DanoUltima1");

    obj.UPM1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPM1:setParent(obj.scrollBox1);
    obj.UPM1:setLeft(720);
    obj.UPM1:setName("UPM1");
    obj.UPM1:setVisible(false);
    obj.UPM1:setTop(320);
    obj.UPM1:setType("number");
    obj.UPM1:setWidth(50);
    obj.UPM1:setHeight(20);
    obj.UPM1:setField("CuraUltima1");

    obj.UPA1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPA1:setParent(obj.scrollBox1);
    obj.UPA1:setLeft(830);
    obj.UPA1:setName("UPA1");
    obj.UPA1:setVisible(false);
    obj.UPA1:setTop(320);
    obj.UPA1:setType("number");
    obj.UPA1:setWidth(50);
    obj.UPA1:setHeight(20);
    obj.UPA1:setField("currentU1");

    obj.UPF1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPF1:setParent(obj.scrollBox1);
    obj.UPF1:setLeft(940);
    obj.UPF1:setName("UPF1");
    obj.UPF1:setVisible(false);
    obj.UPF1:setTop(320);
    obj.UPF1:setType("number");
    obj.UPF1:setWidth(50);
    obj.UPF1:setHeight(20);
    obj.UPF1:setField("DPTUltima1");

    obj.UINT1 = GUI.fromHandle(_obj_newObject("label"));
    obj.UINT1:setParent(obj.scrollBox1);
    obj.UINT1:setLeft(880);
    obj.UINT1:setName("UINT1");
    obj.UINT1:setVisible(false);
    obj.UINT1:setTop(413);
    obj.UINT1:setWidth(50);
    obj.UINT1:setHeight(20);
    obj.UINT1:setField("Uintensidade1");

    obj.ComboU1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.ComboU1:setParent(obj.scrollBox1);
    obj.ComboU1:setName("ComboU1");
    obj.ComboU1:setVisible(false);
    obj.ComboU1:setLeft(610);
    obj.ComboU1:setTop(350);
    obj.ComboU1:setWidth(120);
    obj.ComboU1:setHeight(20);
    obj.ComboU1:setField("DanoAtributoU2");
    obj.ComboU1:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.UT1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.UT1:setParent(obj.scrollBox1);
    obj.UT1:setLeft(565);
    obj.UT1:setName("UT1");
    obj.UT1:setTop(130);
    obj.UT1:setVisible(false);
    obj.UT1:setWidth(400);
    obj.UT1:setHeight(170);
    obj.UT1:setField("DescriUltima1");

    obj.UL1 = GUI.fromHandle(_obj_newObject("button"));
    obj.UL1:setParent(obj.scrollBox1);
    obj.UL1:setLeft(800);
    obj.UL1:setName("UL1");
    obj.UL1:setVisible(false);
    obj.UL1:setTop(40);
    obj.UL1:setFontSize(20);
    obj.UL1:setHeight(30);
    obj.UL1:setWidth(200);
    obj.UL1:setText("Primeira Ultimate");
    obj.UL1:setFontColor("White");


						
                    local function ExecutarU1() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoUltima1 > sheet.CuraUltima1 and sheet.DPTUltima1 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriUltima1);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Uintensidade1 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local currentU1 = mesa.meuJogador:getBarValue(2);
																currentU1 = currentU1 - (tonumber(sheet.currentU1) or 0);
																mesa.meuJogador:requestSetBarValue(2, currentU1);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraUltima1 > sheet.DanoUltima1 and sheet.DPTUltima1 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriUltima1);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Uintensidade1 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local currentU1 = mesa.meuJogador:getBarValue(2);
																currentU1 = currentU1 - (tonumber(sheet.currentU1) or 0);
																mesa.meuJogador:requestSetBarValue(2, currentU1);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTUltima1 > sheet.DanoUltima1 and sheet.CuraUltima1 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriUltima1);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTUltima1 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local currentU1 = mesa.meuJogador:getBarValue(2);
																currentU1 = currentU1 - (tonumber(sheet.currentU1) or 0);
																mesa.meuJogador:requestSetBarValue(2, currentU1);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end; 
							
        


    obj.UI1 = GUI.fromHandle(_obj_newObject("image"));
    obj.UI1:setParent(obj.scrollBox1);
    obj.UI1:setName("UI1");
    obj.UI1:setVisible(false);
    obj.UI1:setEditable(true);
    obj.UI1:setLeft(564);
    obj.UI1:setTop(397);
    obj.UI1:setWidth(214);
    obj.UI1:setHeight(130);
    obj.UI1:setField("UI1");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.scrollBox1);
    obj.image12:setWidth(80);
    obj.image12:setField("UI2");
    obj.image12:setHeight(100);
    obj.image12:setLeft(284);
    obj.image12:setTop(455);
    obj.image12:setName("image12");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox1);
    obj.button11:setLeft(268);
    obj.button11:setTop(450);
    obj.button11:setText("Clique");
    obj.button11:setOpacity(0.0);
    obj.button11:setWidth(110);
    obj.button11:setHeight(110);
    obj.button11:setName("button11");

    obj.U2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.U2:setParent(obj.scrollBox1);
    obj.U2:setLeft(640);
    obj.U2:setName("U2");
    obj.U2:setVisible(false);
    obj.U2:setTop(44);
    obj.U2:setWidth(150);
    obj.U2:setHeight(22);
    obj.U2:setField("NomeUltima2");

    obj.UD2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UD2:setParent(obj.scrollBox1);
    obj.UD2:setLeft(610);
    obj.UD2:setName("UD2");
    obj.UD2:setVisible(false);
    obj.UD2:setTop(320);
    obj.UD2:setType("number");
    obj.UD2:setWidth(50);
    obj.UD2:setHeight(20);
    obj.UD2:setField("DanoUltima2");

    obj.UPM2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPM2:setParent(obj.scrollBox1);
    obj.UPM2:setLeft(720);
    obj.UPM2:setName("UPM2");
    obj.UPM2:setVisible(false);
    obj.UPM2:setTop(320);
    obj.UPM2:setType("number");
    obj.UPM2:setWidth(50);
    obj.UPM2:setHeight(20);
    obj.UPM2:setField("CuraUltima2");

    obj.UPA2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPA2:setParent(obj.scrollBox1);
    obj.UPA2:setLeft(830);
    obj.UPA2:setName("UPA2");
    obj.UPA2:setVisible(false);
    obj.UPA2:setTop(320);
    obj.UPA2:setType("number");
    obj.UPA2:setWidth(50);
    obj.UPA2:setHeight(20);
    obj.UPA2:setField("currentU2");

    obj.UPF2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPF2:setParent(obj.scrollBox1);
    obj.UPF2:setLeft(940);
    obj.UPF2:setName("UPF2");
    obj.UPF2:setVisible(false);
    obj.UPF2:setTop(320);
    obj.UPF2:setType("number");
    obj.UPF2:setWidth(50);
    obj.UPF2:setHeight(20);
    obj.UPF2:setField("DPTUltima2");

    obj.UINT2 = GUI.fromHandle(_obj_newObject("label"));
    obj.UINT2:setParent(obj.scrollBox1);
    obj.UINT2:setLeft(880);
    obj.UINT2:setName("UINT2");
    obj.UINT2:setVisible(false);
    obj.UINT2:setTop(413);
    obj.UINT2:setWidth(50);
    obj.UINT2:setHeight(20);
    obj.UINT2:setField("Uintensidade2");

    obj.ComboU2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.ComboU2:setParent(obj.scrollBox1);
    obj.ComboU2:setName("ComboU2");
    obj.ComboU2:setVisible(false);
    obj.ComboU2:setLeft(610);
    obj.ComboU2:setTop(350);
    obj.ComboU2:setWidth(120);
    obj.ComboU2:setHeight(20);
    obj.ComboU2:setField("DanoAtributoU1");
    obj.ComboU2:setItems({'Escolha', 'PA', 'PM', 'PF', 'Cura','Fixo', 'Dano P/ Turno' });

    obj.UT2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.UT2:setParent(obj.scrollBox1);
    obj.UT2:setLeft(565);
    obj.UT2:setName("UT2");
    obj.UT2:setTop(130);
    obj.UT2:setVisible(false);
    obj.UT2:setWidth(400);
    obj.UT2:setHeight(170);
    obj.UT2:setField("DescriUltima2");

    obj.UL2 = GUI.fromHandle(_obj_newObject("button"));
    obj.UL2:setParent(obj.scrollBox1);
    obj.UL2:setLeft(800);
    obj.UL2:setName("UL2");
    obj.UL2:setVisible(false);
    obj.UL2:setTop(40);
    obj.UL2:setFontSize(20);
    obj.UL2:setHeight(30);
    obj.UL2:setWidth(200);
    obj.UL2:setText("Segunda Ultimate");
    obj.UL2:setFontColor("White");


						
                    local function ExecutarU2() 
				
				   --[[ HABILIDADE DE DANO ]]--
					if sheet.DanoUltima2 > sheet.CuraUltima2 and sheet.DPTUltima2 then
												
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriUltima2);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.Uintensidade2 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local currentU2 = mesa.meuJogador:getBarValue(2);
																currentU2 = currentU2 - (tonumber(sheet.currentU2) or 0);
																mesa.meuJogador:requestSetBarValue(2, currentU2);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
								
					--[[ HABILIDADE DE CURA ]]--
					else if sheet.CuraUltima2 > sheet.DanoUltima2 and sheet.DPTUltima2 then
					 
					 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriUltima2);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.Uintensidade2 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local currentU2 = mesa.meuJogador:getBarValue(2);
																currentU2 = currentU2 - (tonumber(sheet.currentU2) or 0);
																mesa.meuJogador:requestSetBarValue(2, currentU2);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end); 
								
					--[[ HABILIDADE DE INTENSIDADE FIXA ]]--
					else if sheet.DPTUltima2 > sheet.DanoUltima2 and sheet.CuraUltima2 then
						 local mesaDoPersonagem = rrpg.getMesaDe(sheet); 
					
						sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)
									
                                        if sheet.AcertoMagico >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriUltima2);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com Intensidade de « " .. sheet.DPTUltima2 .. " »");
																local mesa = Firecast.getMesaDe(sheet); 
																local currentU2 = mesa.meuJogador:getBarValue(2);
																currentU2 = currentU2 - (tonumber(sheet.currentU2) or 0);
																mesa.meuJogador:requestSetBarValue(2, currentU2);

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
                                        end;                                        

                                end);  
					
					end;
					end;
					end;
					
                end;      
							
        


    obj.UI2 = GUI.fromHandle(_obj_newObject("image"));
    obj.UI2:setParent(obj.scrollBox1);
    obj.UI2:setName("UI2");
    obj.UI2:setVisible(false);
    obj.UI2:setEditable(true);
    obj.UI2:setLeft(564);
    obj.UI2:setTop(397);
    obj.UI2:setWidth(214);
    obj.UI2:setHeight(130);
    obj.UI2:setField("UI2");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.DanoAtributo1 == 'PA' then
                                   sheet.Hintensidade1 = (tonumber(sheet.DanoHabilidade1) or 0) + (tonumber(sheet.CuraHabilidade1) or 0) + (tonumber(sheet.PA) or 0)
            					   end;
            					if sheet.DanoAtributo2 == 'PA' then
            					   sheet.Hintensidade2 = (tonumber(sheet.DanoHabilidade2) or 0) + (tonumber(sheet.CuraHabilidade2) or 0) + (tonumber(sheet.PA) or 0)
            					   end;
            					if sheet.DanoAtributo3 == 'PA' then   
            					   sheet.Hintensidade3 = (tonumber(sheet.DanoHabilidade3) or 0) + (tonumber(sheet.CuraHabilidade3) or 0) + (tonumber(sheet.PA) or 0)
            					   end;
            					if sheet.DanoAtributo4 == 'PA' then
            					   sheet.Hintensidade4 = (tonumber(sheet.DanoHabilidade4) or 0) + (tonumber(sheet.CuraHabilidade4) or 0) + (tonumber(sheet.PA) or 0)
            					   end;
            					if sheet.DanoAtributo5 == 'PA' then
            					   sheet.Hintensidade5 = (tonumber(sheet.DanoHabilidade5) or 0) + (tonumber(sheet.CuraHabilidade5) or 0) + (tonumber(sheet.PA) or 0)
            					   end;
            					if sheet.DanoAtributo6 == 'PA' then
            					   sheet.Hintensidade6 = (tonumber(sheet.DanoHabilidade6) or 0) + (tonumber(sheet.CuraHabilidade6) or 0) + (tonumber(sheet.PA) or 0)
            					   end;
            					if sheet.DanoAtributo7 == 'PA' then
            					   sheet.Hintensidade7 = (tonumber(sheet.DanoHabilidade7) or 0) + (tonumber(sheet.CuraHabilidade7) or 0) + (tonumber(sheet.PA) or 0)
            					   end;
            					if sheet.DanoAtributo8 == 'PA' then
            					   sheet.Hintensidade8 = (tonumber(sheet.DanoHabilidade8) or 0) + (tonumber(sheet.CuraHabilidade8) or 0) + (tonumber(sheet.PA) or 0)
            					   end;
            					if sheet.DanoAtributo9 == 'PA' then
            					   sheet.Hintensidade9 = (tonumber(sheet.DanoHabilidade9) or 0) + (tonumber(sheet.CuraHabilidade9) or 0) + (tonumber(sheet.PA) or 0)
            					   end;
            					if sheet.DanoAtributoU1 == 'PA' then
            					   sheet.Uintensidade1 = (tonumber(sheet.DanoUltima1) or 0) + (tonumber(sheet.CuraUltima1) or 0) + (tonumber(sheet.PA) or 0)
            					   end;
            					if sheet.DanoAtributoU2 == 'PA' then
            					   sheet.Uintensidade2 = (tonumber(sheet.DanoUltima2) or 0) + (tonumber(sheet.CuraUltima2) or 0) + (tonumber(sheet.PA) or 0)
            					   end;					   
            					
            					if sheet.DanoAtributo1 == 'PM' then
                                   sheet.Hintensidade1 = (tonumber(sheet.DanoHabilidade1) or 0) + (tonumber(sheet.CuraHabilidade1) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo2 == 'PM' then
            					   sheet.Hintensidade2 = (tonumber(sheet.DanoHabilidade2) or 0) + (tonumber(sheet.CuraHabilidade2) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo3 == 'PM' then
            					   sheet.Hintensidade3 = (tonumber(sheet.DanoHabilidade3) or 0) + (tonumber(sheet.CuraHabilidade3) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo4 == 'PM' then
            					   sheet.Hintensidade4 = (tonumber(sheet.DanoHabilidade4) or 0) + (tonumber(sheet.CuraHabilidade4) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo5 == 'PM' then
            					   sheet.Hintensidade5 = (tonumber(sheet.DanoHabilidade5) or 0) + (tonumber(sheet.CuraHabilidade5) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo6 == 'PM' then
            					   sheet.Hintensidade6 = (tonumber(sheet.DanoHabilidade6) or 0) + (tonumber(sheet.CuraHabilidade6) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo7 == 'PM' then
            					   sheet.Hintensidade7 = (tonumber(sheet.DanoHabilidade7) or 0) + (tonumber(sheet.CuraHabilidade7) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            				    if sheet.DanoAtributo8 == 'PM' then
            					   sheet.Hintensidade8 = (tonumber(sheet.DanoHabilidade8) or 0) + (tonumber(sheet.CuraHabilidade8) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo9 == 'PM' then
            					   sheet.Hintensidade9 = (tonumber(sheet.DanoHabilidade9) or 0) + (tonumber(sheet.CuraHabilidade9) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributoU1 == 'PM' then
            					   sheet.UintensidadeU1 = (tonumber(sheet.DanoUltima1) or 0) + (tonumber(sheet.CuraUltima1) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributoU2 == 'PM' then
            					   sheet.UintensidadeU2 = (tonumber(sheet.DanoUltima2) or 0) + (tonumber(sheet.CuraUltima2) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					
            					if sheet.DanoAtributo1 == 'PF' then
                                   sheet.Hintensidade1 = (tonumber(sheet.DanoHabilidade1) or 0) + (tonumber(sheet.CuraHabilidade1) or 0) + (tonumber(sheet.PF) or 0)
            					   end;
            					if sheet.DanoAtributo2 == 'PF' then
            					   sheet.Hintensidade2 = (tonumber(sheet.DanoHabilidade2) or 0) + (tonumber(sheet.CuraHabilidade2) or 0) + (tonumber(sheet.PF) or 0)
            					   end;
            					if sheet.DanoAtributo3 == 'PF' then
            					sheet.Hintensidade3 = (tonumber(sheet.DanoHabilidade3) or 0) + (tonumber(sheet.CuraHabilidade3) or 0) + (tonumber(sheet.PF) or 0)
            					   end;
            					if sheet.DanoAtributo4 == 'PF' then
            					sheet.Hintensidade4 = (tonumber(sheet.DanoHabilidade4) or 0) + (tonumber(sheet.CuraHabilidade4) or 0) + (tonumber(sheet.PF) or 0)
            					   end;	
            					if sheet.DanoAtributo5 == 'PF' then
            					   sheet.Hintensidade5 = (tonumber(sheet.DanoHabilidade5) or 0) + (tonumber(sheet.CuraHabilidade5) or 0) + (tonumber(sheet.PF) or 0)
            					   end;
            					if sheet.DanoAtributo6 == 'PF' then
            					   sheet.Hintensidade6 = (tonumber(sheet.DanoHabilidade6) or 0) + (tonumber(sheet.CuraHabilidade6) or 0) + (tonumber(sheet.PF) or 0)
            					   end;
            					if sheet.DanoAtributo7 == 'PF' then
            					   sheet.Hintensidade7 = (tonumber(sheet.DanoHabilidade7) or 0) + (tonumber(sheet.CuraHabilidade7) or 0) + (tonumber(sheet.PF) or 0)
            					   end;
            					if sheet.DanoAtributo8 == 'PF' then
            					   sheet.Hintensidade8 = (tonumber(sheet.DanoHabilidade8) or 0) + (tonumber(sheet.CuraHabilidade8) or 0) + (tonumber(sheet.PF) or 0)
            					   end;
            					if sheet.DanoAtributo9 == 'PF' then
            					   sheet.Hintensidade9 = (tonumber(sheet.DanoHabilidade9) or 0) + (tonumber(sheet.CuraHabilidade9) or 0) + (tonumber(sheet.PF) or 0)
            					   end;
            					if sheet.DanoAtributoU1 == 'PF' then
            					   sheet.UintensidadeU1 = (tonumber(sheet.DanoUltima1) or 0) + (tonumber(sheet.CuraUltima1) or 0) + (tonumber(sheet.PF) or 0)
            					   end;
            					if sheet.DanoAtributoU2 == 'PF' then
            					   sheet.UintensidadeU2 = (tonumber(sheet.DanoUltima2) or 0) + (tonumber(sheet.CuraUltima2) or 0) + (tonumber(sheet.PF) or 0)				
            					end;	
            
            					if sheet.DanoAtributo1 == 'Cura' then
                                   sheet.Hintensidade1 = (tonumber(sheet.DanoHabilidade1) or 0) + (tonumber(sheet.CuraHabilidade1) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo2 == 'Cura' then
            					   sheet.Hintensidade2 = (tonumber(sheet.DanoHabilidade2) or 0) + (tonumber(sheet.CuraHabilidade2) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo3 == 'Cura' then
            					   sheet.Hintensidade3 = (tonumber(sheet.DanoHabilidade3) or 0) + (tonumber(sheet.CuraHabilidade3) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo4 == 'Cura' then
            					   sheet.Hintensidade4 = (tonumber(sheet.DanoHabilidade4) or 0) + (tonumber(sheet.CuraHabilidade4) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo5 == 'Cura' then
            					   sheet.Hintensidade5 = (tonumber(sheet.DanoHabilidade5) or 0) + (tonumber(sheet.CuraHabilidade5) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo6 == 'Cura' then
            					   sheet.Hintensidade6 = (tonumber(sheet.DanoHabilidade6) or 0) + (tonumber(sheet.CuraHabilidade6) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo7 == 'Cura' then
            					   sheet.Hintensidade7 = (tonumber(sheet.DanoHabilidade7) or 0) + (tonumber(sheet.CuraHabilidade7) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            				    if sheet.DanoAtributo8 == 'Cura' then
            					   sheet.Hintensidade8 = (tonumber(sheet.DanoHabilidade8) or 0) + (tonumber(sheet.CuraHabilidade8) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributo9 == 'Cura' then
            					   sheet.Hintensidade9 = (tonumber(sheet.DanoHabilidade9) or 0) + (tonumber(sheet.CuraHabilidade9) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributoU1 == 'Cura' then
            					   sheet.UintensidadeU1 = (tonumber(sheet.DanoUltima1) or 0) + (tonumber(sheet.CuraUltima1) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					if sheet.DanoAtributoU2 == 'Cura' then
            					   sheet.UintensidadeU2 = (tonumber(sheet.DanoUltima2) or 0) + (tonumber(sheet.CuraUltima2) or 0) + (tonumber(sheet.PM) or 0)
            					end;
            					
            					if sheet.DanoAtributo1 == 'Fixo' then
                                   sheet.Hintensidade1 = (tonumber(sheet.DPTHabilidade1) or 0)
            					end;
            					if sheet.DanoAtributo2 == 'Fixo' then
            					   sheet.Hintensidade2 = (tonumber(sheet.DPTHabilidade2) or 0)
            					end;
            					if sheet.DanoAtributo3 == 'Fixo' then
            					   sheet.Hintensidade3 = (tonumber(sheet.DPTHabilidade3) or 0)
            					end;
            					if sheet.DanoAtributo4 == 'Fixo' then
            					   sheet.Hintensidade4 = (tonumber(sheet.DPTHabilidade4) or 0)
            					end;
            					if sheet.DanoAtributo5 == 'Fixo' then
            					   sheet.Hintensidade5 = (tonumber(sheet.DPTHabilidade5) or 0)
            					end;
            					if sheet.DanoAtributo6 == 'Fixo' then
            					   sheet.Hintensidade6 = (tonumber(sheet.DPTHabilidade6) or 0)
            					end;
            					if sheet.DanoAtributo7 == 'Fixo' then
            					   sheet.Hintensidade7 = (tonumber(sheet.DPTHabilidade7) or 0)
            					end;
            				    if sheet.DanoAtributo8 == 'Fixo' then
            					   sheet.Hintensidade8 = (tonumber(sheet.DPTHabilidade8) or 0)
            					end;
            					if sheet.DanoAtributo9 == 'Fixo' then
            					   sheet.Hintensidade9 = (tonumber(sheet.DPTHabilidade9) or 0)
            					end;
            					if sheet.DanoAtributoU1 == 'Fixo' then
            					   sheet.UintensidadeU1 = (tonumber(sheet.DPTHabilidadeU1) or 0)
            					end;
            					if sheet.DanoAtributoU2 == 'Fixo' then
            					   sheet.UintensidadeU2 = (tonumber(sheet.DPTHabilidadeU2) or 0)
            					end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            self.H1.visible = not self.H1.visible;
            			  self.HL1.visible = not self.HL1.visible;
            				self.HT1.visible = not self.HT1.visible;
            				self.HD1.visible = not self.HD1.visible;
            				self.HPM1.visible = not self.HPM1.visible;
            				self.HPA1.visible = not self.HPA1.visible;
            				self.HPF1.visible = not self.HPF1.visible;
            				self.HI1.visible = not self.HI1.visible;
            				self.HINT1.visible = not self.HINT1.visible;			
            				self.Combo1.visible = not self.Combo1.visible;	
            
            				self.HI2.visible = false;
            				self.HI3.visible = false;
            				self.HI4.visible = false;
            				self.HI5.visible = false;
            				self.HI6.visible = false;
            				self.HI7.visible = false;
            				self.HI8.visible = false;
            				self.HI9.visible = false;
            				self.UI1.visible = false;
            				self.UI2.visible = false;
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HINT2.visible = false;
            				self.Combo2.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HINT3.visible = false;				
            				self.Combo3.visible = false;
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HINT4.visible = false;
            				self.Combo4.visible = false;
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HINT5.visible = false;
            				self.Combo5.visible = false;
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HINT6.visible = false;
            				self.Combo6.visible = false;
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HINT7.visible = false;
            				self.Combo7.visible = false;
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HINT8.visible = false;
            				self.Combo8.visible = false;
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HINT9.visible = false;
            				self.Combo9.visible = false;
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UINT1.visible = false;
            				self.ComboU1.visible = false;
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UINT2.visible = false;
            				self.ComboU2.visible = false;
        end, obj);

    obj._e_event2 = obj.HL1:addEventListener("onClick",
        function (_)
            ExecutarH1()
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            self.H2.visible = not self.H2.visible;
            				self.HL2.visible = not self.HL2.visible;
            				self.HT2.visible = not self.HT2.visible;
            				self.HD2.visible = not self.HD2.visible;
            				self.HPM2.visible = not self.HPM2.visible;
            				self.HPA2.visible = not self.HPA2.visible;
            				self.HPF2.visible = not self.HPF2.visible;
            				self.HI2.visible = not self.HI2.visible;
            				self.HINT2.visible = not self.HINT2.visible;
            				self.Combo2.visible = not self.Combo2.visible;	
            				
            				self.HI1.visible = false;
            				self.HI3.visible = false;
            				self.HI4.visible = false;
            				self.HI5.visible = false;
            				self.HI6.visible = false;
            				self.HI7.visible = false;
            				self.HI8.visible = false;
            				self.HI9.visible = false;
            				self.UI1.visible = false;
            				self.UI2.visible = false;
            								
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HINT1.visible = false;
            				self.Combo1.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HINT3.visible = false;
            				self.Combo3.visible = false;				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HINT4.visible = false;
            				self.Combo4.visible = false;
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HINT5.visible = false;
            				self.Combo5.visible = false;
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HINT6.visible = false;
            				self.Combo6.visible = false;
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HINT7.visible = false;
            				self.Combo7.visible = false;
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HINT8.visible = false;
            				self.Combo8.visible = false;
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HINT9.visible = false;
            				self.Combo9.visible = false;
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UINT1.visible = false;
            				self.ComboU1.visible = false;
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UINT2.visible = false;
            				self.ComboU2.visible = false;
        end, obj);

    obj._e_event4 = obj.HL2:addEventListener("onClick",
        function (_)
            ExecutarH2()
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            self.H3.visible = not self.H3.visible;
            				self.HL3.visible = not self.HL3.visible;
            				self.HT3.visible = not self.HT3.visible;
            				self.HD3.visible = not self.HD3.visible;
            				self.HPM3.visible = not self.HPM3.visible;
            				self.HPA3.visible = not self.HPA3.visible;
            				self.HPF3.visible = not self.HPF3.visible;
            				self.HI3.visible = not self.HI3.visible;
            				self.HINT3.visible = not self.HINT3.visible;
            				self.Combo3.visible = not self.Combo3.visible;	
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HINT1.visible = false;
            				self.Combo1.visible = false;
            				
            				self.HI2.visible = false;
            				self.HI1.visible = false;
            				self.HI4.visible = false;
            				self.HI5.visible = false;
            				self.HI6.visible = false;
            				self.HI7.visible = false;
            				self.HI8.visible = false;
            				self.HI9.visible = false;
            				self.UI1.visible = false;
            				self.UI2.visible = false;
            				
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HINT2.visible = false;
            				self.Combo2.visible = false;
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HINT4.visible = false;
            				self.Combo4.visible = false;
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HINT5.visible = false;
            				self.Combo5.visible = false;
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HINT6.visible = false;
            				self.Combo6.visible = false;
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HINT7.visible = false;
            				self.Combo7.visible = false;
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HINT8.visible = false;
            				self.Combo8.visible = false;
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HINT9.visible = false;
            				self.Combo9.visible = false;
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UINT1.visible = false;
            				self.ComboU1.visible = false;
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UINT2.visible = false;
            				self.ComboU2.visible = false;
        end, obj);

    obj._e_event6 = obj.HL3:addEventListener("onClick",
        function (_)
            ExecutarH3()
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (_)
            self.H4.visible = not self.H4.visible;
            				self.HL4.visible = not self.HL4.visible;
            				self.HT4.visible = not self.HT4.visible;
            				self.HD4.visible = not self.HD4.visible;
            				self.HPM4.visible = not self.HPM4.visible;
            				self.HPA4.visible = not self.HPA4.visible;
            				self.HPF4.visible = not self.HPF4.visible;
            				self.HI4.visible = not self.HI4.visible;
            				self.HINT4.visible = not self.HINT4.visible;
            				self.Combo4.visible = not self.Combo4.visible;	
            								
            				self.HI2.visible = false;
            				self.HI3.visible = false;
            				self.HI1.visible = false;
            				self.HI5.visible = false;
            				self.HI6.visible = false;
            				self.HI7.visible = false;
            				self.HI8.visible = false;
            				self.HI9.visible = false;
            				self.UI1.visible = false;
            				self.UI2.visible = false;
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HINT1.visible = false;
            				self.Combo1.visible = false;
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HINT2.visible = false;
            				self.Combo2.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HINT3.visible = false;				
            				self.Combo3.visible = false;
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HINT5.visible = false;
            				self.Combo5.visible = false;
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HINT6.visible = false;
            				self.Combo6.visible = false;
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HINT7.visible = false;
            				self.Combo7.visible = false;
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HINT8.visible = false;
            				self.Combo8.visible = false;
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HINT9.visible = false;
            				self.Combo9.visible = false;
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UINT1.visible = false;
            				self.ComboU1.visible = false;
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UINT2.visible = false;
            				self.ComboU2.visible = false;
        end, obj);

    obj._e_event8 = obj.HL4:addEventListener("onClick",
        function (_)
            ExecutarH4()
        end, obj);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (_)
            self.H5.visible = not self.H5.visible;
            				self.HL5.visible = not self.HL5.visible;
            				self.HT5.visible = not self.HT5.visible;
            				self.HD5.visible = not self.HD5.visible;
            				self.HPM5.visible = not self.HPM5.visible;
            				self.HPA5.visible = not self.HPA5.visible;
            				self.HPF5.visible = not self.HPF5.visible;
            				self.HI5.visible = not self.HI5.visible;
            				self.HINT5.visible = not self.HINT5.visible;
            				self.Combo5.visible = not self.Combo5.visible;	
            				
            				self.HI2.visible = false;
            				self.HI3.visible = false;
            				self.HI4.visible = false;
            				self.HI1.visible = false;
            				self.HI6.visible = false;
            				self.HI7.visible = false;
            				self.HI8.visible = false;
            				self.HI9.visible = false;
            				self.UI1.visible = false;
            				self.UI2.visible = false;
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HINT1.visible = false;
            				self.Combo1.visible = false;
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HINT2.visible = false;
            				self.Combo2.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HINT3.visible = false;		
            				self.Combo3.visible = false;
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HINT4.visible = false;
            				self.Combo4.visible = false;
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HINT6.visible = false;
            				self.Combo6.visible = false;
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HINT7.visible = false;
            				self.Combo7.visible = false;
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HINT8.visible = false;
            				self.Combo8.visible = false;
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HINT9.visible = false;
            				self.Combo9.visible = false;
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UINT1.visible = false;
            				self.ComboU1.visible = false;
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UINT2.visible = false;
            				self.ComboU2.visible = false;
        end, obj);

    obj._e_event10 = obj.HL5:addEventListener("onClick",
        function (_)
            ExecutarH5()
        end, obj);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (_)
            self.H6.visible = not self.H6.visible;
            				self.HL6.visible = not self.HL6.visible;
            				self.HT6.visible = not self.HT6.visible;
            				self.HD6.visible = not self.HD6.visible;
            				self.HPM6.visible = not self.HPM6.visible;
            				self.HPA6.visible = not self.HPA6.visible;
            				self.HPF6.visible = not self.HPF6.visible;
            				self.HI6.visible = not self.HI6.visible;
            				self.HINT6.visible = not self.HINT6.visible;
            				self.Combo6.visible = not self.Combo6.visible;	
            				
            				self.HI2.visible = false;
            				self.HI3.visible = false;
            				self.HI4.visible = false;
            				self.HI5.visible = false;
            				self.HI1.visible = false;
            				self.HI7.visible = false;
            				self.HI8.visible = false;
            				self.HI9.visible = false;
            				self.UI1.visible = false;
            				self.UI2.visible = false;
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HINT1.visible = false;
            				self.Combo1.visible = false;
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HINT2.visible = false;
            				self.Combo2.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HINT3.visible = false;				
            				self.Combo3.visible = false;
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HINT4.visible = false;
            				self.Combo4.visible = false;
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HINT5.visible = false;
            				self.Combo5.visible = false;
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HINT7.visible = false;
            				self.Combo7.visible = false;
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HINT8.visible = false;
            				self.Combo8.visible = false;
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HINT9.visible = false;
            				self.Combo9.visible = false;
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UINT1.visible = false;
            				self.ComboU1.visible = false;
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UINT2.visible = false;
            				self.ComboU2.visible = false;
        end, obj);

    obj._e_event12 = obj.HL6:addEventListener("onClick",
        function (_)
            ExecutarH6()
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (_)
            self.H7.visible = not self.H7.visible;
            				self.HL7.visible = not self.HL7.visible;
            				self.HT7.visible = not self.HT7.visible;
            				self.HD7.visible = not self.HD7.visible;
            				self.HPM7.visible = not self.HPM7.visible;
            				self.HPA7.visible = not self.HPA7.visible;
            				self.HPF7.visible = not self.HPF7.visible;
            				self.HI7.visible = not self.HI7.visible;
            				self.HINT7.visible = not self.HINT7.visible;
            				self.Combo7.visible = not self.Combo7.visible;	
            				
            				self.HI2.visible = false;
            				self.HI3.visible = false;
            				self.HI4.visible = false;
            				self.HI5.visible = false;
            				self.HI6.visible = false;
            				self.HI1.visible = false;
            				self.HI8.visible = false;
            				self.HI9.visible = false;
            				self.UI1.visible = false;
            				self.UI2.visible = false;
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HINT1.visible = false;
            				self.Combo1.visible = false;
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HINT2.visible = false;
            				self.Combo2.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HINT3.visible = false;				
            				self.Combo3.visible = false;
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HINT4.visible = false;
            				self.Combo4.visible = false;
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HINT5.visible = false;
            				self.Combo5.visible = false;
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HINT6.visible = false;
            				self.Combo6.visible = false;
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HINT8.visible = false;
            				self.Combo8.visible = false;
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HINT9.visible = false;
            				self.Combo9.visible = false;
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UINT1.visible = false;
            				self.ComboU1.visible = false;
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UINT2.visible = false;
            				self.ComboU2.visible = false;
        end, obj);

    obj._e_event14 = obj.HL7:addEventListener("onClick",
        function (_)
            ExecutarH7()
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (_)
            self.H8.visible = not self.H8.visible;
            				self.HL8.visible = not self.HL8.visible;
            				self.HT8.visible = not self.HT8.visible;
            				self.HD8.visible = not self.HD8.visible;
            				self.HPM8.visible = not self.HPM8.visible;
            				self.HPA8.visible = not self.HPA8.visible;
            				self.HPF8.visible = not self.HPF8.visible
            				self.HI8.visible = not self.HI8.visible;
            				self.HINT8.visible = not self.HINT8.visible;
            				self.Combo8.visible = not self.Combo8.visible;	
            				
            				self.HI2.visible = false;
            				self.HI3.visible = false;
            				self.HI4.visible = false;
            				self.HI5.visible = false;
            				self.HI6.visible = false;
            				self.HI7.visible = false;
            				self.HI1.visible = false;
            				self.HI9.visible = false;
            				self.UI1.visible = false;
            				self.UI2.visible = false;
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HINT1.visible = false;
            				self.Combo1.visible = false;
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HINT2.visible = false;
            				self.Combo2.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HINT3.visible = false;				
            				self.Combo3.visible = false;
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HINT4.visible = false;
            				self.Combo4.visible = false;
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HINT5.visible = false;
            				self.Combo5.visible = false;
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HINT6.visible = false;
            				self.Combo6.visible = false;
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HINT7.visible = false;
            				self.Combo7.visible = false;
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HINT9.visible = false;
            				self.Combo9.visible = false;
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UINT1.visible = false;
            				self.ComboU1.visible = false;
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UINT2.visible = false;
            				self.ComboU2.visible = false;
        end, obj);

    obj._e_event16 = obj.HL8:addEventListener("onClick",
        function (_)
            ExecutarH8()
        end, obj);

    obj._e_event17 = obj.button9:addEventListener("onClick",
        function (_)
            self.H9.visible = not self.H9.visible;
            				self.HL9.visible = not self.HL9.visible;
            				self.HT9.visible = not self.HT9.visible;
            				self.HD9.visible = not self.HD9.visible;
            				self.HPM9.visible = not self.HPM9.visible;
            				self.HPA9.visible = not self.HPA9.visible;
            				self.HPF9.visible = not self.HPF9.visible;
            				self.HI9.visible = not self.HI9.visible;
            				self.HINT9.visible = not self.HINT9.visible;
            				self.Combo9.visible = not self.Combo9.visible;	
            				
            				self.HI2.visible = false;
            				self.HI3.visible = false;
            				self.HI4.visible = false;
            				self.HI5.visible = false;
            				self.HI6.visible = false;
            				self.HI7.visible = false;
            				self.HI8.visible = false;
            				self.HI1.visible = false;
            				self.UI1.visible = false;
            				self.UI2.visible = false;
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HINT1.visible = false;
            				self.Combo1.visible = false;
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HINT2.visible = false;
            				self.Combo2.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HINT3.visible = false;
            				self.Combo3.visible = false;
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HINT4.visible = false;
            				self.Combo4.visible = false;
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HINT5.visible = false;
            				self.Combo5.visible = false;
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HINT6.visible = false;
            				self.Combo6.visible = false;
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HINT7.visible = false;
            				self.Combo7.visible = false;
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HINT8.visible = false;
            				self.Combo8.visible = false;
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UINT1.visible = false;
            				self.ComboU1.visible = false;
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UINT2.visible = false;
            				self.ComboU2.visible = false;
        end, obj);

    obj._e_event18 = obj.HL9:addEventListener("onClick",
        function (_)
            ExecutarH9()
        end, obj);

    obj._e_event19 = obj.button10:addEventListener("onClick",
        function (_)
            self.U1.visible = not self.U1.visible;
            				self.UL1.visible = not self.UL1.visible;
            				self.UT1.visible = not self.UT1.visible;
            				self.UD1.visible = not self.UD1.visible;
            				self.UPM1.visible = not self.UPM1.visible;
            				self.UPA1.visible = not self.UPA1.visible;
            				self.UPF1.visible = not self.UPF1.visible;
            				self.UI1.visible = not self.UI1.visible;
            				self.UINT1.visible = not self.UINT1.visible;
            				self.ComboU1.visible = not self.ComboU1.visible;	
            				
            				self.HI2.visible = false;
            				self.HI3.visible = false;
            				self.HI4.visible = false;
            				self.HI5.visible = false;
            				self.HI6.visible = false;
            				self.HI7.visible = false;
            				self.HI8.visible = false;
            				self.HI9.visible = false;
            				self.HI1.visible = false;
            				self.UI2.visible = false;
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HINT1.visible = false;
            				self.Combo1.visible = false;
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HINT2.visible = false;
            				self.Combo2.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HINT3.visible = false;				
            				self.Combo3.visible = false;
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HINT4.visible = false;
            				self.Combo4.visible = false;
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HINT5.visible = false;
            				self.Combo5.visible = false;
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HINT6.visible = false;
            				self.Combo6.visible = false;
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HINT7.visible = false;
            				self.Combo7.visible = false;
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HINT8.visible = false;
            				self.Combo8.visible = false;
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HINT9.visible = false;
            				self.Combo9.visible = false;
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UINT2.visible = false;
            				self.ComboU2.visible = false;
        end, obj);

    obj._e_event20 = obj.UL1:addEventListener("onClick",
        function (_)
            ExecutarU1()
        end, obj);

    obj._e_event21 = obj.button11:addEventListener("onClick",
        function (_)
            self.U2.visible = not self.U2.visible;
            				self.UL2.visible = not self.UL2.visible;
            				self.UT2.visible = not self.UT2.visible;
            				self.UD2.visible = not self.UD2.visible;
            				self.UPM2.visible = not self.UPM2.visible;
            				self.UPA2.visible = not self.UPA2.visible;
            				self.UPF2.visible = not self.UPF2.visible;
            				self.UI2.visible = not self.UI2.visible;
            				self.UINT2.visible = not self.UINT2.visible;
            				self.ComboU2.visible = not self.ComboU2.visible;	
            				
            				self.HI2.visible = false;
            				self.HI3.visible = false;
            				self.HI4.visible = false;
            				self.HI5.visible = false;
            				self.HI6.visible = false;
            				self.HI7.visible = false;
            				self.HI8.visible = false;
            				self.HI9.visible = false;
            				self.UI1.visible = false;
            				self.HI1.visible = false;
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HINT1.visible = false;
            				self.Combo1.visible = false;
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HINT2.visible = false;
            				self.Combo2.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HINT3.visible = false;
            				self.Combo3.visible = false;				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HINT4.visible = false;
            				self.Combo4.visible = false;
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HINT5.visible = false;
            				self.Combo5.visible = false;
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HINT6.visible = false;
            				self.Combo6.visible = false;
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HINT7.visible = false;
            				self.Combo7.visible = false;
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HINT8.visible = false;
            				self.Combo8.visible = false;
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HINT9.visible = false;
            				self.Combo9.visible = false;
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UINT1.visible = false;
            				self.ComboU1.visible = false;
        end, obj);

    obj._e_event22 = obj.UL2:addEventListener("onClick",
        function (_)
            ExecutarU2()
        end, obj);

    function obj:_releaseEvents()
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

        if self.HD7 ~= nil then self.HD7:destroy(); self.HD7 = nil; end;
        if self.HI3 ~= nil then self.HI3:destroy(); self.HI3 = nil; end;
        if self.UI2 ~= nil then self.UI2:destroy(); self.UI2 = nil; end;
        if self.HL8 ~= nil then self.HL8:destroy(); self.HL8 = nil; end;
        if self.UD2 ~= nil then self.UD2:destroy(); self.UD2 = nil; end;
        if self.UT2 ~= nil then self.UT2:destroy(); self.UT2 = nil; end;
        if self.Combo1 ~= nil then self.Combo1:destroy(); self.Combo1 = nil; end;
        if self.HT9 ~= nil then self.HT9:destroy(); self.HT9 = nil; end;
        if self.Combo4 ~= nil then self.Combo4:destroy(); self.Combo4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.HPF6 ~= nil then self.HPF6:destroy(); self.HPF6 = nil; end;
        if self.UT1 ~= nil then self.UT1:destroy(); self.UT1 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.HPF4 ~= nil then self.HPF4:destroy(); self.HPF4 = nil; end;
        if self.HD5 ~= nil then self.HD5:destroy(); self.HD5 = nil; end;
        if self.UI1 ~= nil then self.UI1:destroy(); self.UI1 = nil; end;
        if self.HPM2 ~= nil then self.HPM2:destroy(); self.HPM2 = nil; end;
        if self.UPM2 ~= nil then self.UPM2:destroy(); self.UPM2 = nil; end;
        if self.HL6 ~= nil then self.HL6:destroy(); self.HL6 = nil; end;
        if self.U1 ~= nil then self.U1:destroy(); self.U1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.Combo9 ~= nil then self.Combo9:destroy(); self.Combo9 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.H7 ~= nil then self.H7:destroy(); self.H7 = nil; end;
        if self.HD2 ~= nil then self.HD2:destroy(); self.HD2 = nil; end;
        if self.H6 ~= nil then self.H6:destroy(); self.H6 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.UPF1 ~= nil then self.UPF1:destroy(); self.UPF1 = nil; end;
        if self.HD1 ~= nil then self.HD1:destroy(); self.HD1 = nil; end;
        if self.HPF1 ~= nil then self.HPF1:destroy(); self.HPF1 = nil; end;
        if self.HPM5 ~= nil then self.HPM5:destroy(); self.HPM5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.Combo7 ~= nil then self.Combo7:destroy(); self.Combo7 = nil; end;
        if self.HT4 ~= nil then self.HT4:destroy(); self.HT4 = nil; end;
        if self.HL4 ~= nil then self.HL4:destroy(); self.HL4 = nil; end;
        if self.HPM4 ~= nil then self.HPM4:destroy(); self.HPM4 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.H4 ~= nil then self.H4:destroy(); self.H4 = nil; end;
        if self.HI1 ~= nil then self.HI1:destroy(); self.HI1 = nil; end;
        if self.HD6 ~= nil then self.HD6:destroy(); self.HD6 = nil; end;
        if self.UD1 ~= nil then self.UD1:destroy(); self.UD1 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.UPA2 ~= nil then self.UPA2:destroy(); self.UPA2 = nil; end;
        if self.Combo8 ~= nil then self.Combo8:destroy(); self.Combo8 = nil; end;
        if self.HINT4 ~= nil then self.HINT4:destroy(); self.HINT4 = nil; end;
        if self.HPM1 ~= nil then self.HPM1:destroy(); self.HPM1 = nil; end;
        if self.HD8 ~= nil then self.HD8:destroy(); self.HD8 = nil; end;
        if self.HPF9 ~= nil then self.HPF9:destroy(); self.HPF9 = nil; end;
        if self.HI9 ~= nil then self.HI9:destroy(); self.HI9 = nil; end;
        if self.HPA3 ~= nil then self.HPA3:destroy(); self.HPA3 = nil; end;
        if self.HD4 ~= nil then self.HD4:destroy(); self.HD4 = nil; end;
        if self.H9 ~= nil then self.H9:destroy(); self.H9 = nil; end;
        if self.HINT1 ~= nil then self.HINT1:destroy(); self.HINT1 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.H5 ~= nil then self.H5:destroy(); self.H5 = nil; end;
        if self.Combo2 ~= nil then self.Combo2:destroy(); self.Combo2 = nil; end;
        if self.HPM7 ~= nil then self.HPM7:destroy(); self.HPM7 = nil; end;
        if self.UINT2 ~= nil then self.UINT2:destroy(); self.UINT2 = nil; end;
        if self.UPA1 ~= nil then self.UPA1:destroy(); self.UPA1 = nil; end;
        if self.HT3 ~= nil then self.HT3:destroy(); self.HT3 = nil; end;
        if self.HI5 ~= nil then self.HI5:destroy(); self.HI5 = nil; end;
        if self.HT2 ~= nil then self.HT2:destroy(); self.HT2 = nil; end;
        if self.UPF2 ~= nil then self.UPF2:destroy(); self.UPF2 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.UL2 ~= nil then self.UL2:destroy(); self.UL2 = nil; end;
        if self.HL5 ~= nil then self.HL5:destroy(); self.HL5 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.HPF3 ~= nil then self.HPF3:destroy(); self.HPF3 = nil; end;
        if self.HT1 ~= nil then self.HT1:destroy(); self.HT1 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.HPF8 ~= nil then self.HPF8:destroy(); self.HPF8 = nil; end;
        if self.HINT8 ~= nil then self.HINT8:destroy(); self.HINT8 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.H1 ~= nil then self.H1:destroy(); self.H1 = nil; end;
        if self.H2 ~= nil then self.H2:destroy(); self.H2 = nil; end;
        if self.H8 ~= nil then self.H8:destroy(); self.H8 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.H3 ~= nil then self.H3:destroy(); self.H3 = nil; end;
        if self.HINT5 ~= nil then self.HINT5:destroy(); self.HINT5 = nil; end;
        if self.HPA4 ~= nil then self.HPA4:destroy(); self.HPA4 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.HPA6 ~= nil then self.HPA6:destroy(); self.HPA6 = nil; end;
        if self.HPA8 ~= nil then self.HPA8:destroy(); self.HPA8 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.HPA2 ~= nil then self.HPA2:destroy(); self.HPA2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.HT5 ~= nil then self.HT5:destroy(); self.HT5 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.HPF2 ~= nil then self.HPF2:destroy(); self.HPF2 = nil; end;
        if self.HT6 ~= nil then self.HT6:destroy(); self.HT6 = nil; end;
        if self.Combo3 ~= nil then self.Combo3:destroy(); self.Combo3 = nil; end;
        if self.HI2 ~= nil then self.HI2:destroy(); self.HI2 = nil; end;
        if self.HINT7 ~= nil then self.HINT7:destroy(); self.HINT7 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.UPM1 ~= nil then self.UPM1:destroy(); self.UPM1 = nil; end;
        if self.HI6 ~= nil then self.HI6:destroy(); self.HI6 = nil; end;
        if self.UINT1 ~= nil then self.UINT1:destroy(); self.UINT1 = nil; end;
        if self.HINT6 ~= nil then self.HINT6:destroy(); self.HINT6 = nil; end;
        if self.HPM8 ~= nil then self.HPM8:destroy(); self.HPM8 = nil; end;
        if self.HPA7 ~= nil then self.HPA7:destroy(); self.HPA7 = nil; end;
        if self.HPA5 ~= nil then self.HPA5:destroy(); self.HPA5 = nil; end;
        if self.UL1 ~= nil then self.UL1:destroy(); self.UL1 = nil; end;
        if self.HL2 ~= nil then self.HL2:destroy(); self.HL2 = nil; end;
        if self.HPM3 ~= nil then self.HPM3:destroy(); self.HPM3 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.HI8 ~= nil then self.HI8:destroy(); self.HI8 = nil; end;
        if self.HINT3 ~= nil then self.HINT3:destroy(); self.HINT3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.HL7 ~= nil then self.HL7:destroy(); self.HL7 = nil; end;
        if self.HI7 ~= nil then self.HI7:destroy(); self.HI7 = nil; end;
        if self.HPM9 ~= nil then self.HPM9:destroy(); self.HPM9 = nil; end;
        if self.ComboU2 ~= nil then self.ComboU2:destroy(); self.ComboU2 = nil; end;
        if self.HPF7 ~= nil then self.HPF7:destroy(); self.HPF7 = nil; end;
        if self.ComboU1 ~= nil then self.ComboU1:destroy(); self.ComboU1 = nil; end;
        if self.HL9 ~= nil then self.HL9:destroy(); self.HL9 = nil; end;
        if self.HL1 ~= nil then self.HL1:destroy(); self.HL1 = nil; end;
        if self.HT7 ~= nil then self.HT7:destroy(); self.HT7 = nil; end;
        if self.HT8 ~= nil then self.HT8:destroy(); self.HT8 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.HD3 ~= nil then self.HD3:destroy(); self.HD3 = nil; end;
        if self.Combo5 ~= nil then self.Combo5:destroy(); self.Combo5 = nil; end;
        if self.HPA1 ~= nil then self.HPA1:destroy(); self.HPA1 = nil; end;
        if self.HL3 ~= nil then self.HL3:destroy(); self.HL3 = nil; end;
        if self.HINT2 ~= nil then self.HINT2:destroy(); self.HINT2 = nil; end;
        if self.HPF5 ~= nil then self.HPF5:destroy(); self.HPF5 = nil; end;
        if self.Combo6 ~= nil then self.Combo6:destroy(); self.Combo6 = nil; end;
        if self.HPA9 ~= nil then self.HPA9:destroy(); self.HPA9 = nil; end;
        if self.HINT9 ~= nil then self.HINT9:destroy(); self.HINT9 = nil; end;
        if self.U2 ~= nil then self.U2:destroy(); self.U2 = nil; end;
        if self.HPM6 ~= nil then self.HPM6:destroy(); self.HPM6 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.HI4 ~= nil then self.HI4:destroy(); self.HI4 = nil; end;
        if self.HD9 ~= nil then self.HD9:destroy(); self.HD9 = nil; end;
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
