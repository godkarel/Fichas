require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmscv()
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
    obj:setDataType("CombateVelen");
    obj:setTitle("Velen Sistema de Combate");
    obj:setName("frmscv");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setLeft(1);
    obj.image1:setTop(1);
    obj.image1:setWidth(1050);
    obj.image1:setHeight(600);
    obj.image1:setSRC("/imagens/1.png");
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(10);
    obj.edit1:setTop(10);
    obj.edit1:setWidth(30);
    obj.edit1:setType("number");
    obj.edit1:setVisible(false);
    obj.edit1:setHeight(30);
    obj.edit1:setField("VJ");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(225);
    obj.edit2:setTop(555);
    obj.edit2:setWidth(30);
    obj.edit2:setType("number");
    obj.edit2:setVisible(true);
    obj.edit2:setHeight(30);
    obj.edit2:setField("turno");
    obj.edit2:setName("edit2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(445);
    obj.rectangle1:setTop(277);
    obj.rectangle1:setWidth(300);
    obj.rectangle1:setHeight(80);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setStrokeColor("Red");
    obj.rectangle1:setStrokeSize(3);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(450);
    obj.label1:setTop(283);
    obj.label1:setHeight(30);
    obj.label1:setWidth(80);
    obj.label1:setFontSize(30);
    obj.label1:setText("Vez");
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(500);
    obj.button1:setTop(283);
    obj.button1:setText("«");
    obj.button1:setFontSize(31);
    obj.button1:setHeight(35);
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(535);
    obj.label2:setTop(285);
    obj.label2:setHeight(30);
    obj.label2:setWidth(80);
    obj.label2:setFontSize(15);
    obj.label2:setFontColor("white");
    obj.label2:setField("Vezde");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(710);
    obj.label3:setTop(285);
    obj.label3:setHeight(30);
    obj.label3:setWidth(80);
    obj.label3:setFontSize(25);
    obj.label3:setFontColor("red");
    obj.label3:setField("turno");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(600);
    obj.edit3:setTop(320);
    obj.edit3:setHeight(30);
    obj.edit3:setWidth(40);
    obj.edit3:setMax(6);
    obj.edit3:setType("number");
    obj.edit3:setFontSize(25);
    obj.edit3:setFontColor("red");
    obj.edit3:setField("Emcombate");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(450);
    obj.label4:setTop(320);
    obj.label4:setHeight(30);
    obj.label4:setWidth(200);
    obj.label4:setFontSize(25);
    obj.label4:setText("Em Combate");
    obj.label4:setFontColor("white");
    obj.label4:setName("label4");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(600);
    obj.button2:setTop(283);
    obj.button2:setText("»");
    obj.button2:setFontSize(31);
    obj.button2:setHeight(35);
    obj.button2:setWidth(30);
    obj.button2:setName("button2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setLeft(635);
    obj.label5:setTop(283);
    obj.label5:setHeight(30);
    obj.label5:setWidth(80);
    obj.label5:setFontSize(20);
    obj.label5:setText("Rodada");
    obj.label5:setName("label5");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setLeft(40);
    obj.button3:setTop(40);
    obj.button3:setWidth(100);
    obj.button3:setHeight(100);
    obj.button3:setName("button3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setLeft(60);
    obj.label6:setTop(80);
    obj.label6:setText("Jogador 1");
    obj.label6:setField("NomeJ1");
    obj.label6:setName("label6");

    obj.PopJ1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ1:setParent(obj);
    obj.PopJ1:setName("PopJ1");
    obj.PopJ1:setWidth(400);
    obj.PopJ1:setHeight(450);
    obj.PopJ1:setBackOpacity(0.5);

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.PopJ1);
    obj.label7:setLeft(20);
    obj.label7:setTop(20);
    obj.label7:setHeight(30);
    obj.label7:setWidth(80);
    obj.label7:setText("Nome");
    obj.label7:setName("label7");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.PopJ1);
    obj.edit4:setLeft(80);
    obj.edit4:setTop(20);
    obj.edit4:setHeight(30);
    obj.edit4:setWidth(80);
    obj.edit4:setField("NomeJ1");
    obj.edit4:setName("edit4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.PopJ1);
    obj.label8:setLeft(20);
    obj.label8:setTop(80);
    obj.label8:setHeight(30);
    obj.label8:setWidth(80);
    obj.label8:setText("Dano");
    obj.label8:setName("label8");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.PopJ1);
    obj.edit5:setLeft(80);
    obj.edit5:setTop(80);
    obj.edit5:setHeight(30);
    obj.edit5:setWidth(80);
    obj.edit5:setField("DanoJ1");
    obj.edit5:setName("edit5");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.PopJ1);
    obj.label9:setLeft(170);
    obj.label9:setTop(80);
    obj.label9:setHeight(30);
    obj.label9:setWidth(80);
    obj.label9:setText("Buff Dano");
    obj.label9:setName("label9");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.PopJ1);
    obj.edit6:setLeft(250);
    obj.edit6:setTop(80);
    obj.edit6:setHeight(30);
    obj.edit6:setWidth(80);
    obj.edit6:setField("BuffDNJ1");
    obj.edit6:setName("edit6");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.PopJ1);
    obj.label10:setLeft(20);
    obj.label10:setTop(140);
    obj.label10:setHeight(30);
    obj.label10:setWidth(80);
    obj.label10:setText("Redução");
    obj.label10:setName("label10");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.PopJ1);
    obj.edit7:setLeft(80);
    obj.edit7:setTop(140);
    obj.edit7:setHeight(30);
    obj.edit7:setWidth(80);
    obj.edit7:setField("ReducaoJ1");
    obj.edit7:setName("edit7");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.PopJ1);
    obj.label11:setLeft(170);
    obj.label11:setTop(140);
    obj.label11:setHeight(30);
    obj.label11:setWidth(80);
    obj.label11:setText("Buff Redução");
    obj.label11:setName("label11");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.PopJ1);
    obj.edit8:setLeft(250);
    obj.edit8:setTop(140);
    obj.edit8:setHeight(30);
    obj.edit8:setWidth(80);
    obj.edit8:setField("BuffReduJ1");
    obj.edit8:setName("edit8");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.PopJ1);
    obj.label12:setLeft(170);
    obj.label12:setTop(20);
    obj.label12:setHeight(30);
    obj.label12:setWidth(80);
    obj.label12:setFontColor("red");
    obj.label12:setText("Target/Alvo");
    obj.label12:setName("label12");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.PopJ1);
    obj.comboBox1:setLeft(250);
    obj.comboBox1:setTop(20);
    obj.comboBox1:setScale(1.4);
    obj.comboBox1:setField("Alvo1");
    obj.comboBox1:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6'});
    obj.comboBox1:setName("comboBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.PopJ1);
    obj.dataLink1:setFields({'Alvo1', 'Alvo2', 'Alvo3', 'Alvo4', 'Alvo5', 'Alvo6', 'VIDAJ1', 'VIDAJ2', 'VIDAJ3', 'VIDAJ4', 'VIDAJ5', 'VIDAJ6'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.PopJ1);
    obj.dataLink2:setFields({'ReducaoJ1', 'ReducaoJ2', 'ReducaoJ3', 'ReducaoJ4', 'ReducaoJ5', 'ReducaoJ6', 'BuffReduJ1', 'BuffReduJ2', 'BuffReduJ3', 'BuffReduJ4', 'BuffReduJ5', 'BuffReduJ6'});
    obj.dataLink2:setName("dataLink2");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.PopJ1);
    obj.button4:setLeft(20);
    obj.button4:setTop(180);
    obj.button4:setFontColor("red");
    obj.button4:setText("DANO");
    obj.button4:setWidth(100);
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.PopJ1);
    obj.button5:setLeft(250);
    obj.button5:setTop(180);
    obj.button5:setText("Limpar");
    obj.button5:setWidth(100);
    obj.button5:setName("button5");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.PopJ1);
    obj.label13:setLeft(20);
    obj.label13:setTop(200);
    obj.label13:setHeight(30);
    obj.label13:setWidth(150);
    obj.label13:setFontSize(20);
    obj.label13:setFontColor("MediumBlue");
    obj.label13:setText("Dano Causado");
    obj.label13:setName("label13");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.PopJ1);
    obj.rectangle2:setLeft(20);
    obj.rectangle2:setTop(240);
    obj.rectangle2:setWidth(130);
    obj.rectangle2:setHeight(30);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setStrokeColor("DarkGray");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setName("rectangle2");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.PopJ1);
    obj.label14:setLeft(25);
    obj.label14:setTop(240);
    obj.label14:setWidth(130);
    obj.label14:setHeight(30);
    obj.label14:setText("white");
    obj.label14:setFontSize(20);
    obj.label14:setFontColor("red");
    obj.label14:setField("DC1");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.PopJ1);
    obj.label15:setLeft(220);
    obj.label15:setTop(200);
    obj.label15:setHeight(30);
    obj.label15:setWidth(150);
    obj.label15:setFontSize(20);
    obj.label15:setFontColor("MediumBlue");
    obj.label15:setText("Dano Total");
    obj.label15:setName("label15");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.PopJ1);
    obj.rectangle3:setLeft(220);
    obj.rectangle3:setTop(240);
    obj.rectangle3:setWidth(130);
    obj.rectangle3:setHeight(30);
    obj.rectangle3:setColor("DarkGray");
    obj.rectangle3:setStrokeColor("Red");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setName("rectangle3");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.PopJ1);
    obj.label16:setLeft(225);
    obj.label16:setTop(240);
    obj.label16:setWidth(130);
    obj.label16:setHeight(30);
    obj.label16:setText("white");
    obj.label16:setFontSize(20);
    obj.label16:setFontColor("red");
    obj.label16:setField("DT1");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.PopJ1);
    obj.label17:setLeft(220);
    obj.label17:setTop(280);
    obj.label17:setHeight(30);
    obj.label17:setWidth(150);
    obj.label17:setFontSize(20);
    obj.label17:setFontColor("MediumBlue");
    obj.label17:setText("Numero da Vez");
    obj.label17:setName("label17");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.PopJ1);
    obj.edit9:setLeft(220);
    obj.edit9:setTop(315);
    obj.edit9:setWidth(130);
    obj.edit9:setHeight(30);
    obj.edit9:setText("white");
    obj.edit9:setFontSize(20);
    obj.edit9:setField("TJ1");
    obj.edit9:setName("edit9");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.PopJ1);
    obj.label18:setLeft(20);
    obj.label18:setTop(280);
    obj.label18:setHeight(30);
    obj.label18:setWidth(150);
    obj.label18:setFontSize(20);
    obj.label18:setFontColor("MediumBlue");
    obj.label18:setText("Critical");
    obj.label18:setName("label18");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.PopJ1);
    obj.rectangle4:setLeft(20);
    obj.rectangle4:setTop(315);
    obj.rectangle4:setWidth(130);
    obj.rectangle4:setHeight(30);
    obj.rectangle4:setColor("DarkGray");
    obj.rectangle4:setStrokeColor("red");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setName("rectangle4");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.PopJ1);
    obj.label19:setLeft(25);
    obj.label19:setTop(315);
    obj.label19:setWidth(130);
    obj.label19:setHeight(30);
    obj.label19:setText("white");
    obj.label19:setFontSize(20);
    obj.label19:setFontColor("red");
    obj.label19:setField("CI1");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.PopJ1);
    obj.label20:setLeft(20);
    obj.label20:setTop(350);
    obj.label20:setHeight(30);
    obj.label20:setWidth(150);
    obj.label20:setFontSize(20);
    obj.label20:setFontColor("MediumBlue");
    obj.label20:setText("Vida do Player");
    obj.label20:setName("label20");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.PopJ1);
    obj.edit10:setLeft(20);
    obj.edit10:setTop(385);
    obj.edit10:setWidth(130);
    obj.edit10:setHeight(30);
    obj.edit10:setField("VIDAJ1");
    obj.edit10:setName("edit10");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.PopJ1);
    obj.label21:setLeft(220);
    obj.label21:setTop(350);
    obj.label21:setHeight(30);
    obj.label21:setWidth(150);
    obj.label21:setFontSize(20);
    obj.label21:setFontColor("MediumBlue");
    obj.label21:setText("Vida do Inimigo");
    obj.label21:setName("label21");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.PopJ1);
    obj.rectangle5:setLeft(220);
    obj.rectangle5:setTop(385);
    obj.rectangle5:setWidth(130);
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("DarkGray");
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setName("rectangle5");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.PopJ1);
    obj.label22:setLeft(225);
    obj.label22:setTop(385);
    obj.label22:setWidth(130);
    obj.label22:setHeight(30);
    obj.label22:setText("white");
    obj.label22:setFontSize(20);
    obj.label22:setFontColor("red");
    obj.label22:setField("VI1");
    obj.label22:setName("label22");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.PopJ1);
    obj.edit11:setLeft(20);
    obj.edit11:setTop(420);
    obj.edit11:setHeight(30);
    obj.edit11:setVisible(false);
    obj.edit11:setWidth(80);
    obj.edit11:setField("Sobra1");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.PopJ1);
    obj.edit12:setLeft(220);
    obj.edit12:setTop(420);
    obj.edit12:setHeight(30);
    obj.edit12:setVisible(false);
    obj.edit12:setWidth(80);
    obj.edit12:setField("TR1");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.PopJ1);
    obj.edit13:setLeft(220);
    obj.edit13:setTop(420);
    obj.edit13:setHeight(30);
    obj.edit13:setVisible(false);
    obj.edit13:setWidth(80);
    obj.edit13:setField("Macete1");
    obj.edit13:setName("edit13");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj);
    obj.button6:setLeft(170);
    obj.button6:setTop(40);
    obj.button6:setWidth(100);
    obj.button6:setHeight(100);
    obj.button6:setName("button6");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj);
    obj.label23:setLeft(190);
    obj.label23:setTop(80);
    obj.label23:setText("Jogador 2");
    obj.label23:setField("NomeJ2");
    obj.label23:setName("label23");

    obj.PopJ2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ2:setParent(obj);
    obj.PopJ2:setName("PopJ2");
    obj.PopJ2:setWidth(400);
    obj.PopJ2:setHeight(450);
    obj.PopJ2:setBackOpacity(0.5);

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.PopJ2);
    obj.label24:setLeft(20);
    obj.label24:setTop(20);
    obj.label24:setHeight(30);
    obj.label24:setWidth(80);
    obj.label24:setText("Nome");
    obj.label24:setName("label24");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.PopJ2);
    obj.edit14:setLeft(80);
    obj.edit14:setTop(20);
    obj.edit14:setHeight(30);
    obj.edit14:setWidth(80);
    obj.edit14:setField("NomeJ2");
    obj.edit14:setName("edit14");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.PopJ2);
    obj.label25:setLeft(20);
    obj.label25:setTop(80);
    obj.label25:setHeight(30);
    obj.label25:setWidth(80);
    obj.label25:setText("Dano");
    obj.label25:setName("label25");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.PopJ2);
    obj.edit15:setLeft(80);
    obj.edit15:setTop(80);
    obj.edit15:setHeight(30);
    obj.edit15:setWidth(80);
    obj.edit15:setField("DanoJ2");
    obj.edit15:setName("edit15");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.PopJ2);
    obj.label26:setLeft(170);
    obj.label26:setTop(80);
    obj.label26:setHeight(30);
    obj.label26:setWidth(80);
    obj.label26:setText("Buff Dano");
    obj.label26:setName("label26");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.PopJ2);
    obj.edit16:setLeft(250);
    obj.edit16:setTop(80);
    obj.edit16:setHeight(30);
    obj.edit16:setWidth(80);
    obj.edit16:setField("BuffDNJ2");
    obj.edit16:setName("edit16");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.PopJ2);
    obj.label27:setLeft(20);
    obj.label27:setTop(140);
    obj.label27:setHeight(30);
    obj.label27:setWidth(80);
    obj.label27:setText("Redução");
    obj.label27:setName("label27");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.PopJ2);
    obj.edit17:setLeft(80);
    obj.edit17:setTop(140);
    obj.edit17:setHeight(30);
    obj.edit17:setWidth(80);
    obj.edit17:setField("ReducaoJ2");
    obj.edit17:setName("edit17");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.PopJ2);
    obj.label28:setLeft(170);
    obj.label28:setTop(140);
    obj.label28:setHeight(30);
    obj.label28:setWidth(80);
    obj.label28:setText("Buff Redução");
    obj.label28:setName("label28");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.PopJ2);
    obj.edit18:setLeft(250);
    obj.edit18:setTop(140);
    obj.edit18:setHeight(30);
    obj.edit18:setWidth(80);
    obj.edit18:setField("BuffReduJ2");
    obj.edit18:setName("edit18");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.PopJ2);
    obj.label29:setLeft(170);
    obj.label29:setTop(20);
    obj.label29:setHeight(30);
    obj.label29:setWidth(80);
    obj.label29:setFontColor("red");
    obj.label29:setText("Target/Alvo");
    obj.label29:setName("label29");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.PopJ2);
    obj.comboBox2:setLeft(250);
    obj.comboBox2:setTop(20);
    obj.comboBox2:setScale(1.4);
    obj.comboBox2:setField("Alvo2");
    obj.comboBox2:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.PopJ2);
    obj.dataLink3:setFields({'Alvo1', 'Alvo2', 'Alvo3', 'Alvo4', 'Alvo5', 'Alvo6', 'VIDAJ1', 'VIDAJ2', 'VIDAJ3', 'VIDAJ4', 'VIDAJ5', 'VIDAJ6'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.PopJ2);
    obj.dataLink4:setFields({'ReducaoJ1', 'ReducaoJ2', 'ReducaoJ3', 'ReducaoJ4', 'ReducaoJ5', 'ReducaoJ6', 'BuffReduJ1', 'BuffReduJ2', 'BuffReduJ3', 'BuffReduJ4', 'BuffReduJ5', 'BuffReduJ6'});
    obj.dataLink4:setName("dataLink4");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.PopJ2);
    obj.button7:setLeft(20);
    obj.button7:setTop(180);
    obj.button7:setFontColor("red");
    obj.button7:setText("DANO");
    obj.button7:setWidth(100);
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.PopJ2);
    obj.button8:setLeft(250);
    obj.button8:setTop(180);
    obj.button8:setText("Limpar");
    obj.button8:setWidth(100);
    obj.button8:setName("button8");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.PopJ2);
    obj.label30:setLeft(20);
    obj.label30:setTop(200);
    obj.label30:setHeight(30);
    obj.label30:setWidth(150);
    obj.label30:setFontSize(20);
    obj.label30:setFontColor("MediumBlue");
    obj.label30:setText("Dano Causado");
    obj.label30:setName("label30");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.PopJ2);
    obj.rectangle6:setLeft(20);
    obj.rectangle6:setTop(240);
    obj.rectangle6:setWidth(130);
    obj.rectangle6:setHeight(30);
    obj.rectangle6:setColor("white");
    obj.rectangle6:setStrokeColor("DarkGray");
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setName("rectangle6");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.PopJ2);
    obj.label31:setLeft(25);
    obj.label31:setTop(240);
    obj.label31:setWidth(130);
    obj.label31:setHeight(30);
    obj.label31:setText("white");
    obj.label31:setFontSize(20);
    obj.label31:setFontColor("red");
    obj.label31:setField("DC2");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.PopJ2);
    obj.label32:setLeft(220);
    obj.label32:setTop(200);
    obj.label32:setHeight(30);
    obj.label32:setWidth(150);
    obj.label32:setFontSize(20);
    obj.label32:setFontColor("MediumBlue");
    obj.label32:setText("Dano Total");
    obj.label32:setName("label32");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.PopJ2);
    obj.rectangle7:setLeft(220);
    obj.rectangle7:setTop(240);
    obj.rectangle7:setWidth(130);
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setColor("DarkGray");
    obj.rectangle7:setStrokeColor("Red");
    obj.rectangle7:setStrokeSize(2);
    obj.rectangle7:setName("rectangle7");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.PopJ2);
    obj.label33:setLeft(225);
    obj.label33:setTop(240);
    obj.label33:setWidth(130);
    obj.label33:setHeight(30);
    obj.label33:setText("white");
    obj.label33:setFontSize(20);
    obj.label33:setFontColor("red");
    obj.label33:setField("DT2");
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.PopJ2);
    obj.label34:setLeft(220);
    obj.label34:setTop(280);
    obj.label34:setHeight(30);
    obj.label34:setWidth(150);
    obj.label34:setFontSize(20);
    obj.label34:setFontColor("MediumBlue");
    obj.label34:setText("Numero da Vez");
    obj.label34:setName("label34");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.PopJ2);
    obj.edit19:setLeft(220);
    obj.edit19:setTop(315);
    obj.edit19:setWidth(130);
    obj.edit19:setHeight(30);
    obj.edit19:setText("white");
    obj.edit19:setFontSize(20);
    obj.edit19:setField("TJ2");
    obj.edit19:setName("edit19");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.PopJ2);
    obj.label35:setLeft(20);
    obj.label35:setTop(280);
    obj.label35:setHeight(30);
    obj.label35:setWidth(150);
    obj.label35:setFontSize(20);
    obj.label35:setFontColor("MediumBlue");
    obj.label35:setText("Critical");
    obj.label35:setName("label35");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.PopJ2);
    obj.rectangle8:setLeft(20);
    obj.rectangle8:setTop(315);
    obj.rectangle8:setWidth(130);
    obj.rectangle8:setHeight(30);
    obj.rectangle8:setColor("DarkGray");
    obj.rectangle8:setStrokeColor("red");
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setName("rectangle8");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.PopJ2);
    obj.label36:setLeft(25);
    obj.label36:setTop(315);
    obj.label36:setWidth(130);
    obj.label36:setHeight(30);
    obj.label36:setText("white");
    obj.label36:setFontSize(20);
    obj.label36:setFontColor("red");
    obj.label36:setField("CI2");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.PopJ2);
    obj.label37:setLeft(20);
    obj.label37:setTop(350);
    obj.label37:setHeight(30);
    obj.label37:setWidth(150);
    obj.label37:setFontSize(20);
    obj.label37:setFontColor("MediumBlue");
    obj.label37:setText("Vida do Player");
    obj.label37:setName("label37");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.PopJ2);
    obj.edit20:setLeft(20);
    obj.edit20:setTop(385);
    obj.edit20:setWidth(130);
    obj.edit20:setHeight(30);
    obj.edit20:setField("VIDAJ2");
    obj.edit20:setName("edit20");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.PopJ2);
    obj.label38:setLeft(220);
    obj.label38:setTop(350);
    obj.label38:setHeight(30);
    obj.label38:setWidth(150);
    obj.label38:setFontSize(20);
    obj.label38:setFontColor("MediumBlue");
    obj.label38:setText("Vida do Inimigo");
    obj.label38:setName("label38");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.PopJ2);
    obj.rectangle9:setLeft(220);
    obj.rectangle9:setTop(385);
    obj.rectangle9:setWidth(130);
    obj.rectangle9:setHeight(30);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("DarkGray");
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setName("rectangle9");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.PopJ2);
    obj.label39:setLeft(225);
    obj.label39:setTop(385);
    obj.label39:setWidth(130);
    obj.label39:setHeight(30);
    obj.label39:setText("white");
    obj.label39:setFontSize(20);
    obj.label39:setFontColor("red");
    obj.label39:setField("VI2");
    obj.label39:setName("label39");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.PopJ2);
    obj.edit21:setLeft(20);
    obj.edit21:setTop(420);
    obj.edit21:setHeight(30);
    obj.edit21:setVisible(false);
    obj.edit21:setWidth(80);
    obj.edit21:setField("Sobra2");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.PopJ2);
    obj.edit22:setLeft(220);
    obj.edit22:setTop(420);
    obj.edit22:setHeight(30);
    obj.edit22:setVisible(false);
    obj.edit22:setWidth(80);
    obj.edit22:setField("TR2");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.PopJ2);
    obj.edit23:setLeft(220);
    obj.edit23:setTop(420);
    obj.edit23:setHeight(30);
    obj.edit23:setVisible(false);
    obj.edit23:setWidth(80);
    obj.edit23:setField("Macete2");
    obj.edit23:setName("edit23");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj);
    obj.button9:setLeft(300);
    obj.button9:setTop(40);
    obj.button9:setWidth(100);
    obj.button9:setHeight(100);
    obj.button9:setName("button9");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj);
    obj.label40:setLeft(320);
    obj.label40:setTop(80);
    obj.label40:setText("Jogador 3");
    obj.label40:setField("NomeJ3");
    obj.label40:setName("label40");

    obj.PopJ3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ3:setParent(obj);
    obj.PopJ3:setName("PopJ3");
    obj.PopJ3:setWidth(400);
    obj.PopJ3:setHeight(450);
    obj.PopJ3:setBackOpacity(0.5);

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.PopJ3);
    obj.label41:setLeft(20);
    obj.label41:setTop(20);
    obj.label41:setHeight(30);
    obj.label41:setWidth(80);
    obj.label41:setText("Nome");
    obj.label41:setName("label41");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.PopJ3);
    obj.edit24:setLeft(80);
    obj.edit24:setTop(20);
    obj.edit24:setHeight(30);
    obj.edit24:setWidth(80);
    obj.edit24:setField("NomeJ3");
    obj.edit24:setName("edit24");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.PopJ3);
    obj.label42:setLeft(20);
    obj.label42:setTop(80);
    obj.label42:setHeight(30);
    obj.label42:setWidth(80);
    obj.label42:setText("Dano");
    obj.label42:setName("label42");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.PopJ3);
    obj.edit25:setLeft(80);
    obj.edit25:setTop(80);
    obj.edit25:setHeight(30);
    obj.edit25:setWidth(80);
    obj.edit25:setField("DanoJ3");
    obj.edit25:setName("edit25");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.PopJ3);
    obj.label43:setLeft(170);
    obj.label43:setTop(80);
    obj.label43:setHeight(30);
    obj.label43:setWidth(80);
    obj.label43:setText("Buff Dano");
    obj.label43:setName("label43");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.PopJ3);
    obj.edit26:setLeft(250);
    obj.edit26:setTop(80);
    obj.edit26:setHeight(30);
    obj.edit26:setWidth(80);
    obj.edit26:setField("BuffDNJ3");
    obj.edit26:setName("edit26");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.PopJ3);
    obj.label44:setLeft(20);
    obj.label44:setTop(140);
    obj.label44:setHeight(30);
    obj.label44:setWidth(80);
    obj.label44:setText("Redução");
    obj.label44:setName("label44");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.PopJ3);
    obj.edit27:setLeft(80);
    obj.edit27:setTop(140);
    obj.edit27:setHeight(30);
    obj.edit27:setWidth(80);
    obj.edit27:setField("ReducaoJ3");
    obj.edit27:setName("edit27");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.PopJ3);
    obj.label45:setLeft(170);
    obj.label45:setTop(140);
    obj.label45:setHeight(30);
    obj.label45:setWidth(80);
    obj.label45:setText("Buff Redução");
    obj.label45:setName("label45");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.PopJ3);
    obj.edit28:setLeft(250);
    obj.edit28:setTop(140);
    obj.edit28:setHeight(30);
    obj.edit28:setWidth(80);
    obj.edit28:setField("BuffReduJ3");
    obj.edit28:setName("edit28");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.PopJ3);
    obj.label46:setLeft(170);
    obj.label46:setTop(20);
    obj.label46:setHeight(30);
    obj.label46:setWidth(80);
    obj.label46:setFontColor("red");
    obj.label46:setText("Target/Alvo");
    obj.label46:setName("label46");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.PopJ3);
    obj.comboBox3:setLeft(250);
    obj.comboBox3:setTop(20);
    obj.comboBox3:setScale(1.4);
    obj.comboBox3:setField("Alvo3");
    obj.comboBox3:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.PopJ3);
    obj.dataLink5:setFields({'Alvo1', 'Alvo2', 'Alvo3', 'Alvo4', 'Alvo5', 'Alvo6', 'VIDAJ1', 'VIDAJ2', 'VIDAJ3', 'VIDAJ4', 'VIDAJ5', 'VIDAJ6'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.PopJ3);
    obj.dataLink6:setFields({'ReducaoJ1', 'ReducaoJ2', 'ReducaoJ3', 'ReducaoJ4', 'ReducaoJ5', 'ReducaoJ6', 'BuffReduJ1', 'BuffReduJ2', 'BuffReduJ3', 'BuffReduJ4', 'BuffReduJ5', 'BuffReduJ6'});
    obj.dataLink6:setName("dataLink6");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.PopJ3);
    obj.button10:setLeft(20);
    obj.button10:setTop(180);
    obj.button10:setFontColor("red");
    obj.button10:setText("DANO");
    obj.button10:setWidth(100);
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.PopJ3);
    obj.button11:setLeft(250);
    obj.button11:setTop(180);
    obj.button11:setText("Limpar");
    obj.button11:setWidth(100);
    obj.button11:setName("button11");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.PopJ3);
    obj.label47:setLeft(20);
    obj.label47:setTop(200);
    obj.label47:setHeight(30);
    obj.label47:setWidth(150);
    obj.label47:setFontSize(20);
    obj.label47:setFontColor("MediumBlue");
    obj.label47:setText("Dano Causado");
    obj.label47:setName("label47");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.PopJ3);
    obj.rectangle10:setLeft(20);
    obj.rectangle10:setTop(240);
    obj.rectangle10:setWidth(130);
    obj.rectangle10:setHeight(30);
    obj.rectangle10:setColor("white");
    obj.rectangle10:setStrokeColor("DarkGray");
    obj.rectangle10:setStrokeSize(2);
    obj.rectangle10:setName("rectangle10");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.PopJ3);
    obj.label48:setLeft(25);
    obj.label48:setTop(240);
    obj.label48:setWidth(130);
    obj.label48:setHeight(30);
    obj.label48:setText("white");
    obj.label48:setFontSize(20);
    obj.label48:setFontColor("red");
    obj.label48:setField("DC3");
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.PopJ3);
    obj.label49:setLeft(220);
    obj.label49:setTop(200);
    obj.label49:setHeight(30);
    obj.label49:setWidth(150);
    obj.label49:setFontSize(20);
    obj.label49:setFontColor("MediumBlue");
    obj.label49:setText("Dano Total");
    obj.label49:setName("label49");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.PopJ3);
    obj.rectangle11:setLeft(220);
    obj.rectangle11:setTop(240);
    obj.rectangle11:setWidth(130);
    obj.rectangle11:setHeight(30);
    obj.rectangle11:setColor("DarkGray");
    obj.rectangle11:setStrokeColor("Red");
    obj.rectangle11:setStrokeSize(2);
    obj.rectangle11:setName("rectangle11");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.PopJ3);
    obj.label50:setLeft(225);
    obj.label50:setTop(240);
    obj.label50:setWidth(130);
    obj.label50:setHeight(30);
    obj.label50:setText("white");
    obj.label50:setFontSize(20);
    obj.label50:setFontColor("red");
    obj.label50:setField("DT3");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.PopJ3);
    obj.label51:setLeft(220);
    obj.label51:setTop(280);
    obj.label51:setHeight(30);
    obj.label51:setWidth(150);
    obj.label51:setFontSize(20);
    obj.label51:setFontColor("MediumBlue");
    obj.label51:setText("Numero da Vez");
    obj.label51:setName("label51");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.PopJ3);
    obj.edit29:setLeft(220);
    obj.edit29:setTop(315);
    obj.edit29:setWidth(130);
    obj.edit29:setHeight(30);
    obj.edit29:setText("white");
    obj.edit29:setFontSize(20);
    obj.edit29:setField("TJ3");
    obj.edit29:setName("edit29");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.PopJ3);
    obj.label52:setLeft(20);
    obj.label52:setTop(280);
    obj.label52:setHeight(30);
    obj.label52:setWidth(150);
    obj.label52:setFontSize(20);
    obj.label52:setFontColor("MediumBlue");
    obj.label52:setText("Critical");
    obj.label52:setName("label52");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.PopJ3);
    obj.rectangle12:setLeft(20);
    obj.rectangle12:setTop(315);
    obj.rectangle12:setWidth(130);
    obj.rectangle12:setHeight(30);
    obj.rectangle12:setColor("DarkGray");
    obj.rectangle12:setStrokeColor("red");
    obj.rectangle12:setStrokeSize(2);
    obj.rectangle12:setName("rectangle12");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.PopJ3);
    obj.label53:setLeft(25);
    obj.label53:setTop(315);
    obj.label53:setWidth(130);
    obj.label53:setHeight(30);
    obj.label53:setText("white");
    obj.label53:setFontSize(20);
    obj.label53:setFontColor("red");
    obj.label53:setField("CI3");
    obj.label53:setName("label53");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.PopJ3);
    obj.label54:setLeft(20);
    obj.label54:setTop(350);
    obj.label54:setHeight(30);
    obj.label54:setWidth(150);
    obj.label54:setFontSize(20);
    obj.label54:setFontColor("MediumBlue");
    obj.label54:setText("Vida do Player");
    obj.label54:setName("label54");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.PopJ3);
    obj.edit30:setLeft(20);
    obj.edit30:setTop(385);
    obj.edit30:setWidth(130);
    obj.edit30:setHeight(30);
    obj.edit30:setField("VIDAJ3");
    obj.edit30:setName("edit30");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.PopJ3);
    obj.label55:setLeft(220);
    obj.label55:setTop(350);
    obj.label55:setHeight(30);
    obj.label55:setWidth(150);
    obj.label55:setFontSize(20);
    obj.label55:setFontColor("MediumBlue");
    obj.label55:setText("Vida do Inimigo");
    obj.label55:setName("label55");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.PopJ3);
    obj.rectangle13:setLeft(220);
    obj.rectangle13:setTop(385);
    obj.rectangle13:setWidth(130);
    obj.rectangle13:setHeight(30);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("DarkGray");
    obj.rectangle13:setStrokeSize(2);
    obj.rectangle13:setName("rectangle13");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.PopJ3);
    obj.label56:setLeft(225);
    obj.label56:setTop(385);
    obj.label56:setWidth(130);
    obj.label56:setHeight(30);
    obj.label56:setText("white");
    obj.label56:setFontSize(20);
    obj.label56:setFontColor("red");
    obj.label56:setField("VI3");
    obj.label56:setName("label56");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.PopJ3);
    obj.edit31:setLeft(20);
    obj.edit31:setTop(420);
    obj.edit31:setHeight(30);
    obj.edit31:setVisible(false);
    obj.edit31:setWidth(80);
    obj.edit31:setField("Sobra3");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.PopJ3);
    obj.edit32:setLeft(220);
    obj.edit32:setTop(420);
    obj.edit32:setHeight(30);
    obj.edit32:setVisible(false);
    obj.edit32:setWidth(80);
    obj.edit32:setField("TR3");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.PopJ3);
    obj.edit33:setLeft(220);
    obj.edit33:setTop(420);
    obj.edit33:setHeight(30);
    obj.edit33:setVisible(false);
    obj.edit33:setWidth(80);
    obj.edit33:setField("Macete3");
    obj.edit33:setName("edit33");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj);
    obj.button12:setLeft(430);
    obj.button12:setTop(40);
    obj.button12:setWidth(100);
    obj.button12:setHeight(100);
    obj.button12:setName("button12");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj);
    obj.label57:setLeft(450);
    obj.label57:setTop(80);
    obj.label57:setText("Jogador 4");
    obj.label57:setField("NomeJ4");
    obj.label57:setName("label57");

    obj.PopJ4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ4:setParent(obj);
    obj.PopJ4:setName("PopJ4");
    obj.PopJ4:setWidth(400);
    obj.PopJ4:setHeight(450);
    obj.PopJ4:setBackOpacity(0.5);

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.PopJ4);
    obj.label58:setLeft(20);
    obj.label58:setTop(20);
    obj.label58:setHeight(30);
    obj.label58:setWidth(80);
    obj.label58:setText("Nome");
    obj.label58:setName("label58");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.PopJ4);
    obj.edit34:setLeft(80);
    obj.edit34:setTop(20);
    obj.edit34:setHeight(30);
    obj.edit34:setWidth(80);
    obj.edit34:setField("NomeJ4");
    obj.edit34:setName("edit34");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.PopJ4);
    obj.label59:setLeft(20);
    obj.label59:setTop(80);
    obj.label59:setHeight(30);
    obj.label59:setWidth(80);
    obj.label59:setText("Dano");
    obj.label59:setName("label59");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.PopJ4);
    obj.edit35:setLeft(80);
    obj.edit35:setTop(80);
    obj.edit35:setHeight(30);
    obj.edit35:setWidth(80);
    obj.edit35:setField("DanoJ4");
    obj.edit35:setName("edit35");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.PopJ4);
    obj.label60:setLeft(170);
    obj.label60:setTop(80);
    obj.label60:setHeight(30);
    obj.label60:setWidth(80);
    obj.label60:setText("Buff Dano");
    obj.label60:setName("label60");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.PopJ4);
    obj.edit36:setLeft(250);
    obj.edit36:setTop(80);
    obj.edit36:setHeight(30);
    obj.edit36:setWidth(80);
    obj.edit36:setField("BuffDNJ4");
    obj.edit36:setName("edit36");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.PopJ4);
    obj.label61:setLeft(20);
    obj.label61:setTop(140);
    obj.label61:setHeight(30);
    obj.label61:setWidth(80);
    obj.label61:setText("Redução");
    obj.label61:setName("label61");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.PopJ4);
    obj.edit37:setLeft(80);
    obj.edit37:setTop(140);
    obj.edit37:setHeight(30);
    obj.edit37:setWidth(80);
    obj.edit37:setField("ReducaoJ4");
    obj.edit37:setName("edit37");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.PopJ4);
    obj.label62:setLeft(170);
    obj.label62:setTop(140);
    obj.label62:setHeight(30);
    obj.label62:setWidth(80);
    obj.label62:setText("Buff Redução");
    obj.label62:setName("label62");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.PopJ4);
    obj.edit38:setLeft(250);
    obj.edit38:setTop(140);
    obj.edit38:setHeight(30);
    obj.edit38:setWidth(80);
    obj.edit38:setField("BuffReduJ4");
    obj.edit38:setName("edit38");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.PopJ4);
    obj.label63:setLeft(170);
    obj.label63:setTop(20);
    obj.label63:setHeight(30);
    obj.label63:setWidth(80);
    obj.label63:setFontColor("red");
    obj.label63:setText("Target/Alvo");
    obj.label63:setName("label63");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.PopJ4);
    obj.comboBox4:setLeft(250);
    obj.comboBox4:setTop(20);
    obj.comboBox4:setScale(1.4);
    obj.comboBox4:setField("Alvo4");
    obj.comboBox4:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.PopJ4);
    obj.dataLink7:setFields({'Alvo1', 'Alvo2', 'Alvo3', 'Alvo4', 'Alvo5', 'Alvo6', 'VIDAJ1', 'VIDAJ2', 'VIDAJ3', 'VIDAJ4', 'VIDAJ5', 'VIDAJ6'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.PopJ4);
    obj.dataLink8:setFields({'ReducaoJ1', 'ReducaoJ2', 'ReducaoJ3', 'ReducaoJ4', 'ReducaoJ5', 'ReducaoJ6', 'BuffReduJ1', 'BuffReduJ2', 'BuffReduJ3', 'BuffReduJ4', 'BuffReduJ5', 'BuffReduJ6'});
    obj.dataLink8:setName("dataLink8");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.PopJ4);
    obj.button13:setLeft(20);
    obj.button13:setTop(180);
    obj.button13:setFontColor("red");
    obj.button13:setText("DANO");
    obj.button13:setWidth(100);
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.PopJ4);
    obj.button14:setLeft(250);
    obj.button14:setTop(180);
    obj.button14:setText("Limpar");
    obj.button14:setWidth(100);
    obj.button14:setName("button14");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.PopJ4);
    obj.label64:setLeft(20);
    obj.label64:setTop(200);
    obj.label64:setHeight(30);
    obj.label64:setWidth(150);
    obj.label64:setFontSize(20);
    obj.label64:setFontColor("MediumBlue");
    obj.label64:setText("Dano Causado");
    obj.label64:setName("label64");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.PopJ4);
    obj.rectangle14:setLeft(20);
    obj.rectangle14:setTop(240);
    obj.rectangle14:setWidth(130);
    obj.rectangle14:setHeight(30);
    obj.rectangle14:setColor("white");
    obj.rectangle14:setStrokeColor("DarkGray");
    obj.rectangle14:setStrokeSize(2);
    obj.rectangle14:setName("rectangle14");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.PopJ4);
    obj.label65:setLeft(25);
    obj.label65:setTop(240);
    obj.label65:setWidth(130);
    obj.label65:setHeight(30);
    obj.label65:setText("white");
    obj.label65:setFontSize(20);
    obj.label65:setFontColor("red");
    obj.label65:setField("DC4");
    obj.label65:setName("label65");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.PopJ4);
    obj.label66:setLeft(220);
    obj.label66:setTop(200);
    obj.label66:setHeight(30);
    obj.label66:setWidth(150);
    obj.label66:setFontSize(20);
    obj.label66:setFontColor("MediumBlue");
    obj.label66:setText("Dano Total");
    obj.label66:setName("label66");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.PopJ4);
    obj.rectangle15:setLeft(220);
    obj.rectangle15:setTop(240);
    obj.rectangle15:setWidth(130);
    obj.rectangle15:setHeight(30);
    obj.rectangle15:setColor("DarkGray");
    obj.rectangle15:setStrokeColor("Red");
    obj.rectangle15:setStrokeSize(2);
    obj.rectangle15:setName("rectangle15");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.PopJ4);
    obj.label67:setLeft(225);
    obj.label67:setTop(240);
    obj.label67:setWidth(130);
    obj.label67:setHeight(30);
    obj.label67:setText("white");
    obj.label67:setFontSize(20);
    obj.label67:setFontColor("red");
    obj.label67:setField("DT4");
    obj.label67:setName("label67");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.PopJ4);
    obj.label68:setLeft(220);
    obj.label68:setTop(280);
    obj.label68:setHeight(30);
    obj.label68:setWidth(150);
    obj.label68:setFontSize(20);
    obj.label68:setFontColor("MediumBlue");
    obj.label68:setText("Numero da Vez");
    obj.label68:setName("label68");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.PopJ4);
    obj.edit39:setLeft(220);
    obj.edit39:setTop(315);
    obj.edit39:setWidth(130);
    obj.edit39:setHeight(30);
    obj.edit39:setText("white");
    obj.edit39:setFontSize(20);
    obj.edit39:setField("TJ4");
    obj.edit39:setName("edit39");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.PopJ4);
    obj.label69:setLeft(20);
    obj.label69:setTop(280);
    obj.label69:setHeight(30);
    obj.label69:setWidth(150);
    obj.label69:setFontSize(20);
    obj.label69:setFontColor("MediumBlue");
    obj.label69:setText("Critical");
    obj.label69:setName("label69");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.PopJ4);
    obj.rectangle16:setLeft(20);
    obj.rectangle16:setTop(315);
    obj.rectangle16:setWidth(130);
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setColor("DarkGray");
    obj.rectangle16:setStrokeColor("red");
    obj.rectangle16:setStrokeSize(2);
    obj.rectangle16:setName("rectangle16");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.PopJ4);
    obj.label70:setLeft(25);
    obj.label70:setTop(315);
    obj.label70:setWidth(130);
    obj.label70:setHeight(30);
    obj.label70:setText("white");
    obj.label70:setFontSize(20);
    obj.label70:setFontColor("red");
    obj.label70:setField("CI4");
    obj.label70:setName("label70");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.PopJ4);
    obj.label71:setLeft(20);
    obj.label71:setTop(350);
    obj.label71:setHeight(30);
    obj.label71:setWidth(150);
    obj.label71:setFontSize(20);
    obj.label71:setFontColor("MediumBlue");
    obj.label71:setText("Vida do Player");
    obj.label71:setName("label71");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.PopJ4);
    obj.edit40:setLeft(20);
    obj.edit40:setTop(385);
    obj.edit40:setWidth(130);
    obj.edit40:setHeight(30);
    obj.edit40:setField("VIDAJ4");
    obj.edit40:setName("edit40");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.PopJ4);
    obj.label72:setLeft(220);
    obj.label72:setTop(350);
    obj.label72:setHeight(30);
    obj.label72:setWidth(150);
    obj.label72:setFontSize(20);
    obj.label72:setFontColor("MediumBlue");
    obj.label72:setText("Vida do Inimigo");
    obj.label72:setName("label72");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.PopJ4);
    obj.rectangle17:setLeft(220);
    obj.rectangle17:setTop(385);
    obj.rectangle17:setWidth(130);
    obj.rectangle17:setHeight(30);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("DarkGray");
    obj.rectangle17:setStrokeSize(2);
    obj.rectangle17:setName("rectangle17");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.PopJ4);
    obj.label73:setLeft(225);
    obj.label73:setTop(385);
    obj.label73:setWidth(130);
    obj.label73:setHeight(30);
    obj.label73:setText("white");
    obj.label73:setFontSize(20);
    obj.label73:setFontColor("red");
    obj.label73:setField("VI4");
    obj.label73:setName("label73");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.PopJ4);
    obj.edit41:setLeft(20);
    obj.edit41:setTop(420);
    obj.edit41:setHeight(30);
    obj.edit41:setVisible(false);
    obj.edit41:setWidth(80);
    obj.edit41:setField("Sobra4");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.PopJ4);
    obj.edit42:setLeft(220);
    obj.edit42:setTop(420);
    obj.edit42:setHeight(30);
    obj.edit42:setVisible(false);
    obj.edit42:setWidth(80);
    obj.edit42:setField("TR4");
    obj.edit42:setName("edit42");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.PopJ4);
    obj.edit43:setLeft(220);
    obj.edit43:setTop(420);
    obj.edit43:setHeight(30);
    obj.edit43:setVisible(false);
    obj.edit43:setWidth(80);
    obj.edit43:setField("Macete4");
    obj.edit43:setName("edit43");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj);
    obj.button15:setLeft(560);
    obj.button15:setTop(40);
    obj.button15:setWidth(100);
    obj.button15:setHeight(100);
    obj.button15:setName("button15");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj);
    obj.label74:setLeft(580);
    obj.label74:setTop(80);
    obj.label74:setText("Jogador 5");
    obj.label74:setField("NomeJ5");
    obj.label74:setName("label74");

    obj.PopJ5 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ5:setParent(obj);
    obj.PopJ5:setName("PopJ5");
    obj.PopJ5:setWidth(400);
    obj.PopJ5:setHeight(450);
    obj.PopJ5:setBackOpacity(0.5);

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.PopJ5);
    obj.label75:setLeft(20);
    obj.label75:setTop(20);
    obj.label75:setHeight(30);
    obj.label75:setWidth(80);
    obj.label75:setText("Nome");
    obj.label75:setName("label75");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.PopJ5);
    obj.edit44:setLeft(80);
    obj.edit44:setTop(20);
    obj.edit44:setHeight(30);
    obj.edit44:setWidth(80);
    obj.edit44:setField("NomeJ5");
    obj.edit44:setName("edit44");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.PopJ5);
    obj.label76:setLeft(20);
    obj.label76:setTop(80);
    obj.label76:setHeight(30);
    obj.label76:setWidth(80);
    obj.label76:setText("Dano");
    obj.label76:setName("label76");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.PopJ5);
    obj.edit45:setLeft(80);
    obj.edit45:setTop(80);
    obj.edit45:setHeight(30);
    obj.edit45:setWidth(80);
    obj.edit45:setField("DanoJ5");
    obj.edit45:setName("edit45");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.PopJ5);
    obj.label77:setLeft(170);
    obj.label77:setTop(80);
    obj.label77:setHeight(30);
    obj.label77:setWidth(80);
    obj.label77:setText("Buff Dano");
    obj.label77:setName("label77");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.PopJ5);
    obj.edit46:setLeft(250);
    obj.edit46:setTop(80);
    obj.edit46:setHeight(30);
    obj.edit46:setWidth(80);
    obj.edit46:setField("BuffDNJ5");
    obj.edit46:setName("edit46");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.PopJ5);
    obj.label78:setLeft(20);
    obj.label78:setTop(140);
    obj.label78:setHeight(30);
    obj.label78:setWidth(80);
    obj.label78:setText("Redução");
    obj.label78:setName("label78");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.PopJ5);
    obj.edit47:setLeft(80);
    obj.edit47:setTop(140);
    obj.edit47:setHeight(30);
    obj.edit47:setWidth(80);
    obj.edit47:setField("ReducaoJ5");
    obj.edit47:setName("edit47");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.PopJ5);
    obj.label79:setLeft(170);
    obj.label79:setTop(140);
    obj.label79:setHeight(30);
    obj.label79:setWidth(80);
    obj.label79:setText("Buff Redução");
    obj.label79:setName("label79");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.PopJ5);
    obj.edit48:setLeft(250);
    obj.edit48:setTop(140);
    obj.edit48:setHeight(30);
    obj.edit48:setWidth(80);
    obj.edit48:setField("BuffReduJ5");
    obj.edit48:setName("edit48");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.PopJ5);
    obj.label80:setLeft(170);
    obj.label80:setTop(20);
    obj.label80:setHeight(30);
    obj.label80:setWidth(80);
    obj.label80:setFontColor("red");
    obj.label80:setText("Target/Alvo");
    obj.label80:setName("label80");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.PopJ5);
    obj.comboBox5:setLeft(250);
    obj.comboBox5:setTop(20);
    obj.comboBox5:setScale(1.4);
    obj.comboBox5:setField("Alvo5");
    obj.comboBox5:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.PopJ5);
    obj.dataLink9:setFields({'Alvo1', 'Alvo2', 'Alvo3', 'Alvo4', 'Alvo5', 'Alvo6', 'VIDAJ1', 'VIDAJ2', 'VIDAJ3', 'VIDAJ4', 'VIDAJ5', 'VIDAJ6'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.PopJ5);
    obj.dataLink10:setFields({'ReducaoJ1', 'ReducaoJ2', 'ReducaoJ3', 'ReducaoJ4', 'ReducaoJ5', 'ReducaoJ6', 'BuffReduJ1', 'BuffReduJ2', 'BuffReduJ3', 'BuffReduJ4', 'BuffReduJ5', 'BuffReduJ6'});
    obj.dataLink10:setName("dataLink10");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.PopJ5);
    obj.button16:setLeft(20);
    obj.button16:setTop(180);
    obj.button16:setFontColor("red");
    obj.button16:setText("DANO");
    obj.button16:setWidth(100);
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.PopJ5);
    obj.button17:setLeft(250);
    obj.button17:setTop(180);
    obj.button17:setText("Limpar");
    obj.button17:setWidth(100);
    obj.button17:setName("button17");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.PopJ5);
    obj.label81:setLeft(20);
    obj.label81:setTop(200);
    obj.label81:setHeight(30);
    obj.label81:setWidth(150);
    obj.label81:setFontSize(20);
    obj.label81:setFontColor("MediumBlue");
    obj.label81:setText("Dano Causado");
    obj.label81:setName("label81");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.PopJ5);
    obj.rectangle18:setLeft(20);
    obj.rectangle18:setTop(240);
    obj.rectangle18:setWidth(130);
    obj.rectangle18:setHeight(30);
    obj.rectangle18:setColor("white");
    obj.rectangle18:setStrokeColor("DarkGray");
    obj.rectangle18:setStrokeSize(2);
    obj.rectangle18:setName("rectangle18");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.PopJ5);
    obj.label82:setLeft(25);
    obj.label82:setTop(240);
    obj.label82:setWidth(130);
    obj.label82:setHeight(30);
    obj.label82:setText("white");
    obj.label82:setFontSize(20);
    obj.label82:setFontColor("red");
    obj.label82:setField("DC5");
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.PopJ5);
    obj.label83:setLeft(220);
    obj.label83:setTop(200);
    obj.label83:setHeight(30);
    obj.label83:setWidth(150);
    obj.label83:setFontSize(20);
    obj.label83:setFontColor("MediumBlue");
    obj.label83:setText("Dano Total");
    obj.label83:setName("label83");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.PopJ5);
    obj.rectangle19:setLeft(220);
    obj.rectangle19:setTop(240);
    obj.rectangle19:setWidth(130);
    obj.rectangle19:setHeight(30);
    obj.rectangle19:setColor("DarkGray");
    obj.rectangle19:setStrokeColor("Red");
    obj.rectangle19:setStrokeSize(2);
    obj.rectangle19:setName("rectangle19");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.PopJ5);
    obj.label84:setLeft(225);
    obj.label84:setTop(240);
    obj.label84:setWidth(130);
    obj.label84:setHeight(30);
    obj.label84:setText("white");
    obj.label84:setFontSize(20);
    obj.label84:setFontColor("red");
    obj.label84:setField("DT5");
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.PopJ5);
    obj.label85:setLeft(220);
    obj.label85:setTop(280);
    obj.label85:setHeight(30);
    obj.label85:setWidth(150);
    obj.label85:setFontSize(20);
    obj.label85:setFontColor("MediumBlue");
    obj.label85:setText("Numero da Vez");
    obj.label85:setName("label85");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.PopJ5);
    obj.edit49:setLeft(220);
    obj.edit49:setTop(315);
    obj.edit49:setWidth(130);
    obj.edit49:setHeight(30);
    obj.edit49:setText("white");
    obj.edit49:setFontSize(20);
    obj.edit49:setField("TJ5");
    obj.edit49:setName("edit49");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.PopJ5);
    obj.label86:setLeft(20);
    obj.label86:setTop(280);
    obj.label86:setHeight(30);
    obj.label86:setWidth(150);
    obj.label86:setFontSize(20);
    obj.label86:setFontColor("MediumBlue");
    obj.label86:setText("Critical");
    obj.label86:setName("label86");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.PopJ5);
    obj.rectangle20:setLeft(20);
    obj.rectangle20:setTop(315);
    obj.rectangle20:setWidth(130);
    obj.rectangle20:setHeight(30);
    obj.rectangle20:setColor("DarkGray");
    obj.rectangle20:setStrokeColor("red");
    obj.rectangle20:setStrokeSize(2);
    obj.rectangle20:setName("rectangle20");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.PopJ5);
    obj.label87:setLeft(25);
    obj.label87:setTop(315);
    obj.label87:setWidth(130);
    obj.label87:setHeight(30);
    obj.label87:setText("white");
    obj.label87:setFontSize(20);
    obj.label87:setFontColor("red");
    obj.label87:setField("CI5");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.PopJ5);
    obj.label88:setLeft(20);
    obj.label88:setTop(350);
    obj.label88:setHeight(30);
    obj.label88:setWidth(150);
    obj.label88:setFontSize(20);
    obj.label88:setFontColor("MediumBlue");
    obj.label88:setText("Vida do Player");
    obj.label88:setName("label88");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.PopJ5);
    obj.edit50:setLeft(20);
    obj.edit50:setTop(385);
    obj.edit50:setWidth(130);
    obj.edit50:setHeight(30);
    obj.edit50:setField("VIDAJ5");
    obj.edit50:setName("edit50");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.PopJ5);
    obj.label89:setLeft(220);
    obj.label89:setTop(350);
    obj.label89:setHeight(30);
    obj.label89:setWidth(150);
    obj.label89:setFontSize(20);
    obj.label89:setFontColor("MediumBlue");
    obj.label89:setText("Vida do Inimigo");
    obj.label89:setName("label89");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.PopJ5);
    obj.rectangle21:setLeft(220);
    obj.rectangle21:setTop(385);
    obj.rectangle21:setWidth(130);
    obj.rectangle21:setHeight(30);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("DarkGray");
    obj.rectangle21:setStrokeSize(2);
    obj.rectangle21:setName("rectangle21");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.PopJ5);
    obj.label90:setLeft(225);
    obj.label90:setTop(385);
    obj.label90:setWidth(130);
    obj.label90:setHeight(30);
    obj.label90:setText("white");
    obj.label90:setFontSize(20);
    obj.label90:setFontColor("red");
    obj.label90:setField("VI5");
    obj.label90:setName("label90");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.PopJ5);
    obj.edit51:setLeft(20);
    obj.edit51:setTop(420);
    obj.edit51:setHeight(30);
    obj.edit51:setVisible(false);
    obj.edit51:setWidth(80);
    obj.edit51:setField("Sobra5");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.PopJ5);
    obj.edit52:setLeft(220);
    obj.edit52:setTop(420);
    obj.edit52:setHeight(30);
    obj.edit52:setVisible(false);
    obj.edit52:setWidth(80);
    obj.edit52:setField("TR5");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.PopJ5);
    obj.edit53:setLeft(220);
    obj.edit53:setTop(420);
    obj.edit53:setHeight(30);
    obj.edit53:setVisible(false);
    obj.edit53:setWidth(80);
    obj.edit53:setField("Macete5");
    obj.edit53:setName("edit53");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj);
    obj.button18:setLeft(690);
    obj.button18:setTop(40);
    obj.button18:setWidth(100);
    obj.button18:setHeight(100);
    obj.button18:setName("button18");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj);
    obj.label91:setLeft(710);
    obj.label91:setTop(80);
    obj.label91:setText("Jogador 6");
    obj.label91:setField("NomeJ6");
    obj.label91:setName("label91");

    obj.PopJ6 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ6:setParent(obj);
    obj.PopJ6:setName("PopJ6");
    obj.PopJ6:setWidth(400);
    obj.PopJ6:setHeight(450);
    obj.PopJ6:setBackOpacity(0.5);

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.PopJ6);
    obj.label92:setLeft(20);
    obj.label92:setTop(20);
    obj.label92:setHeight(30);
    obj.label92:setWidth(80);
    obj.label92:setText("Nome");
    obj.label92:setName("label92");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.PopJ6);
    obj.edit54:setLeft(80);
    obj.edit54:setTop(20);
    obj.edit54:setHeight(30);
    obj.edit54:setWidth(80);
    obj.edit54:setField("NomeJ6");
    obj.edit54:setName("edit54");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.PopJ6);
    obj.label93:setLeft(20);
    obj.label93:setTop(80);
    obj.label93:setHeight(30);
    obj.label93:setWidth(80);
    obj.label93:setText("Dano");
    obj.label93:setName("label93");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.PopJ6);
    obj.edit55:setLeft(80);
    obj.edit55:setTop(80);
    obj.edit55:setHeight(30);
    obj.edit55:setWidth(80);
    obj.edit55:setField("DanoJ6");
    obj.edit55:setName("edit55");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.PopJ6);
    obj.label94:setLeft(170);
    obj.label94:setTop(80);
    obj.label94:setHeight(30);
    obj.label94:setWidth(80);
    obj.label94:setText("Buff Dano");
    obj.label94:setName("label94");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.PopJ6);
    obj.edit56:setLeft(250);
    obj.edit56:setTop(80);
    obj.edit56:setHeight(30);
    obj.edit56:setWidth(80);
    obj.edit56:setField("BuffDNJ6");
    obj.edit56:setName("edit56");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.PopJ6);
    obj.label95:setLeft(20);
    obj.label95:setTop(140);
    obj.label95:setHeight(30);
    obj.label95:setWidth(80);
    obj.label95:setText("Redução");
    obj.label95:setName("label95");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.PopJ6);
    obj.edit57:setLeft(80);
    obj.edit57:setTop(140);
    obj.edit57:setHeight(30);
    obj.edit57:setWidth(80);
    obj.edit57:setField("ReducaoJ6");
    obj.edit57:setName("edit57");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.PopJ6);
    obj.label96:setLeft(170);
    obj.label96:setTop(140);
    obj.label96:setHeight(30);
    obj.label96:setWidth(80);
    obj.label96:setText("Buff Redução");
    obj.label96:setName("label96");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.PopJ6);
    obj.edit58:setLeft(250);
    obj.edit58:setTop(140);
    obj.edit58:setHeight(30);
    obj.edit58:setWidth(80);
    obj.edit58:setField("BuffReduJ6");
    obj.edit58:setName("edit58");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.PopJ6);
    obj.label97:setLeft(170);
    obj.label97:setTop(20);
    obj.label97:setHeight(30);
    obj.label97:setWidth(80);
    obj.label97:setFontColor("red");
    obj.label97:setText("Target/Alvo");
    obj.label97:setName("label97");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.PopJ6);
    obj.comboBox6:setLeft(250);
    obj.comboBox6:setTop(20);
    obj.comboBox6:setScale(1.4);
    obj.comboBox6:setField("Alvo6");
    obj.comboBox6:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6'});
    obj.comboBox6:setName("comboBox6");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.PopJ6);
    obj.dataLink11:setFields({'Alvo1', 'Alvo2', 'Alvo3', 'Alvo4', 'Alvo5', 'Alvo6', 'VIDAJ1', 'VIDAJ2', 'VIDAJ3', 'VIDAJ4', 'VIDAJ5', 'VIDAJ6'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.PopJ6);
    obj.dataLink12:setFields({'ReducaoJ1', 'ReducaoJ2', 'ReducaoJ3', 'ReducaoJ4', 'ReducaoJ5', 'ReducaoJ6', 'BuffReduJ1', 'BuffReduJ2', 'BuffReduJ3', 'BuffReduJ4', 'BuffReduJ5', 'BuffReduJ6'});
    obj.dataLink12:setName("dataLink12");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.PopJ6);
    obj.button19:setLeft(20);
    obj.button19:setTop(180);
    obj.button19:setFontColor("red");
    obj.button19:setText("DANO");
    obj.button19:setWidth(100);
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.PopJ6);
    obj.button20:setLeft(250);
    obj.button20:setTop(180);
    obj.button20:setText("Limpar");
    obj.button20:setWidth(100);
    obj.button20:setName("button20");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.PopJ6);
    obj.label98:setLeft(20);
    obj.label98:setTop(200);
    obj.label98:setHeight(30);
    obj.label98:setWidth(150);
    obj.label98:setFontSize(20);
    obj.label98:setFontColor("MediumBlue");
    obj.label98:setText("Dano Causado");
    obj.label98:setName("label98");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.PopJ6);
    obj.rectangle22:setLeft(20);
    obj.rectangle22:setTop(240);
    obj.rectangle22:setWidth(130);
    obj.rectangle22:setHeight(30);
    obj.rectangle22:setColor("white");
    obj.rectangle22:setStrokeColor("DarkGray");
    obj.rectangle22:setStrokeSize(2);
    obj.rectangle22:setName("rectangle22");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.PopJ6);
    obj.label99:setLeft(25);
    obj.label99:setTop(240);
    obj.label99:setWidth(130);
    obj.label99:setHeight(30);
    obj.label99:setText("white");
    obj.label99:setFontSize(20);
    obj.label99:setFontColor("red");
    obj.label99:setField("DC6");
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.PopJ6);
    obj.label100:setLeft(220);
    obj.label100:setTop(200);
    obj.label100:setHeight(30);
    obj.label100:setWidth(150);
    obj.label100:setFontSize(20);
    obj.label100:setFontColor("MediumBlue");
    obj.label100:setText("Dano Total");
    obj.label100:setName("label100");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.PopJ6);
    obj.rectangle23:setLeft(220);
    obj.rectangle23:setTop(240);
    obj.rectangle23:setWidth(130);
    obj.rectangle23:setHeight(30);
    obj.rectangle23:setColor("DarkGray");
    obj.rectangle23:setStrokeColor("Red");
    obj.rectangle23:setStrokeSize(2);
    obj.rectangle23:setName("rectangle23");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.PopJ6);
    obj.label101:setLeft(225);
    obj.label101:setTop(240);
    obj.label101:setWidth(130);
    obj.label101:setHeight(30);
    obj.label101:setText("white");
    obj.label101:setFontSize(20);
    obj.label101:setFontColor("red");
    obj.label101:setField("DT6");
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.PopJ6);
    obj.label102:setLeft(220);
    obj.label102:setTop(280);
    obj.label102:setHeight(30);
    obj.label102:setWidth(150);
    obj.label102:setFontSize(20);
    obj.label102:setFontColor("MediumBlue");
    obj.label102:setText("Numero da Vez");
    obj.label102:setName("label102");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.PopJ6);
    obj.edit59:setLeft(220);
    obj.edit59:setTop(315);
    obj.edit59:setWidth(130);
    obj.edit59:setHeight(30);
    obj.edit59:setText("white");
    obj.edit59:setFontSize(20);
    obj.edit59:setField("TJ6");
    obj.edit59:setName("edit59");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.PopJ6);
    obj.label103:setLeft(20);
    obj.label103:setTop(280);
    obj.label103:setHeight(30);
    obj.label103:setWidth(150);
    obj.label103:setFontSize(20);
    obj.label103:setFontColor("MediumBlue");
    obj.label103:setText("Critical");
    obj.label103:setName("label103");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.PopJ6);
    obj.rectangle24:setLeft(20);
    obj.rectangle24:setTop(315);
    obj.rectangle24:setWidth(130);
    obj.rectangle24:setHeight(30);
    obj.rectangle24:setColor("DarkGray");
    obj.rectangle24:setStrokeColor("red");
    obj.rectangle24:setStrokeSize(2);
    obj.rectangle24:setName("rectangle24");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.PopJ6);
    obj.label104:setLeft(25);
    obj.label104:setTop(315);
    obj.label104:setWidth(130);
    obj.label104:setHeight(30);
    obj.label104:setText("white");
    obj.label104:setFontSize(20);
    obj.label104:setFontColor("red");
    obj.label104:setField("CI6");
    obj.label104:setName("label104");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.PopJ6);
    obj.label105:setLeft(20);
    obj.label105:setTop(350);
    obj.label105:setHeight(30);
    obj.label105:setWidth(150);
    obj.label105:setFontSize(20);
    obj.label105:setFontColor("MediumBlue");
    obj.label105:setText("Vida do Player");
    obj.label105:setName("label105");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.PopJ6);
    obj.edit60:setLeft(20);
    obj.edit60:setTop(385);
    obj.edit60:setWidth(130);
    obj.edit60:setHeight(30);
    obj.edit60:setField("VIDAJ6");
    obj.edit60:setName("edit60");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.PopJ6);
    obj.label106:setLeft(220);
    obj.label106:setTop(350);
    obj.label106:setHeight(30);
    obj.label106:setWidth(150);
    obj.label106:setFontSize(20);
    obj.label106:setFontColor("MediumBlue");
    obj.label106:setText("Vida do Inimigo");
    obj.label106:setName("label106");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.PopJ6);
    obj.rectangle25:setLeft(220);
    obj.rectangle25:setTop(385);
    obj.rectangle25:setWidth(130);
    obj.rectangle25:setHeight(30);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("DarkGray");
    obj.rectangle25:setStrokeSize(2);
    obj.rectangle25:setName("rectangle25");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.PopJ6);
    obj.label107:setLeft(225);
    obj.label107:setTop(385);
    obj.label107:setWidth(130);
    obj.label107:setHeight(30);
    obj.label107:setText("white");
    obj.label107:setFontSize(20);
    obj.label107:setFontColor("red");
    obj.label107:setField("VI6");
    obj.label107:setName("label107");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.PopJ6);
    obj.edit61:setLeft(20);
    obj.edit61:setTop(420);
    obj.edit61:setHeight(30);
    obj.edit61:setVisible(false);
    obj.edit61:setWidth(80);
    obj.edit61:setField("Sobra6");
    obj.edit61:setName("edit61");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.PopJ6);
    obj.edit62:setLeft(220);
    obj.edit62:setTop(420);
    obj.edit62:setHeight(30);
    obj.edit62:setVisible(false);
    obj.edit62:setWidth(80);
    obj.edit62:setField("TR6");
    obj.edit62:setName("edit62");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.PopJ6);
    obj.edit63:setLeft(220);
    obj.edit63:setTop(420);
    obj.edit63:setHeight(30);
    obj.edit63:setVisible(false);
    obj.edit63:setWidth(80);
    obj.edit63:setField("Macete6");
    obj.edit63:setName("edit63");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj);
    obj.button21:setLeft(10);
    obj.button21:setTop(550);
    obj.button21:setText("ZERAR TUDO");
    obj.button21:setFontColor("red");
    obj.button21:setFontSize(25);
    obj.button21:setHeight(35);
    obj.button21:setWidth(200);
    obj.button21:setName("button21");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            sheet.VJ = (tonumber(sheet.VJ) or 0) - 1
            						
            						
             
            						if sheet.VJ < 1 then
            						sheet.VJ = 0
            						sheet.turno = (tonumber(sheet.turno) or 0) - 1
            						end;
            						
            						if sheet.VJ == 1 then
            						sheet.Vezde = (sheet.NomeJ1)
            						end;
            
            						if sheet.VJ == 2 then
            						sheet.Vezde = (sheet.NomeJ2)
            						end;						
            
            						if sheet.VJ == 3 then
            						sheet.Vezde = (sheet.NomeJ3)
            						end;
            
            						if sheet.VJ == 4 then
            						sheet.Vezde = (sheet.NomeJ4)
            						end;
            
            						if sheet.VJ == 5 then
            						sheet.Vezde = (sheet.NomeJ5)
            						end;
            
            						if sheet.VJ == 6 then
            						sheet.Vezde = (sheet.NomeJ6)
            						end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            sheet.VJ = (tonumber(sheet.VJ) or 0) + 1
            											
            						if sheet.VJ > sheet.Emcombate then
            						sheet.VJ = 0
            						local minhaMesa = Firecast.getRoomOf(sheet);
                                    local chat = minhaMesa.chat;    
            						sheet.turno = (tonumber(sheet.turno) or 0) + 1
            						chat:enviarMensagem("[§U][§K4,0]Proxima Rodada");
            						end;
            						
            						if sheet.VJ == 1 then
            						sheet.Vezde = (sheet.NomeJ1)
            						local minhaMesa = Firecast.getRoomOf(sheet);
                                    local chat = minhaMesa.chat;           
                                    chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ1 .. "[§K9,0] »");
            						chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            						end;
            
            						if sheet.VJ == 2 then
            						sheet.Vezde = (sheet.NomeJ2)
            						local minhaMesa = Firecast.getRoomOf(sheet);
                                    local chat = minhaMesa.chat;    
            						chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ2 .. "[§K9,0] »");
            						chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            						end;						
            
            						if sheet.VJ == 3 then
            						sheet.Vezde = (sheet.NomeJ3)
            						local minhaMesa = Firecast.getRoomOf(sheet);
                                    local chat = minhaMesa.chat;    
            						chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ3 .. "[§K9,0] »");
            						chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            						end;
            
            						if sheet.VJ == 4 then
            						sheet.Vezde = (sheet.NomeJ4)
            						local minhaMesa = Firecast.getRoomOf(sheet);
                                    local chat = minhaMesa.chat;    
            						chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ4 .. "[§K9,0] »");
            						chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            						end;
            
            						if sheet.VJ == 5 then
            						sheet.Vezde = (sheet.NomeJ5)
            						local minhaMesa = Firecast.getRoomOf(sheet);
                                    local chat = minhaMesa.chat;    
            						chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ5 .. "[§K9,0] »");
            						chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            						end;
            
            						if sheet.VJ == 6 then
            						sheet.Vezde = (sheet.NomeJ6)
            						local minhaMesa = Firecast.getRoomOf(sheet);
                                    local chat = minhaMesa.chat;    
            						chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ6 .. "[§K9,0] »");
            						chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            						end;
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            self.PopJ1:show();
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Alvo1 == 'Player1' then
            				 sheet.VI1 = (tonumber(sheet.VIDAJ1) or 0)
            				 end;
            
                             if sheet.Alvo1 == 'Player2' then
            				 sheet.VI1 = (tonumber(sheet.VIDAJ2) or 0)
            				 end;				 
            				 
                             if sheet.Alvo1 == 'Player3' then
            				 sheet.VI1 = (tonumber(sheet.VIDAJ3) or 0)
            				 end;	
            
                             if sheet.Alvo1 == 'Player4' then
            				 sheet.VI1 = (tonumber(sheet.VIDAJ4) or 0)
            				 end;
            
                             if sheet.Alvo1 == 'Player5' then
            				 sheet.VI1 = (tonumber(sheet.VIDAJ5) or 0)
            				 end;				 
            				 
                             if sheet.Alvo1 == 'Player6' then
            				 sheet.VI1 = (tonumber(sheet.VIDAJ6) or 0)
            				 end;
        end, obj);

    obj._e_event4 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.TR1 = (tonumber(sheet.ReducaoJ1) or 0) + (tonumber(sheet.BuffReduJ1) or 0) -100
            				 sheet.Sobra1 = (tonumber(sheet.TR1) or 0) * -1
            				 
            				 sheet.TR2 = (tonumber(sheet.ReducaoJ2) or 0) + (tonumber(sheet.BuffReduJ2) or 0) -100
            				 sheet.Sobra2 = (tonumber(sheet.TR2) or 0) * -1
            				 
            				 sheet.TR3 = (tonumber(sheet.ReducaoJ3) or 0) + (tonumber(sheet.BuffReduJ3) or 0) -100
            				 sheet.Sobra3 = (tonumber(sheet.TR3) or 0) * -1
            				 
            				 sheet.TR4 = (tonumber(sheet.ReducaoJ4) or 0) + (tonumber(sheet.BuffReduJ4) or 0) -100
            				 sheet.Sobra4 = (tonumber(sheet.TR4) or 0) * -1
            				 
            				 sheet.TR5 = (tonumber(sheet.ReducaoJ5) or 0) + (tonumber(sheet.BuffReduJ5) or 0) -100
            				 sheet.Sobra5 = (tonumber(sheet.TR5) or 0) * -1
            				 
            				 sheet.TR6 = (tonumber(sheet.ReducaoJ6) or 0) + (tonumber(sheet.BuffReduJ6) or 0) -100
            				 sheet.Sobra6 = (tonumber(sheet.TR6) or 0) * -1
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (_)
            if sheet.Alvo1 == 'Player1' then
            				 sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            				 sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            				 sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            				 end;
            
                             if sheet.Alvo1 == 'Player2' then
            				 sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            				 sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            				 sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            				 end;				 
            				 
                             if sheet.Alvo1 == 'Player3' then
            				 sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            				 sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            				 sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            				 end;	
            
                             if sheet.Alvo1 == 'Player4' then
            				 sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            				 sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            				 sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            				 end;
                             if sheet.Alvo1 == 'Player5' then
            				 sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            				 sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            				 sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            				 end;			 
            				 
                             if sheet.Alvo1 == 'Player6' then
            				 sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            				 sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            				 sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            				 end;	 
            				 
            				 sheet.DC1 = (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            				 sheet.CI1 = (tonumber(sheet.DC1) or 0) * 2
            				 sheet.DT1 = (tonumber(sheet.DC1) or 0) + (tonumber(sheet.DT1) or 0)
        end, obj);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (_)
            sheet.NomeJ1 = 0
            					sheet.DanoJ1 = 0
            					sheet.BuffDNJ1 = 0
            					sheet.ReducaoJ1 = 0
            					sheet.BuffReduJ1 = 0
            					sheet.DC1 = 0
            					sheet.DT1 = 0
            					sheet.TJ1 = 0
            					sheet.CI1 = 0
            					sheet.VIDAJ1 = 0
            					sheet.VI1 = 0
            					sheet.Sobra1 = 0
            					sheet.TR1 = 0
            					sheet.Macete1 = 0
        end, obj);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (_)
            self.PopJ2:show();
        end, obj);

    obj._e_event8 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Alvo2 == 'Player1' then
            				 sheet.VI2 = (tonumber(sheet.VIDAJ1) or 0)
            				 end;
            
                             if sheet.Alvo2 == 'Player2' then
            				 sheet.VI2 = (tonumber(sheet.VIDAJ2) or 0)
            				 end;				 
            				 
                             if sheet.Alvo2 == 'Player3' then
            				 sheet.VI2 = (tonumber(sheet.VIDAJ3) or 0)
            				 end;	
            
                             if sheet.Alvo2 == 'Player4' then
            				 sheet.VI2 = (tonumber(sheet.VIDAJ4) or 0)
            				 end;
            
                             if sheet.Alvo2 == 'Player5' then
            				 sheet.VI2 = (tonumber(sheet.VIDAJ5) or 0)
            				 end;				 
            				 
                             if sheet.Alvo2 == 'Player6' then
            				 sheet.VI2 = (tonumber(sheet.VIDAJ6) or 0)
            				 end;
        end, obj);

    obj._e_event9 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.TR1 = (tonumber(sheet.ReducaoJ1) or 0) + (tonumber(sheet.BuffReduJ1) or 0) -100
            				 sheet.Sobra1 = (tonumber(sheet.TR1) or 0) * -1
            				 
            				 sheet.TR2 = (tonumber(sheet.ReducaoJ2) or 0) + (tonumber(sheet.BuffReduJ2) or 0) -100
            				 sheet.Sobra2 = (tonumber(sheet.TR2) or 0) * -1
            				 
            				 sheet.TR3 = (tonumber(sheet.ReducaoJ3) or 0) + (tonumber(sheet.BuffReduJ3) or 0) -100
            				 sheet.Sobra3 = (tonumber(sheet.TR3) or 0) * -1
            				 
            				 sheet.TR4 = (tonumber(sheet.ReducaoJ4) or 0) + (tonumber(sheet.BuffReduJ4) or 0) -100
            				 sheet.Sobra4 = (tonumber(sheet.TR4) or 0) * -1
            				 
            				 sheet.TR5 = (tonumber(sheet.ReducaoJ5) or 0) + (tonumber(sheet.BuffReduJ5) or 0) -100
            				 sheet.Sobra5 = (tonumber(sheet.TR5) or 0) * -1
            				 
            				 sheet.TR6 = (tonumber(sheet.ReducaoJ6) or 0) + (tonumber(sheet.BuffReduJ6) or 0) -100
            				 sheet.Sobra6 = (tonumber(sheet.TR6) or 0) * -1
        end, obj);

    obj._e_event10 = obj.button7:addEventListener("onClick",
        function (_)
            if sheet.Alvo2 == 'Player1' then
            				 sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            				 sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            				 sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            				 end;
            
                             if sheet.Alvo2 == 'Player2' then
            				 sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            				 sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            				 sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            				 end;				 
            				 
                             if sheet.Alvo2 == 'Player3' then
            				 sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            				 sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            				 sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            				 end;	
            
                             if sheet.Alvo2 == 'Player4' then
            				 sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            				 sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            				 sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            				 end;
            				 
                             if sheet.Alvo2 == 'Player5' then
            				 sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            				 sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            				 sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            				 end;			 
            				 
                             if sheet.Alvo2 == 'Player6' then
            				 sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            				 sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            				 sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            				 end;	 
            				 
            				 sheet.DC2 = (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            				 sheet.CI2 = (tonumber(sheet.DC2) or 0) * 2
            				 sheet.DT2 = (tonumber(sheet.DC2) or 0) + (tonumber(sheet.DT2) or 0)
        end, obj);

    obj._e_event11 = obj.button8:addEventListener("onClick",
        function (_)
            sheet.NomeJ2 = 0
            					sheet.DanoJ2 = 0
            					sheet.BuffDNJ2 = 0
            					sheet.ReducaoJ2 = 0
            					sheet.BuffReduJ2 = 0
            					sheet.DC2 = 0
            					sheet.DT2 = 0
            					sheet.TJ2 = 0
            					sheet.CI2 = 0
            					sheet.VIDAJ2 = 0
            					sheet.VI2 = 0
            					sheet.Sobra2 = 0
            					sheet.TR2 = 0
            					sheet.Macete2 = 0
        end, obj);

    obj._e_event12 = obj.button9:addEventListener("onClick",
        function (_)
            self.PopJ3:show();
        end, obj);

    obj._e_event13 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Alvo3 == 'Player1' then
            				 sheet.VI3 = (tonumber(sheet.VIDAJ1) or 0)
            				 end;
            
                             if sheet.Alvo3 == 'Player2' then
            				 sheet.VI3 = (tonumber(sheet.VIDAJ2) or 0)
            				 end;				 
            				 
                             if sheet.Alvo3 == 'Player3' then
            				 sheet.VI3 = (tonumber(sheet.VIDAJ3) or 0)
            				 end;	
            
                             if sheet.Alvo3 == 'Player4' then
            				 sheet.VI3 = (tonumber(sheet.VIDAJ4) or 0)
            				 end;
            
                             if sheet.Alvo3 == 'Player5' then
            				 sheet.VI3 = (tonumber(sheet.VIDAJ5) or 0)
            				 end;				 
            				 
                             if sheet.Alvo3 == 'Player6' then
            				 sheet.VI3 = (tonumber(sheet.VIDAJ6) or 0)
            				 end;
        end, obj);

    obj._e_event14 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.TR1 = (tonumber(sheet.ReducaoJ1) or 0) + (tonumber(sheet.BuffReduJ1) or 0) -100
            				 sheet.Sobra1 = (tonumber(sheet.TR1) or 0) * -1
            				 
            				 sheet.TR2 = (tonumber(sheet.ReducaoJ2) or 0) + (tonumber(sheet.BuffReduJ2) or 0) -100
            				 sheet.Sobra2 = (tonumber(sheet.TR2) or 0) * -1
            				 
            				 sheet.TR3 = (tonumber(sheet.ReducaoJ3) or 0) + (tonumber(sheet.BuffReduJ3) or 0) -100
            				 sheet.Sobra3 = (tonumber(sheet.TR3) or 0) * -1
            				 
            				 sheet.TR4 = (tonumber(sheet.ReducaoJ4) or 0) + (tonumber(sheet.BuffReduJ4) or 0) -100
            				 sheet.Sobra4 = (tonumber(sheet.TR4) or 0) * -1
            				 
            				 sheet.TR5 = (tonumber(sheet.ReducaoJ5) or 0) + (tonumber(sheet.BuffReduJ5) or 0) -100
            				 sheet.Sobra5 = (tonumber(sheet.TR5) or 0) * -1
            				 
            				 sheet.TR6 = (tonumber(sheet.ReducaoJ6) or 0) + (tonumber(sheet.BuffReduJ6) or 0) -100
            				 sheet.Sobra6 = (tonumber(sheet.TR6) or 0) * -1
        end, obj);

    obj._e_event15 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet.Alvo3 == 'Player1' then
            				 sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            				 sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            				 sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            				 end;
            
                             if sheet.Alvo3 == 'Player2' then
            				 sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            				 sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            				 sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            				 end;				 
            				 
                             if sheet.Alvo3 == 'Player3' then
            				 sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            				 sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            				 sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            				 end;	
            
                             if sheet.Alvo3 == 'Player4' then
            				 sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            				 sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            				 sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            				 end;
            				 
                             if sheet.Alvo3 == 'Player5' then
            				 sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            				 sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            				 sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            				 end;			 
            				 
                             if sheet.Alvo3 == 'Player6' then
            				 sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            				 sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            				 sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            				 end;	
            
            				 sheet.DC3 = (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            				 sheet.CI3 = (tonumber(sheet.DC3) or 0) * 2
            				 sheet.DT3 = (tonumber(sheet.DC3) or 0) + (tonumber(sheet.DT3) or 0)
        end, obj);

    obj._e_event16 = obj.button11:addEventListener("onClick",
        function (_)
            sheet.NomeJ3 = 0
            					sheet.DanoJ3 = 0
            					sheet.BuffDNJ3 = 0
            					sheet.ReducaoJ3 = 0
            					sheet.BuffReduJ3 = 0
            					sheet.DC3 = 0
            					sheet.DT3 = 0
            					sheet.TJ3 = 0
            					sheet.CI3 = 0
            					sheet.VIDAJ3 = 0
            					sheet.VI3 = 0
            					sheet.Sobra3 = 0
            					sheet.TR3 = 0
            					sheet.Macete3 = 0
        end, obj);

    obj._e_event17 = obj.button12:addEventListener("onClick",
        function (_)
            self.PopJ4:show();
        end, obj);

    obj._e_event18 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Alvo4 == 'Player1' then
            				 sheet.VI4 = (tonumber(sheet.VIDAJ1) or 0)
            				 end;
            
                             if sheet.Alvo4 == 'Player2' then
            				 sheet.VI4 = (tonumber(sheet.VIDAJ2) or 0)
            				 end;				 
            				 
                             if sheet.Alvo4 == 'Player3' then
            				 sheet.VI4 = (tonumber(sheet.VIDAJ3) or 0)
            				 end;	
            
                             if sheet.Alvo4 == 'Player4' then
            				 sheet.VI4 = (tonumber(sheet.VIDAJ4) or 0)
            				 end;
            
                             if sheet.Alvo4 == 'Player5' then
            				 sheet.VI4 = (tonumber(sheet.VIDAJ5) or 0)
            				 end;				 
            				 
                             if sheet.Alvo4 == 'Player6' then
            				 sheet.VI4 = (tonumber(sheet.VIDAJ6) or 0)
            				 end;
        end, obj);

    obj._e_event19 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.TR1 = (tonumber(sheet.ReducaoJ1) or 0) + (tonumber(sheet.BuffReduJ1) or 0) -100
            				 sheet.Sobra1 = (tonumber(sheet.TR1) or 0) * -1
            				 
            				 sheet.TR2 = (tonumber(sheet.ReducaoJ2) or 0) + (tonumber(sheet.BuffReduJ2) or 0) -100
            				 sheet.Sobra2 = (tonumber(sheet.TR2) or 0) * -1
            				 
            				 sheet.TR3 = (tonumber(sheet.ReducaoJ3) or 0) + (tonumber(sheet.BuffReduJ3) or 0) -100
            				 sheet.Sobra3 = (tonumber(sheet.TR3) or 0) * -1
            				 
            				 sheet.TR4 = (tonumber(sheet.ReducaoJ4) or 0) + (tonumber(sheet.BuffReduJ4) or 0) -100
            				 sheet.Sobra4 = (tonumber(sheet.TR4) or 0) * -1
            				 
            				 sheet.TR5 = (tonumber(sheet.ReducaoJ5) or 0) + (tonumber(sheet.BuffReduJ5) or 0) -100
            				 sheet.Sobra5 = (tonumber(sheet.TR5) or 0) * -1
            				 
            				 sheet.TR6 = (tonumber(sheet.ReducaoJ6) or 0) + (tonumber(sheet.BuffReduJ6) or 0) -100
            				 sheet.Sobra6 = (tonumber(sheet.TR6) or 0) * -1
        end, obj);

    obj._e_event20 = obj.button13:addEventListener("onClick",
        function (_)
            if sheet.Alvo4 == 'Player1' then
            				 sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            				 sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            				 sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            				 end;
            
                             if sheet.Alvo4 == 'Player2' then
            				 sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            				 sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            				 sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            				 end;				 
            				 
                             if sheet.Alvo4 == 'Player3' then
            				 sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            				 sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            				 sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            				 end;	
            
                             if sheet.Alvo4 == 'Player4' then
            				 sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            				 sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            				 sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            				 end;
            				 
                             if sheet.Alvo4 == 'Player5' then
            				 sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            				 sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            				 sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            				 end;			 
            				 
                             if sheet.Alvo4 == 'Player6' then
            				 sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            				 sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            				 sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            				 end;
            
            				 sheet.DC4 = (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            				 sheet.CI4 = (tonumber(sheet.DC4) or 0) * 2
            				 sheet.DT4 = (tonumber(sheet.DC4) or 0) + (tonumber(sheet.DT4) or 0)
        end, obj);

    obj._e_event21 = obj.button14:addEventListener("onClick",
        function (_)
            sheet.NomeJ4 = 0
            					sheet.DanoJ4 = 0
            					sheet.BuffDNJ4 = 0
            					sheet.ReducaoJ4 = 0
            					sheet.BuffReduJ4 = 0
            					sheet.DC4 = 0
            					sheet.DT4 = 0
            					sheet.TJ4 = 0
            					sheet.CI4 = 0
            					sheet.VIDAJ4 = 0
            					sheet.VI4 = 0
            					sheet.Sobra4 = 0
            					sheet.TR4 = 0
            					sheet.Macete4 = 0
        end, obj);

    obj._e_event22 = obj.button15:addEventListener("onClick",
        function (_)
            self.PopJ5:show();
        end, obj);

    obj._e_event23 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Alvo5 == 'Player1' then
            				 sheet.VI5 = (tonumber(sheet.VIDAJ1) or 0)
            				 end;
            
                             if sheet.Alvo5 == 'Player2' then
            				 sheet.VI5 = (tonumber(sheet.VIDAJ2) or 0)
            				 end;				 
            				 
                             if sheet.Alvo5 == 'Player3' then
            				 sheet.VI5 = (tonumber(sheet.VIDAJ3) or 0)
            				 end;	
            
                             if sheet.Alvo5 == 'Player4' then
            				 sheet.VI5 = (tonumber(sheet.VIDAJ4) or 0)
            				 end;
            
                             if sheet.Alvo5 == 'Player5' then
            				 sheet.VI5 = (tonumber(sheet.VIDAJ5) or 0)
            				 end;				 
            				 
                             if sheet.Alvo5 == 'Player6' then
            				 sheet.VI5 = (tonumber(sheet.VIDAJ6) or 0)
            				 end;
        end, obj);

    obj._e_event24 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.TR1 = (tonumber(sheet.ReducaoJ1) or 0) + (tonumber(sheet.BuffReduJ1) or 0) -100
            				 sheet.Sobra1 = (tonumber(sheet.TR1) or 0) * -1
            				 
            				 sheet.TR2 = (tonumber(sheet.ReducaoJ2) or 0) + (tonumber(sheet.BuffReduJ2) or 0) -100
            				 sheet.Sobra2 = (tonumber(sheet.TR2) or 0) * -1
            				 
            				 sheet.TR3 = (tonumber(sheet.ReducaoJ3) or 0) + (tonumber(sheet.BuffReduJ3) or 0) -100
            				 sheet.Sobra3 = (tonumber(sheet.TR3) or 0) * -1
            				 
            				 sheet.TR4 = (tonumber(sheet.ReducaoJ4) or 0) + (tonumber(sheet.BuffReduJ4) or 0) -100
            				 sheet.Sobra4 = (tonumber(sheet.TR4) or 0) * -1
            				 
            				 sheet.TR5 = (tonumber(sheet.ReducaoJ5) or 0) + (tonumber(sheet.BuffReduJ5) or 0) -100
            				 sheet.Sobra5 = (tonumber(sheet.TR5) or 0) * -1
            				 
            				 sheet.TR6 = (tonumber(sheet.ReducaoJ6) or 0) + (tonumber(sheet.BuffReduJ6) or 0) -100
            				 sheet.Sobra6 = (tonumber(sheet.TR6) or 0) * -1
        end, obj);

    obj._e_event25 = obj.button16:addEventListener("onClick",
        function (_)
            if sheet.Alvo5 == 'Player1' then
            				 sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            				 sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            				 sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            				 end;
            
                             if sheet.Alvo5 == 'Player2' then
            				 sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            				 sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            				 sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            				 end;				 
            				 
                             if sheet.Alvo5 == 'Player3' then
            				 sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            				 sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            				 sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            				 end;	
            
                             if sheet.Alvo5 == 'Player4' then
            				 sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            				 sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            				 sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            				 end;
            				 
                             if sheet.Alvo5 == 'Player5' then
            				 sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            				 sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            				 sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            				 end;			 
            				 
                             if sheet.Alvo5 == 'Player6' then
            				 sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            				 sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            				 sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            				 end;
            
            				 sheet.DC5 = (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            				 sheet.CI5 = (tonumber(sheet.DC5) or 0) * 2
            				 sheet.DT5 = (tonumber(sheet.DC5) or 0) + (tonumber(sheet.DT5) or 0)
        end, obj);

    obj._e_event26 = obj.button17:addEventListener("onClick",
        function (_)
            sheet.NomeJ5 = 0
            					sheet.DanoJ5 = 0
            					sheet.BuffDNJ5 = 0
            					sheet.ReducaoJ5 = 0
            					sheet.BuffReduJ5 = 0
            					sheet.DC5 = 0
            					sheet.DT5 = 0
            					sheet.TJ5 = 0
            					sheet.CI5 = 0
            					sheet.VIDAJ5 = 0
            					sheet.VI5 = 0
            					sheet.Sobra5 = 0
            					sheet.TR5 = 0
            					sheet.Macete5 = 0
        end, obj);

    obj._e_event27 = obj.button18:addEventListener("onClick",
        function (_)
            self.PopJ6:show();
        end, obj);

    obj._e_event28 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Alvo6 == 'Player1' then
            				 sheet.VI6 = (tonumber(sheet.VIDAJ1) or 0)
            				 end;
            
                             if sheet.Alvo6 == 'Player2' then
            				 sheet.VI6 = (tonumber(sheet.VIDAJ2) or 0)
            				 end;				 
            				 
                             if sheet.Alvo6 == 'Player3' then
            				 sheet.VI6 = (tonumber(sheet.VIDAJ3) or 0)
            				 end;	
            
                             if sheet.Alvo6 == 'Player4' then
            				 sheet.VI6 = (tonumber(sheet.VIDAJ4) or 0)
            				 end;
            
                             if sheet.Alvo6 == 'Player5' then
            				 sheet.VI6 = (tonumber(sheet.VIDAJ5) or 0)
            				 end;				 
            				 
                             if sheet.Alvo6 == 'Player6' then
            				 sheet.VI6 = (tonumber(sheet.VIDAJ6) or 0)
            				 end;
        end, obj);

    obj._e_event29 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.TR1 = (tonumber(sheet.ReducaoJ1) or 0) + (tonumber(sheet.BuffReduJ1) or 0) -100
            				 sheet.Sobra1 = (tonumber(sheet.TR1) or 0) * -1
            				 
            				 sheet.TR2 = (tonumber(sheet.ReducaoJ2) or 0) + (tonumber(sheet.BuffReduJ2) or 0) -100
            				 sheet.Sobra2 = (tonumber(sheet.TR2) or 0) * -1
            				 
            				 sheet.TR3 = (tonumber(sheet.ReducaoJ3) or 0) + (tonumber(sheet.BuffReduJ3) or 0) -100
            				 sheet.Sobra3 = (tonumber(sheet.TR3) or 0) * -1
            				 
            				 sheet.TR4 = (tonumber(sheet.ReducaoJ4) or 0) + (tonumber(sheet.BuffReduJ4) or 0) -100
            				 sheet.Sobra4 = (tonumber(sheet.TR4) or 0) * -1
            				 
            				 sheet.TR5 = (tonumber(sheet.ReducaoJ5) or 0) + (tonumber(sheet.BuffReduJ5) or 0) -100
            				 sheet.Sobra5 = (tonumber(sheet.TR5) or 0) * -1
            				 
            				 sheet.TR6 = (tonumber(sheet.ReducaoJ6) or 0) + (tonumber(sheet.BuffReduJ6) or 0) -100
            				 sheet.Sobra6 = (tonumber(sheet.TR6) or 0) * -1
        end, obj);

    obj._e_event30 = obj.button19:addEventListener("onClick",
        function (_)
            if sheet.Alvo6 == 'Player1' then
            				 sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            				 sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            				 sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            				 end;
            
                             if sheet.Alvo6 == 'Player2' then
            				 sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            				 sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            				 sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            				 end;				 
            				 
                             if sheet.Alvo6 == 'Player3' then
            				 sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            				 sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            				 sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            				 end;	
            
                             if sheet.Alvo6 == 'Player4' then
            				 sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            				 sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            				 sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            				 end;
            				 
                             if sheet.Alvo6 == 'Player5' then
            				 sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            				 sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            				 sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            				 end;			 
            				 
                             if sheet.Alvo6 == 'Player6' then
            				 sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            				 sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            				 sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            				 end;	 
            				 
            				 sheet.DC6 = (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            				 sheet.CI6 = (tonumber(sheet.DC6) or 0) * 2
            				 sheet.DT6 = (tonumber(sheet.DC6) or 0) + (tonumber(sheet.DT6) or 0)
        end, obj);

    obj._e_event31 = obj.button20:addEventListener("onClick",
        function (_)
            sheet.NomeJ6 = 0
            					sheet.DanoJ6 = 0
            					sheet.BuffDNJ6 = 0
            					sheet.ReducaoJ6 = 0
            					sheet.BuffReduJ6 = 0
            					sheet.DC6 = 0
            					sheet.DT6 = 0
            					sheet.TJ6 = 0
            					sheet.CI6 = 0
            					sheet.VIDAJ6 = 0
            					sheet.VI6 = 0
            					sheet.Sobra6 = 0
            					sheet.TR6 = 0
            					sheet.Macete6 = 0
        end, obj);

    obj._e_event32 = obj.button21:addEventListener("onClick",
        function (_)
            sheet.turno = 0
            		sheet.NomeJ1 = 0
            		sheet.DanoJ1 = 0
            		sheet.BuffDNJ1 = 0
            		sheet.ReducaoJ1 = 0
            		sheet.BuffReduJ1 = 0
            		sheet.DC1 = 0
            		sheet.DT1 = 0
            		sheet.TJ1 = 0
            		sheet.CI1 = 0
            		sheet.VIDAJ1 = 0
            		sheet.VI1 = 0
            		sheet.Sobra1 = 0
            		sheet.TR1 = 0
            		sheet.Macete1 = 0
            		
            		sheet.NomeJ2 = 0
            		sheet.DanoJ2 = 0
            		sheet.BuffDNJ2 = 0
            		sheet.ReducaoJ2 = 0
            		sheet.BuffReduJ2 = 0
            		sheet.DC2 = 0
            		sheet.DT2 = 0
            		sheet.TJ2 = 0
            		sheet.CI2 = 0
            		sheet.VIDAJ2 = 0
            		sheet.VI2 = 0
            		sheet.Sobra2 = 0
            		sheet.TR2 = 0
            		sheet.Macete2 = 0
            		
            		sheet.NomeJ3 = 0
            		sheet.DanoJ3 = 0
            		sheet.BuffDNJ3 = 0
            		sheet.ReducaoJ3 = 0
            		sheet.BuffReduJ3 = 0
            		sheet.DC3 = 0
            		sheet.DT3 = 0
            		sheet.TJ3 = 0
            		sheet.CI3 = 0
            		sheet.VIDAJ3 = 0
            		sheet.VI3 = 0
            		sheet.Sobra3 = 0
            		sheet.TR3 = 0
            		sheet.Macete3 = 0
            		
            		sheet.NomeJ4 = 0
            		sheet.DanoJ4 = 0
            		sheet.BuffDNJ4 = 0
            		sheet.ReducaoJ4 = 0
            		sheet.BuffReduJ4 = 0
            		sheet.DC4 = 0
            		sheet.DT4 = 0
            		sheet.TJ4 = 0
            		sheet.CI4 = 0
            		sheet.VIDAJ4 = 0
            		sheet.VI4 = 0
            		sheet.Sobra4 = 0
            		sheet.TR4 = 0
            		sheet.Macete4 = 0
            		
            		sheet.NomeJ5 = 0
            		sheet.DanoJ5 = 0
            		sheet.BuffDNJ5 = 0
            		sheet.ReducaoJ5 = 0
            		sheet.BuffReduJ5 = 0
            		sheet.DC5 = 0
            		sheet.DT5 = 0
            		sheet.TJ5 = 0
            		sheet.CI5 = 0
            		sheet.VIDAJ5 = 0
            		sheet.VI5 = 0
            		sheet.Sobra5 = 0
            		sheet.TR5 = 0
            		sheet.Macete5 = 0
            		
            		sheet.NomeJ6 = 0
            		sheet.DanoJ6 = 0
            		sheet.BuffDNJ6 = 0
            		sheet.ReducaoJ6 = 0
            		sheet.BuffReduJ6 = 0
            		sheet.DC6 = 0
            		sheet.DT6 = 0
            		sheet.TJ6 = 0
            		sheet.CI6 = 0
            		sheet.VIDAJ6 = 0
            		sheet.VI6 = 0
            		sheet.Sobra6 = 0
            		sheet.TR6 = 0
            		sheet.Macete6 = 0
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.PopJ5 ~= nil then self.PopJ5:destroy(); self.PopJ5 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.PopJ3 ~= nil then self.PopJ3:destroy(); self.PopJ3 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.PopJ4 ~= nil then self.PopJ4:destroy(); self.PopJ4 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.PopJ6 ~= nil then self.PopJ6:destroy(); self.PopJ6 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.PopJ2 ~= nil then self.PopJ2:destroy(); self.PopJ2 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.PopJ1 ~= nil then self.PopJ1:destroy(); self.PopJ1 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmscv()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmscv();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmscv = {
    newEditor = newfrmscv, 
    new = newfrmscv, 
    name = "frmscv", 
    dataType = "CombateVelen", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Velen Sistema de Combate", 
    description=""};

frmscv = _frmscv;
Firecast.registrarForm(_frmscv);
Firecast.registrarDataType(_frmscv);

return _frmscv;
