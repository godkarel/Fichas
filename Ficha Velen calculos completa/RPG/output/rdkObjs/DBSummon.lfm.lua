require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSummon2()
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
    obj:setName("frmSummon2");
    obj:setHeight(50);
    obj:setTheme("dark");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({left=4, right=4, top=4, bottom=4});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(32);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("client");
    obj.label1:setText("Teste de label");
    obj.label1:setField("campoTitulo");
    obj.label1:setMargins({left=4});
    obj.label1:setName("label1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSummon2()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSummon2();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSummon2 = {
    newEditor = newfrmSummon2, 
    new = newfrmSummon2, 
    name = "frmSummon2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSummon2 = _frmSummon2;
Firecast.registrarForm(_frmSummon2);

return _frmSummon2;
