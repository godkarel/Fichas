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
    obj:setDataType("Sistema_de_Combate_Velen");
    obj:setTitle("Sistema de Combate Velen");
    obj:setName("frmscv");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setLeft(1);
    obj.image1:setTop(1);
    obj.image1:setWidth(1370);
    obj.image1:setHeight(770);
    obj.image1:setSRC("/imagens/1.png");
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(11);
    obj.edit1:setTop(60);
    obj.edit1:setField("APA1");
    obj.edit1:setWidth(80);
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(119);
    obj.edit2:setTop(60);
    obj.edit2:setField("APM1");
    obj.edit2:setWidth(80);
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(228);
    obj.edit3:setTop(60);
    obj.edit3:setField("ADS1");
    obj.edit3:setWidth(110);
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setLeft(380);
    obj.edit4:setTop(60);
    obj.edit4:setField("AB1");
    obj.edit4:setWidth(110);
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setLeft(516);
    obj.edit5:setTop(60);
    obj.edit5:setField("ACura1");
    obj.edit5:setWidth(110);
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setLeft(658);
    obj.edit6:setTop(60);
    obj.edit6:setField("AD1");
    obj.edit6:setWidth(110);
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj);
    obj.edit7:setLeft(803);
    obj.edit7:setTop(60);
    obj.edit7:setField("AR1");
    obj.edit7:setWidth(80);
    obj.edit7:setName("edit7");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setLeft(912);
    obj.rectangle1:setTop(60);
    obj.rectangle1:setWidth(110);
    obj.rectangle1:setHeight(30);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(915);
    obj.label1:setTop(65);
    obj.label1:setField("ACausado1");
    obj.label1:setWidth(110);
    obj.label1:setName("label1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setLeft(1055);
    obj.rectangle2:setTop(60);
    obj.rectangle2:setWidth(110);
    obj.rectangle2:setHeight(30);
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(1058);
    obj.label2:setTop(65);
    obj.label2:setField("ACritical1");
    obj.label2:setWidth(110);
    obj.label2:setName("label2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setLeft(1201);
    obj.rectangle3:setTop(60);
    obj.rectangle3:setWidth(110);
    obj.rectangle3:setHeight(30);
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(1204);
    obj.label3:setTop(65);
    obj.label3:setField("ATotal1");
    obj.label3:setWidth(110);
    obj.label3:setName("label3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(55);
    obj.button1:setTop(33);
    obj.button1:setText("P.A");
    obj.button1:setOpacity(1.0);
    obj.button1:setWidth(37);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(167);
    obj.button2:setTop(33);
    obj.button2:setText("P.M");
    obj.button2:setOpacity(1.0);
    obj.button2:setWidth(37);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setLeft(587);
    obj.button3:setTop(33);
    obj.button3:setText("Cura");
    obj.button3:setOpacity(1.0);
    obj.button3:setWidth(38);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj);
    obj.button4:setLeft(1320);
    obj.button4:setTop(59);
    obj.button4:setText("Limpar");
    obj.button4:setOpacity(1.0);
    obj.button4:setWidth(50);
    obj.button4:setHeight(30);
    obj.button4:setName("button4");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj);
    obj.edit8:setLeft(11);
    obj.edit8:setTop(125);
    obj.edit8:setField("APA2");
    obj.edit8:setWidth(80);
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj);
    obj.edit9:setLeft(119);
    obj.edit9:setTop(125);
    obj.edit9:setField("APM2");
    obj.edit9:setWidth(80);
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj);
    obj.edit10:setLeft(228);
    obj.edit10:setTop(125);
    obj.edit10:setField("ADS2");
    obj.edit10:setWidth(110);
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj);
    obj.edit11:setLeft(380);
    obj.edit11:setTop(125);
    obj.edit11:setField("AB2");
    obj.edit11:setWidth(110);
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj);
    obj.edit12:setLeft(516);
    obj.edit12:setTop(125);
    obj.edit12:setField("ACura2");
    obj.edit12:setWidth(110);
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj);
    obj.edit13:setLeft(658);
    obj.edit13:setTop(125);
    obj.edit13:setField("AD2");
    obj.edit13:setWidth(110);
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj);
    obj.edit14:setLeft(803);
    obj.edit14:setTop(125);
    obj.edit14:setField("AR2");
    obj.edit14:setWidth(80);
    obj.edit14:setName("edit14");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setLeft(912);
    obj.rectangle4:setTop(125);
    obj.rectangle4:setWidth(110);
    obj.rectangle4:setHeight(30);
    obj.rectangle4:setName("rectangle4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(915);
    obj.label4:setTop(130);
    obj.label4:setField("ACausado2");
    obj.label4:setWidth(110);
    obj.label4:setName("label4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setLeft(1055);
    obj.rectangle5:setTop(125);
    obj.rectangle5:setWidth(110);
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setName("rectangle5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setLeft(1058);
    obj.label5:setTop(130);
    obj.label5:setField("ACritical2");
    obj.label5:setWidth(110);
    obj.label5:setName("label5");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setLeft(1201);
    obj.rectangle6:setTop(125);
    obj.rectangle6:setWidth(110);
    obj.rectangle6:setHeight(30);
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setLeft(1204);
    obj.label6:setTop(130);
    obj.label6:setField("ATotal2");
    obj.label6:setWidth(110);
    obj.label6:setName("label6");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj);
    obj.button5:setLeft(55);
    obj.button5:setTop(95);
    obj.button5:setText("P.A");
    obj.button5:setOpacity(1.0);
    obj.button5:setWidth(37);
    obj.button5:setHeight(25);
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj);
    obj.button6:setLeft(167);
    obj.button6:setTop(95);
    obj.button6:setText("P.M");
    obj.button6:setOpacity(1.0);
    obj.button6:setWidth(37);
    obj.button6:setHeight(25);
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj);
    obj.button7:setLeft(587);
    obj.button7:setTop(95);
    obj.button7:setText("Cura");
    obj.button7:setOpacity(1.0);
    obj.button7:setWidth(38);
    obj.button7:setHeight(25);
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj);
    obj.button8:setLeft(1320);
    obj.button8:setTop(125);
    obj.button8:setText("Limpar");
    obj.button8:setOpacity(1.0);
    obj.button8:setWidth(50);
    obj.button8:setHeight(30);
    obj.button8:setName("button8");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj);
    obj.edit15:setLeft(11);
    obj.edit15:setTop(190);
    obj.edit15:setField("APA3");
    obj.edit15:setWidth(80);
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj);
    obj.edit16:setLeft(119);
    obj.edit16:setTop(190);
    obj.edit16:setField("APM3");
    obj.edit16:setWidth(80);
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj);
    obj.edit17:setLeft(228);
    obj.edit17:setTop(190);
    obj.edit17:setField("ADS3");
    obj.edit17:setWidth(110);
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj);
    obj.edit18:setLeft(380);
    obj.edit18:setTop(190);
    obj.edit18:setField("AB3");
    obj.edit18:setWidth(110);
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj);
    obj.edit19:setLeft(516);
    obj.edit19:setTop(190);
    obj.edit19:setField("ACura3");
    obj.edit19:setWidth(110);
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj);
    obj.edit20:setLeft(658);
    obj.edit20:setTop(190);
    obj.edit20:setField("AD3");
    obj.edit20:setWidth(110);
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj);
    obj.edit21:setLeft(803);
    obj.edit21:setTop(190);
    obj.edit21:setField("AR3");
    obj.edit21:setWidth(80);
    obj.edit21:setName("edit21");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setLeft(912);
    obj.rectangle7:setTop(190);
    obj.rectangle7:setWidth(110);
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setName("rectangle7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj);
    obj.label7:setLeft(915);
    obj.label7:setTop(195);
    obj.label7:setField("ACausado3");
    obj.label7:setWidth(110);
    obj.label7:setName("label7");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setLeft(1055);
    obj.rectangle8:setTop(190);
    obj.rectangle8:setWidth(110);
    obj.rectangle8:setHeight(30);
    obj.rectangle8:setName("rectangle8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj);
    obj.label8:setLeft(1058);
    obj.label8:setTop(195);
    obj.label8:setField("ACritical3");
    obj.label8:setWidth(110);
    obj.label8:setName("label8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setLeft(1201);
    obj.rectangle9:setTop(190);
    obj.rectangle9:setWidth(110);
    obj.rectangle9:setHeight(30);
    obj.rectangle9:setName("rectangle9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj);
    obj.label9:setLeft(1204);
    obj.label9:setTop(195);
    obj.label9:setField("ATotal3");
    obj.label9:setWidth(110);
    obj.label9:setName("label9");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj);
    obj.button9:setLeft(55);
    obj.button9:setTop(163);
    obj.button9:setText("P.A");
    obj.button9:setOpacity(1.0);
    obj.button9:setWidth(37);
    obj.button9:setHeight(25);
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj);
    obj.button10:setLeft(167);
    obj.button10:setTop(163);
    obj.button10:setText("P.M");
    obj.button10:setOpacity(1.0);
    obj.button10:setWidth(37);
    obj.button10:setHeight(25);
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj);
    obj.button11:setLeft(587);
    obj.button11:setTop(163);
    obj.button11:setText("Cura");
    obj.button11:setOpacity(1.0);
    obj.button11:setWidth(38);
    obj.button11:setHeight(25);
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj);
    obj.button12:setLeft(1320);
    obj.button12:setTop(190);
    obj.button12:setText("Limpar");
    obj.button12:setOpacity(1.0);
    obj.button12:setWidth(50);
    obj.button12:setHeight(30);
    obj.button12:setName("button12");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj);
    obj.edit22:setLeft(11);
    obj.edit22:setTop(255);
    obj.edit22:setField("APA4");
    obj.edit22:setWidth(80);
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj);
    obj.edit23:setLeft(119);
    obj.edit23:setTop(255);
    obj.edit23:setField("APM4");
    obj.edit23:setWidth(80);
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj);
    obj.edit24:setLeft(228);
    obj.edit24:setTop(255);
    obj.edit24:setField("ADS4");
    obj.edit24:setWidth(110);
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj);
    obj.edit25:setLeft(380);
    obj.edit25:setTop(255);
    obj.edit25:setField("AB4");
    obj.edit25:setWidth(110);
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj);
    obj.edit26:setLeft(516);
    obj.edit26:setTop(255);
    obj.edit26:setField("ACura4");
    obj.edit26:setWidth(110);
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj);
    obj.edit27:setLeft(658);
    obj.edit27:setTop(255);
    obj.edit27:setField("AD4");
    obj.edit27:setWidth(110);
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj);
    obj.edit28:setLeft(803);
    obj.edit28:setTop(255);
    obj.edit28:setField("AR4");
    obj.edit28:setWidth(80);
    obj.edit28:setName("edit28");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setLeft(912);
    obj.rectangle10:setTop(255);
    obj.rectangle10:setWidth(110);
    obj.rectangle10:setHeight(30);
    obj.rectangle10:setName("rectangle10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj);
    obj.label10:setLeft(915);
    obj.label10:setTop(260);
    obj.label10:setField("ACausado4");
    obj.label10:setWidth(110);
    obj.label10:setName("label10");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setLeft(1055);
    obj.rectangle11:setTop(255);
    obj.rectangle11:setWidth(110);
    obj.rectangle11:setHeight(30);
    obj.rectangle11:setName("rectangle11");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj);
    obj.label11:setLeft(1058);
    obj.label11:setTop(260);
    obj.label11:setField("ACritical4");
    obj.label11:setWidth(110);
    obj.label11:setName("label11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setLeft(1201);
    obj.rectangle12:setTop(255);
    obj.rectangle12:setWidth(110);
    obj.rectangle12:setHeight(30);
    obj.rectangle12:setName("rectangle12");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj);
    obj.label12:setLeft(1204);
    obj.label12:setTop(260);
    obj.label12:setField("ATotal4");
    obj.label12:setWidth(110);
    obj.label12:setName("label12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj);
    obj.button13:setLeft(55);
    obj.button13:setTop(228);
    obj.button13:setText("P.A");
    obj.button13:setOpacity(1.0);
    obj.button13:setWidth(37);
    obj.button13:setHeight(25);
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj);
    obj.button14:setLeft(167);
    obj.button14:setTop(228);
    obj.button14:setText("P.M");
    obj.button14:setOpacity(1.0);
    obj.button14:setWidth(37);
    obj.button14:setHeight(25);
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj);
    obj.button15:setLeft(587);
    obj.button15:setTop(228);
    obj.button15:setText("Cura");
    obj.button15:setOpacity(1.0);
    obj.button15:setWidth(38);
    obj.button15:setHeight(25);
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj);
    obj.button16:setLeft(1320);
    obj.button16:setTop(255);
    obj.button16:setText("Limpar");
    obj.button16:setOpacity(1.0);
    obj.button16:setWidth(50);
    obj.button16:setHeight(30);
    obj.button16:setName("button16");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj);
    obj.edit29:setLeft(11);
    obj.edit29:setTop(365);
    obj.edit29:setField("IPA1");
    obj.edit29:setWidth(80);
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj);
    obj.edit30:setLeft(119);
    obj.edit30:setTop(365);
    obj.edit30:setField("IPM1");
    obj.edit30:setWidth(80);
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj);
    obj.edit31:setLeft(228);
    obj.edit31:setTop(365);
    obj.edit31:setField("IDS1");
    obj.edit31:setWidth(110);
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj);
    obj.edit32:setLeft(380);
    obj.edit32:setTop(365);
    obj.edit32:setField("IB1");
    obj.edit32:setWidth(110);
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj);
    obj.edit33:setLeft(516);
    obj.edit33:setTop(365);
    obj.edit33:setField("ICura1");
    obj.edit33:setWidth(110);
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj);
    obj.edit34:setLeft(658);
    obj.edit34:setTop(365);
    obj.edit34:setField("ID1");
    obj.edit34:setWidth(110);
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj);
    obj.edit35:setLeft(803);
    obj.edit35:setTop(365);
    obj.edit35:setField("IR1");
    obj.edit35:setWidth(80);
    obj.edit35:setName("edit35");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setLeft(912);
    obj.rectangle13:setTop(365);
    obj.rectangle13:setWidth(110);
    obj.rectangle13:setHeight(30);
    obj.rectangle13:setName("rectangle13");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj);
    obj.label13:setLeft(915);
    obj.label13:setTop(370);
    obj.label13:setField("ICausado1");
    obj.label13:setWidth(110);
    obj.label13:setName("label13");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setLeft(1055);
    obj.rectangle14:setTop(365);
    obj.rectangle14:setWidth(110);
    obj.rectangle14:setHeight(30);
    obj.rectangle14:setName("rectangle14");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj);
    obj.label14:setLeft(1058);
    obj.label14:setTop(370);
    obj.label14:setField("ICritical1");
    obj.label14:setWidth(110);
    obj.label14:setName("label14");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setLeft(1201);
    obj.rectangle15:setTop(365);
    obj.rectangle15:setWidth(110);
    obj.rectangle15:setHeight(30);
    obj.rectangle15:setName("rectangle15");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj);
    obj.label15:setLeft(1204);
    obj.label15:setTop(370);
    obj.label15:setField("ITotal1");
    obj.label15:setWidth(110);
    obj.label15:setName("label15");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj);
    obj.button17:setLeft(55);
    obj.button17:setTop(338);
    obj.button17:setText("P.A");
    obj.button17:setOpacity(1.0);
    obj.button17:setWidth(37);
    obj.button17:setHeight(25);
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj);
    obj.button18:setLeft(167);
    obj.button18:setTop(338);
    obj.button18:setText("P.M");
    obj.button18:setOpacity(1.0);
    obj.button18:setWidth(37);
    obj.button18:setHeight(25);
    obj.button18:setName("button18");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj);
    obj.button19:setLeft(587);
    obj.button19:setTop(338);
    obj.button19:setText("Cura");
    obj.button19:setOpacity(1.0);
    obj.button19:setWidth(38);
    obj.button19:setHeight(25);
    obj.button19:setName("button19");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj);
    obj.button20:setLeft(1320);
    obj.button20:setTop(365);
    obj.button20:setText("Limpar");
    obj.button20:setOpacity(1.0);
    obj.button20:setWidth(50);
    obj.button20:setHeight(30);
    obj.button20:setName("button20");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj);
    obj.edit36:setLeft(11);
    obj.edit36:setTop(430);
    obj.edit36:setField("IPA2");
    obj.edit36:setWidth(80);
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj);
    obj.edit37:setLeft(119);
    obj.edit37:setTop(430);
    obj.edit37:setField("IPM2");
    obj.edit37:setWidth(80);
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj);
    obj.edit38:setLeft(228);
    obj.edit38:setTop(430);
    obj.edit38:setField("IDS2");
    obj.edit38:setWidth(110);
    obj.edit38:setName("edit38");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj);
    obj.edit39:setLeft(380);
    obj.edit39:setTop(430);
    obj.edit39:setField("IB2");
    obj.edit39:setWidth(110);
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj);
    obj.edit40:setLeft(516);
    obj.edit40:setTop(430);
    obj.edit40:setField("ICura2");
    obj.edit40:setWidth(110);
    obj.edit40:setName("edit40");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj);
    obj.edit41:setLeft(658);
    obj.edit41:setTop(430);
    obj.edit41:setField("ID2");
    obj.edit41:setWidth(110);
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj);
    obj.edit42:setLeft(803);
    obj.edit42:setTop(430);
    obj.edit42:setField("IR2");
    obj.edit42:setWidth(80);
    obj.edit42:setName("edit42");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setLeft(912);
    obj.rectangle16:setTop(430);
    obj.rectangle16:setWidth(110);
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setName("rectangle16");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj);
    obj.label16:setLeft(915);
    obj.label16:setTop(435);
    obj.label16:setField("ICausado2");
    obj.label16:setWidth(110);
    obj.label16:setName("label16");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setLeft(1055);
    obj.rectangle17:setTop(430);
    obj.rectangle17:setWidth(110);
    obj.rectangle17:setHeight(30);
    obj.rectangle17:setName("rectangle17");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj);
    obj.label17:setLeft(1058);
    obj.label17:setTop(435);
    obj.label17:setField("ICritical2");
    obj.label17:setWidth(110);
    obj.label17:setName("label17");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setLeft(1201);
    obj.rectangle18:setTop(430);
    obj.rectangle18:setWidth(110);
    obj.rectangle18:setHeight(30);
    obj.rectangle18:setName("rectangle18");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj);
    obj.label18:setLeft(1204);
    obj.label18:setTop(435);
    obj.label18:setField("ITotal2");
    obj.label18:setWidth(110);
    obj.label18:setName("label18");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj);
    obj.button21:setLeft(55);
    obj.button21:setTop(403);
    obj.button21:setText("P.A");
    obj.button21:setOpacity(1.0);
    obj.button21:setWidth(37);
    obj.button21:setHeight(25);
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj);
    obj.button22:setLeft(167);
    obj.button22:setTop(403);
    obj.button22:setText("P.M");
    obj.button22:setOpacity(1.0);
    obj.button22:setWidth(37);
    obj.button22:setHeight(25);
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj);
    obj.button23:setLeft(587);
    obj.button23:setTop(403);
    obj.button23:setText("Cura");
    obj.button23:setOpacity(1.0);
    obj.button23:setWidth(38);
    obj.button23:setHeight(25);
    obj.button23:setName("button23");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj);
    obj.button24:setLeft(1320);
    obj.button24:setTop(430);
    obj.button24:setText("Limpar");
    obj.button24:setOpacity(1.0);
    obj.button24:setWidth(50);
    obj.button24:setHeight(30);
    obj.button24:setName("button24");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj);
    obj.edit43:setLeft(11);
    obj.edit43:setTop(495);
    obj.edit43:setField("IPA3");
    obj.edit43:setWidth(80);
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj);
    obj.edit44:setLeft(119);
    obj.edit44:setTop(495);
    obj.edit44:setField("IPM3");
    obj.edit44:setWidth(80);
    obj.edit44:setName("edit44");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj);
    obj.edit45:setLeft(228);
    obj.edit45:setTop(495);
    obj.edit45:setField("IDS3");
    obj.edit45:setWidth(110);
    obj.edit45:setName("edit45");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj);
    obj.edit46:setLeft(380);
    obj.edit46:setTop(495);
    obj.edit46:setField("IB3");
    obj.edit46:setWidth(110);
    obj.edit46:setName("edit46");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj);
    obj.edit47:setLeft(516);
    obj.edit47:setTop(495);
    obj.edit47:setField("ICura3");
    obj.edit47:setWidth(110);
    obj.edit47:setName("edit47");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj);
    obj.edit48:setLeft(658);
    obj.edit48:setTop(495);
    obj.edit48:setField("ID3");
    obj.edit48:setWidth(110);
    obj.edit48:setName("edit48");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj);
    obj.edit49:setLeft(803);
    obj.edit49:setTop(495);
    obj.edit49:setField("IR3");
    obj.edit49:setWidth(80);
    obj.edit49:setName("edit49");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setLeft(912);
    obj.rectangle19:setTop(495);
    obj.rectangle19:setWidth(110);
    obj.rectangle19:setHeight(30);
    obj.rectangle19:setName("rectangle19");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj);
    obj.label19:setLeft(915);
    obj.label19:setTop(500);
    obj.label19:setField("ICausado3");
    obj.label19:setWidth(110);
    obj.label19:setName("label19");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setLeft(1055);
    obj.rectangle20:setTop(495);
    obj.rectangle20:setWidth(110);
    obj.rectangle20:setHeight(30);
    obj.rectangle20:setName("rectangle20");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj);
    obj.label20:setLeft(1058);
    obj.label20:setTop(500);
    obj.label20:setField("ICritical3");
    obj.label20:setWidth(110);
    obj.label20:setName("label20");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setLeft(1201);
    obj.rectangle21:setTop(495);
    obj.rectangle21:setWidth(110);
    obj.rectangle21:setHeight(30);
    obj.rectangle21:setName("rectangle21");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj);
    obj.label21:setLeft(1204);
    obj.label21:setTop(500);
    obj.label21:setField("ITotal3");
    obj.label21:setWidth(110);
    obj.label21:setName("label21");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj);
    obj.button25:setLeft(55);
    obj.button25:setTop(468);
    obj.button25:setText("P.A");
    obj.button25:setOpacity(1.0);
    obj.button25:setWidth(37);
    obj.button25:setHeight(25);
    obj.button25:setName("button25");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj);
    obj.button26:setLeft(167);
    obj.button26:setTop(468);
    obj.button26:setText("P.M");
    obj.button26:setOpacity(1.0);
    obj.button26:setWidth(37);
    obj.button26:setHeight(25);
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj);
    obj.button27:setLeft(587);
    obj.button27:setTop(468);
    obj.button27:setText("Cura");
    obj.button27:setOpacity(1.0);
    obj.button27:setWidth(38);
    obj.button27:setHeight(25);
    obj.button27:setName("button27");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj);
    obj.button28:setLeft(1320);
    obj.button28:setTop(495);
    obj.button28:setText("Limpar");
    obj.button28:setOpacity(1.0);
    obj.button28:setWidth(50);
    obj.button28:setHeight(30);
    obj.button28:setName("button28");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj);
    obj.edit50:setLeft(11);
    obj.edit50:setTop(560);
    obj.edit50:setField("IPA4");
    obj.edit50:setWidth(80);
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj);
    obj.edit51:setLeft(119);
    obj.edit51:setTop(560);
    obj.edit51:setField("IPM4");
    obj.edit51:setWidth(80);
    obj.edit51:setName("edit51");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj);
    obj.edit52:setLeft(228);
    obj.edit52:setTop(560);
    obj.edit52:setField("IDS4");
    obj.edit52:setWidth(110);
    obj.edit52:setName("edit52");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj);
    obj.edit53:setLeft(380);
    obj.edit53:setTop(560);
    obj.edit53:setField("IB4");
    obj.edit53:setWidth(110);
    obj.edit53:setName("edit53");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj);
    obj.edit54:setLeft(516);
    obj.edit54:setTop(560);
    obj.edit54:setField("ICura4");
    obj.edit54:setWidth(110);
    obj.edit54:setName("edit54");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj);
    obj.edit55:setLeft(658);
    obj.edit55:setTop(560);
    obj.edit55:setField("ID4");
    obj.edit55:setWidth(110);
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj);
    obj.edit56:setLeft(803);
    obj.edit56:setTop(560);
    obj.edit56:setField("IR4");
    obj.edit56:setWidth(80);
    obj.edit56:setName("edit56");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setLeft(912);
    obj.rectangle22:setTop(560);
    obj.rectangle22:setWidth(110);
    obj.rectangle22:setHeight(30);
    obj.rectangle22:setName("rectangle22");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj);
    obj.label22:setLeft(915);
    obj.label22:setTop(565);
    obj.label22:setField("ICausado4");
    obj.label22:setWidth(110);
    obj.label22:setName("label22");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setLeft(1055);
    obj.rectangle23:setTop(560);
    obj.rectangle23:setWidth(110);
    obj.rectangle23:setHeight(30);
    obj.rectangle23:setName("rectangle23");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj);
    obj.label23:setLeft(1058);
    obj.label23:setTop(565);
    obj.label23:setField("ICritical4");
    obj.label23:setWidth(110);
    obj.label23:setName("label23");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setLeft(1201);
    obj.rectangle24:setTop(560);
    obj.rectangle24:setWidth(110);
    obj.rectangle24:setHeight(30);
    obj.rectangle24:setName("rectangle24");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj);
    obj.label24:setLeft(1204);
    obj.label24:setTop(565);
    obj.label24:setField("ITotal4");
    obj.label24:setWidth(110);
    obj.label24:setName("label24");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj);
    obj.button29:setLeft(55);
    obj.button29:setTop(530);
    obj.button29:setText("P.A");
    obj.button29:setOpacity(1.0);
    obj.button29:setWidth(37);
    obj.button29:setHeight(25);
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj);
    obj.button30:setLeft(167);
    obj.button30:setTop(530);
    obj.button30:setText("P.M");
    obj.button30:setOpacity(1.0);
    obj.button30:setWidth(37);
    obj.button30:setHeight(25);
    obj.button30:setName("button30");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj);
    obj.button31:setLeft(587);
    obj.button31:setTop(530);
    obj.button31:setText("Cura");
    obj.button31:setOpacity(1.0);
    obj.button31:setWidth(38);
    obj.button31:setHeight(25);
    obj.button31:setName("button31");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj);
    obj.button32:setLeft(1320);
    obj.button32:setTop(560);
    obj.button32:setText("Limpar");
    obj.button32:setOpacity(1.0);
    obj.button32:setWidth(50);
    obj.button32:setHeight(30);
    obj.button32:setName("button32");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setLeft(247);
    obj.rectangle25:setTop(655);
    obj.rectangle25:setWidth(150);
    obj.rectangle25:setHeight(30);
    obj.rectangle25:setName("rectangle25");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj);
    obj.label25:setLeft(250);
    obj.label25:setTop(655);
    obj.label25:setField("HPBoss");
    obj.label25:setHeight(30);
    obj.label25:setWidth(150);
    obj.label25:setName("label25");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setLeft(875);
    obj.rectangle26:setTop(655);
    obj.rectangle26:setWidth(150);
    obj.rectangle26:setHeight(30);
    obj.rectangle26:setName("rectangle26");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj);
    obj.label26:setLeft(878);
    obj.label26:setTop(655);
    obj.label26:setField("HPAliado");
    obj.label26:setHeight(30);
    obj.label26:setWidth(150);
    obj.label26:setName("label26");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj);
    obj.button33:setLeft(246);
    obj.button33:setTop(690);
    obj.button33:setText("DANO");
    obj.button33:setOpacity(1.0);
    obj.button33:setWidth(70);
    obj.button33:setHeight(30);
    obj.button33:setName("button33");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj);
    obj.button34:setLeft(325);
    obj.button34:setTop(690);
    obj.button34:setText("Limpar");
    obj.button34:setOpacity(1.0);
    obj.button34:setWidth(70);
    obj.button34:setHeight(30);
    obj.button34:setName("button34");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj);
    obj.button35:setLeft(874);
    obj.button35:setTop(690);
    obj.button35:setText("DANO");
    obj.button35:setOpacity(1.0);
    obj.button35:setWidth(70);
    obj.button35:setHeight(30);
    obj.button35:setName("button35");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj);
    obj.button36:setLeft(955);
    obj.button36:setTop(690);
    obj.button36:setText("Limpar");
    obj.button36:setOpacity(1.0);
    obj.button36:setWidth(70);
    obj.button36:setHeight(30);
    obj.button36:setName("button36");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            sheet.ACausado1 = (tonumber(sheet.APA1) or 0) + (tonumber(sheet.AB1) or 0) + (tonumber(sheet.ADS1) or 0) - (tonumber(sheet.AD1) or 0);
            					   sheet.ACritical1 = (tonumber(sheet.ACausado1) or 0) *2 ;
            					   sheet.ATotal1 = (tonumber(sheet.ACausado1) or 0) + (tonumber(sheet.AT1) or 0) ;
            					   sheet.AT1 = (tonumber(sheet.ATotal1) or 0)
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            sheet.ACausado1 = (tonumber(sheet.APM1) or 0) + (tonumber(sheet.AB1) or 0) + (tonumber(sheet.ADS1) or 0) - (tonumber(sheet.AR1) or 0);
            					   sheet.ACritical1 = (tonumber(sheet.ACausado1) or 0) *2 ;
            					   sheet.ATotal1 = (tonumber(sheet.ACausado1) or 0) + (tonumber(sheet.AT1) or 0) ;
            					   sheet.AT1 = (tonumber(sheet.ATotal1) or 0)
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            sheet.AT1 = (tonumber(sheet.AT1) or 0) - (tonumber(sheet.ACura1) or 0);
            						sheet.ATotal1 = (tonumber(sheet.AT1) or 0)
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            sheet.AT1 = 0
            						sheet.APA1 = 0;
            						sheet.APM1 = 0;
            						sheet.ADS1 = 0;
            						sheet.AB1 = 0;
            						sheet.AD1 = 0;
            						sheet.AR1 = 0;
            						sheet.ACura1 = 0;
            						sheet.ACritical1 = 0;
            						sheet.ACausado1 = 0;
            						sheet.ATotal1 = 0
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            sheet.ACausado2 = (tonumber(sheet.APA2) or 0) + (tonumber(sheet.AB2) or 0) + (tonumber(sheet.ADS2) or 0) - (tonumber(sheet.AD2) or 0);
            					   sheet.ACritical2 = (tonumber(sheet.ACausado2) or 0) *2 ;
            					   sheet.ATotal2 = (tonumber(sheet.ACausado2) or 0) + (tonumber(sheet.AT2) or 0) ;
            					   sheet.AT2 = (tonumber(sheet.ATotal2) or 0)
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            sheet.ACausado2 = (tonumber(sheet.APM2) or 0) + (tonumber(sheet.AB2) or 0) + (tonumber(sheet.ADS2) or 0) - (tonumber(sheet.AR2) or 0);
            					   sheet.ACritical2 = (tonumber(sheet.ACausado2) or 0) *2 ;
            					   sheet.ATotal2 = (tonumber(sheet.ACausado2) or 0) + (tonumber(sheet.AT2) or 0) ;
            					   sheet.AT2 = (tonumber(sheet.ATotal2) or 0)
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            sheet.AT2 = (tonumber(sheet.AT2) or 0) - (tonumber(sheet.ACura2) or 0);
            						sheet.ATotal2 = (tonumber(sheet.AT2) or 0)
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            sheet.AT2 = 0
            						sheet.APA2 = 0;
            						sheet.APM2 = 0;
            						sheet.ADS2 = 0;
            						sheet.AB2 = 0;
            						sheet.AD2 = 0;
            						sheet.AR2 = 0;
            						sheet.ACura2 = 0;
            						sheet.ACritical2 = 0;
            						sheet.ACausado2 = 0;
            						sheet.ATotal2 = 0
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            sheet.ACausado3 = (tonumber(sheet.APA3) or 0) + (tonumber(sheet.AB3) or 0) + (tonumber(sheet.ADS3) or 0) - (tonumber(sheet.AD3) or 0);
            					   sheet.ACritical3 = (tonumber(sheet.ACausado3) or 0) *2 ;
            					   sheet.ATotal3 = (tonumber(sheet.ACausado3) or 0) + (tonumber(sheet.AT3) or 0) ;
            					   sheet.AT3 = (tonumber(sheet.ATotal3) or 0)
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            sheet.ACausado3 = (tonumber(sheet.APM3) or 0) + (tonumber(sheet.AB3) or 0) + (tonumber(sheet.ADS3) or 0) - (tonumber(sheet.AR3) or 0);
            					   sheet.ACritical3 = (tonumber(sheet.ACausado3) or 0) *2 ;
            					   sheet.ATotal3 = (tonumber(sheet.ACausado3) or 0) + (tonumber(sheet.AT3) or 0) ;
            					   sheet.AT3 = (tonumber(sheet.ATotal3) or 0)
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            sheet.AT3 = (tonumber(sheet.AT3) or 0) - (tonumber(sheet.ACura3) or 0);
            						sheet.ATotal3 = (tonumber(sheet.AT3) or 0)
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            sheet.AT3 = 0
            						sheet.APA3 = 0;
            						sheet.APM3 = 0;
            						sheet.ADS3 = 0;
            						sheet.AB3 = 0;
            						sheet.AD3 = 0;
            						sheet.AR3 = 0;
            						sheet.ACura3 = 0;
            						sheet.ACritical3 = 0;
            						sheet.ACausado3 = 0;
            						sheet.ATotal3 = 0
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (_)
            sheet.ACausado4 = (tonumber(sheet.APA4) or 0) + (tonumber(sheet.AB4) or 0) + (tonumber(sheet.ADS4) or 0) - (tonumber(sheet.AD4) or 0);
            					   sheet.ACritical4 = (tonumber(sheet.ACausado4) or 0) *2 ;
            					   sheet.ATotal4 = (tonumber(sheet.ACausado4) or 0) + (tonumber(sheet.AT4) or 0) ;
            					   sheet.AT4 = (tonumber(sheet.ATotal4) or 0)
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (_)
            sheet.ACausado4 = (tonumber(sheet.APM4) or 0) + (tonumber(sheet.AB4) or 0) + (tonumber(sheet.ADS4) or 0) - (tonumber(sheet.AR4) or 0);
            					   sheet.ACritical4 = (tonumber(sheet.ACausado4) or 0) *2 ;
            					   sheet.ATotal4 = (tonumber(sheet.ACausado4) or 0) + (tonumber(sheet.AT4) or 0) ;
            					   sheet.AT4 = (tonumber(sheet.ATotal4) or 0)
        end, obj);

    obj._e_event14 = obj.button15:addEventListener("onClick",
        function (_)
            sheet.AT4 = (tonumber(sheet.AT4) or 0) - (tonumber(sheet.ACura4) or 0);
            						sheet.ATotal4 = (tonumber(sheet.AT4) or 0)
        end, obj);

    obj._e_event15 = obj.button16:addEventListener("onClick",
        function (_)
            sheet.AT4 = 0
            						sheet.APA4 = 0;
            						sheet.APM4 = 0;
            						sheet.ADS4 = 0;
            						sheet.AB4 = 0;
            						sheet.AD4 = 0;
            						sheet.AR4 = 0;
            						sheet.ACura4 = 0;
            						sheet.ACritical4 = 0;
            						sheet.ACausado4 = 0;
            						sheet.ATotal4 = 0
        end, obj);

    obj._e_event16 = obj.button17:addEventListener("onClick",
        function (_)
            sheet.ICausado1 = (tonumber(sheet.IPA1) or 0) + (tonumber(sheet.IB1) or 0) + (tonumber(sheet.IDS1) or 0) - (tonumber(sheet.ID1) or 0);
            					   sheet.ICritical1 = (tonumber(sheet.ICausado1) or 0) *2 ;
            					   sheet.ITotal1 = (tonumber(sheet.ICausado1) or 0) + (tonumber(sheet.IT1) or 0) ;
            					   sheet.IT1 = (tonumber(sheet.ITotal1) or 0)
        end, obj);

    obj._e_event17 = obj.button18:addEventListener("onClick",
        function (_)
            sheet.ICausado1 = (tonumber(sheet.IPM1) or 0) + (tonumber(sheet.IB1) or 0) + (tonumber(sheet.IDS1) or 0) - (tonumber(sheet.IR1) or 0);
            					   sheet.ICritical1 = (tonumber(sheet.ICausado1) or 0) *2 ;
            					   sheet.ITotal1 = (tonumber(sheet.ICausado1) or 0) + (tonumber(sheet.IT1) or 0) ;
            					   sheet.IT1 = (tonumber(sheet.ITotal1) or 0)
        end, obj);

    obj._e_event18 = obj.button19:addEventListener("onClick",
        function (_)
            sheet.IT1 = (tonumber(sheet.IT1) or 0) - (tonumber(sheet.ICura1) or 0);
            						sheet.ITotal1 = (tonumber(sheet.IT1) or 0)
        end, obj);

    obj._e_event19 = obj.button20:addEventListener("onClick",
        function (_)
            sheet.IT1 = 0
            						sheet.IPA1 = 0;
            						sheet.IPM1 = 0;
            						sheet.IDS1 = 0;
            						sheet.IB1 = 0;
            						sheet.ID1 = 0;
            						sheet.IR1 = 0;
            						sheet.ICura1 = 0;
            						sheet.ICritical1 = 0;
            						sheet.ICausado1 = 0;
            						sheet.ITotal1 = 0
        end, obj);

    obj._e_event20 = obj.button21:addEventListener("onClick",
        function (_)
            sheet.ICausado2 = (tonumber(sheet.IPA2) or 0) + (tonumber(sheet.IB2) or 0) + (tonumber(sheet.IDS2) or 0) - (tonumber(sheet.ID2) or 0);
            					   sheet.ICritical2 = (tonumber(sheet.ICausado2) or 0) *2 ;
            					   sheet.ITotal2 = (tonumber(sheet.ICausado2) or 0) + (tonumber(sheet.IT2) or 0) ;
            					   sheet.IT2 = (tonumber(sheet.ITotal2) or 0)
        end, obj);

    obj._e_event21 = obj.button22:addEventListener("onClick",
        function (_)
            sheet.ICausado2 = (tonumber(sheet.IPM2) or 0) + (tonumber(sheet.IB2) or 0) + (tonumber(sheet.IDS2) or 0) - (tonumber(sheet.IR2) or 0);
            					   sheet.ICritical2 = (tonumber(sheet.ICausado2) or 0) *2 ;
            					   sheet.ITotal2 = (tonumber(sheet.ICausado2) or 0) + (tonumber(sheet.IT2) or 0) ;
            					   sheet.IT2 = (tonumber(sheet.ITotal2) or 0)
        end, obj);

    obj._e_event22 = obj.button23:addEventListener("onClick",
        function (_)
            sheet.IT2 = (tonumber(sheet.IT2) or 0) - (tonumber(sheet.ICura2) or 0);
            						sheet.ITotal2 = (tonumber(sheet.IT2) or 0)
        end, obj);

    obj._e_event23 = obj.button24:addEventListener("onClick",
        function (_)
            sheet.IT2 = 0
            						sheet.IPA2 = 0;
            						sheet.IPM2 = 0;
            						sheet.IDS2 = 0;
            						sheet.IB2 = 0;
            						sheet.ID2 = 0;
            						sheet.IR2 = 0;
            						sheet.ICura2 = 0;
            						sheet.ICritical2 = 0;
            						sheet.ICausado2 = 0;
            						sheet.ITotal2 = 0
        end, obj);

    obj._e_event24 = obj.button25:addEventListener("onClick",
        function (_)
            sheet.ICausado3 = (tonumber(sheet.IPA3) or 0) + (tonumber(sheet.IB3) or 0) + (tonumber(sheet.IDS3) or 0) - (tonumber(sheet.ID3) or 0);
            					   sheet.ICritical3 = (tonumber(sheet.ICausado3) or 0) *2 ;
            					   sheet.ITotal3 = (tonumber(sheet.ICausado3) or 0) + (tonumber(sheet.IT3) or 0) ;
            					   sheet.IT3 = (tonumber(sheet.ITotal3) or 0)
        end, obj);

    obj._e_event25 = obj.button26:addEventListener("onClick",
        function (_)
            sheet.ICausado3 = (tonumber(sheet.IPM3) or 0) + (tonumber(sheet.IB3) or 0) + (tonumber(sheet.IDS3) or 0) - (tonumber(sheet.IR3) or 0);
            					   sheet.ICritical3 = (tonumber(sheet.ICausado3) or 0) *2 ;
            					   sheet.ITotal3 = (tonumber(sheet.ICausado3) or 0) + (tonumber(sheet.IT3) or 0) ;
            					   sheet.IT3 = (tonumber(sheet.ITotal3) or 0)
        end, obj);

    obj._e_event26 = obj.button27:addEventListener("onClick",
        function (_)
            sheet.IT3 = (tonumber(sheet.IT3) or 0) - (tonumber(sheet.ICura3) or 0);
            						sheet.ITotal3 = (tonumber(sheet.IT3) or 0)
        end, obj);

    obj._e_event27 = obj.button28:addEventListener("onClick",
        function (_)
            sheet.IT3 = 0
            						sheet.IPA3 = 0;
            						sheet.IPM3 = 0;
            						sheet.IDS3 = 0;
            						sheet.IB3 = 0;
            						sheet.ID3 = 0;
            						sheet.IR3 = 0;
            						sheet.ICura3 = 0;
            						sheet.ICritical3 = 0;
            						sheet.ICausado3 = 0;
            						sheet.ITotal3 = 0
        end, obj);

    obj._e_event28 = obj.button29:addEventListener("onClick",
        function (_)
            sheet.ICausado4 = (tonumber(sheet.IPA4) or 0) + (tonumber(sheet.IB4) or 0) + (tonumber(sheet.IDS4) or 0) - (tonumber(sheet.ID4) or 0);
            					   sheet.ICritical4 = (tonumber(sheet.ICausado4) or 0) *2 ;
            					   sheet.ITotal4 = (tonumber(sheet.ICausado4) or 0) + (tonumber(sheet.IT4) or 0) ;
            					   sheet.IT4 = (tonumber(sheet.ITotal4) or 0)
        end, obj);

    obj._e_event29 = obj.button30:addEventListener("onClick",
        function (_)
            sheet.ICausado4 = (tonumber(sheet.IPM4) or 0) + (tonumber(sheet.IB4) or 0) + (tonumber(sheet.IDS4) or 0) - (tonumber(sheet.IR4) or 0);
            					   sheet.ICritical4 = (tonumber(sheet.ICausado4) or 0) *2 ;
            					   sheet.ITotal4 = (tonumber(sheet.ICausado4) or 0) + (tonumber(sheet.IT4) or 0) ;
            					   sheet.IT4 = (tonumber(sheet.ITotal4) or 0)
        end, obj);

    obj._e_event30 = obj.button31:addEventListener("onClick",
        function (_)
            sheet.IT4 = (tonumber(sheet.IT4) or 0) - (tonumber(sheet.ICura4) or 0);
            						sheet.ITotal4 = (tonumber(sheet.IT4) or 0)
        end, obj);

    obj._e_event31 = obj.button32:addEventListener("onClick",
        function (_)
            sheet.IT4 = 0
            						sheet.IPA4 = 0;
            						sheet.IPM4 = 0;
            						sheet.IDS4 = 0;
            						sheet.IB4 = 0;
            						sheet.ID4 = 0;
            						sheet.IR4 = 0;
            						sheet.ICura4 = 0;
            						sheet.ICritical4 = 0;
            						sheet.ICausado4 = 0;
            						sheet.ITotal4 = 0
        end, obj);

    obj._e_event32 = obj.button33:addEventListener("onClick",
        function (_)
            sheet.HPBoss = (tonumber(sheet.AT1) or 0) + (tonumber(sheet.AT2) or 0) + (tonumber(sheet.AT3) or 0) + (tonumber(sheet.AT4) or 0);
        end, obj);

    obj._e_event33 = obj.button34:addEventListener("onClick",
        function (_)
            sheet.HPBoss = 0;
            						sheet.AT1 = 0;
            						sheet.AT2 = 0;
            						sheet.AT3 = 0;
            						sheet.AT4 = 0
        end, obj);

    obj._e_event34 = obj.button35:addEventListener("onClick",
        function (_)
            sheet.HPAliado = (tonumber(sheet.IT1) or 0) + (tonumber(sheet.IT2) or 0) + (tonumber(sheet.IT3) or 0) + (tonumber(sheet.IT4) or 0);
        end, obj);

    obj._e_event35 = obj.button36:addEventListener("onClick",
        function (_)
            sheet.HPAliado = 0;
            						sheet.IT1 = 0;
            						sheet.IT2 = 0;
            						sheet.IT3 = 0;
            						sheet.IT4 = 0
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
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

        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
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
    dataType = "Sistema_de_Combate_Velen", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Sistema de Combate Velen", 
    description=""};

frmscv = _frmscv;
Firecast.registrarForm(_frmscv);
Firecast.registrarDataType(_frmscv);

return _frmscv;
