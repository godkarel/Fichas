require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmpersonagem()
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
    obj:setName("frmpersonagem");
    obj:setWidth(650);
    obj:setHeight(920);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setWidth(620);
    obj.image1:setHeight(920);
    obj.image1:setCenter(true);
    obj.image1:setSRC("/imagens/4.png");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setField("imagemDoPersonagem");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(335);
    obj.image2:setTop(85);
    obj.image2:setWidth(220);
    obj.image2:setHeight(250);
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setTop(-40);
    obj.image3:setLeft(230);
    obj.image3:setWidth(410);
    obj.image3:setHeight(500);
    obj.image3:setCenter(true);
    obj.image3:setSRC("/imagens/99.png");
    obj.image3:setName("image3");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(117);
    obj.rectangle1:setTop(440);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setWidth(35);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(120);
    obj.label1:setTop(435);
    obj.label1:setWidth(150);
    obj.label1:setHeight(30);
    obj.label1:setField("HPRACAATE20");
    obj.label1:setName("label1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(117);
    obj.rectangle2:setTop(465);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setWidth(35);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setLeft(120);
    obj.label2:setTop(460);
    obj.label2:setWidth(230);
    obj.label2:setHeight(30);
    obj.label2:setField("CHPNivel");
    obj.label2:setName("label2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(117);
    obj.rectangle3:setTop(490);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setWidth(35);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(120);
    obj.label3:setTop(485);
    obj.label3:setWidth(230);
    obj.label3:setHeight(30);
    obj.label3:setField("EHPNivel");
    obj.label3:setName("label3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(117);
    obj.rectangle4:setTop(515);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setWidth(35);
    obj.rectangle4:setHeight(20);
    obj.rectangle4:setName("rectangle4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox1);
    obj.label4:setLeft(120);
    obj.label4:setTop(510);
    obj.label4:setWidth(230);
    obj.label4:setHeight(30);
    obj.label4:setField("HPRACAATE30");
    obj.label4:setName("label4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(117);
    obj.rectangle5:setTop(540);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setWidth(35);
    obj.rectangle5:setHeight(20);
    obj.rectangle5:setName("rectangle5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.scrollBox1);
    obj.label5:setLeft(120);
    obj.label5:setTop(535);
    obj.label5:setWidth(270);
    obj.label5:setHeight(30);
    obj.label5:setField("CMPNivel");
    obj.label5:setName("label5");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox1);
    obj.rectangle6:setLeft(117);
    obj.rectangle6:setTop(565);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setWidth(35);
    obj.rectangle6:setHeight(20);
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.scrollBox1);
    obj.label6:setLeft(120);
    obj.label6:setTop(560);
    obj.label6:setWidth(270);
    obj.label6:setHeight(30);
    obj.label6:setField("EMPNivel");
    obj.label6:setName("label6");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox1);
    obj.rectangle7:setLeft(233);
    obj.rectangle7:setTop(440);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setWidth(35);
    obj.rectangle7:setHeight(20);
    obj.rectangle7:setName("rectangle7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.scrollBox1);
    obj.label7:setLeft(235);
    obj.label7:setTop(435);
    obj.label7:setWidth(150);
    obj.label7:setHeight(30);
    obj.label7:setField("HPRACAATE40");
    obj.label7:setName("label7");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.scrollBox1);
    obj.rectangle8:setLeft(233);
    obj.rectangle8:setTop(465);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setWidth(35);
    obj.rectangle8:setHeight(20);
    obj.rectangle8:setName("rectangle8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.scrollBox1);
    obj.label8:setLeft(235);
    obj.label8:setTop(460);
    obj.label8:setWidth(230);
    obj.label8:setHeight(30);
    obj.label8:setField("MHPNivel");
    obj.label8:setName("label8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.scrollBox1);
    obj.rectangle9:setLeft(233);
    obj.rectangle9:setTop(490);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setWidth(35);
    obj.rectangle9:setHeight(20);
    obj.rectangle9:setName("rectangle9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.scrollBox1);
    obj.label9:setLeft(235);
    obj.label9:setTop(485);
    obj.label9:setWidth(230);
    obj.label9:setHeight(30);
    obj.label9:setField("MMPNivel");
    obj.label9:setName("label9");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox1);
    obj.rectangle10:setLeft(345);
    obj.rectangle10:setTop(440);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setHeight(20);
    obj.rectangle10:setName("rectangle10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.scrollBox1);
    obj.label10:setLeft(348);
    obj.label10:setTop(435);
    obj.label10:setWidth(230);
    obj.label10:setHeight(30);
    obj.label10:setField("FNivel");
    obj.label10:setName("label10");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.scrollBox1);
    obj.rectangle11:setLeft(415);
    obj.rectangle11:setTop(440);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(20);
    obj.rectangle11:setName("rectangle11");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.scrollBox1);
    obj.label11:setLeft(418);
    obj.label11:setTop(435);
    obj.label11:setWidth(230);
    obj.label11:setHeight(30);
    obj.label11:setField("INivel");
    obj.label11:setName("label11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.scrollBox1);
    obj.rectangle12:setLeft(500);
    obj.rectangle12:setTop(440);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setWidth(40);
    obj.rectangle12:setHeight(20);
    obj.rectangle12:setName("rectangle12");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.scrollBox1);
    obj.label12:setLeft(503);
    obj.label12:setTop(435);
    obj.label12:setWidth(230);
    obj.label12:setHeight(30);
    obj.label12:setField("DNivel");
    obj.label12:setName("label12");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox1);
    obj.rectangle13:setLeft(345);
    obj.rectangle13:setTop(465);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setHeight(20);
    obj.rectangle13:setName("rectangle13");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.scrollBox1);
    obj.label13:setLeft(348);
    obj.label13:setTop(460);
    obj.label13:setWidth(230);
    obj.label13:setHeight(30);
    obj.label13:setField("ANivel");
    obj.label13:setName("label13");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.scrollBox1);
    obj.rectangle14:setLeft(415);
    obj.rectangle14:setTop(465);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setWidth(40);
    obj.rectangle14:setHeight(20);
    obj.rectangle14:setName("rectangle14");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.scrollBox1);
    obj.label14:setLeft(418);
    obj.label14:setTop(460);
    obj.label14:setWidth(230);
    obj.label14:setHeight(30);
    obj.label14:setField("VNivel");
    obj.label14:setName("label14");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(120);
    obj.edit1:setTop(218);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setWidth(30);
    obj.edit1:setType("number");
    obj.edit1:setHeight(20);
    obj.edit1:setField("Atletismo");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(120);
    obj.edit2:setTop(243);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setWidth(30);
    obj.edit2:setType("number");
    obj.edit2:setHeight(20);
    obj.edit2:setField("Sabedoria");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(120);
    obj.edit3:setTop(268);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setWidth(30);
    obj.edit3:setType("number");
    obj.edit3:setHeight(20);
    obj.edit3:setField("Percepcao");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(120);
    obj.edit4:setTop(293);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setWidth(30);
    obj.edit4:setType("number");
    obj.edit4:setHeight(20);
    obj.edit4:setField("Acrobacia");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(120);
    obj.edit5:setTop(318);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setWidth(30);
    obj.edit5:setType("number");
    obj.edit5:setHeight(20);
    obj.edit5:setField("Vigor");
    obj.edit5:setName("edit5");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.scrollBox1);
    obj.rectangle15:setLeft(160);
    obj.rectangle15:setTop(218);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setWidth(30);
    obj.rectangle15:setHeight(20);
    obj.rectangle15:setName("rectangle15");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.scrollBox1);
    obj.label15:setLeft(160);
    obj.label15:setTop(218);
    obj.label15:setText("99");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setWidth(30);
    obj.label15:setHeight(20);
    lfm_setPropAsString(obj.label15, "format",  "%d");
    obj.label15:setField("TAtletismo");
    obj.label15:setName("label15");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.scrollBox1);
    obj.rectangle16:setLeft(160);
    obj.rectangle16:setTop(243);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setWidth(30);
    obj.rectangle16:setHeight(20);
    obj.rectangle16:setName("rectangle16");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.scrollBox1);
    obj.label16:setLeft(160);
    obj.label16:setTop(243);
    obj.label16:setText("99");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setWidth(30);
    obj.label16:setHeight(20);
    lfm_setPropAsString(obj.label16, "format",  "%d");
    obj.label16:setField("TSabedoria");
    obj.label16:setName("label16");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.scrollBox1);
    obj.rectangle17:setLeft(160);
    obj.rectangle17:setTop(268);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setWidth(30);
    obj.rectangle17:setHeight(20);
    obj.rectangle17:setName("rectangle17");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.scrollBox1);
    obj.label17:setLeft(160);
    obj.label17:setTop(268);
    obj.label17:setText("99");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setWidth(30);
    obj.label17:setHeight(20);
    lfm_setPropAsString(obj.label17, "format",  "%d");
    obj.label17:setField("TPercepcao");
    obj.label17:setName("label17");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.scrollBox1);
    obj.rectangle18:setLeft(160);
    obj.rectangle18:setTop(293);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setWidth(30);
    obj.rectangle18:setHeight(20);
    obj.rectangle18:setName("rectangle18");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.scrollBox1);
    obj.label18:setLeft(160);
    obj.label18:setTop(293);
    obj.label18:setText("99");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setWidth(30);
    obj.label18:setHeight(20);
    lfm_setPropAsString(obj.label18, "format",  "%d");
    obj.label18:setField("TAcrobacia");
    obj.label18:setName("label18");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.scrollBox1);
    obj.rectangle19:setLeft(160);
    obj.rectangle19:setTop(318);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setWidth(30);
    obj.rectangle19:setHeight(20);
    obj.rectangle19:setName("rectangle19");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.scrollBox1);
    obj.label19:setLeft(160);
    obj.label19:setTop(318);
    obj.label19:setText("99");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setWidth(30);
    obj.label19:setHeight(20);
    lfm_setPropAsString(obj.label19, "format",  "%d");
    obj.label19:setField("TVigor");
    obj.label19:setName("label19");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(200);
    obj.button1:setTop(218);
    obj.button1:setWidth(70);
    obj.button1:setHeight(20);
    obj.button1:setFontSize(12);
    obj.button1:setFontColor("#00FFFF");
    obj.button1:setText("Atletismo");
    obj.button1:setName("button1");


				local function RolarTesteAtletismo()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.TAtletismo = math.floor(tonumber(sheet.TAtletismo or 0));                        
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.TAtletismo, "[§K2]Teste de Atletismo"); 
				end; 	   
			


    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(200);
    obj.button2:setTop(243);
    obj.button2:setWidth(70);
    obj.button2:setHeight(20);
    obj.button2:setFontSize(12);
    obj.button2:setFontColor("#00FFFF");
    obj.button2:setText("Sabedoria");
    obj.button2:setName("button2");


				local function RolarTesteSabedoria()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.TSabedoria = math.floor(tonumber(sheet.TSabedoria or 0));                       
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.TSabedoria, "[§K2]Teste de Sabedoria"); 
				end; 	   
			


    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(200);
    obj.button3:setTop(268);
    obj.button3:setWidth(70);
    obj.button3:setHeight(20);
    obj.button3:setFontSize(12);
    obj.button3:setFontColor("#00FFFF");
    obj.button3:setText("Percepção");
    obj.button3:setName("button3");


				local function RolarTestePercepcao()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.TPercepcao = math.floor(tonumber(sheet.TPercepcao or 0));                       
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.TPercepcao, "[§K2]Teste de Percepcao"); 
				end; 	   
			


    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(200);
    obj.button4:setTop(293);
    obj.button4:setWidth(70);
    obj.button4:setHeight(20);
    obj.button4:setFontSize(12);
    obj.button4:setFontColor("#00FFFF");
    obj.button4:setText("Acrobacia");
    obj.button4:setName("button4");


				local function RolarTesteAcrobacia()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.TAcrobacia = math.floor(tonumber(sheet.TAcrobacia or 0));                         
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.TAcrobacia, "[§K2]Teste de Acrobacia"); 
				end; 	   
			


    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(200);
    obj.button5:setTop(318);
    obj.button5:setWidth(70);
    obj.button5:setHeight(20);
    obj.button5:setFontSize(12);
    obj.button5:setFontColor("#00FFFF");
    obj.button5:setText("Vigor");
    obj.button5:setName("button5");


				local function RolarTesteVigor()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.TVigor = math.floor(tonumber(sheet.TVigor or 0));                         
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.TVigor, "[§K2]Teste de Vigor"); 
				end; 	   
			


    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox1);
    obj.button6:setLeft(352);
    obj.button6:setTop(505);
    obj.button6:setWidth(90);
    obj.button6:setHeight(110);
    obj.button6:setOpacity(0.6);
    obj.button6:setText("");
    obj.button6:setName("button6");

    obj.DBMont = GUI.fromHandle(_obj_newObject("popup"));
    obj.DBMont:setParent(obj.scrollBox1);
    obj.DBMont:setName("DBMont");
    obj.DBMont:setVisible(false);
    obj.DBMont:setLeft(1);
    obj.DBMont:setTop(40);
    obj.DBMont:setWidth(600);
    obj.DBMont:setHeight(600);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.DBMont);
    obj.image4:setField("ImagemDaMont");
    obj.image4:setEditable(true);
    obj.image4:setStyle("autoFit");
    obj.image4:setLeft(215);
    obj.image4:setTop(96);
    obj.image4:setWidth(170);
    obj.image4:setHeight(200);
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.DBMont);
    obj.image5:setLeft(5);
    obj.image5:setTop(5);
    obj.image5:setWidth(590);
    obj.image5:setHeight(590);
    obj.image5:setCenter(true);
    obj.image5:setSRC("/imagens/8.png");
    obj.image5:setName("image5");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.DBMont);
    obj.textEditor1:setLeft(23);
    obj.textEditor1:setTop(357);
    obj.textEditor1:setWidth(553);
    obj.textEditor1:setHeight(130);
    obj.textEditor1:setField("HMont");
    obj.textEditor1:setName("textEditor1");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.DBMont);
    obj.button7:setLeft(372);
    obj.button7:setTop(450);
    obj.button7:setFontSize(20);
    obj.button7:setHeight(30);
    obj.button7:setWidth(200);
    obj.button7:setText("Habilidade Mont");
    obj.button7:setFontColor("White");
    obj.button7:setName("button7");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.DBMont);
    obj.edit6:setLeft(130);
    obj.edit6:setTop(523);
    obj.edit6:setWidth(70);
    obj.edit6:setHeight(20);
    obj.edit6:setField("MontAtletismo");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.DBMont);
    obj.edit7:setLeft(305);
    obj.edit7:setTop(523);
    obj.edit7:setWidth(70);
    obj.edit7:setHeight(20);
    obj.edit7:setField("MontSabedoria");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.DBMont);
    obj.edit8:setLeft(500);
    obj.edit8:setTop(523);
    obj.edit8:setWidth(70);
    obj.edit8:setHeight(20);
    obj.edit8:setField("MontPercepcao");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.DBMont);
    obj.edit9:setLeft(130);
    obj.edit9:setTop(553);
    obj.edit9:setWidth(70);
    obj.edit9:setHeight(20);
    obj.edit9:setField("MontVigor");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.DBMont);
    obj.edit10:setLeft(305);
    obj.edit10:setTop(553);
    obj.edit10:setWidth(70);
    obj.edit10:setHeight(20);
    obj.edit10:setField("MPMont");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.DBMont);
    obj.edit11:setLeft(500);
    obj.edit11:setTop(553);
    obj.edit11:setWidth(70);
    obj.edit11:setHeight(20);
    obj.edit11:setField("MontESPACO");
    obj.edit11:setName("edit11");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox1);
    obj.button8:setLeft(468);
    obj.button8:setTop(505);
    obj.button8:setWidth(90);
    obj.button8:setHeight(110);
    obj.button8:setOpacity(0.6);
    obj.button8:setText("");
    obj.button8:setName("button8");

    obj.DBDivindade = GUI.fromHandle(_obj_newObject("popup"));
    obj.DBDivindade:setParent(obj.scrollBox1);
    obj.DBDivindade:setName("DBDivindade");
    obj.DBDivindade:setVisible(false);
    obj.DBDivindade:setLeft(1);
    obj.DBDivindade:setTop(100);
    obj.DBDivindade:setWidth(700);
    obj.DBDivindade:setHeight(810);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.DBDivindade);
    obj.image6:setLeft(40);
    obj.image6:setTop(5);
    obj.image6:setWidth(700);
    obj.image6:setHeight(800);
    obj.image6:setCenter(true);
    obj.image6:setSRC("/imagens/10.png");
    obj.image6:setName("image6");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.DBDivindade);
    obj.comboBox1:setLeft(330);
    obj.comboBox1:setTop(97);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setFontColor("Gold");
    obj.comboBox1:setScale(1.4);
    obj.comboBox1:setField("Deuses");
    obj.comboBox1:setItems({'Escolha', 'Anilez', 'Blume', 'Jamiel', 'Thorin', 'Yin', 
		'Yuuki', 'Abaddon', 'Delevit', 'Hidarnes', 'Ignis', 'Succubus', });
    obj.comboBox1:setName("comboBox1");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.DBDivindade);
    obj.edit12:setLeft(330);
    obj.edit12:setTop(130);
    obj.edit12:setWidth(90);
    obj.edit12:setHeight(20);
    obj.edit12:setType("number");
    obj.edit12:setMax(7);
    obj.edit12:setScale(1.4);
    obj.edit12:setFontColor("Gold");
    obj.edit12:setField("LVDivino");
    obj.edit12:setName("edit12");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.DBDivindade);
    obj.rectangle20:setLeft(280);
    obj.rectangle20:setTop(195);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setWidth(40);
    obj.rectangle20:setHeight(20);
    obj.rectangle20:setName("rectangle20");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.DBDivindade);
    obj.label20:setLeft(283);
    obj.label20:setTop(195);
    obj.label20:setText("99");
    obj.label20:setWidth(50);
    obj.label20:setHeight(20);
    obj.label20:setFontColor("Gold");
    lfm_setPropAsString(obj.label20, "format",  "%d");
    obj.label20:setField("DForca");
    obj.label20:setName("label20");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.DBDivindade);
    obj.rectangle21:setLeft(280);
    obj.rectangle21:setTop(218);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setWidth(40);
    obj.rectangle21:setHeight(20);
    obj.rectangle21:setName("rectangle21");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.DBDivindade);
    obj.label21:setLeft(283);
    obj.label21:setTop(218);
    obj.label21:setText("99");
    obj.label21:setWidth(50);
    obj.label21:setHeight(20);
    obj.label21:setFontColor("Gold");
    lfm_setPropAsString(obj.label21, "format",  "%d");
    obj.label21:setField("DAgilidade");
    obj.label21:setName("label21");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.DBDivindade);
    obj.rectangle22:setLeft(410);
    obj.rectangle22:setTop(195);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setWidth(40);
    obj.rectangle22:setHeight(20);
    obj.rectangle22:setName("rectangle22");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.DBDivindade);
    obj.label22:setLeft(413);
    obj.label22:setTop(195);
    obj.label22:setText("99");
    obj.label22:setWidth(50);
    obj.label22:setHeight(20);
    obj.label22:setFontColor("Gold");
    lfm_setPropAsString(obj.label22, "format",  "%d");
    obj.label22:setField("DInteligencia");
    obj.label22:setName("label22");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.DBDivindade);
    obj.rectangle23:setLeft(410);
    obj.rectangle23:setTop(218);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setWidth(40);
    obj.rectangle23:setHeight(20);
    obj.rectangle23:setName("rectangle23");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.DBDivindade);
    obj.label23:setLeft(413);
    obj.label23:setTop(218);
    obj.label23:setText("99");
    obj.label23:setWidth(50);
    obj.label23:setHeight(20);
    obj.label23:setFontColor("Gold");
    lfm_setPropAsString(obj.label23, "format",  "%d");
    obj.label23:setField("DVitalidade");
    obj.label23:setName("label23");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.DBDivindade);
    obj.rectangle24:setLeft(540);
    obj.rectangle24:setTop(195);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setWidth(40);
    obj.rectangle24:setHeight(20);
    obj.rectangle24:setName("rectangle24");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.DBDivindade);
    obj.label24:setLeft(543);
    obj.label24:setTop(195);
    obj.label24:setText("99");
    obj.label24:setWidth(50);
    obj.label24:setHeight(20);
    obj.label24:setFontColor("Gold");
    lfm_setPropAsString(obj.label24, "format",  "%d");
    obj.label24:setField("DDestreza");
    obj.label24:setName("label24");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.DBDivindade);
    obj.rectangle25:setLeft(540);
    obj.rectangle25:setTop(218);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setWidth(40);
    obj.rectangle25:setHeight(20);
    obj.rectangle25:setName("rectangle25");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.DBDivindade);
    obj.label25:setLeft(543);
    obj.label25:setTop(218);
    obj.label25:setText("99");
    obj.label25:setWidth(50);
    obj.label25:setHeight(20);
    obj.label25:setFontColor("Gold");
    lfm_setPropAsString(obj.label25, "format",  "%d");
    obj.label25:setField("DMP");
    obj.label25:setName("label25");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.DBDivindade);
    obj.dataLink1:setFields({'Deuses', 'LVDivino'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.scrollBox1);
    obj.dataLink2:setFields({'Raca', 'Level'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.scrollBox1);
    obj.dataLink3:setFields({'MontSabedoria', 'MontAcrobacia', 'MontVigor', 'PA', 'PM', 'PF', 'Forca', 'Inteligencia', 'Destreza', 'Agilidade', 'Vitalidade', 'ArmaPA',
		'ArmaDEF', 'ArmaPM', 'ArmaRES', 'ARMAPF', 'ArmaHP', 'ArmaMP', 'Atletismo', 'Acrobacia', 'MontAtletismo', 'Sabedoria', 'Vigor', 'Percepcao', 'MontPercepcao', 'Raca' });
    obj.dataLink3:setName("dataLink3");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox1);
    obj.button9:setLeft(62);
    obj.button9:setTop(80);
    obj.button9:setWidth(80);
    obj.button9:setHeight(80);
    obj.button9:setOpacity(0.0);
    obj.button9:setName("button9");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox1);
    obj.image7:setField("ImagemRacial");
    obj.image7:setEditable(false);
    obj.image7:setStyle("autoFit");
    obj.image7:setLeft(65);
    obj.image7:setTop(81);
    obj.image7:setWidth(75);
    obj.image7:setHeight(75);
    obj.image7:setName("image7");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox1);
    obj.button10:setLeft(185);
    obj.button10:setTop(80);
    obj.button10:setWidth(80);
    obj.button10:setHeight(80);
    obj.button10:setOpacity(0.0);
    obj.button10:setName("button10");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.scrollBox1);
    obj.image8:setField("ImagemBasica");
    obj.image8:setEditable(false);
    obj.image8:setStyle("autoFit");
    obj.image8:setLeft(188);
    obj.image8:setTop(81);
    obj.image8:setWidth(75);
    obj.image8:setHeight(75);
    obj.image8:setName("image8");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.scrollBox1);
    obj.textEditor2:setLeft(40);
    obj.textEditor2:setTop(650);
    obj.textEditor2:setWidth(330);
    obj.textEditor2:setHeight(230);
    obj.textEditor2:setField("Conhecimento");
    obj.textEditor2:setName("textEditor2");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.scrollBox1);
    obj.rectangle26:setLeft(500);
    obj.rectangle26:setTop(650);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setWidth(50);
    obj.rectangle26:setHeight(20);
    obj.rectangle26:setName("rectangle26");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.scrollBox1);
    obj.label26:setLeft(503);
    obj.label26:setTop(650);
    obj.label26:setWidth(50);
    obj.label26:setHeight(20);
    obj.label26:setField("RealVisao");
    obj.label26:setName("label26");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.scrollBox1);
    obj.edit13:setLeft(500);
    obj.edit13:setTop(675);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(20);
    obj.edit13:setField("Distancia");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.scrollBox1);
    obj.edit14:setLeft(500);
    obj.edit14:setTop(700);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(20);
    obj.edit14:setField("Potes");
    obj.edit14:setName("edit14");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.scrollBox1);
    obj.comboBox2:setLeft(460);
    obj.comboBox2:setTop(725);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setHeight(20);
    obj.comboBox2:setFontColor("Gold");
    obj.comboBox2:setField("Deuses");
    obj.comboBox2:setItems({'Escolha', 'Anilez', 'Blume', 'Bardo', 'Jamiel', 'Thorin', 'Yin', 
																									  'Yuuki', 'Abaddon', 'Delevit', 'Hidarnes', 'Ignis', 'Succubus', });
    obj.comboBox2:setName("comboBox2");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.scrollBox1);
    obj.edit15:setLeft(500);
    obj.edit15:setTop(750);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(20);
    obj.edit15:setType("number");
    obj.edit15:setMax(7);
    obj.edit15:setFontColor("Gold");
    obj.edit15:setField("LVDivino");
    obj.edit15:setName("edit15");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.scrollBox1);
    obj.rectangle27:setLeft(500);
    obj.rectangle27:setTop(775);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setWidth(50);
    obj.rectangle27:setHeight(20);
    obj.rectangle27:setName("rectangle27");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.scrollBox1);
    obj.label27:setLeft(503);
    obj.label27:setTop(775);
    obj.label27:setWidth(50);
    obj.label27:setHeight(20);
    obj.label27:setFontColor("Blue");
    obj.label27:setField("RegenMP");
    obj.label27:setName("label27");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.scrollBox1);
    obj.rectangle28:setLeft(500);
    obj.rectangle28:setTop(800);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setWidth(50);
    obj.rectangle28:setHeight(20);
    obj.rectangle28:setName("rectangle28");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.scrollBox1);
    obj.label28:setLeft(503);
    obj.label28:setTop(800);
    obj.label28:setWidth(50);
    obj.label28:setHeight(20);
    lfm_setPropAsString(obj.label28, "format",  "%d");
    obj.label28:setFontColor("Red");
    obj.label28:setField("RealDeslocamento");
    obj.label28:setName("label28");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.scrollBox1);
    obj.rectangle29:setLeft(500);
    obj.rectangle29:setTop(825);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setWidth(50);
    obj.rectangle29:setHeight(20);
    obj.rectangle29:setName("rectangle29");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.scrollBox1);
    obj.label29:setLeft(503);
    obj.label29:setTop(825);
    obj.label29:setWidth(50);
    obj.label29:setHeight(20);
    obj.label29:setFontColor("Red");
    obj.label29:setField("Correndo");
    obj.label29:setName("label29");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.scrollBox1);
    obj.edit16:setLeft(503);
    obj.edit16:setTop(845);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(20);
    obj.edit16:setVisible(false);
    obj.edit16:setFontColor("Red");
    obj.edit16:setField("ADeslocamento");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.scrollBox1);
    obj.edit17:setLeft(503);
    obj.edit17:setTop(875);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(20);
    obj.edit17:setVisible(false);
    obj.edit17:setFontColor("Red");
    obj.edit17:setField("Deslocamento");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.scrollBox1);
    obj.edit18:setLeft(503);
    obj.edit18:setTop(845);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(20);
    obj.edit18:setVisible(false);
    obj.edit18:setFontColor("Red");
    obj.edit18:setField("DVisao");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.scrollBox1);
    obj.edit19:setLeft(503);
    obj.edit19:setTop(875);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(20);
    obj.edit19:setVisible(false);
    obj.edit19:setFontColor("Red");
    obj.edit19:setField("Visao");
    obj.edit19:setName("edit19");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            RolarTesteAtletismo()
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            RolarTesteSabedoria()
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            RolarTestePercepcao()
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            RolarTesteAcrobacia()
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            RolarTesteVigor()
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            self.DBMont:show();
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            local rolagem = Firecast.interpretarRolagem(sheet.ataqueDoPersonagem); 
            					if not rolagem.possuiAlgumDado then
            						rolagem = Firecast.interpretarRolagem("1d20"):concatenar(rolagem);
            					end; 
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            				    if mesaDoPersonagem ~= nil then
            					   mesaDoPersonagem.chat:rolarDados(rolagem, sheet.HMont);
            				    end;
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            self.DBDivindade:show();
        end, obj);

    obj._e_event8 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            --------------- Deuses ----------------
            				if sheet.Deuses == 'Anilez' then
            					sheet.DForca = 0;
            					sheet.DInteligencia = 0;
            					sheet.DDestreza	= (tonumber(sheet.LVDivino) or 0);
            					sheet.DAgilidade = 0;
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0) + 1;
            					sheet.DMP = 0;
            				end;		
            				
            				if sheet.Deuses == 'Blume' then
            					sheet.DForca = 0;
            					sheet.DInteligencia = (tonumber(sheet.LVDivino) or 0);
            					sheet.DDestreza	= 0;
            					sheet.DAgilidade = 0;
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0) + 1;
            					sheet.DMP = 0;
            				end;
            
            				if sheet.Deuses == 'Jamiel' then
            					sheet.DForca = (tonumber(sheet.LVDivino) or 0) * 0.7;
            					sheet.DInteligencia = (tonumber(sheet.LVDivino) or 0) * 0.7;
            					sheet.DDestreza	= 0;
            					sheet.DAgilidade = 0;
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0);
            					sheet.DMP = 0;
            				end;
            				
            				if sheet.Deuses == 'Thorin' then
            					sheet.DForca = (tonumber(sheet.LVDivino) or 0);
            					sheet.DInteligencia = 0;
            					sheet.DDestreza	= 0;
            					sheet.DAgilidade = 0;
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0) + 1;
            					sheet.DMP = 0;
            				end;
            				
            				if sheet.Deuses == 'Yin' then
            					sheet.DForca = 0;
            					sheet.DInteligencia = 0;
            					sheet.DDestreza	= 0;
            					sheet.DAgilidade = (tonumber(sheet.LVDivino) or 0);
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0) + 1;
            					sheet.DMP = 0;
            				end;
            				
            				if sheet.Deuses == 'Yuuki' then
            					sheet.DForca = 0;
            					sheet.DInteligencia = 0;
            					sheet.DDestreza	= 0;
            					sheet.DAgilidade = 0;
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0) + 1;
            					sheet.DMP = (tonumber(sheet.LVDivino) or 0) * 10;
            				end;
            				
            				if sheet.Deuses == 'Escolha' then
            					sheet.DForca = 0;
            					sheet.DInteligencia = 0;
            					sheet.DDestreza	= 0;
            					sheet.DAgilidade = 0;
            					sheet.DVitalidade = 0;
            					sheet.DMP = 0;
            				end;
            				
            				------------- Demonios ------------
            				if sheet.Deuses == 'Delevit' then
            					sheet.DForca = (tonumber(sheet.LVDivino) or 0) * 0.7;
            					sheet.DInteligencia = (tonumber(sheet.LVDivino) or 0) * 0.6;
            					sheet.DDestreza	= 0;
            					sheet.DAgilidade = 0;
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0) + 1;
            					sheet.DMP = 1 - 1;
            				end;
            				
            				if sheet.Deuses == 'Ignis' then
            					sheet.DForca = 0;
            					sheet.DInteligencia = 0;
            					sheet.DDestreza	= 0;
            					sheet.DAgilidade = 0;
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0) + 1;
            					sheet.DMP = (tonumber(sheet.LVDivino) or 0) * 10;
            				end;
            				
            				if sheet.Deuses == 'Succubus' then
            					sheet.DForca = 0;
            					sheet.DInteligencia = 0;
            					sheet.DDestreza	= (tonumber(sheet.LVDivino) or 0);
            					sheet.DAgilidade = 0;
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0) + 1;
            					sheet.DMP = 0;
            				end;
            				
            				if sheet.Deuses == 'Abaddon' then
            					sheet.DForca = 0;
            					sheet.DInteligencia = (tonumber(sheet.LVDivino) or 0);
            					sheet.DDestreza	= 0;
            					sheet.DAgilidade = 0;
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0) + 1;
            					sheet.DMP = 0;
            				end;
            				
            				if sheet.Deuses == 'Hidarnes' then
            					sheet.DForca = 0;
            					sheet.DInteligencia = 0;
            					sheet.DDestreza	= 0;
            					sheet.DAgilidade = (tonumber(sheet.LVDivino) or 0);
            					sheet.DVitalidade = (tonumber(sheet.LVDivino) or 0) + 1;
            					sheet.DMP = 0;
            				end;
        end, obj);

    obj._e_event9 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.RAtletismo = 0;
            				sheet.RPercepcao = 0;
            				sheet.RAcrobacia = 0;
            				sheet.RSabedoria = 0;
            				sheet.RVigor = 0;
            				
            				if sheet.Raca == 'Elfo' then
            					sheet.RPercepcao = 3;
            				end;
            				
            				if sheet.Raca == 'Elfo Negro' then
            					sheet.RPercepcao = 3;
            				end;
            				
            				if sheet.Raca == 'Orc' then
            					sheet.RAtletismo = 5;
            				end;
        end, obj);

    obj._e_event10 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.TAtletismo = (tonumber(sheet.ForcaTotal) or 0) /10 + (tonumber(sheet.Atletismo) or 0) + (tonumber(sheet.MontAtletismo) or 0) + (tonumber(sheet.RAtletismo) or 0);
            				sheet.TSabedoria = (tonumber(sheet.InteligenciaTotal) or 0) /10 + (tonumber(sheet.Sabedoria) or 0) + (tonumber(sheet.MontSabedoria) or 0) + (tonumber(sheet.RSabedoria) or 0);
            				sheet.TPercepcao = (tonumber(sheet.DestrezaTotal) or 0) /10 + (tonumber(sheet.Percepcao) or 0) + (tonumber(sheet.MontPercepcao) or 0) + (tonumber(sheet.RPercepcao) or 0);
            				sheet.TVigor = (tonumber(sheet.VitalidadeTotal) or 0) /10 + (tonumber(sheet.Vigor) or 0) + (tonumber(sheet.MontVigor) or 0) + (tonumber(sheet.RVigor) or 0);
            				sheet.TAcrobacia = (tonumber(sheet.AgilidadeTotal) or 0) /10 + (tonumber(sheet.Acrobacia) or 0) + (tonumber(sheet.MontAcrobacia) or 0) + (tonumber(sheet.RAcrobacia) or 0);
        end, obj);

    obj._e_event11 = obj.button9:addEventListener("onClick",
        function (_)
            local novoForm = GUI.newForm("frmRacial");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end, obj);

    obj._e_event12 = obj.button10:addEventListener("onClick",
        function (_)
            local novoForm = GUI.newForm("frmBasica");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.DBMont ~= nil then self.DBMont:destroy(); self.DBMont = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.DBDivindade ~= nil then self.DBDivindade:destroy(); self.DBDivindade = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmpersonagem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmpersonagem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmpersonagem = {
    newEditor = newfrmpersonagem, 
    new = newfrmpersonagem, 
    name = "frmpersonagem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmpersonagem = _frmpersonagem;
Firecast.registrarForm(_frmpersonagem);

return _frmpersonagem;
