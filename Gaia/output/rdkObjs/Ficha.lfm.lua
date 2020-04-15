require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGaia()
    local obj = GUI.fromHandle(_obj_newObject("form"));
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("com.Gaia4");
    obj:setTitle("Gaia 4");
    obj:setName("frmGaia");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setField("imagemDoPersonagem");
    obj.image1:setEditable(true);
    obj.image1:setStyle("stretch");
    obj.image1:setLeft(218);
    obj.image1:setTop(76);
    obj.image1:setWidth(180);
    obj.image1:setHeight(250);
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(-40);
    obj.image2:setTop(-5);
    obj.image2:setWidth(700);
    obj.image2:setHeight(780);
    obj.image2:setSRC("/imagens/1.png");
    obj.image2:setName("image2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(210);
    obj.edit1:setTop(40);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(35);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setTransparent(true);
    obj.edit1:setFontSize(20);
    obj.edit1:setFontColor("#00008B");
    obj.edit1:setField("Nome");
    obj.edit1:setName("edit1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.scrollBox1);
    obj.comboBox1:setLeft(48);
    obj.comboBox1:setTop(80);
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setField("Raca");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setFontSize(10);
    obj.comboBox1:setItems({'Escolha', 'Humano', 'Meta-Humano', 'Yurei', 'Fallen'});
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.scrollBox1);
    obj.comboBox2:setLeft(470);
    obj.comboBox2:setTop(80);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setHeight(20);
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setField("Classe");
    obj.comboBox2:setItems({'Escolha', 'Shisu', 'Mahou' });
    obj.comboBox2:setName("comboBox2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(148);
    obj.edit2:setTop(141);
    obj.edit2:setWidth(65);
    obj.edit2:setHeight(40);
    obj.edit2:setType("number");
    obj.edit2:setMax(1020);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setTransparent(true);
    obj.edit2:setFontSize(24);
    obj.edit2:setFontColor("#00008B");
    obj.edit2:setField("Força");
    obj.edit2:setName("edit2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(394);
    obj.label1:setTop(140);
    obj.label1:setWidth(75);
    obj.label1:setHeight(40);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(24);
    obj.label1:setFontColor("#00008B");
    obj.label1:setField("DF");
    obj.label1:setName("label1");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(153);
    obj.edit3:setTop(220);
    obj.edit3:setWidth(65);
    obj.edit3:setHeight(40);
    obj.edit3:setType("number");
    obj.edit3:setMax(1020);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setTransparent(true);
    obj.edit3:setFontSize(24);
    obj.edit3:setFontColor("#00008B");
    obj.edit3:setField("Mentalidade");
    obj.edit3:setName("edit3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setLeft(392);
    obj.label2:setTop(220);
    obj.label2:setWidth(75);
    obj.label2:setHeight(40);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontSize(24);
    obj.label2:setFontColor("#00008B");
    obj.label2:setField("DM");
    obj.label2:setName("label2");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(180);
    obj.edit4:setTop(305);
    obj.edit4:setWidth(65);
    obj.edit4:setHeight(40);
    obj.edit4:setText("X");
    obj.edit4:setReadOnly(false);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setTransparent(true);
    obj.edit4:setFontSize(24);
    obj.edit4:setFontColor("#00008B");
    obj.edit4:setField("Destreza");
    obj.edit4:setName("edit4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(363);
    obj.label3:setTop(305);
    obj.label3:setWidth(75);
    obj.label3:setHeight(40);
    obj.label3:setText("X");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontSize(24);
    obj.label3:setFontColor("#00008B");
    obj.label3:setField("DD");
    obj.label3:setName("label3");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(112);
    obj.edit5:setTop(144);
    obj.edit5:setWidth(30);
    obj.edit5:setHeight(25);
    obj.edit5:setType("number");
    obj.edit5:setMax(99);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setTransparent(true);
    obj.edit5:setFontSize(18);
    obj.edit5:setFontColor("#00008B");
    obj.edit5:setField("Atletismo");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(115);
    obj.edit6:setTop(222);
    obj.edit6:setWidth(30);
    obj.edit6:setHeight(30);
    obj.edit6:setType("number");
    obj.edit6:setMax(99);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setTransparent(true);
    obj.edit6:setFontSize(18);
    obj.edit6:setFontColor("#00008B");
    obj.edit6:setField("Raciocineo");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox1);
    obj.edit7:setLeft(143);
    obj.edit7:setTop(306);
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(30);
    obj.edit7:setType("number");
    obj.edit7:setMax(99);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setTransparent(true);
    obj.edit7:setFontSize(18);
    obj.edit7:setFontColor("#00008B");
    obj.edit7:setField("Equilibrio");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox1);
    obj.edit8:setLeft(472);
    obj.edit8:setTop(140);
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(30);
    obj.edit8:setType("number");
    obj.edit8:setMax(99);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setTransparent(true);
    obj.edit8:setFontSize(20);
    obj.edit8:setFontColor("#00008B");
    obj.edit8:setField("Execucao");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox1);
    obj.edit9:setLeft(509);
    obj.edit9:setTop(155);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(30);
    obj.edit9:setType("number");
    obj.edit9:setMax(99);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(20);
    obj.edit9:setFontColor("#00008B");
    obj.edit9:setField("Acerto");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.scrollBox1);
    obj.edit10:setLeft(468);
    obj.edit10:setTop(220);
    obj.edit10:setWidth(30);
    obj.edit10:setHeight(30);
    obj.edit10:setType("number");
    obj.edit10:setMax(99);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(20);
    obj.edit10:setFontColor("#00008B");
    obj.edit10:setField("Critical");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.scrollBox1);
    obj.edit11:setLeft(441);
    obj.edit11:setTop(304);
    obj.edit11:setWidth(30);
    obj.edit11:setHeight(30);
    obj.edit11:setType("number");
    obj.edit11:setMax(99);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setTransparent(true);
    obj.edit11:setFontSize(20);
    obj.edit11:setFontColor("#00008B");
    obj.edit11:setField("Esquiva");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.scrollBox1);
    obj.edit12:setLeft(69);
    obj.edit12:setTop(140);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setType("number");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setVisible(false);
    obj.edit12:setTransparent(false);
    obj.edit12:setFontSize(18);
    obj.edit12:setFontColor("#00008B");
    obj.edit12:setField("EtherdaClasse");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.scrollBox1);
    obj.edit13:setLeft(69);
    obj.edit13:setTop(180);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setType("number");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setVisible(false);
    obj.edit13:setTransparent(false);
    obj.edit13:setFontSize(18);
    obj.edit13:setFontColor("#00008B");
    obj.edit13:setField("HPdaClasse");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.scrollBox1);
    obj.edit14:setLeft(520);
    obj.edit14:setTop(270);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(35);
    obj.edit14:setType("number");
    obj.edit14:setMax(99);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setTransparent(true);
    obj.edit14:setFontSize(28);
    obj.edit14:setFontColor("#00008B");
    obj.edit14:setField("Idade");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.scrollBox1);
    obj.edit15:setLeft(46);
    obj.edit15:setTop(270);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(35);
    obj.edit15:setType("number");
    obj.edit15:setMax(99);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setTransparent(true);
    obj.edit15:setFontSize(28);
    obj.edit15:setFontColor("#00008B");
    obj.edit15:setField("Level");
    obj.edit15:setName("edit15");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox1);
    obj.label4:setLeft(270);
    obj.label4:setTop(390);
    obj.label4:setWidth(75);
    obj.label4:setHeight(30);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontSize(18);
    obj.label4:setFontColor("Green");
    lfm_setPropAsString(obj.label4, "format",  "%d");
    obj.label4:setField("Ether");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.scrollBox1);
    obj.label5:setLeft(268);
    obj.label5:setTop(470);
    obj.label5:setWidth(75);
    obj.label5:setHeight(30);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setFontSize(16);
    obj.label5:setFontColor("Black");
    obj.label5:setField("Defesa");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.scrollBox1);
    obj.label6:setLeft(269);
    obj.label6:setTop(610);
    obj.label6:setWidth(75);
    obj.label6:setHeight(30);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontSize(14);
    obj.label6:setFontColor("Red");
    lfm_setPropAsString(obj.label6, "format",  "%d");
    obj.label6:setField("HP");
    obj.label6:setName("label6");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.scrollBox1);
    obj.edit16:setLeft(42);
    obj.edit16:setTop(390);
    obj.edit16:setFontSize(10);
    obj.edit16:setField("NomeH1");
    obj.edit16:setFontColor("RED");
    obj.edit16:setTransparent(true);
    obj.edit16:setName("edit16");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(40);
    obj.button1:setTop(395);
    obj.button1:setWidth(100);
    obj.button1:setHeight(20);
    obj.button1:setOpacity(0.4);
    obj.button1:setText("");
    obj.button1:setName("button1");

    obj.POPHabilidade1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPHabilidade1:setParent(obj.scrollBox1);
    obj.POPHabilidade1:setName("POPHabilidade1");
    obj.POPHabilidade1:setVisible(false);
    obj.POPHabilidade1:setLeft(1);
    obj.POPHabilidade1:setTop(40);
    obj.POPHabilidade1:setWidth(620);
    obj.POPHabilidade1:setHeight(620);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.POPHabilidade1);
    obj.image3:setTop(1);
    obj.image3:setWidth(615);
    obj.image3:setHeight(615);
    obj.image3:setSRC("/imagens/2.png");
    obj.image3:setName("image3");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.POPHabilidade1);
    obj.edit17:setLeft(110);
    obj.edit17:setTop(145);
    obj.edit17:setWidth(120);
    obj.edit17:setHeight(20);
    obj.edit17:setTransparent(false);
    obj.edit17:setFontSize(12);
    obj.edit17:setFontColor("red");
    obj.edit17:setField("NomeH1");
    obj.edit17:setName("edit17");

    obj.H1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.H1:setParent(obj.POPHabilidade1);
    obj.H1:setLeft(65);
    obj.H1:setTop(230);
    obj.H1:setVisible(true);
    obj.H1:setName("H1");
    obj.H1:setWidth(200);
    obj.H1:setHeight(170);
    obj.H1:setField("DH1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.POPHabilidade1);
    obj.button2:setLeft(110);
    obj.button2:setTop(170);
    obj.button2:setFontSize(20);
    obj.button2:setHeight(25);
    obj.button2:setWidth(120);
    obj.button2:setText("Executar");
    obj.button2:setFontColor("White");
    obj.button2:setName("button2");


                local function ExecutarH1() 
				
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                
														
								function (rolado)
										
										if sheet.Rank1 =="Dano" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH1);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.DTotalH1 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH1 = mesa.meuJogador:getBarValue(2);
												CustoH1 = CustoH1 - (tonumber(sheet.CustoH1) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH1);
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										
										else if sheet.Rank1 =="Cura" then
								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH1);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.DTotalH1 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH1 = mesa.meuJogador:getBarValue(2);
												CustoH1 = CustoH1 - (tonumber(sheet.CustoH1) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH1);	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");											
											end;
										else if sheet.Rank1 =="Fixo" then
								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH1);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DanoH1 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH1 = mesa.meuJogador:getBarValue(2);
												CustoH1 = CustoH1 - (tonumber(sheet.CustoH1) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH1);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.Rank1 =="Passiva" then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH1);
										else if sheet.Rank1 =="Outros" then
								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH1);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH1 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH1 = mesa.meuJogador:getBarValue(2);
												CustoH1 = CustoH1 - (tonumber(sheet.CustoH1) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH1);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
											else if sheet.Rank1 =="Buff" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH1);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH1 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH1 = mesa.meuJogador:getBarValue(2);
												CustoH1 = CustoH1 - (tonumber(sheet.CustoH1) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH1);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: AÇÃO DE BUFF ");
											end;										
										else if sheet.Rank1 =="" then
											showMessage("Sua Habilidade Precisa ter um tipo");
											end;
										end;
										end;	
										end;
										end;	
										end;
										end;
										
								end);          
                end;   

								
        


    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.POPHabilidade1);
    obj.comboBox3:setLeft(420);
    obj.comboBox3:setTop(145);
    obj.comboBox3:setWidth(70);
    obj.comboBox3:setField("Rank1");
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setItems({'Dano', 'Cura', 'Fixo', 'Passiva', 'Buff', 'Outros'});
    obj.comboBox3:setName("comboBox3");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.POPHabilidade1);
    obj.edit18:setLeft(410);
    obj.edit18:setTop(191);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(20);
    obj.edit18:setTransparent(false);
    obj.edit18:setFontSize(12);
    obj.edit18:setFontColor("red");
    obj.edit18:setField("DanoH1");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.POPHabilidade1);
    obj.edit19:setLeft(510);
    obj.edit19:setTop(191);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(20);
    obj.edit19:setTransparent(false);
    obj.edit19:setFontSize(12);
    obj.edit19:setFontColor("red");
    obj.edit19:setField("CustoH1");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.POPHabilidade1);
    obj.edit20:setLeft(355);
    obj.edit20:setTop(280);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(20);
    obj.edit20:setTransparent(false);
    obj.edit20:setFontSize(12);
    obj.edit20:setFontColor("red");
    obj.edit20:setField("HPH1");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.POPHabilidade1);
    obj.edit21:setLeft(447);
    obj.edit21:setTop(280);
    obj.edit21:setWidth(40);
    obj.edit21:setHeight(20);
    obj.edit21:setTransparent(false);
    obj.edit21:setFontSize(12);
    obj.edit21:setFontColor("red");
    obj.edit21:setField("EtherH1");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.POPHabilidade1);
    obj.edit22:setLeft(355);
    obj.edit22:setTop(328);
    obj.edit22:setWidth(40);
    obj.edit22:setHeight(20);
    obj.edit22:setTransparent(false);
    obj.edit22:setFontSize(12);
    obj.edit22:setFontColor("red");
    obj.edit22:setField("DFH1");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.POPHabilidade1);
    obj.edit23:setLeft(447);
    obj.edit23:setTop(328);
    obj.edit23:setWidth(40);
    obj.edit23:setHeight(20);
    obj.edit23:setTransparent(false);
    obj.edit23:setFontSize(12);
    obj.edit23:setFontColor("red");
    obj.edit23:setField("DMH1");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.POPHabilidade1);
    obj.edit24:setLeft(520);
    obj.edit24:setTop(328);
    obj.edit24:setWidth(40);
    obj.edit24:setHeight(20);
    obj.edit24:setTransparent(false);
    obj.edit24:setFontSize(12);
    obj.edit24:setFontColor("red");
    obj.edit24:setField("DDH1");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.POPHabilidade1);
    obj.edit25:setLeft(355);
    obj.edit25:setTop(378);
    obj.edit25:setWidth(40);
    obj.edit25:setHeight(20);
    obj.edit25:setTransparent(false);
    obj.edit25:setFontSize(12);
    obj.edit25:setFontColor("red");
    obj.edit25:setField("ExeH1");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.POPHabilidade1);
    obj.edit26:setLeft(447);
    obj.edit26:setTop(378);
    obj.edit26:setWidth(40);
    obj.edit26:setHeight(20);
    obj.edit26:setTransparent(false);
    obj.edit26:setFontSize(12);
    obj.edit26:setFontColor("red");
    obj.edit26:setField("CritH1");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.POPHabilidade1);
    obj.edit27:setLeft(520);
    obj.edit27:setTop(378);
    obj.edit27:setWidth(40);
    obj.edit27:setHeight(20);
    obj.edit27:setTransparent(false);
    obj.edit27:setFontSize(12);
    obj.edit27:setFontColor("red");
    obj.edit27:setField("EsqH1");
    obj.edit27:setName("edit27");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.POPHabilidade1);
    obj.rectangle1:setLeft(426);
    obj.rectangle1:setTop(425);
    obj.rectangle1:setWidth(60);
    obj.rectangle1:setHeight(30);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("red");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setName("rectangle1");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.POPHabilidade1);
    obj.label7:setLeft(430);
    obj.label7:setTop(425);
    obj.label7:setWidth(60);
    obj.label7:setHeight(25);
    obj.label7:setFontSize(15);
    obj.label7:setText("teste");
    obj.label7:setFontColor("white");
    obj.label7:setField("DTotalH1");
    obj.label7:setName("label7");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.scrollBox1);
    obj.edit28:setLeft(150);
    obj.edit28:setTop(390);
    obj.edit28:setFontSize(10);
    obj.edit28:setField("NomeH2");
    obj.edit28:setFontColor("RED");
    obj.edit28:setTransparent(true);
    obj.edit28:setName("edit28");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(150);
    obj.button3:setTop(395);
    obj.button3:setWidth(100);
    obj.button3:setHeight(20);
    obj.button3:setOpacity(0.4);
    obj.button3:setText("");
    obj.button3:setName("button3");

    obj.POPHabilidade2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPHabilidade2:setParent(obj.scrollBox1);
    obj.POPHabilidade2:setName("POPHabilidade2");
    obj.POPHabilidade2:setVisible(false);
    obj.POPHabilidade2:setLeft(1);
    obj.POPHabilidade2:setTop(40);
    obj.POPHabilidade2:setWidth(620);
    obj.POPHabilidade2:setHeight(620);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.POPHabilidade2);
    obj.image4:setTop(1);
    obj.image4:setWidth(615);
    obj.image4:setHeight(615);
    obj.image4:setSRC("/imagens/2.png");
    obj.image4:setName("image4");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.POPHabilidade2);
    obj.edit29:setLeft(110);
    obj.edit29:setTop(145);
    obj.edit29:setWidth(120);
    obj.edit29:setHeight(20);
    obj.edit29:setTransparent(false);
    obj.edit29:setFontSize(12);
    obj.edit29:setFontColor("red");
    obj.edit29:setField("NomeH2");
    obj.edit29:setName("edit29");

    obj.H2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.H2:setParent(obj.POPHabilidade2);
    obj.H2:setLeft(65);
    obj.H2:setTop(230);
    obj.H2:setVisible(true);
    obj.H2:setName("H2");
    obj.H2:setWidth(200);
    obj.H2:setHeight(170);
    obj.H2:setField("DH2");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.POPHabilidade2);
    obj.button4:setLeft(110);
    obj.button4:setTop(170);
    obj.button4:setFontSize(20);
    obj.button4:setHeight(25);
    obj.button4:setWidth(120);
    obj.button4:setText("Executar");
    obj.button4:setFontColor("White");
    obj.button4:setName("button4");


                 local function ExecutarH2() 
				
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                
														
								function (rolado)
										
										if sheet.Rank2 =="Dano" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH2);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.DTotalH2 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH2 = mesa.meuJogador:getBarValue(2);
												CustoH2 = CustoH2 - (tonumber(sheet.CustoH2) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH2);
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										
										else if sheet.Rank2 =="Cura" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH2);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.DTotalH2 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH2 = mesa.meuJogador:getBarValue(2);
												CustoH2 = CustoH2 - (tonumber(sheet.CustoH2) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH2);	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");											
											end;
										else if sheet.Rank2 =="Fixo" then
								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH2);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DanoH2 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH2 = mesa.meuJogador:getBarValue(2);
												CustoH2 = CustoH2 - (tonumber(sheet.CustoH2) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH2);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.Rank2 =="Passiva" then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH2);
										else if sheet.Rank2 =="Outros" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH2);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH2 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH2 = mesa.meuJogador:getBarValue(2);
												CustoH2 = CustoH2 - (tonumber(sheet.CustoH2) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH2);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.Rank2 =="Buff" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH2);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH2 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH2 = mesa.meuJogador:getBarValue(2);
												CustoH2 = CustoH2 - (tonumber(sheet.CustoH2) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH2);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: AÇÃO DE BUFF ");
											end;										
										else if sheet.Rank2 =="" then
											showMessage("Sua Habilidade Precisa ter um tipo");
											end;
										end;
										end;	
										end;
										end;	
										end;
										end;
										
								end);          
                end;      
        


    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.POPHabilidade2);
    obj.comboBox4:setLeft(420);
    obj.comboBox4:setTop(145);
    obj.comboBox4:setWidth(70);
    obj.comboBox4:setField("Rank2");
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setItems({'Dano', 'Cura', 'Fixo', 'Passiva', 'Buff', 'Outros'});
    obj.comboBox4:setName("comboBox4");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.POPHabilidade2);
    obj.edit30:setLeft(410);
    obj.edit30:setTop(191);
    obj.edit30:setWidth(40);
    obj.edit30:setHeight(20);
    obj.edit30:setTransparent(false);
    obj.edit30:setFontSize(12);
    obj.edit30:setFontColor("red");
    obj.edit30:setField("DanoH2");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.POPHabilidade2);
    obj.edit31:setLeft(510);
    obj.edit31:setTop(191);
    obj.edit31:setWidth(40);
    obj.edit31:setHeight(20);
    obj.edit31:setTransparent(false);
    obj.edit31:setFontSize(12);
    obj.edit31:setFontColor("red");
    obj.edit31:setField("CustoH2");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.POPHabilidade2);
    obj.edit32:setLeft(355);
    obj.edit32:setTop(280);
    obj.edit32:setWidth(40);
    obj.edit32:setHeight(20);
    obj.edit32:setTransparent(false);
    obj.edit32:setFontSize(12);
    obj.edit32:setFontColor("red");
    obj.edit32:setField("HPH2");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.POPHabilidade2);
    obj.edit33:setLeft(447);
    obj.edit33:setTop(280);
    obj.edit33:setWidth(40);
    obj.edit33:setHeight(20);
    obj.edit33:setTransparent(false);
    obj.edit33:setFontSize(12);
    obj.edit33:setFontColor("red");
    obj.edit33:setField("EtherH2");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.POPHabilidade2);
    obj.edit34:setLeft(355);
    obj.edit34:setTop(328);
    obj.edit34:setWidth(40);
    obj.edit34:setHeight(20);
    obj.edit34:setTransparent(false);
    obj.edit34:setFontSize(12);
    obj.edit34:setFontColor("red");
    obj.edit34:setField("DFH2");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.POPHabilidade2);
    obj.edit35:setLeft(447);
    obj.edit35:setTop(328);
    obj.edit35:setWidth(40);
    obj.edit35:setHeight(20);
    obj.edit35:setTransparent(false);
    obj.edit35:setFontSize(12);
    obj.edit35:setFontColor("red");
    obj.edit35:setField("DMH2");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.POPHabilidade2);
    obj.edit36:setLeft(520);
    obj.edit36:setTop(328);
    obj.edit36:setWidth(40);
    obj.edit36:setHeight(20);
    obj.edit36:setTransparent(false);
    obj.edit36:setFontSize(12);
    obj.edit36:setFontColor("red");
    obj.edit36:setField("DDH2");
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.POPHabilidade2);
    obj.edit37:setLeft(355);
    obj.edit37:setTop(378);
    obj.edit37:setWidth(40);
    obj.edit37:setHeight(20);
    obj.edit37:setTransparent(false);
    obj.edit37:setFontSize(12);
    obj.edit37:setFontColor("red");
    obj.edit37:setField("ExeH2");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.POPHabilidade2);
    obj.edit38:setLeft(447);
    obj.edit38:setTop(378);
    obj.edit38:setWidth(40);
    obj.edit38:setHeight(20);
    obj.edit38:setTransparent(false);
    obj.edit38:setFontSize(12);
    obj.edit38:setFontColor("red");
    obj.edit38:setField("CritH2");
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.POPHabilidade2);
    obj.edit39:setLeft(520);
    obj.edit39:setTop(378);
    obj.edit39:setWidth(40);
    obj.edit39:setHeight(20);
    obj.edit39:setTransparent(false);
    obj.edit39:setFontSize(12);
    obj.edit39:setFontColor("red");
    obj.edit39:setField("EsqH2");
    obj.edit39:setName("edit39");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.POPHabilidade2);
    obj.rectangle2:setLeft(426);
    obj.rectangle2:setTop(425);
    obj.rectangle2:setWidth(60);
    obj.rectangle2:setHeight(30);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("red");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setName("rectangle2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.POPHabilidade2);
    obj.label8:setLeft(430);
    obj.label8:setTop(425);
    obj.label8:setWidth(60);
    obj.label8:setHeight(25);
    obj.label8:setFontSize(15);
    obj.label8:setText("teste");
    obj.label8:setFontColor("white");
    obj.label8:setField("DTotalH2");
    obj.label8:setName("label8");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.scrollBox1);
    obj.edit40:setLeft(42);
    obj.edit40:setTop(415);
    obj.edit40:setFontSize(10);
    obj.edit40:setField("NomeH3");
    obj.edit40:setFontColor("RED");
    obj.edit40:setTransparent(true);
    obj.edit40:setName("edit40");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(40);
    obj.button5:setTop(420);
    obj.button5:setWidth(100);
    obj.button5:setHeight(20);
    obj.button5:setOpacity(0.4);
    obj.button5:setText("");
    obj.button5:setName("button5");

    obj.POPHabilidade3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPHabilidade3:setParent(obj.scrollBox1);
    obj.POPHabilidade3:setName("POPHabilidade3");
    obj.POPHabilidade3:setVisible(false);
    obj.POPHabilidade3:setLeft(1);
    obj.POPHabilidade3:setTop(40);
    obj.POPHabilidade3:setWidth(620);
    obj.POPHabilidade3:setHeight(620);

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.POPHabilidade3);
    obj.image5:setTop(1);
    obj.image5:setWidth(615);
    obj.image5:setHeight(615);
    obj.image5:setSRC("/imagens/2.png");
    obj.image5:setName("image5");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.POPHabilidade3);
    obj.edit41:setLeft(110);
    obj.edit41:setTop(145);
    obj.edit41:setWidth(120);
    obj.edit41:setHeight(20);
    obj.edit41:setTransparent(false);
    obj.edit41:setFontSize(12);
    obj.edit41:setFontColor("red");
    obj.edit41:setField("NomeH3");
    obj.edit41:setName("edit41");

    obj.H3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.H3:setParent(obj.POPHabilidade3);
    obj.H3:setLeft(65);
    obj.H3:setTop(230);
    obj.H3:setVisible(true);
    obj.H3:setName("H3");
    obj.H3:setWidth(200);
    obj.H3:setHeight(170);
    obj.H3:setField("DH3");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.POPHabilidade3);
    obj.button6:setLeft(110);
    obj.button6:setTop(170);
    obj.button6:setFontSize(20);
    obj.button6:setHeight(25);
    obj.button6:setWidth(120);
    obj.button6:setText("Executar");
    obj.button6:setFontColor("White");
    obj.button6:setName("button6");


                     local function ExecutarH3() 
				
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                
														
								function (rolado)
										
										if sheet.Rank3 =="Dano" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH3);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.DTotalH3 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH3 = mesa.meuJogador:getBarValue(2);
												CustoH3 = CustoH3 - (tonumber(sheet.CustoH3) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH3);
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										
										else if sheet.Rank3 =="Cura" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH3);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.DTotalH3 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH3 = mesa.meuJogador:getBarValue(2);
												CustoH3 = CustoH3 - (tonumber(sheet.CustoH3) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH3);	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");											
											end;
										else if sheet.Rank3 =="Fixo" then
								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH3);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DanoH3 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH3 = mesa.meuJogador:getBarValue(2);
												CustoH3 = CustoH3 - (tonumber(sheet.CustoH3) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH3);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.Rank3 =="Passiva" then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH3);
										else if sheet.Rank3 =="Outros" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH3);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH3 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH3 = mesa.meuJogador:getBarValue(2);
												CustoH2 = CustoH3 - (tonumber(sheet.CustoH3) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH3);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.Rank3 =="Buff" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH3);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH3 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH3 = mesa.meuJogador:getBarValue(2);
												CustoH3 = CustoH3 - (tonumber(sheet.CustoH3) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH3);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: AÇÃO DE BUFF ");
											end;										
										else if sheet.Rank3 =="" then
											showMessage("Sua Habilidade Precisa ter um tipo");
											end;
										end;
										end;	
										end;
										end;	
										end;
										end;
										
								end);          
                end;    
        


    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.POPHabilidade3);
    obj.comboBox5:setLeft(420);
    obj.comboBox5:setTop(145);
    obj.comboBox5:setWidth(70);
    obj.comboBox5:setField("Rank3");
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setItems({'Dano', 'Cura', 'Fixo', 'Passiva', 'Buff', 'Outros'});
    obj.comboBox5:setName("comboBox5");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.POPHabilidade3);
    obj.edit42:setLeft(410);
    obj.edit42:setTop(191);
    obj.edit42:setWidth(40);
    obj.edit42:setHeight(20);
    obj.edit42:setTransparent(false);
    obj.edit42:setFontSize(12);
    obj.edit42:setFontColor("red");
    obj.edit42:setField("DanoH3");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.POPHabilidade3);
    obj.edit43:setLeft(510);
    obj.edit43:setTop(191);
    obj.edit43:setWidth(40);
    obj.edit43:setHeight(20);
    obj.edit43:setTransparent(false);
    obj.edit43:setFontSize(12);
    obj.edit43:setFontColor("red");
    obj.edit43:setField("CustoH3");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.POPHabilidade3);
    obj.edit44:setLeft(355);
    obj.edit44:setTop(280);
    obj.edit44:setWidth(40);
    obj.edit44:setHeight(20);
    obj.edit44:setTransparent(false);
    obj.edit44:setFontSize(12);
    obj.edit44:setFontColor("red");
    obj.edit44:setField("HPH3");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.POPHabilidade3);
    obj.edit45:setLeft(447);
    obj.edit45:setTop(280);
    obj.edit45:setWidth(40);
    obj.edit45:setHeight(20);
    obj.edit45:setTransparent(false);
    obj.edit45:setFontSize(12);
    obj.edit45:setFontColor("red");
    obj.edit45:setField("EtherH3");
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.POPHabilidade3);
    obj.edit46:setLeft(355);
    obj.edit46:setTop(328);
    obj.edit46:setWidth(40);
    obj.edit46:setHeight(20);
    obj.edit46:setTransparent(false);
    obj.edit46:setFontSize(12);
    obj.edit46:setFontColor("red");
    obj.edit46:setField("DFH3");
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.POPHabilidade3);
    obj.edit47:setLeft(447);
    obj.edit47:setTop(328);
    obj.edit47:setWidth(40);
    obj.edit47:setHeight(20);
    obj.edit47:setTransparent(false);
    obj.edit47:setFontSize(12);
    obj.edit47:setFontColor("red");
    obj.edit47:setField("DMH3");
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.POPHabilidade3);
    obj.edit48:setLeft(520);
    obj.edit48:setTop(328);
    obj.edit48:setWidth(40);
    obj.edit48:setHeight(20);
    obj.edit48:setTransparent(false);
    obj.edit48:setFontSize(12);
    obj.edit48:setFontColor("red");
    obj.edit48:setField("DDH3");
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.POPHabilidade3);
    obj.edit49:setLeft(355);
    obj.edit49:setTop(378);
    obj.edit49:setWidth(40);
    obj.edit49:setHeight(20);
    obj.edit49:setTransparent(false);
    obj.edit49:setFontSize(12);
    obj.edit49:setFontColor("red");
    obj.edit49:setField("ExeH3");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.POPHabilidade3);
    obj.edit50:setLeft(447);
    obj.edit50:setTop(378);
    obj.edit50:setWidth(40);
    obj.edit50:setHeight(20);
    obj.edit50:setTransparent(false);
    obj.edit50:setFontSize(12);
    obj.edit50:setFontColor("red");
    obj.edit50:setField("CritH3");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.POPHabilidade3);
    obj.edit51:setLeft(520);
    obj.edit51:setTop(378);
    obj.edit51:setWidth(40);
    obj.edit51:setHeight(20);
    obj.edit51:setTransparent(false);
    obj.edit51:setFontSize(12);
    obj.edit51:setFontColor("red");
    obj.edit51:setField("EsqH3");
    obj.edit51:setName("edit51");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.POPHabilidade3);
    obj.rectangle3:setLeft(426);
    obj.rectangle3:setTop(425);
    obj.rectangle3:setWidth(60);
    obj.rectangle3:setHeight(30);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("red");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setName("rectangle3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.POPHabilidade3);
    obj.label9:setLeft(430);
    obj.label9:setTop(425);
    obj.label9:setWidth(60);
    obj.label9:setHeight(25);
    obj.label9:setFontSize(15);
    obj.label9:setText("teste");
    obj.label9:setFontColor("white");
    obj.label9:setField("DTotalH3");
    obj.label9:setName("label9");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.scrollBox1);
    obj.edit52:setLeft(150);
    obj.edit52:setTop(415);
    obj.edit52:setFontSize(10);
    obj.edit52:setField("NomeH4");
    obj.edit52:setFontColor("RED");
    obj.edit52:setTransparent(true);
    obj.edit52:setName("edit52");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox1);
    obj.button7:setLeft(150);
    obj.button7:setTop(420);
    obj.button7:setWidth(100);
    obj.button7:setHeight(20);
    obj.button7:setOpacity(0.4);
    obj.button7:setText("");
    obj.button7:setName("button7");

    obj.POPHabilidade4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPHabilidade4:setParent(obj.scrollBox1);
    obj.POPHabilidade4:setName("POPHabilidade4");
    obj.POPHabilidade4:setVisible(false);
    obj.POPHabilidade4:setLeft(1);
    obj.POPHabilidade4:setTop(40);
    obj.POPHabilidade4:setWidth(620);
    obj.POPHabilidade4:setHeight(620);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.POPHabilidade4);
    obj.image6:setTop(1);
    obj.image6:setWidth(615);
    obj.image6:setHeight(615);
    obj.image6:setSRC("/imagens/2.png");
    obj.image6:setName("image6");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.POPHabilidade4);
    obj.edit53:setLeft(110);
    obj.edit53:setTop(145);
    obj.edit53:setWidth(120);
    obj.edit53:setHeight(20);
    obj.edit53:setTransparent(false);
    obj.edit53:setFontSize(12);
    obj.edit53:setFontColor("red");
    obj.edit53:setField("NomeH4");
    obj.edit53:setName("edit53");

    obj.H4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.H4:setParent(obj.POPHabilidade4);
    obj.H4:setLeft(65);
    obj.H4:setTop(230);
    obj.H4:setVisible(true);
    obj.H4:setName("H4");
    obj.H4:setWidth(200);
    obj.H4:setHeight(170);
    obj.H4:setField("DH4");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.POPHabilidade4);
    obj.button8:setLeft(110);
    obj.button8:setTop(170);
    obj.button8:setFontSize(20);
    obj.button8:setHeight(25);
    obj.button8:setWidth(120);
    obj.button8:setText("Executar");
    obj.button8:setFontColor("White");
    obj.button8:setName("button8");


                     local function ExecutarH4() 
				
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                
														
								function (rolado)
										
										if sheet.Rank4 =="Dano" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH4);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.DTotalH4 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH4 = mesa.meuJogador:getBarValue(2);
												CustoH4 = CustoH4 - (tonumber(sheet.CustoH4) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH4);
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										
										else if sheet.Rank4 =="Cura" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH4);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.DTotalH4 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH4 = mesa.meuJogador:getBarValue(2);
												CustoH4 = CustoH4 - (tonumber(sheet.CustoH4) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH4);	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");											
											end;
										else if sheet.Rank4 =="Fixo" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH4);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DanoH4 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH4 = mesa.meuJogador:getBarValue(2);
												CustoH4 = CustoH4 - (tonumber(sheet.CustoH4) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH4);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.Rank4 =="Passiva" then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH4);
										else if sheet.Rank4 =="Outros" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH4);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH4 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH4 = mesa.meuJogador:getBarValue(2);
												CustoH4 = CustoH4 - (tonumber(sheet.CustoH4) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH4);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.Rank4 =="Buff" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH4);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH4 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH4 = mesa.meuJogador:getBarValue(2);
												CustoH4 = CustoH4 - (tonumber(sheet.CustoH4) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH4);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: AÇÃO DE BUFF ");
											end;										
										else if sheet.Rank4 =="" then
											showMessage("Sua Habilidade Precisa ter um tipo");
											end;
										end;
										end;	
										end;
										end;	
										end;
										end;
										
								end);          
                end;  
        


    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.POPHabilidade4);
    obj.comboBox6:setLeft(420);
    obj.comboBox6:setTop(145);
    obj.comboBox6:setWidth(70);
    obj.comboBox6:setField("Rank4");
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setItems({'Dano', 'Cura', 'Fixo', 'Passiva', 'Buff', 'Outros'});
    obj.comboBox6:setName("comboBox6");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.POPHabilidade4);
    obj.edit54:setLeft(410);
    obj.edit54:setTop(191);
    obj.edit54:setWidth(40);
    obj.edit54:setHeight(20);
    obj.edit54:setTransparent(false);
    obj.edit54:setFontSize(12);
    obj.edit54:setFontColor("red");
    obj.edit54:setField("DanoH4");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.POPHabilidade4);
    obj.edit55:setLeft(510);
    obj.edit55:setTop(191);
    obj.edit55:setWidth(40);
    obj.edit55:setHeight(20);
    obj.edit55:setTransparent(false);
    obj.edit55:setFontSize(12);
    obj.edit55:setFontColor("red");
    obj.edit55:setField("CustoH4");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.POPHabilidade4);
    obj.edit56:setLeft(355);
    obj.edit56:setTop(280);
    obj.edit56:setWidth(40);
    obj.edit56:setHeight(20);
    obj.edit56:setTransparent(false);
    obj.edit56:setFontSize(12);
    obj.edit56:setFontColor("red");
    obj.edit56:setField("HPH4");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.POPHabilidade4);
    obj.edit57:setLeft(447);
    obj.edit57:setTop(280);
    obj.edit57:setWidth(40);
    obj.edit57:setHeight(20);
    obj.edit57:setTransparent(false);
    obj.edit57:setFontSize(12);
    obj.edit57:setFontColor("red");
    obj.edit57:setField("EtherH4");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.POPHabilidade4);
    obj.edit58:setLeft(355);
    obj.edit58:setTop(328);
    obj.edit58:setWidth(40);
    obj.edit58:setHeight(20);
    obj.edit58:setTransparent(false);
    obj.edit58:setFontSize(12);
    obj.edit58:setFontColor("red");
    obj.edit58:setField("DFH4");
    obj.edit58:setName("edit58");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.POPHabilidade4);
    obj.edit59:setLeft(447);
    obj.edit59:setTop(328);
    obj.edit59:setWidth(40);
    obj.edit59:setHeight(20);
    obj.edit59:setTransparent(false);
    obj.edit59:setFontSize(12);
    obj.edit59:setFontColor("red");
    obj.edit59:setField("DMH4");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.POPHabilidade4);
    obj.edit60:setLeft(520);
    obj.edit60:setTop(328);
    obj.edit60:setWidth(40);
    obj.edit60:setHeight(20);
    obj.edit60:setTransparent(false);
    obj.edit60:setFontSize(12);
    obj.edit60:setFontColor("red");
    obj.edit60:setField("DDH4");
    obj.edit60:setName("edit60");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.POPHabilidade4);
    obj.edit61:setLeft(355);
    obj.edit61:setTop(378);
    obj.edit61:setWidth(40);
    obj.edit61:setHeight(20);
    obj.edit61:setTransparent(false);
    obj.edit61:setFontSize(12);
    obj.edit61:setFontColor("red");
    obj.edit61:setField("ExeH4");
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.POPHabilidade4);
    obj.edit62:setLeft(447);
    obj.edit62:setTop(378);
    obj.edit62:setWidth(40);
    obj.edit62:setHeight(20);
    obj.edit62:setTransparent(false);
    obj.edit62:setFontSize(12);
    obj.edit62:setFontColor("red");
    obj.edit62:setField("CritH4");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.POPHabilidade4);
    obj.edit63:setLeft(520);
    obj.edit63:setTop(378);
    obj.edit63:setWidth(40);
    obj.edit63:setHeight(20);
    obj.edit63:setTransparent(false);
    obj.edit63:setFontSize(12);
    obj.edit63:setFontColor("red");
    obj.edit63:setField("EsqH4");
    obj.edit63:setName("edit63");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.POPHabilidade4);
    obj.rectangle4:setLeft(426);
    obj.rectangle4:setTop(425);
    obj.rectangle4:setWidth(60);
    obj.rectangle4:setHeight(30);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("red");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setName("rectangle4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.POPHabilidade4);
    obj.label10:setLeft(430);
    obj.label10:setTop(425);
    obj.label10:setWidth(60);
    obj.label10:setHeight(25);
    obj.label10:setFontSize(15);
    obj.label10:setText("teste");
    obj.label10:setFontColor("white");
    obj.label10:setField("DTotalH4");
    obj.label10:setName("label10");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.scrollBox1);
    obj.edit64:setLeft(42);
    obj.edit64:setTop(440);
    obj.edit64:setFontSize(10);
    obj.edit64:setField("NomeH5");
    obj.edit64:setFontColor("RED");
    obj.edit64:setTransparent(true);
    obj.edit64:setName("edit64");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox1);
    obj.button9:setLeft(40);
    obj.button9:setTop(445);
    obj.button9:setWidth(100);
    obj.button9:setHeight(20);
    obj.button9:setOpacity(0.4);
    obj.button9:setText("");
    obj.button9:setName("button9");

    obj.POPHabilidade5 = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPHabilidade5:setParent(obj.scrollBox1);
    obj.POPHabilidade5:setName("POPHabilidade5");
    obj.POPHabilidade5:setVisible(false);
    obj.POPHabilidade5:setLeft(1);
    obj.POPHabilidade5:setTop(40);
    obj.POPHabilidade5:setWidth(620);
    obj.POPHabilidade5:setHeight(620);

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.POPHabilidade5);
    obj.image7:setTop(1);
    obj.image7:setWidth(615);
    obj.image7:setHeight(615);
    obj.image7:setSRC("/imagens/2.png");
    obj.image7:setName("image7");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.POPHabilidade5);
    obj.edit65:setLeft(110);
    obj.edit65:setTop(145);
    obj.edit65:setWidth(120);
    obj.edit65:setHeight(20);
    obj.edit65:setTransparent(false);
    obj.edit65:setFontSize(12);
    obj.edit65:setFontColor("red");
    obj.edit65:setField("NomeH5");
    obj.edit65:setName("edit65");

    obj.H5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.H5:setParent(obj.POPHabilidade5);
    obj.H5:setLeft(65);
    obj.H5:setTop(230);
    obj.H5:setVisible(true);
    obj.H5:setName("H5");
    obj.H5:setWidth(200);
    obj.H5:setHeight(170);
    obj.H5:setField("DH5");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.POPHabilidade5);
    obj.button10:setLeft(110);
    obj.button10:setTop(170);
    obj.button10:setFontSize(20);
    obj.button10:setHeight(25);
    obj.button10:setWidth(120);
    obj.button10:setText("Executar");
    obj.button10:setFontColor("White");
    obj.button10:setName("button10");


                     local function ExecutarH5() 
				
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                
														
								function (rolado)
										
										if sheet.Rank5 =="Dano" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH5);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.DTotalH5 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH5 = mesa.meuJogador:getBarValue(2);
												CustoH5 = CustoH5 - (tonumber(sheet.CustoH5) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH5);
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										
										else if sheet.Rank5 =="Cura" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH5);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.DTotalH5 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH5 = mesa.meuJogador:getBarValue(2);
												CustoH5 = CustoH5 - (tonumber(sheet.CustoH5) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH5);	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");											
											end;
										else if sheet.Rank5 =="Fixo" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH5);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DanoH5 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH5 = mesa.meuJogador:getBarValue(2);
												CustoH5 = CustoH5 - (tonumber(sheet.CustoH5) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH5);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.Rank5 =="Passiva" then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH5);
										else if sheet.Rank5 =="Outros" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH5);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH5 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH5 = mesa.meuJogador:getBarValue(2);
												CustoH5 = CustoH5 - (tonumber(sheet.CustoH5) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH5);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
											else if sheet.Rank5 =="Buff" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH5);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH5 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH5 = mesa.meuJogador:getBarValue(2);
												CustoH5 = CustoH5 - (tonumber(sheet.CustoH5) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH5);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: AÇÃO DE BUFF ");
											end;										
										else if sheet.Rank5 =="" then
											showMessage("Sua Habilidade Precisa ter um tipo");
											end;
										end;
										end;	
										end;
										end;	
										end;
										end;
										
								end);          
                end;  
        


    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.POPHabilidade5);
    obj.comboBox7:setLeft(420);
    obj.comboBox7:setTop(145);
    obj.comboBox7:setWidth(70);
    obj.comboBox7:setField("Rank5");
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setItems({'Dano', 'Cura', 'Fixo', 'Passiva', 'Buff', 'Outros'});
    obj.comboBox7:setName("comboBox7");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.POPHabilidade5);
    obj.edit66:setLeft(410);
    obj.edit66:setTop(191);
    obj.edit66:setWidth(40);
    obj.edit66:setHeight(20);
    obj.edit66:setTransparent(false);
    obj.edit66:setFontSize(12);
    obj.edit66:setFontColor("red");
    obj.edit66:setField("DanoH5");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.POPHabilidade5);
    obj.edit67:setLeft(510);
    obj.edit67:setTop(191);
    obj.edit67:setWidth(40);
    obj.edit67:setHeight(20);
    obj.edit67:setTransparent(false);
    obj.edit67:setFontSize(12);
    obj.edit67:setFontColor("red");
    obj.edit67:setField("CustoH5");
    obj.edit67:setName("edit67");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.POPHabilidade5);
    obj.edit68:setLeft(355);
    obj.edit68:setTop(280);
    obj.edit68:setWidth(40);
    obj.edit68:setHeight(20);
    obj.edit68:setTransparent(false);
    obj.edit68:setFontSize(12);
    obj.edit68:setFontColor("red");
    obj.edit68:setField("HPH5");
    obj.edit68:setName("edit68");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.POPHabilidade5);
    obj.edit69:setLeft(447);
    obj.edit69:setTop(280);
    obj.edit69:setWidth(40);
    obj.edit69:setHeight(20);
    obj.edit69:setTransparent(false);
    obj.edit69:setFontSize(12);
    obj.edit69:setFontColor("red");
    obj.edit69:setField("EtherH5");
    obj.edit69:setName("edit69");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.POPHabilidade5);
    obj.edit70:setLeft(355);
    obj.edit70:setTop(328);
    obj.edit70:setWidth(40);
    obj.edit70:setHeight(20);
    obj.edit70:setTransparent(false);
    obj.edit70:setFontSize(12);
    obj.edit70:setFontColor("red");
    obj.edit70:setField("DFH5");
    obj.edit70:setName("edit70");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.POPHabilidade5);
    obj.edit71:setLeft(447);
    obj.edit71:setTop(328);
    obj.edit71:setWidth(40);
    obj.edit71:setHeight(20);
    obj.edit71:setTransparent(false);
    obj.edit71:setFontSize(12);
    obj.edit71:setFontColor("red");
    obj.edit71:setField("DMH5");
    obj.edit71:setName("edit71");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.POPHabilidade5);
    obj.edit72:setLeft(520);
    obj.edit72:setTop(328);
    obj.edit72:setWidth(40);
    obj.edit72:setHeight(20);
    obj.edit72:setTransparent(false);
    obj.edit72:setFontSize(12);
    obj.edit72:setFontColor("red");
    obj.edit72:setField("DDH5");
    obj.edit72:setName("edit72");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.POPHabilidade5);
    obj.edit73:setLeft(355);
    obj.edit73:setTop(378);
    obj.edit73:setWidth(40);
    obj.edit73:setHeight(20);
    obj.edit73:setTransparent(false);
    obj.edit73:setFontSize(12);
    obj.edit73:setFontColor("red");
    obj.edit73:setField("ExeH5");
    obj.edit73:setName("edit73");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.POPHabilidade5);
    obj.edit74:setLeft(447);
    obj.edit74:setTop(378);
    obj.edit74:setWidth(40);
    obj.edit74:setHeight(20);
    obj.edit74:setTransparent(false);
    obj.edit74:setFontSize(12);
    obj.edit74:setFontColor("red");
    obj.edit74:setField("CritH5");
    obj.edit74:setName("edit74");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.POPHabilidade5);
    obj.edit75:setLeft(520);
    obj.edit75:setTop(378);
    obj.edit75:setWidth(40);
    obj.edit75:setHeight(20);
    obj.edit75:setTransparent(false);
    obj.edit75:setFontSize(12);
    obj.edit75:setFontColor("red");
    obj.edit75:setField("EsqH5");
    obj.edit75:setName("edit75");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.POPHabilidade5);
    obj.rectangle5:setLeft(426);
    obj.rectangle5:setTop(425);
    obj.rectangle5:setWidth(60);
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("red");
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setName("rectangle5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.POPHabilidade5);
    obj.label11:setLeft(430);
    obj.label11:setTop(425);
    obj.label11:setWidth(60);
    obj.label11:setHeight(25);
    obj.label11:setFontSize(15);
    obj.label11:setText("teste");
    obj.label11:setFontColor("white");
    obj.label11:setField("DTotalH5");
    obj.label11:setName("label11");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.scrollBox1);
    obj.edit76:setLeft(150);
    obj.edit76:setTop(440);
    obj.edit76:setFontSize(10);
    obj.edit76:setField("NomeH6");
    obj.edit76:setFontColor("RED");
    obj.edit76:setTransparent(true);
    obj.edit76:setName("edit76");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox1);
    obj.button11:setLeft(150);
    obj.button11:setTop(445);
    obj.button11:setWidth(100);
    obj.button11:setHeight(20);
    obj.button11:setOpacity(0.4);
    obj.button11:setText("");
    obj.button11:setName("button11");

    obj.POPHabilidade6 = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPHabilidade6:setParent(obj.scrollBox1);
    obj.POPHabilidade6:setName("POPHabilidade6");
    obj.POPHabilidade6:setVisible(false);
    obj.POPHabilidade6:setLeft(1);
    obj.POPHabilidade6:setTop(40);
    obj.POPHabilidade6:setWidth(620);
    obj.POPHabilidade6:setHeight(620);

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.POPHabilidade6);
    obj.image8:setTop(1);
    obj.image8:setWidth(615);
    obj.image8:setHeight(615);
    obj.image8:setSRC("/imagens/2.png");
    obj.image8:setName("image8");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.POPHabilidade6);
    obj.edit77:setLeft(110);
    obj.edit77:setTop(145);
    obj.edit77:setWidth(120);
    obj.edit77:setHeight(20);
    obj.edit77:setTransparent(false);
    obj.edit77:setFontSize(12);
    obj.edit77:setFontColor("red");
    obj.edit77:setField("NomeH6");
    obj.edit77:setName("edit77");

    obj.H6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.H6:setParent(obj.POPHabilidade6);
    obj.H6:setLeft(65);
    obj.H6:setTop(230);
    obj.H6:setVisible(true);
    obj.H6:setName("H6");
    obj.H6:setWidth(200);
    obj.H6:setHeight(170);
    obj.H6:setField("DH6");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.POPHabilidade6);
    obj.button12:setLeft(110);
    obj.button12:setTop(170);
    obj.button12:setFontSize(20);
    obj.button12:setHeight(25);
    obj.button12:setWidth(120);
    obj.button12:setText("Executar");
    obj.button12:setFontColor("White");
    obj.button12:setName("button12");


                      local function ExecutarH6() 
				
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                
														
								function (rolado)
										
										if sheet.Rank6 =="Dano" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH6);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.DTotalH6 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH6 = mesa.meuJogador:getBarValue(2);
												CustoH6 = CustoH6 - (tonumber(sheet.CustoH6) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH6);
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										
										else if sheet.Rank6 =="Cura" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH6);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.DTotalH6 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH6 = mesa.meuJogador:getBarValue(2);
												CustoH6 = CustoH6 - (tonumber(sheet.CustoH6) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH6);	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");											
											end;
										else if sheet.Rank6 =="Fixo" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH6);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DanoH6 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH6 = mesa.meuJogador:getBarValue(2);
												CustoH6 = CustoH6 - (tonumber(sheet.CustoH6) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH6);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.Rank6 =="Passiva" then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH6);
										else if sheet.Rank6 =="Outros" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH6);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH6 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH6 = mesa.meuJogador:getBarValue(2);
												CustoH6 = CustoH6 - (tonumber(sheet.CustoH6) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH6);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
											else if sheet.Rank6 =="Buff" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DH6);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalH6 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoH6 = mesa.meuJogador:getBarValue(2);
												CustoH6 = CustoH6 - (tonumber(sheet.CustoH6) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoH6);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: AÇÃO DE BUFF ");
											end;										
										else if sheet.Rank6 =="" then
											showMessage("Sua Habilidade Precisa ter um tipo");
											end;
										end;
										end;	
										end;
										end;	
										end;
										end;
										
								end);          
                end;      
        


    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.POPHabilidade6);
    obj.comboBox8:setLeft(420);
    obj.comboBox8:setTop(145);
    obj.comboBox8:setWidth(70);
    obj.comboBox8:setField("Rank6");
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setItems({'Dano', 'Cura', 'Fixo', 'Passiva', 'Buff', 'Outros'});
    obj.comboBox8:setName("comboBox8");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.POPHabilidade6);
    obj.edit78:setLeft(410);
    obj.edit78:setTop(191);
    obj.edit78:setWidth(40);
    obj.edit78:setHeight(20);
    obj.edit78:setTransparent(false);
    obj.edit78:setFontSize(12);
    obj.edit78:setFontColor("red");
    obj.edit78:setField("DanoH6");
    obj.edit78:setName("edit78");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.POPHabilidade6);
    obj.edit79:setLeft(510);
    obj.edit79:setTop(191);
    obj.edit79:setWidth(40);
    obj.edit79:setHeight(20);
    obj.edit79:setTransparent(false);
    obj.edit79:setFontSize(12);
    obj.edit79:setFontColor("red");
    obj.edit79:setField("CustoH6");
    obj.edit79:setName("edit79");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.POPHabilidade6);
    obj.edit80:setLeft(355);
    obj.edit80:setTop(280);
    obj.edit80:setWidth(40);
    obj.edit80:setHeight(20);
    obj.edit80:setTransparent(false);
    obj.edit80:setFontSize(12);
    obj.edit80:setFontColor("red");
    obj.edit80:setField("HPH6");
    obj.edit80:setName("edit80");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.POPHabilidade6);
    obj.edit81:setLeft(447);
    obj.edit81:setTop(280);
    obj.edit81:setWidth(40);
    obj.edit81:setHeight(20);
    obj.edit81:setTransparent(false);
    obj.edit81:setFontSize(12);
    obj.edit81:setFontColor("red");
    obj.edit81:setField("EtherH6");
    obj.edit81:setName("edit81");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.POPHabilidade6);
    obj.edit82:setLeft(355);
    obj.edit82:setTop(328);
    obj.edit82:setWidth(40);
    obj.edit82:setHeight(20);
    obj.edit82:setTransparent(false);
    obj.edit82:setFontSize(12);
    obj.edit82:setFontColor("red");
    obj.edit82:setField("DFH6");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.POPHabilidade6);
    obj.edit83:setLeft(447);
    obj.edit83:setTop(328);
    obj.edit83:setWidth(40);
    obj.edit83:setHeight(20);
    obj.edit83:setTransparent(false);
    obj.edit83:setFontSize(12);
    obj.edit83:setFontColor("red");
    obj.edit83:setField("DMH6");
    obj.edit83:setName("edit83");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.POPHabilidade6);
    obj.edit84:setLeft(520);
    obj.edit84:setTop(328);
    obj.edit84:setWidth(40);
    obj.edit84:setHeight(20);
    obj.edit84:setTransparent(false);
    obj.edit84:setFontSize(12);
    obj.edit84:setFontColor("red");
    obj.edit84:setField("DDH6");
    obj.edit84:setName("edit84");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.POPHabilidade6);
    obj.edit85:setLeft(355);
    obj.edit85:setTop(378);
    obj.edit85:setWidth(40);
    obj.edit85:setHeight(20);
    obj.edit85:setTransparent(false);
    obj.edit85:setFontSize(12);
    obj.edit85:setFontColor("red");
    obj.edit85:setField("ExeH6");
    obj.edit85:setName("edit85");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.POPHabilidade6);
    obj.edit86:setLeft(447);
    obj.edit86:setTop(378);
    obj.edit86:setWidth(40);
    obj.edit86:setHeight(20);
    obj.edit86:setTransparent(false);
    obj.edit86:setFontSize(12);
    obj.edit86:setFontColor("red");
    obj.edit86:setField("CritH6");
    obj.edit86:setName("edit86");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.POPHabilidade6);
    obj.edit87:setLeft(520);
    obj.edit87:setTop(378);
    obj.edit87:setWidth(40);
    obj.edit87:setHeight(20);
    obj.edit87:setTransparent(false);
    obj.edit87:setFontSize(12);
    obj.edit87:setFontColor("red");
    obj.edit87:setField("EsqH6");
    obj.edit87:setName("edit87");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.POPHabilidade6);
    obj.rectangle6:setLeft(426);
    obj.rectangle6:setTop(425);
    obj.rectangle6:setWidth(60);
    obj.rectangle6:setHeight(30);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("red");
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setName("rectangle6");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.POPHabilidade6);
    obj.label12:setLeft(430);
    obj.label12:setTop(425);
    obj.label12:setWidth(60);
    obj.label12:setHeight(25);
    obj.label12:setFontSize(15);
    obj.label12:setText("teste");
    obj.label12:setFontColor("white");
    obj.label12:setField("DTotalH6");
    obj.label12:setName("label12");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.scrollBox1);
    obj.edit88:setLeft(365);
    obj.edit88:setTop(410);
    obj.edit88:setFontSize(10);
    obj.edit88:setField("NomeU1");
    obj.edit88:setFontColor("RED");
    obj.edit88:setTransparent(true);
    obj.edit88:setName("edit88");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox1);
    obj.button13:setLeft(365);
    obj.button13:setTop(395);
    obj.button13:setWidth(100);
    obj.button13:setHeight(70);
    obj.button13:setOpacity(0.4);
    obj.button13:setText("");
    obj.button13:setName("button13");

    obj.POPUltima1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPUltima1:setParent(obj.scrollBox1);
    obj.POPUltima1:setName("POPUltima1");
    obj.POPUltima1:setVisible(false);
    obj.POPUltima1:setLeft(1);
    obj.POPUltima1:setTop(40);
    obj.POPUltima1:setWidth(620);
    obj.POPUltima1:setHeight(620);

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.POPUltima1);
    obj.image9:setTop(1);
    obj.image9:setWidth(615);
    obj.image9:setHeight(615);
    obj.image9:setSRC("/imagens/2.png");
    obj.image9:setName("image9");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.POPUltima1);
    obj.edit89:setLeft(110);
    obj.edit89:setTop(145);
    obj.edit89:setWidth(120);
    obj.edit89:setHeight(20);
    obj.edit89:setTransparent(false);
    obj.edit89:setFontSize(12);
    obj.edit89:setFontColor("red");
    obj.edit89:setField("NomeU1");
    obj.edit89:setName("edit89");

    obj.U1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.U1:setParent(obj.POPUltima1);
    obj.U1:setLeft(65);
    obj.U1:setTop(230);
    obj.U1:setVisible(true);
    obj.U1:setName("U1");
    obj.U1:setWidth(200);
    obj.U1:setHeight(170);
    obj.U1:setField("DU1");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.POPUltima1);
    obj.button14:setLeft(110);
    obj.button14:setTop(170);
    obj.button14:setFontSize(20);
    obj.button14:setHeight(25);
    obj.button14:setWidth(120);
    obj.button14:setText("Executar");
    obj.button14:setFontColor("White");
    obj.button14:setName("button14");


                      local function ExecutarU1() 
				
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                
														
								function (rolado)
										
										if sheet.RankU1 =="Dano" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU1);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.DTotalU1 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoU1 = mesa.meuJogador:getBarValue(2);
												CustoU1 = CustoU1 - (tonumber(sheet.CustoU1) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoU1);
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										
										else if sheet.RankU1 =="Cura" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU1);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.DTotalU1 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoU1 = mesa.meuJogador:getBarValue(2);
												CustoU1 = CustoU1 - (tonumber(sheet.CustoU1) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoU1);	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");											
											end;
										else if sheet.RankU1 =="Fixo" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU1);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DanoU1 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoU1 = mesa.meuJogador:getBarValue(2);
												CustoU1 = CustoU1 - (tonumber(sheet.CustoU1) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoU1);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.RankU1 =="Passiva" then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU1);
										else if sheet.RankU1 =="Outros" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU1);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalU1 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoU1 = mesa.meuJogador:getBarValue(2);
												CustoU1 = CustoU1 - (tonumber(sheet.CustoU1) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoU1);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
											else if sheet.RankU1 =="Buff" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU1);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalU1 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoU1 = mesa.meuJogador:getBarValue(2);
												CustoU1 = CustoU1 - (tonumber(sheet.CustoU1) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoU1);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: AÇÃO DE BUFF ");
											end;										
										else if sheet.RankU1 =="" then
											showMessage("Sua Habilidade Precisa ter um tipo");
											end;
										end;
										end;	
										end;
										end;	
										end;
										end;
										
								end);          
                end;                    
        


    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.POPUltima1);
    obj.comboBox9:setLeft(420);
    obj.comboBox9:setTop(145);
    obj.comboBox9:setWidth(70);
    obj.comboBox9:setField("RankU1");
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setItems({'Dano', 'Cura', 'Fixo', 'Passiva', 'Buff', 'Outros'});
    obj.comboBox9:setName("comboBox9");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.POPUltima1);
    obj.edit90:setLeft(410);
    obj.edit90:setTop(191);
    obj.edit90:setWidth(40);
    obj.edit90:setHeight(20);
    obj.edit90:setTransparent(false);
    obj.edit90:setFontSize(12);
    obj.edit90:setFontColor("red");
    obj.edit90:setField("DanoU1");
    obj.edit90:setName("edit90");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.POPUltima1);
    obj.edit91:setLeft(510);
    obj.edit91:setTop(191);
    obj.edit91:setWidth(40);
    obj.edit91:setHeight(20);
    obj.edit91:setTransparent(false);
    obj.edit91:setFontSize(12);
    obj.edit91:setFontColor("red");
    obj.edit91:setField("CustoU1");
    obj.edit91:setName("edit91");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.POPUltima1);
    obj.edit92:setLeft(355);
    obj.edit92:setTop(280);
    obj.edit92:setWidth(40);
    obj.edit92:setHeight(20);
    obj.edit92:setTransparent(false);
    obj.edit92:setFontSize(12);
    obj.edit92:setFontColor("red");
    obj.edit92:setField("HPU1");
    obj.edit92:setName("edit92");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.POPUltima1);
    obj.edit93:setLeft(447);
    obj.edit93:setTop(280);
    obj.edit93:setWidth(40);
    obj.edit93:setHeight(20);
    obj.edit93:setTransparent(false);
    obj.edit93:setFontSize(12);
    obj.edit93:setFontColor("red");
    obj.edit93:setField("EtherU1");
    obj.edit93:setName("edit93");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.POPUltima1);
    obj.edit94:setLeft(355);
    obj.edit94:setTop(328);
    obj.edit94:setWidth(40);
    obj.edit94:setHeight(20);
    obj.edit94:setTransparent(false);
    obj.edit94:setFontSize(12);
    obj.edit94:setFontColor("red");
    obj.edit94:setField("DFU1");
    obj.edit94:setName("edit94");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.POPUltima1);
    obj.edit95:setLeft(447);
    obj.edit95:setTop(328);
    obj.edit95:setWidth(40);
    obj.edit95:setHeight(20);
    obj.edit95:setTransparent(false);
    obj.edit95:setFontSize(12);
    obj.edit95:setFontColor("red");
    obj.edit95:setField("DMU1");
    obj.edit95:setName("edit95");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.POPUltima1);
    obj.edit96:setLeft(520);
    obj.edit96:setTop(328);
    obj.edit96:setWidth(40);
    obj.edit96:setHeight(20);
    obj.edit96:setTransparent(false);
    obj.edit96:setFontSize(12);
    obj.edit96:setFontColor("red");
    obj.edit96:setField("DDU1");
    obj.edit96:setName("edit96");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.POPUltima1);
    obj.edit97:setLeft(355);
    obj.edit97:setTop(378);
    obj.edit97:setWidth(40);
    obj.edit97:setHeight(20);
    obj.edit97:setTransparent(false);
    obj.edit97:setFontSize(12);
    obj.edit97:setFontColor("red");
    obj.edit97:setField("ExeU1");
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.POPUltima1);
    obj.edit98:setLeft(447);
    obj.edit98:setTop(378);
    obj.edit98:setWidth(40);
    obj.edit98:setHeight(20);
    obj.edit98:setTransparent(false);
    obj.edit98:setFontSize(12);
    obj.edit98:setFontColor("red");
    obj.edit98:setField("CritU1");
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.POPUltima1);
    obj.edit99:setLeft(520);
    obj.edit99:setTop(378);
    obj.edit99:setWidth(40);
    obj.edit99:setHeight(20);
    obj.edit99:setTransparent(false);
    obj.edit99:setFontSize(12);
    obj.edit99:setFontColor("red");
    obj.edit99:setField("EsqU1");
    obj.edit99:setName("edit99");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.POPUltima1);
    obj.rectangle7:setLeft(426);
    obj.rectangle7:setTop(425);
    obj.rectangle7:setWidth(60);
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("red");
    obj.rectangle7:setStrokeSize(2);
    obj.rectangle7:setName("rectangle7");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.POPUltima1);
    obj.label13:setLeft(430);
    obj.label13:setTop(425);
    obj.label13:setWidth(60);
    obj.label13:setHeight(25);
    obj.label13:setFontSize(15);
    obj.label13:setText("teste");
    obj.label13:setFontColor("white");
    obj.label13:setField("DTotalU1");
    obj.label13:setName("label13");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.scrollBox1);
    obj.edit100:setLeft(470);
    obj.edit100:setTop(410);
    obj.edit100:setFontSize(10);
    obj.edit100:setField("NomeU2");
    obj.edit100:setFontColor("Red");
    obj.edit100:setTransparent(true);
    obj.edit100:setName("edit100");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.scrollBox1);
    obj.button15:setLeft(470);
    obj.button15:setTop(395);
    obj.button15:setWidth(100);
    obj.button15:setHeight(70);
    obj.button15:setOpacity(0.4);
    obj.button15:setText("");
    obj.button15:setName("button15");

    obj.POPUltima2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPUltima2:setParent(obj.scrollBox1);
    obj.POPUltima2:setName("POPUltima2");
    obj.POPUltima2:setVisible(false);
    obj.POPUltima2:setLeft(1);
    obj.POPUltima2:setTop(40);
    obj.POPUltima2:setWidth(620);
    obj.POPUltima2:setHeight(620);

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.POPUltima2);
    obj.image10:setTop(1);
    obj.image10:setWidth(615);
    obj.image10:setHeight(615);
    obj.image10:setSRC("/imagens/2.png");
    obj.image10:setName("image10");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.POPUltima2);
    obj.edit101:setLeft(110);
    obj.edit101:setTop(145);
    obj.edit101:setWidth(120);
    obj.edit101:setHeight(20);
    obj.edit101:setTransparent(false);
    obj.edit101:setFontSize(12);
    obj.edit101:setFontColor("red");
    obj.edit101:setField("NomeU2");
    obj.edit101:setName("edit101");

    obj.U2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.U2:setParent(obj.POPUltima2);
    obj.U2:setLeft(65);
    obj.U2:setTop(230);
    obj.U2:setVisible(true);
    obj.U2:setName("U2");
    obj.U2:setWidth(200);
    obj.U2:setHeight(170);
    obj.U2:setField("DU2");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.POPUltima2);
    obj.button16:setLeft(110);
    obj.button16:setTop(170);
    obj.button16:setFontSize(20);
    obj.button16:setHeight(25);
    obj.button16:setWidth(120);
    obj.button16:setText("Executar");
    obj.button16:setFontColor("White");
    obj.button16:setName("button16");


                       local function ExecutarU2() 
				
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                
														
								function (rolado)
										
										if sheet.RankU2 =="Dano" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU2);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.DTotalU2 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoU2 = mesa.meuJogador:getBarValue(2);
												CustoU2 = CustoU2 - (tonumber(sheet.CustoU2) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoU2);
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										
										else if sheet.RankU2 =="Cura" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU2);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.DTotalU2 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoU2 = mesa.meuJogador:getBarValue(2);
												CustoU2 = CustoU2 - (tonumber(sheet.CustoU2) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoU2);	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");											
											end;
										else if sheet.RankU2 =="Fixo" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU2);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DanoU2 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoU2 = mesa.meuJogador:getBarValue(2);
												CustoU2 = CustoU2 - (tonumber(sheet.CustoU2) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoU2);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.RankU2 =="Passiva" then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU2);
										else if sheet.RankU2 =="Outros" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU2);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalU2 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoU2 = mesa.meuJogador:getBarValue(2);
												CustoU2 = CustoU2 - (tonumber(sheet.CustoU2) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoU2);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
											else if sheet.RankU2=="Buff" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DU2);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalU2 .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoU2 = mesa.meuJogador:getBarValue(2);
												CustoU2 = CustoU2 - (tonumber(sheet.CustoU2) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoU2);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: AÇÃO DE BUFF ");
											end;										
										else if sheet.RankU2 =="" then
											showMessage("Sua Habilidade Precisa ter um tipo");
											end;
										end;
										end;	
										end;
										end;	
										end;
										end;
										
								end);          
                end;          
        


    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.POPUltima2);
    obj.comboBox10:setLeft(420);
    obj.comboBox10:setTop(145);
    obj.comboBox10:setWidth(70);
    obj.comboBox10:setField("RankU2");
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setItems({'Dano', 'Cura', 'Fixo', 'Passiva', 'Buff', 'Outros'});
    obj.comboBox10:setName("comboBox10");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.POPUltima2);
    obj.edit102:setLeft(410);
    obj.edit102:setTop(191);
    obj.edit102:setWidth(40);
    obj.edit102:setHeight(20);
    obj.edit102:setTransparent(false);
    obj.edit102:setFontSize(12);
    obj.edit102:setFontColor("red");
    obj.edit102:setField("DanoU2");
    obj.edit102:setName("edit102");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.POPUltima2);
    obj.edit103:setLeft(510);
    obj.edit103:setTop(191);
    obj.edit103:setWidth(40);
    obj.edit103:setHeight(20);
    obj.edit103:setTransparent(false);
    obj.edit103:setFontSize(12);
    obj.edit103:setFontColor("red");
    obj.edit103:setField("CustoU2");
    obj.edit103:setName("edit103");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.POPUltima2);
    obj.edit104:setLeft(355);
    obj.edit104:setTop(280);
    obj.edit104:setWidth(40);
    obj.edit104:setHeight(20);
    obj.edit104:setTransparent(false);
    obj.edit104:setFontSize(12);
    obj.edit104:setFontColor("red");
    obj.edit104:setField("HPU2");
    obj.edit104:setName("edit104");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.POPUltima2);
    obj.edit105:setLeft(447);
    obj.edit105:setTop(280);
    obj.edit105:setWidth(40);
    obj.edit105:setHeight(20);
    obj.edit105:setTransparent(false);
    obj.edit105:setFontSize(12);
    obj.edit105:setFontColor("red");
    obj.edit105:setField("EtherU2");
    obj.edit105:setName("edit105");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.POPUltima2);
    obj.edit106:setLeft(355);
    obj.edit106:setTop(328);
    obj.edit106:setWidth(40);
    obj.edit106:setHeight(20);
    obj.edit106:setTransparent(false);
    obj.edit106:setFontSize(12);
    obj.edit106:setFontColor("red");
    obj.edit106:setField("DFU2");
    obj.edit106:setName("edit106");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.POPUltima2);
    obj.edit107:setLeft(447);
    obj.edit107:setTop(328);
    obj.edit107:setWidth(40);
    obj.edit107:setHeight(20);
    obj.edit107:setTransparent(false);
    obj.edit107:setFontSize(12);
    obj.edit107:setFontColor("red");
    obj.edit107:setField("DMU2");
    obj.edit107:setName("edit107");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.POPUltima2);
    obj.edit108:setLeft(520);
    obj.edit108:setTop(328);
    obj.edit108:setWidth(40);
    obj.edit108:setHeight(20);
    obj.edit108:setTransparent(false);
    obj.edit108:setFontSize(12);
    obj.edit108:setFontColor("red");
    obj.edit108:setField("DDU2");
    obj.edit108:setName("edit108");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.POPUltima2);
    obj.edit109:setLeft(355);
    obj.edit109:setTop(378);
    obj.edit109:setWidth(40);
    obj.edit109:setHeight(20);
    obj.edit109:setTransparent(false);
    obj.edit109:setFontSize(12);
    obj.edit109:setFontColor("red");
    obj.edit109:setField("ExeU2");
    obj.edit109:setName("edit109");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.POPUltima2);
    obj.edit110:setLeft(447);
    obj.edit110:setTop(378);
    obj.edit110:setWidth(40);
    obj.edit110:setHeight(20);
    obj.edit110:setTransparent(false);
    obj.edit110:setFontSize(12);
    obj.edit110:setFontColor("red");
    obj.edit110:setField("CritU2");
    obj.edit110:setName("edit110");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.POPUltima2);
    obj.edit111:setLeft(520);
    obj.edit111:setTop(378);
    obj.edit111:setWidth(40);
    obj.edit111:setHeight(20);
    obj.edit111:setTransparent(false);
    obj.edit111:setFontSize(12);
    obj.edit111:setFontColor("red");
    obj.edit111:setField("EsqU2");
    obj.edit111:setName("edit111");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.POPUltima2);
    obj.rectangle8:setLeft(426);
    obj.rectangle8:setTop(425);
    obj.rectangle8:setWidth(60);
    obj.rectangle8:setHeight(30);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("red");
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setName("rectangle8");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.POPUltima2);
    obj.label14:setLeft(430);
    obj.label14:setTop(425);
    obj.label14:setWidth(60);
    obj.label14:setHeight(25);
    obj.label14:setFontSize(15);
    obj.label14:setText("teste");
    obj.label14:setFontColor("white");
    obj.label14:setField("DTotalU2");
    obj.label14:setName("label14");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.scrollBox1);
    obj.button17:setLeft(100);
    obj.button17:setTop(535);
    obj.button17:setWidth(80);
    obj.button17:setHeight(70);
    obj.button17:setOpacity(0.9);
    obj.button17:setText("Racial");
    obj.button17:setName("button17");

    obj.POPHRacial = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPHRacial:setParent(obj.scrollBox1);
    obj.POPHRacial:setName("POPHRacial");
    obj.POPHRacial:setVisible(false);
    obj.POPHRacial:setLeft(1);
    obj.POPHRacial:setTop(40);
    obj.POPHRacial:setWidth(620);
    obj.POPHRacial:setHeight(620);

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.POPHRacial);
    obj.image11:setTop(1);
    obj.image11:setWidth(615);
    obj.image11:setHeight(615);
    obj.image11:setSRC("/imagens/2.png");
    obj.image11:setName("image11");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.POPHRacial);
    obj.edit112:setLeft(110);
    obj.edit112:setTop(145);
    obj.edit112:setWidth(120);
    obj.edit112:setHeight(20);
    obj.edit112:setTransparent(false);
    obj.edit112:setFontSize(12);
    obj.edit112:setFontColor("red");
    obj.edit112:setField("NomeHR");
    obj.edit112:setName("edit112");

    obj.HR = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HR:setParent(obj.POPHRacial);
    obj.HR:setLeft(65);
    obj.HR:setTop(230);
    obj.HR:setVisible(true);
    obj.HR:setName("HR");
    obj.HR:setWidth(200);
    obj.HR:setHeight(170);
    obj.HR:setField("DescriHRacial");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.POPHRacial);
    obj.button18:setLeft(110);
    obj.button18:setTop(170);
    obj.button18:setFontSize(20);
    obj.button18:setHeight(25);
    obj.button18:setWidth(120);
    obj.button18:setText("Executar");
    obj.button18:setName("button18");


                 local function ExecutarRacial() 
				
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Habilidade Racial",
                                
														
								function (rolado)
										
										if sheet.RankHRacial =="Dano" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHRacial);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.DTotalHRacial .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoHRacial = mesa.meuJogador:getBarValue(2);
												CustoHRacial = CustoHRacial - (tonumber(sheet.CustoHRacial) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoHRacial);
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										
										else if sheet.RankHRacial =="Cura" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHRacial);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.DTotalHRacial .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoHRacial = mesa.meuJogador:getBarValue(2);
												CustoHRacial = CustoHRacial - (tonumber(sheet.CustoHRacial) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoHRacial);	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");											
											end;
										else if sheet.RankHRacial =="Fixo" then
								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHRacial);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalHRacial .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoHRacial = mesa.meuJogador:getBarValue(2);
												CustoHRacial = CustoHRacial - (tonumber(sheet.CustoHRacial) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoHRacial);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.RankHRacial =="Passiva" then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHRacial);
										else if sheet.RankHRacial =="Outros" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHRacial);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalHRacial .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoHRacial = mesa.meuJogador:getBarValue(2);
												CustoHRacial = CustoHRacial - (tonumber(sheet.CustoHRacial) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoHRacial);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.RankHRacial =="Buff" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHRacial);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalHRacial .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoHRacial = mesa.meuJogador:getBarValue(2);
												CustoHRacial = CustoHRacial - (tonumber(sheet.CustoHRacial) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoHRacial);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: AÇÃO DE BUFF ");
											end;										
										else if sheet.RankHRacial =="" then
											showMessage("Sua Habilidade Precisa ter um tipo");
											end;
										end;	
										end;
										end;	
										end;
										end;
										end;
										
								end);          
                end;      
        


    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.POPHRacial);
    obj.comboBox11:setLeft(420);
    obj.comboBox11:setTop(145);
    obj.comboBox11:setWidth(70);
    obj.comboBox11:setField("RankHRacial");
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setItems({'Dano', 'Cura', 'Fixo', 'Passiva', 'Buff', 'Outros'});
    obj.comboBox11:setName("comboBox11");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.POPHRacial);
    obj.edit113:setLeft(410);
    obj.edit113:setTop(191);
    obj.edit113:setWidth(40);
    obj.edit113:setHeight(20);
    obj.edit113:setTransparent(false);
    obj.edit113:setFontSize(12);
    obj.edit113:setFontColor("red");
    obj.edit113:setField("DanoHRacial");
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.POPHRacial);
    obj.edit114:setLeft(510);
    obj.edit114:setTop(191);
    obj.edit114:setWidth(40);
    obj.edit114:setHeight(20);
    obj.edit114:setTransparent(false);
    obj.edit114:setFontSize(12);
    obj.edit114:setFontColor("red");
    obj.edit114:setField("CustoHRacial");
    obj.edit114:setName("edit114");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.POPHRacial);
    obj.edit115:setLeft(355);
    obj.edit115:setTop(280);
    obj.edit115:setWidth(40);
    obj.edit115:setHeight(20);
    obj.edit115:setTransparent(false);
    obj.edit115:setFontSize(12);
    obj.edit115:setFontColor("red");
    obj.edit115:setField("HPHRacial");
    obj.edit115:setName("edit115");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.POPHRacial);
    obj.edit116:setLeft(447);
    obj.edit116:setTop(280);
    obj.edit116:setWidth(40);
    obj.edit116:setHeight(20);
    obj.edit116:setTransparent(false);
    obj.edit116:setFontSize(12);
    obj.edit116:setFontColor("red");
    obj.edit116:setField("EtherHRacial");
    obj.edit116:setName("edit116");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.POPHRacial);
    obj.edit117:setLeft(355);
    obj.edit117:setTop(328);
    obj.edit117:setWidth(40);
    obj.edit117:setHeight(20);
    obj.edit117:setTransparent(false);
    obj.edit117:setFontSize(12);
    obj.edit117:setFontColor("red");
    obj.edit117:setField("DFHRacial");
    obj.edit117:setName("edit117");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.POPHRacial);
    obj.edit118:setLeft(447);
    obj.edit118:setTop(328);
    obj.edit118:setWidth(40);
    obj.edit118:setHeight(20);
    obj.edit118:setTransparent(false);
    obj.edit118:setFontSize(12);
    obj.edit118:setFontColor("red");
    obj.edit118:setField("DMHRacial");
    obj.edit118:setName("edit118");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.POPHRacial);
    obj.edit119:setLeft(520);
    obj.edit119:setTop(328);
    obj.edit119:setWidth(40);
    obj.edit119:setHeight(20);
    obj.edit119:setTransparent(false);
    obj.edit119:setFontSize(12);
    obj.edit119:setFontColor("red");
    obj.edit119:setField("DDHRacial");
    obj.edit119:setName("edit119");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.POPHRacial);
    obj.edit120:setLeft(355);
    obj.edit120:setTop(378);
    obj.edit120:setWidth(40);
    obj.edit120:setHeight(20);
    obj.edit120:setTransparent(false);
    obj.edit120:setFontSize(12);
    obj.edit120:setFontColor("red");
    obj.edit120:setField("ExeHRacial");
    obj.edit120:setName("edit120");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.POPHRacial);
    obj.edit121:setLeft(447);
    obj.edit121:setTop(378);
    obj.edit121:setWidth(40);
    obj.edit121:setHeight(20);
    obj.edit121:setTransparent(false);
    obj.edit121:setFontSize(12);
    obj.edit121:setFontColor("red");
    obj.edit121:setField("CritHRacial");
    obj.edit121:setName("edit121");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.POPHRacial);
    obj.edit122:setLeft(520);
    obj.edit122:setTop(378);
    obj.edit122:setWidth(40);
    obj.edit122:setHeight(20);
    obj.edit122:setTransparent(false);
    obj.edit122:setFontSize(12);
    obj.edit122:setFontColor("red");
    obj.edit122:setField("EsqHRacial");
    obj.edit122:setName("edit122");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.POPHRacial);
    obj.rectangle9:setLeft(426);
    obj.rectangle9:setTop(425);
    obj.rectangle9:setWidth(60);
    obj.rectangle9:setHeight(30);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("red");
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setName("rectangle9");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.POPHRacial);
    obj.label15:setLeft(430);
    obj.label15:setTop(425);
    obj.label15:setWidth(60);
    obj.label15:setHeight(25);
    obj.label15:setFontSize(15);
    obj.label15:setText("teste");
    obj.label15:setFontColor("white");
    obj.label15:setField("DTotalHRacial");
    obj.label15:setName("label15");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.scrollBox1);
    obj.button19:setLeft(190);
    obj.button19:setTop(535);
    obj.button19:setWidth(80);
    obj.button19:setHeight(70);
    obj.button19:setOpacity(0.9);
    obj.button19:setText("Basica");
    obj.button19:setName("button19");

    obj.POPHBasica = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPHBasica:setParent(obj.scrollBox1);
    obj.POPHBasica:setName("POPHBasica");
    obj.POPHBasica:setVisible(false);
    obj.POPHBasica:setLeft(1);
    obj.POPHBasica:setTop(40);
    obj.POPHBasica:setWidth(620);
    obj.POPHBasica:setHeight(620);

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.POPHBasica);
    obj.image12:setTop(1);
    obj.image12:setWidth(615);
    obj.image12:setHeight(615);
    obj.image12:setSRC("/imagens/2.png");
    obj.image12:setName("image12");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.POPHBasica);
    obj.edit123:setLeft(110);
    obj.edit123:setTop(145);
    obj.edit123:setWidth(120);
    obj.edit123:setHeight(20);
    obj.edit123:setTransparent(false);
    obj.edit123:setFontSize(12);
    obj.edit123:setFontColor("red");
    obj.edit123:setField("NomeHB");
    obj.edit123:setName("edit123");

    obj.HBasica = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HBasica:setParent(obj.POPHBasica);
    obj.HBasica:setLeft(65);
    obj.HBasica:setTop(230);
    obj.HBasica:setVisible(true);
    obj.HBasica:setName("HBasica");
    obj.HBasica:setWidth(200);
    obj.HBasica:setHeight(170);
    obj.HBasica:setField("DescriHB");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.POPHBasica);
    obj.button20:setLeft(110);
    obj.button20:setTop(170);
    obj.button20:setFontSize(20);
    obj.button20:setHeight(25);
    obj.button20:setWidth(120);
    obj.button20:setText("Executar");
    obj.button20:setFontColor("White");
    obj.button20:setName("button20");


                 local function ExecutarHBasica() 
				
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        

                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Habilidade Racial",
                                
														
								function (rolado)
										
										if sheet.RankHBasica =="Dano" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHB);
												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Causando « " .. sheet.DTotalHB .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoHB = mesa.meuJogador:getBarValue(2);
												CustoHB = CustoHB - (tonumber(sheet.CustoHB) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoHB);
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										
										else if sheet.RankHBasica =="Cura" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHB);
												mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « " .. sheet.DTotalHB .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoHB = mesa.meuJogador:getBarValue(2);
												CustoHB = CustoHB - (tonumber(sheet.CustoHB) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoHB);	
											else
												mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");											
											end;
										else if sheet.RankHBasica =="Fixo" then
								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHB);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalHB .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoHB = mesa.meuJogador:getBarValue(2);
												CustoHB = CustoHB - (tonumber(sheet.CustoHB) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoHB);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.RankHBasica =="Passiva" then
												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHB);
										else if sheet.RankHBasica =="Outros" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHB);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalHB .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoHB = mesa.meuJogador:getBarValue(2);
												CustoHB = CustoHB - (tonumber(sheet.CustoHB) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoHB);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
											end;
										else if sheet.RankHBasica =="Buff" then								
											if sheet.Execucao >= rolado.resultado then
                                                mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriHB);
												mesaDoPersonagem.chat:enviarMensagem("[§K2,0]Com instendidade de « " .. sheet.DTotalHB .. " »");
												local mesa = Firecast.getMesaDe(sheet); 
												local CustoHB = mesa.meuJogador:getBarValue(2);
												CustoHB = CustoHB - (tonumber(sheet.CustoHB) or 0);
												mesa.meuJogador:requestSetBarValue(2, CustoHB);	
											else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: AÇÃO DE BUFF ");
											end;										
										else if sheet.RankHBasica =="" then
											showMessage("Sua Habilidade Precisa ter um tipo");
											end;
										end;	
										end;
										end;	
										end;
										end;
										end;
										
								end);          
                end;      
        


    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.POPHBasica);
    obj.comboBox12:setLeft(420);
    obj.comboBox12:setTop(145);
    obj.comboBox12:setWidth(70);
    obj.comboBox12:setField("RankHBasica");
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setItems({'Dano', 'Cura', 'Fixo', 'Passiva', 'Buff', 'Outros'});
    obj.comboBox12:setName("comboBox12");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.POPHBasica);
    obj.edit124:setLeft(410);
    obj.edit124:setTop(191);
    obj.edit124:setWidth(40);
    obj.edit124:setHeight(20);
    obj.edit124:setTransparent(false);
    obj.edit124:setFontSize(12);
    obj.edit124:setFontColor("red");
    obj.edit124:setField("DanoHB");
    obj.edit124:setName("edit124");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.POPHBasica);
    obj.edit125:setLeft(510);
    obj.edit125:setTop(191);
    obj.edit125:setWidth(40);
    obj.edit125:setHeight(20);
    obj.edit125:setTransparent(false);
    obj.edit125:setFontSize(12);
    obj.edit125:setFontColor("red");
    obj.edit125:setField("CustoHB");
    obj.edit125:setName("edit125");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.POPHBasica);
    obj.edit126:setLeft(355);
    obj.edit126:setTop(280);
    obj.edit126:setWidth(40);
    obj.edit126:setHeight(20);
    obj.edit126:setTransparent(false);
    obj.edit126:setFontSize(12);
    obj.edit126:setFontColor("red");
    obj.edit126:setField("HPHB");
    obj.edit126:setName("edit126");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.POPHBasica);
    obj.edit127:setLeft(447);
    obj.edit127:setTop(280);
    obj.edit127:setWidth(40);
    obj.edit127:setHeight(20);
    obj.edit127:setTransparent(false);
    obj.edit127:setFontSize(12);
    obj.edit127:setFontColor("red");
    obj.edit127:setField("EtherHB");
    obj.edit127:setName("edit127");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.POPHBasica);
    obj.edit128:setLeft(355);
    obj.edit128:setTop(328);
    obj.edit128:setWidth(40);
    obj.edit128:setHeight(20);
    obj.edit128:setTransparent(false);
    obj.edit128:setFontSize(12);
    obj.edit128:setFontColor("red");
    obj.edit128:setField("DFHB");
    obj.edit128:setName("edit128");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.POPHBasica);
    obj.edit129:setLeft(447);
    obj.edit129:setTop(328);
    obj.edit129:setWidth(40);
    obj.edit129:setHeight(20);
    obj.edit129:setTransparent(false);
    obj.edit129:setFontSize(12);
    obj.edit129:setFontColor("red");
    obj.edit129:setField("DMHB");
    obj.edit129:setName("edit129");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.POPHBasica);
    obj.edit130:setLeft(520);
    obj.edit130:setTop(328);
    obj.edit130:setWidth(40);
    obj.edit130:setHeight(20);
    obj.edit130:setTransparent(false);
    obj.edit130:setFontSize(12);
    obj.edit130:setFontColor("red");
    obj.edit130:setField("DDHB");
    obj.edit130:setName("edit130");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.POPHBasica);
    obj.edit131:setLeft(355);
    obj.edit131:setTop(378);
    obj.edit131:setWidth(40);
    obj.edit131:setHeight(20);
    obj.edit131:setTransparent(false);
    obj.edit131:setFontSize(12);
    obj.edit131:setFontColor("red");
    obj.edit131:setField("ExeHB");
    obj.edit131:setName("edit131");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.POPHBasica);
    obj.edit132:setLeft(447);
    obj.edit132:setTop(378);
    obj.edit132:setWidth(40);
    obj.edit132:setHeight(20);
    obj.edit132:setTransparent(false);
    obj.edit132:setFontSize(12);
    obj.edit132:setFontColor("red");
    obj.edit132:setField("CritHB");
    obj.edit132:setName("edit132");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.POPHBasica);
    obj.edit133:setLeft(520);
    obj.edit133:setTop(378);
    obj.edit133:setWidth(40);
    obj.edit133:setHeight(20);
    obj.edit133:setTransparent(false);
    obj.edit133:setFontSize(12);
    obj.edit133:setFontColor("red");
    obj.edit133:setField("EsqHB");
    obj.edit133:setName("edit133");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.POPHBasica);
    obj.rectangle10:setLeft(426);
    obj.rectangle10:setTop(425);
    obj.rectangle10:setWidth(60);
    obj.rectangle10:setHeight(30);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("red");
    obj.rectangle10:setStrokeSize(2);
    obj.rectangle10:setName("rectangle10");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.POPHBasica);
    obj.label16:setLeft(430);
    obj.label16:setTop(425);
    obj.label16:setWidth(60);
    obj.label16:setHeight(25);
    obj.label16:setFontSize(15);
    obj.label16:setText("teste");
    obj.label16:setFontColor("white");
    obj.label16:setField("DTotalHB");
    obj.label16:setName("label16");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.scrollBox1);
    obj.button21:setLeft(350);
    obj.button21:setTop(535);
    obj.button21:setWidth(80);
    obj.button21:setHeight(80);
    obj.button21:setOpacity(0.1);
    obj.button21:setText("");
    obj.button21:setName("button21");

    obj.POPArma = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPArma:setParent(obj.scrollBox1);
    obj.POPArma:setName("POPArma");
    obj.POPArma:setVisible(false);
    obj.POPArma:setLeft(1);
    obj.POPArma:setTop(40);
    obj.POPArma:setWidth(620);
    obj.POPArma:setHeight(620);

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.POPArma);
    obj.image13:setTop(1);
    obj.image13:setWidth(615);
    obj.image13:setHeight(615);
    obj.image13:setSRC("/imagens/3.png");
    obj.image13:setName("image13");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.POPArma);
    obj.edit134:setLeft(170);
    obj.edit134:setTop(295);
    obj.edit134:setWidth(80);
    obj.edit134:setHeight(30);
    obj.edit134:setTransparent(false);
    obj.edit134:setFontSize(18);
    obj.edit134:setFontColor("red");
    obj.edit134:setField("DFArma");
    obj.edit134:setName("edit134");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.POPArma);
    obj.edit135:setLeft(425);
    obj.edit135:setTop(295);
    obj.edit135:setWidth(70);
    obj.edit135:setHeight(30);
    obj.edit135:setTransparent(false);
    obj.edit135:setFontSize(18);
    obj.edit135:setFontColor("red");
    obj.edit135:setField("ExecuçaoArma");
    obj.edit135:setName("edit135");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.POPArma);
    obj.edit136:setLeft(170);
    obj.edit136:setTop(370);
    obj.edit136:setWidth(80);
    obj.edit136:setHeight(30);
    obj.edit136:setTransparent(false);
    obj.edit136:setFontSize(18);
    obj.edit136:setFontColor("red");
    obj.edit136:setField("DMArma");
    obj.edit136:setName("edit136");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.POPArma);
    obj.edit137:setLeft(425);
    obj.edit137:setTop(370);
    obj.edit137:setWidth(70);
    obj.edit137:setHeight(30);
    obj.edit137:setTransparent(false);
    obj.edit137:setFontSize(18);
    obj.edit137:setFontColor("red");
    obj.edit137:setField("CriticalArma");
    obj.edit137:setName("edit137");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.POPArma);
    obj.edit138:setLeft(170);
    obj.edit138:setTop(445);
    obj.edit138:setWidth(80);
    obj.edit138:setHeight(30);
    obj.edit138:setTransparent(false);
    obj.edit138:setFontSize(18);
    obj.edit138:setFontColor("red");
    obj.edit138:setField("DDArma");
    obj.edit138:setName("edit138");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.scrollBox1);
    obj.button22:setLeft(435);
    obj.button22:setTop(535);
    obj.button22:setWidth(85);
    obj.button22:setHeight(80);
    obj.button22:setOpacity(0.1);
    obj.button22:setText("");
    obj.button22:setName("button22");

    obj.POPArmadura = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPArmadura:setParent(obj.scrollBox1);
    obj.POPArmadura:setName("POPArmadura");
    obj.POPArmadura:setVisible(false);
    obj.POPArmadura:setLeft(1);
    obj.POPArmadura:setTop(40);
    obj.POPArmadura:setWidth(620);
    obj.POPArmadura:setHeight(620);

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.POPArmadura);
    obj.image14:setTop(1);
    obj.image14:setWidth(615);
    obj.image14:setHeight(615);
    obj.image14:setSRC("/imagens/4.png");
    obj.image14:setName("image14");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.POPArmadura);
    obj.edit139:setLeft(8);
    obj.edit139:setTop(350);
    obj.edit139:setWidth(100);
    obj.edit139:setHeight(40);
    obj.edit139:setTransparent(false);
    obj.edit139:setFontSize(24);
    obj.edit139:setFontColor("red");
    obj.edit139:setField("HPAmuleto");
    obj.edit139:setName("edit139");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.POPArmadura);
    obj.edit140:setLeft(485);
    obj.edit140:setTop(350);
    obj.edit140:setWidth(100);
    obj.edit140:setHeight(40);
    obj.edit140:setTransparent(false);
    obj.edit140:setFontSize(24);
    obj.edit140:setFontColor("red");
    obj.edit140:setField("EtherAmuleto");
    obj.edit140:setName("edit140");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.POPArmadura);
    obj.edit141:setLeft(8);
    obj.edit141:setTop(510);
    obj.edit141:setWidth(100);
    obj.edit141:setHeight(40);
    obj.edit141:setTransparent(false);
    obj.edit141:setFontSize(24);
    obj.edit141:setFontColor("red");
    obj.edit141:setField("EsquivaAmuleto");
    obj.edit141:setName("edit141");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.POPArmadura);
    obj.edit142:setLeft(485);
    obj.edit142:setTop(510);
    obj.edit142:setWidth(100);
    obj.edit142:setHeight(40);
    obj.edit142:setTransparent(false);
    obj.edit142:setFontSize(24);
    obj.edit142:setFontColor("red");
    obj.edit142:setField("DefesaAmuleto");
    obj.edit142:setName("edit142");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.scrollBox1);
    obj.button23:setLeft(480);
    obj.button23:setTop(678);
    obj.button23:setWidth(80);
    obj.button23:setHeight(70);
    obj.button23:setOpacity(0.1);
    obj.button23:setText("");
    obj.button23:setName("button23");

    obj.POPHistoria = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPHistoria:setParent(obj.scrollBox1);
    obj.POPHistoria:setName("POPHistoria");
    obj.POPHistoria:setVisible(false);
    obj.POPHistoria:setLeft(1);
    obj.POPHistoria:setTop(40);
    obj.POPHistoria:setWidth(620);
    obj.POPHistoria:setHeight(620);

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.POPHistoria);
    obj.image15:setTop(1);
    obj.image15:setWidth(615);
    obj.image15:setHeight(615);
    obj.image15:setSRC("/imagens/6.png");
    obj.image15:setName("image15");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.POPHistoria);
    obj.richEdit1:setTop(170);
    obj.richEdit1:setLeft(120);
    obj.richEdit1:setWidth(400);
    obj.richEdit1:setHeight(280);
    obj.richEdit1:setField("Historia");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#00000000");
    obj.richEdit1:setName("richEdit1");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.scrollBox1);
    obj.button24:setLeft(40);
    obj.button24:setTop(675);
    obj.button24:setWidth(80);
    obj.button24:setHeight(79);
    obj.button24:setOpacity(0.2);
    obj.button24:setText("");
    obj.button24:setName("button24");

    obj.POPBolsa = GUI.fromHandle(_obj_newObject("popup"));
    obj.POPBolsa:setParent(obj.scrollBox1);
    obj.POPBolsa:setName("POPBolsa");
    obj.POPBolsa:setVisible(false);
    obj.POPBolsa:setLeft(1);
    obj.POPBolsa:setTop(40);
    obj.POPBolsa:setWidth(620);
    obj.POPBolsa:setHeight(620);

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.POPBolsa);
    obj.image16:setLeft(10);
    obj.image16:setTop(10);
    obj.image16:setWidth(600);
    obj.image16:setHeight(600);
    obj.image16:setSRC("/imagens/5.png");
    obj.image16:setName("image16");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.POPBolsa);
    obj.button25:setText("Novo Espaço");
    obj.button25:setWidth(150);
    obj.button25:setHeight(30);
    obj.button25:setTop(20);
    obj.button25:setLeft(10);
    obj.button25:setName("button25");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.POPBolsa);
    obj.layout1:setTop(60);
    obj.layout1:setLeft(10);
    obj.layout1:setWidth(200);
    obj.layout1:setHeight(550);
    obj.layout1:setMargins({bottom=4});
    obj.layout1:setName("layout1");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.layout1);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmItemDaLista");
    obj.rclListaDosItens:setAlign("client");
    obj.rclListaDosItens:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.POPBolsa);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setTop(210);
    obj.boxDetalhesDoItem:setLeft(210);
    obj.boxDetalhesDoItem:setWidth(400);
    obj.boxDetalhesDoItem:setHeight(300);

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.boxDetalhesDoItem);
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setHeight(180);
    obj.rectangle11:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle11:setName("rectangle11");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle11);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(35);
    obj.layout2:setMargins({bottom=4});
    obj.layout2:setName("layout2");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setLeft(10);
    obj.label17:setTop(10);
    obj.label17:setText("Nome do Item:");
    obj.label17:setAutoSize(true);
    obj.label17:setName("label17");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout2);
    obj.edit143:setWidth(150);
    obj.edit143:setHeight(25);
    obj.edit143:setLeft(120);
    obj.edit143:setTop(7);
    obj.edit143:setField("NomedoItem");
    obj.edit143:setName("edit143");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout2);
    obj.button26:setTop(7);
    obj.button26:setLeft(282);
    obj.button26:setText("Apagar!");
    obj.button26:setWidth(80);
    obj.button26:setHeight(25);
    obj.button26:setName("button26");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle11);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(130);
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("client");
    obj.layout4:setMargins({left=2});
    obj.layout4:setName("layout4");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout4);
    obj.textEditor1:setTop(5);
    obj.textEditor1:setWidth(350);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setField("campoTextoGrande");
    obj.textEditor1:setHeight(120);
    obj.textEditor1:setName("textEditor1");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.scrollBox1);
    obj.edit144:setLeft(340);
    obj.edit144:setTop(725);
    obj.edit144:setWidth(75);
    obj.edit144:setHeight(30);
    obj.edit144:setType("number");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setTransparent(true);
    obj.edit144:setFontSize(18);
    obj.edit144:setFontColor("Gold");
    obj.edit144:setField("Gaies");
    obj.edit144:setName("edit144");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.scrollBox1);
    obj.button27:setLeft(258);
    obj.button27:setTop(334);
    obj.button27:setText("calculaveis");
    obj.button27:setWidth(100);
    obj.button27:setHeight(18);
    obj.button27:setOpacity(1.0);
    obj.button27:setName("button27");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'DanoH1', 'DanoH2', 'DanoH3', 'DanoH4', 'DanoH5', 'DanoH6', 'DanoU1', 'DanoU2', 'DanoHB', 'DanoHRacial'});
    obj.dataLink1:setName("dataLink1");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.scrollBox1);
    obj.button28:setLeft(190);
    obj.button28:setTop(695);
    obj.button28:setWidth(105);
    obj.button28:setHeight(30);
    obj.button28:setFontSize(12);
    obj.button28:setFontColor("Gold");
    obj.button28:setText("Ataque Basico");
    obj.button28:setName("button28");


                local function AtaqueBasico()      
					
                        -- obter a mesa do personagem
                        local mesaDoPersonagem = rrpg.getMesaDe(sheet);        
						

                        -- se o usuário não preencheu modificador, vamos usar o valor 0
                        sheet.Acerto = sheet.Acerto or 0;                        

                        mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acerto, "[§K2]Ataque Basico",

                                function (rolado)
                                end);     
				end;  

		   
        


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.POPHabilidade1:show();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            ExecutarH1()
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            self.POPHabilidade2:show();
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            ExecutarH2()
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            self.POPHabilidade3:show();
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            ExecutarH3()
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            self.POPHabilidade4:show();
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            ExecutarH4()
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            self.POPHabilidade5:show();
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            ExecutarH5()
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            self.POPHabilidade6:show();
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            ExecutarH6()
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (_)
            self.POPUltima1:show();
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (_)
            ExecutarU1()
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (_)
            self.POPUltima2:show();
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (_)
            ExecutarU2()
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (_)
            self.POPHRacial:show();
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (_)
            ExecutarRacial()
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (_)
            self.POPHBasica:show();
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (_)
            ExecutarHBasica()
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (_)
            self.POPArma:show();
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (_)
            self.POPArmadura:show();
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (_)
            self.POPHistoria:show();
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (_)
            self.POPBolsa:show();
        end, obj);

    obj._e_event24 = obj.button25:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclListaDosItens:append();
        end, obj);

    obj._e_event25 = obj.rclListaDosItens:addEventListener("onEndEnumeration",
        function (_)
            if self.rclListaDosItens.selectedNode == nil and sheet ~= nil then
                            local nodes = ndb.getChildNodes(sheet.campoDosItens);               
            
                            if #nodes > 0 then
                                    self.rclListaDosItens.selectedNode = nodes[1];
                            end;
            				end;
        end, obj);

    obj._e_event26 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            --[[
                                    Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                              --]]                      
                              local node = self.rclListaDosItens.selectedNode;  
                                     self.boxDetalhesDoItem.node = node;                       
                              -- a caixa de detalhe só ficará visível se houver item selecionado
                                      self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event27 = obj.button26:addEventListener("onClick",
        function (_)
            NDB.deleteNode(self.boxDetalhesDoItem.node);
        end, obj);

    obj._e_event28 = obj.button27:addEventListener("onClick",
        function (_)
            sheet.DF = (tonumber(sheet.Forca) or 0) *2 + (tonumber(sheet.DFArma) or 0) + (tonumber(sheet.DFH1) or 0) + (tonumber(sheet.DFH2) or 0) + (tonumber(sheet.DFH3) or 0) +
            		(tonumber(sheet.DFH4) or 0) + (tonumber(sheet.DFH5) or 0) + (tonumber(sheet.DFH6) or 0) + (tonumber(sheet.DFHRacial) or 0) + (tonumber(sheet.DFHB) or 0) + (tonumber(sheet.DFU1) or 0) + (tonumber(sheet.DFU2) or 0); 
            		sheet.DM = (tonumber(sheet.Mentalidade) or 0) *2 + (tonumber(sheet.DMArma) or 0) + (tonumber(sheet.DMH1) or 0) + (tonumber(sheet.DMH2) or 0) + (tonumber(sheet.DMH3) or 0) +
            		(tonumber(sheet.DMH4) or 0) + (tonumber(sheet.DMH5) or 0) + (tonumber(sheet.DMH6) or 0) + (tonumber(sheet.DMHRacial) or 0) + (tonumber(sheet.DMHB) or 0) + (tonumber(sheet.DMU1) or 0) + (tonumber(sheet.DMU2) or 0); 
            		sheet.DD = (tonumber(sheet.Destreza) or 0) *2 + (tonumber(sheet.DDArma) or 0) + (tonumber(sheet.DDH1) or 0) + (tonumber(sheet.DDH2) or 0) + (tonumber(sheet.DDH3) or 0) +
            		(tonumber(sheet.DDH4) or 0) + (tonumber(sheet.DDH5) or 0) + (tonumber(sheet.DDH6) or 0) + (tonumber(sheet.DDHRacial) or 0) + (tonumber(sheet.DDHB) or 0) + (tonumber(sheet.DDU1) or 0) + (tonumber(sheet.DDU2) or 0); 
            		
            		sheet.Defesa = (tonumber(sheet.DefesaAmuleto) or 0) + (tonumber(sheet.Forca) or 0) /2;
            		
            		
             
            		if sheet.Classe == 'Shisu' then
            		sheet.HPdaClasse = (tonumber(sheet.Level) or 0) * 200 +  (tonumber(sheet.HPAmuleto) or 0) + (tonumber(sheet.HPH1) or 0) + (tonumber(sheet.HPH2) or 0) + (tonumber(sheet.HPH3) or 0) + 1000 + 500 +
            		(tonumber(sheet.HPH4) or 0) + (tonumber(sheet.HPH5) or 0) + (tonumber(sheet.HPH6) or 0) + (tonumber(sheet.HPHRacial) or 0) + (tonumber(sheet.HPHB) or 0) + (tonumber(sheet.HPU1) or 0) + (tonumber(sheet.HPU2) or 0);
            		else if sheet.Classe == 'Mahou' then
            		sheet.HPdaClasse = (tonumber(sheet.Level) or 0) * 160 +  (tonumber(sheet.HPAmuleto) or 0) + (tonumber(sheet.HPH1) or 0) + (tonumber(sheet.HPH2) or 0) + (tonumber(sheet.HPH3) or 0) + 800 + 500 +
            		(tonumber(sheet.HPH4) or 0) + (tonumber(sheet.HPH5) or 0) + (tonumber(sheet.HPH6) or 0) + (tonumber(sheet.HPHRacial) or 0) + (tonumber(sheet.HPHB) or 0) + (tonumber(sheet.HPU1) or 0) + (tonumber(sheet.HPU2) or 0);
            		else
            		showMessage("Escolha uma Classe Cuzão!");
            		end
            		end
            		        
             
            		if sheet.Classe == 'Shisu' then
            		if sheet.level > 29 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 21000 ;
            		else if sheet.level > 21 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 15000 ;
            		else if sheet.level > 17 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 10000 ;
            		else if sheet.level > 14 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 6000 ;
            		else if sheet.level > 11 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 3000 ;
            		else if sheet.level > 4 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 3000 ;
            		else
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 1000 ;
            		end
            		end
            		end
            		end
            		end
            		end
            		end
            						        
             
            		if sheet.Classe == 'Mahou' then
            		if sheet.level > 29 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 21000 ;
            		else if sheet.level > 21 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 15000 ;
            		else if sheet.level > 17 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 10000 ;
            		else if sheet.level > 14 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 6000 ;
            		else if sheet.level > 9 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 3000 ;
            		else if sheet.level > 4 then
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 3000 ;
            		else
            		sheet.HP = (tonumber(sheet.HPdaClasse) or 0) + 1000 ;
            		end
            		end
            		end
            		end
            		end
            		end
            		end
            						        
             
            		if sheet.Classe == 'Shisu' then
            		sheet.EtherdaClasse = (tonumber(sheet.Level) or 0) * 3 + (tonumber(sheet.EtherAmuleto) or 0) + (tonumber(sheet.EtherH1) or 0) + (tonumber(sheet.EtherH2) or 0) + (tonumber(sheet.EtherH3) or 0) + 100 + (tonumber(sheet.Mentalidade) or 0) /20 +
            		(tonumber(sheet.EtherH4) or 0) + (tonumber(sheet.EtherH5) or 0) + (tonumber(sheet.EtherH6) or 0) + (tonumber(sheet.EtherHRacial) or 0) + (tonumber(sheet.EtherHB) or 0) + (tonumber(sheet.EtherU1) or 0) + (tonumber(sheet.EtherU2) or 0);
            		else if sheet.Classe == 'Mahou' then
            		sheet.EtherdaClasse = (tonumber(sheet.Level) or 0) * 4 + (tonumber(sheet.EtherAmuleto) or 0) + (tonumber(sheet.EtherH1) or 0) + (tonumber(sheet.EtherH2) or 0) + (tonumber(sheet.EtherH3) or 0) + 120 + (tonumber(sheet.Mentalidade) or 0) /20 +
            		(tonumber(sheet.EtherH4) or 0) + (tonumber(sheet.EtherH5) or 0) + (tonumber(sheet.EtherH6) or 0) + (tonumber(sheet.EtherHRacial) or 0) + (tonumber(sheet.EtherHB) or 0) + (tonumber(sheet.EtherU1) or 0) + (tonumber(sheet.EtherU2) or 0);
            		else
            		showMessage("Escolha uma Classe Cuzão!");
            		end
            		end
            		        
             
            		if sheet.Classe == 'Shisu' then
            		if sheet.level > 29 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 105 ;
            		else if sheet.level > 21 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 75 ;
            		else if sheet.level > 17 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 50 ;
            		else if sheet.level > 14 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 30 ;
            		else if sheet.level > 9 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 15 ;
            		else if sheet.level > 4 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 15 ;
            		else
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 5 ;
            		end
            		end
            		end
            		end
            		end
            		end
            		end
            						        
             
            		if sheet.Classe == 'Mahou' then
            		if sheet.level > 29 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 105 ;
            		else if sheet.level > 21 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 75 ;
            		else if sheet.level > 17 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 50 ;
            		else if sheet.level > 14 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 30 ;
            		else if sheet.level > 9 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 15 ;
            		else if sheet.level > 4 then
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 15 ;
            		else
            		sheet.Ether = (tonumber(sheet.EtherdaClasse) or 0) + 5 ;
            		end
            		end
            		end
            		end
            		end
            		end
            		end
        end, obj);

    obj._e_event29 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Classe == 'Shisu' then
            		sheet.DTotalH1 = (tonumber(sheet.DanoH1) or 0) +  (tonumber(sheet.DF) or 0);
            		sheet.DTotalH2 = (tonumber(sheet.DanoH2) or 0) +  (tonumber(sheet.DF) or 0);
            		sheet.DTotalH3 = (tonumber(sheet.DanoH3) or 0) +  (tonumber(sheet.DF) or 0);
            		sheet.DTotalH4 = (tonumber(sheet.DanoH4) or 0) +  (tonumber(sheet.DF) or 0);
            		sheet.DTotalH5 = (tonumber(sheet.DanoH5) or 0) +  (tonumber(sheet.DF) or 0);
            		sheet.DTotalH6 = (tonumber(sheet.DanoH6) or 0) +  (tonumber(sheet.DF) or 0);
            		sheet.DTotalU1 = (tonumber(sheet.DanoU1) or 0) +  (tonumber(sheet.DF) or 0);
            		sheet.DTotalU2 = (tonumber(sheet.DanoU2) or 0) +  (tonumber(sheet.DF) or 0);
            		sheet.DTotalHRacial = (tonumber(sheet.DanoHRacial) or 0) +  (tonumber(sheet.DF) or 0);
            		sheet.DTotalHB = (tonumber(sheet.DanoHB) or 0) +  (tonumber(sheet.DF) or 0);
            																				
            		else if sheet.Classe == 'Mahou' then
            		sheet.DTotalH1 = (tonumber(sheet.DanoH1) or 0) +  (tonumber(sheet.DM) or 0);
            		sheet.DTotalH2 = (tonumber(sheet.DanoH2) or 0) +  (tonumber(sheet.DM) or 0);
            		sheet.DTotalH3 = (tonumber(sheet.DanoH3) or 0) +  (tonumber(sheet.DM) or 0);
            		sheet.DTotalH4 = (tonumber(sheet.DanoH4) or 0) +  (tonumber(sheet.DM) or 0);
            		sheet.DTotalH5 = (tonumber(sheet.DanoH5) or 0) +  (tonumber(sheet.DM) or 0);
            		sheet.DTotalH6 = (tonumber(sheet.DanoH6) or 0) +  (tonumber(sheet.DM) or 0);
            		sheet.DTotalU1 = (tonumber(sheet.DanoU1) or 0) +  (tonumber(sheet.DM) or 0);
            		sheet.DTotalU2 = (tonumber(sheet.DanoU2) or 0) +  (tonumber(sheet.DM) or 0);
            		sheet.DTotalHRacial = (tonumber(sheet.DanoHRacial) or 0) +  (tonumber(sheet.DM) or 0);
            		sheet.DTotalHB = (tonumber(sheet.DanoHB) or 0) +  (tonumber(sheet.DM) or 0);
            		else
            		showMessage("Escolha uma Classe Cuzão!");
            		end
            		end
        end, obj);

    obj._e_event30 = obj.button28:addEventListener("onClick",
        function (_)
            AtaqueBasico()
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.POPHabilidade1 ~= nil then self.POPHabilidade1:destroy(); self.POPHabilidade1 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.POPUltima2 ~= nil then self.POPUltima2:destroy(); self.POPUltima2 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.U1 ~= nil then self.U1:destroy(); self.U1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.POPBolsa ~= nil then self.POPBolsa:destroy(); self.POPBolsa = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.H4 ~= nil then self.H4:destroy(); self.H4 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.POPArma ~= nil then self.POPArma:destroy(); self.POPArma = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.POPHabilidade2 ~= nil then self.POPHabilidade2:destroy(); self.POPHabilidade2 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.POPHBasica ~= nil then self.POPHBasica:destroy(); self.POPHBasica = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.H1 ~= nil then self.H1:destroy(); self.H1 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.POPUltima1 ~= nil then self.POPUltima1:destroy(); self.POPUltima1 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.HBasica ~= nil then self.HBasica:destroy(); self.HBasica = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.POPHRacial ~= nil then self.POPHRacial:destroy(); self.POPHRacial = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.H6 ~= nil then self.H6:destroy(); self.H6 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.POPHistoria ~= nil then self.POPHistoria:destroy(); self.POPHistoria = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.POPHabilidade4 ~= nil then self.POPHabilidade4:destroy(); self.POPHabilidade4 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.H5 ~= nil then self.H5:destroy(); self.H5 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.H2 ~= nil then self.H2:destroy(); self.H2 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.H3 ~= nil then self.H3:destroy(); self.H3 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.POPHabilidade3 ~= nil then self.POPHabilidade3:destroy(); self.POPHabilidade3 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.POPHabilidade5 ~= nil then self.POPHabilidade5:destroy(); self.POPHabilidade5 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.POPArmadura ~= nil then self.POPArmadura:destroy(); self.POPArmadura = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.HR ~= nil then self.HR:destroy(); self.HR = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.U2 ~= nil then self.U2:destroy(); self.U2 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.POPHabilidade6 ~= nil then self.POPHabilidade6:destroy(); self.POPHabilidade6 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGaia()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGaia();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGaia = {
    newEditor = newfrmGaia, 
    new = newfrmGaia, 
    name = "frmGaia", 
    dataType = "com.Gaia4", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Gaia 4", 
    description=""};

frmGaia = _frmGaia;
Firecast.registrarForm(_frmGaia);
Firecast.registrarDataType(_frmGaia);

return _frmGaia;
