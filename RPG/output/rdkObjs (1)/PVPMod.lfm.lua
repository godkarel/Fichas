require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPVPMod()
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
    obj:setName("frmPVPMod");
    obj:setWidth(650);
    obj:setHeight(920);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(10);
    obj.layout1:setTop(10);
    obj.layout1:setWidth(630);
    obj.layout1:setHeight(50);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setLeft(20);
    obj.rectangle1:setTop(20);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("Gray");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(3);
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.btnAppFicha1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnAppFicha1:setParent(obj.rectangle1);
    obj.btnAppFicha1:setName("btnAppFicha1");
    obj.btnAppFicha1:setLeft(10);
    obj.btnAppFicha1:setWidth(150);
    obj.btnAppFicha1:setHeight(20);
    obj.btnAppFicha1:setTop(15);
    obj.btnAppFicha1:setText("Aplica Ficha 1");

    obj.btnAppFicha2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnAppFicha2:setParent(obj.rectangle1);
    obj.btnAppFicha2:setName("btnAppFicha2");
    obj.btnAppFicha2:setLeft(470);
    obj.btnAppFicha2:setWidth(150);
    obj.btnAppFicha2:setHeight(20);
    obj.btnAppFicha2:setTop(15);
    obj.btnAppFicha2:setText("Aplica Ficha 2");


			


 
				function PreparaFicha1()
					sheet.Ficha1 = Ficha1
					self.btnAppFicha1.text= Ficha1.Nome
					self.labNameFicha.text = Ficha1.Nome
					
					self.HPBarPVP.value = Ficha1.HPTotal
					self.MPBarPVP.value = Ficha1.MPTotal
					self.OutrosBarPVP.value = 0;
					self.PotesBarPVP.value = 0;
					
					self.HPBarPVP.max = Ficha1.HPTotal
					self.MPBarPVP.max = Ficha1.MPTotal
					self.OutrosBarPVP.max = 0;
					self.PotesBarPVP.max = 0;
					
					sheet.HPAtualFicha1 = self.HPBarPVP.value
					sheet.MPAtualFicha1 = self.MPBarPVP.value
					sheet.OutrosAtualFicha = self.OutrosBarPVP.value
					sheet.PotesAtualFicha1 =  self.PotesBarPVP.value
					
					sheet.HPTotalFicha1 = self.HPBarPVP.max
					sheet.MPTotalFicha1 = self.MPBarPVP.max
					sheet.OutrosTotalFicha1 = self.OutrosBarPVP.max
					sheet.PotesTotalFicha1 = self.PotesBarPVP.max
					
					sheet.DefFicha1 = Ficha1.DEFRED;
					sheet.ResFicha1 = Ficha1.RESRED;
				end;	
			


	
			


    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(10);
    obj.layout2:setTop(70);
    obj.layout2:setWidth(300);
    obj.layout2:setHeight(180);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setLeft(20);
    obj.rectangle2:setTop(20);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("Gray");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(3);
    obj.rectangle2:setXradius(15);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle2);
    obj.image1:setLeft(-20);
    obj.image1:setTop(10);
    obj.image1:setWidth(180);
    obj.image1:setHeight(150);
    obj.image1:setSRC("https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Jared_Leto_by_Gage_Skidmore.jpg/800px-Jared_Leto_by_Gage_Skidmore.jpg");
    obj.image1:setName("image1");

    obj.labNameFicha = GUI.fromHandle(_obj_newObject("label"));
    obj.labNameFicha:setParent(obj.rectangle2);
    obj.labNameFicha:setName("labNameFicha");
    obj.labNameFicha:setTop(10);
    obj.labNameFicha:setLeft(140);
    obj.labNameFicha:setWidth(120);

    obj.HPBarPVP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.HPBarPVP:setParent(obj.rectangle2);
    obj.HPBarPVP:setName("HPBarPVP");
    obj.HPBarPVP:setWidth(150);
    obj.HPBarPVP:setHeight(15);
    obj.HPBarPVP:setColor("red");
    obj.HPBarPVP:setTop(30);
    obj.HPBarPVP:setLeft(140);
    obj.HPBarPVP:setPosition(50);
    obj.HPBarPVP:setMax(100);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setLeft(150);
    obj.edit1:setTop(30);
    obj.edit1:setWidth(50);
    obj.edit1:setFontSize(12);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setTransparent(true);
    obj.edit1:setHeight(15);
    obj.edit1:setField("HPAtualFicha1");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle2);
    obj.edit2:setLeft(230);
    obj.edit2:setTop(30);
    obj.edit2:setWidth(50);
    obj.edit2:setFontSize(12);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setTransparent(true);
    obj.edit2:setHeight(15);
    obj.edit2:setField("HPTotalFicha1");
    obj.edit2:setName("edit2");

    obj.MPBarPVP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.MPBarPVP:setParent(obj.rectangle2);
    obj.MPBarPVP:setName("MPBarPVP");
    obj.MPBarPVP:setWidth(150);
    obj.MPBarPVP:setHeight(15);
    obj.MPBarPVP:setColor("blue");
    obj.MPBarPVP:setTop(48);
    obj.MPBarPVP:setLeft(140);
    obj.MPBarPVP:setPosition(50);
    obj.MPBarPVP:setMax(100);

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle2);
    obj.edit3:setLeft(150);
    obj.edit3:setTop(48);
    obj.edit3:setWidth(50);
    obj.edit3:setFontSize(12);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setTransparent(true);
    obj.edit3:setHeight(15);
    obj.edit3:setField("MPAtualFicha1");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle2);
    obj.edit4:setLeft(230);
    obj.edit4:setTop(48);
    obj.edit4:setWidth(50);
    obj.edit4:setFontSize(12);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setTransparent(true);
    obj.edit4:setHeight(15);
    obj.edit4:setField("MPTotalFicha1");
    obj.edit4:setName("edit4");

    obj.OutrosBarPVP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.OutrosBarPVP:setParent(obj.rectangle2);
    obj.OutrosBarPVP:setName("OutrosBarPVP");
    obj.OutrosBarPVP:setWidth(150);
    obj.OutrosBarPVP:setHeight(15);
    obj.OutrosBarPVP:setColor("DarkSeaGreen");
    obj.OutrosBarPVP:setTop(66);
    obj.OutrosBarPVP:setLeft(140);
    obj.OutrosBarPVP:setPosition(50);
    obj.OutrosBarPVP:setMax(100);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle2);
    obj.edit5:setLeft(150);
    obj.edit5:setTop(66);
    obj.edit5:setWidth(50);
    obj.edit5:setFontSize(12);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setTransparent(true);
    obj.edit5:setHeight(15);
    obj.edit5:setField("OutrosAtualFicha1");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle2);
    obj.edit6:setLeft(230);
    obj.edit6:setTop(66);
    obj.edit6:setWidth(50);
    obj.edit6:setFontSize(12);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setTransparent(true);
    obj.edit6:setHeight(15);
    obj.edit6:setField("OutrosTotalFicha1");
    obj.edit6:setName("edit6");

    obj.PotesBarPVP = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.PotesBarPVP:setParent(obj.rectangle2);
    obj.PotesBarPVP:setName("PotesBarPVP");
    obj.PotesBarPVP:setWidth(150);
    obj.PotesBarPVP:setHeight(15);
    obj.PotesBarPVP:setColor("DarkTurquoise");
    obj.PotesBarPVP:setTop(84);
    obj.PotesBarPVP:setLeft(140);
    obj.PotesBarPVP:setPosition(50);
    obj.PotesBarPVP:setMax(100);

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle2);
    obj.edit7:setLeft(150);
    obj.edit7:setTop(84);
    obj.edit7:setWidth(50);
    obj.edit7:setFontSize(12);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setTransparent(true);
    obj.edit7:setHeight(15);
    obj.edit7:setField("PotesAtualFicha1");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle2);
    obj.edit8:setLeft(230);
    obj.edit8:setTop(84);
    obj.edit8:setWidth(50);
    obj.edit8:setFontSize(12);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setTransparent(true);
    obj.edit8:setHeight(15);
    obj.edit8:setField("PotesTotalFicha1");
    obj.edit8:setName("edit8");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setTop(100);
    obj.label1:setLeft(140);
    obj.label1:setAutoSize(true);
    obj.label1:setText("Target");
    obj.label1:setName("label1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle2);
    obj.comboBox1:setLeft(185);
    obj.comboBox1:setTop(103);
    obj.comboBox1:setHeight(15);
    obj.comboBox1:setFontSize(12);
    obj.comboBox1:setItems({'Alvo 1', 'Alvo 2', 'Alvo 3'});
    obj.comboBox1:setName("comboBox1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setTop(118);
    obj.label2:setLeft(140);
    obj.label2:setAutoSize(true);
    obj.label2:setText("DEF");
    obj.label2:setName("label2");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle2);
    obj.edit9:setTop(120);
    obj.edit9:setLeft(170);
    obj.edit9:setWidth(30);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontSize(12);
    obj.edit9:setHeight(15);
    obj.edit9:setField("DefFicha1");
    obj.edit9:setName("edit9");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle2);
    obj.label3:setTop(118);
    obj.label3:setLeft(220);
    obj.label3:setAutoSize(true);
    obj.label3:setText("DEF");
    obj.label3:setName("label3");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle2);
    obj.edit10:setTop(120);
    obj.edit10:setLeft(250);
    obj.edit10:setWidth(30);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontSize(12);
    obj.edit10:setHeight(15);
    obj.edit10:setField("ResFicha1");
    obj.edit10:setName("edit10");

    obj._e_event0 = obj.btnAppFicha1:addEventListener("onClick",
        function (event)
            self.btnAppFicha1.fontColor="red"
            						PreparaFicha1()
        end);

    obj._e_event1 = obj.btnAppFicha2:addEventListener("onClick",
        function (event)
            self.btnAppFicha2.fontColor="red"
            						self.btnAppFicha2.text= Ficha2.Nome
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.MPBarPVP ~= nil then self.MPBarPVP:destroy(); self.MPBarPVP = nil; end;
        if self.labNameFicha ~= nil then self.labNameFicha:destroy(); self.labNameFicha = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.HPBarPVP ~= nil then self.HPBarPVP:destroy(); self.HPBarPVP = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.btnAppFicha2 ~= nil then self.btnAppFicha2:destroy(); self.btnAppFicha2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.btnAppFicha1 ~= nil then self.btnAppFicha1:destroy(); self.btnAppFicha1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.PotesBarPVP ~= nil then self.PotesBarPVP:destroy(); self.PotesBarPVP = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.OutrosBarPVP ~= nil then self.OutrosBarPVP:destroy(); self.OutrosBarPVP = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPVPMod()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPVPMod();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPVPMod = {
    newEditor = newfrmPVPMod, 
    new = newfrmPVPMod, 
    name = "frmPVPMod", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmPVPMod = _frmPVPMod;
Firecast.registrarForm(_frmPVPMod);

return _frmPVPMod;
