require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSistemaCombateVelen()
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
    obj:setName("frmSistemaCombateVelen");
    obj:setFormType("tablesDock");
    obj:setDataType("RRPG.DataTypeUnico.DaMinhaJanelaAcoplavel");
    obj:setTitle("Sistema de Combate Velen");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(10);
    obj.edit1:setTop(20);
    obj.edit1:setField("NomeFicha");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(10);
    obj.edit2:setTop(50);
    obj.edit2:setField("NomeProcuradoBibItem");
    obj.edit2:setName("edit2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(120);
    obj.button1:setTop(80);
    obj.button1:setText("Mostra Ficha 1");
    obj.button1:setName("button1");


		function PegaDadosFicha1()
			showMessage(Ficha1);
		end;
	


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            PegaDadosFicha1()
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

        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSistemaCombateVelen()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSistemaCombateVelen();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSistemaCombateVelen = {
    newEditor = newfrmSistemaCombateVelen, 
    new = newfrmSistemaCombateVelen, 
    name = "frmSistemaCombateVelen", 
    dataType = "RRPG.DataTypeUnico.DaMinhaJanelaAcoplavel", 
    formType = "tablesDock", 
    formComponentName = "form", 
    title = "Sistema de Combate Velen", 
    description=""};

frmSistemaCombateVelen = _frmSistemaCombateVelen;
Firecast.registrarForm(_frmSistemaCombateVelen);
Firecast.registrarDataType(_frmSistemaCombateVelen);
Firecast.registrarSpecialForm(_frmSistemaCombateVelen);

return _frmSistemaCombateVelen;
