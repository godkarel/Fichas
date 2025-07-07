require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmEffect()
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
    obj:setName("frmEffect");
    obj:setHeight(50);
    obj:setWidth(100);

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
    obj.label1:setField("NomeDoEfeito");
    obj.label1:setMargins({left=4, right=4, top=4, bottom=4});
    obj.label1:setName("label1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("NomeDoEfeito");
    obj.dataLink1:setDefaultValue("Nome do Efeito");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'PAEffect', 'PMEffect', 'PFEffect', 'DEFEffect', 'RESEffect', 
                   'ACEffect', 'ACMEffect', 'CREffect', 'CRMEffect', 'DadoEffect', 
                   'ESQEffect', 'PersEffect', 'VezEffect', 'ManaEffect', 'CDEffect', 
                   'DuraEffect', 'ContaEffect', 'TipoEffect', 'OutroEffect', 
                   'DanoEffect', 'HPTotalEffect', 'MPTotalEffect'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("NomeDoEfeito");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("OutroEffect");
    obj.dataLink4:setName("dataLink4");


                local function AplicaPassiva()
                        
                           
                end;
        


    obj._e_event0 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if FichaPrincipal ~= nil then        
                                    -- Acessa o RecordList do grupo de jogadores
                                    if FichaPrincipal.Efeitos ~= nil then
                                            FichaPrincipal.PAEffectTotal = 0
                                            FichaPrincipal.PMEffectTotal = 0
                                            FichaPrincipal.PFEffectTotal = 0
                                            FichaPrincipal.DEFEffectTotal = 0
                                            FichaPrincipal.RESEffectTotal = 0
                                            FichaPrincipal.ACEffectTotal = 0
                                            FichaPrincipal.ACMEffectTotal = 0
                                            FichaPrincipal.CREffectTotal = 0
                                            FichaPrincipal.CRMEffectTotal = 0
                                            FichaPrincipal.DadoEffectTotal = 0
                                            FichaPrincipal.ESQEffectTotal = 0
                                            FichaPrincipal.PersEffectTotal = 0
                                            FichaPrincipal.VezEffectTotal = 0
                                            FichaPrincipal.ManaEffectTotal = 0
                                            FichaPrincipal.CDEffectTotal = 0
                                            FichaPrincipal.DuraEffectTotal = 0
                                            FichaPrincipal.ContaEffectTotal = 0
                                            FichaPrincipal.TipoEffectTotal = 0
                                            FichaPrincipal.HPTotalEffectTotal = 0
                                            FichaPrincipal.MPTotalEffectTotal = 0
            
                                            local nodes = ndb.getChildNodes(FichaPrincipal.Efeitos) -- Substitua pelo campo correto
                                            for _, node in ipairs(nodes) do
                                                    FichaPrincipal.PAEffectTotal = tonumber(FichaPrincipal.PAEffectTotal or 0) + tonumber(node.PAEffect or 0)
                                                    FichaPrincipal.PMEffectTotal = tonumber(FichaPrincipal.PMEffectTotal or 0) + tonumber(node.PMEffect or 0)
                                                    FichaPrincipal.PFEffectTotal = tonumber(FichaPrincipal.PFEffectTotal or 0) + tonumber(node.PFEffect or 0)
                                                    FichaPrincipal.DEFEffectTotal = tonumber(FichaPrincipal.DEFEffectTotal or 0) + tonumber(node.DEFEffect or 0)
                                                    FichaPrincipal.RESEffectTotal = tonumber(FichaPrincipal.RESEffectTotal or 0) + tonumber(node.RESEffect or 0)
                                                    FichaPrincipal.ACEffectTotal = tonumber(FichaPrincipal.ACEffectTotal or 0) + tonumber(node.ACEffect or 0)
                                                    FichaPrincipal.ACMEffectTotal = tonumber(FichaPrincipal.ACMEffectTotal or 0) + tonumber(node.ACMEffect or 0)
                                                    FichaPrincipal.CREffectTotal = tonumber(FichaPrincipal.CREffectTotal or 0) + tonumber(node.CREffect or 0)
                                                    FichaPrincipal.CRMEffectTotal = tonumber(FichaPrincipal.CRMEffectTotal or 0) + tonumber(node.CRMEffect or 0)
                                                    FichaPrincipal.DadoEffectTotal = tonumber(FichaPrincipal.DadoEffectTotal or 0) + tonumber(node.DadoEffect or 0)
                                                    FichaPrincipal.ESQEffectTotal = tonumber(FichaPrincipal.ESQEffectTotal or 0) + tonumber(node.ESQEffect or 0)
                                                    FichaPrincipal.PersEffectTotal = tonumber(FichaPrincipal.PersEffectTotal or 0) + tonumber(node.PersEffect or 0)
                                                    FichaPrincipal.VezEffectTotal = tonumber(FichaPrincipal.VezEffectTotal or 0) + tonumber(node.VezEffect or 0)
                                                    FichaPrincipal.ManaEffectTotal = tonumber(FichaPrincipal.ManaEffectTotal or 0) + tonumber(node.ManaEffect or 0)
                                                    FichaPrincipal.CDEffectTotal = tonumber(FichaPrincipal.CDEffectTotal or 0) + tonumber(node.CDEffect or 0)
                                                    FichaPrincipal.DuraEffectTotal = tonumber(FichaPrincipal.DuraEffectTotal or 0) + tonumber(node.DuraEffect or 0)
                                                    FichaPrincipal.TipoEffectTotal = tonumber(FichaPrincipal.TipoEffectTotal or 0) + tonumber(node.TipoEffect or 0)
                                                    FichaPrincipal.HPTotalEffectTotal = tonumber(FichaPrincipal.HPTotalEffectTotal or 0) + tonumber(node.HPTotalEffect or 0)
                                                    FichaPrincipal.MPTotalEffectTotal = tonumber(FichaPrincipal.MPTotalEffectTotal or 0) + tonumber(node.MPTotalEffect or 0)
                                                    
                                                    -- Chama a função específica após processar cada node
                                                    ORCRacial()
                                                    StatusDeChances()
                                                    FichaPrincipalCalculaHP();
                                                    GambiCalculaHPAtual()
                                                    CalculaMP()
                                                    CalculaDefesaResistenciaPorNivel();
                                            end
                                    end
            
                            end;
        end);

    obj._e_event1 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            if FichaPrincipal ~= nil then
                                            if FichaPrincipal.Efeitos ~= nil then
                                                    AplicaPassiva();
                                            end;
                                    end;
        end);

    obj._e_event2 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            if FichaPrincipal ~= nil then
                                            if FichaPrincipal.Efeitos ~= nil then
                                                    if GambiDoTurno ~= nil then
                                                            if sheet.OutroEffect ~= GambiDoTurno then
                                                                    if sheet.DanoEffect ~= nil or sheet.DanoEffect ~= 0 then
                                                                            FichaPrincipal.HPAtual = tonumber(FichaPrincipal.HPAtual) - tonumber(sheet.DanoEffect or 0)
                                                                    end;
                                                            end;
                                                    end;
                                            end;
                                    end;
                                    GambiDoTurno = tonumber(sheet.OutroEffect) or 0;
        end);

    function obj:_releaseEvents()
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

        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmEffect()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmEffect();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmEffect = {
    newEditor = newfrmEffect, 
    new = newfrmEffect, 
    name = "frmEffect", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmEffect = _frmEffect;
Firecast.registrarForm(_frmEffect);

return _frmEffect;
