require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmvelen()
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
    obj:setDataType("com.velen");
    obj:setTitle("Velen 4");
    obj:setName("frmvelen");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setLeft(5);
    obj.image1:setTop(5);
    obj.image1:setWidth(620);
    obj.image1:setHeight(920);
    obj.image1:setSRC("/imagens/1.png");
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(160);
    obj.edit1:setTop(60);
    obj.edit1:setWidth(75);
    obj.edit1:setHeight(20);
    obj.edit1:setField("Nome");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(160);
    obj.edit2:setTop(92);
    obj.edit2:setWidth(75);
    obj.edit2:setHeight(20);
    obj.edit2:setField("idade");
    obj.edit2:setName("edit2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setLeft(305);
    obj.comboBox1:setTop(60);
    obj.comboBox1:setWidth(135);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setField("Classe");
    obj.comboBox1:setItems({'Escolha', 'Animago', 'Arqueiro', 'Bardo', 'Bispo', 'Caçador de Almas', 'Guerreiro', 
			'Ladino', 'Mago', 'Mercenario', 'Monge', 'Paladino', 'Cavaleiro Draconico', });
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj);
    obj.comboBox2:setLeft(305);
    obj.comboBox2:setTop(92);
    obj.comboBox2:setWidth(135);
    obj.comboBox2:setHeight(20);
    obj.comboBox2:setField("Espec");
    obj.comboBox2:setItems({'Sem Espec', 'Druida', 'Shaman', 'Caçador', 'Sentinela Lunar', 'Encantador de Almas', 
			'Necromance', 'Sacerdote', 'Juiz', 'Barbaro', 'Tanker', 'Acrobata', 'Assassino', 'Arcanista', 'Feiticeiro', 'Summoner', 'Duelista', 'Pirata', 'Guardião Espiritual', 
			'Cavaleiro das Trevas', 'Templario' });
    obj.comboBox2:setName("comboBox2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(490);
    obj.edit3:setTop(60);
    obj.edit3:setWidth(40);
    obj.edit3:setHeight(20);
    obj.edit3:setField("Velis");
    obj.edit3:setName("edit3");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj);
    obj.comboBox3:setLeft(490);
    obj.comboBox3:setTop(92);
    obj.comboBox3:setWidth(75);
    obj.comboBox3:setField("Raca");
    obj.comboBox3:setItems({'Escolha', 'Humano', 'Elfo', 'Elfo Negro', 'Anão', 'Orc', 'Kamael', 'Thiefling' });
    obj.comboBox3:setName("comboBox3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setLeft(170);
    obj.edit4:setTop(265);
    obj.edit4:setWidth(75);
    obj.edit4:setHeight(20);
    obj.edit4:setField("Força");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setLeft(170);
    obj.edit5:setTop(327);
    obj.edit5:setWidth(75);
    obj.edit5:setHeight(20);
    obj.edit5:setField("Inteligencia");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setLeft(170);
    obj.edit6:setTop(388);
    obj.edit6:setWidth(75);
    obj.edit6:setHeight(20);
    obj.edit6:setField("Destreza");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj);
    obj.edit7:setLeft(170);
    obj.edit7:setTop(449);
    obj.edit7:setWidth(75);
    obj.edit7:setHeight(20);
    obj.edit7:setField("Agilidade");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj);
    obj.edit8:setLeft(170);
    obj.edit8:setTop(510);
    obj.edit8:setWidth(75);
    obj.edit8:setHeight(20);
    obj.edit8:setField("Vitalidade");
    obj.edit8:setName("edit8");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(480);
    obj.rectangle1:setTop(265);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setWidth(100);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(482);
    obj.label1:setTop(265);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setField("P.A");
    obj.label1:setName("label1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setLeft(480);
    obj.rectangle2:setTop(327);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setWidth(100);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(482);
    obj.label2:setTop(327);
    obj.label2:setWidth(100);
    obj.label2:setHeight(20);
    obj.label2:setField("P.M");
    obj.label2:setName("label2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj);
    obj.rectangle3:setLeft(480);
    obj.rectangle3:setTop(388);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setWidth(100);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(482);
    obj.label3:setTop(388);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setField("P.F");
    obj.label3:setName("label3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj);
    obj.rectangle4:setLeft(480);
    obj.rectangle4:setTop(449);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setWidth(100);
    obj.rectangle4:setHeight(20);
    obj.rectangle4:setName("rectangle4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(482);
    obj.label4:setTop(449);
    obj.label4:setWidth(100);
    obj.label4:setHeight(20);
    obj.label4:setField("Defesa");
    obj.label4:setName("label4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj);
    obj.rectangle5:setLeft(480);
    obj.rectangle5:setTop(510);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setWidth(100);
    obj.rectangle5:setHeight(20);
    obj.rectangle5:setName("rectangle5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setLeft(482);
    obj.label5:setTop(510);
    obj.label5:setWidth(100);
    obj.label5:setHeight(20);
    obj.label5:setField("Resistencia");
    obj.label5:setName("label5");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj);
    obj.rectangle6:setLeft(148);
    obj.rectangle6:setTop(603);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setWidth(80);
    obj.rectangle6:setHeight(30);
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setLeft(150);
    obj.label6:setFontSize(20);
    obj.label6:setTop(603);
    obj.label6:setWidth(80);
    obj.label6:setFontColor("red");
    obj.label6:setHeight(30);
    obj.label6:setField("HPTotal");
    obj.label6:setName("label6");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj);
    obj.rectangle7:setLeft(148);
    obj.rectangle7:setTop(640);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setWidth(80);
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setName("rectangle7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj);
    obj.label7:setLeft(150);
    obj.label7:setFontSize(20);
    obj.label7:setTop(640);
    obj.label7:setWidth(80);
    obj.label7:setFontColor("blue");
    obj.label7:setHeight(30);
    obj.label7:setField("MPTotal");
    obj.label7:setName("label7");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj);
    obj.edit9:setLeft(170);
    obj.edit9:setTop(702);
    obj.edit9:setWidth(75);
    obj.edit9:setHeight(20);
    obj.edit9:setField("Esquiva");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj);
    obj.edit10:setLeft(170);
    obj.edit10:setTop(732);
    obj.edit10:setWidth(75);
    obj.edit10:setHeight(20);
    obj.edit10:setField("Persistencia");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj);
    obj.edit11:setLeft(500);
    obj.edit11:setTop(610);
    obj.edit11:setWidth(75);
    obj.edit11:setHeight(20);
    obj.edit11:setField("Acerto");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj);
    obj.edit12:setLeft(500);
    obj.edit12:setTop(640);
    obj.edit12:setWidth(75);
    obj.edit12:setHeight(20);
    obj.edit12:setField("A.Magico");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj);
    obj.edit13:setLeft(500);
    obj.edit13:setTop(702);
    obj.edit13:setWidth(75);
    obj.edit13:setHeight(20);
    obj.edit13:setField("Critical");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj);
    obj.edit14:setLeft(500);
    obj.edit14:setTop(732);
    obj.edit14:setWidth(75);
    obj.edit14:setHeight(20);
    obj.edit14:setField("C.Magico");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj);
    obj.edit15:setLeft(295);
    obj.edit15:setTop(807);
    obj.edit15:setFontColor("#00008B");
    obj.edit15:setScale(2.0);
    obj.edit15:setWidth(21);
    obj.edit15:setHeight(50);
    obj.edit15:setType("number");
    obj.edit15:setMax(30);
    obj.edit15:setField("level");
    obj.edit15:setTransparent(true);
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj);
    obj.edit16:setLeft(295);
    obj.edit16:setTop(700);
    obj.edit16:setFontColor("#00008B");
    obj.edit16:setScale(2.0);
    obj.edit16:setWidth(21);
    obj.edit16:setVisible(false);
    obj.edit16:setHeight(50);
    obj.edit16:setField("Elevel");
    obj.edit16:setTransparent(true);
    obj.edit16:setName("edit16");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(33);
    obj.button1:setTop(160);
    obj.button1:setWidth(60);
    obj.button1:setHeight(60);
    obj.button1:setOpacity(0.1);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(120);
    obj.button2:setTop(160);
    obj.button2:setWidth(60);
    obj.button2:setHeight(60);
    obj.button2:setOpacity(0.1);
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setLeft(460);
    obj.button3:setTop(160);
    obj.button3:setWidth(60);
    obj.button3:setHeight(60);
    obj.button3:setOpacity(0.1);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj);
    obj.button4:setLeft(287);
    obj.button4:setTop(290);
    obj.button4:setWidth(60);
    obj.button4:setHeight(60);
    obj.button4:setOpacity(0.1);
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj);
    obj.button5:setLeft(542);
    obj.button5:setTop(160);
    obj.button5:setWidth(60);
    obj.button5:setHeight(60);
    obj.button5:setOpacity(0.1);
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj);
    obj.button6:setLeft(388);
    obj.button6:setTop(255);
    obj.button6:setWidth(60);
    obj.button6:setHeight(55);
    obj.button6:setOpacity(0.1);
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj);
    obj.button7:setLeft(388);
    obj.button7:setTop(317);
    obj.button7:setWidth(60);
    obj.button7:setHeight(55);
    obj.button7:setOpacity(0.1);
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj);
    obj.button8:setLeft(388);
    obj.button8:setTop(377);
    obj.button8:setWidth(60);
    obj.button8:setHeight(55);
    obj.button8:setOpacity(0.1);
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj);
    obj.button9:setLeft(388);
    obj.button9:setTop(435);
    obj.button9:setWidth(60);
    obj.button9:setHeight(55);
    obj.button9:setOpacity(0.1);
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj);
    obj.button10:setLeft(388);
    obj.button10:setTop(493);
    obj.button10:setWidth(60);
    obj.button10:setHeight(55);
    obj.button10:setOpacity(0.1);
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj);
    obj.button11:setLeft(79);
    obj.button11:setTop(599);
    obj.button11:setWidth(40);
    obj.button11:setHeight(35);
    obj.button11:setOpacity(0.1);
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj);
    obj.button12:setLeft(79);
    obj.button12:setTop(635);
    obj.button12:setWidth(40);
    obj.button12:setHeight(35);
    obj.button12:setOpacity(0.1);
    obj.button12:setName("button12");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local novoForm = GUI.newForm("frmequip");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local novoForm = GUI.newForm("frmhabilidade");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            local novoForm = GUI.newForm("frmHistoria");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            local novoForm = GUI.newForm("frmsummon");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            local novoForm = GUI.newForm("frmpersonagem");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet.Classe == 'Monge' then
            	sheet.P.A = (tonumber(sheet.Forca) or 0) *4 + (tonumber(sheet.ArmaPA) or 0) + (tonumber(sheet.OutraPA) or 0) + (tonumber(sheet.ArmaduraPA) or 0) + (tonumber(sheet.AcessorioPA) or 0) +
            	(tonumber(sheet.PAHabilidade1) or 0) + (tonumber(sheet.PAHabilidade2) or 0) + (tonumber(sheet.PAHabilidade3) or 0) + (tonumber(sheet.PAHabilidade4) or 0) + (tonumber(sheet.PAHabilidade5) or 0) + (tonumber(sheet.PAHabilidade6) or 0) + 
            	(tonumber(sheet.PAHabilidade7) or 0) + (tonumber(sheet.PAHabilidade8) or 0) + (tonumber(sheet.PAHabilidade9) or 0) + (tonumber(sheet.PAUltima1) or 0) + (tonumber(sheet.PAUltima2) or 0) 
            	else 
            	sheet.P.A = (tonumber(sheet.Forca) or 0) *2 + (tonumber(sheet.ArmaPA) or 0) + (tonumber(sheet.OutraPA) or 0) + (tonumber(sheet.ArmaduraPA) or 0) + (tonumber(sheet.AcessorioPA) or 0) +
            	(tonumber(sheet.PAHabilidade1) or 0) + (tonumber(sheet.PAHabilidade2) or 0) + (tonumber(sheet.PAHabilidade3) or 0) + (tonumber(sheet.PAHabilidade4) or 0) + (tonumber(sheet.PAHabilidade5) or 0) + (tonumber(sheet.PAHabilidade6) or 0) + 
            	(tonumber(sheet.PAHabilidade7) or 0) + (tonumber(sheet.PAHabilidade8) or 0) + (tonumber(sheet.PAHabilidade9) or 0) + (tonumber(sheet.PAUltima1) or 0) + (tonumber(sheet.PAUltima2) or 0) 
            	 end;
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            sheet.P.M = (tonumber(sheet.Inteligencia) or 0) *2 + (tonumber(sheet.ArmaPM) or 0) + (tonumber(sheet.OutraPM) or 0) + (tonumber(sheet.ArmaduraPM) or 0) + (tonumber(sheet.AcessorioPM) or 0) +
            	(tonumber(sheet.PMHabilidade1) or 0) + (tonumber(sheet.PMHabilidade2) or 0) + (tonumber(sheet.PMHabilidade3) or 0) + (tonumber(sheet.PMHabilidade4) or 0) + (tonumber(sheet.PMHabilidade5) or 0) + (tonumber(sheet.PMHabilidade6) or 0) + 
            	(tonumber(sheet.PMHabilidade7) or 0) + (tonumber(sheet.PMHabilidade8) or 0) + (tonumber(sheet.PMHabilidade9) or 0) + (tonumber(sheet.PMUltima1) or 0) + (tonumber(sheet.PMUltima2) or 0)
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            sheet.P.F = (tonumber(sheet.Destreza) or 0) *2 + (tonumber(sheet.ArmaPF) or 0) + (tonumber(sheet.OutraPF) or 0) + (tonumber(sheet.ArmaduraPF) or 0) + (tonumber(sheet.AcessorioPF) or 0) +
            	(tonumber(sheet.PFHabilidade1) or 0) + (tonumber(sheet.PFHabilidade2) or 0) + (tonumber(sheet.PFHabilidade3) or 0) + (tonumber(sheet.PFHabilidade4) or 0) + (tonumber(sheet.PFHabilidade5) or 0) + (tonumber(sheet.PFHabilidade6) or 0) + 
            	(tonumber(sheet.PFHabilidade7) or 0) + (tonumber(sheet.PFHabilidade8) or 0) + (tonumber(sheet.PFHabilidade9) or 0) + (tonumber(sheet.PFUltima1) or 0) + (tonumber(sheet.PFUltima2) or 0)
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            sheet.Defesa = (tonumber(sheet.Vitalidade) or 0) /2 + (tonumber(sheet.Agilidade) or 0) /2 + (tonumber(sheet.ArmaDEF) or 0) + 
            	(tonumber(sheet.OutraDEF) or 0) + (tonumber(sheet.ArmaduraDEF) or 0) + (tonumber(sheet.AcessorioDEF) or 0) +
            	(tonumber(sheet.DefHabilidade1) or 0) + (tonumber(sheet.DefHabilidade2) or 0) + (tonumber(sheet.DefHabilidade3) or 0) + (tonumber(sheet.DefHabilidade4) or 0) +
            	(tonumber(sheet.DefHabilidade5) or 0) + (tonumber(sheet.DefHabilidade6) or 0) + 
            	(tonumber(sheet.DefHabilidade7) or 0) + (tonumber(sheet.DefHabilidade8) or 0) + (tonumber(sheet.DefHabilidade9) or 0) + (tonumber(sheet.DefUltima1) or 0) +
            	(tonumber(sheet.DefUltima2) or 0)
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            sheet.Resistencia = (tonumber(sheet.Forca) or 0) /2 + (tonumber(sheet.Vitalidade) or 0) /2 + (tonumber(sheet.Defesa) or 0) /2 +
            	(tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaRES) or 0) + (tonumber(sheet.OutraRES) or 0) + 
            	(tonumber(sheet.ArmaduraRES) or 0) + (tonumber(sheet.AcessorioRES) or 0) +
            	(tonumber(sheet.ResHabilidade1) or 0) + (tonumber(sheet.ResHabilidade2) or 0) + (tonumber(sheet.ResHabilidade3) or 0) + 
            	(tonumber(sheet.ResHabilidade4) or 0) + (tonumber(sheet.ResHabilidade5) or 0) + (tonumber(sheet.ResHabilidade6) or 0) + 
            	(tonumber(sheet.ResHabilidade7) or 0) + (tonumber(sheet.ResHabilidade8) or 0) + (tonumber(sheet.ResHabilidade9) or 0) + 
            	(tonumber(sheet.ResUltima1) or 0) + (tonumber(sheet.ResUltima2) or 0)
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            sheet.Elevel = math.floor((sheet.Level) - 20);
            	
            		
             
            	if sheet.level < 21 then
            	if sheet.Raca == 'Humano' then
            	sheet.RHPNivel = (tonumber(sheet.Level) or 0) * 10
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0)
            	else if sheet.Raca == 'Elfo' then
            	sheet.RHPNivel = (tonumber(sheet.Level) or 0) * 8
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0)
            	else if sheet.Raca == 'Elfo Negro' then
            	sheet.RHPNivel = (tonumber(sheet.Level) or 0) * 8
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0)
            	else if sheet.Raca == 'Anão' then
            	sheet.RHPNivel = (tonumber(sheet.Level) or 0) * 12
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0)
            	else if sheet.Raca == 'Orc' then
            	sheet.RHPNivel = (tonumber(sheet.Level) or 0) * 11
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0)
            	else if sheet.Raca == 'Kamael' then
            	sheet.RHPNivel = (tonumber(sheet.Level) or 0) * 8
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0)
            	else if sheet.Raca == 'Thiefling' then
            	sheet.RHPNivel = (tonumber(sheet.Level) or 0) * 9
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0)
            	else
            	showMessage("Escolha uma Raça SEU ARROMBADO!");
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	else 
            	if sheet.Raca == 'Humano' then
            	sheet.R20HPNivel = (tonumber(sheet.ELevel) or 0) * 20
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.ELevel) or 0)
            	else if sheet.Raca == 'Elfo' then
            	sheet.R20HPNivel = (tonumber(sheet.ELevel) or 0) * 16
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.ELevel) or 0)
            	else if sheet.Raca == 'Elfo Negro' then
            	sheet.R20HPNivel = (tonumber(sheet.ELevel) or 0) * 16
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.ELevel) or 0)
            	else if sheet.Raca == 'Anão' then
            	sheet.R20HPNivel = (tonumber(sheet.ELevel) or 0) * 24
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.ELevel) or 0)
            	else if sheet.Raca == 'Orc' then
            	sheet.R20HPNivel = (tonumber(sheet.ELevel) or 0) * 22
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.ELevel) or 0)
            	else if sheet.Raca == 'Kamael' then
            	sheet.R20HPNivel = (tonumber(sheet.ELevel) or 0) * 16
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.ELevel) or 0)
            	else if sheet.Raca == 'Thiefling' then
            	sheet.R20HPNivel = (tonumber(sheet.ELevel) or 0) * 18
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.ELevel) or 0)
            	else
            	showMessage("Escolha uma Raça SEU ARROMBADO!");
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end;
                    
             
            	if sheet.level < 21 then
            	if sheet.Classe == 'Animago' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 14 + 170
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else if sheet.Classe == 'Arqueiro' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 16 + 170
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else if sheet.Classe == 'Bardo' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 12 + 150
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else if sheet.Classe == 'Bispo' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 14 + 160
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else if sheet.Classe == 'Caçador de Almas' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 15 + 170
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else if sheet.Classe == 'Guerreiro' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 20 + 220
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else if sheet.Classe == 'Ladino' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 14 + 150
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else if sheet.Classe == 'Mago' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 12 + 140
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else if sheet.Classe == 'Mercenario' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 16 + 170
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else if sheet.Classe == 'Monge' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 16 + 180
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else if sheet.Classe == 'Paladino' then
            	sheet.CHPNivel = (tonumber(sheet.Level) or 0) * 18 + 200
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0)
            	else
            	showMessage("Escolha uma Classe Cuzão!");
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
                end;
                    
             
            	if sheet.level > 20 then
            	if sheet.Espec == 'Druida' then
            	sheet.EHPNivel = (tonumber(sheet.Elevel) or 0) * 22 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Shaman' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 24 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Caçador' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 22 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Sentinela Lunar' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 21 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Encantador de Almas' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 21 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Necromance' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 22 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Sacerdote' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 25 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Juiz' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 28 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Barbaro' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 28 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Tanker' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 30 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Acrobata' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 23 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Assassino' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 21 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Arcanista' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 20 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Feiticeiro' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 22 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Summoner' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 20 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Duelista' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 24 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Pirata' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 26 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Guardião Espiritual' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 26 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Cavaleiro das Trevas' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 29 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else if sheet.Espec == 'Templario' then
            	sheet.EHPNivel = (tonumber(sheet.ELevel) or 0) * 27 + 600
            	sheet.HPTotal =  (tonumber(sheet.HP) or 0) + (tonumber(sheet.Vitalidade) or 0) *20 + (tonumber(sheet.ArmaHP) or 0) + (tonumber(sheet.OutraHP) or 0) + (tonumber(sheet.ArmaduraHP) or 0) + (tonumber(sheet.AcessorioHP) or 0) +
            	(tonumber(sheet.HPHabilidade1) or 0) + (tonumber(sheet.HPHabilidade2) or 0) + (tonumber(sheet.HPHabilidade3) or 0) + (tonumber(sheet.HPHabilidade4) or 0) + (tonumber(sheet.HPHabilidade5) or 0) + (tonumber(sheet.HPHabilidade6) or 0) + 
            	(tonumber(sheet.HPHabilidade7) or 0) + (tonumber(sheet.HPHabilidade8) or 0) + (tonumber(sheet.HPHabilidade9) or 0) + (tonumber(sheet.HPUltima1) or 0) + (tonumber(sheet.HPUltima2) or 0) + (tonumber(sheet.RHPNivel) or 0) + (tonumber(sheet.CHPNivel) or 0) +
            	(tonumber(sheet.EHPNivel) or 0)
            	else
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
                end;
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            sheet.Elevel = math.floor((sheet.Level) - 20);
            	
            		
             
            	if sheet.level < 21 then
            	if sheet.Classe == 'Animago' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 4 + 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else if sheet.Classe == 'Arqueiro' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 3 + 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else if sheet.Classe == 'Bardo' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 4 + 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else if sheet.Classe == 'Bispo' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 4 + 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else if sheet.Classe == 'Caçador de Almas' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 4 + 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else if sheet.Classe == 'Guerreiro' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 2	+ 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else if sheet.Classe == 'Ladino' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 2 + 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else if sheet.Classe == 'Mago' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 4 + 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else if sheet.Classe == 'Mercenario' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 3 + 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else if sheet.Classe == 'Monge' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 3 + 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else if sheet.Classe == 'Paladino' then
            	sheet.RMPNivel = (tonumber(sheet.Level) or 0) * 3 + 100
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0)
            	else
            	showMessage("Escolha uma Classe Cuzão!");
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
                end;
                    
             
            	if sheet.level > 20 then
            	if sheet.Espec == 'Druida' then
            	sheet.EMPNivel = (tonumber(sheet.Elevel) or 0) * 5
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Shaman' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Caçador' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Sentinela Lunar' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 5
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Encantador de Almas' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 5
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Necromance' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 5
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Sacerdote' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 5
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Juiz' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Barbaro' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Tanker' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Acrobata' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Assassino' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Arcanista' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 5
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Feiticeiro' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Summoner' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 5
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Duelista' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Pirata' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Guardião Espiritual' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Cavaleiro das Trevas' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else if sheet.Espec == 'Templario' then
            	sheet.EMPNivel = (tonumber(sheet.ELevel) or 0) * 4
            	sheet.MPTotal =  (tonumber(sheet.MP) or 0) + (tonumber(sheet.Inteligencia) or 0) + (tonumber(sheet.ArmaMP) or 0) + (tonumber(sheet.OutraMP) or 0) + (tonumber(sheet.ArmaduraMP) or 0) + (tonumber(sheet.AcessorioMP) or 0) +
            	(tonumber(sheet.MPHabilidade1) or 0) + (tonumber(sheet.MPHabilidade2) or 0) + (tonumber(sheet.MPHabilidade3) or 0) + (tonumber(sheet.MPHabilidade4) or 0) + (tonumber(sheet.MPHabilidade5) or 0) + (tonumber(sheet.MPHabilidade6) or 0) + 
            	(tonumber(sheet.MPHabilidade7) or 0) + (tonumber(sheet.MPHabilidade8) or 0) + (tonumber(sheet.MPHabilidade9) or 0) + (tonumber(sheet.MPUltima1) or 0) + (tonumber(sheet.MPUltima2) or 0) + (tonumber(sheet.RMPNivel) or 0) + (tonumber(sheet.EMPNivel) or 0)
            	else
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
            	end
                end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmvelen()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmvelen();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmvelen = {
    newEditor = newfrmvelen, 
    new = newfrmvelen, 
    name = "frmvelen", 
    dataType = "com.velen", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Velen 4", 
    description=""};

frmvelen = _frmvelen;
Firecast.registrarForm(_frmvelen);
Firecast.registrarDataType(_frmvelen);

return _frmvelen;
