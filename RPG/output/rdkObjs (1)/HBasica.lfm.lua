require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmBasica()
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
    obj:setName("frmBasica");
    obj:setWidth(1000);
    obj:setHeight(600);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(1);
    obj.image1:setTop(5);
    obj.image1:setWidth(1000);
    obj.image1:setHeight(590);
    obj.image1:setCenter(true);
    obj.image1:setSRC("/imagens/HB.png");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setField("ImagemBasica");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(370);
    obj.image2:setTop(60);
    obj.image2:setWidth(100);
    obj.image2:setHeight(100);
    obj.image2:setName("image2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(170);
    obj.edit1:setTop(85);
    obj.edit1:setWidth(180);
    obj.edit1:setHeight(30);
    obj.edit1:setFontSize(16);
    obj.edit1:setField("NomeBasica");
    obj.edit1:setName("edit1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.scrollBox1);
    obj.textEditor1:setLeft(100);
    obj.textEditor1:setTop(170);
    obj.textEditor1:setWidth(370);
    obj.textEditor1:setHeight(270);
    obj.textEditor1:setField("BasicaDescri");
    obj.textEditor1:setName("textEditor1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(130);
    obj.button1:setTop(450);
    obj.button1:setFontSize(20);
    obj.button1:setHeight(30);
    obj.button1:setWidth(200);
    obj.button1:setText("Habi. Basica");
    obj.button1:setFontColor("White");
    obj.button1:setName("button1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(625);
    obj.edit2:setTop(69);
    obj.edit2:setWidth(70);
    obj.edit2:setHeight(25);
    obj.edit2:setFontSize(18);
    obj.edit2:setField("DanoBasica");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(780);
    obj.edit3:setTop(69);
    obj.edit3:setWidth(70);
    obj.edit3:setHeight(25);
    obj.edit3:setFontSize(18);
    obj.edit3:setField("CustoBasica");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(650);
    obj.edit4:setTop(102);
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(25);
    obj.edit4:setFontSize(18);
    obj.edit4:setField("DTBasica");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(600);
    obj.edit5:setTop(225);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(20);
    obj.edit5:setFontSize(16);
    obj.edit5:setField("PABasica");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(710);
    obj.edit6:setTop(225);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(20);
    obj.edit6:setFontSize(16);
    obj.edit6:setField("PMBasica");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox1);
    obj.edit7:setLeft(830);
    obj.edit7:setTop(225);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(20);
    obj.edit7:setFontSize(16);
    obj.edit7:setField("PFBasica");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox1);
    obj.edit8:setLeft(600);
    obj.edit8:setTop(252);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(20);
    obj.edit8:setFontSize(16);
    obj.edit8:setField("DEFBasica");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox1);
    obj.edit9:setLeft(710);
    obj.edit9:setTop(252);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(20);
    obj.edit9:setFontSize(16);
    obj.edit9:setField("RESBasica");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.scrollBox1);
    obj.edit10:setLeft(600);
    obj.edit10:setTop(303);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(20);
    obj.edit10:setFontSize(16);
    obj.edit10:setField("AcertoBasica");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.scrollBox1);
    obj.edit11:setLeft(715);
    obj.edit11:setTop(303);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(20);
    obj.edit11:setFontSize(16);
    obj.edit11:setField("AMBasica");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.scrollBox1);
    obj.edit12:setLeft(845);
    obj.edit12:setTop(303);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(20);
    obj.edit12:setFontSize(16);
    obj.edit12:setField("ESQBasica");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.scrollBox1);
    obj.edit13:setLeft(600);
    obj.edit13:setTop(328);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(20);
    obj.edit13:setFontSize(16);
    obj.edit13:setField("CritBasica");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.scrollBox1);
    obj.edit14:setLeft(715);
    obj.edit14:setTop(328);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(20);
    obj.edit14:setFontSize(16);
    obj.edit14:setField("CMBasica");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.scrollBox1);
    obj.edit15:setLeft(845);
    obj.edit15:setTop(328);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(20);
    obj.edit15:setFontSize(16);
    obj.edit15:setField("PersistBasica");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.scrollBox1);
    obj.edit16:setLeft(600);
    obj.edit16:setTop(353);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(20);
    obj.edit16:setFontSize(16);
    obj.edit16:setField("PHPBasica");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.scrollBox1);
    obj.edit17:setLeft(715);
    obj.edit17:setTop(353);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(20);
    obj.edit17:setFontSize(16);
    obj.edit17:setField("PMPBasica");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.scrollBox1);
    obj.edit18:setLeft(845);
    obj.edit18:setTop(353);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(20);
    obj.edit18:setFontSize(16);
    obj.edit18:setField("REGMPBasica");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.scrollBox1);
    obj.edit19:setLeft(600);
    obj.edit19:setTop(378);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(20);
    obj.edit19:setFontSize(16);
    obj.edit19:setField("VisaoBasica");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.scrollBox1);
    obj.edit20:setLeft(715);
    obj.edit20:setTop(378);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(20);
    obj.edit20:setFontSize(16);
    obj.edit20:setField("CorridaBasica");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.scrollBox1);
    obj.edit21:setLeft(863);
    obj.edit21:setTop(378);
    obj.edit21:setWidth(32);
    obj.edit21:setHeight(20);
    obj.edit21:setFontSize(16);
    obj.edit21:setField("DeslocamentoBasica");
    obj.edit21:setName("edit21");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            --[[ HABILIDADE BASICA ]]--								
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            				sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						
            				mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Habilidade Basica",
            				function (rolado)					
            					if sheet.AcertoMagico >= rolado.resultado then
            						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.BasicaDescri);
            						
            						if sheet.DanoBasica > 0 then
            							mesaDoPersonagem.chat:enviarMensagem(".. [§K4]Causando ".. tonumber(sheet.DanoBasica));
            						end;
            						
            						local mesa = Firecast.getMesaDe(sheet); 
            						sheet.BasicaBarrinha = mesa.meuJogador:getBarValue(2);
            						sheet.BasicaBarrinha = (tonumber(sheet.BasicaBarrinha) or 0) - (tonumber(sheet.CustoBasica) or 0);
            						mesa.meuJogador:requestSetBarValue(2, sheet.BasicaBarrinha);
            					else
            						mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
            					end;
            				end);
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

        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmBasica()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmBasica();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmBasica = {
    newEditor = newfrmBasica, 
    new = newfrmBasica, 
    name = "frmBasica", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmBasica = _frmBasica;
Firecast.registrarForm(_frmBasica);

return _frmBasica;
