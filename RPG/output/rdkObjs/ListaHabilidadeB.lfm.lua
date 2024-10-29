require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmListaHabilidadeBasica()
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
    obj:setName("frmListaHabilidadeBasica");
    obj:setHeight(50);
    obj:setTheme("dark");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({left=4, right=4, top=4, bottom=4});
    obj.layout1:setName("layout1");

    obj.imgIconSkill = GUI.fromHandle(_obj_newObject("image"));
    obj.imgIconSkill:setParent(obj.layout1);
    obj.imgIconSkill:setName("imgIconSkill");
    obj.imgIconSkill:setAlign("left");
    obj.imgIconSkill:setWidth(32);
    obj.imgIconSkill:setHeight(32);
    obj.imgIconSkill:setField("fldImgIconSkill");
    obj.imgIconSkill.animate = true;
    obj.imgIconSkill:setSRC("https://thumbs.gfycat.com/BruisedDifferentHoverfly-size_restricted.gif");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("client");
    obj.label1:setText("Teste de label");
    obj.label1:setFontColor("Crimson");
    obj.label1:setField("NomeHabilidade");
    obj.label1:setMargins({left=10});
    obj.label1:setName("label1");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            if sheet.NomeHabilidade == nil then
            			self.imgIconSkill.src = "https://thumbs.gfycat.com/BruisedDifferentHoverfly-size_restricted.gif"
            			sheet.fldImgIconSkill = "https://thumbs.gfycat.com/BruisedDifferentHoverfly-size_restricted.gif"; 
            		end;
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

        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.imgIconSkill ~= nil then self.imgIconSkill:destroy(); self.imgIconSkill = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmListaHabilidadeBasica()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmListaHabilidadeBasica();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmListaHabilidadeBasica = {
    newEditor = newfrmListaHabilidadeBasica, 
    new = newfrmListaHabilidadeBasica, 
    name = "frmListaHabilidadeBasica", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmListaHabilidadeBasica = _frmListaHabilidadeBasica;
Firecast.registrarForm(_frmListaHabilidadeBasica);

return _frmListaHabilidadeBasica;
