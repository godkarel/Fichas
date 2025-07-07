require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_FrmEffectTesteO()
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
    obj:setName("FrmEffectTesteO");
    obj:setScale(0.9);
    obj:setWidth(650);
    obj:setHeight(350);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({bottom=4});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("Criar Novo Effeito OPONENTE");
    obj.button1:setVisible(true);
    obj.button1:setWidth(150);
    obj.button1:setHeight(30);
    obj.button1:setAlign("top");
    obj.button1:setName("button1");

    obj.rclBuffsO = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclBuffsO:setParent(obj);
    obj.rclBuffsO:setName("rclBuffsO");
    obj.rclBuffsO:setField("listaBuffsO");
    obj.rclBuffsO:setTemplateForm("frmBuffO");
    obj.rclBuffsO:setTop(40);
    obj.rclBuffsO:setWidth(725);
    obj.rclBuffsO:setHeight(50);
    obj.rclBuffsO:setLayout("horizontal");
    obj.rclBuffsO:setSelectable(true);

    obj.dscBuffSlotO = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dscBuffSlotO:setParent(obj);
    obj.dscBuffSlotO:setName("dscBuffSlotO");
    obj.dscBuffSlotO:setVisible(false);
    obj.dscBuffSlotO:setTop(100);
    obj.dscBuffSlotO:setWidth(725);
    obj.dscBuffSlotO:setHeight(300);
    obj.dscBuffSlotO:setMargins({left=4, right=4, top=2});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.dscBuffSlotO);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({bottom=4});
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setAlign("left");
    obj.label1:setText("Efeito");
    obj.label1:setWidth(50);
    obj.label1:setMargins({left=15, right=-10});
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(160);
    obj.edit1:setMargins({left=15, right=-10});
    obj.edit1:setField("NomeEfeitoO");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setText("Dano");
    obj.label2:setFontColor("red");
    obj.label2:setWidth(50);
    obj.label2:setMargins({left=15, right=-10});
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(50);
    obj.edit2:setMargins({left=15, right=-10});
    obj.edit2:setType("number");
    obj.edit2:setField("DanoEffect");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setAlign("left");
    obj.label3:setText("Custo");
    obj.label3:setFontColor("#00FFFF");
    obj.label3:setWidth(65);
    obj.label3:setMargins({left=15, right=-10});
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(50);
    obj.edit3:setFontColor("#00FFFF");
    obj.edit3:setField("CustoEffect");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setAlign("left");
    obj.label4:setText("Cura");
    obj.label4:setFontColor("yellow");
    obj.label4:setWidth(50);
    obj.label4:setMargins({left=5, right=-10});
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(50);
    obj.edit4:setMargins({left=15, right=-10});
    obj.edit4:setType("number");
    obj.edit4:setField("CuraEffect");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setAlign("left");
    obj.label5:setText("RegMP");
    obj.label5:setFontColor("#0000FF");
    obj.label5:setWidth(65);
    obj.label5:setMargins({left=15, right=-10});
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(50);
    obj.edit5:setFontColor("#0000FF");
    obj.edit5:setField("RegMPEffect");
    obj.edit5:setName("edit5");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({bottom=4});
    obj.layout3:setName("layout3");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setAlign("left");
    obj.label6:setText("PA");
    obj.label6:setWidth(50);
    obj.label6:setMargins({left=15, right=-10});
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(50);
    obj.edit6:setMargins({left=15, right=-10});
    obj.edit6:setType("number");
    obj.edit6:setField("PAEffect");
    obj.edit6:setName("edit6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setAlign("left");
    obj.label7:setText("PM");
    obj.label7:setWidth(50);
    obj.label7:setMargins({left=15, right=-10});
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(50);
    obj.edit7:setMargins({left=15, right=-10});
    obj.edit7:setType("number");
    obj.edit7:setField("PMEffect");
    obj.edit7:setName("edit7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setAlign("left");
    obj.label8:setText("PF");
    obj.label8:setWidth(50);
    obj.label8:setMargins({left=15, right=-10});
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout3);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(50);
    obj.edit8:setMargins({left=15, right=-10});
    obj.edit8:setType("number");
    obj.edit8:setField("PFEffect");
    obj.edit8:setName("edit8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setAlign("left");
    obj.label9:setText("DEF");
    obj.label9:setWidth(50);
    obj.label9:setMargins({left=15, right=-10});
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout3);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(50);
    obj.edit9:setMargins({left=15, right=-10});
    obj.edit9:setType("number");
    obj.edit9:setField("DEFEffect");
    obj.edit9:setName("edit9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout3);
    obj.label10:setAlign("left");
    obj.label10:setText("RES");
    obj.label10:setWidth(50);
    obj.label10:setMargins({left=15, right=-10});
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout3);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(50);
    obj.edit10:setMargins({left=15, right=-10});
    obj.edit10:setType("number");
    obj.edit10:setField("RESEffect");
    obj.edit10:setName("edit10");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(30);
    obj.layout4:setMargins({bottom=4});
    obj.layout4:setName("layout4");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout4);
    obj.label11:setAlign("left");
    obj.label11:setText("AC");
    obj.label11:setWidth(50);
    obj.label11:setMargins({left=15, right=-10});
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout4);
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(50);
    obj.edit11:setMargins({left=15, right=-10});
    obj.edit11:setType("number");
    obj.edit11:setField("ACEffect");
    obj.edit11:setName("edit11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout4);
    obj.label12:setAlign("left");
    obj.label12:setText("ACM");
    obj.label12:setWidth(50);
    obj.label12:setMargins({left=15, right=-10});
    obj.label12:setName("label12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout4);
    obj.edit12:setAlign("left");
    obj.edit12:setWidth(50);
    obj.edit12:setMargins({left=15, right=-10});
    obj.edit12:setType("number");
    obj.edit12:setField("ACMEffect");
    obj.edit12:setName("edit12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout4);
    obj.label13:setAlign("left");
    obj.label13:setText("CR");
    obj.label13:setWidth(50);
    obj.label13:setMargins({left=15, right=-10});
    obj.label13:setName("label13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout4);
    obj.edit13:setAlign("left");
    obj.edit13:setWidth(50);
    obj.edit13:setMargins({left=15, right=-10});
    obj.edit13:setType("number");
    obj.edit13:setField("CREffect");
    obj.edit13:setName("edit13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout4);
    obj.label14:setAlign("left");
    obj.label14:setText("CRM");
    obj.label14:setWidth(50);
    obj.label14:setMargins({left=15, right=-10});
    obj.label14:setName("label14");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout4);
    obj.edit14:setAlign("left");
    obj.edit14:setWidth(50);
    obj.edit14:setMargins({left=15, right=-10});
    obj.edit14:setType("number");
    obj.edit14:setField("CRMEffect");
    obj.edit14:setName("edit14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout4);
    obj.label15:setAlign("left");
    obj.label15:setText("Proc");
    obj.label15:setFontColor("#FF1493");
    obj.label15:setWidth(50);
    obj.label15:setMargins({left=15, right=-10});
    obj.label15:setName("label15");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout4);
    obj.edit15:setAlign("left");
    obj.edit15:setWidth(50);
    obj.edit15:setFontColor("#FF1493");
    obj.edit15:setMargins({left=15, right=-10});
    obj.edit15:setType("number");
    obj.edit15:setField("DadoEffect");
    obj.edit15:setName("edit15");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(30);
    obj.layout5:setMargins({bottom=4});
    obj.layout5:setName("layout5");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout5);
    obj.label16:setAlign("left");
    obj.label16:setText("ESQ");
    obj.label16:setWidth(50);
    obj.label16:setMargins({left=15, right=-10});
    obj.label16:setName("label16");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout5);
    obj.edit16:setAlign("left");
    obj.edit16:setWidth(50);
    obj.edit16:setMargins({left=15, right=-10});
    obj.edit16:setType("number");
    obj.edit16:setField("ESQEffect");
    obj.edit16:setName("edit16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout5);
    obj.label17:setAlign("left");
    obj.label17:setText("Pers");
    obj.label17:setWidth(50);
    obj.label17:setMargins({left=15, right=-10});
    obj.label17:setName("label17");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout5);
    obj.edit17:setAlign("left");
    obj.edit17:setWidth(50);
    obj.edit17:setMargins({left=15, right=-10});
    obj.edit17:setType("number");
    obj.edit17:setField("PersEffect");
    obj.edit17:setName("edit17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout5);
    obj.label18:setAlign("left");
    obj.label18:setText("VEZ");
    obj.label18:setFontColor("green");
    obj.label18:setWidth(50);
    obj.label18:setMargins({left=15, right=-10});
    obj.label18:setName("label18");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout5);
    obj.edit18:setAlign("left");
    obj.edit18:setWidth(50);
    obj.edit18:setFontColor("green");
    obj.edit18:setMargins({left=15, right=-10});
    obj.edit18:setType("number");
    obj.edit18:setField("VezEffect");
    obj.edit18:setName("edit18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout5);
    obj.label19:setAlign("left");
    obj.label19:setText("HP Total");
    obj.label19:setFontColor("red");
    obj.label19:setWidth(50);
    obj.label19:setMargins({left=15, right=-10});
    obj.label19:setName("label19");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout5);
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(50);
    obj.edit19:setMargins({left=15, right=-10});
    obj.edit19:setType("number");
    obj.edit19:setField("HPTotalEffect");
    obj.edit19:setName("edit19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout5);
    obj.label20:setAlign("left");
    obj.label20:setText("MP Total");
    obj.label20:setFontColor("blue");
    obj.label20:setWidth(50);
    obj.label20:setMargins({left=15, right=-10});
    obj.label20:setName("label20");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout5);
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(50);
    obj.edit20:setFontColor("blue");
    obj.edit20:setMargins({left=15, right=-10});
    obj.edit20:setType("number");
    obj.edit20:setField("MPTotalEffect");
    obj.edit20:setName("edit20");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(30);
    obj.layout6:setMargins({bottom=4});
    obj.layout6:setName("layout6");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout6);
    obj.label21:setAlign("left");
    obj.label21:setText("CD");
    obj.label21:setWidth(50);
    obj.label21:setMargins({left=15, right=-10});
    obj.label21:setName("label21");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout6);
    obj.edit21:setAlign("left");
    obj.edit21:setWidth(50);
    obj.edit21:setMargins({left=15, right=-10});
    obj.edit21:setType("number");
    obj.edit21:setField("CDEffect");
    obj.edit21:setName("edit21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout6);
    obj.label22:setAlign("left");
    obj.label22:setText("Duração");
    obj.label22:setWidth(50);
    obj.label22:setMargins({left=15, right=-10});
    obj.label22:setName("label22");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout6);
    obj.edit22:setAlign("left");
    obj.edit22:setWidth(50);
    obj.edit22:setMargins({left=15, right=-10});
    obj.edit22:setType("number");
    obj.edit22:setField("DuraEffect");
    obj.edit22:setName("edit22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout6);
    obj.label23:setAlign("left");
    obj.label23:setText("Conta");
    obj.label23:setWidth(50);
    obj.label23:setMargins({left=15, right=-10});
    obj.label23:setName("label23");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout6);
    obj.edit23:setAlign("left");
    obj.edit23:setWidth(50);
    obj.edit23:setMargins({left=15, right=-10});
    obj.edit23:setType("number");
    obj.edit23:setField("ContaEffect");
    obj.edit23:setName("edit23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout6);
    obj.label24:setAlign("left");
    obj.label24:setText("Tipo");
    obj.label24:setWidth(50);
    obj.label24:setMargins({left=15, right=-10});
    obj.label24:setName("label24");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout6);
    obj.edit24:setAlign("left");
    obj.edit24:setWidth(50);
    obj.edit24:setMargins({left=15, right=-10});
    obj.edit24:setType("number");
    obj.edit24:setField("TipoEffect");
    obj.edit24:setName("edit24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout6);
    obj.label25:setAlign("left");
    obj.label25:setText("Expira");
    obj.label25:setWidth(50);
    obj.label25:setMargins({left=15, right=-10});
    obj.label25:setName("label25");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout6);
    obj.edit25:setAlign("left");
    obj.edit25:setWidth(50);
    obj.edit25:setMargins({left=15, right=-10});
    obj.edit25:setType("number");
    obj.edit25:setField("ExpiraEffect");
    obj.edit25:setName("edit25");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout6);
    obj.button2:setAlign("right");
    obj.button2:setFontColor("red");
    obj.button2:setText("Apagar!");
    obj.button2:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button2:setWidth(150);
    obj.button2:setName("button2");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setAlign("client");
    obj.layout7:setMargins({top=5, left=5 , bottom=4});
    obj.layout7:setName("layout7");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout7);
    obj.textEditor1:setAlign("top");
    obj.textEditor1:setField("DescriBuff");
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setName("textEditor1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            -- Usuário clicou no botão de criar novo item.
            					-- Vamos inserir um novo item no nosso recordList                              
            					self.rclBuffsO:append();
        end);

    obj._e_event1 = obj.rclBuffsO:addEventListener("onSelect",
        function ()
            local node = self.rclBuffsO.selectedNode;  
            				self.dscBuffSlotO.node = node;                       
            				self.dscBuffSlotO.visible = (node ~= nil);
            				RclSelecionadoBuffO = sheet.listaBuffsO
            
            				if self.dscBuffSlotO.visible == true then
            					if self.dscBuffSlotO.node.NomeEfeitoO == nil and self.dscBuffSlotO.node.NomeEfeitoO == "" then
            						self.dscBuffSlotO.node.NomeEfeitoO = "EFEITO";
            					end;
            					self.dscBuffSlotO.node.PAEffect = tonumber(self.dscBuffSlotO.node.PAEffect) or 0;
            					self.dscBuffSlotO.node.PMEffect = tonumber(self.dscBuffSlotO.node.PMEffect) or 0;
            					self.dscBuffSlotO.node.PFEffect = tonumber(self.dscBuffSlotO.node.PFEffect) or 0;
            					self.dscBuffSlotO.node.DEFEffect = tonumber(self.dscBuffSlotO.node.DEFEffect) or 0;
            					self.dscBuffSlotO.node.RESEffect = tonumber(self.dscBuffSlotO.node.RESEffect) or 0;
            					self.dscBuffSlotO.node.ACEffect = tonumber(self.dscBuffSlotO.node.ACEffect) or 0;
            					self.dscBuffSlotO.node.ACMEffect = tonumber(self.dscBuffSlotO.node.ACMEffect) or 0;
            					self.dscBuffSlotO.node.CREffect = tonumber(self.dscBuffSlotO.node.CREffect) or 0;
            					self.dscBuffSlotO.node.CRMEffect = tonumber(self.dscBuffSlotO.node.CRMEffect) or 0;
            					self.dscBuffSlotO.node.DadoEffect = tonumber(self.dscBuffSlotO.node.DadoEffect) or 0;
            					self.dscBuffSlotO.node.ESQEffect = tonumber(self.dscBuffSlotO.node.ESQEffect) or 0;
            					self.dscBuffSlotO.node.PersEffect = tonumber(self.dscBuffSlotO.node.PersEffect) or 0;
            					self.dscBuffSlotO.node.VezEffect = tonumber(self.dscBuffSlotO.node.VezEffect) or 0;
            					self.dscBuffSlotO.node.DanoEffect = tonumber(self.dscBuffSlotO.node.DanoEffect) or 0;
            					
            					self.dscBuffSlotO.node.CDEffect = tonumber(self.dscBuffSlotO.node.CDEffect) or 0;
            					self.dscBuffSlotO.node.DuraEffect = tonumber(self.dscBuffSlotO.node.DuraEffect) or 9000;
            					self.dscBuffSlotO.node.ContaEffect = tonumber(self.dscBuffSlotO.node.ContaEffect) or 0;
            					self.dscBuffSlotO.node.TipoEffect = tonumber(self.dscBuffSlotO.node.TipoEffect) or 0;
            					self.dscBuffSlotO.node.HPTotalEffect = tonumber(self.dscBuffSlotO.node.HPTotalEffect) or 0;
            					self.dscBuffSlotO.node.MPTotalEffect = tonumber(self.dscBuffSlotO.node.MPTotalEffect) or 0;
            
            					self.dscBuffSlotO.node.DanoEffect = tonumber(self.dscBuffSlotO.node.DanoEffect) or 0;
            					self.dscBuffSlotO.node.CustoEffect = tonumber(self.dscBuffSlotO.node.CustoEffect) or 0;
            					self.dscBuffSlotO.node.CuraEffect = tonumber(self.dscBuffSlotO.node.CuraEffect) or 0;
            					self.dscBuffSlotO.node.RegMPEffect = tonumber(self.dscBuffSlotO.node.RegMPEffect) or 0;
            
            					if self.dscBuffSlotO.node.ExpiraEffect == nil or self.dscBuffSlotO.node.ExpiraEffect == "" then
            						self.dscBuffSlotO.node.ExpiraEffect = 9999
            					end;
            
            					
            				end;
        end);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (event)
            sheet.PATotal = tonumber(sheet.PAEffectTotal or 0) + tonumber(sheet.PA or 0)
            												sheet.PMTotal = tonumber(sheet.PMEffectTotal or 0) + tonumber(sheet.PM or 0)
            												if sheet.PF ~= "NPC" then
            													sheet.PFTotal = (tonumber(sheet.PFEffectTotal or 0) + tonumber(sheet.PF or 0) or 0)
            												else 
            													sheet.PFTotal = 0
            												end;
            												sheet.DEFTotal = tonumber(sheet.DEFEffectTotal or 0) + tonumber(sheet.DEF or 0)
            												sheet.RESTotal = tonumber(sheet.RESEffectTotal or 0) + tonumber(sheet.RES or 0)
            												sheet.ACTotal = tonumber(sheet.ACEffectTotal or 0) + tonumber(sheet.AC or 0)
            												sheet.ACMTotal = tonumber(sheet.ACMEffectTotal or 0) + tonumber(sheet.ACM or 0)
            												sheet.CRTotal = tonumber(sheet.CREffectTotal or 0) + tonumber(sheet.CR or 0)
            												sheet.CRMTotal = tonumber(sheet.CRMEffectTotal or 0) + tonumber(sheet.CRM or 0)
            												sheet.DadoTotal = tonumber(sheet.DadoEffectTotal or 0) + tonumber(sheet.Dado or 0)
            												sheet.ESQTotal = tonumber(sheet.ESQEffectTotal or 0) + tonumber(sheet.ESQ or 0)
            												sheet.PersTotal = tonumber(sheet.PersEffectTotal or 0) + tonumber(sheet.Pers or 0)
            												sheet.ManaTotal = tonumber(sheet.ManaEffectTotal or 0) + tonumber(sheet.Mana or 0)
            												sheet.CDTotal = tonumber(sheet.CDEffectTotal or 0) + tonumber(sheet.CD or 0)
            												sheet.TipoTotal = tonumber(sheet.TipoEffectTotal or 0) + tonumber(sheet.Tipo or 0)
            												sheet.HPTotalTotal = tonumber(sheet.HPTotalEffectTotal or 0) + tonumber(sheet.HPTotal or 0)
            												sheet.MPTotalTotal = tonumber(sheet.MPTotalEffectTotal or 0) + tonumber(sheet.MPTotal or 0)
            												sheet.DanoEffectTotal = tonumber(sheet.DanoEffectTotal or 0) + tonumber(sheet.DanoEffect or 0)
            												sheet.CustoEffectTotal = tonumber(sheet.CustoEffectTotal or 0) + tonumber(sheet.CustoEffect or 0)
            												sheet.CuraEffectTotal = tonumber(sheet.CuraEffectTotal or 0) + tonumber(sheet.CuraEffect or 0)												
            												sheet.RegMPEffectTotal = tonumber(sheet.RegMPEffectTotal or 0) + tonumber(sheet.RegMPEffect or 0)
            												ndb.deleteNode(self.dscBuffSlotO.node);
        end);

    function obj:_releaseEvents()
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

        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rclBuffsO ~= nil then self.rclBuffsO:destroy(); self.rclBuffsO = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.dscBuffSlotO ~= nil then self.dscBuffSlotO:destroy(); self.dscBuffSlotO = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newFrmEffectTesteO()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_FrmEffectTesteO();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _FrmEffectTesteO = {
    newEditor = newFrmEffectTesteO, 
    new = newFrmEffectTesteO, 
    name = "FrmEffectTesteO", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    cacheMode = "none", 
    title = "", 
    description=""};

FrmEffectTesteO = _FrmEffectTesteO;
Firecast.registrarForm(_FrmEffectTesteO);

return _FrmEffectTesteO;
