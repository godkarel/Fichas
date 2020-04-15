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

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setWidth(1050);
    obj.image1:setHeight(720);
    obj.image1:setCenter(true);
    obj.image1:setSRC("/imagens/3.png");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj);
    obj.image2:setWidth(60);
    obj.image2:setField("HI1");
    obj.image2:setHeight(70);
    obj.image2:setLeft(90);
    obj.image2:setTop(75);
    obj.image2:setName("image2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(78);
    obj.button1:setTop(67);
    obj.button1:setText("Clique");
    obj.button1:setOpacity(0.0);
    obj.button1:setWidth(90);
    obj.button1:setHeight(90);
    obj.button1:setName("button1");

    obj.H1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H1:setParent(obj);
    obj.H1:setLeft(640);
    obj.H1:setName("H1");
    obj.H1:setVisible(false);
    obj.H1:setTop(44);
    obj.H1:setWidth(150);
    obj.H1:setHeight(22);
    obj.H1:setField("NomeHabilidade1");

    obj.HL1 = GUI.fromHandle(_obj_newObject("label"));
    obj.HL1:setParent(obj);
    obj.HL1:setLeft(800);
    obj.HL1:setName("HL1");
    obj.HL1:setVisible(false);
    obj.HL1:setTop(40);
    obj.HL1:setFontSize(20);
    obj.HL1:setWidth(250);
    obj.HL1:setText("Primeira Habilidade");
    obj.HL1:setFontColor("Blue");
    obj.HL1:setAutoSize(true);

    obj.HD1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD1:setParent(obj);
    obj.HD1:setLeft(610);
    obj.HD1:setName("HD1");
    obj.HD1:setVisible(false);
    obj.HD1:setTop(320);
    obj.HD1:setWidth(50);
    obj.HD1:setHeight(20);
    obj.HD1:setField("DanoHabilidade1");

    obj.HPM1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM1:setParent(obj);
    obj.HPM1:setLeft(720);
    obj.HPM1:setName("HPM1");
    obj.HPM1:setVisible(false);
    obj.HPM1:setTop(320);
    obj.HPM1:setWidth(50);
    obj.HPM1:setHeight(20);
    obj.HPM1:setField("PMHabilidade1");

    obj.HPA1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA1:setParent(obj);
    obj.HPA1:setLeft(830);
    obj.HPA1:setName("HPA1");
    obj.HPA1:setVisible(false);
    obj.HPA1:setTop(320);
    obj.HPA1:setWidth(50);
    obj.HPA1:setHeight(20);
    obj.HPA1:setField("PAHabilidade1");

    obj.HPF1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF1:setParent(obj);
    obj.HPF1:setLeft(940);
    obj.HPF1:setName("HPF1");
    obj.HPF1:setVisible(false);
    obj.HPF1:setTop(320);
    obj.HPF1:setWidth(50);
    obj.HPF1:setHeight(20);
    obj.HPF1:setField("PFHabilidade1");

    obj.HC1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HC1:setParent(obj);
    obj.HC1:setLeft(610);
    obj.HC1:setName("HC1");
    obj.HC1:setVisible(false);
    obj.HC1:setTop(350);
    obj.HC1:setWidth(50);
    obj.HC1:setHeight(20);
    obj.HC1:setField("CuraHabilidade1");

    obj.HDEF1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HDEF1:setParent(obj);
    obj.HDEF1:setLeft(720);
    obj.HDEF1:setName("HDEF1");
    obj.HDEF1:setVisible(false);
    obj.HDEF1:setTop(350);
    obj.HDEF1:setWidth(50);
    obj.HDEF1:setHeight(20);
    obj.HDEF1:setField("DefHabilidade1");

    obj.HRES1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HRES1:setParent(obj);
    obj.HRES1:setLeft(830);
    obj.HRES1:setName("HRES1");
    obj.HRES1:setVisible(false);
    obj.HRES1:setTop(350);
    obj.HRES1:setWidth(50);
    obj.HRES1:setHeight(20);
    obj.HRES1:setField("ResHabilidade1");

    obj.HHP1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HHP1:setParent(obj);
    obj.HHP1:setLeft(830);
    obj.HHP1:setName("HHP1");
    obj.HHP1:setVisible(false);
    obj.HHP1:setTop(380);
    obj.HHP1:setWidth(50);
    obj.HHP1:setHeight(20);
    obj.HHP1:setField("HPHabilidade1");

    obj.HMP1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HMP1:setParent(obj);
    obj.HMP1:setLeft(940);
    obj.HMP1:setName("HMP1");
    obj.HMP1:setVisible(false);
    obj.HMP1:setTop(380);
    obj.HMP1:setWidth(50);
    obj.HMP1:setHeight(20);
    obj.HMP1:setField("MPHabilidade1");

    obj.HT1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT1:setParent(obj);
    obj.HT1:setLeft(565);
    obj.HT1:setTop(130);
    obj.HT1:setVisible(false);
    obj.HT1:setName("HT1");
    obj.HT1:setWidth(400);
    obj.HT1:setHeight(170);
    obj.HT1:setField("DescriHabilidade1");

    obj.HI1 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI1:setParent(obj);
    obj.HI1:setName("HI1");
    obj.HI1:setVisible(false);
    obj.HI1:setField("HI1");
    obj.HI1:setEditable(true);
    obj.HI1:setLeft(564);
    obj.HI1:setTop(397);
    obj.HI1:setWidth(214);
    obj.HI1:setHeight(130);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj);
    obj.image3:setWidth(60);
    obj.image3:setField("HI2");
    obj.image3:setHeight(70);
    obj.image3:setLeft(226);
    obj.image3:setTop(78);
    obj.image3:setName("image3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(213);
    obj.button2:setTop(67);
    obj.button2:setText("Clique");
    obj.button2:setOpacity(0.0);
    obj.button2:setWidth(90);
    obj.button2:setHeight(90);
    obj.button2:setName("button2");

    obj.H2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H2:setParent(obj);
    obj.H2:setLeft(640);
    obj.H2:setName("H2");
    obj.H2:setVisible(false);
    obj.H2:setTop(44);
    obj.H2:setWidth(150);
    obj.H2:setHeight(22);
    obj.H2:setField("NomeHabilidade2");

    obj.HL2 = GUI.fromHandle(_obj_newObject("label"));
    obj.HL2:setParent(obj);
    obj.HL2:setLeft(800);
    obj.HL2:setName("HL2");
    obj.HL2:setVisible(false);
    obj.HL2:setTop(40);
    obj.HL2:setFontSize(20);
    obj.HL2:setWidth(250);
    obj.HL2:setText("Segunda Habilidade");
    obj.HL2:setFontColor("Blue");
    obj.HL2:setAutoSize(true);

    obj.HD2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD2:setParent(obj);
    obj.HD2:setLeft(610);
    obj.HD2:setName("HD2");
    obj.HD2:setVisible(false);
    obj.HD2:setTop(320);
    obj.HD2:setWidth(50);
    obj.HD2:setHeight(20);
    obj.HD2:setField("DanoHabilidade2");

    obj.HPM2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM2:setParent(obj);
    obj.HPM2:setLeft(720);
    obj.HPM2:setName("HPM2");
    obj.HPM2:setVisible(false);
    obj.HPM2:setTop(320);
    obj.HPM2:setWidth(50);
    obj.HPM2:setHeight(20);
    obj.HPM2:setField("PMHabilidade2");

    obj.HPA2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA2:setParent(obj);
    obj.HPA2:setLeft(830);
    obj.HPA2:setName("HPA2");
    obj.HPA2:setVisible(false);
    obj.HPA2:setTop(320);
    obj.HPA2:setWidth(50);
    obj.HPA2:setHeight(20);
    obj.HPA2:setField("PAHabilidade2");

    obj.HPF2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF2:setParent(obj);
    obj.HPF2:setLeft(940);
    obj.HPF2:setName("HPF2");
    obj.HPF2:setVisible(false);
    obj.HPF2:setTop(320);
    obj.HPF2:setWidth(50);
    obj.HPF2:setHeight(20);
    obj.HPF2:setField("PFHabilidade2");

    obj.HC2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HC2:setParent(obj);
    obj.HC2:setLeft(610);
    obj.HC2:setName("HC2");
    obj.HC2:setVisible(false);
    obj.HC2:setTop(350);
    obj.HC2:setWidth(50);
    obj.HC2:setHeight(20);
    obj.HC2:setField("CuraHabilidade2");

    obj.HDEF2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HDEF2:setParent(obj);
    obj.HDEF2:setLeft(720);
    obj.HDEF2:setName("HDEF2");
    obj.HDEF2:setVisible(false);
    obj.HDEF2:setTop(350);
    obj.HDEF2:setWidth(50);
    obj.HDEF2:setHeight(20);
    obj.HDEF2:setField("DefHabilidade2");

    obj.HRES2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HRES2:setParent(obj);
    obj.HRES2:setLeft(830);
    obj.HRES2:setName("HRES2");
    obj.HRES2:setVisible(false);
    obj.HRES2:setTop(350);
    obj.HRES2:setWidth(50);
    obj.HRES2:setHeight(20);
    obj.HRES2:setField("ResHabilidade2");

    obj.HHP2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HHP2:setParent(obj);
    obj.HHP2:setLeft(830);
    obj.HHP2:setName("HHP2");
    obj.HHP2:setVisible(false);
    obj.HHP2:setTop(380);
    obj.HHP2:setWidth(50);
    obj.HHP2:setHeight(20);
    obj.HHP2:setField("HPHabilidade2");

    obj.HMP2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HMP2:setParent(obj);
    obj.HMP2:setLeft(940);
    obj.HMP2:setName("HMP2");
    obj.HMP2:setVisible(false);
    obj.HMP2:setTop(380);
    obj.HMP2:setWidth(50);
    obj.HMP2:setHeight(20);
    obj.HMP2:setField("MPHabilidade2");

    obj.HT2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT2:setParent(obj);
    obj.HT2:setLeft(565);
    obj.HT2:setTop(130);
    obj.HT2:setVisible(false);
    obj.HT2:setName("HT2");
    obj.HT2:setWidth(400);
    obj.HT2:setHeight(170);
    obj.HT2:setField("DescriHabilidade2");

    obj.HI2 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI2:setParent(obj);
    obj.HI2:setName("HI2");
    obj.HI2:setVisible(false);
    obj.HI2:setField("HI2");
    obj.HI2:setEditable(true);
    obj.HI2:setLeft(564);
    obj.HI2:setTop(397);
    obj.HI2:setWidth(214);
    obj.HI2:setHeight(130);

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj);
    obj.image4:setWidth(60);
    obj.image4:setField("HI3");
    obj.image4:setHeight(70);
    obj.image4:setLeft(360);
    obj.image4:setTop(78);
    obj.image4:setName("image4");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setLeft(346);
    obj.button3:setTop(67);
    obj.button3:setText("Clique");
    obj.button3:setOpacity(0.0);
    obj.button3:setWidth(90);
    obj.button3:setHeight(90);
    obj.button3:setName("button3");

    obj.H3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H3:setParent(obj);
    obj.H3:setLeft(640);
    obj.H3:setName("H3");
    obj.H3:setVisible(false);
    obj.H3:setTop(44);
    obj.H3:setWidth(150);
    obj.H3:setHeight(22);
    obj.H3:setField("NomeHabilidade3");

    obj.HL3 = GUI.fromHandle(_obj_newObject("label"));
    obj.HL3:setParent(obj);
    obj.HL3:setLeft(800);
    obj.HL3:setName("HL3");
    obj.HL3:setVisible(false);
    obj.HL3:setTop(40);
    obj.HL3:setFontSize(20);
    obj.HL3:setWidth(250);
    obj.HL3:setText("Terceira Habilidade");
    obj.HL3:setFontColor("Blue");
    obj.HL3:setAutoSize(true);

    obj.HD3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD3:setParent(obj);
    obj.HD3:setLeft(610);
    obj.HD3:setName("HD3");
    obj.HD3:setVisible(false);
    obj.HD3:setTop(320);
    obj.HD3:setWidth(50);
    obj.HD3:setHeight(20);
    obj.HD3:setField("DanoHabilidade3");

    obj.HPM3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM3:setParent(obj);
    obj.HPM3:setLeft(720);
    obj.HPM3:setName("HPM3");
    obj.HPM3:setVisible(false);
    obj.HPM3:setTop(320);
    obj.HPM3:setWidth(50);
    obj.HPM3:setHeight(20);
    obj.HPM3:setField("PMHabilidade3");

    obj.HPA3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA3:setParent(obj);
    obj.HPA3:setLeft(830);
    obj.HPA3:setName("HPA3");
    obj.HPA3:setVisible(false);
    obj.HPA3:setTop(320);
    obj.HPA3:setWidth(50);
    obj.HPA3:setHeight(20);
    obj.HPA3:setField("PAHabilidade3");

    obj.HPF3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF3:setParent(obj);
    obj.HPF3:setLeft(940);
    obj.HPF3:setName("HPF3");
    obj.HPF3:setVisible(false);
    obj.HPF3:setTop(320);
    obj.HPF3:setWidth(50);
    obj.HPF3:setHeight(20);
    obj.HPF3:setField("PFHabilidade3");

    obj.HC3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HC3:setParent(obj);
    obj.HC3:setLeft(610);
    obj.HC3:setName("HC3");
    obj.HC3:setVisible(false);
    obj.HC3:setTop(350);
    obj.HC3:setWidth(50);
    obj.HC3:setHeight(20);
    obj.HC3:setField("CuraHabilidade3");

    obj.HDEF3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HDEF3:setParent(obj);
    obj.HDEF3:setLeft(720);
    obj.HDEF3:setName("HDEF3");
    obj.HDEF3:setVisible(false);
    obj.HDEF3:setTop(350);
    obj.HDEF3:setWidth(50);
    obj.HDEF3:setHeight(20);
    obj.HDEF3:setField("DefHabilidade3");

    obj.HRES3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HRES3:setParent(obj);
    obj.HRES3:setLeft(830);
    obj.HRES3:setName("HRES3");
    obj.HRES3:setVisible(false);
    obj.HRES3:setTop(350);
    obj.HRES3:setWidth(50);
    obj.HRES3:setHeight(20);
    obj.HRES3:setField("ResHabilidade3");

    obj.HHP3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HHP3:setParent(obj);
    obj.HHP3:setLeft(830);
    obj.HHP3:setName("HHP3");
    obj.HHP3:setVisible(false);
    obj.HHP3:setTop(380);
    obj.HHP3:setWidth(50);
    obj.HHP3:setHeight(20);
    obj.HHP3:setField("HPHabilidade3");

    obj.HMP3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HMP3:setParent(obj);
    obj.HMP3:setLeft(940);
    obj.HMP3:setName("HMP3");
    obj.HMP3:setVisible(false);
    obj.HMP3:setTop(380);
    obj.HMP3:setWidth(50);
    obj.HMP3:setHeight(20);
    obj.HMP3:setField("MPHabilidade3");

    obj.HT3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT3:setParent(obj);
    obj.HT3:setLeft(565);
    obj.HT3:setName("HT3");
    obj.HT3:setTop(130);
    obj.HT3:setVisible(false);
    obj.HT3:setWidth(400);
    obj.HT3:setHeight(170);
    obj.HT3:setField("DescriHabilidade3");

    obj.HI3 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI3:setParent(obj);
    obj.HI3:setName("HI3");
    obj.HI3:setVisible(false);
    obj.HI3:setEditable(true);
    obj.HI3:setLeft(564);
    obj.HI3:setTop(397);
    obj.HI3:setWidth(214);
    obj.HI3:setHeight(130);
    obj.HI3:setField("HI3");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj);
    obj.image5:setWidth(60);
    obj.image5:setField("HI4");
    obj.image5:setHeight(70);
    obj.image5:setLeft(90);
    obj.image5:setTop(205);
    obj.image5:setName("image5");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj);
    obj.button4:setLeft(75);
    obj.button4:setTop(195);
    obj.button4:setText("Clique");
    obj.button4:setOpacity(0.0);
    obj.button4:setWidth(90);
    obj.button4:setHeight(90);
    obj.button4:setName("button4");

    obj.H4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H4:setParent(obj);
    obj.H4:setLeft(640);
    obj.H4:setName("H4");
    obj.H4:setVisible(false);
    obj.H4:setTop(44);
    obj.H4:setWidth(150);
    obj.H4:setHeight(22);
    obj.H4:setField("NomeHabilidade4");

    obj.HL4 = GUI.fromHandle(_obj_newObject("label"));
    obj.HL4:setParent(obj);
    obj.HL4:setLeft(800);
    obj.HL4:setName("HL4");
    obj.HL4:setVisible(false);
    obj.HL4:setTop(40);
    obj.HL4:setFontSize(20);
    obj.HL4:setWidth(250);
    obj.HL4:setText("Quarta Habilidade");
    obj.HL4:setFontColor("Blue");
    obj.HL4:setAutoSize(true);

    obj.HD4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD4:setParent(obj);
    obj.HD4:setLeft(610);
    obj.HD4:setName("HD4");
    obj.HD4:setVisible(false);
    obj.HD4:setTop(320);
    obj.HD4:setWidth(50);
    obj.HD4:setHeight(20);
    obj.HD4:setField("DanoHabilidade4");

    obj.HPM4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM4:setParent(obj);
    obj.HPM4:setLeft(720);
    obj.HPM4:setName("HPM4");
    obj.HPM4:setVisible(false);
    obj.HPM4:setTop(320);
    obj.HPM4:setWidth(50);
    obj.HPM4:setHeight(20);
    obj.HPM4:setField("PMHabilidade4");

    obj.HPA4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA4:setParent(obj);
    obj.HPA4:setLeft(830);
    obj.HPA4:setName("HPA4");
    obj.HPA4:setVisible(false);
    obj.HPA4:setTop(320);
    obj.HPA4:setWidth(50);
    obj.HPA4:setHeight(20);
    obj.HPA4:setField("PAHabilidade4");

    obj.HPF4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF4:setParent(obj);
    obj.HPF4:setLeft(940);
    obj.HPF4:setName("HPF4");
    obj.HPF4:setVisible(false);
    obj.HPF4:setTop(320);
    obj.HPF4:setWidth(50);
    obj.HPF4:setHeight(20);
    obj.HPF4:setField("PFHabilidade4");

    obj.HC4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HC4:setParent(obj);
    obj.HC4:setLeft(610);
    obj.HC4:setName("HC4");
    obj.HC4:setVisible(false);
    obj.HC4:setTop(350);
    obj.HC4:setWidth(50);
    obj.HC4:setHeight(20);
    obj.HC4:setField("CuraHabilidade4");

    obj.HDEF4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HDEF4:setParent(obj);
    obj.HDEF4:setLeft(720);
    obj.HDEF4:setName("HDEF4");
    obj.HDEF4:setVisible(false);
    obj.HDEF4:setTop(350);
    obj.HDEF4:setWidth(50);
    obj.HDEF4:setHeight(20);
    obj.HDEF4:setField("DefHabilidade4");

    obj.HRES4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HRES4:setParent(obj);
    obj.HRES4:setLeft(830);
    obj.HRES4:setName("HRES4");
    obj.HRES4:setVisible(false);
    obj.HRES4:setTop(350);
    obj.HRES4:setWidth(50);
    obj.HRES4:setHeight(20);
    obj.HRES4:setField("ResHabilidade4");

    obj.HHP4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HHP4:setParent(obj);
    obj.HHP4:setLeft(830);
    obj.HHP4:setName("HHP4");
    obj.HHP4:setVisible(false);
    obj.HHP4:setTop(380);
    obj.HHP4:setWidth(50);
    obj.HHP4:setHeight(20);
    obj.HHP4:setField("HPHabilidade4");

    obj.HMP4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HMP4:setParent(obj);
    obj.HMP4:setLeft(940);
    obj.HMP4:setName("HMP4");
    obj.HMP4:setVisible(false);
    obj.HMP4:setTop(380);
    obj.HMP4:setWidth(50);
    obj.HMP4:setHeight(20);
    obj.HMP4:setField("MPHabilidade4");

    obj.HT4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT4:setParent(obj);
    obj.HT4:setLeft(565);
    obj.HT4:setName("HT4");
    obj.HT4:setTop(130);
    obj.HT4:setVisible(false);
    obj.HT4:setWidth(400);
    obj.HT4:setHeight(170);
    obj.HT4:setField("DescriHabilidade4");

    obj.HI4 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI4:setParent(obj);
    obj.HI4:setName("HI4");
    obj.HI4:setVisible(false);
    obj.HI4:setEditable(true);
    obj.HI4:setLeft(564);
    obj.HI4:setTop(397);
    obj.HI4:setWidth(214);
    obj.HI4:setHeight(130);
    obj.HI4:setField("HI4");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj);
    obj.image6:setWidth(60);
    obj.image6:setField("HI5");
    obj.image6:setHeight(70);
    obj.image6:setLeft(227);
    obj.image6:setTop(205);
    obj.image6:setName("image6");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj);
    obj.button5:setLeft(213);
    obj.button5:setTop(195);
    obj.button5:setText("Clique");
    obj.button5:setOpacity(0.0);
    obj.button5:setWidth(90);
    obj.button5:setHeight(90);
    obj.button5:setName("button5");

    obj.H5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H5:setParent(obj);
    obj.H5:setLeft(640);
    obj.H5:setName("H5");
    obj.H5:setVisible(false);
    obj.H5:setTop(44);
    obj.H5:setWidth(150);
    obj.H5:setHeight(22);
    obj.H5:setField("NomeHabilidade5");

    obj.HL5 = GUI.fromHandle(_obj_newObject("label"));
    obj.HL5:setParent(obj);
    obj.HL5:setLeft(800);
    obj.HL5:setName("HL5");
    obj.HL5:setVisible(false);
    obj.HL5:setTop(40);
    obj.HL5:setFontSize(20);
    obj.HL5:setWidth(250);
    obj.HL5:setText("Quinta Habilidade");
    obj.HL5:setFontColor("Blue");
    obj.HL5:setAutoSize(true);

    obj.HD5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD5:setParent(obj);
    obj.HD5:setLeft(610);
    obj.HD5:setName("HD5");
    obj.HD5:setVisible(false);
    obj.HD5:setTop(320);
    obj.HD5:setWidth(50);
    obj.HD5:setHeight(20);
    obj.HD5:setField("DanoHabilidade5");

    obj.HPM5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM5:setParent(obj);
    obj.HPM5:setLeft(720);
    obj.HPM5:setName("HPM5");
    obj.HPM5:setVisible(false);
    obj.HPM5:setTop(320);
    obj.HPM5:setWidth(50);
    obj.HPM5:setHeight(20);
    obj.HPM5:setField("PMHabilidade5");

    obj.HPA5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA5:setParent(obj);
    obj.HPA5:setLeft(830);
    obj.HPA5:setName("HPA5");
    obj.HPA5:setVisible(false);
    obj.HPA5:setTop(320);
    obj.HPA5:setWidth(50);
    obj.HPA5:setHeight(20);
    obj.HPA5:setField("PAHabilidade5");

    obj.HPF5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF5:setParent(obj);
    obj.HPF5:setLeft(940);
    obj.HPF5:setName("HPF5");
    obj.HPF5:setVisible(false);
    obj.HPF5:setTop(320);
    obj.HPF5:setWidth(50);
    obj.HPF5:setHeight(20);
    obj.HPF5:setField("PFHabilidade5");

    obj.HC5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HC5:setParent(obj);
    obj.HC5:setLeft(610);
    obj.HC5:setName("HC5");
    obj.HC5:setVisible(false);
    obj.HC5:setTop(350);
    obj.HC5:setWidth(50);
    obj.HC5:setHeight(20);
    obj.HC5:setField("CuraHabilidade5");

    obj.HDEF5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HDEF5:setParent(obj);
    obj.HDEF5:setLeft(720);
    obj.HDEF5:setName("HDEF5");
    obj.HDEF5:setVisible(false);
    obj.HDEF5:setTop(350);
    obj.HDEF5:setWidth(50);
    obj.HDEF5:setHeight(20);
    obj.HDEF5:setField("DefHabilidade5");

    obj.HRES5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HRES5:setParent(obj);
    obj.HRES5:setLeft(830);
    obj.HRES5:setName("HRES5");
    obj.HRES5:setVisible(false);
    obj.HRES5:setTop(350);
    obj.HRES5:setWidth(50);
    obj.HRES5:setHeight(20);
    obj.HRES5:setField("ResHabilidade5");

    obj.HHP5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HHP5:setParent(obj);
    obj.HHP5:setLeft(830);
    obj.HHP5:setName("HHP5");
    obj.HHP5:setVisible(false);
    obj.HHP5:setTop(380);
    obj.HHP5:setWidth(50);
    obj.HHP5:setHeight(20);
    obj.HHP5:setField("HPHabilidade5");

    obj.HMP5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HMP5:setParent(obj);
    obj.HMP5:setLeft(940);
    obj.HMP5:setName("HMP5");
    obj.HMP5:setVisible(false);
    obj.HMP5:setTop(380);
    obj.HMP5:setWidth(50);
    obj.HMP5:setHeight(20);
    obj.HMP5:setField("MPHabilidade5");

    obj.HT5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT5:setParent(obj);
    obj.HT5:setLeft(565);
    obj.HT5:setName("HT5");
    obj.HT5:setTop(130);
    obj.HT5:setVisible(false);
    obj.HT5:setWidth(400);
    obj.HT5:setHeight(170);
    obj.HT5:setField("DescriHabilidade5");

    obj.HI5 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI5:setParent(obj);
    obj.HI5:setName("HI5");
    obj.HI5:setVisible(false);
    obj.HI5:setEditable(true);
    obj.HI5:setLeft(564);
    obj.HI5:setTop(397);
    obj.HI5:setWidth(214);
    obj.HI5:setHeight(130);
    obj.HI5:setField("HI5");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj);
    obj.image7:setWidth(60);
    obj.image7:setField("HI6");
    obj.image7:setHeight(70);
    obj.image7:setLeft(361);
    obj.image7:setTop(205);
    obj.image7:setName("image7");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj);
    obj.button6:setLeft(346);
    obj.button6:setTop(195);
    obj.button6:setText("Clique");
    obj.button6:setOpacity(0.0);
    obj.button6:setWidth(90);
    obj.button6:setHeight(90);
    obj.button6:setName("button6");

    obj.H6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H6:setParent(obj);
    obj.H6:setLeft(640);
    obj.H6:setName("H6");
    obj.H6:setVisible(false);
    obj.H6:setTop(44);
    obj.H6:setWidth(150);
    obj.H6:setHeight(22);
    obj.H6:setField("NomeHabilidade6");

    obj.HL6 = GUI.fromHandle(_obj_newObject("label"));
    obj.HL6:setParent(obj);
    obj.HL6:setLeft(800);
    obj.HL6:setName("HL6");
    obj.HL6:setVisible(false);
    obj.HL6:setTop(40);
    obj.HL6:setFontSize(20);
    obj.HL6:setWidth(250);
    obj.HL6:setText("Sexta Habilidade");
    obj.HL6:setFontColor("Blue");
    obj.HL6:setAutoSize(true);

    obj.HD6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD6:setParent(obj);
    obj.HD6:setLeft(610);
    obj.HD6:setName("HD6");
    obj.HD6:setVisible(false);
    obj.HD6:setTop(320);
    obj.HD6:setWidth(50);
    obj.HD6:setHeight(20);
    obj.HD6:setField("DanoHabilidade6");

    obj.HPM6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM6:setParent(obj);
    obj.HPM6:setLeft(720);
    obj.HPM6:setName("HPM6");
    obj.HPM6:setVisible(false);
    obj.HPM6:setTop(320);
    obj.HPM6:setWidth(50);
    obj.HPM6:setHeight(20);
    obj.HPM6:setField("PMHabilidade6");

    obj.HPA6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA6:setParent(obj);
    obj.HPA6:setLeft(830);
    obj.HPA6:setName("HPA6");
    obj.HPA6:setVisible(false);
    obj.HPA6:setTop(320);
    obj.HPA6:setWidth(50);
    obj.HPA6:setHeight(20);
    obj.HPA6:setField("PAHabilidade6");

    obj.HPF6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF6:setParent(obj);
    obj.HPF6:setLeft(940);
    obj.HPF6:setName("HPF6");
    obj.HPF6:setVisible(false);
    obj.HPF6:setTop(320);
    obj.HPF6:setWidth(50);
    obj.HPF6:setHeight(20);
    obj.HPF6:setField("PFHabilidade6");

    obj.HC6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HC6:setParent(obj);
    obj.HC6:setLeft(610);
    obj.HC6:setName("HC6");
    obj.HC6:setVisible(false);
    obj.HC6:setTop(350);
    obj.HC6:setWidth(50);
    obj.HC6:setHeight(20);
    obj.HC6:setField("CuraHabilidade6");

    obj.HDEF6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HDEF6:setParent(obj);
    obj.HDEF6:setLeft(720);
    obj.HDEF6:setName("HDEF6");
    obj.HDEF6:setVisible(false);
    obj.HDEF6:setTop(350);
    obj.HDEF6:setWidth(50);
    obj.HDEF6:setHeight(20);
    obj.HDEF6:setField("DefHabilidade6");

    obj.HRES6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HRES6:setParent(obj);
    obj.HRES6:setLeft(830);
    obj.HRES6:setName("HRES6");
    obj.HRES6:setVisible(false);
    obj.HRES6:setTop(350);
    obj.HRES6:setWidth(50);
    obj.HRES6:setHeight(20);
    obj.HRES6:setField("ResHabilidade6");

    obj.HHP6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HHP6:setParent(obj);
    obj.HHP6:setLeft(830);
    obj.HHP6:setName("HHP6");
    obj.HHP6:setVisible(false);
    obj.HHP6:setTop(380);
    obj.HHP6:setWidth(50);
    obj.HHP6:setHeight(20);
    obj.HHP6:setField("HPHabilidade6");

    obj.HMP6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HMP6:setParent(obj);
    obj.HMP6:setLeft(940);
    obj.HMP6:setName("HMP6");
    obj.HMP6:setVisible(false);
    obj.HMP6:setTop(380);
    obj.HMP6:setWidth(50);
    obj.HMP6:setHeight(20);
    obj.HMP6:setField("MPHabilidade6");

    obj.HT6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT6:setParent(obj);
    obj.HT6:setLeft(565);
    obj.HT6:setName("HT6");
    obj.HT6:setTop(130);
    obj.HT6:setVisible(false);
    obj.HT6:setWidth(400);
    obj.HT6:setHeight(170);
    obj.HT6:setField("DescriHabilidade6");

    obj.HI6 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI6:setParent(obj);
    obj.HI6:setName("HI6");
    obj.HI6:setVisible(false);
    obj.HI6:setEditable(true);
    obj.HI6:setLeft(564);
    obj.HI6:setTop(397);
    obj.HI6:setWidth(214);
    obj.HI6:setHeight(130);
    obj.HI6:setField("HI6");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj);
    obj.image8:setWidth(60);
    obj.image8:setField("HI7");
    obj.image8:setHeight(70);
    obj.image8:setLeft(90);
    obj.image8:setTop(325);
    obj.image8:setName("image8");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj);
    obj.button7:setLeft(75);
    obj.button7:setTop(315);
    obj.button7:setText("Clique");
    obj.button7:setOpacity(0.0);
    obj.button7:setWidth(90);
    obj.button7:setHeight(90);
    obj.button7:setName("button7");

    obj.H7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H7:setParent(obj);
    obj.H7:setLeft(640);
    obj.H7:setName("H7");
    obj.H7:setVisible(false);
    obj.H7:setTop(44);
    obj.H7:setWidth(150);
    obj.H7:setHeight(22);
    obj.H7:setField("NomeHabilidade7");

    obj.HL7 = GUI.fromHandle(_obj_newObject("label"));
    obj.HL7:setParent(obj);
    obj.HL7:setLeft(800);
    obj.HL7:setName("HL7");
    obj.HL7:setVisible(false);
    obj.HL7:setTop(40);
    obj.HL7:setFontSize(20);
    obj.HL7:setWidth(250);
    obj.HL7:setText("Setima Habilidade");
    obj.HL7:setFontColor("Blue");
    obj.HL7:setAutoSize(true);

    obj.HD7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD7:setParent(obj);
    obj.HD7:setLeft(610);
    obj.HD7:setName("HD7");
    obj.HD7:setVisible(false);
    obj.HD7:setTop(320);
    obj.HD7:setWidth(50);
    obj.HD7:setHeight(20);
    obj.HD7:setField("DanoHabilidade7");

    obj.HPM7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM7:setParent(obj);
    obj.HPM7:setLeft(720);
    obj.HPM7:setName("HPM7");
    obj.HPM7:setVisible(false);
    obj.HPM7:setTop(320);
    obj.HPM7:setWidth(50);
    obj.HPM7:setHeight(20);
    obj.HPM7:setField("PMHabilidade7");

    obj.HPA7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA7:setParent(obj);
    obj.HPA7:setLeft(830);
    obj.HPA7:setName("HPA7");
    obj.HPA7:setVisible(false);
    obj.HPA7:setTop(320);
    obj.HPA7:setWidth(50);
    obj.HPA7:setHeight(20);
    obj.HPA7:setField("PAHabilidade7");

    obj.HPF7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF7:setParent(obj);
    obj.HPF7:setLeft(940);
    obj.HPF7:setName("HPF7");
    obj.HPF7:setVisible(false);
    obj.HPF7:setTop(320);
    obj.HPF7:setWidth(50);
    obj.HPF7:setHeight(20);
    obj.HPF7:setField("PFHabilidade7");

    obj.HC7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HC7:setParent(obj);
    obj.HC7:setLeft(610);
    obj.HC7:setName("HC7");
    obj.HC7:setVisible(false);
    obj.HC7:setTop(350);
    obj.HC7:setWidth(50);
    obj.HC7:setHeight(20);
    obj.HC7:setField("CuraHabilidade7");

    obj.HDEF7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HDEF7:setParent(obj);
    obj.HDEF7:setLeft(720);
    obj.HDEF7:setName("HDEF7");
    obj.HDEF7:setVisible(false);
    obj.HDEF7:setTop(350);
    obj.HDEF7:setWidth(50);
    obj.HDEF7:setHeight(20);
    obj.HDEF7:setField("DefHabilidade7");

    obj.HRES7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HRES7:setParent(obj);
    obj.HRES7:setLeft(830);
    obj.HRES7:setName("HRES7");
    obj.HRES7:setVisible(false);
    obj.HRES7:setTop(350);
    obj.HRES7:setWidth(50);
    obj.HRES7:setHeight(20);
    obj.HRES7:setField("ResHabilidade7");

    obj.HHP7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HHP7:setParent(obj);
    obj.HHP7:setLeft(830);
    obj.HHP7:setName("HHP7");
    obj.HHP7:setVisible(false);
    obj.HHP7:setTop(380);
    obj.HHP7:setWidth(50);
    obj.HHP7:setHeight(20);
    obj.HHP7:setField("HPHabilidade7");

    obj.HMP7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HMP7:setParent(obj);
    obj.HMP7:setLeft(940);
    obj.HMP7:setName("HMP7");
    obj.HMP7:setVisible(false);
    obj.HMP7:setTop(380);
    obj.HMP7:setWidth(50);
    obj.HMP7:setHeight(20);
    obj.HMP7:setField("MPHabilidade7");

    obj.HT7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT7:setParent(obj);
    obj.HT7:setLeft(565);
    obj.HT7:setName("HT7");
    obj.HT7:setTop(130);
    obj.HT7:setVisible(false);
    obj.HT7:setWidth(400);
    obj.HT7:setHeight(170);
    obj.HT7:setField("DescriHabilidade7");

    obj.HI7 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI7:setParent(obj);
    obj.HI7:setName("HI7");
    obj.HI7:setVisible(false);
    obj.HI7:setEditable(true);
    obj.HI7:setLeft(564);
    obj.HI7:setTop(397);
    obj.HI7:setWidth(214);
    obj.HI7:setHeight(130);
    obj.HI7:setField("HI7");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj);
    obj.image9:setWidth(60);
    obj.image9:setField("HI8");
    obj.image9:setHeight(70);
    obj.image9:setLeft(227);
    obj.image9:setTop(325);
    obj.image9:setName("image9");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj);
    obj.button8:setLeft(213);
    obj.button8:setTop(315);
    obj.button8:setText("Clique");
    obj.button8:setOpacity(0.0);
    obj.button8:setWidth(90);
    obj.button8:setHeight(90);
    obj.button8:setName("button8");

    obj.H8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H8:setParent(obj);
    obj.H8:setLeft(640);
    obj.H8:setName("H8");
    obj.H8:setVisible(false);
    obj.H8:setTop(44);
    obj.H8:setWidth(150);
    obj.H8:setHeight(22);
    obj.H8:setField("NomeHabilidade8");

    obj.HL8 = GUI.fromHandle(_obj_newObject("label"));
    obj.HL8:setParent(obj);
    obj.HL8:setLeft(800);
    obj.HL8:setName("HL8");
    obj.HL8:setVisible(false);
    obj.HL8:setTop(40);
    obj.HL8:setFontSize(20);
    obj.HL8:setWidth(250);
    obj.HL8:setText("Oitava Habilidade");
    obj.HL8:setFontColor("Blue");
    obj.HL8:setAutoSize(true);

    obj.HD8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD8:setParent(obj);
    obj.HD8:setLeft(610);
    obj.HD8:setName("HD8");
    obj.HD8:setVisible(false);
    obj.HD8:setTop(320);
    obj.HD8:setWidth(50);
    obj.HD8:setHeight(20);
    obj.HD8:setField("DanoHabilidade8");

    obj.HPM8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM8:setParent(obj);
    obj.HPM8:setLeft(720);
    obj.HPM8:setName("HPM8");
    obj.HPM8:setVisible(false);
    obj.HPM8:setTop(320);
    obj.HPM8:setWidth(50);
    obj.HPM8:setHeight(20);
    obj.HPM8:setField("PMHabilidade8");

    obj.HPA8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA8:setParent(obj);
    obj.HPA8:setLeft(830);
    obj.HPA8:setName("HPA8");
    obj.HPA8:setVisible(false);
    obj.HPA8:setTop(320);
    obj.HPA8:setWidth(50);
    obj.HPA8:setHeight(20);
    obj.HPA8:setField("PAHabilidade8");

    obj.HPF8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF8:setParent(obj);
    obj.HPF8:setLeft(940);
    obj.HPF8:setName("HPF8");
    obj.HPF8:setVisible(false);
    obj.HPF8:setTop(320);
    obj.HPF8:setWidth(50);
    obj.HPF8:setHeight(20);
    obj.HPF8:setField("PFHabilidade8");

    obj.HC8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HC8:setParent(obj);
    obj.HC8:setLeft(610);
    obj.HC8:setName("HC8");
    obj.HC8:setVisible(false);
    obj.HC8:setTop(350);
    obj.HC8:setWidth(50);
    obj.HC8:setHeight(20);
    obj.HC8:setField("CuraHabilidade8");

    obj.HDEF8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HDEF8:setParent(obj);
    obj.HDEF8:setLeft(720);
    obj.HDEF8:setName("HDEF8");
    obj.HDEF8:setVisible(false);
    obj.HDEF8:setTop(350);
    obj.HDEF8:setWidth(50);
    obj.HDEF8:setHeight(20);
    obj.HDEF8:setField("DefHabilidade8");

    obj.HRES8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HRES8:setParent(obj);
    obj.HRES8:setLeft(830);
    obj.HRES8:setName("HRES8");
    obj.HRES8:setVisible(false);
    obj.HRES8:setTop(350);
    obj.HRES8:setWidth(50);
    obj.HRES8:setHeight(20);
    obj.HRES8:setField("ResHabilidade8");

    obj.HHP8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HHP8:setParent(obj);
    obj.HHP8:setLeft(830);
    obj.HHP8:setName("HHP8");
    obj.HHP8:setVisible(false);
    obj.HHP8:setTop(380);
    obj.HHP8:setWidth(50);
    obj.HHP8:setHeight(20);
    obj.HHP8:setField("HPHabilidade8");

    obj.HMP8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HMP8:setParent(obj);
    obj.HMP8:setLeft(940);
    obj.HMP8:setName("HMP8");
    obj.HMP8:setVisible(false);
    obj.HMP8:setTop(380);
    obj.HMP8:setWidth(50);
    obj.HMP8:setHeight(20);
    obj.HMP8:setField("MPHabilidade8");

    obj.HT8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT8:setParent(obj);
    obj.HT8:setLeft(565);
    obj.HT8:setName("HT8");
    obj.HT8:setTop(130);
    obj.HT8:setVisible(false);
    obj.HT8:setWidth(400);
    obj.HT8:setHeight(170);
    obj.HT8:setField("DescriHabilidade8");

    obj.HI8 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI8:setParent(obj);
    obj.HI8:setName("HI8");
    obj.HI8:setVisible(false);
    obj.HI8:setEditable(true);
    obj.HI8:setLeft(564);
    obj.HI8:setTop(397);
    obj.HI8:setWidth(214);
    obj.HI8:setHeight(130);
    obj.HI8:setField("HI8");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj);
    obj.image10:setWidth(60);
    obj.image10:setField("HI9");
    obj.image10:setHeight(70);
    obj.image10:setLeft(361);
    obj.image10:setTop(325);
    obj.image10:setName("image10");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj);
    obj.button9:setLeft(346);
    obj.button9:setTop(315);
    obj.button9:setText("Clique");
    obj.button9:setOpacity(0.0);
    obj.button9:setWidth(90);
    obj.button9:setHeight(90);
    obj.button9:setName("button9");

    obj.H9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.H9:setParent(obj);
    obj.H9:setLeft(640);
    obj.H9:setName("H9");
    obj.H9:setVisible(false);
    obj.H9:setTop(44);
    obj.H9:setWidth(150);
    obj.H9:setHeight(22);
    obj.H9:setField("NomeHabilidade9");

    obj.HL9 = GUI.fromHandle(_obj_newObject("label"));
    obj.HL9:setParent(obj);
    obj.HL9:setLeft(800);
    obj.HL9:setName("HL9");
    obj.HL9:setVisible(false);
    obj.HL9:setTop(40);
    obj.HL9:setFontSize(20);
    obj.HL9:setWidth(250);
    obj.HL9:setText("Nona Habilidade");
    obj.HL9:setFontColor("Blue");
    obj.HL9:setAutoSize(true);

    obj.HD9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HD9:setParent(obj);
    obj.HD9:setLeft(610);
    obj.HD9:setName("HD9");
    obj.HD9:setVisible(false);
    obj.HD9:setTop(320);
    obj.HD9:setWidth(50);
    obj.HD9:setHeight(20);
    obj.HD9:setField("DanoHabilidade9");

    obj.HPM9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPM9:setParent(obj);
    obj.HPM9:setLeft(720);
    obj.HPM9:setName("HPM9");
    obj.HPM9:setVisible(false);
    obj.HPM9:setTop(320);
    obj.HPM9:setWidth(50);
    obj.HPM9:setHeight(20);
    obj.HPM9:setField("PMHabilidade9");

    obj.HPA9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPA9:setParent(obj);
    obj.HPA9:setLeft(830);
    obj.HPA9:setName("HPA9");
    obj.HPA9:setVisible(false);
    obj.HPA9:setTop(320);
    obj.HPA9:setWidth(50);
    obj.HPA9:setHeight(20);
    obj.HPA9:setField("PAHabilidade9");

    obj.HPF9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HPF9:setParent(obj);
    obj.HPF9:setLeft(940);
    obj.HPF9:setName("HPF9");
    obj.HPF9:setVisible(false);
    obj.HPF9:setTop(320);
    obj.HPF9:setWidth(50);
    obj.HPF9:setHeight(20);
    obj.HPF9:setField("PFHabilidade9");

    obj.HC9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HC9:setParent(obj);
    obj.HC9:setLeft(610);
    obj.HC9:setName("HC9");
    obj.HC9:setVisible(false);
    obj.HC9:setTop(350);
    obj.HC9:setWidth(50);
    obj.HC9:setHeight(20);
    obj.HC9:setField("CuraHabilidade9");

    obj.HDEF9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HDEF9:setParent(obj);
    obj.HDEF9:setLeft(720);
    obj.HDEF9:setName("HDEF9");
    obj.HDEF9:setVisible(false);
    obj.HDEF9:setTop(350);
    obj.HDEF9:setWidth(50);
    obj.HDEF9:setHeight(20);
    obj.HDEF9:setField("DefHabilidade9");

    obj.HRES9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HRES9:setParent(obj);
    obj.HRES9:setLeft(830);
    obj.HRES9:setName("HRES9");
    obj.HRES9:setVisible(false);
    obj.HRES9:setTop(350);
    obj.HRES9:setWidth(50);
    obj.HRES9:setHeight(20);
    obj.HRES9:setField("ResHabilidade9");

    obj.HHP9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HHP9:setParent(obj);
    obj.HHP9:setLeft(830);
    obj.HHP9:setName("HHP9");
    obj.HHP9:setVisible(false);
    obj.HHP9:setTop(380);
    obj.HHP9:setWidth(50);
    obj.HHP9:setHeight(20);
    obj.HHP9:setField("HPHabilidade9");

    obj.HMP9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.HMP9:setParent(obj);
    obj.HMP9:setLeft(940);
    obj.HMP9:setName("HMP9");
    obj.HMP9:setVisible(false);
    obj.HMP9:setTop(380);
    obj.HMP9:setWidth(50);
    obj.HMP9:setHeight(20);
    obj.HMP9:setField("MPHabilidade9");

    obj.HT9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.HT9:setParent(obj);
    obj.HT9:setLeft(565);
    obj.HT9:setName("HT9");
    obj.HT9:setTop(130);
    obj.HT9:setVisible(false);
    obj.HT9:setWidth(400);
    obj.HT9:setHeight(170);
    obj.HT9:setField("DescriHabilidade9");

    obj.HI9 = GUI.fromHandle(_obj_newObject("image"));
    obj.HI9:setParent(obj);
    obj.HI9:setName("HI9");
    obj.HI9:setVisible(false);
    obj.HI9:setEditable(true);
    obj.HI9:setLeft(564);
    obj.HI9:setTop(397);
    obj.HI9:setWidth(214);
    obj.HI9:setHeight(130);
    obj.HI9:setField("HI9");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj);
    obj.image11:setWidth(80);
    obj.image11:setField("UI1");
    obj.image11:setHeight(100);
    obj.image11:setLeft(133);
    obj.image11:setTop(455);
    obj.image11:setName("image11");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj);
    obj.button10:setLeft(120);
    obj.button10:setTop(450);
    obj.button10:setText("Clique");
    obj.button10:setOpacity(0.0);
    obj.button10:setWidth(110);
    obj.button10:setHeight(110);
    obj.button10:setName("button10");

    obj.U1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.U1:setParent(obj);
    obj.U1:setLeft(640);
    obj.U1:setName("U1");
    obj.U1:setVisible(false);
    obj.U1:setTop(44);
    obj.U1:setWidth(150);
    obj.U1:setHeight(22);
    obj.U1:setField("NomeUltima1");

    obj.UL1 = GUI.fromHandle(_obj_newObject("label"));
    obj.UL1:setParent(obj);
    obj.UL1:setLeft(800);
    obj.UL1:setName("UL1");
    obj.UL1:setVisible(false);
    obj.UL1:setTop(40);
    obj.UL1:setFontSize(20);
    obj.UL1:setWidth(250);
    obj.UL1:setText("Primeira Ultima");
    obj.UL1:setFontColor("Blue");
    obj.UL1:setAutoSize(true);

    obj.UD1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UD1:setParent(obj);
    obj.UD1:setLeft(610);
    obj.UD1:setName("UD1");
    obj.UD1:setVisible(false);
    obj.UD1:setTop(320);
    obj.UD1:setWidth(50);
    obj.UD1:setHeight(20);
    obj.UD1:setField("DanoUltima1");

    obj.UPM1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPM1:setParent(obj);
    obj.UPM1:setLeft(720);
    obj.UPM1:setName("UPM1");
    obj.UPM1:setVisible(false);
    obj.UPM1:setTop(320);
    obj.UPM1:setWidth(50);
    obj.UPM1:setHeight(20);
    obj.UPM1:setField("PMUltima1");

    obj.UPA1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPA1:setParent(obj);
    obj.UPA1:setLeft(830);
    obj.UPA1:setName("UPA1");
    obj.UPA1:setVisible(false);
    obj.UPA1:setTop(320);
    obj.UPA1:setWidth(50);
    obj.UPA1:setHeight(20);
    obj.UPA1:setField("PAUltima1");

    obj.UPF1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPF1:setParent(obj);
    obj.UPF1:setLeft(940);
    obj.UPF1:setName("UPF1");
    obj.UPF1:setVisible(false);
    obj.UPF1:setTop(320);
    obj.UPF1:setWidth(50);
    obj.UPF1:setHeight(20);
    obj.UPF1:setField("PFUltima1");

    obj.UHP1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UHP1:setParent(obj);
    obj.UHP1:setLeft(830);
    obj.UHP1:setName("UHP1");
    obj.UHP1:setVisible(false);
    obj.UHP1:setTop(380);
    obj.UHP1:setWidth(50);
    obj.UHP1:setHeight(20);
    obj.UHP1:setField("HPUltima1");

    obj.UMP1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UMP1:setParent(obj);
    obj.UMP1:setLeft(940);
    obj.UMP1:setName("UMP1");
    obj.UMP1:setVisible(false);
    obj.UMP1:setTop(380);
    obj.UMP1:setWidth(50);
    obj.UMP1:setHeight(20);
    obj.UMP1:setField("MPUltima1");

    obj.UC1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UC1:setParent(obj);
    obj.UC1:setLeft(610);
    obj.UC1:setName("UC1");
    obj.UC1:setVisible(false);
    obj.UC1:setTop(350);
    obj.UC1:setWidth(50);
    obj.UC1:setHeight(20);
    obj.UC1:setField("CuraUltima1");

    obj.UDEF1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UDEF1:setParent(obj);
    obj.UDEF1:setLeft(720);
    obj.UDEF1:setName("UDEF1");
    obj.UDEF1:setVisible(false);
    obj.UDEF1:setTop(350);
    obj.UDEF1:setWidth(50);
    obj.UDEF1:setHeight(20);
    obj.UDEF1:setField("DefUltima1");

    obj.URES1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.URES1:setParent(obj);
    obj.URES1:setLeft(830);
    obj.URES1:setName("URES1");
    obj.URES1:setVisible(false);
    obj.URES1:setTop(350);
    obj.URES1:setWidth(50);
    obj.URES1:setHeight(20);
    obj.URES1:setField("ResUltima1");

    obj.UT1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.UT1:setParent(obj);
    obj.UT1:setLeft(565);
    obj.UT1:setName("UT1");
    obj.UT1:setTop(130);
    obj.UT1:setVisible(false);
    obj.UT1:setWidth(400);
    obj.UT1:setHeight(170);
    obj.UT1:setField("DescriUltima1");

    obj.UI1 = GUI.fromHandle(_obj_newObject("image"));
    obj.UI1:setParent(obj);
    obj.UI1:setName("UI1");
    obj.UI1:setVisible(false);
    obj.UI1:setEditable(true);
    obj.UI1:setLeft(564);
    obj.UI1:setTop(397);
    obj.UI1:setWidth(214);
    obj.UI1:setHeight(130);
    obj.UI1:setField("UI1");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj);
    obj.image12:setWidth(80);
    obj.image12:setField("UI2");
    obj.image12:setHeight(100);
    obj.image12:setLeft(284);
    obj.image12:setTop(455);
    obj.image12:setName("image12");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj);
    obj.button11:setLeft(268);
    obj.button11:setTop(450);
    obj.button11:setText("Clique");
    obj.button11:setOpacity(0.0);
    obj.button11:setWidth(110);
    obj.button11:setHeight(110);
    obj.button11:setName("button11");

    obj.U2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.U2:setParent(obj);
    obj.U2:setLeft(640);
    obj.U2:setName("U2");
    obj.U2:setVisible(false);
    obj.U2:setTop(44);
    obj.U2:setWidth(150);
    obj.U2:setHeight(22);
    obj.U2:setField("NomeUltima2");

    obj.UL2 = GUI.fromHandle(_obj_newObject("label"));
    obj.UL2:setParent(obj);
    obj.UL2:setLeft(800);
    obj.UL2:setName("UL2");
    obj.UL2:setVisible(false);
    obj.UL2:setTop(40);
    obj.UL2:setFontSize(20);
    obj.UL2:setWidth(250);
    obj.UL2:setText("Segunda Ultima");
    obj.UL2:setFontColor("Blue");
    obj.UL2:setAutoSize(true);

    obj.UD2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UD2:setParent(obj);
    obj.UD2:setLeft(610);
    obj.UD2:setName("UD2");
    obj.UD2:setVisible(false);
    obj.UD2:setTop(320);
    obj.UD2:setWidth(50);
    obj.UD2:setHeight(20);
    obj.UD2:setField("DanoUltima2");

    obj.UPM2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPM2:setParent(obj);
    obj.UPM2:setLeft(720);
    obj.UPM2:setName("UPM2");
    obj.UPM2:setVisible(false);
    obj.UPM2:setTop(320);
    obj.UPM2:setWidth(50);
    obj.UPM2:setHeight(20);
    obj.UPM2:setField("PMUltima2");

    obj.UPA2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPA2:setParent(obj);
    obj.UPA2:setLeft(830);
    obj.UPA2:setName("UPA2");
    obj.UPA2:setVisible(false);
    obj.UPA2:setTop(320);
    obj.UPA2:setWidth(50);
    obj.UPA2:setHeight(20);
    obj.UPA2:setField("PAUltima2");

    obj.UPF2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UPF2:setParent(obj);
    obj.UPF2:setLeft(940);
    obj.UPF2:setName("UPF2");
    obj.UPF2:setVisible(false);
    obj.UPF2:setTop(320);
    obj.UPF2:setWidth(50);
    obj.UPF2:setHeight(20);
    obj.UPF2:setField("PFUltima2");

    obj.UHP2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UHP2:setParent(obj);
    obj.UHP2:setLeft(830);
    obj.UHP2:setName("UHP2");
    obj.UHP2:setVisible(false);
    obj.UHP2:setTop(380);
    obj.UHP2:setWidth(50);
    obj.UHP2:setHeight(20);
    obj.UHP2:setField("HPUltima2");

    obj.UMP2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UMP2:setParent(obj);
    obj.UMP2:setLeft(940);
    obj.UMP2:setName("UMP2");
    obj.UMP2:setVisible(false);
    obj.UMP2:setTop(380);
    obj.UMP2:setWidth(50);
    obj.UMP2:setHeight(20);
    obj.UMP2:setField("MPUltima2");

    obj.UC2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UC2:setParent(obj);
    obj.UC2:setLeft(610);
    obj.UC2:setName("UC2");
    obj.UC2:setVisible(false);
    obj.UC2:setTop(350);
    obj.UC2:setWidth(50);
    obj.UC2:setHeight(20);
    obj.UC2:setField("CuraUltima2");

    obj.UDEF2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.UDEF2:setParent(obj);
    obj.UDEF2:setLeft(720);
    obj.UDEF2:setName("UDEF2");
    obj.UDEF2:setVisible(false);
    obj.UDEF2:setTop(350);
    obj.UDEF2:setWidth(50);
    obj.UDEF2:setHeight(20);
    obj.UDEF2:setField("DefUltima2");

    obj.URES2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.URES2:setParent(obj);
    obj.URES2:setLeft(830);
    obj.URES2:setName("URES2");
    obj.URES2:setVisible(false);
    obj.URES2:setTop(350);
    obj.URES2:setWidth(50);
    obj.URES2:setHeight(20);
    obj.URES2:setField("ResUltima2");

    obj.UT2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.UT2:setParent(obj);
    obj.UT2:setLeft(565);
    obj.UT2:setName("UT2");
    obj.UT2:setTop(130);
    obj.UT2:setVisible(false);
    obj.UT2:setWidth(400);
    obj.UT2:setHeight(170);
    obj.UT2:setField("DescriUltima2");

    obj.UI2 = GUI.fromHandle(_obj_newObject("image"));
    obj.UI2:setParent(obj);
    obj.UI2:setName("UI2");
    obj.UI2:setVisible(false);
    obj.UI2:setEditable(true);
    obj.UI2:setLeft(564);
    obj.UI2:setTop(397);
    obj.UI2:setWidth(214);
    obj.UI2:setHeight(130);
    obj.UI2:setField("UI2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.H1.visible = not self.H1.visible;
            			  self.HL1.visible = not self.HL1.visible;
            				self.HT1.visible = not self.HT1.visible;
            				self.HD1.visible = not self.HD1.visible;
            				self.HPM1.visible = not self.HPM1.visible;
            				self.HPA1.visible = not self.HPA1.visible;
            				self.HPF1.visible = not self.HPF1.visible;
            				
            				self.HC1.visible = not self.HC1.visible;
            				self.HDEF1.visible = not self.HDEF1.visible;
            				self.HRES1.visible = not self.HRES1.visible;
            				self.HI1.visible = not self.HI1.visible;
            				self.HHP1.visible = not self.HHP1.visible;
            				self.HMP1.visible = not self.HMP1.visible;
            				
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HHP2.visible = false;
            				self.HMP2.visible = false;				
            								
            				self.HC2.visible = false;
            				self.HDEF2.visible = false;
            				self.HRES2.visible = false;
            				self.HI2.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HHP3.visible = false;
            				self.HMP3.visible = false;				
            									
            				self.HC3.visible = false;
            				self.HDEF3.visible = false;
            				self.HRES3.visible = false;
            				self.HI3.visible = false;
            				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HHP4.visible = false;
            				self.HMP4.visible = false;				
            									
            				self.HC4.visible = false;
            				self.HDEF4.visible = false;
            				self.HRES4.visible = false;
            				self.HI4.visible = false;
            				
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HHP5.visible = false;
            				self.HMP5.visible = false;				
            											
            				self.HC5.visible = false;
            				self.HDEF5.visible = false;
            				self.HRES5.visible = false;
            				self.HI5.visible = false;
            				
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HHP6.visible = false;
            				self.HMP6.visible = false;				
            									
            				self.HC6.visible = false;
            				self.HDEF6.visible = false;
            				self.HRES6.visible = false;
            				self.HI6.visible = false;
            				
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HHP7.visible = false;
            				self.HMP7.visible = false;				
            								
            				self.HC7.visible = false;
            				self.HDEF7.visible = false;
            				self.HRES7.visible = false;
            				self.HI7.visible = false;
            				
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HHP8.visible = false;
            				self.HMP8.visible = false;				
            								
            				self.HC8.visible = false;
            				self.HDEF8.visible = false;
            				self.HRES8.visible = false;
            				self.HI8.visible = false;
            				
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HHP9.visible = false;
            				self.HMP9.visible = false;				
            								
            				self.HC9.visible = false;
            				self.HDEF9.visible = false;
            				self.HRES9.visible = false;
            				self.HI9.visible = false;
            				
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				
            				self.UC1.visible = false;
            				self.UDEF1.visible = false;
            				self.URES1.visible = false;
            				self.UI1.visible = false;
            				
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UHP2.visible = false;
            				self.UMP2.visible = false;		
            				self.UHP1.visible = false;
            				self.UMP1.visible = false;		
            								
            				self.UC2.visible = false;
            				self.UDEF2.visible = false;
            				self.URES2.visible = false;
            				self.UI2.visible = false
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            self.H2.visible = not self.H2.visible;
            				self.HL2.visible = not self.HL2.visible;
            				self.HT2.visible = not self.HT2.visible;
            				self.HD2.visible = not self.HD2.visible;
            				self.HPM2.visible = not self.HPM2.visible;
            				self.HPA2.visible = not self.HPA2.visible;
            				self.HPF2.visible = not self.HPF2.visible;
            				self.HHP2.visible = not self.HHP2.visible;
            				self.HMP2.visible = not self.HMP2.visible;
            				
            				self.HC2.visible = not self.HC2.visible;
            				self.HDEF2.visible = not self.HDEF2.visible;
            				self.HRES2.visible = not self.HRES2.visible;
            				self.HI2.visible = not self.HI2.visible;
            				
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				
            				self.HC1.visible = false;
            				self.HDEF1.visible = false;
            				self.HRES1.visible = false;
            				self.HI1.visible = false;
            				self.HHP1.visible = false;
            				self.HMP1.visible = false;
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HHP3.visible = false;
            				self.HMP3.visible = false;				
            									
            				self.HC3.visible = false;
            				self.HDEF3.visible = false;
            				self.HRES3.visible = false;
            				self.HI3.visible = false;
            				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HHP4.visible = false;
            				self.HMP4.visible = false;				
            								
            				self.HC4.visible = false;
            				self.HDEF4.visible = false;
            				self.HRES4.visible = false;
            				self.HI4.visible = false;
            				
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HHP5.visible = false;
            				self.HMP5.visible = false;				
            											
            				self.HC5.visible = false;
            				self.HDEF5.visible = false;
            				self.HRES5.visible = false;
            				self.HI5.visible = false;
            				
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HHP6.visible = false;
            				self.HMP6.visible = false;				
            								
            				self.HC6.visible = false;
            				self.HDEF6.visible = false;
            				self.HRES6.visible = false;
            				self.HI6.visible = false;
            				
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HHP7.visible = false;
            				self.HMP7.visible = false;				
            								
            				self.HC7.visible = false;
            				self.HDEF7.visible = false;
            				self.HRES7.visible = false;
            				self.HI7.visible = false;
            				
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HHP8.visible = false;
            				self.HMP8.visible = false;				
            									
            				self.HC8.visible = false;
            				self.HDEF8.visible = false;
            				self.HRES8.visible = false;
            				self.HI8.visible = false;
            				
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HHP9.visible = false;
            				self.HMP9.visible = false;				
            								
            				self.HC9.visible = false;
            				self.HDEF9.visible = false;
            				self.HRES9.visible = false;
            				self.HI9.visible = false;
            				
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				
            				self.UC1.visible = false;
            				self.UDEF1.visible = false;
            				self.URES1.visible = false;
            				self.UI1.visible = false;
            				
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UHP2.visible = false;
            				self.UMP2.visible = false;		
            				self.UHP1.visible = false;
            				self.UMP1.visible = false;		
            																
            				self.UC2.visible = false;
            				self.UDEF2.visible = false;
            				self.URES2.visible = false;
            				self.UI2.visible = false
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            self.H3.visible = not self.H3.visible;
            				self.HL3.visible = not self.HL3.visible;
            				self.HT3.visible = not self.HT3.visible;
            				self.HD3.visible = not self.HD3.visible;
            				self.HPM3.visible = not self.HPM3.visible;
            				self.HPA3.visible = not self.HPA3.visible;
            				self.HPF3.visible = not self.HPF3.visible;
            				self.HHP3.visible = not self.HHP3.visible;
            				self.HMP3.visible = not self.HMP3.visible;
            				
            				self.HC3.visible = not self.HC3.visible;
            				self.HDEF3.visible = not self.HDEF3.visible;
            				self.HRES3.visible = not self.HRES3.visible;
            				self.HI3.visible = not self.HI3.visible;
            
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				self.HHP1.visible = false;
            				self.HMP1.visible = false;				
            				
            				
            				self.HC1.visible = false;
            				self.HDEF1.visible = false;
            				self.HRES1.visible = false;
            				self.HI1.visible = false;
            				
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HHP2.visible = false;
            				self.HMP2.visible = false;				
            					
            				self.HC2.visible = false;
            				self.HDEF2.visible = false;
            				self.HRES2.visible = false;
            				self.HI2.visible = false;
            				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HHP4.visible = false;
            				self.HMP4.visible = false;				
            								
            				self.HC4.visible = false;
            				self.HDEF4.visible = false;
            				self.HRES4.visible = false;
            				self.HI4.visible = false;
            				
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HHP5.visible = false;
            				self.HMP5.visible = false;				
            											
            				self.HC5.visible = false;
            				self.HDEF5.visible = false;
            				self.HRES5.visible = false;
            				self.HI5.visible = false;
            				
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HHP6.visible = false;
            				self.HMP6.visible = false;				
            								
            				self.HC6.visible = false;
            				self.HDEF6.visible = false;
            				self.HRES6.visible = false;
            				self.HI6.visible = false;
            				
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HHP7.visible = false;
            				self.HMP7.visible = false;				
            								
            				self.HC7.visible = false;
            				self.HDEF7.visible = false;
            				self.HRES7.visible = false;
            				self.HI7.visible = false;
            				
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HHP8.visible = false;
            				self.HMP8.visible = false;				
            									
            				self.HC8.visible = false;
            				self.HDEF8.visible = false;
            				self.HRES8.visible = false;
            				self.HI8.visible = false;
            				
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HHP9.visible = false;
            				self.HMP9.visible = false;				
            								
            				self.HC9.visible = false;
            				self.HDEF9.visible = false;
            				self.HRES9.visible = false;
            				self.HI9.visible = false;
            				
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				
            				self.UC1.visible = false;
            				self.UDEF1.visible = false;
            				self.URES1.visible = false;
            				self.UI1.visible = false;
            				
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UHP2.visible = false;
            				self.UMP2.visible = false;		
            				self.UHP1.visible = false;
            				self.UMP1.visible = false;		
            																
            				self.UC2.visible = false;
            				self.UDEF2.visible = false;
            				self.URES2.visible = false;
            				self.UI2.visible = false
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            self.H4.visible = not self.H4.visible;
            				self.HL4.visible = not self.HL4.visible;
            				self.HT4.visible = not self.HT4.visible;
            				self.HD4.visible = not self.HD4.visible;
            				self.HPM4.visible = not self.HPM4.visible;
            				self.HPA4.visible = not self.HPA4.visible;
            				self.HPF4.visible = not self.HPF4.visible;
            				self.HHP4.visible = not self.HHP4.visible;
            				self.HMP4.visible = not self.HMP4.visible;				
            				
            				self.HC4.visible = not self.HC4.visible;
            				self.HDEF4.visible = not self.HDEF4.visible;
            				self.HRES4.visible = not self.HRES4.visible;
            				self.HI4.visible = not self.HI4.visible;
            
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				
            				self.HC1.visible = false;
            				self.HDEF1.visible = false;
            				self.HRES1.visible = false;
            				self.HI1.visible = false;
            				self.HHP1.visible = false;
            				self.HMP1.visible = false;
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HHP2.visible = false;
            				self.HMP2.visible = false;				
            					
            				self.HC2.visible = false;
            				self.HDEF2.visible = false;
            				self.HRES2.visible = false;
            				self.HI2.visible = false;
            				self.H1.visible = false;
            
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HHP3.visible = false;
            				self.HMP3.visible = false;				
            									
            				self.HC3.visible = false;
            				self.HDEF3.visible = false;
            				self.HRES3.visible = false;
            				self.HI3.visible = false;
            				
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HHP5.visible = false;
            				self.HMP5.visible = false;				
            											
            				self.HC5.visible = false;
            				self.HDEF5.visible = false;
            				self.HRES5.visible = false;
            				self.HI5.visible = false;
            				
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HHP6.visible = false;
            				self.HMP6.visible = false;				
            								
            				self.HC6.visible = false;
            				self.HDEF6.visible = false;
            				self.HRES6.visible = false;
            				self.HI6.visible = false;
            				
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HHP7.visible = false;
            				self.HMP7.visible = false;				
            								
            				self.HC7.visible = false;
            				self.HDEF7.visible = false;
            				self.HRES7.visible = false;
            				self.HI7.visible = false;
            				
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HHP8.visible = false;
            				self.HMP8.visible = false;				
            									
            				self.HC8.visible = false;
            				self.HDEF8.visible = false;
            				self.HRES8.visible = false;
            				self.HI8.visible = false;
            				
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HHP9.visible = false;
            				self.HMP9.visible = false;				
            								
            				self.HC9.visible = false;
            				self.HDEF9.visible = false;
            				self.HRES9.visible = false;
            				self.HI9.visible = false;
            				
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				
            				self.UC1.visible = false;
            				self.UDEF1.visible = false;
            				self.URES1.visible = false;
            				self.UI1.visible = false;
            				
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UHP2.visible = false;
            				self.UMP2.visible = false;		
            				self.UHP1.visible = false;
            				self.UMP1.visible = false;		
            																
            				self.UC2.visible = false;
            				self.UDEF2.visible = false;
            				self.URES2.visible = false;
            				self.UI2.visible = false
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            self.H5.visible = not self.H5.visible;
            				self.HL5.visible = not self.HL5.visible;
            				self.HT5.visible = not self.HT5.visible;
            				self.HD5.visible = not self.HD5.visible;
            				self.HPM5.visible = not self.HPM5.visible;
            				self.HPA5.visible = not self.HPA5.visible;
            				self.HPF5.visible = not self.HPF5.visible;
            				self.HHP5.visible = not self.HHP5.visible;
            				self.HMP5.visible = not self.HMP5.visible;				
            				
            				self.HC5.visible = not self.HC5.visible;
            				self.HDEF5.visible = not self.HDEF5.visible;
            				self.HRES5.visible = not self.HRES5.visible;
            				self.HI5.visible = not self.HI5.visible;
            
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				
            				self.HC1.visible = false;
            				self.HDEF1.visible = false;
            				self.HRES1.visible = false;
            				self.HI1.visible = false;
            				self.HHP1.visible = false;
            				self.HMP1.visible = false;				
            				
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HHP2.visible = false;
            				self.HMP2.visible = false;				
            					
            				self.HC2.visible = false;
            				self.HDEF2.visible = false;
            				self.HRES2.visible = false;
            				self.HI2.visible = false;
            				self.H1.visible = false;
            
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HHP3.visible = false;
            				self.HMP3.visible = false;				
            									
            				self.HC3.visible = false;
            				self.HDEF3.visible = false;
            				self.HRES3.visible = false;
            				self.HI3.visible = false;
            				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HHP4.visible = false;
            				self.HMP4.visible = false;				
            								
            				self.HC4.visible = false;
            				self.HDEF4.visible = false;
            				self.HRES4.visible = false;
            				self.HI4.visible = false;
            				
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HHP6.visible = false;
            				self.HMP6.visible = false;				
            								
            				self.HC6.visible = false;
            				self.HDEF6.visible = false;
            				self.HRES6.visible = false;
            				self.HI6.visible = false;
            				
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HHP7.visible = false;
            				self.HMP7.visible = false;				
            								
            				self.HC7.visible = false;
            				self.HDEF7.visible = false;
            				self.HRES7.visible = false;
            				self.HI7.visible = false;
            				
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HHP8.visible = false;
            				self.HMP8.visible = false;				
            									
            				self.HC8.visible = false;
            				self.HDEF8.visible = false;
            				self.HRES8.visible = false;
            				self.HI8.visible = false;
            				
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HHP9.visible = false;
            				self.HMP9.visible = false;				
            								
            				self.HC9.visible = false;
            				self.HDEF9.visible = false;
            				self.HRES9.visible = false;
            				self.HI9.visible = false;
            				
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				
            				self.UC1.visible = false;
            				self.UDEF1.visible = false;
            				self.URES1.visible = false;
            				self.UI1.visible = false;
            				
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UHP2.visible = false;
            				self.UMP2.visible = false;		
            				self.UHP1.visible = false;
            				self.UMP1.visible = false;		
            																
            				self.UC2.visible = false;
            				self.UDEF2.visible = false;
            				self.URES2.visible = false;
            				self.UI2.visible = false
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            self.H6.visible = not self.H6.visible;
            				self.HL6.visible = not self.HL6.visible;
            				self.HT6.visible = not self.HT6.visible;
            				self.HD6.visible = not self.HD6.visible;
            				self.HPM6.visible = not self.HPM6.visible;
            				self.HPA6.visible = not self.HPA6.visible;
            				self.HPF6.visible = not self.HPF6.visible;
            				self.HHP6.visible = not self.HHP6.visible;
            				self.HMP6.visible = not self.HMP6.visible;				
            				
            				self.HC6.visible = not self.HC6.visible;
            				self.HDEF6.visible = not self.HDEF6.visible;
            				self.HRES6.visible = not self.HRES6.visible;
            				self.HI6.visible = not self.HI6.visible;
            
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				
            				self.HC1.visible = false;
            				self.HDEF1.visible = false;
            				self.HRES1.visible = false;
            				self.HI1.visible = false;
            				self.HHP1.visible = false;
            				self.HMP1.visible = false;				
            				
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HHP2.visible = false;
            				self.HMP2.visible = false;				
            					
            				self.HC2.visible = false;
            				self.HDEF2.visible = false;
            				self.HRES2.visible = false;
            				self.HI2.visible = false;
            				self.H1.visible = false;
            
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HHP3.visible = false;
            				self.HMP3.visible = false;				
            									
            				self.HC3.visible = false;
            				self.HDEF3.visible = false;
            				self.HRES3.visible = false;
            				self.HI3.visible = false;
            				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HHP4.visible = false;
            				self.HMP4.visible = false;				
            								
            				self.HC4.visible = false;
            				self.HDEF4.visible = false;
            				self.HRES4.visible = false;
            				self.HI4.visible = false
            				
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HHP5.visible = false;
            				self.HMP5.visible = false;				
            											
            				self.HC5.visible = false;
            				self.HDEF5.visible = false;
            				self.HRES5.visible = false;
            				self.HI5.visible = false;
            				
            								
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HHP7.visible = false;
            				self.HMP7.visible = false;				
            								
            				self.HC7.visible = false;
            				self.HDEF7.visible = false;
            				self.HRES7.visible = false;
            				self.HI7.visible = false;
            				
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HHP8.visible = false;
            				self.HMP8.visible = false;				
            									
            				self.HC8.visible = false;
            				self.HDEF8.visible = false;
            				self.HRES8.visible = false;
            				self.HI8.visible = false;
            				
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HHP9.visible = false;
            				self.HMP9.visible = false;				
            								
            				self.HC9.visible = false;
            				self.HDEF9.visible = false;
            				self.HRES9.visible = false;
            				self.HI9.visible = false;
            				
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				
            				self.UC1.visible = false;
            				self.UDEF1.visible = false;
            				self.URES1.visible = false;
            				self.UI1.visible = false;
            				
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UHP2.visible = false;
            				self.UMP2.visible = false;		
            				self.UHP1.visible = false;
            				self.UMP1.visible = false;		
            																
            				self.UC2.visible = false;
            				self.UDEF2.visible = false;
            				self.URES2.visible = false;
            				self.UI2.visible = false
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            self.H7.visible = not self.H7.visible;
            				self.HL7.visible = not self.HL7.visible;
            				self.HT7.visible = not self.HT7.visible;
            				self.HD7.visible = not self.HD7.visible;
            				self.HPM7.visible = not self.HPM7.visible;
            				self.HPA7.visible = not self.HPA7.visible;
            				self.HPF7.visible = not self.HPF7.visible;
            				self.HHP7.visible = not self.HHP7.visible;
            				self.HMP7.visible = not self.HMP7.visible;
            				
            				self.HC7.visible = not self.HC7.visible;
            				self.HDEF7.visible = not self.HDEF7.visible;
            				self.HRES7.visible = not self.HRES7.visible;
            				self.HI7.visible = not self.HI7.visible;
            
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				
            				self.HC1.visible = false;
            				self.HDEF1.visible = false;
            				self.HRES1.visible = false;
            				self.HI1.visible = false;
            				self.HHP1.visible = false;
            				self.HMP1.visible = false;
            
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HHP2.visible = false;
            				self.HMP2.visible = false;				
            					
            				self.HC2.visible = false;
            				self.HDEF2.visible = false;
            				self.HRES2.visible = false;
            				self.HI2.visible = false;
            				self.H1.visible = false;
            
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HHP3.visible = false;
            				self.HMP3.visible = false;				
            									
            				self.HC3.visible = false;
            				self.HDEF3.visible = false;
            				self.HRES3.visible = false;
            				self.HI3.visible = false;
            				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HHP4.visible = false;
            				self.HMP4.visible = false;				
            								
            				self.HC4.visible = false;
            				self.HDEF4.visible = false;
            				self.HRES4.visible = false;
            				self.HI4.visible = false
            				
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HHP5.visible = false;
            				self.HMP5.visible = false;				
            											
            				self.HC5.visible = false;
            				self.HDEF5.visible = false;
            				self.HRES5.visible = false;
            				self.HI5.visible = false;
            				
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HHP6.visible = false;
            				self.HMP6.visible = false;				
            								
            				self.HC6.visible = false;
            				self.HDEF6.visible = false;
            				self.HRES6.visible = false;
            				self.HI6.visible = false;
            				
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HHP8.visible = false;
            				self.HMP8.visible = false;				
            									
            				self.HC8.visible = false;
            				self.HDEF8.visible = false;
            				self.HRES8.visible = false;
            				self.HI8.visible = false;
            				
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HHP9.visible = false;
            				self.HMP9.visible = false;				
            								
            				self.HC9.visible = false;
            				self.HDEF9.visible = false;
            				self.HRES9.visible = false;
            				self.HI9.visible = false;
            				
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				
            				self.UC1.visible = false;
            				self.UDEF1.visible = false;
            				self.URES1.visible = false;
            				self.UI1.visible = false;
            				
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UHP2.visible = false;
            				self.UMP2.visible = false;		
            				self.UHP1.visible = false;
            				self.UMP1.visible = false;		
            																
            				self.UC2.visible = false;
            				self.UDEF2.visible = false;
            				self.URES2.visible = false;
            				self.UI2.visible = false
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            self.H8.visible = not self.H8.visible;
            				self.HL8.visible = not self.HL8.visible;
            				self.HT8.visible = not self.HT8.visible;
            				self.HD8.visible = not self.HD8.visible;
            				self.HPM8.visible = not self.HPM8.visible;
            				self.HPA8.visible = not self.HPA8.visible;
            				self.HPF8.visible = not self.HPF8.visible;
            				self.HHP8.visible = not self.HHP8.visible;
            				self.HMP8.visible = not self.HMP8.visible;				
            				
            				self.HC8.visible = not self.HC8.visible;
            				self.HDEF8.visible = not self.HDEF8.visible;
            				self.HRES8.visible = not self.HRES8.visible;
            				self.HI8.visible = not self.HI8.visible;
            
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				
            				self.HC1.visible = false;
            				self.HDEF1.visible = false;
            				self.HRES1.visible = false;
            				self.HI1.visible = false;
            				self.HHP1.visible = false;
            				self.HMP1.visible = false;				
            				
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HHP2.visible = false;
            				self.HMP2.visible = false;				
            					
            				self.HC2.visible = false;
            				self.HDEF2.visible = false;
            				self.HRES2.visible = false;
            				self.HI2.visible = false;
            				self.H1.visible = false;
            
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HHP3.visible = false;
            				self.HMP3.visible = false;				
            									
            				self.HC3.visible = false;
            				self.HDEF3.visible = false;
            				self.HRES3.visible = false;
            				self.HI3.visible = false;
            				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HHP4.visible = false;
            				self.HMP4.visible = false;				
            								
            				self.HC4.visible = false;
            				self.HDEF4.visible = false;
            				self.HRES4.visible = false;
            				self.HI4.visible = false
            				
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HHP5.visible = false;
            				self.HMP5.visible = false;				
            											
            				self.HC5.visible = false;
            				self.HDEF5.visible = false;
            				self.HRES5.visible = false;
            				self.HI5.visible = false;
            				
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HHP6.visible = false;
            				self.HMP6.visible = false;				
            								
            				self.HC6.visible = false;
            				self.HDEF6.visible = false;
            				self.HRES6.visible = false;
            				self.HI6.visible = false;
            				
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HHP7.visible = false;
            				self.HMP7.visible = false;				
            								
            				self.HC7.visible = false;
            				self.HDEF7.visible = false;
            				self.HRES7.visible = false;
            				self.HI7.visible = false;
            				
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HHP9.visible = false;
            				self.HMP9.visible = false;				
            								
            				self.HC9.visible = false;
            				self.HDEF9.visible = false;
            				self.HRES9.visible = false;
            				self.HI9.visible = false;
            				
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				
            				self.UC1.visible = false;
            				self.UDEF1.visible = false;
            				self.URES1.visible = false;
            				self.UI1.visible = false;
            				
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UHP2.visible = false;
            				self.UMP2.visible = false;		
            				self.UHP1.visible = false;
            				self.UMP1.visible = false;		
            																
            				self.UC2.visible = false;
            				self.UDEF2.visible = false;
            				self.URES2.visible = false;
            				self.UI2.visible = false
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (_)
            self.H9.visible = not self.H9.visible;
            				self.HL9.visible = not self.HL9.visible;
            				self.HT9.visible = not self.HT9.visible;
            				self.HD9.visible = not self.HD9.visible;
            				self.HPM9.visible = not self.HPM9.visible;
            				self.HPA9.visible = not self.HPA9.visible;
            				self.HPF9.visible = not self.HPF9.visible;
            				self.HHP9.visible = not self.HHP9.visible;
            				self.HMP9.visible = not self.HMP9.visible;
            				
            				self.HC9.visible = not self.HC9.visible;
            				self.HDEF9.visible = not self.HDEF9.visible;
            				self.HRES9.visible = not self.HRES9.visible;
            				self.HI9.visible = not self.HI9.visible;
            
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				
            				self.HC1.visible = false;
            				self.HDEF1.visible = false;
            				self.HRES1.visible = false;
            				self.HI1.visible = false;
            				self.HHP1.visible = false;
            				self.HMP1.visible = false;				
            				
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HHP2.visible = false;
            				self.HMP2.visible = false;				
            					
            				self.HC2.visible = false;
            				self.HDEF2.visible = false;
            				self.HRES2.visible = false;
            				self.HI2.visible = false;
            				self.H1.visible = false;
            
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HHP3.visible = false;
            				self.HMP3.visible = false;				
            									
            				self.HC3.visible = false;
            				self.HDEF3.visible = false;
            				self.HRES3.visible = false;
            				self.HI3.visible = false;
            				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HHP4.visible = false;
            				self.HMP4.visible = false;				
            								
            				self.HC4.visible = false;
            				self.HDEF4.visible = false;
            				self.HRES4.visible = false;
            				self.HI4.visible = false
            				
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HHP5.visible = false;
            				self.HMP5.visible = false;				
            											
            				self.HC5.visible = false;
            				self.HDEF5.visible = false;
            				self.HRES5.visible = false;
            				self.HI5.visible = false;
            				
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HHP6.visible = false;
            				self.HMP6.visible = false;				
            								
            				self.HC6.visible = false;
            				self.HDEF6.visible = false;
            				self.HRES6.visible = false;
            				self.HI6.visible = false;
            				
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HHP7.visible = false;
            				self.HMP7.visible = false;				
            								
            				self.HC7.visible = false;
            				self.HDEF7.visible = false;
            				self.HRES7.visible = false;
            				self.HI7.visible = false;
            				
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HHP8.visible = false;
            				self.HMP8.visible = false;				
            									
            				self.HC8.visible = false;
            				self.HDEF8.visible = false;
            				self.HRES8.visible = false;
            				self.HI8.visible = false;
            				
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				
            				self.UC1.visible = false;
            				self.UDEF1.visible = false;
            				self.URES1.visible = false;
            				self.UI1.visible = false;
            				
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UHP2.visible = false;
            				self.UMP2.visible = false;		
            				self.UHP1.visible = false;
            				self.UMP1.visible = false;		
            												
            				self.UC2.visible = false;
            				self.UDEF2.visible = false;
            				self.URES2.visible = false;
            				self.UI2.visible = false
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (_)
            self.U1.visible = not self.U1.visible;
            				self.UL1.visible = not self.UL1.visible;
            				self.UT1.visible = not self.UT1.visible;
            				self.UD1.visible = not self.UD1.visible;
            				self.UPM1.visible = not self.UPM1.visible;
            				self.UPA1.visible = not self.UPA1.visible;
            				self.UPF1.visible = not self.UPF1.visible;
            				self.UHP1.visible = not self.UHP1.visible;
            				self.UMP1.visible = not self.UMP1.visible;				
            			
            				
            				self.UC1.visible = not self.UC1.visible;
            				self.UDEF1.visible = not self.UDEF1.visible;
            				self.URES1.visible = not self.URES1.visible;
            				self.UI1.visible = not self.UI1.visible;
            
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				
            				self.HC1.visible = false;
            				self.HDEF1.visible = false;
            				self.HRES1.visible = false;
            				self.HI1.visible = false;
            				self.HHP1.visible = false;
            				self.HMP1.visible = false;				
            				
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HHP2.visible = false;
            				self.HMP2.visible = false;				
            					
            				self.HC2.visible = false;
            				self.HDEF2.visible = false;
            				self.HRES2.visible = false;
            				self.HI2.visible = false;
            				self.H1.visible = false;
            
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HHP3.visible = false;
            				self.HMP3.visible = false;				
            									
            				self.HC3.visible = false;
            				self.HDEF3.visible = false;
            				self.HRES3.visible = false;
            				self.HI3.visible = false;
            				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HHP4.visible = false;
            				self.HMP4.visible = false;				
            								
            				self.HC4.visible = false;
            				self.HDEF4.visible = false;
            				self.HRES4.visible = false;
            				self.HI4.visible = false
            				
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HHP5.visible = false;
            				self.HMP5.visible = false;				
            											
            				self.HC5.visible = false;
            				self.HDEF5.visible = false;
            				self.HRES5.visible = false;
            				self.HI5.visible = false;
            				
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HHP6.visible = false;
            				self.HMP6.visible = false;				
            								
            				self.HC6.visible = false;
            				self.HDEF6.visible = false;
            				self.HRES6.visible = false;
            				self.HI6.visible = false;
            				
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				self.HHP7.visible = false;
            				self.HMP7.visible = false;				
            								
            				self.HC7.visible = false;
            				self.HDEF7.visible = false;
            				self.HRES7.visible = false;
            				self.HI7.visible = false;
            				
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HHP8.visible = false;
            				self.HMP8.visible = false;				
            									
            				self.HC8.visible = false;
            				self.HDEF8.visible = false;
            				self.HRES8.visible = false;
            				self.HI8.visible = false;
            				
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HHP9.visible = false;
            				self.HMP9.visible = false;				
            								
            				self.HC9.visible = false;
            				self.HDEF9.visible = false;
            				self.HRES9.visible = false;
            				self.HI9.visible = false;
            				
            				
            				self.U2.visible = false;
            				self.UL2.visible = false;
            				self.UT2.visible = false;
            				self.UD2.visible = false;
            				self.UPM2.visible = false;
            				self.UPA2.visible = false;
            				self.UPF2.visible = false;
            				self.UHP2.visible = false;
            				self.UMP2.visible = false;		
            				
            				self.UC2.visible = false;
            				self.UDEF2.visible = false;
            				self.URES2.visible = false;
            				self.UI2.visible = false
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            self.U2.visible = not self.U2.visible;
            				self.UL2.visible = not self.UL2.visible;
            				self.UT2.visible = not self.UT2.visible;
            				self.UD2.visible = not self.UD2.visible;
            				self.UPM2.visible = not self.UPM2.visible;
            				self.UPA2.visible = not self.UPA2.visible;
            				self.UPF2.visible = not self.UPF2.visible;
            				self.UHP2.visible = not self.UHP2.visible;
            				self.UMP2.visible = not self.UMP2.visible;						
            				
            				self.UC2.visible = not self.UC2.visible;
            				self.UDEF2.visible = not self.UDEF2.visible;
            				self.URES2.visible = not self.URES2.visible;
            				self.UI2.visible = not self.UI2.visible;
            
            				
            				self.H1.visible = false;
            				self.HL1.visible = false;
            				self.HT1.visible = false;
            				self.HD1.visible = false;
            				self.HPM1.visible = false;
            				self.HPA1.visible = false;
            				self.HPF1.visible = false;
            				
            				self.HC1.visible = false;
            				self.HDEF1.visible = false;
            				self.HRES1.visible = false;
            				self.HI1.visible = false;
            				self.HHP1.visible = false;
            				self.HMP1.visible = false;				
            				
            				
            				self.H2.visible = false;
            				self.HL2.visible = false;
            				self.HT2.visible = false;
            				self.HD2.visible = false;
            				self.HPM2.visible = false;
            				self.HPA2.visible = false;
            				self.HPF2.visible = false;
            				self.HHP2.visible = false;
            				self.HMP2.visible = false;				
            					
            				self.HC2.visible = false;
            				self.HDEF2.visible = false;
            				self.HRES2.visible = false;
            				self.HI2.visible = false;
            				self.H1.visible = false;
            
            				
            				self.H3.visible = false;
            				self.HL3.visible = false;
            				self.HT3.visible = false;
            				self.HD3.visible = false;
            				self.HPM3.visible = false;
            				self.HPA3.visible = false;
            				self.HPF3.visible = false;
            				self.HHP3.visible = false;
            				self.HMP3.visible = false;				
            					
            				self.HC3.visible = false;
            				self.HDEF3.visible = false;
            				self.HRES3.visible = false;
            				self.HI3.visible = false;
            				
            				
            				self.H4.visible = false;
            				self.HL4.visible = false;
            				self.HT4.visible = false;
            				self.HD4.visible = false;
            				self.HPM4.visible = false;
            				self.HPA4.visible = false;
            				self.HPF4.visible = false;
            				self.HHP4.visible = false;
            				self.HMP4.visible = false;				
            								
            				self.HC4.visible = false;
            				self.HDEF4.visible = false;
            				self.HRES4.visible = false;
            				self.HI4.visible = false
            				
            				
            				self.H5.visible = false;
            				self.HL5.visible = false;
            				self.HT5.visible = false;
            				self.HD5.visible = false;
            				self.HPM5.visible = false;
            				self.HPA5.visible = false;
            				self.HPF5.visible = false;
            				self.HHP5.visible = false;
            				self.HMP5.visible = false;				
            								
            				self.HC5.visible = false;
            				self.HDEF5.visible = false;
            				self.HRES5.visible = false;
            				self.HI5.visible = false;
            				
            				
            				self.H6.visible = false;
            				self.HL6.visible = false;
            				self.HT6.visible = false;
            				self.HD6.visible = false;
            				self.HPM6.visible = false;
            				self.HPA6.visible = false;
            				self.HPF6.visible = false;
            				self.HHP6.visible = false;
            				self.HMP6.visible = false;				
            								
            				self.HC6.visible = false;
            				self.HDEF6.visible = false;
            				self.HRES6.visible = false;
            				self.HI6.visible = false;
            				
            				
            				self.H7.visible = false;
            				self.HL7.visible = false;
            				self.HT7.visible = false;
            				self.HD7.visible = false;
            				self.HPM7.visible = false;
            				self.HPA7.visible = false;
            				self.HPF7.visible = false;
            				
            				self.HC7.visible = false;
            				self.HDEF7.visible = false;
            				self.HRES7.visible = false;
            				self.HI7.visible = false;
            				
            				
            				self.H8.visible = false;
            				self.HL8.visible = false;
            				self.HT8.visible = false;
            				self.HD8.visible = false;
            				self.HPM8.visible = false;
            				self.HPA8.visible = false;
            				self.HPF8.visible = false;
            				self.HHP8.visible = false;
            				self.HMP8.visible = false;				
            									
            				self.HC8.visible = false;
            				self.HDEF8.visible = false;
            				self.HRES8.visible = false;
            				self.HI8.visible = false;
            				
            				
            				self.H9.visible = false;
            				self.HL9.visible = false;
            				self.HT9.visible = false;
            				self.HD9.visible = false;
            				self.HPM9.visible = false;
            				self.HPA9.visible = false;
            				self.HPF9.visible = false;
            				self.HHP9.visible = false;
            				self.HMP9.visible = false;				
            												
            				self.HC9.visible = false;
            				self.HDEF9.visible = false;
            				self.HRES9.visible = false;
            				self.HI9.visible = false;
            				
            				
            				self.U1.visible = false;
            				self.UL1.visible = false;
            				self.UT1.visible = false;
            				self.UD1.visible = false;
            				self.UPM1.visible = false;
            				self.UPA1.visible = false;
            				self.UPF1.visible = false;
            				self.UHP1.visible = false;
            				self.UMP1.visible = false;					
            				self.UC1.visible = false;
            				self.UDEF1.visible = false;
            				self.URES1.visible = false;
            				self.UI1.visible = false
        end, obj);

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

        if self.HMP1 ~= nil then self.HMP1:destroy(); self.HMP1 = nil; end;
        if self.HD7 ~= nil then self.HD7:destroy(); self.HD7 = nil; end;
        if self.HI3 ~= nil then self.HI3:destroy(); self.HI3 = nil; end;
        if self.UI2 ~= nil then self.UI2:destroy(); self.UI2 = nil; end;
        if self.HL8 ~= nil then self.HL8:destroy(); self.HL8 = nil; end;
        if self.UD2 ~= nil then self.UD2:destroy(); self.UD2 = nil; end;
        if self.HRES8 ~= nil then self.HRES8:destroy(); self.HRES8 = nil; end;
        if self.UT2 ~= nil then self.UT2:destroy(); self.UT2 = nil; end;
        if self.HHP3 ~= nil then self.HHP3:destroy(); self.HHP3 = nil; end;
        if self.HHP6 ~= nil then self.HHP6:destroy(); self.HHP6 = nil; end;
        if self.UDEF2 ~= nil then self.UDEF2:destroy(); self.UDEF2 = nil; end;
        if self.HT9 ~= nil then self.HT9:destroy(); self.HT9 = nil; end;
        if self.HRES5 ~= nil then self.HRES5:destroy(); self.HRES5 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.HPF6 ~= nil then self.HPF6:destroy(); self.HPF6 = nil; end;
        if self.UT1 ~= nil then self.UT1:destroy(); self.UT1 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.UMP1 ~= nil then self.UMP1:destroy(); self.UMP1 = nil; end;
        if self.HPF4 ~= nil then self.HPF4:destroy(); self.HPF4 = nil; end;
        if self.URES2 ~= nil then self.URES2:destroy(); self.URES2 = nil; end;
        if self.HD5 ~= nil then self.HD5:destroy(); self.HD5 = nil; end;
        if self.UDEF1 ~= nil then self.UDEF1:destroy(); self.UDEF1 = nil; end;
        if self.UI1 ~= nil then self.UI1:destroy(); self.UI1 = nil; end;
        if self.HDEF1 ~= nil then self.HDEF1:destroy(); self.HDEF1 = nil; end;
        if self.HPM2 ~= nil then self.HPM2:destroy(); self.HPM2 = nil; end;
        if self.HRES7 ~= nil then self.HRES7:destroy(); self.HRES7 = nil; end;
        if self.UPM2 ~= nil then self.UPM2:destroy(); self.UPM2 = nil; end;
        if self.HL6 ~= nil then self.HL6:destroy(); self.HL6 = nil; end;
        if self.U1 ~= nil then self.U1:destroy(); self.U1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.HHP4 ~= nil then self.HHP4:destroy(); self.HHP4 = nil; end;
        if self.H7 ~= nil then self.H7:destroy(); self.H7 = nil; end;
        if self.HD2 ~= nil then self.HD2:destroy(); self.HD2 = nil; end;
        if self.UC1 ~= nil then self.UC1:destroy(); self.UC1 = nil; end;
        if self.H6 ~= nil then self.H6:destroy(); self.H6 = nil; end;
        if self.UC2 ~= nil then self.UC2:destroy(); self.UC2 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.UPF1 ~= nil then self.UPF1:destroy(); self.UPF1 = nil; end;
        if self.HD1 ~= nil then self.HD1:destroy(); self.HD1 = nil; end;
        if self.HPF1 ~= nil then self.HPF1:destroy(); self.HPF1 = nil; end;
        if self.HDEF4 ~= nil then self.HDEF4:destroy(); self.HDEF4 = nil; end;
        if self.HPM5 ~= nil then self.HPM5:destroy(); self.HPM5 = nil; end;
        if self.HC8 ~= nil then self.HC8:destroy(); self.HC8 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.HC4 ~= nil then self.HC4:destroy(); self.HC4 = nil; end;
        if self.HL4 ~= nil then self.HL4:destroy(); self.HL4 = nil; end;
        if self.HT4 ~= nil then self.HT4:destroy(); self.HT4 = nil; end;
        if self.HC1 ~= nil then self.HC1:destroy(); self.HC1 = nil; end;
        if self.HPM4 ~= nil then self.HPM4:destroy(); self.HPM4 = nil; end;
        if self.UHP1 ~= nil then self.UHP1:destroy(); self.UHP1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.H4 ~= nil then self.H4:destroy(); self.H4 = nil; end;
        if self.HRES9 ~= nil then self.HRES9:destroy(); self.HRES9 = nil; end;
        if self.HI1 ~= nil then self.HI1:destroy(); self.HI1 = nil; end;
        if self.HD6 ~= nil then self.HD6:destroy(); self.HD6 = nil; end;
        if self.UD1 ~= nil then self.UD1:destroy(); self.UD1 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.HHP9 ~= nil then self.HHP9:destroy(); self.HHP9 = nil; end;
        if self.UPA2 ~= nil then self.UPA2:destroy(); self.UPA2 = nil; end;
        if self.HC9 ~= nil then self.HC9:destroy(); self.HC9 = nil; end;
        if self.HDEF7 ~= nil then self.HDEF7:destroy(); self.HDEF7 = nil; end;
        if self.HDEF5 ~= nil then self.HDEF5:destroy(); self.HDEF5 = nil; end;
        if self.HPM1 ~= nil then self.HPM1:destroy(); self.HPM1 = nil; end;
        if self.HD8 ~= nil then self.HD8:destroy(); self.HD8 = nil; end;
        if self.HMP6 ~= nil then self.HMP6:destroy(); self.HMP6 = nil; end;
        if self.HPF9 ~= nil then self.HPF9:destroy(); self.HPF9 = nil; end;
        if self.HPA3 ~= nil then self.HPA3:destroy(); self.HPA3 = nil; end;
        if self.HD4 ~= nil then self.HD4:destroy(); self.HD4 = nil; end;
        if self.H9 ~= nil then self.H9:destroy(); self.H9 = nil; end;
        if self.HI9 ~= nil then self.HI9:destroy(); self.HI9 = nil; end;
        if self.HDEF6 ~= nil then self.HDEF6:destroy(); self.HDEF6 = nil; end;
        if self.H5 ~= nil then self.H5:destroy(); self.H5 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.HPM7 ~= nil then self.HPM7:destroy(); self.HPM7 = nil; end;
        if self.HRES2 ~= nil then self.HRES2:destroy(); self.HRES2 = nil; end;
        if self.HC3 ~= nil then self.HC3:destroy(); self.HC3 = nil; end;
        if self.UPA1 ~= nil then self.UPA1:destroy(); self.UPA1 = nil; end;
        if self.HT3 ~= nil then self.HT3:destroy(); self.HT3 = nil; end;
        if self.HI5 ~= nil then self.HI5:destroy(); self.HI5 = nil; end;
        if self.HT2 ~= nil then self.HT2:destroy(); self.HT2 = nil; end;
        if self.HDEF8 ~= nil then self.HDEF8:destroy(); self.HDEF8 = nil; end;
        if self.UPF2 ~= nil then self.UPF2:destroy(); self.UPF2 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.UL2 ~= nil then self.UL2:destroy(); self.UL2 = nil; end;
        if self.HL5 ~= nil then self.HL5:destroy(); self.HL5 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.HDEF3 ~= nil then self.HDEF3:destroy(); self.HDEF3 = nil; end;
        if self.HPF3 ~= nil then self.HPF3:destroy(); self.HPF3 = nil; end;
        if self.HT1 ~= nil then self.HT1:destroy(); self.HT1 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.HC2 ~= nil then self.HC2:destroy(); self.HC2 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.HHP7 ~= nil then self.HHP7:destroy(); self.HHP7 = nil; end;
        if self.HPF8 ~= nil then self.HPF8:destroy(); self.HPF8 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.H1 ~= nil then self.H1:destroy(); self.H1 = nil; end;
        if self.H2 ~= nil then self.H2:destroy(); self.H2 = nil; end;
        if self.URES1 ~= nil then self.URES1:destroy(); self.URES1 = nil; end;
        if self.H8 ~= nil then self.H8:destroy(); self.H8 = nil; end;
        if self.HRES3 ~= nil then self.HRES3:destroy(); self.HRES3 = nil; end;
        if self.HMP9 ~= nil then self.HMP9:destroy(); self.HMP9 = nil; end;
        if self.HHP5 ~= nil then self.HHP5:destroy(); self.HHP5 = nil; end;
        if self.H3 ~= nil then self.H3:destroy(); self.H3 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.HPA4 ~= nil then self.HPA4:destroy(); self.HPA4 = nil; end;
        if self.HRES4 ~= nil then self.HRES4:destroy(); self.HRES4 = nil; end;
        if self.HPA6 ~= nil then self.HPA6:destroy(); self.HPA6 = nil; end;
        if self.HPA8 ~= nil then self.HPA8:destroy(); self.HPA8 = nil; end;
        if self.HMP4 ~= nil then self.HMP4:destroy(); self.HMP4 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.HPA2 ~= nil then self.HPA2:destroy(); self.HPA2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.HT5 ~= nil then self.HT5:destroy(); self.HT5 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.HPF2 ~= nil then self.HPF2:destroy(); self.HPF2 = nil; end;
        if self.HMP8 ~= nil then self.HMP8:destroy(); self.HMP8 = nil; end;
        if self.HT6 ~= nil then self.HT6:destroy(); self.HT6 = nil; end;
        if self.HI2 ~= nil then self.HI2:destroy(); self.HI2 = nil; end;
        if self.HHP2 ~= nil then self.HHP2:destroy(); self.HHP2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.UPM1 ~= nil then self.UPM1:destroy(); self.UPM1 = nil; end;
        if self.HMP5 ~= nil then self.HMP5:destroy(); self.HMP5 = nil; end;
        if self.HI6 ~= nil then self.HI6:destroy(); self.HI6 = nil; end;
        if self.HHP8 ~= nil then self.HHP8:destroy(); self.HHP8 = nil; end;
        if self.HDEF9 ~= nil then self.HDEF9:destroy(); self.HDEF9 = nil; end;
        if self.HPM8 ~= nil then self.HPM8:destroy(); self.HPM8 = nil; end;
        if self.HPA7 ~= nil then self.HPA7:destroy(); self.HPA7 = nil; end;
        if self.HPA5 ~= nil then self.HPA5:destroy(); self.HPA5 = nil; end;
        if self.HRES6 ~= nil then self.HRES6:destroy(); self.HRES6 = nil; end;
        if self.HMP7 ~= nil then self.HMP7:destroy(); self.HMP7 = nil; end;
        if self.UL1 ~= nil then self.UL1:destroy(); self.UL1 = nil; end;
        if self.HL2 ~= nil then self.HL2:destroy(); self.HL2 = nil; end;
        if self.HPM3 ~= nil then self.HPM3:destroy(); self.HPM3 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.HC6 ~= nil then self.HC6:destroy(); self.HC6 = nil; end;
        if self.HI8 ~= nil then self.HI8:destroy(); self.HI8 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.HL7 ~= nil then self.HL7:destroy(); self.HL7 = nil; end;
        if self.HI7 ~= nil then self.HI7:destroy(); self.HI7 = nil; end;
        if self.HPM9 ~= nil then self.HPM9:destroy(); self.HPM9 = nil; end;
        if self.UHP2 ~= nil then self.UHP2:destroy(); self.UHP2 = nil; end;
        if self.HPF7 ~= nil then self.HPF7:destroy(); self.HPF7 = nil; end;
        if self.HL9 ~= nil then self.HL9:destroy(); self.HL9 = nil; end;
        if self.HL1 ~= nil then self.HL1:destroy(); self.HL1 = nil; end;
        if self.HHP1 ~= nil then self.HHP1:destroy(); self.HHP1 = nil; end;
        if self.HC5 ~= nil then self.HC5:destroy(); self.HC5 = nil; end;
        if self.HT7 ~= nil then self.HT7:destroy(); self.HT7 = nil; end;
        if self.HC7 ~= nil then self.HC7:destroy(); self.HC7 = nil; end;
        if self.HDEF2 ~= nil then self.HDEF2:destroy(); self.HDEF2 = nil; end;
        if self.HT8 ~= nil then self.HT8:destroy(); self.HT8 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.HRES1 ~= nil then self.HRES1:destroy(); self.HRES1 = nil; end;
        if self.HD3 ~= nil then self.HD3:destroy(); self.HD3 = nil; end;
        if self.HPA1 ~= nil then self.HPA1:destroy(); self.HPA1 = nil; end;
        if self.HL3 ~= nil then self.HL3:destroy(); self.HL3 = nil; end;
        if self.HMP3 ~= nil then self.HMP3:destroy(); self.HMP3 = nil; end;
        if self.HPF5 ~= nil then self.HPF5:destroy(); self.HPF5 = nil; end;
        if self.HPA9 ~= nil then self.HPA9:destroy(); self.HPA9 = nil; end;
        if self.U2 ~= nil then self.U2:destroy(); self.U2 = nil; end;
        if self.HMP2 ~= nil then self.HMP2:destroy(); self.HMP2 = nil; end;
        if self.HPM6 ~= nil then self.HPM6:destroy(); self.HPM6 = nil; end;
        if self.HI4 ~= nil then self.HI4:destroy(); self.HI4 = nil; end;
        if self.HD9 ~= nil then self.HD9:destroy(); self.HD9 = nil; end;
        if self.UMP2 ~= nil then self.UMP2:destroy(); self.UMP2 = nil; end;
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
