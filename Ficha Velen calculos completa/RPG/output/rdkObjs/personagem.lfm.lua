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

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setWidth(620);
    obj.image1:setHeight(920);
    obj.image1:setCenter(true);
    obj.image1:setSRC("/imagens/4.png");
    obj.image1:setName("image1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj);
    obj.textEditor1:setLeft(40);
    obj.textEditor1:setTop(65);
    obj.textEditor1:setWidth(230);
    obj.textEditor1:setHeight(120);
    obj.textEditor1:setField("conhecimento");
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj);
    obj.textEditor2:setLeft(315);
    obj.textEditor2:setTop(65);
    obj.textEditor2:setWidth(230);
    obj.textEditor2:setHeight(120);
    obj.textEditor2:setField("Diaria");
    obj.textEditor2:setName("textEditor2");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj);
    obj.textEditor3:setLeft(40);
    obj.textEditor3:setTop(230);
    obj.textEditor3:setWidth(230);
    obj.textEditor3:setHeight(180);
    obj.textEditor3:setField("HabilidadeMontaria");
    obj.textEditor3:setName("textEditor3");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(147);
    obj.rectangle1:setTop(730);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setWidth(50);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(150);
    obj.label1:setTop(650);
    obj.label1:setWidth(230);
    obj.label1:setHeight(180);
    obj.label1:setField("RHPNivel");
    obj.label1:setName("label1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setLeft(147);
    obj.rectangle2:setTop(755);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(150);
    obj.label2:setTop(675);
    obj.label2:setWidth(230);
    obj.label2:setHeight(180);
    obj.label2:setField("CHPNivel");
    obj.label2:setName("label2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj);
    obj.rectangle3:setLeft(147);
    obj.rectangle3:setTop(780);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(150);
    obj.label3:setTop(700);
    obj.label3:setWidth(230);
    obj.label3:setHeight(180);
    obj.label3:setField("EHPNivel");
    obj.label3:setName("label3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj);
    obj.rectangle4:setLeft(147);
    obj.rectangle4:setTop(805);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setWidth(50);
    obj.rectangle4:setHeight(20);
    obj.rectangle4:setName("rectangle4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(150);
    obj.label4:setTop(725);
    obj.label4:setWidth(230);
    obj.label4:setHeight(180);
    obj.label4:setField("R20HPNivel");
    obj.label4:setName("label4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj);
    obj.rectangle5:setLeft(147);
    obj.rectangle5:setTop(830);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(20);
    obj.rectangle5:setName("rectangle5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setLeft(150);
    obj.label5:setTop(750);
    obj.label5:setWidth(270);
    obj.label5:setHeight(180);
    obj.label5:setField("RMPNivel");
    obj.label5:setName("label5");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj);
    obj.rectangle6:setLeft(147);
    obj.rectangle6:setTop(855);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(20);
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setLeft(150);
    obj.label6:setTop(775);
    obj.label6:setWidth(270);
    obj.label6:setHeight(180);
    obj.label6:setField("EMPNivel");
    obj.label6:setName("label6");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj);
    obj.image2:setField("imagemDoPersonagem");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(321);
    obj.image2:setTop(465);
    obj.image2:setWidth(230);
    obj.image2:setHeight(208);
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj);
    obj.image3:setField("imagemDoPersonagem2");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setLeft(43);
    obj.image3:setTop(465);
    obj.image3:setWidth(230);
    obj.image3:setHeight(208);
    obj.image3:setName("image3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(390);
    obj.edit1:setTop(240);
    obj.edit1:setWidth(75);
    obj.edit1:setHeight(20);
    obj.edit1:setField("Atletismo");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(390);
    obj.edit2:setTop(265);
    obj.edit2:setWidth(75);
    obj.edit2:setHeight(20);
    obj.edit2:setField("Percepção");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(390);
    obj.edit3:setTop(290);
    obj.edit3:setWidth(75);
    obj.edit3:setHeight(20);
    obj.edit3:setField("Vigor");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setLeft(390);
    obj.edit4:setTop(315);
    obj.edit4:setWidth(75);
    obj.edit4:setHeight(20);
    obj.edit4:setField("Sabedoria");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setLeft(390);
    obj.edit5:setTop(340);
    obj.edit5:setWidth(75);
    obj.edit5:setHeight(20);
    obj.edit5:setField("Acrobacia");
    obj.edit5:setName("edit5");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
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
