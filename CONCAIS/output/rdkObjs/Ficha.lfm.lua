require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmCONCAIS()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setDataType("com.concais.br");
    obj:setTitle("CONCAIS");
    obj:setName("frmCONCAIS");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(20);
    obj.image1:setTop(20);
    obj.image1:setWidth(2000);
    obj.image1:setHeight(350);
    obj.image1:setSRC("/imagens/1.png");
    obj.image1:setName("image1");

    obj.I1 = gui.fromHandle(_obj_newObject("image"));
    obj.I1:setParent(obj.scrollBox1);
    obj.I1:setLeft(50);
    obj.I1:setTop(20);
    obj.I1:setWidth(800);
    obj.I1:setHeight(110);
    obj.I1:setName("I1");
    obj.I1:setVisible(false);
    obj.I1:setStyle("stretch");
    obj.I1:setOpacity(0.5);
    obj.I1:setSRC("/imagens/2.png");

    obj.IE1 = gui.fromHandle(_obj_newObject("image"));
    obj.IE1:setParent(obj.scrollBox1);
    obj.IE1:setLeft(50);
    obj.IE1:setTop(20);
    obj.IE1:setWidth(800);
    obj.IE1:setHeight(110);
    obj.IE1:setName("IE1");
    obj.IE1:setVisible(false);
    obj.IE1:setStyle("stretch");
    obj.IE1:setOpacity(1.0);
    obj.IE1:setSRC("/imagens/2.png");

    obj.I2 = gui.fromHandle(_obj_newObject("image"));
    obj.I2:setParent(obj.scrollBox1);
    obj.I2:setLeft(50);
    obj.I2:setTop(130);
    obj.I2:setWidth(800);
    obj.I2:setHeight(220);
    obj.I2:setName("I2");
    obj.I2:setVisible(false);
    obj.I2:setStyle("stretch");
    obj.I2:setOpacity(0.5);
    obj.I2:setSRC("/imagens/2.png");

    obj.IE2 = gui.fromHandle(_obj_newObject("image"));
    obj.IE2:setParent(obj.scrollBox1);
    obj.IE2:setLeft(50);
    obj.IE2:setTop(130);
    obj.IE2:setWidth(800);
    obj.IE2:setHeight(220);
    obj.IE2:setName("IE2");
    obj.IE2:setVisible(false);
    obj.IE2:setStyle("stretch");
    obj.IE2:setOpacity(1.0);
    obj.IE2:setSRC("/imagens/2.png");

    obj.I3 = gui.fromHandle(_obj_newObject("image"));
    obj.I3:setParent(obj.scrollBox1);
    obj.I3:setLeft(850);
    obj.I3:setTop(20);
    obj.I3:setWidth(640);
    obj.I3:setHeight(110);
    obj.I3:setName("I3");
    obj.I3:setVisible(false);
    obj.I3:setStyle("stretch");
    obj.I3:setOpacity(0.5);
    obj.I3:setSRC("/imagens/2.png");

    obj.IE3 = gui.fromHandle(_obj_newObject("image"));
    obj.IE3:setParent(obj.scrollBox1);
    obj.IE3:setLeft(850);
    obj.IE3:setTop(20);
    obj.IE3:setWidth(640);
    obj.IE3:setHeight(110);
    obj.IE3:setName("IE3");
    obj.IE3:setVisible(false);
    obj.IE3:setStyle("stretch");
    obj.IE3:setOpacity(1.0);
    obj.IE3:setSRC("/imagens/2.png");

    obj.I4 = gui.fromHandle(_obj_newObject("image"));
    obj.I4:setParent(obj.scrollBox1);
    obj.I4:setLeft(850);
    obj.I4:setTop(130);
    obj.I4:setWidth(640);
    obj.I4:setHeight(220);
    obj.I4:setName("I4");
    obj.I4:setVisible(false);
    obj.I4:setStyle("stretch");
    obj.I4:setOpacity(0.5);
    obj.I4:setSRC("/imagens/2.png");

    obj.IE4 = gui.fromHandle(_obj_newObject("image"));
    obj.IE4:setParent(obj.scrollBox1);
    obj.IE4:setLeft(850);
    obj.IE4:setTop(130);
    obj.IE4:setWidth(640);
    obj.IE4:setHeight(220);
    obj.IE4:setName("IE4");
    obj.IE4:setVisible(false);
    obj.IE4:setStyle("stretch");
    obj.IE4:setOpacity(1.0);
    obj.IE4:setSRC("/imagens/2.png");

    obj.I5 = gui.fromHandle(_obj_newObject("image"));
    obj.I5:setParent(obj.scrollBox1);
    obj.I5:setLeft(1480);
    obj.I5:setTop(20);
    obj.I5:setWidth(530);
    obj.I5:setHeight(110);
    obj.I5:setName("I5");
    obj.I5:setVisible(false);
    obj.I5:setStyle("stretch");
    obj.I5:setOpacity(0.5);
    obj.I5:setSRC("/imagens/2.png");

    obj.IE5 = gui.fromHandle(_obj_newObject("image"));
    obj.IE5:setParent(obj.scrollBox1);
    obj.IE5:setLeft(1480);
    obj.IE5:setTop(20);
    obj.IE5:setWidth(530);
    obj.IE5:setHeight(110);
    obj.IE5:setName("IE5");
    obj.IE5:setVisible(false);
    obj.IE5:setStyle("stretch");
    obj.IE5:setOpacity(1.0);
    obj.IE5:setSRC("/imagens/2.png");

    obj.I6 = gui.fromHandle(_obj_newObject("image"));
    obj.I6:setParent(obj.scrollBox1);
    obj.I6:setLeft(1480);
    obj.I6:setTop(130);
    obj.I6:setWidth(530);
    obj.I6:setHeight(220);
    obj.I6:setName("I6");
    obj.I6:setVisible(false);
    obj.I6:setStyle("stretch");
    obj.I6:setOpacity(0.5);
    obj.I6:setSRC("/imagens/2.png");

    obj.IE6 = gui.fromHandle(_obj_newObject("image"));
    obj.IE6:setParent(obj.scrollBox1);
    obj.IE6:setLeft(1480);
    obj.IE6:setTop(130);
    obj.IE6:setWidth(530);
    obj.IE6:setHeight(220);
    obj.IE6:setName("IE6");
    obj.IE6:setVisible(false);
    obj.IE6:setStyle("stretch");
    obj.IE6:setOpacity(1.0);
    obj.IE6:setSRC("/imagens/2.png");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(37);
    obj.rectangle1:setTop(120);
    obj.rectangle1:setWidth(90);
    obj.rectangle1:setHeight(120);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("RED");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(50);
    obj.label1:setTop(100);
    obj.label1:setFontSize(60);
    obj.label1:setWidth(100);
    obj.label1:setHeight(100);
    obj.label1:setFontColor("RED");
    obj.label1:setField("Tudo");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.scrollBox1);
    obj.label2:setLeft(40);
    obj.label2:setTop(160);
    obj.label2:setFontSize(30);
    obj.label2:setWidth(100);
    obj.label2:setHeight(100);
    obj.label2:setFontColor("RED");
    obj.label2:setText("TOTAL");
    obj.label2:setName("label2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(340);
    obj.rectangle2:setTop(50);
    obj.rectangle2:setWidth(85);
    obj.rectangle2:setHeight(70);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("blue");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setName("rectangle2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.scrollBox1);
    obj.label3:setLeft(350);
    obj.label3:setTop(30);
    obj.label3:setFontSize(60);
    obj.label3:setWidth(100);
    obj.label3:setHeight(100);
    obj.label3:setFontColor("BLUE");
    obj.label3:setText("20");
    obj.label3:setField("Quantidade");
    obj.label3:setName("label3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(250);
    obj.button1:setTop(80);
    obj.button1:setText("Menos");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(430);
    obj.button2:setTop(80);
    obj.button2:setText("Mais");
    obj.button2:setName("button2");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(340);
    obj.rectangle3:setTop(195);
    obj.rectangle3:setWidth(85);
    obj.rectangle3:setHeight(70);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("blue");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setName("rectangle3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.scrollBox1);
    obj.label4:setLeft(350);
    obj.label4:setTop(175);
    obj.label4:setFontSize(60);
    obj.label4:setWidth(100);
    obj.label4:setHeight(100);
    obj.label4:setFontColor("BLUE");
    obj.label4:setText("20");
    obj.label4:setField("Quantidade2");
    obj.label4:setName("label4");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox1);
    obj.button3:setLeft(250);
    obj.button3:setTop(225);
    obj.button3:setText("Menos");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox1);
    obj.button4:setLeft(430);
    obj.button4:setTop(225);
    obj.button4:setText("Mais");
    obj.button4:setName("button4");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(1090);
    obj.rectangle4:setTop(50);
    obj.rectangle4:setWidth(85);
    obj.rectangle4:setHeight(70);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("blue");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setName("rectangle4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.scrollBox1);
    obj.label5:setLeft(1100);
    obj.label5:setTop(30);
    obj.label5:setFontSize(60);
    obj.label5:setWidth(100);
    obj.label5:setHeight(100);
    obj.label5:setFontColor("BLUE");
    obj.label5:setText("20");
    obj.label5:setField("Quantidade3");
    obj.label5:setName("label5");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox1);
    obj.button5:setLeft(1000);
    obj.button5:setTop(80);
    obj.button5:setText("Menos");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox1);
    obj.button6:setLeft(1180);
    obj.button6:setTop(80);
    obj.button6:setText("Mais");
    obj.button6:setName("button6");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(1090);
    obj.rectangle5:setTop(195);
    obj.rectangle5:setWidth(85);
    obj.rectangle5:setHeight(70);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("blue");
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setName("rectangle5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.scrollBox1);
    obj.label6:setLeft(1100);
    obj.label6:setTop(175);
    obj.label6:setFontSize(60);
    obj.label6:setWidth(100);
    obj.label6:setHeight(100);
    obj.label6:setFontColor("BLUE");
    obj.label6:setText("20");
    obj.label6:setField("Quantidade4");
    obj.label6:setName("label6");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox1);
    obj.button7:setLeft(1000);
    obj.button7:setTop(225);
    obj.button7:setText("Menos");
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox1);
    obj.button8:setLeft(1180);
    obj.button8:setTop(225);
    obj.button8:setText("Mais");
    obj.button8:setName("button8");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox1);
    obj.rectangle6:setLeft(1690);
    obj.rectangle6:setTop(50);
    obj.rectangle6:setWidth(85);
    obj.rectangle6:setHeight(70);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("blue");
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setName("rectangle6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.scrollBox1);
    obj.label7:setLeft(1700);
    obj.label7:setTop(30);
    obj.label7:setFontSize(60);
    obj.label7:setWidth(100);
    obj.label7:setHeight(100);
    obj.label7:setFontColor("BLUE");
    obj.label7:setText("20");
    obj.label7:setField("Quantidade5");
    obj.label7:setName("label7");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox1);
    obj.button9:setLeft(1600);
    obj.button9:setTop(80);
    obj.button9:setText("Menos");
    obj.button9:setName("button9");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox1);
    obj.button10:setLeft(1780);
    obj.button10:setTop(80);
    obj.button10:setText("Mais");
    obj.button10:setName("button10");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox1);
    obj.rectangle7:setLeft(1690);
    obj.rectangle7:setTop(195);
    obj.rectangle7:setWidth(85);
    obj.rectangle7:setHeight(70);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("blue");
    obj.rectangle7:setStrokeSize(2);
    obj.rectangle7:setName("rectangle7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.scrollBox1);
    obj.label8:setLeft(1700);
    obj.label8:setTop(175);
    obj.label8:setFontSize(60);
    obj.label8:setWidth(100);
    obj.label8:setHeight(100);
    obj.label8:setFontColor("BLUE");
    obj.label8:setText("20");
    obj.label8:setField("Quantidade6");
    obj.label8:setName("label8");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox1);
    obj.button11:setLeft(1600);
    obj.button11:setTop(225);
    obj.button11:setText("Menos");
    obj.button11:setName("button11");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.scrollBox1);
    obj.button12:setLeft(1780);
    obj.button12:setTop(225);
    obj.button12:setText("Mais");
    obj.button12:setName("button12");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setFields({'Quantidade', 'Quantidade2', 'Quantidade3', 'Quantidade4', 'Quantidade5', 'Quantidade6', TOTAL});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            sheet.Quantidade = (tonumber(sheet.Quantidade) or 0)
            				        sheet.Quantidade = (tonumber(sheet.Quantidade) or 0) -1;
            						local texto1 = "Patio Vazio"; 
            						
            						if 0 > (tonumber(sheet.Quantidade) or 0) then
            						sheet.Quantidade = 0;
            						showMessage(texto1);
            						end;
            
            						if (tonumber(sheet.Quantidade) or 0) =="20" then
            						self.I1.opacity = 1.0;
            						showMessage(texto1);
            						end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            sheet.Quantidade = (tonumber(sheet.Quantidade) or 0)
            				        sheet.Quantidade = (tonumber(sheet.Quantidade) or 0) +1;
            						local texto = "Limite de Carros"; 
            						
            						if (tonumber(sheet.Quantidade) or 0) > 20 then
            						sheet.Quantidade = 20;	
            						end;				
            						
            						if (tonumber(sheet.Quantidade) or 0) > 19 then
            						showMessage(texto);
            						end;
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            sheet.Quantidade2 = (tonumber(sheet.Quantidade2) or 0)
            				        sheet.Quantidade2 = (tonumber(sheet.Quantidade2) or 0) -1;
            						local texto1 = "Patio Vazio"; 
            						
            						if 0 > (tonumber(sheet.Quantidade2) or 0) then
            						sheet.Quantidade2 = 0;
            						showMessage(texto1);
            						end;
            
            						if (tonumber(sheet.Quantidade2) or 0) =="30" then
            						self.I2.opacity = 1.0;
            						showMessage(texto1);
            						end;
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (self)
            sheet.Quantidade2 = (tonumber(sheet.Quantidade2) or 0)
            				        sheet.Quantidade2 = (tonumber(sheet.Quantidade2) or 0) +1;
            						local texto = "Limite de Carros"; 
            						
            						if (tonumber(sheet.Quantidade2) or 0) > 29 then
            						sheet.Quantidade2 = 30;	
            						end;			
            						
            						if (tonumber(sheet.Quantidade2) or 0) > 29 then
            						showMessage(texto);
            						end;
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (self)
            sheet.Quantidade3 = (tonumber(sheet.Quantidade3) or 0)
            				        sheet.Quantidade3 = (tonumber(sheet.Quantidade3) or 0) -1;
            						local texto1 = "Patio Vazio"; 
            						
            						if 0 > (tonumber(sheet.Quantidade3) or 0) then
            						sheet.Quantidade3 = 0;
            						showMessage(texto1);
            						end;
            
            						if (tonumber(sheet.Quantidade3) or 0) =="20" then
            						self.I3.opacity = 1.0;
            						showMessage(texto1);
            						end;
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (self)
            sheet.Quantidade3 = (tonumber(sheet.Quantidade3) or 0)
            				        sheet.Quantidade3 = (tonumber(sheet.Quantidade3) or 0) +1;
            						local texto = "Limite de Carros"; 
            						
            						if (tonumber(sheet.Quantidade3) or 0) > 20 then
            						sheet.Quantidade3 = 20;	
            						end;						
            						
            						if (tonumber(sheet.Quantidade3) or 0) > 19 then
            						showMessage(texto);
            						end;
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (self)
            sheet.Quantidade4 = (tonumber(sheet.Quantidade4) or 0)
            				        sheet.Quantidade4 = (tonumber(sheet.Quantidade4) or 0) -1;
            						local texto1 = "Patio Vazio"; 
            						
            						if 0 > (tonumber(sheet.Quantidade4) or 0) then
            						sheet.Quantidade4 = 0;
            						showMessage(texto1);
            						end;
            
            						if (tonumber(sheet.Quantidade4) or 0) =="20" then
            						self.I4.opacity = 1.0;
            						showMessage(texto1);
            						end;
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (self)
            sheet.Quantidade4 = (tonumber(sheet.Quantidade4) or 0)
            				        sheet.Quantidade4 = (tonumber(sheet.Quantidade4) or 0) +1;
            						local texto = "Limite de Carros"; 											
            
            						if (tonumber(sheet.Quantidade4) or 0) > 20 then
            						sheet.Quantidade4 = 20;	
            						end;						
            						
            						if (tonumber(sheet.Quantidade4) or 0) > 19 then
            						showMessage(texto);
            						end;
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
        function (self)
            sheet.Quantidade5 = (tonumber(sheet.Quantidade5) or 0)
            				        sheet.Quantidade5 = (tonumber(sheet.Quantidade5) or 0) -1;
            						local texto1 = "Patio Vazio"; 
            						
            						if 0 > (tonumber(sheet.Quantidade5) or 0) then
            						sheet.Quantidade5 = 0;
            						showMessage(texto1);
            						end;
            
            						if (tonumber(sheet.Quantidade5) or 0) =="20" then
            						self.I5.opacity = 1.0;
            						showMessage(texto1);
            						end;
        end, obj);

    obj._e_event9 = obj.button10:addEventListener("onClick",
        function (self)
            sheet.Quantidade5 = (tonumber(sheet.Quantidade5) or 0)
            				        sheet.Quantidade5 = (tonumber(sheet.Quantidade5) or 0) +1;
            						local texto = "Limite de Carros"; 
            						
            						if (tonumber(sheet.Quantidade5) or 0) > 20 then
            						sheet.Quantidade5 = 20;	
            						end;
            											
            						if (tonumber(sheet.Quantidade5) or 0) > 19 then
            						showMessage(texto);
            						end;
        end, obj);

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (self)
            sheet.Quantidade6 = (tonumber(sheet.Quantidade6) or 0)
            				        sheet.Quantidade6 = (tonumber(sheet.Quantidade6) or 0) -1;
            						local texto1 = "Patio Vazio"; 
            						
            						if 0 > (tonumber(sheet.Quantidade6) or 0) then
            						sheet.Quantidade6 = 0;
            						showMessage(texto1);
            						end;
            
            						if (tonumber(sheet.Quantidade6) or 0) =="20" then
            						self.I6.opacity = 1.0;
            						showMessage(texto1);
            						end;
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (self)
            sheet.Quantidade6 = (tonumber(sheet.Quantidade6) or 0)
            				        sheet.Quantidade6 = (tonumber(sheet.Quantidade6) or 0) +1;
            						local texto = "Limite de Carros"; 
            						
            						if (tonumber(sheet.Quantidade6) or 0) > 20 then
            						sheet.Quantidade6 = 20;	
            						end;					
            						
            						if (tonumber(sheet.Quantidade6) or 0) > 19 then
            						showMessage(texto);
            						end;
        end, obj);

    obj._e_event12 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if (tonumber(sheet.Quantidade) or 0) > 10 then
            						self.I1.visible = true;
            						else if (tonumber(sheet.Quantidade) or 0) > 19 then
            						self.IE1.visible = true;	
            						else
            						self.I1.visible = false;
            						end
            						end;
            						
            						if (tonumber(sheet.Quantidade) or 0) >19 then
            						self.IE1.visible = true;
            						else
            						self.IE1.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade) or 0) > 10 then
            						self.I1.visible = true;
            						else
            						self.I1.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade) or 0) >19 then
            						self.IE1.visible = true;
            						else
            						self.IE1.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade2) or 0) > 15 then
            						self.I2.visible = true;
            						else if (tonumber(sheet.Quantidade2) or 0) > 29 then
            						self.IE2.visible = true;	
            						else
            						self.I2.visible = false;
            						end
            						end;
            						
            						if (tonumber(sheet.Quantidade2) or 0) >29 then
            						self.IE2.visible = true;
            						else
            						self.IE2.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade2) or 0) > 15 then
            						self.I2.visible = true;
            						else
            						self.I2.visible = false;
            						end;
            						
            						
            						if (tonumber(sheet.Quantidade2) or 0) >29 then
            						self.IE2.visible = true;
            						else
            						self.IE2.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade3) or 0) > 10 then
            						self.I3.visible = true;
            						else if (tonumber(sheet.Quantidade3) or 0) > 19 then
            						self.IE3.visible = true;	
            						else
            						self.I3.visible = false;
            						end
            						end;
            						
            						if (tonumber(sheet.Quantidade3) or 0) >19 then
            						self.IE3.visible = true;
            						else
            						self.IE3.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade3) or 0) > 10 then
            						self.I3.visible = true;
            						else
            						self.I3.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade3) or 0) >19 then
            						self.IE3.visible = true;
            						else
            						self.IE3.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade4) or 0) > 10 then
            						self.I4.visible = true;
            						else if (tonumber(sheet.Quantidade4) or 0) > 19 then
            						self.IE4.visible = true;	
            						else
            						self.I4.visible = false;
            						end
            						end;
            						
            						if (tonumber(sheet.Quantidade4) or 0) >19 then
            						self.IE4.visible = true;
            						else
            						self.IE4.visible = false;
            						end;
            
            						if (tonumber(sheet.Quantidade4) or 0) > 10 then
            						self.I4.visible = true;
            						else
            						self.I4.visible = false;
            						end;
            						
            						
            						if (tonumber(sheet.Quantidade4) or 0) >19 then
            						self.IE4.visible = true;
            						else
            						self.IE4.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade5) or 0) > 10 then
            						self.I5.visible = true;
            						else if (tonumber(sheet.Quantidade5) or 0) > 19 then
            						self.IE5.visible = true;	
            						else
            						self.I5.visible = false;
            						end
            						end;
            
            						if (tonumber(sheet.Quantidade5) or 0) >19 then
            						self.IE5.visible = true;
            						else
            						self.IE5.visible = false;
            						end;
            
            						if (tonumber(sheet.Quantidade5) or 0) > 10 then
            						self.I5.visible = true;
            						else
            						self.I5.visible = false;
            						end;
            
            						if (tonumber(sheet.Quantidade5) or 0) >19 then
            						self.IE5.visible = true;
            						else
            						self.IE5.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade6) or 0) > 10 then
            						self.I6.visible = true;
            						else if (tonumber(sheet.Quantidade6) or 0) > 19 then
            						self.IE6.visible = true;	
            						else
            						self.I6.visible = false;
            						end
            						end;
            						
            						if (tonumber(sheet.Quantidade6) or 0) > 10 then
            						self.I6.visible = true;
            						else
            						self.I6.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade6) or 0) >19 then
            						self.IE6.visible = true;
            						else
            						self.IE6.visible = false;
            						end;
            
            						if (tonumber(sheet.Quantidade6) or 0) > 10 then
            						self.I6.visible = true;
            						else
            						self.I6.visible = false;
            						end;
            						
            						if (tonumber(sheet.Quantidade6) or 0) >19 then
            						self.IE6.visible = true;
            						else
            						self.IE6.visible = false;
            						end;
            						
            						sheet.Tudo = (tonumber(sheet.Quantidade) or 0) + (tonumber(sheet.Quantidade2) or 0) + (tonumber(sheet.Quantidade3) or 0) + (tonumber(sheet.Quantidade4) or 0) + (tonumber(sheet.Quantidade5) or 0) + (tonumber(sheet.Quantidade6) or 0);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
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

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.I5 ~= nil then self.I5:destroy(); self.I5 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.IE2 ~= nil then self.IE2:destroy(); self.IE2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.IE5 ~= nil then self.IE5:destroy(); self.IE5 = nil; end;
        if self.I6 ~= nil then self.I6:destroy(); self.I6 = nil; end;
        if self.I1 ~= nil then self.I1:destroy(); self.I1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.I4 ~= nil then self.I4:destroy(); self.I4 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.I3 ~= nil then self.I3:destroy(); self.I3 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.IE4 ~= nil then self.IE4:destroy(); self.IE4 = nil; end;
        if self.I2 ~= nil then self.I2:destroy(); self.I2 = nil; end;
        if self.IE3 ~= nil then self.IE3:destroy(); self.IE3 = nil; end;
        if self.IE1 ~= nil then self.IE1:destroy(); self.IE1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.IE6 ~= nil then self.IE6:destroy(); self.IE6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmCONCAIS = {
    newEditor = newfrmCONCAIS, 
    new = newfrmCONCAIS, 
    name = "frmCONCAIS", 
    dataType = "com.concais.br", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "CONCAIS", 
    description=""};

frmCONCAIS = _frmCONCAIS;
rrpg.registrarForm(_frmCONCAIS);
rrpg.registrarDataType(_frmCONCAIS);

return _frmCONCAIS;
