require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTeste()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("com.teste.plugin");
    obj:setTitle("TESTE PLUGIN");
    obj:setName("frmTeste");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setLeft(20);
    obj.tabControl1:setTop(20);
    obj.tabControl1:setHeight(500);
    obj.tabControl1:setWidth(500);
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Primeira Aba");
    obj.tab1:setName("tab1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.tab1);
    obj.layout1:setLeft(60);
    obj.layout1:setTop(50);
    obj.layout1:setWidth(300);
    obj.layout1:setHeight(300);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(30);
    obj.label1:setTop(25);
    obj.label1:setText("Teste");
    obj.label1:setWidth(75);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(80);
    obj.edit1:setTop(20);
    obj.edit1:setField("Execu");
    obj.edit1:setWidth(75);
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(180);
    obj.label2:setTop(25);
    obj.label2:setText("Custo");
    obj.label2:setWidth(75);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setLeft(220);
    obj.edit2:setTop(20);
    obj.edit2:setField("Custo");
    obj.edit2:setWidth(75);
    obj.edit2:setName("edit2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(80);
    obj.textEditor1:setTop(120);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(170);
    obj.textEditor1:setField("Descri");
    obj.textEditor1:setName("textEditor1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(80);
    obj.button1:setTop(80);
    obj.button1:setFontSize(20);
    obj.button1:setHeight(25);
    obj.button1:setWidth(120);
    obj.button1:setText("Executar");
    obj.button1:setFontColor("White");
    obj.button1:setName("button1");


				
				local function ExecutarH1() 
				
                        local mesaDoPersonagem = Firecast.getMesaDe(sheet);    

						sheet.Execu = tonumber(sheet.Execu) or 0;
						
                        mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade",
                                function (rolado)

                                       if sheet.Execu >= rolado.resultado then
									   
																					
                                                mesaDoPersonagem.chat:enviarMensagem("[§K1]".. sheet.Descri .. "");

                                        else
                                                mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA =/ ");
                                        end;                                        

                                end);          
                end;               
        


    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Segunda Aba");
    obj.tab2:setName("tab2");


			local function addCurrent()
				local mesa = Firecast.getMesaDe(sheet); 
				local current = mesa.meuJogador:getBarValue(2);
				current = current + (tonumber(sheet.current) or 0);
				mesa.meuJogador:requestSetBarValue(2, current);
			end;
			local function subtractCurrent()
				local mesa = Firecast.getMesaDe(sheet); 
				local current = mesa.meuJogador:getBarValue(2);
				current = current - (tonumber(sheet.current) or 0);
				mesa.meuJogador:requestSetBarValue(2, current);
			end;
			local function setCurrent()
				local mesa = Firecast.getMesaDe(sheet); 
				local current = (tonumber(sheet.current) or 0);
				mesa.meuJogador:requestSetBarValue(1, current);
			end;
			local function addMax()
				local mesa = Firecast.getMesaDe(sheet); 
				local current, max = mesa.meuJogador:getBarValue(1);
				max = max + (tonumber(sheet.max) or 0);
				mesa.meuJogador:requestSetBarValue(1, nil, max);
			end;
			local function subtractMax()
				local mesa = Firecast.getMesaDe(sheet); 
				local current, max = mesa.meuJogador:getBarValue(1);
				max = max - (tonumber(sheet.max) or 0);
				mesa.meuJogador:requestSetBarValue(1, nil, max);
			end;
			local function setMax()
				local mesa = Firecast.getMesaDe(sheet); 
				local max = (tonumber(sheet.max) or 0);
				mesa.meuJogador:requestSetBarValue(1, nil, max);
			end;
		


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab2);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(300);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(100);
    obj.label3:setHeight(25);
    obj.label3:setText("Atual");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setLeft(100);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("current");
    obj.edit3:setName("edit3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(150);
    obj.button2:setTop(0);
    obj.button2:setWidth(50);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(200);
    obj.button3:setTop(0);
    obj.button3:setWidth(50);
    obj.button3:setHeight(25);
    obj.button3:setText("-");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout2);
    obj.button4:setLeft(250);
    obj.button4:setTop(0);
    obj.button4:setWidth(50);
    obj.button4:setHeight(25);
    obj.button4:setText("=");
    obj.button4:setName("button4");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(25);
    obj.layout3:setWidth(300);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout3);
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setText("Maximo");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setLeft(100);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("max");
    obj.edit4:setName("edit4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout3);
    obj.button5:setLeft(150);
    obj.button5:setTop(0);
    obj.button5:setWidth(50);
    obj.button5:setHeight(25);
    obj.button5:setText("+");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout3);
    obj.button6:setLeft(200);
    obj.button6:setTop(0);
    obj.button6:setWidth(50);
    obj.button6:setHeight(25);
    obj.button6:setText("-");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout3);
    obj.button7:setLeft(250);
    obj.button7:setTop(0);
    obj.button7:setWidth(50);
    obj.button7:setHeight(25);
    obj.button7:setText("=");
    obj.button7:setName("button7");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            ExecutarH1()
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            addCurrent()
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            subtractCurrent()
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            setCurrent()
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            addMax()
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            subtractMax()
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            setMax()
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTeste()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTeste();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTeste = {
    newEditor = newfrmTeste, 
    new = newfrmTeste, 
    name = "frmTeste", 
    dataType = "com.teste.plugin", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "TESTE PLUGIN", 
    description=""};

frmTeste = _frmTeste;
Firecast.registrarForm(_frmTeste);
Firecast.registrarDataType(_frmTeste);

return _frmTeste;
