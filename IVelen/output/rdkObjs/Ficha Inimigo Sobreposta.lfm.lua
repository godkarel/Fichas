require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSobrePostaInimigo()
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
    obj:setName("frmSobrePostaInimigo");
    obj:setScale(0.9);
    obj:setWidth(650);
    obj:setHeight(600);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.URLIMG = GUI.fromHandle(_obj_newObject("image"));
    obj.URLIMG:setParent(obj.scrollBox1);
    obj.URLIMG:setName("URLIMG");
    obj.URLIMG:setLeft(185);
    obj.URLIMG:setTop(-25);
    obj.URLIMG:setWidth(140);
    obj.URLIMG:setHeight(190);
    obj.URLIMG:setEditable(true);
    obj.URLIMG:setStyle("autoFit");
    obj.URLIMG:setField("imgInimigo");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(110);
    obj.image1:setTop(-70);
    obj.image1:setWidth(100);
    obj.image1:setHeight(100);
    obj.image1:setSRC("/imagens/2.png");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(300);
    obj.image2:setTop(-70);
    obj.image2:setWidth(100);
    obj.image2:setHeight(100);
    obj.image2:setSRC("/imagens/2.png");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox1);
    obj.image3:setLeft(5);
    obj.image3:setTop(-70);
    obj.image3:setWidth(500);
    obj.image3:setHeight(800);
    obj.image3:setSRC("/imagens/1.png");
    obj.image3:setName("image3");

    obj.BarraHP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.BarraHP:setParent(obj.scrollBox1);
    obj.BarraHP:setName("BarraHP");
    obj.BarraHP:setLeft(75);
    obj.BarraHP:setTop(160);
    obj.BarraHP:setWidth(120);
    obj.BarraHP:setHeight(20);
    obj.BarraHP:setColor("red");
    obj.BarraHP:setPosition(50);
    obj.BarraHP:setMax(100);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(75);
    obj.edit1:setTop(160);
    obj.edit1:setWidth(60);
    obj.edit1:setHeight(20);
    obj.edit1:setTransparent(true);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setField("HPAtual");
    obj.edit1:setName("edit1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(75);
    obj.button1:setTop(190);
    obj.button1:setWidth(70);
    obj.button1:setHeight(20);
    obj.button1:setFontSize(12);
    obj.button1:setFontColor("red");
    obj.button1:setText("DANO");
    obj.button1:setName("button1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(150);
    obj.edit2:setTop(190);
    obj.edit2:setWidth(45);
    obj.edit2:setHeight(20);
    obj.edit2:setTransparent(false);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("HPRetirado");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(135);
    obj.edit3:setTop(160);
    obj.edit3:setWidth(60);
    obj.edit3:setHeight(20);
    obj.edit3:setTransparent(true);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setField("HPTotal");
    obj.edit3:setName("edit3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(407);
    obj.button2:setTop(42);
    obj.button2:setWidth(65);
    obj.button2:setHeight(65);
    obj.button2:setOpacity(0);
    obj.button2:setFontSize(12);
    obj.button2:setFontColor("#00FFFF");
    obj.button2:setName("button2");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(35);
    obj.edit4:setTop(48);
    obj.edit4:setWidth(65);
    obj.edit4:setHeight(40);
    obj.edit4:setFontSize(24);
    obj.edit4:setTransparent(true);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontColor("blue");
    obj.edit4:setType("number");
    obj.edit4:setDecimalPlaces(0);
    obj.edit4:setMax(30);
    obj.edit4:setMin(1);
    obj.edit4:setField("level");
    obj.edit4:setName("edit4");

    obj.BarraMP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.BarraMP:setParent(obj.scrollBox1);
    obj.BarraMP:setName("BarraMP");
    obj.BarraMP:setLeft(315);
    obj.BarraMP:setTop(160);
    obj.BarraMP:setWidth(120);
    obj.BarraMP:setHeight(20);
    obj.BarraMP:setColor("cyan");
    obj.BarraMP:setPosition(50);
    obj.BarraMP:setMax(100);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(315);
    obj.edit5:setTop(160);
    obj.edit5:setWidth(60);
    obj.edit5:setHeight(20);
    obj.edit5:setTransparent(true);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setField("MPAtual");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(375);
    obj.edit6:setTop(160);
    obj.edit6:setWidth(60);
    obj.edit6:setHeight(20);
    obj.edit6:setTransparent(true);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setField("MPTotal");
    obj.edit6:setName("edit6");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(315);
    obj.button3:setTop(190);
    obj.button3:setWidth(70);
    obj.button3:setHeight(20);
    obj.button3:setFontSize(12);
    obj.button3:setFontColor("cyan");
    obj.button3:setText("CUSTO");
    obj.button3:setName("button3");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox1);
    obj.edit7:setLeft(390);
    obj.edit7:setTop(190);
    obj.edit7:setWidth(45);
    obj.edit7:setHeight(20);
    obj.edit7:setTransparent(false);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setField("MPRetirado");
    obj.edit7:setName("edit7");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(223);
    obj.button4:setTop(165);
    obj.button4:setWidth(60);
    obj.button4:setHeight(25);
    obj.button4:setFontSize(12);
    obj.button4:setFontColor("white");
    obj.button4:setText("Full💙");
    obj.button4:setName("button4");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.scrollBox1);
    obj.comboBox1:setLeft(200);
    obj.comboBox1:setTop(190);
    obj.comboBox1:setWidth(70);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setFontSize(12);
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setField("TipoRecebido");
    obj.comboBox1:setItems({'% Fisico', '% Magico'});
    obj.comboBox1:setName("comboBox1");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox1);
    obj.edit8:setLeft(145);
    obj.edit8:setTop(215);
    obj.edit8:setWidth(130);
    obj.edit8:setHeight(20);
    obj.edit8:setTransparent(false);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setField("Nome");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox1);
    obj.edit9:setLeft(180);
    obj.edit9:setTop(237);
    obj.edit9:setWidth(95);
    obj.edit9:setHeight(20);
    obj.edit9:setTransparent(false);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setDecimalPlaces(0);
    obj.edit9:setType("number");
    obj.edit9:setField("Dano");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.scrollBox1);
    obj.edit10:setLeft(180);
    obj.edit10:setTop(263);
    obj.edit10:setWidth(95);
    obj.edit10:setHeight(20);
    obj.edit10:setTransparent(false);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setDecimalPlaces(0);
    obj.edit10:setType("number");
    obj.edit10:setField("DanoMagico");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.scrollBox1);
    obj.edit11:setLeft(180);
    obj.edit11:setTop(289);
    obj.edit11:setWidth(35);
    obj.edit11:setHeight(20);
    obj.edit11:setTransparent(false);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setField("Defesa");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.scrollBox1);
    obj.edit12:setLeft(180);
    obj.edit12:setTop(314);
    obj.edit12:setWidth(35);
    obj.edit12:setHeight(20);
    obj.edit12:setTransparent(false);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setField("Resistencia");
    obj.edit12:setName("edit12");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(240);
    obj.rectangle1:setTop(289);
    obj.rectangle1:setWidth(35);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setColor("blue");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.scrollBox1);
    obj.edit13:setLeft(240);
    obj.edit13:setTop(289);
    obj.edit13:setWidth(35);
    obj.edit13:setHeight(20);
    obj.edit13:setTransparent(true);
    obj.edit13:setCanFocus(false);
    obj.edit13:setHitTest(false);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setField("DefesaPorCent");
    obj.edit13:setName("edit13");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(240);
    obj.rectangle2:setTop(314);
    obj.rectangle2:setWidth(35);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setColor("blue");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.scrollBox1);
    obj.edit14:setLeft(240);
    obj.edit14:setTop(314);
    obj.edit14:setWidth(35);
    obj.edit14:setHeight(20);
    obj.edit14:setTransparent(true);
    obj.edit14:setCanFocus(false);
    obj.edit14:setHitTest(false);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setField("ResistenciaPorCent");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.scrollBox1);
    obj.edit15:setLeft(360);
    obj.edit15:setTop(263);
    obj.edit15:setWidth(60);
    obj.edit15:setHeight(20);
    obj.edit15:setTransparent(false);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setField("Acerto");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.scrollBox1);
    obj.edit16:setLeft(360);
    obj.edit16:setTop(289);
    obj.edit16:setWidth(60);
    obj.edit16:setHeight(20);
    obj.edit16:setTransparent(false);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setField("Esquiva");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.scrollBox1);
    obj.edit17:setLeft(360);
    obj.edit17:setTop(314);
    obj.edit17:setWidth(60);
    obj.edit17:setHeight(20);
    obj.edit17:setTransparent(false);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setField("Critical");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.scrollBox1);
    obj.edit18:setLeft(220);
    obj.edit18:setTop(363);
    obj.edit18:setWidth(60);
    obj.edit18:setHeight(20);
    obj.edit18:setTransparent(false);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setField("AcertoMagico");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.scrollBox1);
    obj.edit19:setLeft(220);
    obj.edit19:setTop(388);
    obj.edit19:setWidth(60);
    obj.edit19:setHeight(20);
    obj.edit19:setTransparent(false);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setField("CriticalMagico");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.scrollBox1);
    obj.edit20:setLeft(220);
    obj.edit20:setTop(413);
    obj.edit20:setWidth(60);
    obj.edit20:setHeight(20);
    obj.edit20:setTransparent(false);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setField("Persistencia");
    obj.edit20:setName("edit20");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.scrollBox1);
    obj.comboBox2:setLeft(310);
    obj.comboBox2:setTop(338);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setField("TipoAtaque");
    obj.comboBox2:setFontSize(12);
    obj.comboBox2:setFontColor("red");
    obj.comboBox2:setItems({'Dano Fisico', 'Dano Magico'});
    obj.comboBox2:setName("comboBox2");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(310);
    obj.button5:setTop(363);
    obj.button5:setWidth(100);
    obj.button5:setHeight(20);
    obj.button5:setFontSize(12);
    obj.button5:setFontColor("red");
    obj.button5:setText("Ataque Basico");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox1);
    obj.button6:setLeft(310);
    obj.button6:setTop(388);
    obj.button6:setWidth(100);
    obj.button6:setHeight(20);
    obj.button6:setFontSize(12);
    obj.button6:setFontColor("#00FFFF");
    obj.button6:setText("Extra");
    obj.button6:setName("button6");

    obj.btnMeca1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnMeca1:setParent(obj.scrollBox1);
    obj.btnMeca1:setName("btnMeca1");
    obj.btnMeca1:setLeft(280);
    obj.btnMeca1:setTop(215);
    obj.btnMeca1:setWidth(75);
    obj.btnMeca1:setHeight(20);
    obj.btnMeca1:setHorzTextAlign("center");
    obj.btnMeca1:setText("Mecanica 1");

    obj.popMecanica1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMecanica1:setParent(obj.scrollBox1);
    obj.popMecanica1:setName("popMecanica1");
    obj.popMecanica1:setWidth(420);
    obj.popMecanica1:setHeight(420);
    obj.popMecanica1:setBackOpacity(0.5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.popMecanica1);
    obj.label1:setLeft(10);
    obj.label1:setTop(10);
    obj.label1:setFontSize(22);
    obj.label1:setHeight(25);
    obj.label1:setText("Mecanica 1");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.popMecanica1);
    obj.label2:setLeft(10);
    obj.label2:setTop(45);
    obj.label2:setText("Habilidade :");
    obj.label2:setName("label2");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.popMecanica1);
    obj.edit21:setLeft(100);
    obj.edit21:setTop(40);
    obj.edit21:setWidth(278);
    obj.edit21:setField("NomeMecanica1");
    obj.edit21:setName("edit21");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.popMecanica1);
    obj.label3:setLeft(10);
    obj.label3:setTop(80);
    obj.label3:setText("Descrição Comum:");
    obj.label3:setName("label3");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popMecanica1);
    obj.textEditor1:setLeft(130);
    obj.textEditor1:setTop(80);
    obj.textEditor1:setWidth(248);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("DescriMecanica1");
    obj.textEditor1:setName("textEditor1");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.popMecanica1);
    obj.button7:setLeft(10);
    obj.button7:setTop(100);
    obj.button7:setWidth(105);
    obj.button7:setHeight(80);
    obj.button7:setHorzTextAlign("center");
    obj.button7:setText("Enviar");
    obj.button7:setName("button7");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.popMecanica1);
    obj.label4:setLeft(10);
    obj.label4:setTop(190);
    obj.label4:setText("Descrição Completa:");
    obj.label4:setName("label4");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popMecanica1);
    obj.textEditor2:setLeft(130);
    obj.textEditor2:setTop(190);
    obj.textEditor2:setWidth(248);
    obj.textEditor2:setHeight(100);
    obj.textEditor2:setField("FalhaMecanica1");
    obj.textEditor2:setName("textEditor2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.popMecanica1);
    obj.label5:setLeft(10);
    obj.label5:setTop(303);
    obj.label5:setText("Tipo:");
    obj.label5:setName("label5");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.popMecanica1);
    obj.comboBox3:setLeft(50);
    obj.comboBox3:setTop(300);
    obj.comboBox3:setWidth(105);
    obj.comboBox3:setItems({'Dano', 'Dano Magico', 'Cura', 'Fixo'});
    obj.comboBox3:setField("TipoMecanica1");
    obj.comboBox3:setName("comboBox3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.popMecanica1);
    obj.label6:setLeft(10);
    obj.label6:setTop(335);
    obj.label6:setText("Dano:");
    obj.label6:setName("label6");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.popMecanica1);
    obj.edit22:setLeft(50);
    obj.edit22:setTop(330);
    obj.edit22:setWidth(75);
    obj.edit22:setField("DanoMecanica1");
    obj.edit22:setName("edit22");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.popMecanica1);
    obj.label7:setLeft(135);
    obj.label7:setTop(335);
    obj.label7:setText("Cura:");
    obj.label7:setName("label7");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.popMecanica1);
    obj.edit23:setLeft(180);
    obj.edit23:setTop(330);
    obj.edit23:setWidth(75);
    obj.edit23:setField("CuraMecanica1");
    obj.edit23:setName("edit23");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.popMecanica1);
    obj.label8:setLeft(265);
    obj.label8:setTop(335);
    obj.label8:setText("Fixo:");
    obj.label8:setName("label8");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.popMecanica1);
    obj.edit24:setLeft(305);
    obj.edit24:setTop(330);
    obj.edit24:setWidth(75);
    obj.edit24:setField("FixoMecanica1");
    obj.edit24:setName("edit24");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.popMecanica1);
    obj.label9:setLeft(10);
    obj.label9:setTop(370);
    obj.label9:setVisible(true);
    obj.label9:setText("Custo:");
    obj.label9:setName("label9");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.popMecanica1);
    obj.edit25:setLeft(50);
    obj.edit25:setTop(365);
    obj.edit25:setVisible(true);
    obj.edit25:setWidth(75);
    obj.edit25:setField("CustoMecanica1");
    obj.edit25:setName("edit25");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.popMecanica1);
    obj.label10:setLeft(135);
    obj.label10:setTop(370);
    obj.label10:setVisible(true);
    obj.label10:setText("CD:");
    obj.label10:setName("label10");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.popMecanica1);
    obj.edit26:setLeft(180);
    obj.edit26:setTop(365);
    obj.edit26:setVisible(true);
    obj.edit26:setWidth(75);
    obj.edit26:setField("CDMecanica1");
    obj.edit26:setName("edit26");

    obj.CbxMeca1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.CbxMeca1:setParent(obj.popMecanica1);
    obj.CbxMeca1:setName("CbxMeca1");
    obj.CbxMeca1:setLeft(265);
    obj.CbxMeca1:setTop(370);
    obj.CbxMeca1:setWidth(75);
    obj.CbxMeca1:setFontColor("red");
    obj.CbxMeca1:setText("Mecanica Completa");
    obj.CbxMeca1:setField("ConheceMecanica1");

    obj.btnMeca2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnMeca2:setParent(obj.scrollBox1);
    obj.btnMeca2:setName("btnMeca2");
    obj.btnMeca2:setLeft(280);
    obj.btnMeca2:setTop(237);
    obj.btnMeca2:setWidth(75);
    obj.btnMeca2:setHeight(20);
    obj.btnMeca2:setHorzTextAlign("center");
    obj.btnMeca2:setText("Mecanica 2");

    obj.popMecanica2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMecanica2:setParent(obj.scrollBox1);
    obj.popMecanica2:setName("popMecanica2");
    obj.popMecanica2:setWidth(420);
    obj.popMecanica2:setHeight(420);
    obj.popMecanica2:setBackOpacity(0.5);

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.popMecanica2);
    obj.label11:setLeft(10);
    obj.label11:setTop(10);
    obj.label11:setFontSize(22);
    obj.label11:setHeight(25);
    obj.label11:setText("Mecanica 2");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.popMecanica2);
    obj.label12:setLeft(10);
    obj.label12:setTop(45);
    obj.label12:setText("Habilidade :");
    obj.label12:setName("label12");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.popMecanica2);
    obj.edit27:setLeft(100);
    obj.edit27:setTop(40);
    obj.edit27:setWidth(278);
    obj.edit27:setField("NomeMecanica2");
    obj.edit27:setName("edit27");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.popMecanica2);
    obj.label13:setLeft(10);
    obj.label13:setTop(80);
    obj.label13:setText("Descrição Comum:");
    obj.label13:setName("label13");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popMecanica2);
    obj.textEditor3:setLeft(130);
    obj.textEditor3:setTop(80);
    obj.textEditor3:setWidth(248);
    obj.textEditor3:setHeight(100);
    obj.textEditor3:setField("DescriMecanica2");
    obj.textEditor3:setName("textEditor3");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.popMecanica2);
    obj.button8:setLeft(10);
    obj.button8:setTop(100);
    obj.button8:setWidth(105);
    obj.button8:setHeight(80);
    obj.button8:setHorzTextAlign("center");
    obj.button8:setText("Enviar");
    obj.button8:setName("button8");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.popMecanica2);
    obj.label14:setLeft(10);
    obj.label14:setTop(190);
    obj.label14:setText("Descrição Completa:");
    obj.label14:setName("label14");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.popMecanica2);
    obj.textEditor4:setLeft(130);
    obj.textEditor4:setTop(190);
    obj.textEditor4:setWidth(248);
    obj.textEditor4:setHeight(100);
    obj.textEditor4:setField("FalhaMecanica2");
    obj.textEditor4:setName("textEditor4");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.popMecanica2);
    obj.label15:setLeft(10);
    obj.label15:setTop(305);
    obj.label15:setText("Tipo:");
    obj.label15:setName("label15");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.popMecanica2);
    obj.comboBox4:setLeft(50);
    obj.comboBox4:setTop(300);
    obj.comboBox4:setWidth(105);
    obj.comboBox4:setItems({'Dano', 'Dano Magico', 'Cura', 'Fixo'});
    obj.comboBox4:setField("TipoMecanica2");
    obj.comboBox4:setName("comboBox4");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.popMecanica2);
    obj.label16:setLeft(10);
    obj.label16:setTop(335);
    obj.label16:setText("Dano:");
    obj.label16:setName("label16");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.popMecanica2);
    obj.edit28:setLeft(50);
    obj.edit28:setTop(330);
    obj.edit28:setWidth(75);
    obj.edit28:setField("DanoMecanica2");
    obj.edit28:setName("edit28");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.popMecanica2);
    obj.label17:setLeft(135);
    obj.label17:setTop(335);
    obj.label17:setText("Cura:");
    obj.label17:setName("label17");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.popMecanica2);
    obj.edit29:setLeft(180);
    obj.edit29:setTop(330);
    obj.edit29:setWidth(75);
    obj.edit29:setField("CuraMecanica2");
    obj.edit29:setName("edit29");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.popMecanica2);
    obj.label18:setLeft(265);
    obj.label18:setTop(335);
    obj.label18:setText("Fixo:");
    obj.label18:setName("label18");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.popMecanica2);
    obj.edit30:setLeft(305);
    obj.edit30:setTop(330);
    obj.edit30:setWidth(75);
    obj.edit30:setField("FixoMecanica2");
    obj.edit30:setName("edit30");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.popMecanica2);
    obj.label19:setLeft(10);
    obj.label19:setTop(370);
    obj.label19:setVisible(true);
    obj.label19:setText("Custo:");
    obj.label19:setName("label19");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.popMecanica2);
    obj.edit31:setLeft(50);
    obj.edit31:setTop(365);
    obj.edit31:setVisible(true);
    obj.edit31:setWidth(75);
    obj.edit31:setField("CustoMecanica2");
    obj.edit31:setName("edit31");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.popMecanica2);
    obj.label20:setLeft(135);
    obj.label20:setTop(370);
    obj.label20:setVisible(true);
    obj.label20:setText("CD:");
    obj.label20:setName("label20");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.popMecanica2);
    obj.edit32:setLeft(180);
    obj.edit32:setTop(365);
    obj.edit32:setVisible(true);
    obj.edit32:setWidth(75);
    obj.edit32:setField("CDMecanica2");
    obj.edit32:setName("edit32");

    obj.CbxMeca2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.CbxMeca2:setParent(obj.popMecanica2);
    obj.CbxMeca2:setName("CbxMeca2");
    obj.CbxMeca2:setLeft(265);
    obj.CbxMeca2:setTop(370);
    obj.CbxMeca2:setWidth(75);
    obj.CbxMeca2:setFontColor("red");
    obj.CbxMeca2:setText("Mecanica Completa");
    obj.CbxMeca2:setField("ConheceMecanica2");

    obj.btnMeca3 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnMeca3:setParent(obj.scrollBox1);
    obj.btnMeca3:setName("btnMeca3");
    obj.btnMeca3:setLeft(360);
    obj.btnMeca3:setTop(215);
    obj.btnMeca3:setWidth(75);
    obj.btnMeca3:setHeight(20);
    obj.btnMeca3:setHorzTextAlign("center");
    obj.btnMeca3:setText("Mecanica 3");

    obj.popMecanica3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMecanica3:setParent(obj.scrollBox1);
    obj.popMecanica3:setName("popMecanica3");
    obj.popMecanica3:setWidth(420);
    obj.popMecanica3:setHeight(420);
    obj.popMecanica3:setBackOpacity(0.5);

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.popMecanica3);
    obj.label21:setLeft(10);
    obj.label21:setTop(10);
    obj.label21:setFontSize(22);
    obj.label21:setHeight(25);
    obj.label21:setText("Mecanica 3");
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.popMecanica3);
    obj.label22:setLeft(10);
    obj.label22:setTop(45);
    obj.label22:setText("Habilidade :");
    obj.label22:setName("label22");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.popMecanica3);
    obj.edit33:setLeft(100);
    obj.edit33:setTop(40);
    obj.edit33:setWidth(278);
    obj.edit33:setField("NomeMecanica3");
    obj.edit33:setName("edit33");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.popMecanica3);
    obj.label23:setLeft(10);
    obj.label23:setTop(80);
    obj.label23:setText("Descrição Comum:");
    obj.label23:setName("label23");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.popMecanica3);
    obj.textEditor5:setLeft(130);
    obj.textEditor5:setTop(80);
    obj.textEditor5:setWidth(248);
    obj.textEditor5:setHeight(100);
    obj.textEditor5:setField("DescriMecanica3");
    obj.textEditor5:setName("textEditor5");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.popMecanica3);
    obj.button9:setLeft(10);
    obj.button9:setTop(100);
    obj.button9:setWidth(105);
    obj.button9:setHeight(80);
    obj.button9:setHorzTextAlign("center");
    obj.button9:setText("Enviar");
    obj.button9:setName("button9");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.popMecanica3);
    obj.label24:setLeft(10);
    obj.label24:setTop(190);
    obj.label24:setText("Descrição Completa:");
    obj.label24:setName("label24");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.popMecanica3);
    obj.textEditor6:setLeft(130);
    obj.textEditor6:setTop(190);
    obj.textEditor6:setWidth(248);
    obj.textEditor6:setHeight(100);
    obj.textEditor6:setField("FalhaMecanica3");
    obj.textEditor6:setName("textEditor6");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.popMecanica3);
    obj.label25:setLeft(10);
    obj.label25:setTop(303);
    obj.label25:setText("Tipo:");
    obj.label25:setName("label25");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.popMecanica3);
    obj.comboBox5:setLeft(50);
    obj.comboBox5:setTop(300);
    obj.comboBox5:setWidth(105);
    obj.comboBox5:setItems({'Dano', 'Dano Magico', 'Cura', 'Fixo'});
    obj.comboBox5:setField("TipoMecanica3");
    obj.comboBox5:setName("comboBox5");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.popMecanica3);
    obj.label26:setLeft(10);
    obj.label26:setTop(335);
    obj.label26:setText("Dano:");
    obj.label26:setName("label26");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.popMecanica3);
    obj.edit34:setLeft(50);
    obj.edit34:setTop(330);
    obj.edit34:setWidth(75);
    obj.edit34:setField("DanoMecanica3");
    obj.edit34:setName("edit34");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.popMecanica3);
    obj.label27:setLeft(135);
    obj.label27:setTop(335);
    obj.label27:setText("Cura:");
    obj.label27:setName("label27");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.popMecanica3);
    obj.edit35:setLeft(180);
    obj.edit35:setTop(330);
    obj.edit35:setWidth(75);
    obj.edit35:setField("CuraMecanica3");
    obj.edit35:setName("edit35");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.popMecanica3);
    obj.label28:setLeft(265);
    obj.label28:setTop(335);
    obj.label28:setText("Fixo:");
    obj.label28:setName("label28");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.popMecanica3);
    obj.edit36:setLeft(305);
    obj.edit36:setTop(330);
    obj.edit36:setWidth(75);
    obj.edit36:setField("FixoMecanica3");
    obj.edit36:setName("edit36");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.popMecanica3);
    obj.label29:setLeft(10);
    obj.label29:setTop(370);
    obj.label29:setVisible(true);
    obj.label29:setText("Custo:");
    obj.label29:setName("label29");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.popMecanica3);
    obj.edit37:setLeft(50);
    obj.edit37:setTop(365);
    obj.edit37:setVisible(true);
    obj.edit37:setWidth(75);
    obj.edit37:setField("CustoMecanica3");
    obj.edit37:setName("edit37");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.popMecanica3);
    obj.label30:setLeft(135);
    obj.label30:setTop(370);
    obj.label30:setVisible(true);
    obj.label30:setText("CD:");
    obj.label30:setName("label30");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.popMecanica3);
    obj.edit38:setLeft(180);
    obj.edit38:setTop(365);
    obj.edit38:setVisible(true);
    obj.edit38:setWidth(75);
    obj.edit38:setField("CDMecanica3");
    obj.edit38:setName("edit38");

    obj.CbxMeca3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.CbxMeca3:setParent(obj.popMecanica3);
    obj.CbxMeca3:setName("CbxMeca3");
    obj.CbxMeca3:setLeft(265);
    obj.CbxMeca3:setTop(370);
    obj.CbxMeca3:setWidth(75);
    obj.CbxMeca3:setFontColor("red");
    obj.CbxMeca3:setText("Mecanica Completa");
    obj.CbxMeca3:setField("ConheceMecanica3");

    obj.btnMeca4 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnMeca4:setParent(obj.scrollBox1);
    obj.btnMeca4:setName("btnMeca4");
    obj.btnMeca4:setLeft(360);
    obj.btnMeca4:setTop(237);
    obj.btnMeca4:setWidth(75);
    obj.btnMeca4:setHeight(20);
    obj.btnMeca4:setHorzTextAlign("center");
    obj.btnMeca4:setText("Mecanica 4");

    obj.popMecanica4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMecanica4:setParent(obj.scrollBox1);
    obj.popMecanica4:setName("popMecanica4");
    obj.popMecanica4:setWidth(420);
    obj.popMecanica4:setHeight(420);
    obj.popMecanica4:setBackOpacity(0.5);

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.popMecanica4);
    obj.label31:setLeft(10);
    obj.label31:setTop(10);
    obj.label31:setFontSize(22);
    obj.label31:setHeight(25);
    obj.label31:setText("Mecanica 4");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.popMecanica4);
    obj.label32:setLeft(10);
    obj.label32:setTop(45);
    obj.label32:setText("Habilidade :");
    obj.label32:setName("label32");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.popMecanica4);
    obj.edit39:setLeft(100);
    obj.edit39:setTop(40);
    obj.edit39:setWidth(278);
    obj.edit39:setField("NomeMecanica4");
    obj.edit39:setName("edit39");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.popMecanica4);
    obj.label33:setLeft(10);
    obj.label33:setTop(80);
    obj.label33:setText("Descrição Comum:");
    obj.label33:setName("label33");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.popMecanica4);
    obj.textEditor7:setLeft(130);
    obj.textEditor7:setTop(80);
    obj.textEditor7:setWidth(248);
    obj.textEditor7:setHeight(100);
    obj.textEditor7:setField("DescriMecanica4");
    obj.textEditor7:setName("textEditor7");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.popMecanica4);
    obj.button10:setLeft(10);
    obj.button10:setTop(100);
    obj.button10:setWidth(105);
    obj.button10:setHeight(80);
    obj.button10:setHorzTextAlign("center");
    obj.button10:setText("Enviar");
    obj.button10:setName("button10");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.popMecanica4);
    obj.label34:setLeft(10);
    obj.label34:setTop(190);
    obj.label34:setText("Descrição Completa:");
    obj.label34:setName("label34");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.popMecanica4);
    obj.textEditor8:setLeft(130);
    obj.textEditor8:setTop(190);
    obj.textEditor8:setWidth(248);
    obj.textEditor8:setHeight(100);
    obj.textEditor8:setField("FalhaMecanica4");
    obj.textEditor8:setName("textEditor8");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.popMecanica4);
    obj.label35:setLeft(10);
    obj.label35:setTop(303);
    obj.label35:setText("Tipo:");
    obj.label35:setName("label35");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.popMecanica4);
    obj.comboBox6:setLeft(50);
    obj.comboBox6:setTop(300);
    obj.comboBox6:setWidth(105);
    obj.comboBox6:setItems({'Dano', 'Dano Magico', 'Cura', 'Fixo'});
    obj.comboBox6:setField("TipoMecanica4");
    obj.comboBox6:setName("comboBox6");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.popMecanica4);
    obj.label36:setLeft(10);
    obj.label36:setTop(335);
    obj.label36:setText("Dano:");
    obj.label36:setName("label36");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.popMecanica4);
    obj.edit40:setLeft(50);
    obj.edit40:setTop(330);
    obj.edit40:setWidth(75);
    obj.edit40:setField("DanoMecanica4");
    obj.edit40:setName("edit40");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.popMecanica4);
    obj.label37:setLeft(135);
    obj.label37:setTop(335);
    obj.label37:setText("Cura:");
    obj.label37:setName("label37");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.popMecanica4);
    obj.edit41:setLeft(180);
    obj.edit41:setTop(330);
    obj.edit41:setWidth(75);
    obj.edit41:setField("CuraMecanica4");
    obj.edit41:setName("edit41");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.popMecanica4);
    obj.label38:setLeft(265);
    obj.label38:setTop(335);
    obj.label38:setText("Fixo:");
    obj.label38:setName("label38");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.popMecanica4);
    obj.edit42:setLeft(305);
    obj.edit42:setTop(330);
    obj.edit42:setWidth(75);
    obj.edit42:setField("FixoMecanica4");
    obj.edit42:setName("edit42");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.popMecanica4);
    obj.label39:setLeft(10);
    obj.label39:setTop(370);
    obj.label39:setVisible(true);
    obj.label39:setText("Custo:");
    obj.label39:setName("label39");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.popMecanica4);
    obj.edit43:setLeft(50);
    obj.edit43:setTop(365);
    obj.edit43:setVisible(true);
    obj.edit43:setWidth(75);
    obj.edit43:setField("CustoMecanica4");
    obj.edit43:setName("edit43");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.popMecanica4);
    obj.label40:setLeft(135);
    obj.label40:setTop(370);
    obj.label40:setVisible(true);
    obj.label40:setText("CD:");
    obj.label40:setName("label40");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.popMecanica4);
    obj.edit44:setLeft(180);
    obj.edit44:setTop(365);
    obj.edit44:setVisible(true);
    obj.edit44:setWidth(75);
    obj.edit44:setField("CDMecanica4");
    obj.edit44:setName("edit44");

    obj.CbxMeca4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.CbxMeca4:setParent(obj.popMecanica4);
    obj.CbxMeca4:setName("CbxMeca4");
    obj.CbxMeca4:setLeft(265);
    obj.CbxMeca4:setTop(370);
    obj.CbxMeca4:setWidth(75);
    obj.CbxMeca4:setFontColor("red");
    obj.CbxMeca4:setText("Mecanica Completa");
    obj.CbxMeca4:setField("ConheceMecanica4");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'NomeMecanica1', 'NomeMecanica2', 'NomeMecanica3', 'NomeMecanica4'});
    obj.dataLink1:setName("dataLink1");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox1);
    obj.button11:setText("Nova Habilidade");
    obj.button11:setLeft(310);
    obj.button11:setTop(413);
    obj.button11:setWidth(100);
    obj.button11:setHeight(20);
    obj.button11:setFontSize(12);
    obj.button11:setFontColor("#00FFFF");
    obj.button11:setName("button11");

    obj.rclHabilidadeInimigo = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadeInimigo:setParent(obj.scrollBox1);
    obj.rclHabilidadeInimigo:setName("rclHabilidadeInimigo");
    obj.rclHabilidadeInimigo:setLeft(40);
    obj.rclHabilidadeInimigo:setTop(450);
    obj.rclHabilidadeInimigo:setWidth(190);
    obj.rclHabilidadeInimigo:setHeight(200);
    obj.rclHabilidadeInimigo:setField("campoDosItens");
    obj.rclHabilidadeInimigo:setTemplateForm("frmHabilidadeInimigo");
    obj.rclHabilidadeInimigo:setSelectable(true);

    obj.dscHabilidadeInimigo = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dscHabilidadeInimigo:setParent(obj.scrollBox1);
    obj.dscHabilidadeInimigo:setName("dscHabilidadeInimigo");
    obj.dscHabilidadeInimigo:setTop(445);
    obj.dscHabilidadeInimigo:setLeft(230	);
    obj.dscHabilidadeInimigo:setVisible(false);
    obj.dscHabilidadeInimigo:setWidth(240);
    obj.dscHabilidadeInimigo:setHeight(200);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.dscHabilidadeInimigo);
    obj.rectangle3:setHeight(200);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setColor("grey");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setName("rectangle3");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle3);
    obj.label41:setLeft(10);
    obj.label41:setTop(10);
    obj.label41:setWidth(70);
    obj.label41:setHeight(18);
    obj.label41:setText("Skill");
    obj.label41:setName("label41");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle3);
    obj.edit45:setLeft(40);
    obj.edit45:setTop(10);
    obj.edit45:setWidth(70);
    obj.edit45:setHeight(18);
    obj.edit45:setFontSize(10);
    obj.edit45:setField("NomeSkill");
    obj.edit45:setName("edit45");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle3);
    obj.label42:setLeft(115);
    obj.label42:setTop(10);
    obj.label42:setWidth(28);
    obj.label42:setHeight(18);
    obj.label42:setText("Tipo");
    obj.label42:setName("label42");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.rectangle3);
    obj.comboBox7:setLeft(145);
    obj.comboBox7:setTop(10);
    obj.comboBox7:setWidth(90);
    obj.comboBox7:setField("TipoSkill");
    obj.comboBox7:setItems({'Dano', 'Dano Magico', 'Buff', 'Cura', 'Real', 'Defensiva'});
    obj.comboBox7:setName("comboBox7");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle3);
    obj.button12:setLeft(200);
    obj.button12:setTop(162);
    obj.button12:setText("X");
    obj.button12:setFontSize(18);
    obj.button12:setFontColor("red");
    obj.button12:setWidth(35);
    obj.button12:setHeight(35);
    obj.button12:setName("button12");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle3);
    obj.label43:setLeft(10);
    obj.label43:setTop(150);
    obj.label43:setWidth(70);
    obj.label43:setHeight(18);
    obj.label43:setText("Foco");
    obj.label43:setName("label43");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle3);
    obj.edit46:setLeft(45);
    obj.edit46:setTop(150);
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(18);
    obj.edit46:setType("number");
    obj.edit46:setField("Foco");
    obj.edit46:setName("edit46");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle3);
    obj.label44:setLeft(100);
    obj.label44:setTop(150);
    obj.label44:setWidth(70);
    obj.label44:setHeight(18);
    obj.label44:setText("Custo");
    obj.label44:setName("label44");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle3);
    obj.edit47:setLeft(140);
    obj.edit47:setTop(150);
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(18);
    obj.edit47:setType("number");
    obj.edit47:setField("Custo");
    obj.edit47:setName("edit47");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle3);
    obj.label45:setLeft(10);
    obj.label45:setTop(175);
    obj.label45:setWidth(70);
    obj.label45:setHeight(18);
    obj.label45:setText("Intensidade");
    obj.label45:setName("label45");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.rectangle3);
    obj.edit48:setLeft(85);
    obj.edit48:setTop(175);
    obj.edit48:setWidth(70);
    obj.edit48:setCanFocus(false);
    obj.edit48:setType("number");
    obj.edit48:setHeight(18);
    obj.edit48:setField("Intensidade");
    obj.edit48:setName("edit48");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle3);
    obj.textEditor9:setLeft(10);
    obj.textEditor9:setTop(40);
    obj.textEditor9:setWidth(160);
    obj.textEditor9:setHeight(100);
    obj.textEditor9:setFontSize(10);
    obj.textEditor9:setField("DescriHabilidade");
    obj.textEditor9:setName("textEditor9");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle3);
    obj.button13:setLeft(175);
    obj.button13:setTop(60);
    obj.button13:setWidth(60);
    obj.button13:setHeight(60);
    obj.button13:setFontSize(12);
    obj.button13:setFontColor("blue");
    obj.button13:setText("Usar");
    obj.button13:setName("button13");

    obj.popExtra = GUI.fromHandle(_obj_newObject("popup"));
    obj.popExtra:setParent(obj);
    obj.popExtra:setName("popExtra");
    obj.popExtra:setVisible(false);
    obj.popExtra:setWidth(500);
    obj.popExtra:setHeight(700);
    obj.popExtra:setBackOpacity(0.5);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.popExtra);
    obj.image4:setAlign("client");
    obj.image4:setSRC("/imagens/3.png");
    obj.image4:setName("image4");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.popExtra);
    obj.edit49:setLeft(230);
    obj.edit49:setTop(132);
    obj.edit49:setWidth(50);
    obj.edit49:setHeight(18);
    obj.edit49:setFontSize(12);
    obj.edit49:setField("Atletismo");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.popExtra);
    obj.edit50:setLeft(230);
    obj.edit50:setTop(156);
    obj.edit50:setWidth(50);
    obj.edit50:setHeight(18);
    obj.edit50:setFontSize(12);
    obj.edit50:setField("Sabedoria");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.popExtra);
    obj.edit51:setLeft(230);
    obj.edit51:setTop(180);
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(18);
    obj.edit51:setFontSize(12);
    obj.edit51:setField("Percepcao");
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.popExtra);
    obj.edit52:setLeft(230);
    obj.edit52:setTop(204);
    obj.edit52:setWidth(50);
    obj.edit52:setHeight(18);
    obj.edit52:setFontSize(12);
    obj.edit52:setField("Acrobacia");
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.popExtra);
    obj.edit53:setLeft(230);
    obj.edit53:setTop(228);
    obj.edit53:setWidth(50);
    obj.edit53:setHeight(18);
    obj.edit53:setFontSize(12);
    obj.edit53:setField("Vigor");
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.popExtra);
    obj.edit54:setLeft(230);
    obj.edit54:setTop(324);
    obj.edit54:setWidth(50);
    obj.edit54:setHeight(18);
    obj.edit54:setFontSize(12);
    obj.edit54:setField("Visao");
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.popExtra);
    obj.edit55:setLeft(230);
    obj.edit55:setTop(346);
    obj.edit55:setWidth(50);
    obj.edit55:setHeight(18);
    obj.edit55:setFontSize(12);
    obj.edit55:setField("DistanciaA");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.popExtra);
    obj.edit56:setLeft(230);
    obj.edit56:setTop(368);
    obj.edit56:setWidth(50);
    obj.edit56:setHeight(18);
    obj.edit56:setFontSize(12);
    obj.edit56:setField("RegenMP");
    obj.edit56:setName("edit56");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.popExtra);
    obj.edit57:setLeft(230);
    obj.edit57:setTop(390);
    obj.edit57:setWidth(50);
    obj.edit57:setHeight(18);
    obj.edit57:setFontSize(12);
    obj.edit57:setField("Deslocamento");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.popExtra);
    obj.edit58:setLeft(230);
    obj.edit58:setTop(412);
    obj.edit58:setWidth(50);
    obj.edit58:setHeight(18);
    obj.edit58:setFontSize(12);
    obj.edit58:setField("Corrida");
    obj.edit58:setName("edit58");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.popExtra);
    obj.button14:setLeft(83);
    obj.button14:setTop(450);
    obj.button14:setWidth(50);
    obj.button14:setHeight(18);
    obj.button14:setFontSize(12);
    obj.button14:setText("DROP 1");
    obj.button14:setName("button14");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.popExtra);
    obj.label46:setLeft(150);
    obj.label46:setTop(450);
    obj.label46:setWidth(50);
    obj.label46:setHeight(18);
    obj.label46:setFontSize(12);
    obj.label46:setText("CHANCE");
    obj.label46:setName("label46");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.popExtra);
    obj.edit59:setLeft(203);
    obj.edit59:setTop(450);
    obj.edit59:setWidth(30);
    obj.edit59:setHeight(18);
    obj.edit59:setFontSize(12);
    obj.edit59:setField("ChanceDrop1");
    obj.edit59:setName("edit59");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.popExtra);
    obj.textEditor10:setLeft(83);
    obj.textEditor10:setTop(475);
    obj.textEditor10:setWidth(150);
    obj.textEditor10:setHeight(50);
    obj.textEditor10:setField("DescDrop1");
    obj.textEditor10:setName("textEditor10");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.popExtra);
    obj.button15:setLeft(250);
    obj.button15:setTop(450);
    obj.button15:setWidth(50);
    obj.button15:setHeight(18);
    obj.button15:setFontSize(12);
    obj.button15:setText("DROP 2");
    obj.button15:setName("button15");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.popExtra);
    obj.label47:setLeft(317);
    obj.label47:setTop(450);
    obj.label47:setWidth(50);
    obj.label47:setHeight(18);
    obj.label47:setFontSize(12);
    obj.label47:setText("CHANCE");
    obj.label47:setName("label47");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.popExtra);
    obj.edit60:setLeft(370);
    obj.edit60:setTop(450);
    obj.edit60:setWidth(30);
    obj.edit60:setHeight(18);
    obj.edit60:setFontSize(12);
    obj.edit60:setField("ChanceDrop2");
    obj.edit60:setName("edit60");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.popExtra);
    obj.textEditor11:setLeft(250);
    obj.textEditor11:setTop(475);
    obj.textEditor11:setWidth(150);
    obj.textEditor11:setHeight(50);
    obj.textEditor11:setField("DescDrop2");
    obj.textEditor11:setName("textEditor11");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.popExtra);
    obj.button16:setLeft(83);
    obj.button16:setTop(530);
    obj.button16:setWidth(50);
    obj.button16:setHeight(18);
    obj.button16:setFontSize(12);
    obj.button16:setText("DROP 3");
    obj.button16:setName("button16");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.popExtra);
    obj.label48:setLeft(150);
    obj.label48:setTop(530);
    obj.label48:setWidth(50);
    obj.label48:setHeight(18);
    obj.label48:setFontSize(12);
    obj.label48:setText("CHANCE");
    obj.label48:setName("label48");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.popExtra);
    obj.edit61:setLeft(203);
    obj.edit61:setTop(530);
    obj.edit61:setWidth(30);
    obj.edit61:setHeight(18);
    obj.edit61:setFontSize(12);
    obj.edit61:setField("ChanceDrop3");
    obj.edit61:setName("edit61");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.popExtra);
    obj.textEditor12:setLeft(83);
    obj.textEditor12:setTop(555);
    obj.textEditor12:setWidth(150);
    obj.textEditor12:setHeight(50);
    obj.textEditor12:setField("DescDrop3");
    obj.textEditor12:setName("textEditor12");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.popExtra);
    obj.button17:setLeft(250);
    obj.button17:setTop(530);
    obj.button17:setWidth(50);
    obj.button17:setHeight(18);
    obj.button17:setFontSize(12);
    obj.button17:setText("DROP 4");
    obj.button17:setName("button17");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.popExtra);
    obj.label49:setLeft(317);
    obj.label49:setTop(530);
    obj.label49:setWidth(50);
    obj.label49:setHeight(18);
    obj.label49:setFontSize(12);
    obj.label49:setText("CHANCE");
    obj.label49:setName("label49");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.popExtra);
    obj.edit62:setLeft(370);
    obj.edit62:setTop(530);
    obj.edit62:setWidth(30);
    obj.edit62:setHeight(18);
    obj.edit62:setFontSize(12);
    obj.edit62:setField("ChanceDrop4");
    obj.edit62:setName("edit62");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.popExtra);
    obj.textEditor13:setLeft(250);
    obj.textEditor13:setTop(555);
    obj.textEditor13:setWidth(150);
    obj.textEditor13:setHeight(50);
    obj.textEditor13:setField("DescDrop4");
    obj.textEditor13:setName("textEditor13");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.popExtra);
    obj.button18:setLeft(300);
    obj.button18:setTop(132);
    obj.button18:setWidth(70);
    obj.button18:setHeight(20);
    obj.button18:setFontSize(12);
    obj.button18:setFontColor("#00FFFF");
    obj.button18:setText("Atletismo");
    obj.button18:setName("button18");


				local function RolarTesteAtletismo()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Atletismo = math.floor(tonumber(sheet.Atletismo or 0));                        
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Atletismo, "[§K2]Teste de Atletismo"); 
				end; 	   
			


    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.popExtra);
    obj.button19:setLeft(300);
    obj.button19:setTop(156);
    obj.button19:setWidth(70);
    obj.button19:setHeight(20);
    obj.button19:setFontSize(12);
    obj.button19:setFontColor("#00FFFF");
    obj.button19:setText("Sabedoria");
    obj.button19:setName("button19");


				local function RolarTesteSabedoria()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Sabedoria = math.floor(tonumber(sheet.Sabedoria or 0));                       
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Sabedoria, "[§K2]Teste de Sabedoria"); 
				end; 	   
			


    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.popExtra);
    obj.button20:setLeft(300);
    obj.button20:setTop(180);
    obj.button20:setWidth(70);
    obj.button20:setHeight(20);
    obj.button20:setFontSize(12);
    obj.button20:setFontColor("#00FFFF");
    obj.button20:setText("Percepção");
    obj.button20:setName("button20");


				local function RolarTestePercepcao()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Percepcao = math.floor(tonumber(sheet.Percepcao or 0));                       
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Percepcao, "[§K2]Teste de Percepcao"); 
				end; 	   
			


    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.popExtra);
    obj.button21:setLeft(300);
    obj.button21:setTop(204);
    obj.button21:setWidth(70);
    obj.button21:setHeight(20);
    obj.button21:setFontSize(12);
    obj.button21:setFontColor("#00FFFF");
    obj.button21:setText("Acrobacia");
    obj.button21:setName("button21");


				local function RolarTesteAcrobacia()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Acrobacia = math.floor(tonumber(sheet.Acrobacia or 0));                         
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acrobacia, "[§K2]Teste de Acrobacia"); 
				end; 	   
			


    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.popExtra);
    obj.button22:setLeft(300);
    obj.button22:setTop(228);
    obj.button22:setWidth(70);
    obj.button22:setHeight(20);
    obj.button22:setFontSize(12);
    obj.button22:setFontColor("#00FFFF");
    obj.button22:setText("Vigor");
    obj.button22:setName("button22");


				local function RolarTesteVigor()      
					local mesaDoPersonagem = Firecast.getMesaDe(sheet);      
					sheet.Vigor = math.floor(tonumber(sheet.Vigor or 0));                         
					mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Vigor, "[§K2]Teste de Vigor"); 
				end; 	   
			


    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'Defesa', 'Resistencia', 'level'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'HPAtual', 'HPTotal'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'MPAtual', 'MPTotal'});
    obj.dataLink4:setName("dataLink4");


		local function ToparStatus()   
			sheet.HPAtual = sheet.HPTotal;
						
			sheet.MPAtual = sheet.MPTotal;
		end; 		   
	



		local function AtaqueBasico()      
			local mesaDoPersonagem = Firecast.getMesaDe(sheet);        
			sheet.Acerto = sheet.Acerto or 0;                        
			if sheet.TipoAtaque == nil then
				showMessage("Escolha uma Base de Dano para seu Ataque Basico na lista acima");
			else				
				mesaDoPersonagem.chat:rolarDados("1d20 + " .. sheet.Acerto, "[§K2]Ataque Basico",						
					function (rolado)						
					local soDado = rolado.resultado + 1 - tonumber(sheet.Acerto);
						if soDado > tonumber(sheet.Critical) then
							if sheet.TipoAtaque == 'Dano Fisico' then
								mesaDoPersonagem.chat:enviarMensagem("[§K4,0]CRITICO CORPO A CORPO CARAI  :awyeah: « " .. sheet.Dano * 2 .. " »");
							elseif sheet.TipoAtaque == 'Dano Magico' then
								mesaDoPersonagem.chat:enviarMensagem("[§K4,0]CRITICO A DISTANCIA CARAI :awyeah: « " .. sheet.DanoMagico * 2 .. " »");								
							end;	
						else
							if sheet.TipoAtaque == 'Dano Fisico' then
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico corpo a corpo « [§K4,0] " .. sheet.Dano .. " [§K9,0]»");
							elseif sheet.TipoAtaque == 'Dano Magico' then			
								mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando como Dano Fisico a distancia « [§K4,0] " .. sheet.DanoMagico .. " [§K9,0]»");
							end;							
						end;							
				end); 
			end;
		end; 		   
	


					
		local function UsarHabilidade() 
		--[[ HABILIDADE DE DANO ]]--								
		local node = self.dscHabilidadeInimigo.node;
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
		function (rolado)					
		if node.TipoSkill ~= nil then
			if sheet.AcertoMagico + 1 > rolado.resultado then							
				if node.TipoSkill == 'Dano' then
					node.Intensidade = (tonumber(sheet.Dano) or 0) + (tonumber(node.Foco) or 0);							
				end;			
				if node.TipoSkill == 'Dano Magico' then
					node.Intensidade = (tonumber(sheet.DanoMagico) or 0) + (tonumber(node.Foco) or 0);								
				end;
				if node.TipoSkill == 'Cura' then
					node.Intensidade = (tonumber(sheet.DanoMagico) or 0) + (tonumber(node.Foco) or 0);	
				end;
				if node.TipoSkill == 'Buff' then
					node.Intensidade = 0;	
				end;
				if node.TipoSkill == 'Real' then
					node.Intensidade = (tonumber(node.Foco) or 0);
				end;
				if node.TipoSkill == 'Defensiva' then
					node.Intensidade = 0;
				end;
				if sheet.AcertoMagico >= rolado.resultado then				
					mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. node.DescriHabilidade);
					if node.TipoSkill == 'Cura' then
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (node.Intensidade * 2 or 0) .. "[§K8,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. node.Intensidade or 0 .. "[§K8,0] »");
						end;	
					else
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (node.Intensidade * 2 or 0) .. "[§K9,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. node.Intensidade or 0 .. "[§K9,0] »");
						end;	
					end;
					sheet.MPAtual = tonumber(sheet.MPAtual) - tonumber(node.Custo) or 0; 
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
				end;
			else							
				mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");
				if node.TipoSkill == 'Buff' then
					mesaDoPersonagem.chat:enviarMensagem("[§K3,15]ERA BUFF ESSA MERDA");	
				else 	
				end;
			end;
		else
			mesaDoPersonagem.chat:enviarMensagem("[§K3,0] TUA HABILIDADE NÃO TEM TIPO NÃO O FILHA DA PUTA ? ELA É DIFERENTONA ? ESCOLHE O TIPO DA HABILIDADE,[§K4,0] ROLA DNV");
		end;
		end);					
		end; 														
	



		local function URL() 
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);	
			if sheet.imgInimigo ~= nil then
				mesaDoPersonagem.chat:enviarMensagem("[§I" .. sheet.imgInimigo .. "]");	
			else
				showMessage("O Inimigo não possui uma imagem para enviar por isso enviaremos uma imagem da sua PRIMA");
			end;
		end;
	



		local function MecanicaComum1() 
		--[[ MECANICA 1 ]]--								
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
		function (rolado)					
		if sheet.TipoMecanica1 ~= nil then
			if sheet.AcertoMagico + 1 > rolado.resultado then							
				if sheet.TipoMecanica1 == 'Dano' then
					sheet.IntensidadeMecanica1 = (tonumber(sheet.DanoMecanica1) or 0) + (tonumber(sheet.Dano) or 0);							
				end;			
				if sheet.TipoMecanica1 == 'Dano Magico' then
					sheet.IntensidadeMecanica1 = (tonumber(sheet.DanoMecanica1) or 0) + (tonumber(sheet.DanoMagico) or 0);								
				end;
				if sheet.TipoMecanica1 == 'Cura' then
					sheet.IntensidadeMecanica1 = (tonumber(sheet.CuraMecanica1) or 0) + (tonumber(sheet.DanoMagico) or 0);	
				end;
				
				if sheet.TipoMecanica1 == 'Fixo' then
					sheet.IntensidadeMecanica1 = (tonumber(sheet.FixoMecanica1) or 0);	
				end;

				if sheet.AcertoMagico >= rolado.resultado then
					if self.CbxMeca1.checked then
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriMecanica1);
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.FalhaMecanica1);
					else					
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriMecanica1);
					end;
					if sheet.TipoMecanica1 == 'Cura' then
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (sheet.IntensidadeMecanica1 * 2 or 0) .. "[§K8,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. sheet.IntensidadeMecanica1 or 0 .. "[§K8,0] »");
						end;	
					else
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (sheet.IntensidadeMecanica1 * 2 or 0) .. "[§K9,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. sheet.IntensidadeMecanica1 or 0 .. "[§K9,0] »");
						end;	
					end;
					sheet.MPAtual = tonumber(sheet.MPAtual) - tonumber(sheet.CustoMecanica1) or 0; 
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
				end;
			else							
				mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");	
			end;
		else
			showMessage("A Habilidade ta sem tipo");
		end;
		end);					
		end; 				
	



		local function MecanicaComum2() 
		--[[ MECANICA 2 ]]--								
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
		function (rolado)					
		if sheet.TipoMecanica2 ~= nil then
			if sheet.AcertoMagico + 1 > rolado.resultado then							
				if sheet.TipoMecanica2 == 'Dano' then
					sheet.IntensidadeMecanica2 = (tonumber(sheet.DanoMecanica2) or 0) + (tonumber(sheet.Dano) or 0);							
				end;			
				if sheet.TipoMecanica2 == 'Dano Magico' then
					sheet.IntensidadeMecanica2 = (tonumber(sheet.DanoMecanica2) or 0) + (tonumber(sheet.DanoMagico) or 0);								
				end;
				if sheet.TipoMecanica2 == 'Cura' then
					sheet.IntensidadeMecanica2 = (tonumber(sheet.CuraMecanica2) or 0) + (tonumber(sheet.DanoMagico) or 0);	
				end;
				
				if sheet.TipoMecanica2 == 'Fixo' then
					sheet.IntensidadeMecanica2 = (tonumber(sheet.FixoMecanica2) or 0);	
				end;

				if sheet.AcertoMagico >= rolado.resultado then
					if self.CbxMeca2.checked then
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriMecanica2);
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.FalhaMecanica2);
					else					
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriMecanica2);
					end;
					if sheet.TipoMecanica2 == 'Cura' then
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (sheet.IntensidadeMecanica2 * 2 or 0) .. "[§K8,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. sheet.IntensidadeMecanica2 or 0 .. "[§K8,0] »");
						end;	
					else
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (sheet.IntensidadeMecanica2 * 2 or 0) .. "[§K9,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. sheet.IntensidadeMecanica2 or 0 .. "[§K9,0] »");
						end;	
					end;
					sheet.MPAtual = tonumber(sheet.MPAtual) - tonumber(sheet.CustoMecanica2) or 0; 
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
				end;
			else							
				mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");	
			end;
		else
			showMessage("A Habilidade ta sem tipo");
		end;
		end);					
		end; 				
	



		local function MecanicaComum3() 
		--[[ MECANICA 3 ]]--								
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
		function (rolado)					
		if sheet.TipoMecanica3 ~= nil then
			if sheet.AcertoMagico + 1 > rolado.resultado then							
				if sheet.TipoMecanica3 == 'Dano' then
					sheet.IntensidadeMecanica3 = (tonumber(sheet.DanoMecanica3) or 0) + (tonumber(sheet.Dano) or 0);							
				end;			
				if sheet.TipoMecanica3 == 'Dano Magico' then
					sheet.IntensidadeMecanica3 = (tonumber(sheet.DanoMecanica3) or 0) + (tonumber(sheet.DanoMagico) or 0);								
				end;
				if sheet.TipoMecanica3 == 'Cura' then
					sheet.IntensidadeMecanica3 = (tonumber(sheet.CuraMecanica3) or 0) + (tonumber(sheet.DanoMagico) or 0);	
				end;
				
				if sheet.TipoMecanica3 == 'Fixo' then
					sheet.IntensidadeMecanica3 = (tonumber(sheet.FixoMecanica3) or 0);	
				end;

				if sheet.AcertoMagico >= rolado.resultado then
					if self.CbxMeca3.checked then
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriMecanica3);
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.FalhaMecanica3);
					else					
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriMecanica3);
					end;
					if sheet.TipoMecanica3 == 'Cura' then
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (sheet.IntensidadeMecanica3 * 2 or 0) .. "[§K8,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. sheet.IntensidadeMecanica3 or 0 .. "[§K8,0] »");
						end;	
					else
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (sheet.IntensidadeMecanica3 * 2 or 0) .. "[§K9,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. sheet.IntensidadeMecanica3 or 0 .. "[§K9,0] »");
						end;	
					end;
					sheet.MPAtual = tonumber(sheet.MPAtual) - tonumber(sheet.CustoMecanica3) or 0; 
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
				end;
			else							
				mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");	
			end;
		else
			showMessage("A Habilidade ta sem tipo");
		end;
		end);					
		end; 				
	



		local function MecanicaComum4() 
		--[[ Mecanica4 4 ]]--								
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
		function (rolado)					
		if sheet.TipoMecanica4 ~= nil then
			if sheet.AcertoMagico + 1 > rolado.resultado then							
				if sheet.TipoMecanica4 == 'Dano' then
					sheet.IntensidadeMecanica4 = (tonumber(sheet.DanoMecanica4) or 0) + (tonumber(sheet.Dano) or 0);							
				end;			
				if sheet.TipoMecanica4 == 'Dano Magico' then
					sheet.IntensidadeMecanica4 = (tonumber(sheet.DanoMecanica4) or 0) + (tonumber(sheet.DanoMagico) or 0);								
				end;
				if sheet.TipoMecanica4 == 'Cura' then
					sheet.IntensidadeMecanica4 = (tonumber(sheet.CuraMecanica4) or 0) + (tonumber(sheet.DanoMagico) or 0);	
				end;
				
				if sheet.TipoMecanica4 == 'Fixo' then
					sheet.IntensidadeMecanica4 = (tonumber(sheet.FixoMecanica4) or 0);	
				end;

				if sheet.AcertoMagico >= rolado.resultado then
					if self.CbxMeca4.checked then
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriMecanica4);
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.FalhaMecanica4);
					else					
						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.DescriMecanica4);
					end;
					if sheet.TipoMecanica4 == 'Cura' then
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando com [§K4,0] CRITICAL [§K8,0] « [§K4,0] " .. (sheet.IntensidadeMecanica4 * 2 or 0) .. "[§K8,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K8,0]Curando « [§K4,0]" .. sheet.IntensidadeMecanica4 or 0 .. "[§K8,0] »");
						end;	
					else
						if sheet.CriticalMagico +1 > rolado.resultado then 
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. (sheet.IntensidadeMecanica4 * 2 or 0) .. "[§K9,0] »");
						else
							mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. sheet.IntensidadeMecanica4 or 0 .. "[§K9,0] »");
						end;	
					end;
					sheet.MPAtual = tonumber(sheet.MPAtual) - tonumber(sheet.CustoMecanica4) or 0; 
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
				end;
			else							
				mesaDoPersonagem.chat:enviarMensagem("[§K4,0]FALHOU :troll:");	
			end;
		else
			showMessage("A Habilidade ta sem tipo");
		end;
		end);					
		end; 				
	



		local function RetiraHP()
			if sheet.TipoRecebido == '% Fisico' then
				sheet.AplicaDefPorCent = (tonumber(sheet.HPRetirado) or 0) * (tonumber(sheet.DefesaPorCent) / 100);
			else
				sheet.AplicaDefPorCent = (tonumber(sheet.HPRetirado) or 0) * (tonumber(sheet.ResistenciaPorCent) / 100);
			end;
			
			sheet.HPRetiradoReal = (tonumber(sheet.HPRetirado) or 0) - (tonumber(sheet.AplicaDefPorCent))		
			sheet.HPRetiradoReal = math.ceil(sheet.HPRetiradoReal)
			
			sheet.HPAtual = (tonumber(sheet.HPAtual) or 0) - (tonumber(sheet.HPRetiradoReal) or 0);
			sheet.HPRetiradoCrtZ = (tonumber(sheet.HPRetirado) or 0);
						
			self.BarraHP.value = tonumber(sheet.HPAtual);
			self.BarraHP.max = tonumber(sheet.HPTotal);	
			
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
			mesaDoPersonagem.chat:enviarMensagem("[§K4,0]Dano que recebido pela criatura " .. sheet.HPRetiradoReal);
			
			sheet.HPRetirado = 0;
			
		end; 		   
	



		local function RetiraMP()      
			sheet.MPAtual = (tonumber(sheet.MPAtual) or 0) - (tonumber(sheet.MPRetirado) or 0);
			sheet.MPRetiradoCrtZ = (tonumber(sheet.MPRetirado) or 0);
						
			self.BarraMP.value = tonumber(sheet.MPAtual);
			self.BarraMP.max = tonumber(sheet.MPTotal);	
			
			sheet.MPRetirado = 0;
		end; 		   
	



		local function Drop1() 								
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
			sheet.ChanceDrop1 = tonumber(sheet.ChanceDrop1) or 0;						
			mesaDoPersonagem.chat:rolarDados("1d100", "[§K3]Chance de Drop",
			function (rolado)					
				if sheet.ChanceDrop1 >= rolado.resultado then							
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0]DROPOU");	
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0] " .. sheet.DescDrop1);					
				else							
					mesaDoPersonagem.chat:enviarMensagem("[§K14,0]SEM SORTE");	
				end;			
			end);					
		end; 				
	



		local function Drop2() 								
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
			sheet.ChanceDrop2 = tonumber(sheet.ChanceDrop2) or 0;						
			mesaDoPersonagem.chat:rolarDados("1d100", "[§K3]Chance de Drop",
			function (rolado)					
				if sheet.ChanceDrop2 >= rolado.resultado then							
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0]DROPOU");	
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0] " .. sheet.DescDrop2);					
				else							
					mesaDoPersonagem.chat:enviarMensagem("[§K14,0]SEM SORTE");	
				end;			
			end);					
		end; 				
	



		local function Drop3() 								
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
			sheet.ChanceDrop3 = tonumber(sheet.ChanceDrop3) or 0;						
			mesaDoPersonagem.chat:rolarDados("1d100", "[§K3]Chance de Drop",
			function (rolado)					
				if sheet.ChanceDrop3 >= rolado.resultado then							
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0]DROPOU");	
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0] " .. sheet.DescDrop3);					
				else							
					mesaDoPersonagem.chat:enviarMensagem("[§K14,0]SEM SORTE");	
				end;			
			end);					
		end; 				
	



		local function Drop4() 								
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);		
			sheet.ChanceDrop4 = tonumber(sheet.ChanceDrop4) or 0;						
			mesaDoPersonagem.chat:rolarDados("1d100", "[§K3]Chance de Drop",
			function (rolado)					
				if sheet.ChanceDrop4 >= rolado.resultado then							
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0]DROPOU");	
					mesaDoPersonagem.chat:enviarMensagem("[§K8,0] " .. sheet.DescDrop4);					
				else							
					mesaDoPersonagem.chat:enviarMensagem("[§K14,0]SEM SORTE");	
				end;			
			end);					
		end; 				
	


    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            sheet.HPAtual = tonumber(sheet.HPAtual) or 0;
            		sheet.HPRetirado = tonumber(sheet.HPRetirado) or 0;
            		sheet.HPTotal = tonumber(sheet.HPTotal) or 0;
            		sheet.level = tonumber(sheet.level) or 0;
            		sheet.MPAtual = tonumber(sheet.MPAtual) or 0;
            		sheet.MPTotal = tonumber(sheet.MPTotal) or 0;
            		sheet.MPRetirado = tonumber(sheet.MPRetirado) or 0;
            		
            		sheet.Nome = sheet.Nome or "Nome Mob";
            		sheet.Dano = tonumber(sheet.Dano) or 0;
            		sheet.DanoMagico = tonumber(sheet.DanoMagico) or 0;
            		sheet.Defesa = tonumber(sheet.Defesa) or 0;
            		sheet.Resistencia = tonumber(sheet.Resistencia) or 0;
            		sheet.Acerto = tonumber(sheet.Acerto) or 0;
            		sheet.Esquiva = tonumber(sheet.Esquiva) or 0;
            		sheet.Critical = tonumber(sheet.Critical) or 0;
            		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;
            		sheet.CriticalMagico = tonumber(sheet.CriticalMagico) or 0;
            		sheet.Persistencia = tonumber(sheet.Persistencia) or 0;
            		sheet.TipoAtaque = sheet.TipoAtaque or "Dano Fisico";
            		
            		sheet.Atletismo = tonumber(sheet.Atletismo) or 0;
            		sheet.Sabedoria = tonumber(sheet.Sabedoria) or 0;
            		sheet.Percepcao = tonumber(sheet.Percepcao) or 0;
            		sheet.Acrobacia = tonumber(sheet.Acrobacia) or 0;
            		sheet.Vigor = tonumber(sheet.Vigor) or 0;
            		sheet.Visao = tonumber(sheet.Visao) or 0;
            		sheet.DistanciaA = tonumber(sheet.DistanciaA) or 0;
            		sheet.RegenMP = tonumber(sheet.RegenMP) or 0;
            		sheet.Deslocamento = tonumber(sheet.Deslocamento) or 0;
            		sheet.Corrida = tonumber(sheet.Corrida) or 0;
            		
            		sheet.DescDrop1 = (sheet.DescDrop1) or "Item";
            		sheet.DescDrop2 = (sheet.DescDrop2) or "Item";
            		sheet.DescDrop3 = (sheet.DescDrop3) or "Item";
            		sheet.DescDrop4 = (sheet.DescDrop4) or "Item";
            		
            		sheet.ChanceDrop1 = tonumber(sheet.ChanceDrop1) or 0;		
            		sheet.ChanceDrop2 = tonumber(sheet.ChanceDrop2) or 0;		
            		sheet.ChanceDrop3 = tonumber(sheet.ChanceDrop3) or 0;		
            		sheet.ChanceDrop4 = tonumber(sheet.ChanceDrop4) or 0;
            		
            		sheet.NomeMecanica1 = sheet.NomeMecanica1 or '';
            		sheet.DescriMecanica1 = sheet.DescriMecanica1 or 'Descrição da Habilidade';
            		sheet.FalhaMecanica1 = sheet.FalhaMecanica1 or 'Mecanica Completa';
            		sheet.TipoMecanica1 = sheet.TipoMecanica1 or 'Escolha';
            		sheet.DanoMecanica1 = tonumber(sheet.DanoMecanica1) or 0;
            		sheet.CuraMecanica1 = tonumber(sheet.CuraMecanica1) or 0;
            		sheet.FixoMecanica1 = tonumber(sheet.FixoMecanica1) or 0;
            		sheet.CustoMecanica1 = tonumber(sheet.CustoMecanica1) or 0;
            		sheet.CDMecanica1 = tonumber(sheet.CDMecanica1) or 0;
            		
            		sheet.NomeMecanica2 = sheet.NomeMecanica2 or '';
            		sheet.DescriMecanica2 = sheet.DescriMecanica2 or 'Descrição da Habilidade';
            		sheet.FalhaMecanica2 = sheet.FalhaMecanica2 or 'Mecanica Completa';
            		sheet.TipoMecanica2 = sheet.TipoMecanica2 or 'Escolha';
            		sheet.DanoMecanica2 = tonumber(sheet.DanoMecanica2) or 0;
            		sheet.CuraMecanica2 = tonumber(sheet.CuraMecanica2) or 0;
            		sheet.FixoMecanica2 = tonumber(sheet.FixoMecanica2) or 0;
            		sheet.CustoMecanica2 = tonumber(sheet.CustoMecanica2) or 0;
            		sheet.CDMecanica2 = tonumber(sheet.CDMecanica2) or 0;
            		
            		sheet.NomeMecanica3 = sheet.NomeMecanica3 or '';
            		sheet.DescriMecanica3 = sheet.DescriMecanica3 or 'Descrição da Habilidade';
            		sheet.FalhaMecanica3 = sheet.FalhaMecanica3 or 'Mecanica Completa';
            		sheet.TipoMecanica3 = sheet.TipoMecanica3 or 'Escolha';
            		sheet.DanoMecanica3 = tonumber(sheet.DanoMecanica3) or 0;
            		sheet.CuraMecanica3 = tonumber(sheet.CuraMecanica3) or 0;
            		sheet.FixoMecanica3 = tonumber(sheet.FixoMecanica3) or 0;
            		sheet.CustoMecanica3 = tonumber(sheet.CustoMecanica3) or 0;
            		sheet.CDMecanica3 = tonumber(sheet.CDMecanica3) or 0;
            		
            		sheet.NomeMecanica4 = sheet.NomeMecanica4 or '';
            		sheet.DescriMecanica4 = sheet.DescriMecanica4 or 'Descrição da Habilidade';
            		sheet.FalhaMecanica4 = sheet.FalhaMecanica4 or 'Mecanica Completa';
            		sheet.TipoMecanica4 = sheet.TipoMecanica4 or 'Escolha';
            		sheet.DanoMecanica4 = tonumber(sheet.DanoMecanica4) or 0;
            		sheet.CuraMecanica4 = tonumber(sheet.CuraMecanica4) or 0;
            		sheet.FixoMecanica4 = tonumber(sheet.FixoMecanica4) or 0;
            		sheet.CustoMecanica4 = tonumber(sheet.CustoMecanica4) or 0;
            		sheet.CDMecanica4 = tonumber(sheet.CDMecanica4) or 0;
            		
            		sheet.TipoRecebido = sheet.TipoRecebido or "% Fisico";
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            RetiraHP();
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            URL()
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (_)
            RetiraMP();
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (_)
            ToparStatus();
        end, obj);

    obj._e_event5 = obj.button5:addEventListener("onClick",
        function (_)
            AtaqueBasico()
        end, obj);

    obj._e_event6 = obj.button6:addEventListener("onClick",
        function (_)
            self.popExtra:show();
        end, obj);

    obj._e_event7 = obj.btnMeca1:addEventListener("onClick",
        function (_)
            self.popMecanica1:show();
        end, obj);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (_)
            MecanicaComum1()
        end, obj);

    obj._e_event9 = obj.btnMeca2:addEventListener("onClick",
        function (_)
            self.popMecanica2:show();
        end, obj);

    obj._e_event10 = obj.button8:addEventListener("onClick",
        function (_)
            MecanicaComum2()
        end, obj);

    obj._e_event11 = obj.btnMeca3:addEventListener("onClick",
        function (_)
            self.popMecanica3:show();
        end, obj);

    obj._e_event12 = obj.button9:addEventListener("onClick",
        function (_)
            MecanicaComum3()
        end, obj);

    obj._e_event13 = obj.btnMeca4:addEventListener("onClick",
        function (_)
            self.popMecanica4:show();
        end, obj);

    obj._e_event14 = obj.button10:addEventListener("onClick",
        function (_)
            MecanicaComum4()
        end, obj);

    obj._e_event15 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.btnMeca1.fontColor = 'white'
            					self.btnMeca2.fontColor = 'white'
            					self.btnMeca3.fontColor = 'white'
            					self.btnMeca4.fontColor = 'white'
            					
            					if sheet.NomeMecanica1 ~= nil then
            						self.btnMeca1.fontColor = 'red';
            					end;
            					
            					if sheet.NomeMecanica2 ~= nil then
            						self.btnMeca2.fontColor = 'red';
            					end;
            					if sheet.NomeMecanica3 ~= nil then
            						self.btnMeca3.fontColor = 'red';
            					end;
            					if sheet.NomeMecanica4 ~= nil then
            						self.btnMeca4.fontColor = 'red';
            					end;
        end, obj);

    obj._e_event16 = obj.button11:addEventListener("onClick",
        function (_)
            self.rclHabilidadeInimigo:append();
        end, obj);

    obj._e_event17 = obj.rclHabilidadeInimigo:addEventListener("onSelect",
        function (_)
            local node = self.rclHabilidadeInimigo.selectedNode; 
            					self.dscHabilidadeInimigo.node = node;                       
            					self.dscHabilidadeInimigo.visible = (node ~= nil);
            					
            					if self.dscHabilidadeInimigo.visible == true then
            						self.dscHabilidadeInimigo.node.NomeSkill = self.dscHabilidadeInimigo.node.NomeSkill or ''
            						self.dscHabilidadeInimigo.node.TipoSkill = self.dscHabilidadeInimigo.node.TipoSkill or 'Escolha'
            						self.dscHabilidadeInimigo.node.Foco = tonumber(self.dscHabilidadeInimigo.node.Foco) or 0;
            						self.dscHabilidadeInimigo.node.Custo = tonumber(self.dscHabilidadeInimigo.node.Custo) or 0;
            						self.dscHabilidadeInimigo.node.Intensidade = tonumber(self.dscHabilidadeInimigo.node.Intensidade) or 0;
            						self.dscHabilidadeInimigo.node.DescriHabilidade = self.dscHabilidadeInimigo.node.DescriHabilidade or 'Descrição da Habilidade'
            					end;
        end, obj);

    obj._e_event18 = obj.rclHabilidadeInimigo:addEventListener("onEndEnumeration",
        function (_)
            if self.rclHabilidadeInimigo.selectedNode == nil and sheet ~= nil then
            					local nodes = ndb.getChildNodes(sheet.campoDosItens);	
            					if #nodes > 0 then
            						self.rclHabilidadeInimigo.selectedNode = nodes[1];
            					end;
            				end;
        end, obj);

    obj._e_event19 = obj.button12:addEventListener("onClick",
        function (_)
            NDB.deleteNode(self.dscHabilidadeInimigo.node);
        end, obj);

    obj._e_event20 = obj.button13:addEventListener("onClick",
        function (_)
            UsarHabilidade()
        end, obj);

    obj._e_event21 = obj.button14:addEventListener("onClick",
        function (_)
            Drop1();
        end, obj);

    obj._e_event22 = obj.button15:addEventListener("onClick",
        function (_)
            Drop2();
        end, obj);

    obj._e_event23 = obj.button16:addEventListener("onClick",
        function (_)
            Drop3();
        end, obj);

    obj._e_event24 = obj.button17:addEventListener("onClick",
        function (_)
            Drop4();
        end, obj);

    obj._e_event25 = obj.button18:addEventListener("onClick",
        function (_)
            RolarTesteAtletismo()
        end, obj);

    obj._e_event26 = obj.button19:addEventListener("onClick",
        function (_)
            RolarTesteSabedoria()
        end, obj);

    obj._e_event27 = obj.button20:addEventListener("onClick",
        function (_)
            RolarTestePercepcao()
        end, obj);

    obj._e_event28 = obj.button21:addEventListener("onClick",
        function (_)
            RolarTesteAcrobacia()
        end, obj);

    obj._e_event29 = obj.button22:addEventListener("onClick",
        function (_)
            RolarTesteVigor()
        end, obj);

    obj._e_event30 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            ---------------------------------------------
            			---------------------------------------------
            			------[[Calculo de Redução Porcentado]]------
            			---------------------------------------------
            			---------------------------------------------
            			if sheet.level == 30 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /5);
            			end;	
            				
            			if sheet.level == 29 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /4.5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /4.5);
            			end;
            			
            			if sheet.level == 28 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /4.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /4.2);
            			end;
            			
            			if sheet.level == 27 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.9);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.9);
            			end;
            			
            			if sheet.level == 26 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.8);
            			end;
            
            			if sheet.level == 25 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.6);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.6);
            			end;
            			
            			if sheet.level == 24 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.4);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.4);
            			end;
            			
            			if sheet.level == 23 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3.2);
            			end;
            			
            			if sheet.level == 22 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /3);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /3);
            			end;
            			
            			if sheet.level == 21 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.8);
            			end;
            			
            			if sheet.level == 20 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.5);
            			end;
            			
            			if sheet.level == 19 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.4);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.4);
            			end;
            			
            			if sheet.level == 18 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2.2);
            			end;
            			
            			if sheet.level == 17 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /2);
            			end;
            			
            			if sheet.level == 16 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.9);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.9);
            			end;
            			
            			if sheet.level == 15 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.8);
            			end;
            			
            			if sheet.level == 14 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.6);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.6);
            			end;
            			
            			if sheet.level == 13 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.5);
            			end;
            			
            			if sheet.level == 12 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.3);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.3);
            			end;
            			
            			if sheet.level == 11 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.2);
            			end;
            			
            			if sheet.level == 10 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1.1);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1.1);
            			end;
            			
            			if sheet.level == 9 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /1);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /1);
            			end;
            			
            			if sheet.level == 8 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.92);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.92);
            			end;
            			
            			if sheet.level == 7 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.8);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.8);
            			end;
            			
            			if sheet.level == 6 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.7);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.7);
            			end;
            			
            			if sheet.level == 5 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.5);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.5);
            			end;
            			
            			if sheet.level == 4 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.4);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.4);
            			end;
            			
            			if sheet.level == 3 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.3);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.3);
            			end;
            			
            			if sheet.level == 2 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.2);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.2);
            			end;
            			
            			if sheet.level == 1 then 
            				sheet.DefesaPorCent = math.floor((tonumber(sheet.Defesa) or 0) /0.15);
            				sheet.ResistenciaPorCent = math.floor((tonumber(sheet.Resistencia) or 0) /0.15);
            			end;
        end, obj);

    obj._e_event31 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.BarraHP.value = tonumber(sheet.HPAtual);
            			self.BarraHP.max = tonumber(sheet.HPTotal);
        end, obj);

    obj._e_event32 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.BarraMP.value = tonumber(sheet.MPAtual);
            			self.BarraMP.max = tonumber(sheet.MPTotal);
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rclHabilidadeInimigo ~= nil then self.rclHabilidadeInimigo:destroy(); self.rclHabilidadeInimigo = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.CbxMeca3 ~= nil then self.CbxMeca3:destroy(); self.CbxMeca3 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.BarraMP ~= nil then self.BarraMP:destroy(); self.BarraMP = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.URLIMG ~= nil then self.URLIMG:destroy(); self.URLIMG = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.btnMeca2 ~= nil then self.btnMeca2:destroy(); self.btnMeca2 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dscHabilidadeInimigo ~= nil then self.dscHabilidadeInimigo:destroy(); self.dscHabilidadeInimigo = nil; end;
        if self.CbxMeca1 ~= nil then self.CbxMeca1:destroy(); self.CbxMeca1 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.popMecanica1 ~= nil then self.popMecanica1:destroy(); self.popMecanica1 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.popMecanica2 ~= nil then self.popMecanica2:destroy(); self.popMecanica2 = nil; end;
        if self.CbxMeca2 ~= nil then self.CbxMeca2:destroy(); self.CbxMeca2 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.popMecanica3 ~= nil then self.popMecanica3:destroy(); self.popMecanica3 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.popMecanica4 ~= nil then self.popMecanica4:destroy(); self.popMecanica4 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.btnMeca3 ~= nil then self.btnMeca3:destroy(); self.btnMeca3 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.popExtra ~= nil then self.popExtra:destroy(); self.popExtra = nil; end;
        if self.BarraHP ~= nil then self.BarraHP:destroy(); self.BarraHP = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.CbxMeca4 ~= nil then self.CbxMeca4:destroy(); self.CbxMeca4 = nil; end;
        if self.btnMeca1 ~= nil then self.btnMeca1:destroy(); self.btnMeca1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.btnMeca4 ~= nil then self.btnMeca4:destroy(); self.btnMeca4 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSobrePostaInimigo()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSobrePostaInimigo();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSobrePostaInimigo = {
    newEditor = newfrmSobrePostaInimigo, 
    new = newfrmSobrePostaInimigo, 
    name = "frmSobrePostaInimigo", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmSobrePostaInimigo = _frmSobrePostaInimigo;
Firecast.registrarForm(_frmSobrePostaInimigo);

return _frmSobrePostaInimigo;
