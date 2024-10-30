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
    obj:setTitle("Sistema de Combate Universal");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setField("Forca");
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(40);
    obj.button1:setTop(40);
    obj.button1:setText("ANTIGO");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(80);
    obj.button2:setTop(40);
    obj.button2:setText("NOVO");
    obj.button2:setName("button2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            local mesas = Firecast.getMesas();
            														
            							local itensFilhos = mesas[1].biblioteca.filhos
            							
            							local nomes = mesas[1].biblioteca.nome
            							
            							
            							local i = 1;       
            							
            							if itensFilhos[i] ~= nil then
            								for i = 1, #itensFilhos, 1 do								
            									showMessage(itensFilhos.nome[i])									
            								end; 
            							end;
            							
            							showMessage(nomes)
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local mesas = Firecast.getMesas();
        end, obj);

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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
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
    title = "Sistema de Combate Universal", 
    description=""};

frmSistemaCombateVelen = _frmSistemaCombateVelen;
Firecast.registrarForm(_frmSistemaCombateVelen);
Firecast.registrarDataType(_frmSistemaCombateVelen);
Firecast.registrarSpecialForm(_frmSistemaCombateVelen);

return _frmSistemaCombateVelen;
