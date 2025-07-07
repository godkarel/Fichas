require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmBuffO()
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
    obj:setName("frmBuffO");
    obj:setHeight(45);
    obj:setWidth(200);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setAlign("left");
    obj.image1:setTop(15);
    obj.image1:setWidth(40);
    obj.image1:setHeight(30);
    obj.image1:setVisible(true);
    obj.image1:setField("fldImgIconEffect");
    obj.image1:setName("image1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setAlign("client");
    obj.label1:setText("Teste de label");
    obj.label1:setField("NomeEfeitoO");
    obj.label1:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label1:setName("label1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("NomeEfeitoO");
    obj.dataLink1:setDefaultValue("Nome do Efeito");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'DuraEffect', 'CDEffect', 'ContaEffect', 'TipoEffect', 'ExpiraEffect'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'PAEffect', 'PMEffect', 'PFEffect', 'DEFEffect', 'RESEffect', 
                   'ACEffect', 'ACMEffect', 'CREffect', 'CRMEffect', 'DadoEffect', 
                   'ESQEffect', 'PersEffect', 'VezEffect', 'ManaEffect', 'CDEffect', 
                   'DuraEffect', 'ContaEffect', 'TipoEffect', 'ExpiraEffect', 
                   'DanoEffect', 'HPTotalEffect', 'MPTotalEffect'});
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if ASCPrincipal ~= nil then
                                            if sheet.DuraEffect ~= nil and sheet.DuraEffect ~= "" and sheet.DuraEffect >= 0 then
                                                    sheet.ExpiraEffect = tonumber(sheet.DuraEffect) + tonumber(ASCPrincipal.TurnoAtualControle) or 0
                                            end
                                    end;
            
                                    
            
                                            if sheet.ExpiraEffect == ASCPrincipal.TurnoAtualControle then
                                                    
                                                    sheet.PAEffect = 0
                                                    sheet.PMEffect = 0
                                                    sheet.PFEffect = 0
                                                    sheet.DEFEffect = 0
                                                    sheet.RESEffect = 0
                                                    sheet.ACEffect = 0
                                                    sheet.ACMEffect = 0
                                                    sheet.CREffect = 0
                                                    sheet.CRMEffect = 0
                                                    sheet.DadoEffect = 0
                                                    sheet.ESQEffect = 0
                                                    sheet.PersEffect = 0
                                                    sheet.ManaEffect = 0
                                                    sheet.CDEffect = 0
                                                    sheet.TipoEffect = 0
                                                    sheet.HPTotalEffect = 0
                                                    sheet.MPTotalEffect = 0
                                                    sheet.DanoEffect = 0
                                                    sheet.CustoEffect = 0 
                                                    sheet.CuraEffect = 0  
                                                    sheet.RegMPEffect = 0   
            
                                                    if RclSelecionadoDaVezO ~= nil then  
                                                            RclSelecionadoDaVezO.PAEffectTotal = 0
                                                            RclSelecionadoDaVezO.PMEffectTotal = 0
                                                            RclSelecionadoDaVezO.PFEffectTotal = 0
                                                            RclSelecionadoDaVezO.DEFEffectTotal = 0
                                                            RclSelecionadoDaVezO.RESEffectTotal = 0
                                                            RclSelecionadoDaVezO.ACEffectTotal = 0
                                                            RclSelecionadoDaVezO.ACMEffectTotal = 0
                                                            RclSelecionadoDaVezO.CREffectTotal = 0
                                                            RclSelecionadoDaVezO.CRMEffectTotal = 0
                                                            RclSelecionadoDaVezO.DadoEffectTotal = 0
                                                            RclSelecionadoDaVezO.ESQEffectTotal = 0
                                                            RclSelecionadoDaVezO.PersEffectTotal = 0
                                                            RclSelecionadoDaVezO.ManaEffectTotal = 0
                                                            RclSelecionadoDaVezO.CDEffectTotal = 0
                                                            RclSelecionadoDaVezO.TipoEffectTotal = 0
                                                            RclSelecionadoDaVezO.HPTotalEffectTotal = 0
                                                            RclSelecionadoDaVezO.MPTotalEffectTotal = 0
                                                            RclSelecionadoDaVezO.DanoEffectTotal = 0
                                                            RclSelecionadoDaVezO.CustoEffectTotal = 0
                                                            RclSelecionadoDaVezO.CuraEffectTotal = 0												
                                                            RclSelecionadoDaVezO.RegMPEffectTotal = 0
                                                    
                                                            if RclSelecionadoBuffO ~= nil then                     
                                                                    local nodes = ndb.getChildNodes(RclSelecionadoBuffO) -- Substitua pelo campo correto
                                                                    for _, node in ipairs(nodes) do
                                                                            RclSelecionadoDaVezO.PAEffectTotal = tonumber(RclSelecionadoDaVezO.PAEffectTotal or 0) + tonumber(node.PAEffect or 0)
                                                                            RclSelecionadoDaVezO.PMEffectTotal = tonumber(RclSelecionadoDaVezO.PMEffectTotal or 0) + tonumber(node.PMEffect or 0)
                                                                            RclSelecionadoDaVezO.PFEffectTotal = tonumber(RclSelecionadoDaVezO.PFEffectTotal or 0) + tonumber(node.PFEffect or 0)
                                                                            RclSelecionadoDaVezO.DEFEffectTotal = tonumber(RclSelecionadoDaVezO.DEFEffectTotal or 0) + tonumber(node.DEFEffect or 0)
                                                                            RclSelecionadoDaVezO.RESEffectTotal = tonumber(RclSelecionadoDaVezO.RESEffectTotal or 0) + tonumber(node.RESEffect or 0)
                                                                            RclSelecionadoDaVezO.ACEffectTotal = tonumber(RclSelecionadoDaVezO.ACEffectTotal or 0) + tonumber(node.ACEffect or 0)
                                                                            RclSelecionadoDaVezO.ACMEffectTotal = tonumber(RclSelecionadoDaVezO.ACMEffectTotal or 0) + tonumber(node.ACMEffect or 0)
                                                                            RclSelecionadoDaVezO.CREffectTotal = tonumber(RclSelecionadoDaVezO.CREffectTotal or 0) + tonumber(node.CREffect or 0)
                                                                            RclSelecionadoDaVezO.CRMEffectTotal = tonumber(RclSelecionadoDaVezO.CRMEffectTotal or 0) + tonumber(node.CRMEffect or 0)
                                                                            RclSelecionadoDaVezO.DadoEffectTotal = tonumber(RclSelecionadoDaVezO.DadoEffectTotal or 0) + tonumber(node.DadoEffect or 0)
                                                                            RclSelecionadoDaVezO.ESQEffectTotal = tonumber(RclSelecionadoDaVezO.ESQEffectTotal or 0) + tonumber(node.ESQEffect or 0)
                                                                            RclSelecionadoDaVezO.PersEffectTotal = tonumber(RclSelecionadoDaVezO.PersEffectTotal or 0) + tonumber(node.PersEffect or 0)
                                                                            RclSelecionadoDaVezO.ManaEffectTotal = tonumber(RclSelecionadoDaVezO.ManaEffectTotal or 0) + tonumber(node.ManaEffect or 0)
                                                                            RclSelecionadoDaVezO.CDEffectTotal = tonumber(RclSelecionadoDaVezO.CDEffectTotal or 0) + tonumber(node.CDEffect or 0)
                                                                            RclSelecionadoDaVezO.TipoEffectTotal = tonumber(RclSelecionadoDaVezO.TipoEffectTotal or 0) + tonumber(node.TipoEffect or 0)
                                                                            RclSelecionadoDaVezO.HPTotalEffectTotal = tonumber(RclSelecionadoDaVezO.HPTotalEffectTotal or 0) + tonumber(node.HPTotalEffect or 0)
                                                                            RclSelecionadoDaVezO.MPTotalEffectTotal = tonumber(RclSelecionadoDaVezO.MPTotalEffectTotal or 0) + tonumber(node.MPTotalEffect or 0)
                                                                            RclSelecionadoDaVezO.DanoEffectTotal = tonumber(RclSelecionadoDaVezO.DanoEffectTotal or 0) + tonumber(node.DanoEffect or 0)
                                                                            RclSelecionadoDaVezO.CustoEffectTotal = tonumber(RclSelecionadoDaVezO.CustoEffectTotal or 0) + tonumber(node.CustoEffect or 0)
                                                                            RclSelecionadoDaVezO.CuraEffectTotal = tonumber(RclSelecionadoDaVezO.CuraEffectTotal or 0) + tonumber(node.CuraEffect or 0)												
                                                                            RclSelecionadoDaVezO.RegMPEffectTotal = tonumber(RclSelecionadoDaVezO.RegMPEffectTotal or 0) + tonumber(node.RegMPEffect or 0)	
                                                                    end
                                                            end
            
                                                    
                                                    end;                    
                                                    ndb.deleteNode(sheet)                
                                            end;
        end);

    obj._e_event1 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            if RclSelecionadoBuffO ~= nil then  
                                    RclSelecionadoDaVezO.PAEffectTotal = 0
                                    RclSelecionadoDaVezO.PMEffectTotal = 0
                                    RclSelecionadoDaVezO.PFEffectTotal = 0
                                    RclSelecionadoDaVezO.DEFEffectTotal = 0
                                    RclSelecionadoDaVezO.RESEffectTotal = 0
                                    RclSelecionadoDaVezO.ACEffectTotal = 0
                                    RclSelecionadoDaVezO.ACMEffectTotal = 0
                                    RclSelecionadoDaVezO.CREffectTotal = 0
                                    RclSelecionadoDaVezO.CRMEffectTotal = 0
                                    RclSelecionadoDaVezO.DadoEffectTotal = 0
                                    RclSelecionadoDaVezO.ESQEffectTotal = 0
                                    RclSelecionadoDaVezO.PersEffectTotal = 0
                                    RclSelecionadoDaVezO.ManaEffectTotal = 0
                                    RclSelecionadoDaVezO.CDEffectTotal = 0
                                    RclSelecionadoDaVezO.TipoEffectTotal = 0
                                    RclSelecionadoDaVezO.HPTotalEffectTotal = 0
                                    RclSelecionadoDaVezO.MPTotalEffectTotal = 0
                                    RclSelecionadoDaVezO.DanoEffectTotal = 0
                                    RclSelecionadoDaVezO.CustoEffectTotal = 0
                                    RclSelecionadoDaVezO.CuraEffectTotal = 0												
                                    RclSelecionadoDaVezO.RegMPEffectTotal = 0
                            
                                    if RclSelecionadoBuffO ~= nil then                     
                                            local nodes = ndb.getChildNodes(RclSelecionadoBuffO) -- Substitua pelo campo correto
                                            for _, node in ipairs(nodes) do
                                                    RclSelecionadoDaVezO.PAEffectTotal = tonumber(RclSelecionadoDaVezO.PAEffectTotal or 0) + tonumber(node.PAEffect or 0)
                                                    RclSelecionadoDaVezO.PMEffectTotal = tonumber(RclSelecionadoDaVezO.PMEffectTotal or 0) + tonumber(node.PMEffect or 0)
                                                    RclSelecionadoDaVezO.PFEffectTotal = tonumber(RclSelecionadoDaVezO.PFEffectTotal or 0) + tonumber(node.PFEffect or 0)
                                                    RclSelecionadoDaVezO.DEFEffectTotal = tonumber(RclSelecionadoDaVezO.DEFEffectTotal or 0) + tonumber(node.DEFEffect or 0)
                                                    RclSelecionadoDaVezO.RESEffectTotal = tonumber(RclSelecionadoDaVezO.RESEffectTotal or 0) + tonumber(node.RESEffect or 0)
                                                    RclSelecionadoDaVezO.ACEffectTotal = tonumber(RclSelecionadoDaVezO.ACEffectTotal or 0) + tonumber(node.ACEffect or 0)
                                                    RclSelecionadoDaVezO.ACMEffectTotal = tonumber(RclSelecionadoDaVezO.ACMEffectTotal or 0) + tonumber(node.ACMEffect or 0)
                                                    RclSelecionadoDaVezO.CREffectTotal = tonumber(RclSelecionadoDaVezO.CREffectTotal or 0) + tonumber(node.CREffect or 0)
                                                    RclSelecionadoDaVezO.CRMEffectTotal = tonumber(RclSelecionadoDaVezO.CRMEffectTotal or 0) + tonumber(node.CRMEffect or 0)
                                                    RclSelecionadoDaVezO.DadoEffectTotal = tonumber(RclSelecionadoDaVezO.DadoEffectTotal or 0) + tonumber(node.DadoEffect or 0)
                                                    RclSelecionadoDaVezO.ESQEffectTotal = tonumber(RclSelecionadoDaVezO.ESQEffectTotal or 0) + tonumber(node.ESQEffect or 0)
                                                    RclSelecionadoDaVezO.PersEffectTotal = tonumber(RclSelecionadoDaVezO.PersEffectTotal or 0) + tonumber(node.PersEffect or 0)
                                                    RclSelecionadoDaVezO.ManaEffectTotal = tonumber(RclSelecionadoDaVezO.ManaEffectTotal or 0) + tonumber(node.ManaEffect or 0)
                                                    RclSelecionadoDaVezO.CDEffectTotal = tonumber(RclSelecionadoDaVezO.CDEffectTotal or 0) + tonumber(node.CDEffect or 0)
                                                    RclSelecionadoDaVezO.TipoEffectTotal = tonumber(RclSelecionadoDaVezO.TipoEffectTotal or 0) + tonumber(node.TipoEffect or 0)
                                                    RclSelecionadoDaVezO.HPTotalEffectTotal = tonumber(RclSelecionadoDaVezO.HPTotalEffectTotal or 0) + tonumber(node.HPTotalEffect or 0)
                                                    RclSelecionadoDaVezO.MPTotalEffectTotal = tonumber(RclSelecionadoDaVezO.MPTotalEffectTotal or 0) + tonumber(node.MPTotalEffect or 0)
                                                    RclSelecionadoDaVezO.DanoEffectTotal = tonumber(RclSelecionadoDaVezO.DanoEffectTotal or 0) + tonumber(node.DanoEffect or 0)
                                                    RclSelecionadoDaVezO.CustoEffectTotal = tonumber(RclSelecionadoDaVezO.CustoEffectTotal or 0) + tonumber(node.CustoEffect or 0)
                                                    RclSelecionadoDaVezO.CuraEffectTotal = tonumber(RclSelecionadoDaVezO.CuraEffectTotal or 0) + tonumber(node.CuraEffect or 0)												
                                                    RclSelecionadoDaVezO.RegMPEffectTotal = tonumber(RclSelecionadoDaVezO.RegMPEffectTotal or 0) + tonumber(node.RegMPEffect or 0)
                                            end
                                    end
            
                            
                            end;
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

        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmBuffO()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmBuffO();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmBuffO = {
    newEditor = newfrmBuffO, 
    new = newfrmBuffO, 
    name = "frmBuffO", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmBuffO = _frmBuffO;
Firecast.registrarForm(_frmBuffO);

return _frmBuffO;
