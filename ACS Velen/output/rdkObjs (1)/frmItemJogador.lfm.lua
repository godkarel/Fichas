require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItemJogador()
    local obj = GUI.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmItemJogador");
    obj:setHeight(100);
    obj:setMargins({top=2,bottom=2});

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setAlign("left");
    obj.image1:setWidth(100);
    obj.image1:setMargins({top=1});
    obj.image1:setSRC("http://fc03.deviantart.net/fs70/i/2011/234/5/4/dragon_aspects_by_rattlesnakedefender-d47ii5y.jpg");
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(150);
    obj.layout1:setMargins({right=1});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("top");
    obj.label1:setWidth(150);
    obj.label1:setField("NomeDoPersonagemVez");
    obj.label1:setMargins({top=1});
    obj.label1:setName("label1");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout1);
    obj.progressBar1:setAlign("top");
    obj.progressBar1:setField("HPBar");
    obj.progressBar1:setFieldMax("HPBarMax");
    obj.progressBar1:setWidth(150);
    obj.progressBar1:setColor("red");
    obj.progressBar1:setMargins({top=1});
    obj.progressBar1:setName("progressBar1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.progressBar1);
    obj.label2:setAlign("left");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setField("HPBar");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.progressBar1);
    obj.label3:setAlign("client");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("/");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.progressBar1);
    obj.label4:setAlign("right");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setField("HPBarMax");
    obj.label4:setName("label4");

    obj.progressBar2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar2:setParent(obj.layout1);
    obj.progressBar2:setAlign("top");
    obj.progressBar2:setWidth(150);
    obj.progressBar2:setColor("blue");
    obj.progressBar2:setField("MPBar");
    obj.progressBar2:setFieldMax("MPBarMax");
    obj.progressBar2:setMargins({top=1});
    obj.progressBar2:setName("progressBar2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.progressBar2);
    obj.label5:setAlign("left");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setField("MPBar");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.progressBar2);
    obj.label6:setAlign("right");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setText("---/---");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.progressBar2);
    obj.label7:setAlign("right");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setField("MPBarMax");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setLeft(400);
    obj.label8:setText("Vez");
    obj.label8:setMargins({right=1});
    obj.label8:setName("label8");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("right");
    obj.button1:setText("Remover");
    obj.button1:setWidth(80);
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            NDB.deleteNode(sheet);
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.progressBar2 ~= nil then self.progressBar2:destroy(); self.progressBar2 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItemJogador()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItemJogador();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItemJogador = {
    newEditor = newfrmItemJogador, 
    new = newfrmItemJogador, 
    name = "frmItemJogador", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmItemJogador = _frmItemJogador;
Firecast.registrarForm(_frmItemJogador);

return _frmItemJogador;
