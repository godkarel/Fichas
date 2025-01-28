require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmequip()
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
    obj:setName("frmequip");
    obj:setScale(0.9);
    obj:setWidth(650);
    obj:setHeight(700);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setWidth(620);
    obj.image1:setHeight(920);
    obj.image1:setCenter(true);
    obj.image1:setSRC("/imagens/2.png");
    obj.image1:setName("image1");

    obj.BarraFlecha = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.BarraFlecha:setParent(obj.scrollBox1);
    obj.BarraFlecha:setName("BarraFlecha");
    obj.BarraFlecha:setLeft(400);
    obj.BarraFlecha:setTop(420);
    obj.BarraFlecha:setWidth(90);
    obj.BarraFlecha:setPosition(100);
    obj.BarraFlecha:setMax(100);
    obj.BarraFlecha:setColor("green");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(405);
    obj.edit1:setTop(420);
    obj.edit1:setWidth(35);
    obj.edit1:setHeight(20);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setTransparent(true);
    obj.edit1:setType("number");
    obj.edit1:setField("AtualFlecha");
    obj.edit1:setName("edit1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(440);
    obj.label1:setTop(420);
    obj.label1:setWidth(12);
    obj.label1:setHeight(20);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("/");
    obj.label1:setName("label1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(447);
    obj.edit2:setTop(420);
    obj.edit2:setWidth(35);
    obj.edit2:setHeight(20);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setTransparent(true);
    obj.edit2:setType("number");
    obj.edit2:setField("MaxFlecha");
    obj.edit2:setName("edit2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'AtualFlecha', 'MaxFlecha'});
    obj.dataLink1:setName("dataLink1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(70);
    obj.button1:setTop(158);
    obj.button1:setWidth(80);
    obj.button1:setHeight(80);
    obj.button1:setOpacity(0.1);
    obj.button1:setText("");
    obj.button1:setName("button1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(-43);
    obj.image2:setTop(80);
    obj.image2:setWidth(300);
    obj.image2:setHeight(300);
    obj.image2:setSRC("/imagens/TAGS/Arma.png");
    obj.image2:setName("image2");

    obj.DBArma = GUI.fromHandle(_obj_newObject("popup"));
    obj.DBArma:setParent(obj.scrollBox1);
    obj.DBArma:setName("DBArma");
    obj.DBArma:setVisible(false);
    obj.DBArma:setLeft(1);
    obj.DBArma:setTop(40);
    obj.DBArma:setWidth(600);
    obj.DBArma:setHeight(600);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.DBArma);
    obj.label2:setLeft(300);
    obj.label2:setTop(25);
    obj.label2:setFontSize(25);
    obj.label2:setText("Arma");
    obj.label2:setFontColor("RED");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.DBArma);
    obj.label3:setLeft(10);
    obj.label3:setTop(30);
    obj.label3:setFontSize(20);
    obj.label3:setText("Nome");
    obj.label3:setFontColor("Blue");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.DBArma);
    obj.edit3:setLeft(75);
    obj.edit3:setTop(37);
    obj.edit3:setWidth(150);
    obj.edit3:setHeight(20);
    obj.edit3:setField("ArmaNome");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.DBArma);
    obj.label4:setLeft(10);
    obj.label4:setTop(75);
    obj.label4:setFontSize(20);
    obj.label4:setText("P.A");
    obj.label4:setFontColor("Blue");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.DBArma);
    obj.edit4:setLeft(75);
    obj.edit4:setTop(80);
    obj.edit4:setWidth(75);
    obj.edit4:setHeight(20);
    obj.edit4:setField("ArmaPA");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.DBArma);
    obj.label5:setLeft(10);
    obj.label5:setTop(108);
    obj.label5:setFontSize(20);
    obj.label5:setText("Defesa");
    obj.label5:setFontColor("Blue");
    obj.label5:setAutoSize(true);
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.DBArma);
    obj.edit5:setLeft(75);
    obj.edit5:setTop(113);
    obj.edit5:setWidth(75);
    obj.edit5:setHeight(20);
    obj.edit5:setField("ArmaDEF");
    obj.edit5:setName("edit5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.DBArma);
    obj.label6:setLeft(155);
    obj.label6:setTop(75);
    obj.label6:setFontSize(20);
    obj.label6:setText("P.M");
    obj.label6:setFontColor("Blue");
    obj.label6:setAutoSize(true);
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.DBArma);
    obj.edit6:setLeft(220);
    obj.edit6:setTop(80);
    obj.edit6:setWidth(75);
    obj.edit6:setHeight(20);
    obj.edit6:setField("ArmaPM");
    obj.edit6:setName("edit6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.DBArma);
    obj.label7:setLeft(155);
    obj.label7:setTop(108);
    obj.label7:setFontSize(20);
    obj.label7:setText("Resist");
    obj.label7:setFontColor("Blue");
    obj.label7:setAutoSize(true);
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.DBArma);
    obj.edit7:setLeft(220);
    obj.edit7:setTop(113);
    obj.edit7:setWidth(75);
    obj.edit7:setHeight(20);
    obj.edit7:setField("ArmaRES");
    obj.edit7:setName("edit7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.DBArma);
    obj.label8:setLeft(300);
    obj.label8:setTop(75);
    obj.label8:setFontSize(20);
    obj.label8:setText("P.F");
    obj.label8:setFontColor("Blue");
    obj.label8:setAutoSize(true);
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.DBArma);
    obj.edit8:setLeft(340);
    obj.edit8:setTop(80);
    obj.edit8:setWidth(75);
    obj.edit8:setHeight(20);
    obj.edit8:setField("ArmaPF");
    obj.edit8:setName("edit8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.DBArma);
    obj.label9:setLeft(300);
    obj.label9:setTop(108);
    obj.label9:setFontSize(20);
    obj.label9:setText("HP");
    obj.label9:setFontColor("Blue");
    obj.label9:setAutoSize(true);
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.DBArma);
    obj.edit9:setLeft(340);
    obj.edit9:setTop(113);
    obj.edit9:setWidth(75);
    obj.edit9:setHeight(20);
    obj.edit9:setField("ArmaHP");
    obj.edit9:setName("edit9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.DBArma);
    obj.label10:setLeft(420);
    obj.label10:setTop(108);
    obj.label10:setFontSize(20);
    obj.label10:setText("MP");
    obj.label10:setFontColor("Blue");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.DBArma);
    obj.edit10:setLeft(460);
    obj.edit10:setTop(113);
    obj.edit10:setWidth(75);
    obj.edit10:setHeight(20);
    obj.edit10:setField("ArmaMP");
    obj.edit10:setName("edit10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.DBArma);
    obj.label11:setLeft(10);
    obj.label11:setTop(141);
    obj.label11:setFontSize(20);
    obj.label11:setText("Distancia");
    obj.label11:setFontColor("Blue");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.DBArma);
    obj.edit11:setLeft(100);
    obj.edit11:setTop(146);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(20);
    obj.edit11:setField("ArmaDistancia");
    obj.edit11:setName("edit11");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.DBArma);
    obj.richEdit1:setLeft(15);
    obj.richEdit1:setTop(200);
    obj.richEdit1:setWidth(540);
    obj.richEdit1:setHeight(330);
    obj.richEdit1.backgroundColor = "Chocolate";
    obj.richEdit1.defaultFontColor = "white";
    obj.richEdit1:setField("SkillArma");
    obj.richEdit1:setName("richEdit1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(200);
    obj.button2:setTop(158);
    obj.button2:setWidth(80);
    obj.button2:setHeight(80);
    obj.button2:setOpacity(0.1);
    obj.button2:setText("");
    obj.button2:setName("button2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setLeft(85);
    obj.image3:setTop(80);
    obj.image3:setWidth(300);
    obj.image3:setHeight(300);
    obj.image3:setSRC("/imagens/TAGS/ArmaSecundaria.png");
    obj.image3:setName("image3");

    obj.DBOutramao = GUI.fromHandle(_obj_newObject("popup"));
    obj.DBOutramao:setParent(obj.scrollBox1);
    obj.DBOutramao:setName("DBOutramao");
    obj.DBOutramao:setVisible(false);
    obj.DBOutramao:setLeft(1);
    obj.DBOutramao:setTop(40);
    obj.DBOutramao:setWidth(600);
    obj.DBOutramao:setHeight(600);

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.DBOutramao);
    obj.label12:setLeft(300);
    obj.label12:setTop(25);
    obj.label12:setFontSize(25);
    obj.label12:setText("Outra Mão");
    obj.label12:setFontColor("RED");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.DBOutramao);
    obj.label13:setLeft(10);
    obj.label13:setTop(30);
    obj.label13:setFontSize(20);
    obj.label13:setText("Nome");
    obj.label13:setFontColor("Blue");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.DBOutramao);
    obj.edit12:setLeft(75);
    obj.edit12:setTop(37);
    obj.edit12:setWidth(150);
    obj.edit12:setHeight(20);
    obj.edit12:setField("OutraNome");
    obj.edit12:setName("edit12");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.DBOutramao);
    obj.label14:setLeft(10);
    obj.label14:setTop(75);
    obj.label14:setFontSize(20);
    obj.label14:setText("P.A");
    obj.label14:setFontColor("Blue");
    obj.label14:setAutoSize(true);
    obj.label14:setName("label14");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.DBOutramao);
    obj.edit13:setLeft(75);
    obj.edit13:setTop(80);
    obj.edit13:setWidth(75);
    obj.edit13:setHeight(20);
    obj.edit13:setField("OutraPA");
    obj.edit13:setName("edit13");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.DBOutramao);
    obj.label15:setLeft(10);
    obj.label15:setTop(108);
    obj.label15:setFontSize(20);
    obj.label15:setText("Defesa");
    obj.label15:setFontColor("Blue");
    obj.label15:setAutoSize(true);
    obj.label15:setName("label15");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.DBOutramao);
    obj.edit14:setLeft(75);
    obj.edit14:setTop(113);
    obj.edit14:setWidth(75);
    obj.edit14:setHeight(20);
    obj.edit14:setField("OutraDEF");
    obj.edit14:setName("edit14");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.DBOutramao);
    obj.label16:setLeft(155);
    obj.label16:setTop(75);
    obj.label16:setFontSize(20);
    obj.label16:setText("P.M");
    obj.label16:setFontColor("Blue");
    obj.label16:setAutoSize(true);
    obj.label16:setName("label16");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.DBOutramao);
    obj.edit15:setLeft(220);
    obj.edit15:setTop(80);
    obj.edit15:setWidth(75);
    obj.edit15:setHeight(20);
    obj.edit15:setField("OutraPM");
    obj.edit15:setName("edit15");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.DBOutramao);
    obj.label17:setLeft(155);
    obj.label17:setTop(108);
    obj.label17:setFontSize(20);
    obj.label17:setText("Resist");
    obj.label17:setFontColor("Blue");
    obj.label17:setAutoSize(true);
    obj.label17:setName("label17");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.DBOutramao);
    obj.edit16:setLeft(220);
    obj.edit16:setTop(113);
    obj.edit16:setWidth(75);
    obj.edit16:setHeight(20);
    obj.edit16:setField("OutraRES");
    obj.edit16:setName("edit16");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.DBOutramao);
    obj.label18:setLeft(300);
    obj.label18:setTop(75);
    obj.label18:setFontSize(20);
    obj.label18:setText("P.F");
    obj.label18:setFontColor("Blue");
    obj.label18:setAutoSize(true);
    obj.label18:setName("label18");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.DBOutramao);
    obj.edit17:setLeft(340);
    obj.edit17:setTop(80);
    obj.edit17:setWidth(75);
    obj.edit17:setHeight(20);
    obj.edit17:setField("OutraPF");
    obj.edit17:setName("edit17");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.DBOutramao);
    obj.label19:setLeft(300);
    obj.label19:setTop(108);
    obj.label19:setFontSize(20);
    obj.label19:setText("HP");
    obj.label19:setFontColor("Blue");
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.DBOutramao);
    obj.edit18:setLeft(340);
    obj.edit18:setTop(113);
    obj.edit18:setWidth(75);
    obj.edit18:setHeight(20);
    obj.edit18:setField("OutraHP");
    obj.edit18:setName("edit18");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.DBOutramao);
    obj.label20:setLeft(420);
    obj.label20:setTop(108);
    obj.label20:setFontSize(20);
    obj.label20:setText("MP");
    obj.label20:setFontColor("Blue");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.DBOutramao);
    obj.edit19:setLeft(460);
    obj.edit19:setTop(113);
    obj.edit19:setWidth(75);
    obj.edit19:setHeight(20);
    obj.edit19:setField("OutraMP");
    obj.edit19:setName("edit19");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.DBOutramao);
    obj.label21:setLeft(10);
    obj.label21:setTop(141);
    obj.label21:setFontSize(20);
    obj.label21:setText("Distancia");
    obj.label21:setFontColor("Blue");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.DBOutramao);
    obj.edit20:setLeft(100);
    obj.edit20:setTop(146);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(20);
    obj.edit20:setField("OutraDistancia");
    obj.edit20:setName("edit20");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.DBOutramao);
    obj.label22:setLeft(155);
    obj.label22:setTop(141);
    obj.label22:setFontSize(20);
    obj.label22:setText("RegenMP");
    obj.label22:setFontColor("Blue");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.DBOutramao);
    obj.edit21:setLeft(245);
    obj.edit21:setTop(146);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(20);
    obj.edit21:setField("OutraRegenMP");
    obj.edit21:setName("edit21");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.DBOutramao);
    obj.label23:setLeft(300);
    obj.label23:setTop(141);
    obj.label23:setFontSize(20);
    obj.label23:setText("Penalidade");
    obj.label23:setFontColor("Blue");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.DBOutramao);
    obj.edit22:setLeft(402);
    obj.edit22:setTop(146);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(20);
    obj.edit22:setField("OutraDebuffShield");
    obj.edit22:setName("edit22");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.DBOutramao);
    obj.richEdit2:setLeft(15);
    obj.richEdit2:setTop(200);
    obj.richEdit2:setWidth(540);
    obj.richEdit2:setHeight(330);
    obj.richEdit2.backgroundColor = "Chocolate";
    obj.richEdit2.defaultFontColor = "white";
    obj.richEdit2:setField("SkillOutramao");
    obj.richEdit2:setName("richEdit2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(345);
    obj.button3:setTop(158);
    obj.button3:setWidth(80);
    obj.button3:setHeight(80);
    obj.button3:setOpacity(0.1);
    obj.button3:setText("");
    obj.button3:setName("button3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox1);
    obj.image4:setLeft(232);
    obj.image4:setTop(80);
    obj.image4:setWidth(300);
    obj.image4:setHeight(300);
    obj.image4:setSRC("/imagens/TAGS/EQUIP.png");
    obj.image4:setName("image4");

    obj.DBArmadura = GUI.fromHandle(_obj_newObject("popup"));
    obj.DBArmadura:setParent(obj.scrollBox1);
    obj.DBArmadura:setName("DBArmadura");
    obj.DBArmadura:setVisible(false);
    obj.DBArmadura:setLeft(1);
    obj.DBArmadura:setTop(40);
    obj.DBArmadura:setWidth(600);
    obj.DBArmadura:setHeight(600);

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.DBArmadura);
    obj.label24:setLeft(300);
    obj.label24:setTop(25);
    obj.label24:setFontSize(25);
    obj.label24:setText("Armadura");
    obj.label24:setFontColor("RED");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.DBArmadura);
    obj.label25:setLeft(10);
    obj.label25:setTop(30);
    obj.label25:setFontSize(20);
    obj.label25:setText("Nome");
    obj.label25:setFontColor("Blue");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.DBArmadura);
    obj.edit23:setLeft(75);
    obj.edit23:setTop(37);
    obj.edit23:setWidth(150);
    obj.edit23:setHeight(20);
    obj.edit23:setField("ArmaduraNome");
    obj.edit23:setName("edit23");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.DBArmadura);
    obj.label26:setLeft(10);
    obj.label26:setTop(75);
    obj.label26:setFontSize(20);
    obj.label26:setText("P.A");
    obj.label26:setFontColor("Blue");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.DBArmadura);
    obj.edit24:setLeft(75);
    obj.edit24:setTop(80);
    obj.edit24:setWidth(75);
    obj.edit24:setHeight(20);
    obj.edit24:setField("ArmaduraPA");
    obj.edit24:setName("edit24");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.DBArmadura);
    obj.label27:setLeft(10);
    obj.label27:setTop(108);
    obj.label27:setFontSize(20);
    obj.label27:setText("Defesa");
    obj.label27:setFontColor("Blue");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.DBArmadura);
    obj.edit25:setLeft(75);
    obj.edit25:setTop(113);
    obj.edit25:setWidth(75);
    obj.edit25:setHeight(20);
    obj.edit25:setField("ArmaduraDEF");
    obj.edit25:setName("edit25");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.DBArmadura);
    obj.label28:setLeft(155);
    obj.label28:setTop(75);
    obj.label28:setFontSize(20);
    obj.label28:setText("P.M");
    obj.label28:setFontColor("Blue");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.DBArmadura);
    obj.edit26:setLeft(220);
    obj.edit26:setTop(80);
    obj.edit26:setWidth(75);
    obj.edit26:setHeight(20);
    obj.edit26:setField("ArmaduraPM");
    obj.edit26:setName("edit26");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.DBArmadura);
    obj.label29:setLeft(155);
    obj.label29:setTop(108);
    obj.label29:setFontSize(20);
    obj.label29:setText("Resist");
    obj.label29:setFontColor("Blue");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.DBArmadura);
    obj.edit27:setLeft(220);
    obj.edit27:setTop(113);
    obj.edit27:setWidth(75);
    obj.edit27:setHeight(20);
    obj.edit27:setField("ArmaduraRES");
    obj.edit27:setName("edit27");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.DBArmadura);
    obj.label30:setLeft(300);
    obj.label30:setTop(75);
    obj.label30:setFontSize(20);
    obj.label30:setText("P.F");
    obj.label30:setFontColor("Blue");
    obj.label30:setAutoSize(true);
    obj.label30:setName("label30");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.DBArmadura);
    obj.edit28:setLeft(340);
    obj.edit28:setTop(80);
    obj.edit28:setWidth(75);
    obj.edit28:setHeight(20);
    obj.edit28:setField("ArmaduraPF");
    obj.edit28:setName("edit28");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.DBArmadura);
    obj.label31:setLeft(300);
    obj.label31:setTop(108);
    obj.label31:setFontSize(20);
    obj.label31:setText("HP");
    obj.label31:setFontColor("Blue");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.DBArmadura);
    obj.edit29:setLeft(340);
    obj.edit29:setTop(113);
    obj.edit29:setWidth(75);
    obj.edit29:setHeight(20);
    obj.edit29:setField("ArmaduraHP");
    obj.edit29:setName("edit29");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.DBArmadura);
    obj.label32:setLeft(420);
    obj.label32:setTop(108);
    obj.label32:setFontSize(20);
    obj.label32:setText("MP");
    obj.label32:setFontColor("Blue");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.DBArmadura);
    obj.edit30:setLeft(460);
    obj.edit30:setTop(113);
    obj.edit30:setWidth(75);
    obj.edit30:setHeight(20);
    obj.edit30:setField("ArmaduraMP");
    obj.edit30:setName("edit30");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.DBArmadura);
    obj.label33:setLeft(10);
    obj.label33:setTop(141);
    obj.label33:setFontSize(20);
    obj.label33:setText("Distancia");
    obj.label33:setFontColor("Blue");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.DBArmadura);
    obj.edit31:setLeft(100);
    obj.edit31:setTop(146);
    obj.edit31:setWidth(50);
    obj.edit31:setHeight(20);
    obj.edit31:setField("ArmaduraDistancia");
    obj.edit31:setName("edit31");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.DBArmadura);
    obj.richEdit3:setLeft(15);
    obj.richEdit3:setTop(200);
    obj.richEdit3:setWidth(540);
    obj.richEdit3:setHeight(330);
    obj.richEdit3.backgroundColor = "Chocolate";
    obj.richEdit3.defaultFontColor = "white";
    obj.richEdit3:setField("SkillArmadura");
    obj.richEdit3:setName("richEdit3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(475);
    obj.button4:setTop(158);
    obj.button4:setWidth(80);
    obj.button4:setHeight(80);
    obj.button4:setOpacity(0.1);
    obj.button4:setText("");
    obj.button4:setName("button4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox1);
    obj.image5:setLeft(360);
    obj.image5:setTop(80);
    obj.image5:setWidth(300);
    obj.image5:setHeight(300);
    obj.image5:setSRC("/imagens/TAGS/ACESSORIO.png");
    obj.image5:setName("image5");

    obj.DBAcessorio = GUI.fromHandle(_obj_newObject("popup"));
    obj.DBAcessorio:setParent(obj.scrollBox1);
    obj.DBAcessorio:setName("DBAcessorio");
    obj.DBAcessorio:setVisible(false);
    obj.DBAcessorio:setLeft(1);
    obj.DBAcessorio:setTop(40);
    obj.DBAcessorio:setWidth(600);
    obj.DBAcessorio:setHeight(600);

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.DBAcessorio);
    obj.label34:setLeft(300);
    obj.label34:setTop(25);
    obj.label34:setFontSize(25);
    obj.label34:setText("Acessorio");
    obj.label34:setFontColor("RED");
    obj.label34:setAutoSize(true);
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.DBAcessorio);
    obj.label35:setLeft(10);
    obj.label35:setTop(30);
    obj.label35:setFontSize(20);
    obj.label35:setText("Nome");
    obj.label35:setFontColor("Blue");
    obj.label35:setAutoSize(true);
    obj.label35:setName("label35");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.DBAcessorio);
    obj.edit32:setLeft(75);
    obj.edit32:setTop(37);
    obj.edit32:setWidth(150);
    obj.edit32:setHeight(20);
    obj.edit32:setField("AcessorioNome");
    obj.edit32:setName("edit32");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.DBAcessorio);
    obj.label36:setLeft(10);
    obj.label36:setTop(75);
    obj.label36:setFontSize(20);
    obj.label36:setText("P.A");
    obj.label36:setFontColor("Blue");
    obj.label36:setAutoSize(true);
    obj.label36:setName("label36");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.DBAcessorio);
    obj.edit33:setLeft(75);
    obj.edit33:setTop(80);
    obj.edit33:setWidth(75);
    obj.edit33:setHeight(20);
    obj.edit33:setField("AcessorioPA");
    obj.edit33:setName("edit33");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.DBAcessorio);
    obj.label37:setLeft(10);
    obj.label37:setTop(108);
    obj.label37:setFontSize(20);
    obj.label37:setText("Defesa");
    obj.label37:setFontColor("Blue");
    obj.label37:setAutoSize(true);
    obj.label37:setName("label37");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.DBAcessorio);
    obj.edit34:setLeft(75);
    obj.edit34:setTop(113);
    obj.edit34:setWidth(75);
    obj.edit34:setHeight(20);
    obj.edit34:setField("AcessorioDEF");
    obj.edit34:setName("edit34");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.DBAcessorio);
    obj.label38:setLeft(155);
    obj.label38:setTop(75);
    obj.label38:setFontSize(20);
    obj.label38:setText("P.M");
    obj.label38:setFontColor("Blue");
    obj.label38:setAutoSize(true);
    obj.label38:setName("label38");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.DBAcessorio);
    obj.edit35:setLeft(220);
    obj.edit35:setTop(80);
    obj.edit35:setWidth(75);
    obj.edit35:setHeight(20);
    obj.edit35:setField("AcessorioPM");
    obj.edit35:setName("edit35");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.DBAcessorio);
    obj.label39:setLeft(155);
    obj.label39:setTop(108);
    obj.label39:setFontSize(20);
    obj.label39:setText("Resist");
    obj.label39:setFontColor("Blue");
    obj.label39:setAutoSize(true);
    obj.label39:setName("label39");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.DBAcessorio);
    obj.edit36:setLeft(220);
    obj.edit36:setTop(113);
    obj.edit36:setWidth(75);
    obj.edit36:setHeight(20);
    obj.edit36:setField("AcessorioRES");
    obj.edit36:setName("edit36");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.DBAcessorio);
    obj.label40:setLeft(300);
    obj.label40:setTop(75);
    obj.label40:setFontSize(20);
    obj.label40:setText("P.F");
    obj.label40:setFontColor("Blue");
    obj.label40:setAutoSize(true);
    obj.label40:setName("label40");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.DBAcessorio);
    obj.edit37:setLeft(340);
    obj.edit37:setTop(80);
    obj.edit37:setWidth(75);
    obj.edit37:setHeight(20);
    obj.edit37:setField("AcessorioPF");
    obj.edit37:setName("edit37");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.DBAcessorio);
    obj.label41:setLeft(300);
    obj.label41:setTop(108);
    obj.label41:setFontSize(20);
    obj.label41:setText("HP");
    obj.label41:setFontColor("Blue");
    obj.label41:setAutoSize(true);
    obj.label41:setName("label41");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.DBAcessorio);
    obj.edit38:setLeft(340);
    obj.edit38:setTop(113);
    obj.edit38:setWidth(75);
    obj.edit38:setHeight(20);
    obj.edit38:setField("AcessorioHP");
    obj.edit38:setName("edit38");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.DBAcessorio);
    obj.label42:setLeft(420);
    obj.label42:setTop(108);
    obj.label42:setFontSize(20);
    obj.label42:setText("MP");
    obj.label42:setFontColor("Blue");
    obj.label42:setAutoSize(true);
    obj.label42:setName("label42");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.DBAcessorio);
    obj.edit39:setLeft(460);
    obj.edit39:setTop(113);
    obj.edit39:setWidth(75);
    obj.edit39:setHeight(20);
    obj.edit39:setField("AcessorioMP");
    obj.edit39:setName("edit39");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.DBAcessorio);
    obj.label43:setLeft(155);
    obj.label43:setTop(141);
    obj.label43:setFontSize(20);
    obj.label43:setText("RegenMP");
    obj.label43:setFontColor("Blue");
    obj.label43:setAutoSize(true);
    obj.label43:setName("label43");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.DBAcessorio);
    obj.edit40:setLeft(245);
    obj.edit40:setTop(146);
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(20);
    obj.edit40:setField("A");
    obj.edit40:setName("edit40");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.DBAcessorio);
    obj.label44:setLeft(10);
    obj.label44:setTop(141);
    obj.label44:setFontSize(20);
    obj.label44:setText("Distancia");
    obj.label44:setFontColor("Blue");
    obj.label44:setAutoSize(true);
    obj.label44:setName("label44");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.DBAcessorio);
    obj.edit41:setLeft(100);
    obj.edit41:setTop(146);
    obj.edit41:setWidth(50);
    obj.edit41:setHeight(20);
    obj.edit41:setField("AcessorioDistancia");
    obj.edit41:setName("edit41");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.DBAcessorio);
    obj.richEdit4:setLeft(15);
    obj.richEdit4:setTop(200);
    obj.richEdit4:setWidth(540);
    obj.richEdit4:setHeight(330);
    obj.richEdit4.backgroundColor = "Chocolate";
    obj.richEdit4.defaultFontColor = "white";
    obj.richEdit4:setField("SkillAcessorio");
    obj.richEdit4:setName("richEdit4");

    obj.popPotion = GUI.fromHandle(_obj_newObject("popup"));
    obj.popPotion:setParent(obj.scrollBox1);
    obj.popPotion:setName("popPotion");
    obj.popPotion:setWidth(600);
    obj.popPotion:setHeight(400);
    obj.popPotion:setBackOpacity(0.5);

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.popPotion);
    obj.button5:setText("Novo Potion");
    obj.button5:setTop(5);
    obj.button5:setLeft(5);
    obj.button5:setHeight(25);
    obj.button5:setWidth(150);
    obj.button5:setName("button5");

    obj.rclListaDePotion = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDePotion:setParent(obj.popPotion);
    obj.rclListaDePotion:setName("rclListaDePotion");
    obj.rclListaDePotion:setField("itensPotions");
    obj.rclListaDePotion:setWidth(200);
    obj.rclListaDePotion:setHeight(350);
    obj.rclListaDePotion:setTop(30);
    obj.rclListaDePotion:setTemplateForm("frmItemPotion");
    obj.rclListaDePotion:setSelectable(true);

    obj.dscPotion = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dscPotion:setParent(obj.popPotion);
    obj.dscPotion:setName("dscPotion");
    obj.dscPotion:setVisible(false);
    obj.dscPotion:setLeft(200);
    obj.dscPotion:setTop(30);
    obj.dscPotion:setWidth(400);
    obj.dscPotion:setHeight(290);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.dscPotion);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("grey");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setHeight(180);
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(35);
    obj.layout1:setMargins({bottom=4});
    obj.layout1:setName("layout1");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout1);
    obj.label45:setLeft(15);
    obj.label45:setTop(10);
    obj.label45:setText("Nome do Item");
    obj.label45:setAutoSize(true);
    obj.label45:setName("label45");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout1);
    obj.edit42:setLeft(132);
    obj.edit42:setTop(10);
    obj.edit42:setWidth(150);
    obj.edit42:setHeight(25);
    obj.edit42:setField("NomePotion");
    obj.edit42:setName("edit42");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout1);
    obj.comboBox1:setLeft(290);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(82);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setField("EscolherPote");
    obj.comboBox1:setFontColor("#00FFFF");
    obj.comboBox1:setValue("{'HP', 'MP'}");
    obj.comboBox1:setItems({'HP', 'MP'});
    obj.comboBox1:setName("comboBox1");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle1);
    obj.label46:setLeft(20);
    obj.label46:setTop(80);
    obj.label46:setText("Foto do Item");
    obj.label46:setName("label46");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.rectangle1);
    obj.image6:setAlign("left");
    obj.image6:setMargins({top=-70});
    obj.image6:setEditable(true);
    obj.image6:setField("campoURLImagem");
    obj.image6:setWidth(130);
    obj.image6:setName("image6");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("client");
    obj.layout2:setMargins({left=2});
    obj.layout2:setName("layout2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout2);
    obj.textEditor1:setTop(5);
    obj.textEditor1:setLeft(1);
    obj.textEditor1:setWidth(240);
    obj.textEditor1:setHeight(150);
    obj.textEditor1:setField("campoTextoGrande");
    obj.textEditor1:setName("textEditor1");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout2);
    obj.button6:setTop(220);
    obj.button6:setLeft(50);
    obj.button6:setFontColor("red");
    obj.button6:setText("Apagar!");
    obj.button6:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button6:setWidth(150);
    obj.button6:setName("button6");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle1);
    obj.label47:setLeft(15);
    obj.label47:setTop(205);
    obj.label47:setText("Recuperação");
    obj.label47:setAutoSize(true);
    obj.label47:setName("label47");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle1);
    obj.edit43:setLeft(132);
    obj.edit43:setTop(205);
    obj.edit43:setWidth(150);
    obj.edit43:setHeight(25);
    obj.edit43:setFontColor("Blue");
    obj.edit43:setField("ItemRegen");
    obj.edit43:setName("edit43");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle1);
    obj.button7:setTop(205);
    obj.button7:setLeft(290);
    obj.button7:setFontColor("blue");
    obj.button7:setText("Consumir");
    obj.button7:setWidth(82);
    obj.button7:setHeight(25);
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox1);
    obj.button8:setLeft(300);
    obj.button8:setTop(390);
    obj.button8:setWidth(60);
    obj.button8:setHeight(60);
    obj.button8:setName("button8");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox1);
    obj.image7:setLeft(305);
    obj.image7:setTop(395);
    obj.image7:setWidth(50);
    obj.image7:setHeight(50);
    obj.image7:setSRC("/imagens/potion.png");
    obj.image7:setName("image7");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.scrollBox1);
    obj.edit44:setLeft(305);
    obj.edit44:setTop(365);
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(25);
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(20);
    obj.edit44:setFontColor("red");
    obj.edit44:setField("limitePotion");
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.scrollBox1);
    obj.edit45:setLeft(225);
    obj.edit45:setTop(449);
    obj.edit45:setWidth(50);
    obj.edit45:setHeight(30);
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontSize(20);
    obj.edit45:setFontColor("#FFD700");
    obj.edit45:setField("sloot");
    obj.edit45:setName("edit45");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setTop(450);
    obj.layout3:setWidth(150);
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({bottom=4});
    obj.layout3:setName("layout3");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout3);
    obj.button9:setText("Novo Espaço");
    obj.button9:setWidth(150);
    obj.button9:setAlign("left");
    obj.button9:setName("button9");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.scrollBox1);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmItemDaLista");
    obj.rclListaDosItens:setTop(500);
    obj.rclListaDosItens:setWidth(615);
    obj.rclListaDosItens:setHeight(400);
    obj.rclListaDosItens:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.scrollBox1);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setLeft(198);
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setTop(500);
    obj.boxDetalhesDoItem:setWidth(400);
    obj.boxDetalhesDoItem:setHeight(300);
    obj.boxDetalhesDoItem:setMargins({left=4, right=4});

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.boxDetalhesDoItem);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setHeight(280);
    obj.rectangle2:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle2:setName("rectangle2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(35);
    obj.layout4:setMargins({bottom=4});
    obj.layout4:setName("layout4");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout4);
    obj.label48:setLeft(15);
    obj.label48:setTop(10);
    obj.label48:setText("Nome do Item");
    obj.label48:setAutoSize(true);
    obj.label48:setName("label48");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout4);
    obj.edit46:setLeft(132);
    obj.edit46:setTop(10);
    obj.edit46:setWidth(150);
    obj.edit46:setHeight(25);
    obj.edit46:setField("campoTitulo");
    obj.edit46:setName("edit46");

    obj.chbConsu = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.chbConsu:setParent(obj.layout4);
    obj.chbConsu:setName("chbConsu");
    obj.chbConsu:setLeft(290);
    obj.chbConsu:setTop(12);
    obj.chbConsu:setText("Consumivel");
    obj.chbConsu:setField("Consumivel");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle2);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(230);
    obj.layout5:setName("layout5");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout5);
    obj.label49:setLeft(20);
    obj.label49:setTop(80);
    obj.label49:setText("Foto do Item");
    obj.label49:setName("label49");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout5);
    obj.image8:setAlign("left");
    obj.image8:setMargins({top=-70});
    obj.image8:setEditable(true);
    obj.image8:setField("campoURLImagem");
    obj.image8:setWidth(130);
    obj.image8:setName("image8");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("client");
    obj.layout6:setMargins({left=2});
    obj.layout6:setName("layout6");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout6);
    obj.textEditor2:setTop(5);
    obj.textEditor2:setLeft(1);
    obj.textEditor2:setWidth(240);
    obj.textEditor2:setHeight(150);
    obj.textEditor2:setField("campoTextoGrande");
    obj.textEditor2:setName("textEditor2");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout6);
    obj.button10:setTop(200);
    obj.button10:setLeft(50);
    obj.button10:setFontColor("red");
    obj.button10:setText("Apagar!");
    obj.button10:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button10:setWidth(150);
    obj.button10:setName("button10");

    obj.labReg = GUI.fromHandle(_obj_newObject("label"));
    obj.labReg:setParent(obj.layout5);
    obj.labReg:setName("labReg");
    obj.labReg:setLeft(15);
    obj.labReg:setTop(160);
    obj.labReg:setText("Tipo");
    obj.labReg:setAutoSize(true);

    obj.edtReg = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtReg:setParent(obj.layout5);
    obj.edtReg:setName("edtReg");
    obj.edtReg:setLeft(132);
    obj.edtReg:setTop(160);
    obj.edtReg:setWidth(150);
    obj.edtReg:setHeight(25);
    obj.edtReg:setFontColor("Blue");
    obj.edtReg:setField("TipoItem");

    obj.btnTipoItem = GUI.fromHandle(_obj_newObject("button"));
    obj.btnTipoItem:setParent(obj.layout5);
    obj.btnTipoItem:setName("btnTipoItem");
    obj.btnTipoItem:setTop(160);
    obj.btnTipoItem:setLeft(290);
    obj.btnTipoItem:setFontColor("blue");
    obj.btnTipoItem:setText("Consumir");
    obj.btnTipoItem:setWidth(100);
    obj.btnTipoItem:setHeight(25);

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.BarraFlecha.max = sheet.MaxFlecha;
            				self.BarraFlecha.value = sheet.AtualFlecha
            				
            				if sheet.AtualFlecha > sheet.MaxFlecha then
            					sheet.AtualFlecha = (tonumber(sheet.MaxFlecha) or 0);
            				end;
        end);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (event)
            self.DBArma:show();
        end);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (event)
            self.DBOutramao:show();
        end);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (event)
            self.DBArmadura:show();
        end);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (event)
            self.DBAcessorio:show();
        end);

    obj._e_event5 = obj.button5:addEventListener("onClick",
        function (event)
            self.rclListaDePotion:append();
        end);

    obj._e_event6 = obj.rclListaDePotion:addEventListener("onSelect",
        function ()
            if self.rclListaDePotion.selectedNode then
            						local node = self.rclListaDePotion.selectedNode; 
            						self.dscPotion.node = node;                       
            						self.dscPotion.visible = (node ~= nil);
            						
            						if self.boxDetalhesDoItem.visible == true then 
            							self.dscPotion.node.NomePotion = self.dscPotion.node.NomePotion or 'Nome do Item';
            							self.dscPotion.node.ItemRegen = self.dscPotion.node.ItemRegen or 0;
            							self.dscPotion.node.campoTextoGrande = self.dscPotion.node.campoTextoGrande or 'Descrição do Item';
            							self.dscPotion.node.EscolherPote = self.dscPotion.node.EscolherPote or 'HP';
            						end;
            					end;
        end);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (event)
            NDB.deleteNode(self.dscPotion.node);
        end);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (event)
            local mesa = Firecast.getRoomOf(sheet)
            							local node = self.rclListaDePotion.selectedNode; 
            							self.dscPotion.node = node;   	
            							
            							sheet.limitePotion = tonumber(sheet.limitePotion) or 0
            							
            							if sheet.limitePotion > 0 then
            								if node.EscolherPote == "HP" then
            									local HPATUAL = sheet.HPAtual
            									local HPPRAREGENERAR = tonumber(HPATUAL) + tonumber(self.dscPotion.node.ItemRegen);
            									sheet.HPAtual = tonumber(HPPRAREGENERAR)
            									mesa.meuJogador:requestSetBarValue(1, sheet.HPAtual, nil);
            									local minhaMesa = Firecast.getRoomOf(sheet);
            									local chat = minhaMesa.chat;                      
            									chat:enviarMensagem("[§K3]O Jogador " .. sheet.Nome .. "[§K4] consumiu o Potion de HP: " .. self.dscPotion.node.campoTextoGrande .. " Regenerando [" .. self.dscPotion.node.ItemRegen .. "]");							
            									sheet.limitePotion = tonumber(sheet.limitePotion) - 1;
            									self.dscPotion.visible = false;
            									NDB.deleteNode(self.rclListaDePotion.selectedNode);
            								elseif node.EscolherPote == "MP" then
            									local MPATUAL = sheet.MPAtual
            									local MPPRAREGENERAR = tonumber(MPATUAL) + tonumber(self.dscPotion.node.ItemRegen);
            									sheet.MPAtual = tonumber(MPPRAREGENERAR)
            									mesa.meuJogador:requestSetBarValue(2, sheet.MPAtual, nil);
            									local minhaMesa = Firecast.getRoomOf(sheet);
            									local chat = minhaMesa.chat;                      
            									chat:enviarMensagem("[§K3]O Jogador " .. sheet.Nome .. "[§K2] consumiu o Potion de MP: " .. self.dscPotion.node.campoTextoGrande .. " [ Regenerando [" .. self.dscPotion.node.ItemRegen .. "]");								
            									sheet.limitePotion = tonumber(sheet.limitePotion) - 1;
            									self.dscPotion.visible = false;
            									NDB.deleteNode(self.rclListaDePotion.selectedNode);
            								end;														
            							else
            								local minhaMesa = Firecast.getRoomOf(sheet);
            								local chat = minhaMesa.chat;                      
            								chat:enviarMensagem("O Jogador " .. sheet.Nome .. " Alcançou o Limite diario de Potions");
            							end;
        end);

    obj._e_event9 = obj.button8:addEventListener("onClick",
        function (event)
            self.popPotion:show();
        end);

    obj._e_event10 = obj.button9:addEventListener("onClick",
        function (event)
            -- Usuário clicou no botão de criar novo item.
            					-- Vamos inserir um novo item no nosso recordList                              
            					self.rclListaDosItens:append();
        end);

    obj._e_event11 = obj.rclListaDosItens:addEventListener("onSelect",
        function ()
            local node = self.rclListaDosItens.selectedNode;  
            				self.boxDetalhesDoItem.node = node;                       
            				self.boxDetalhesDoItem.visible = (node ~= nil);
            				
            				if self.boxDetalhesDoItem.visible == true then 
            					self.boxDetalhesDoItem.node.campoTitulo = self.boxDetalhesDoItem.node.campoTitulo or 'Nome do Item';
            					self.boxDetalhesDoItem.node.ItemRegen = self.boxDetalhesDoItem.node.ItemRegen or 0;
            					self.boxDetalhesDoItem.node.campoTextoGrande = self.boxDetalhesDoItem.node.campoTextoGrande or 'Descrição do Item';
            					
            					if self.boxDetalhesDoItem.node.Consumivel == true then
            						self.labReg.visible = true
            						self.edtReg.visible = true
            						self.btnTipoItem.visible = true
            					else
            						self.labReg.visible = false
            						self.edtReg.visible = false
            						self.btnTipoItem.visible = false
            					end;						
            				end;
        end);

    obj._e_event12 = obj.chbConsu:addEventListener("onChange",
        function ()
            if self.chbConsu.checked then
            								self.labReg.visible = true
            								self.edtReg.visible = true
            								self.btnTipoItem.visible = true
            							else
            								self.labReg.visible = false
            								self.edtReg.visible = false
            								self.btnTipoItem.visible = false
            							end;
        end);

    obj._e_event13 = obj.button10:addEventListener("onClick",
        function (event)
            NDB.deleteNode(self.boxDetalhesDoItem.node);
        end);

    obj._e_event14 = obj.btnTipoItem:addEventListener("onClick",
        function (event)
            local mesa = Firecast.getMesaDe(sheet); 	
            							
            							local node = self.rclListaDosItens.selectedNode;  
            							self.boxDetalhesDoItem.node = node; 
            							
            							if self.boxDetalhesDoItem.node.TipoItem == 'Livro de Sabedoria Corporal' then
            								sheet.ControladorAtributos = tonumber(sheet.ControladorAtributos) + (tonumber(sheet.PontoHabilidade) or 0);
            								sheet.PontoHabilidade = 0;
            								NDB.deleteNode(self.rclListaDosItens.selectedNode);
            								self.boxDetalhesDoItem.visible = false;
            							end;
        end);

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

        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.DBArmadura ~= nil then self.DBArmadura:destroy(); self.DBArmadura = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.labReg ~= nil then self.labReg:destroy(); self.labReg = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.popPotion ~= nil then self.popPotion:destroy(); self.popPotion = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.DBAcessorio ~= nil then self.DBAcessorio:destroy(); self.DBAcessorio = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.DBArma ~= nil then self.DBArma:destroy(); self.DBArma = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.btnTipoItem ~= nil then self.btnTipoItem:destroy(); self.btnTipoItem = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dscPotion ~= nil then self.dscPotion:destroy(); self.dscPotion = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.edtReg ~= nil then self.edtReg:destroy(); self.edtReg = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.BarraFlecha ~= nil then self.BarraFlecha:destroy(); self.BarraFlecha = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.DBOutramao ~= nil then self.DBOutramao:destroy(); self.DBOutramao = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.rclListaDePotion ~= nil then self.rclListaDePotion:destroy(); self.rclListaDePotion = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.chbConsu ~= nil then self.chbConsu:destroy(); self.chbConsu = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmequip()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmequip();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmequip = {
    newEditor = newfrmequip, 
    new = newfrmequip, 
    name = "frmequip", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmequip = _frmequip;
Firecast.registrarForm(_frmequip);

return _frmequip;
