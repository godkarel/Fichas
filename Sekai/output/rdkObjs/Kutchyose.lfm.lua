require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmKutchyoseFicha()
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
    obj:setName("frmKutchyoseFicha");
    obj:setWidth(1050);
    obj:setHeight(650);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({bottom=4});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("Novo Kutchyose");
    obj.button1:setWidth(150);
    obj.button1:setAlign("left");
    obj.button1:setName("button1");

    obj.rclKuchyoseLista = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclKuchyoseLista:setParent(obj);
    obj.rclKuchyoseLista:setName("rclKuchyoseLista");
    obj.rclKuchyoseLista:setField("CampoKutchyose");
    obj.rclKuchyoseLista:setTemplateForm("frmKutchyoseFicha1");
    obj.rclKuchyoseLista:setAlign("top");
    obj.rclKuchyoseLista:setSelectable(true);
    obj.rclKuchyoseLista:setLayout("horizontal");
    obj.rclKuchyoseLista:setHeight(40);

    obj.FichaKutchyose1 = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.FichaKutchyose1:setParent(obj);
    obj.FichaKutchyose1:setName("FichaKutchyose1");
    obj.FichaKutchyose1:setVisible(false);
    obj.FichaKutchyose1:setAlign("client");
    obj.FichaKutchyose1:setMargins({left=4, right=4, top=2});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.FichaKutchyose1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setWidth(1010);
    obj.image1:setHeight(750);
    obj.image1:setCenter(true);
    obj.image1:setSRC("/imagens/9.png");
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(100	);
    obj.edit1:setTop(6);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("KutchyoseNome");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(440	);
    obj.edit2:setTop(6);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(25);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("KutchyoseNumero");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(85);
    obj.edit3:setTop(62);
    obj.edit3:setWidth(70);
    obj.edit3:setHeight(25);
    obj.edit3:setField("KutchyoseDano");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(290);
    obj.edit4:setTop(62);
    obj.edit4:setWidth(25);
    obj.edit4:setHeight(25);
    obj.edit4:setType("number");
    obj.edit4:setMin(0);
    obj.edit4:setField("KutchyosePorcentDano");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(375);
    obj.edit5:setTop(62);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(25);
    obj.edit5:setFontColor("red");
    obj.edit5:setEnabled(false);
    obj.edit5:setField("KutchyoseDanoTotal");
    obj.edit5:setName("edit5");

    obj.cmbKutchyoseDN = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbKutchyoseDN:setParent(obj.scrollBox1);
    obj.cmbKutchyoseDN:setName("cmbKutchyoseDN");
    obj.cmbKutchyoseDN:setLeft(535);
    obj.cmbKutchyoseDN:setTop(68);
    obj.cmbKutchyoseDN:setWidth(110);
    obj.cmbKutchyoseDN:setHeight(18);
    obj.cmbKutchyoseDN:setField("KutchyoseTipoDano");
    obj.cmbKutchyoseDN:setItems({'Tai', 'Nin', 'Gen', 'Elemental', 'DanoArmado'});
    obj.cmbKutchyoseDN:setValues({'1', '2', '3', '4', '5'});

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(85);
    obj.edit6:setTop(90);
    obj.edit6:setWidth(70);
    obj.edit6:setHeight(25);
    obj.edit6:setField("KutchyoseHP");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox1);
    obj.edit7:setLeft(290);
    obj.edit7:setTop(90);
    obj.edit7:setWidth(25);
    obj.edit7:setHeight(25);
    obj.edit7:setField("KutchyosePorcentHP");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox1);
    obj.edit8:setLeft(375);
    obj.edit8:setTop(90);
    obj.edit8:setWidth(100);
    obj.edit8:setHeight(25);
    obj.edit8:setEnabled(false);
    obj.edit8:setFontColor("red");
    obj.edit8:setField("KutchyoseHPTotal");
    obj.edit8:setName("edit8");

    obj.KutchyoseHPBar = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.KutchyoseHPBar:setParent(obj.scrollBox1);
    obj.KutchyoseHPBar:setName("KutchyoseHPBar");
    obj.KutchyoseHPBar:setLeft(110);
    obj.KutchyoseHPBar:setTop(125);
    obj.KutchyoseHPBar:setWidth(120);
    obj.KutchyoseHPBar:setHeight(20);
    obj.KutchyoseHPBar:setColor("green");
    obj.KutchyoseHPBar:setPosition(50);
    obj.KutchyoseHPBar:setMax(100);

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox1);
    obj.edit9:setLeft(120);
    obj.edit9:setTop(125);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(20);
    obj.edit9:setTransparent(true);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setFontColor("white");
    obj.edit9:setField("KutchyoseAtualEnergia");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.scrollBox1);
    obj.edit10:setLeft(180);
    obj.edit10:setTop(125);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(20);
    obj.edit10:setTransparent(true);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setFontColor("white");
    obj.edit10:setField("KutchyoseMaxEnergia");
    obj.edit10:setName("edit10");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(695);
    obj.image2:setTop(15);
    obj.image2:setWidth(242);
    obj.image2:setHeight(176);
    obj.image2:setField("KutchyoseIMG");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(150);
    obj.button2:setTop(200);
    obj.button2:setWidth(140);
    obj.button2:setHeight(40);
    obj.button2:setText("Novo Jutsu Kutchyose");
    obj.button2:setName("button2");

    obj.rclListaJutsusKutchyose = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaJutsusKutchyose:setParent(obj.scrollBox1);
    obj.rclListaJutsusKutchyose:setName("rclListaJutsusKutchyose");
    obj.rclListaJutsusKutchyose:setField("KutchyoseJutsus");
    obj.rclListaJutsusKutchyose:setTemplateForm("frmKutchyoseFichaJutsu");
    obj.rclListaJutsusKutchyose:setWidth(1000);
    obj.rclListaJutsusKutchyose:setHeight(505);
    obj.rclListaJutsusKutchyose:setLeft(5);
    obj.rclListaJutsusKutchyose:setTop(245);
    obj.rclListaJutsusKutchyose:setSelectable(true);

    obj.ListaJutsusKutchyose = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.ListaJutsusKutchyose:setParent(obj.scrollBox1);
    obj.ListaJutsusKutchyose:setName("ListaJutsusKutchyose");
    obj.ListaJutsusKutchyose:setVisible(false);
    obj.ListaJutsusKutchyose:setWidth(700);
    obj.ListaJutsusKutchyose:setHeight(460);
    obj.ListaJutsusKutchyose:setLeft(400);
    obj.ListaJutsusKutchyose:setTop(300);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.ListaJutsusKutchyose);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setWidth(588);
    obj.rectangle1:setHeight(450);
    obj.rectangle1:setLeft(1);
    obj.rectangle1:setTop(1);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setWidth(120);
    obj.label1:setHeight(40);
    obj.label1:setLeft(10);
    obj.label1:setTop(10);
    obj.label1:setFontFamily("Nyala");
    obj.label1:setFontSize(16);
    obj.label1:setText("Nome do Jutsu:");
    obj.label1:setName("label1");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setWidth(310);
    obj.edit11:setHeight(30);
    obj.edit11:setLeft(130);
    obj.edit11:setTop(15);
    obj.edit11:setField("NomeJutsuKutchyose");
    obj.edit11:setName("edit11");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(60);
    obj.textEditor1:setWidth(430);
    obj.textEditor1:setHeight(240);
    obj.textEditor1:setField("DescriJutsu");
    obj.textEditor1:setName("textEditor1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(10);
    obj.label2:setTop(305);
    obj.label2:setWidth(120);
    obj.label2:setHeight(40);
    obj.label2:setFontFamily("Nyala");
    obj.label2:setFontSize(16);
    obj.label2:setText("Dano:");
    obj.label2:setName("label2");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle1);
    obj.edit12:setLeft(53);
    obj.edit12:setTop(310);
    obj.edit12:setWidth(80);
    obj.edit12:setHeight(30);
    obj.edit12:setType("number");
    obj.edit12:setField("KutchyoseDanoJutsu");
    obj.edit12:setName("edit12");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(140);
    obj.label3:setTop(305);
    obj.label3:setWidth(120);
    obj.label3:setHeight(40);
    obj.label3:setFontFamily("Nyala");
    obj.label3:setFontSize(16);
    obj.label3:setFontColor("green");
    obj.label3:setText("Energia Kutchyuose:");
    obj.label3:setName("label3");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle1);
    obj.edit13:setLeft(260);
    obj.edit13:setTop(310);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(30);
    obj.edit13:setType("number");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setFontColor("green");
    obj.edit13:setField("CustoKutchyose");
    obj.edit13:setName("edit13");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(230);
    obj.label4:setTop(305);
    obj.label4:setWidth(100);
    obj.label4:setHeight(40);
    obj.label4:setFontFamily("Nyala");
    obj.label4:setFontSize(16);
    obj.label4:setVisible(false);
    obj.label4:setFontColor("green");
    obj.label4:setText("Custo Real: ");
    obj.label4:setName("label4");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle1);
    obj.edit14:setLeft(300);
    obj.edit14:setTop(310);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(30);
    obj.edit14:setType("number");
    obj.edit14:setEnabled(false);
    obj.edit14:setVisible(false);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setFontColor("cyan");
    obj.edit14:setField("CustoJutsu");
    obj.edit14:setName("edit14");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(345);
    obj.label5:setTop(305);
    obj.label5:setWidth(100);
    obj.label5:setHeight(40);
    obj.label5:setFontFamily("Nyala");
    obj.label5:setFontSize(16);
    obj.label5:setVisible(false);
    obj.label5:setFontColor("green");
    obj.label5:setText("Energia: ");
    obj.label5:setName("label5");

    obj.edtCustoKutchyose = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtCustoKutchyose:setParent(obj.rectangle1);
    obj.edtCustoKutchyose:setName("edtCustoKutchyose");
    obj.edtCustoKutchyose:setLeft(400);
    obj.edtCustoKutchyose:setTop(310);
    obj.edtCustoKutchyose:setWidth(40);
    obj.edtCustoKutchyose:setHeight(30);
    obj.edtCustoKutchyose:setType("number");
    obj.edtCustoKutchyose:setHorzTextAlign("center");
    obj.edtCustoKutchyose:setVisible(false);
    obj.edtCustoKutchyose:setFontColor("green");
    obj.edtCustoKutchyose:setField("CustoEnergia");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(10);
    obj.label6:setTop(345);
    obj.label6:setWidth(60);
    obj.label6:setHeight(40);
    obj.label6:setFontFamily("Nyala");
    obj.label6:setFontSize(16);
    obj.label6:setText("Tipo 1:");
    obj.label6:setName("label6");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(50);
    obj.comboBox1:setTop(358);
    obj.comboBox1:setWidth(123);
    obj.comboBox1:setHeight(18);
    obj.comboBox1:setField("KutchyoseTipoJutsu");
    obj.comboBox1:setItems({'Dano Completo', 'Dano X2', 'M/Dano', 'KutchyoseOutros'});
    obj.comboBox1:setName("comboBox1");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(160);
    obj.label7:setTop(345);
    obj.label7:setWidth(60);
    obj.label7:setHeight(40);
    obj.label7:setFontFamily("Nyala");
    obj.label7:setVisible(false);
    obj.label7:setFontSize(16);
    obj.label7:setText("Tipo 2:");
    obj.label7:setName("label7");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle1);
    obj.comboBox2:setLeft(205);
    obj.comboBox2:setTop(358);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setHeight(18);
    obj.comboBox2:setField("Tipo");
    obj.comboBox2:setVisible(false);
    obj.comboBox2:setItems({'Nulo', 'Tai', 'Nin', 'Gen', 'Elemental', 'DanoArmado', 'Defensivo', 'Selamento', 'Outros','M/Tai', 'M/Nin', 'M/Gen', 'M/Elemental', 'M/DA'});
    obj.comboBox2:setName("comboBox2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(310);
    obj.label8:setTop(345);
    obj.label8:setWidth(60);
    obj.label8:setHeight(40);
    obj.label8:setFontFamily("Nyala");
    obj.label8:setVisible(false);
    obj.label8:setFontSize(16);
    obj.label8:setText("Tipo 3:");
    obj.label8:setName("label8");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle1);
    obj.comboBox3:setLeft(355);
    obj.comboBox3:setTop(358);
    obj.comboBox3:setWidth(100);
    obj.comboBox3:setHeight(18);
    obj.comboBox3:setField("Tipo");
    obj.comboBox3:setVisible(false);
    obj.comboBox3:setItems({'Nulo', 'Tai', 'Nin', 'Gen', 'Elemental', 'DanoArmado', 'Defensivo', 'Selamento', 'Outros','M/Tai', 'M/Nin', 'M/Gen', 'M/Elemental', 'M/DA'});
    obj.comboBox3:setName("comboBox3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setWidth(150);
    obj.label9:setHeight(40);
    obj.label9:setLeft(10);
    obj.label9:setTop(390);
    obj.label9:setFontFamily("Nyala");
    obj.label9:setFontSize(16);
    obj.label9:setText("Dano Verdadeiro");
    obj.label9:setName("label9");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle1);
    obj.edit15:setWidth(80);
    obj.edit15:setHeight(20);
    obj.edit15:setLeft(110);
    obj.edit15:setTop(400);
    obj.edit15:setEnabled(false);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setField("KutchyoseDNVerdadeiro");
    obj.edit15:setName("edit15");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle1);
    obj.label10:setWidth(170);
    obj.label10:setHeight(40);
    obj.label10:setLeft(280);
    obj.label10:setTop(390);
    obj.label10:setFontFamily("Nyala");
    obj.label10:setFontColor("Crimson ");
    obj.label10:setFontSize(16);
    obj.label10:setText("Intensidade");
    obj.label10:setName("label10");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle1);
    obj.edit16:setWidth(80);
    obj.edit16:setHeight(20);
    obj.edit16:setLeft(350);
    obj.edit16:setTop(400);
    obj.edit16:setEnabled(false);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setFontColor("Crimson");
    obj.edit16:setField("KutchyoseIntensidade");
    obj.edit16:setName("edit16");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle1);
    obj.label11:setWidth(70);
    obj.label11:setHeight(40);
    obj.label11:setLeft(195);
    obj.label11:setTop(390);
    obj.label11:setFontFamily("Nyala");
    obj.label11:setFontSize(16);
    obj.label11:setText("Level");
    obj.label11:setName("label11");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle1);
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(30);
    obj.edit17:setLeft(390);
    obj.edit17:setTop(380);
    obj.edit17:setVisible(false);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setFontColor("cyan");
    obj.edit17:setType("number");
    obj.edit17:setField("ChakraPlayer");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle1);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(20);
    obj.edit18:setLeft(230);
    obj.edit18:setTop(400);
    obj.edit18:setEnabled(true);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setField("LevelJutsu1");
    obj.edit18:setName("edit18");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle1);
    obj.image3:setLeft(445);
    obj.image3:setTop(110);
    obj.image3:setWidth(140);
    obj.image3:setHeight(150);
    obj.image3:setSRC("/imagens/invoc.png");
    obj.image3:setName("image3");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(445);
    obj.button3:setTop(120);
    obj.button3:setFontSize(20);
    obj.button3:setOpacity(0.0);
    obj.button3:setHeight(120);
    obj.button3:setWidth(140);
    obj.button3:setText("Usar");
    obj.button3:setFontColor("White");
    obj.button3:setName("button3");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle1);
    obj.label12:setWidth(70);
    obj.label12:setHeight(40);
    obj.label12:setLeft(500);
    obj.label12:setTop(230);
    obj.label12:setFontFamily("Nyala");
    obj.label12:setFontSize(18);
    obj.label12:setText("Usar");
    obj.label12:setName("label12");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'KutchyoseMaxEnergia', 'KutchyoseAtualEnergia'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.scrollBox1);
    obj.dataLink2:setFields({'KutchyoseDano', 'KutchyosePorcentDano', 'KutchyoseTipoDano', 'TaiTotal', 'NinTotal', 'GenTotal', 'DATotal', 'EleTotal'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.scrollBox1);
    obj.dataLink3:setFields({'KutchyosePorcentHP', 'KutchyoseHP', 'HPTotal'});
    obj.dataLink3:setName("dataLink3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(20);
    obj.button4:setTop(160);
    obj.button4:setText("Ataque Kutchyose");
    obj.button4:setFontColor("cyan");
    obj.button4:setWidth(130);
    obj.button4:setHeight(30);
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(170);
    obj.button5:setTop(160);
    obj.button5:setText("Esquiva Kutchyose");
    obj.button5:setFontColor("cyan");
    obj.button5:setWidth(130);
    obj.button5:setHeight(30);
    obj.button5:setName("button5");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            self.rclKuchyoseLista:append();
        end);

    obj._e_event1 = obj.rclKuchyoseLista:addEventListener("onSelect",
        function ()
            local node = self.rclKuchyoseLista.selectedNode;  
            			self.FichaKutchyose1.node = node;                       
            			self.FichaKutchyose1.visible = (node ~= nil);
        end);

    obj._e_event2 = obj.rclKuchyoseLista:addEventListener("onEndEnumeration",
        function ()
            if self.rclKuchyoseLista.selectedNode == nil and sheet ~= nil then
            				local nodes = ndb.getChildNodes(sheet.CampoSummon);           
            				if #nodes > 0 then
            						self.rclKuchyoseLista.selectedNode = nodes[1];
            				end;
            			end;
        end);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (event)
            self.rclListaJutsusKutchyose:append();
        end);

    obj._e_event4 = obj.rclListaJutsusKutchyose:addEventListener("onSelect",
        function ()
            local node = self.rclListaJutsusKutchyose.selectedNode; 
            					self.ListaJutsusKutchyose.node = node;                       
            					self.ListaJutsusKutchyose.visible = (node ~= nil);
        end);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (event)
            local node = self.ListaJutsusKutchyose.node;									
            								local mesaDoPersonagem = rrpg.getMesaDe(sheet);								
            								node.LevelJutsu1 = 1;
            								
            								if node.KutchyoseTipoJutsu == nil then
            									showMessage("Escolha o tipo do seu jutsu e preencha com as informações");
            								else 	
            									sheet.AcertoNinTotal = tonumber(sheet.AcertoNinTotal) or 0;
            									
            									if node.KutchyoseTipoJutsu ~= nil then
            										node.KutchyoseDNVerdadeiro = (tonumber(node.KutchyoseDanoJutsu) or 0)* 2^tonumber(node.LevelJutsu1 - 1); 
            									else
            										node.LevelJutsu1 = 1;
            									end;
            									
            									if node.KutchyoseTipoJutsu == 'Dano Completo' then
            										node.KutchyoseIntensidade = (tonumber(node.KutchyoseDNVerdadeiro) or 0) + (tonumber(sheet.KutchyoseDanoTotal) or 0);	
            									end;	
            									
            									if node.KutchyoseTipoJutsu == 'Dano X2' then
            										node.KutchyoseIntensidade = (tonumber(node.KutchyoseDNVerdadeiro) or 0) + ((tonumber(sheet.KutchyoseDanoTotal) or 0) * 2);	
            									end;
            									
            									if node.KutchyoseTipoJutsu == 'M/Dano' then
            										node.KutchyoseIntensidade = (tonumber(node.KutchyoseDNVerdadeiro) or 0) + ((tonumber(sheet.KutchyoseDanoTotal) or 0) / 2);	
            									end;
            									
            									if node.KutchyoseTipoJutsu == 'KutchyoseOutros' then
            										node.KutchyoseIntensidade = 0;
            									end;
            									
            									if ((node.CustoKutchyose == nil) or (node.CustoKutchyose == 0)) then
            										showMessage("O CUSTO DE ENERGIA DO KUTCHYOSE NÃO PODE ESTAR VAZIA SEU ANIMAL!");
            									else
            										mesaDoPersonagem.chat:rolarDados("1d100", "[§K3]Tentativa de executar Jutsu",
            										function (rolado)
            											if sheet.AcertoNinTotal >= rolado.resultado then
            												mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. node.DescriJutsu);
            												if node.KutchyoseTipoJutsu == 'Dano Completo'then
            													if sheet.CRNinTotal >= rolado.resultado then
            														mesaDoPersonagem.chat:enviarMensagem("[§K4,0]CRITICAL :awyeah: « [§K4,0]" .. (node.KutchyoseIntensidade * 2) .. "[§K3] »");
            													else
            														mesaDoPersonagem.chat:enviarMensagem("[§K3,0]Causando « [§K4,0]" .. node.KutchyoseIntensidade .. "[§K3] »");
            													end;
            												end;
            												
            												if node.KutchyoseTipoJutsu == 'Dano X2'then
            													if sheet.CRNinTotal >= rolado.resultado then
            														mesaDoPersonagem.chat:enviarMensagem("[§K4,0]CRITICAL :awyeah: « [§K4,0]" .. (node.KutchyoseIntensidade * 2) .. "[§K3] »");
            													else
            														mesaDoPersonagem.chat:enviarMensagem("[§K3,0]Causando « [§K4,0]" .. node.KutchyoseIntensidade .. "[§K3] »");
            													end;
            												end;
            												
            												if node.KutchyoseTipoJutsu == 'M/Dano'then
            													if sheet.CRNinTotal >= rolado.resultado then
            														mesaDoPersonagem.chat:enviarMensagem("[§K4,0]CRITICAL :awyeah: « [§K4,0]" .. (node.KutchyoseIntensidade * 2) .. "[§K3] »");
            													else
            														mesaDoPersonagem.chat:enviarMensagem("[§K3,0]Causando « [§K4,0]" .. node.KutchyoseIntensidade .. "[§K3] »");
            													end;
            												end;
            												
            												if node.KutchyoseTipoJutsu == 'KutchyoseOutros'then
            													if sheet.CRNinTotal >= rolado.resultado then
            														mesaDoPersonagem.chat:enviarMensagem("[§K4,0]CRITICAL :awyeah: « [§K4,0]" .. (node.KutchyoseIntensidade * 2) .. "[§K3] »");
            													else
            														mesaDoPersonagem.chat:enviarMensagem("[§K3,0]Causando « [§K4,0]" .. node.KutchyoseIntensidade .. "[§K3] »");
            													end;
            												end;	
            												
            												sheet.KutchyoseAtualEnergia = sheet.KutchyoseAtualEnergia - (tonumber(node.CustoKutchyose) or 0);
            											else
            												mesaDoPersonagem.chat:enviarMensagem("[§K4,0]TURURU, O Naruto pode ser duro as vezes [§I https://i.pinimg.com/736x/3d/5b/26/3d5b2652bd9b8459d9e9ba70c0724734.jpg]");
            											end;											
            										end);
            									end;
            								end;
        end);

    obj._e_event6 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.KutchyoseAtualEnergia ~= '' then
            						self.KutchyoseHPBar.value = (tonumber(sheet.KutchyoseAtualEnergia) or 0);
            						self.KutchyoseHPBar.max = (tonumber(sheet.KutchyoseMaxEnergia) or 0);		
            					end;
        end);

    obj._e_event7 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.KutchyosePorcentDano ~= nil then
            						sheet.KutchyosePorcentDanoAPP = tonumber(sheet.KutchyosePorcentDano / 100);
            						
            						if self.cmbKutchyoseDN.value == '1' then
            							sheet.KutchyoseDanoTotal = sheet.KutchyoseDano + (sheet.TaiTotal * sheet.KutchyosePorcentDanoAPP) ;
            						end;
            						
            						if self.cmbKutchyoseDN.value == '2' then
            							sheet.KutchyoseDanoTotal = sheet.KutchyoseDano + (sheet.NinTotal * sheet.KutchyosePorcentDanoAPP);
            						end;
            						
            						if self.cmbKutchyoseDN.value == '3' then
            							sheet.KutchyoseDanoTotal = sheet.KutchyoseDano + (sheet.GenTotal * sheet.KutchyosePorcentDanoAPP);
            						end;
            						
            						if self.cmbKutchyoseDN.value == '4' then
            							sheet.KutchyoseDanoTotal = sheet.KutchyoseDano + (sheet.DATotal * sheet.KutchyosePorcentDanoAPP);
            						end;
            						
            						if self.cmbKutchyoseDN.value == '5' then
            							sheet.KutchyoseDanoTotal = sheet.KutchyoseDano + (sheet.EleTotal * sheet.KutchyosePorcentDanoAPP);
            						end;
            					end;
        end);

    obj._e_event8 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.KutchyosePorcentHP ~= nil then
            						sheet.KutchyosePorcentHPAPP = tonumber(sheet.KutchyosePorcentHP / 100);					
            						sheet.KutchyoseHPTotal = sheet.KutchyoseHP + (sheet.HPTotal * sheet.KutchyosePorcentHPAPP) ;	
            					end;
        end);

    obj._e_event9 = obj.button4:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);        
            					sheet.AcertoTaiTotal = tonumber(sheet.AcertoTaiTotal or 0);  
            						mesaDoPersonagem.chat:rolarDados("1d100 ","[§K3]O Kutchyose tenta usar o ataque basico no oponente",
            							function (rolado)
            								if sheet.AcertoTaiTotal >= rolado.resultado then
            									if sheet.CRTaiTotal >= rolado.resultado then
            										mesaDoPersonagem.chat:enviarMensagem("[§K4]O KUTCHYOSE CRITOU O ALVO COM ATAQUE BASICO CAUSANDO [§K4]" .. (sheet.KutchyoseDanoTotal * 2));
            									else
            										mesaDoPersonagem.chat:enviarMensagem("[§K3]O Kutchyose acertou o alvo com ataque basico Causando [§K4]" .. sheet.KutchyoseDanoTotal);
            									end;																					
            								else
            									mesaDoPersonagem.chat:enviarMensagem("[§K4]O Oponente esquivou do ataque do Kutchyose");
            								end;
            								
            								sheet.KutchyoseAtualEnergia = sheet.KutchyoseAtualEnergia - 10;						
            						end);
        end);

    obj._e_event10 = obj.button5:addEventListener("onClick",
        function (event)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);        
            					sheet.EsquivaTotal = tonumber(sheet.EsquivaTotal or 0);                        
            					mesaDoPersonagem.chat:rolarDados("1d100 ","[§K3]Tentativa de Esquiva do Kutchyose",
            						function (rolado)
            							if sheet.EsquivaTotal >= rolado.resultado then
            								mesaDoPersonagem.chat:enviarMensagem("[§K3]O Kutchyose esquivou do ataque do oponente");
            							else
            								mesaDoPersonagem.chat:enviarMensagem("[§K4]O Oponente Acertou o Kutchyose");
            							end;										
            					end);
        end);

    function obj:_releaseEvents()
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
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edtCustoKutchyose ~= nil then self.edtCustoKutchyose:destroy(); self.edtCustoKutchyose = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.rclKuchyoseLista ~= nil then self.rclKuchyoseLista:destroy(); self.rclKuchyoseLista = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.FichaKutchyose1 ~= nil then self.FichaKutchyose1:destroy(); self.FichaKutchyose1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.rclListaJutsusKutchyose ~= nil then self.rclListaJutsusKutchyose:destroy(); self.rclListaJutsusKutchyose = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.cmbKutchyoseDN ~= nil then self.cmbKutchyoseDN:destroy(); self.cmbKutchyoseDN = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.ListaJutsusKutchyose ~= nil then self.ListaJutsusKutchyose:destroy(); self.ListaJutsusKutchyose = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.KutchyoseHPBar ~= nil then self.KutchyoseHPBar:destroy(); self.KutchyoseHPBar = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmKutchyoseFicha()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmKutchyoseFicha();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmKutchyoseFicha = {
    newEditor = newfrmKutchyoseFicha, 
    new = newfrmKutchyoseFicha, 
    name = "frmKutchyoseFicha", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmKutchyoseFicha = _frmKutchyoseFicha;
Firecast.registrarForm(_frmKutchyoseFicha);

return _frmKutchyoseFicha;
