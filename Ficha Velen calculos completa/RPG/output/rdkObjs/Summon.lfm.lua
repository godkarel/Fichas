require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmsummon()
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
    obj:setName("frmsummon");
    obj:setWidth(650);
    obj:setHeight(920);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({bottom=4});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("Nova Summon");
    obj.button1:setWidth(150);
    obj.button1:setAlign("left");
    obj.button1:setName("button1");

    obj.rclSummon = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSummon:setParent(obj);
    obj.rclSummon:setName("rclSummon");
    obj.rclSummon:setField("campoDosItens");
    obj.rclSummon:setTemplateForm("frmSummon2");
    obj.rclSummon:setAlign("top");
    obj.rclSummon:setSelectable(true);
    obj.rclSummon:setLayout("horizontal");
    obj.rclSummon:setHeight(40);

    obj.FichaSummon = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.FichaSummon:setParent(obj);
    obj.FichaSummon:setName("FichaSummon");
    obj.FichaSummon:setVisible(false);
    obj.FichaSummon:setAlign("client");
    obj.FichaSummon:setMargins({left=4, right=4, top=2});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.FichaSummon);
    obj.scrollBox1:setLeft(10);
    obj.scrollBox1:setTop(10);
    obj.scrollBox1:setWidth(615);
    obj.scrollBox1:setHeight(800);
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setWidth(620);
    obj.image1:setHeight(920);
    obj.image1:setCenter(true);
    obj.image1:setSRC("/imagens/5.png");
    obj.image1:setName("image1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(145);
    obj.layout2:setTop(105);
    obj.layout2:setWidth(120);
    obj.layout2:setHeight(20);
    obj.layout2:setMargins({bottom=4});
    obj.layout2:setName("layout2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setAlign("client");
    obj.edit1:setField("campoTitulo");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(350);
    obj.edit2:setTop(105);
    obj.edit2:setWidth(120);
    obj.edit2:setHeight(20);
    obj.edit2:setField("ClasseSummon");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(150);
    obj.edit3:setTop(170);
    obj.edit3:setWidth(150);
    obj.edit3:setHeight(20);
    obj.edit3:setField("DanoFisicoSummon");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(150);
    obj.edit4:setTop(202);
    obj.edit4:setWidth(150);
    obj.edit4:setHeight(20);
    obj.edit4:setField("DanoMagicoSummon");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(100);
    obj.edit5:setTop(300);
    obj.edit5:setWidth(150);
    obj.edit5:setHeight(20);
    obj.edit5:setField("HPSummon");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(100);
    obj.edit6:setTop(332);
    obj.edit6:setWidth(150);
    obj.edit6:setHeight(20);
    obj.edit6:setField("MPSummon");
    obj.edit6:setName("edit6");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setField("FotoSummon");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setLeft(294);
    obj.image2:setTop(331);
    obj.image2:setWidth(295);
    obj.image2:setHeight(161);
    obj.image2:setName("image2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.scrollBox1);
    obj.textEditor1:setLeft(25);
    obj.textEditor1:setTop(520);
    obj.textEditor1:setWidth(500);
    obj.textEditor1:setHeight(150);
    obj.textEditor1:setField("HabilidadeSummon1");
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.scrollBox1);
    obj.textEditor2:setLeft(25);
    obj.textEditor2:setTop(720);
    obj.textEditor2:setWidth(500);
    obj.textEditor2:setHeight(150);
    obj.textEditor2:setField("HabilidadeSummon2");
    obj.textEditor2:setName("textEditor2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclSummon:append();
        end, obj);

    obj._e_event1 = obj.rclSummon:addEventListener("onSelect",
        function (_)
            --[[
                                    Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário
            						selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no
            						objeto Nodo (NodeDatabase) do item selecionado.
                              --]]                      
                              local node = self.rclSummon.selectedNode;  
                                     self.FichaSummon.node = node;                       
                              -- a caixa de detalhe só ficará visível se houver item selecionado
                                      self.FichaSummon.visible = (node ~= nil);
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.FichaSummon ~= nil then self.FichaSummon:destroy(); self.FichaSummon = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rclSummon ~= nil then self.rclSummon:destroy(); self.rclSummon = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmsummon()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmsummon();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmsummon = {
    newEditor = newfrmsummon, 
    new = newfrmsummon, 
    name = "frmsummon", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmsummon = _frmsummon;
Firecast.registrarForm(_frmsummon);

return _frmsummon;
