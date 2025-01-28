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
    obj.dataLink2:setFields({'DuraEffect', 'CDEffect', 'ContaEffect', 'TipoEffect', 'OutroEffect'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("NomeDoEfeito");
    obj.dataLink3:setName("dataLink3");


                local function AplicaPassiva()
                        --[[if sheet.NomeDoEfeito == "Defender(Nível Unico)" then
                                sheet.fldImgIconEffect = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df926ni-6d6a0a7d-c139-4ada-b60f-0d600b0e6018.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGY5MjZuaS02ZDZhMGE3ZC1jMTM5LTRhZGEtYjYwZi0wZDYwMGIwZTYwMTgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.AdwBUJAvbLkYsHMymGRCxNm-llWUmfXwEScNeIfbvVs"       
                                sheet.DadoEffect = FichaPrincipal.Persistencia
                        end; 

                        if sheet.NomeDoEfeito == "Statica(Nível 1)" or sheet.NomeDoEfeito == "Statica(Nível 2)" or sheet.NomeDoEfeito == "Statica(Nível 3)" then
				sheet.fldImgIconEffect = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axqt-07d619c9-7242-423f-bac8-07656326b95e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhxdC0wN2Q2MTljOS03MjQyLTQyM2YtYmFjOC0wNzY1NjMyNmI5NWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ng6pOotncQrNcnLwRQE10Hhg2QDhMQWGl-x3ZYTM0oA"
                                sheet.DadoEffect = 2
                        end; 
                        
                        if sheet.NomeDoEfeito == "( Ultima )Mago Pesado(Nível Único)" then
                                sheet.fldImgIconEffect = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axqh-e0e824e0-3d84-4e2e-815a-d53242a3025b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhxaC1lMGU4MjRlMC0zZDg0LTRlMmUtODE1YS1kNTMyNDJhMzAyNWIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.d3oc8D-5LJ-9vyL8NiT8GCwJHwXc_y_LY5uD-2ascCg"
                                sheet.ACEffect = 1
                                sheet.ESQEffect = 1
                                sheet.CREffect = -1
                                sheet.CRMEffect = 1
                                sheet.PersEffect = 1
                                sheet.ACMEffect = 1
                                sheet.ACMEffect = 1
                        end; 

                        if sheet.NomeDoEfeito == "Regeneração(Nível 1)" or sheet.NomeDoEfeito == "Regeneração(Nível 2)" or sheet.NomeDoEfeito == "Regeneração(Nível 3)" then
				sheet.fldImgIconEffect = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2gaez-9628a43d-1a35-4d85-a9a6-bef8cc0e658a.png/v1/fill/w_64,h_64,strp/4_regenerao_by_karelsama_df2gaez-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjQiLCJwYXRoIjoiXC9mXC9kYjFjMzZhMC03OGFjLTRmYjctOThlYS0xYjBhYWU4NmNlMmNcL2RmMmdhZXotOTYyOGE0M2QtMWEzNS00ZDg1LWE5YTYtYmVmOGNjMGU2NThhLnBuZyIsIndpZHRoIjoiPD02NCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.aPAtBW3sZ7iqvlELR5d-e8fP8hw7N6Mhnp1oJVbHNK4"
			end;

                        if sheet.NomeDoEfeito == "Espinhos(Nível 1)" or sheet.NomeDoEfeito == "Espinhos(Nível 2)" or sheet.NomeDoEfeito == "Espinhos(Nível 3)" or sheet.NomeDoEfeito == "Espinhos(Nível 4)"  or sheet.NomeDoEfeito == "Espinhos(Nível 5)" then
				sheet.fldImgIconEffect = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2gaf8-96090d7c-f02f-49f0-a32d-c7287e954fe9.png/v1/fill/w_64,h_64,strp/7_espinhos_by_karelsama_df2gaf8-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjQiLCJwYXRoIjoiXC9mXC9kYjFjMzZhMC03OGFjLTRmYjctOThlYS0xYjBhYWU4NmNlMmNcL2RmMmdhZjgtOTYwOTBkN2MtZjAyZi00OWYwLWEzMmQtYzcyODdlOTU0ZmU5LnBuZyIsIndpZHRoIjoiPD02NCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.Ij2u7Y_KniT4suOU5mtkiCnrLnofJy88ji_Vhqmk3D0"
                                sheet.DanoEffect = FichaPrincipal.Inteligencia
                        end;]]
                           
                end;
        


    obj._e_event0 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.DuraEffect == 0 then
                                       ndb.deleteNode(sheet)
                                    end;
        end);

    obj._e_event1 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            AplicaPassiva();
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
