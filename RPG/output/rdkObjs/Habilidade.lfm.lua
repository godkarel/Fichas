require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmhabilidade()
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
    obj:setName("frmhabilidade");
    obj:setWidth(1050);
    obj:setHeight(650);


	function VerificaTipoSkill(AtributoSkill, UtilidadeSkill, DanoSkill, CustoSkill) 		
		if UtilidadeSkill == "Dano" then			
			RolaHabilidadeDano(AtributoSkill, UtilidadeSkill, DanoSkill, CustoSkill);
		end;		
	end;




	


			
	function RolaHabilidadeDano(AtributoSkill, UtilidadeSkill, DanoSkill, CustoSkill)	
		local mesaDoPersonagem = rrpg.getMesaDe(sheet);
		sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;		
		mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Executar Habilidade Ofensiva",
		function (rolado)					
			if sheet.AcertoMagico + 1 > rolado.resultado then
				if sheet.CMagico +1 > rolado.resultado then 
					mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando com [§K4,0] CRITICAL [§K9,0] « [§K4,0] " .. DanoSkill * 2 .. "[§K9,0] »");
				else
					mesaDoPersonagem.chat:enviarMensagem("[§K9,0]Causando « [§K4,0]" .. DanoSkill .. "[§K9,0] »");
				end;	
				showMessage(CustoSkill)
				local mesa = Firecast.getMesaDe(sheet); 
				local Custo2 = sheet.MPAtual;
				Custo2 = sheet.MPAtual;
				Custo2 = (tonumber(Custo2) or 0) - (tonumber(CustoSkill) or 0);
				sheet.MPAtual = Custo2;
				mesa.meuJogador:requestSetBarValue(2, Custo2);
			else
				mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
			end;	
		end);					
	end;
	






    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setWidth(1050);
    obj.image1:setHeight(720);
    obj.image1:setCenter(true);
    obj.image1:setVisible(true);
    obj.image1:setSRC("/imagens/3.png");
    obj.image1:setName("image1");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox1);
    obj.checkBox1:setLeft(600);
    obj.checkBox1:setTop(50);
    obj.checkBox1:setField("chuvinha");
    obj.checkBox1:setChecked(false);
    obj.checkBox1:setFontColor("red");
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setText("Magia da Chuva (liga/desliga)");
    obj.checkBox1:setName("checkBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("chuvinha");
    obj.dataLink1:setName("dataLink1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.scrollBox1);
    obj.label1:setLeft(200);
    obj.label1:setTop(15);
    obj.label1:setWidth(250);
    obj.label1:setHeight(40);
    obj.label1:setFontColor("Indigo");
    lfm_setPropAsString(obj.label1, "fontStyle", "bold");
    obj.label1:setFontFamily("Nyala");
    obj.label1:setFontSize(20);
    obj.label1:setText("Pontos de Habilidade");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setLeft(413);
    obj.edit1:setTop(20);
    obj.edit1:setWidth(30);
    obj.edit1:setFontSize(15);
    obj.edit1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit1, "fontStyle", "bold");
    obj.edit1:setHitTest(true);
    obj.edit1:setCanFocus(true);
    obj.edit1:setHeight(30);
    obj.edit1:setField("PontoHabilidade");
    obj.edit1:setName("edit1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setText("Nova Magia");
    obj.button1:setWidth(125);
    obj.button1:setHeight(40);
    obj.button1:setLeft(10);
    obj.button1:setTop(10);
    obj.button1:setName("button1");

    obj.rclListaDosItens3 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens3:setParent(obj.scrollBox1);
    obj.rclListaDosItens3:setName("rclListaDosItens3");
    obj.rclListaDosItens3:setField("ListaDeHabilidades");
    obj.rclListaDosItens3:setTemplateForm("frmItemDaLista3");
    obj.rclListaDosItens3:setWidth(450);
    obj.rclListaDosItens3:setHeight(550);
    obj.rclListaDosItens3:setLeft(70);
    obj.rclListaDosItens3:setTop(60);
    obj.rclListaDosItens3:setSelectable(true);

    obj.ListaJutsus3 = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.ListaJutsus3:setParent(obj.scrollBox1);
    obj.ListaJutsus3:setName("ListaJutsus3");
    obj.ListaJutsus3:setVisible(false);
    obj.ListaJutsus3:setWidth(490);
    obj.ListaJutsus3:setHeight(580);
    obj.ListaJutsus3:setLeft(540);
    obj.ListaJutsus3:setTop(60);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.ListaJutsus3);
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setColor("Transparent");
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setWidth(460);
    obj.rectangle1:setHeight(560);
    obj.rectangle1:setLeft(1);
    obj.rectangle1:setTop(1);
    obj.rectangle1:setName("rectangle1");

    obj.imghability = GUI.fromHandle(_obj_newObject("image"));
    obj.imghability:setParent(obj.rectangle1);
    obj.imghability:setName("imghability");
    obj.imghability:setAlign("client");
    obj.imghability:setStyle("stretch");
    obj.imghability:setVisible(false);
    obj.imghability.animate = true;
    obj.imghability:setSRC("https://i.pinimg.com/originals/91/95/f4/9195f4dd1b69f90038f627c8af422429.gif");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(60);
    obj.label2:setTop(10);
    obj.label2:setWidth(200);
    obj.label2:setHeight(40);
    obj.label2:setFontFamily("Nyala");
    obj.label2:setFontColor("Black");
    obj.label2:setFontSize(20);
    obj.label2:setText("Habilidade:");
    obj.label2:setName("label2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setLeft(140);
    obj.image2:setTop(15);
    obj.image2:setWidth(40);
    obj.image2:setHeight(30);
    obj.image2:setVisible(true);
    obj.image2:setField("fldImgIconSkill");
    obj.image2:setName("image2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(180);
    obj.edit2:setTop(15);
    obj.edit2:setWidth(230);
    obj.edit2:setHeight(30);
    obj.edit2:setFontSize(15);
    lfm_setPropAsString(obj.edit2, "fontStyle", "bold");
    obj.edit2:setField("NomeHabilidade");
    obj.edit2:setName("edit2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setLeft(60);
    obj.textEditor1:setTop(60);
    obj.textEditor1:setWidth(350);
    obj.textEditor1:setHeight(240);
    obj.textEditor1:setFontSize(15);
    lfm_setPropAsString(obj.textEditor1, "fontStyle", "bold");
    obj.textEditor1:setField("DescriHabilidade1");
    obj.textEditor1:setName("textEditor1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(60);
    obj.label3:setTop(370);
    obj.label3:setWidth(120);
    obj.label3:setHeight(40);
    obj.label3:setFontFamily("Nyala");
    obj.label3:setFontColor("Black");
    obj.label3:setFontSize(20);
    obj.label3:setText("Dano");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(115);
    obj.edit3:setTop(375);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(30);
    obj.edit3:setType("number");
    obj.edit3:setField("DanoHabilidade1");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(310);
    obj.label4:setTop(370);
    obj.label4:setWidth(60);
    obj.label4:setHeight(40);
    obj.label4:setFontFamily("Nyala");
    obj.label4:setFontColor("Black");
    obj.label4:setFontSize(20);
    obj.label4:setText("Real");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(350);
    obj.edit4:setTop(375);
    obj.edit4:setWidth(60);
    obj.edit4:setHeight(30);
    obj.edit4:setType("number");
    obj.edit4:setField("FixoHabilidade1");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(180);
    obj.label5:setTop(370);
    obj.label5:setWidth(60);
    obj.label5:setHeight(40);
    obj.label5:setFontFamily("Nyala");
    obj.label5:setFontColor("Black");
    obj.label5:setFontSize(20);
    obj.label5:setText("Cura");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(230);
    obj.edit5:setTop(375);
    obj.edit5:setWidth(70);
    obj.edit5:setHeight(30);
    obj.edit5:setType("number");
    obj.edit5:setField("CuraHabilidade1");
    obj.edit5:setName("edit5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(60);
    obj.label6:setTop(405);
    obj.label6:setWidth(120);
    obj.label6:setHeight(40);
    obj.label6:setFontFamily("Nyala");
    obj.label6:setFontColor("Black");
    obj.label6:setFontSize(20);
    obj.label6:setText("Custo");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(115);
    obj.edit6:setTop(410);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(30);
    obj.edit6:setType("number");
    obj.edit6:setField("CustoHabilidade");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setLeft(400);
    obj.edit7:setTop(405);
    obj.edit7:setWidth(40);
    obj.edit7:setHeight(30);
    obj.edit7:setVisible(false);
    obj.edit7:setType("number");
    obj.edit7:setField("Custo2");
    obj.edit7:setName("edit7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(172);
    obj.label7:setTop(410);
    obj.label7:setWidth(120);
    obj.label7:setHeight(40);
    obj.label7:setFontFamily("Nyala");
    obj.label7:setFontColor("Black");
    obj.label7:setFontSize(20);
    obj.label7:setText("Tipo");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(85);
    obj.label8:setTop(295);
    obj.label8:setWidth(120);
    obj.label8:setHeight(40);
    obj.label8:setFontFamily("Nyala");
    obj.label8:setFontColor("Red");
    obj.label8:setFontSize(16);
    obj.label8:setText("OPÇÃO:");
    obj.label8:setName("label8");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(140);
    obj.comboBox1:setTop(305);
    obj.comboBox1:setWidth(200);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setField("OpcaoHab");
    obj.comboBox1:setItems({'Ofensiva', 'Dano em Area', 'Cura', 'Cura em Area', 'Defensiva'});
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle1);
    obj.comboBox2:setLeft(207);
    obj.comboBox2:setTop(420);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setHeight(18);
    obj.comboBox2:setField("DanoAtributo1");
    obj.comboBox2:setItems({'PA', 'PF', 'PM', 'PA+M/PA', 'PF+M/PF', 'PM+M/PM', 'M/PA', 'M/PF', 'M/PM', 'PA+PF', 'PF+PM', 'PA+PM', 'M/PA+PF', 'M/PA+PM', 'M/PF+PM', 'M/PF+PA', 'M/PM+PF',
	 'M/PM+PA', 'M/PA+M/PF', 'M/PF+M/PM', 'M/PA+M/PM', 'REAL PA', 'REAL PF', 'REAL PM', 'Efeito', 'Buff'});
    obj.comboBox2:setName("comboBox2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setLeft(310);
    obj.label9:setTop(405);
    obj.label9:setWidth(60);
    obj.label9:setHeight(40);
    obj.label9:setFontFamily("Nyala");
    obj.label9:setFontColor("Black");
    obj.label9:setFontSize(20);
    obj.label9:setText("Level");
    obj.label9:setName("label9");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(350);
    obj.button2:setTop(410);
    obj.button2:setWidth(16);
    obj.button2:setHeight(30);
    obj.button2:setText("-");
    obj.button2:setName("button2");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setLeft(366);
    obj.edit8:setTop(410	);
    obj.edit8:setWidth(27);
    obj.edit8:setHeight(30);
    obj.edit8:setCanFocus(true);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setHitTest(true);
    obj.edit8:setType("number");
    obj.edit8:setField("LevelHabilidade");
    obj.edit8:setName("edit8");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(393);
    obj.button3:setTop(410);
    obj.button3:setWidth(16);
    obj.button3:setHeight(30);
    obj.button3:setText("+");
    obj.button3:setName("button3");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle1);
    obj.label10:setLeft(60);
    obj.label10:setTop(440);
    obj.label10:setWidth(120);
    obj.label10:setHeight(40);
    obj.label10:setFontFamily("Nyala");
    obj.label10:setFontColor("Black");
    obj.label10:setFontSize(20);
    obj.label10:setText("CD");
    obj.label10:setName("label10");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setLeft(90);
    obj.edit9:setTop(445);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(30);
    obj.edit9:setType("number");
    obj.edit9:setField("CDHabilidade");
    obj.edit9:setName("edit9");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle1);
    obj.label11:setLeft(135);
    obj.label11:setTop(440);
    obj.label11:setWidth(120);
    obj.label11:setHeight(40);
    obj.label11:setFontFamily("Nyala");
    obj.label11:setFontColor("Black");
    obj.label11:setFontSize(20);
    obj.label11:setText("Recarga");
    obj.label11:setName("label11");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setLeft(210);
    obj.edit10:setTop(445);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(30);
    obj.edit10:setType("number");
    obj.edit10:setField("RecargaHabilidade");
    obj.edit10:setName("edit10");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setLeft(255);
    obj.button4:setTop(445);
    obj.button4:setWidth(80);
    obj.button4:setHeight(30);
    obj.button4:setFontFamily("Nyala");
    obj.button4:setFontColor("White");
    obj.button4:setFontSize(20);
    obj.button4:setText("Resetar");
    obj.button4:setName("button4");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle1);
    obj.label12:setLeft(255);
    obj.label12:setTop(440);
    obj.label12:setWidth(120);
    obj.label12:setHeight(40);
    obj.label12:setVisible(false);
    obj.label12:setFontFamily("Nyala");
    obj.label12:setFontColor("Black");
    obj.label12:setFontSize(20);
    obj.label12:setText("CONTA");
    obj.label12:setName("label12");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setLeft(325);
    obj.edit11:setTop(445);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(30);
    obj.edit11:setVisible(false);
    obj.edit11:setType("number");
    obj.edit11:setField("ContaRecarga");
    obj.edit11:setName("edit11");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle1);
    obj.label13:setLeft(220);
    obj.label13:setTop(500);
    obj.label13:setWidth(120);
    obj.label13:setHeight(40);
    obj.label13:setFontFamily("Nyala");
    obj.label13:setFontColor("blue");
    obj.label13:setFontSize(20);
    obj.label13:setText("Intensidade");
    obj.label13:setName("label13");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle1);
    obj.edit12:setLeft(330);
    obj.edit12:setTop(505);
    obj.edit12:setWidth(80);
    obj.edit12:setHeight(30);
    obj.edit12:setEnabled(false);
    obj.edit12:setFontColor("Red");
    obj.edit12:setType("number");
    obj.edit12:setField("Hintensidade1");
    obj.edit12:setName("edit12");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle1);
    obj.image3:setLeft(60);
    obj.image3:setTop(460);
    obj.image3:setWidth(150);
    obj.image3:setHeight(150);
    obj.image3:setSRC("/imagens/magia.png");
    obj.image3:setName("image3");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle1);
    obj.button5:setLeft(220);
    obj.button5:setTop(550);
    obj.button5:setFontColor("red");
    obj.button5:setText("Apagar!");
    obj.button5:setMargins({left=4, right=4, top=2, bottom=2});
    obj.button5:setWidth(150);
    obj.button5:setName("button5");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle1);
    obj.edit13:setWidth(120);
    obj.edit13:setVisible(false);
    obj.edit13:setField("naoEBuff");
    obj.edit13:setName("edit13");

    obj.TargetName = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.TargetName:setParent(obj.rectangle1);
    obj.TargetName:setName("TargetName");
    obj.TargetName:setScale(1);
    obj.TargetName:setLeft(230);
    obj.TargetName:setTop(325	);
    obj.TargetName:setWidth(150);
    obj.TargetName:setHeight(40);

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.TargetName);
    obj.label14:setText("Alvo:");
    obj.label14:setFontColor("red");
    obj.label14:setAlign("right");
    obj.label14:setWidth(75);
    obj.label14:setName("label14");

    obj.cmbInimigosH = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigosH:setParent(obj.TargetName);
    obj.cmbInimigosH:setItems({'Inimigo 1', 'Inimigo 2', 'Inimigo 3'});
    obj.cmbInimigosH:setValues({'1', '2', '3'});
    obj.cmbInimigosH:setValue("1");
    obj.cmbInimigosH:setFontColor("#FF6347");
    obj.cmbInimigosH:setName("cmbInimigosH");
    obj.cmbInimigosH:setWidth(150);
    obj.cmbInimigosH:setHeight(25);

    obj.NameTipoDeGrupo = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.NameTipoDeGrupo:setParent(obj.rectangle1);
    obj.NameTipoDeGrupo:setName("NameTipoDeGrupo");
    obj.NameTipoDeGrupo:setScale(1);
    obj.NameTipoDeGrupo:setLeft(60);
    obj.NameTipoDeGrupo:setTop(325);
    obj.NameTipoDeGrupo:setWidth(150);
    obj.NameTipoDeGrupo:setHeight(40);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.NameTipoDeGrupo);
    obj.label15:setText("Grupo:");
    obj.label15:setFontColor("green");
    obj.label15:setAlign("right");
    obj.label15:setWidth(75);
    obj.label15:setName("label15");

    obj.cmbTipoGrupoH = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbTipoGrupoH:setParent(obj.NameTipoDeGrupo);
    obj.cmbTipoGrupoH:setItems({'Jogadores', 'Inimigos'});
    obj.cmbTipoGrupoH:setValues({'1', '2'});
    obj.cmbTipoGrupoH:setValue("1");
    obj.cmbTipoGrupoH:setFontColor("#00FF7F");
    obj.cmbTipoGrupoH:setName("cmbTipoGrupoH");
    obj.cmbTipoGrupoH:setField("cmbTipoDeGrupoFH");
    obj.cmbTipoGrupoH:setWidth(150);
    obj.cmbTipoGrupoH:setHeight(25);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setField("cmbTipoDeGrupoFH");
    obj.dataLink2:setName("dataLink2");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle1);
    obj.button6:setLeft(60);
    obj.button6:setTop(490);
    obj.button6:setFontSize(20);
    obj.button6:setOpacity(0.1);
    obj.button6:setHeight(90);
    obj.button6:setWidth(150);
    obj.button6:setText("Usar");
    obj.button6:setFontColor("White");
    obj.button6:setName("button6");

					
					function SoTesteH()
						
						local node = self.rclListaDosItens3.selectedNode; 
						self.ListaJutsus3.node = node;                       
						self.ListaJutsus3.visible = (node ~= nil);

						if self.cmbInimigosH.value == "" then
							showMessage("CADE O ALVO ?")
						else
							local nodeInimigo = await(ConsegueAlvoExterno(self, node, self.cmbInimigosH.value, node.cmbTipoDeGrupoFH, node.OpcaoHab));
							
							if nodeInimigo ~= nil then
								RolarHabilidadeNovo(self, node, self.cmbInimigosH.value, node.cmbTipoDeGrupoFH, nodeInimigo, node.OpcaoHab);
							else
								showMessage("Inimigo não encontrado.");
							end
						end;
					end																
				


    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.chuvinha ~= nil then
            					if sheet.chuvinha == true then						
            						self.imghability.visible = true;						
            					else
            						self.imghability.visible = false;						
            					end;
            				end;
        end);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (event)
            self.rclListaDosItens3:append();
        end);

    obj._e_event2 = obj.rclListaDosItens3:addEventListener("onSelect",
        function ()
            if sheet then
            					FichaPrincipal = sheet
            				end;          
            				local node = self.rclListaDosItens3.selectedNode; 
            				self.ListaJutsus3.node = node;                       
            				self.ListaJutsus3.visible = (node ~= nil);
            
            				if self.ListaJutsus3.visible == true then
            					self.ListaJutsus3.node.NomeHabilidade = self.ListaJutsus3.node.NomeHabilidade or 'Nome da Habilidade';
            					self.ListaJutsus3.node.DescriHabilidade1 = self.ListaJutsus3.node.DescriHabilidade1 or 'Descrição da Habilidade';
            					self.ListaJutsus3.node.DanoHabilidade1 = tonumber(self.ListaJutsus3.node.DanoHabilidade1) or 0;
            					self.ListaJutsus3.node.FixoHabilidade1 = tonumber(self.ListaJutsus3.node.FixoHabilidade1) or 0;
            					self.ListaJutsus3.node.CuraHabilidade1 = tonumber(self.ListaJutsus3.node.CuraHabilidade1) or 0;
            					self.ListaJutsus3.node.CustoHabilidade =tonumber( self.ListaJutsus3.node.CustoHabilidade) or 0;
            					self.ListaJutsus3.node.DanoAtributo1 = self.ListaJutsus3.node.DanoAtributo1 or 'Escolha';
            					self.ListaJutsus3.node.Hintensidade1 = tonumber(self.ListaJutsus3.node.Hintensidade1) or 0;	
            					self.ListaJutsus3.node.LevelHabilidade = tonumber(self.ListaJutsus3.node.LevelHabilidade) or 0;	
            					self.ListaJutsus3.node.CDHabilidade = tonumber(self.ListaJutsus3.node.CDHabilidade) or 0;	
            					self.ListaJutsus3.node.RecargaHabilidade = tonumber(self.ListaJutsus3.node.RecargaHabilidade) or 0;	
            					self.ListaJutsus3.node.ContaRecarga = tonumber(self.ListaJutsus3.node.ContaRecarga) or 0;	
            					self.ListaJutsus3.node.TurnoAtual = tonumber(self.ListaJutsus3.node.TurnoAtual) or 0;
            				end;
            
            				local mesas = rrpg.getRooms();
            				local bibliotecaAtual = mesas[1].library;
            				
            				local function obterNomesRecursivoH(bibItem)
            					local itensFilhos = bibItem.children;
            					local nomes = bibItem.name;
            					
            					for i = 1, #itensFilhos, 1 do
            						local bibItemFilho = itensFilhos[i];
            						local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            						if nomesDoFilho == "Sistema de Combaate Velen" then
            							-- Obter ID do personagem Loan
            							local idPersonagem = bibItemFilho;
            
            							-- Solicita acesso à ficha do personagem
            							local promise = bibItemFilho:asyncOpenNDB();
            
            							-- Aguarda até que a ficha esteja carregada
            							local nodeExterno = await(promise);
            
            							if nodeExterno.TurnoAtualControle ~= nil and nodeExterno.TurnoAtualControle ~= "" then
            								self.ListaJutsus3.node.TurnoAtual = tonumber(nodeExterno.TurnoAtualControle)
            							end;
            
            						end
            					end
            					return nomes
            				end
            				
            				if self.ListaJutsus3.node.TurnoAtual == 0 then 
            					self.ListaJutsus3.node.ContaRecarga = 0
            					self.ListaJutsus3.node.RecargaHabilidade = 0
            				end;				
            
            				local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            
            				if self.ListaJutsus3.node.ContaRecarga ~= nil and self.ListaJutsus3.node.ContaRecarga ~= "" and self.ListaJutsus3.node.ContaRecarga > 0 then
            					self.ListaJutsus3.node.RecargaHabilidade = tonumber(self.ListaJutsus3.node.ContaRecarga) + tonumber(self.ListaJutsus3.node.CDHabilidade) -  tonumber(self.ListaJutsus3.node.TurnoAtual)
            				end;
            
            				if  0 > self.ListaJutsus3.node.RecargaHabilidade then
            					self.ListaJutsus3.node.RecargaHabilidade = 0
            				end;
            					--------------- GAMBI DO COMBOBOX ----------------
            
            				local valorOriginal = node.cmbTipoDeGrupoFH;
            				
            				-- 1. Aplica o valor temporário
            				node.cmbTipoDeGrupoFH = "3";
            				
            				-- 2. Cria um delay usando uma função imediata
            				local function aplicarDelay()
            					-- 3. Restaura o valor original
            					node.cmbTipoDeGrupoFH = valorOriginal;
            					
            				end
            				
            				-- Alternativa 1: Usando uma tabela vazia para forçar um mini-delay
            				for i = 1, 10 do end -- Loop vazio para criar um pequeno delay
            				
            				aplicarDelay();
            				
            				-- Alternativa 2: Se precisar de mais tempo, usar um hack com rolagem de dados
            				-- mesaDoPersonagem.chat:rolarDados("1d1", "Delay", function() aplicarDelay() end);
        end);

    obj._e_event3 = obj.rclListaDosItens3:addEventListener("onEndEnumeration",
        function ()
            if self.rclListaDosItens3.selectedNode == nil and sheet ~= nil then
            					local nodes = ndb.getChildNodes(sheet.ListaDeHabilidades);               
            
            					if #nodes > 0 then
            						self.rclListaDosItens3.selectedNode = nodes[1];
            					end;
            				end;
        end);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (event)
            local node = self.ListaJutsus3.node;
            						sheet.PontoHabilidade = tonumber(sheet.PontoHabilidade) or 0;
            						node.LevelHabilidade = tonumber(node.LevelHabilidade) or 0;
            						
            						if node.LevelHabilidade > 0 then 
            							node.LevelHabilidade = tonumber(node.LevelHabilidade) - 1;
            							sheet.PontoHabilidade = tonumber(sheet.PontoHabilidade) + 1;
            						else
            							showMessage("Voce não pode reduzir mais o nivel da sua Habilidade");
            						end;
        end);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (event)
            local node = self.ListaJutsus3.node;
            						sheet.PontoHabilidade = tonumber(sheet.PontoHabilidade) or 0;
            						node.LevelHabilidade = tonumber(node.LevelHabilidade) or 0;
            						
            						if sheet.PontoHabilidade > 0 then 
            							if 4 >= node.LevelHabilidade then
            								node.LevelHabilidade = tonumber(node.LevelHabilidade) + 1;
            								sheet.PontoHabilidade = tonumber(sheet.PontoHabilidade) - 1;
            							else
            								showMessage("Sua habilidade chegou ao nivel Maximo");
            							end;
            						else							
            							showMessage("Voce não te mais pontos de Habilidade para Destribuir");
            						end;
        end);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (event)
            local node = self.rclListaDosItens3.selectedNode; 
            						self.ListaJutsus3.node = node;  
            						self.ListaJutsus3.node.RecargaHabilidade = 0;
            						RecarregaCD();
        end);

    obj._e_event7 = obj.button5:addEventListener("onClick",
        function (event)
            dialogs.confirmYesNo("Deseja realmente deletar esta habilidade?", 
            							function(confirmado)
            								if confirmado then
            									NDB.deleteNode(self.rclListaDosItens3.selectedNode)
            									
            									if self.rclListaDosItens3.selectedNode == nil and sheet ~= nil then
            										local nodes = ndb.getChildNodes(sheet.ListaDeHabilidades)               
            
            										if #nodes > 0 then
            											self.rclListaDosItens3.selectedNode = nodes[1]
            										end
            									end
            								end
            							end
            						)
        end);

    obj._e_event8 = obj.cmbTipoGrupoH:addEventListener("onClick",
        function (event)
            local node = self.rclListaDosItens3.selectedNode; 
            								self.ListaJutsus3.node = node;                       
            								self.ListaJutsus3.visible = (node ~= nil);
            
            								if self.cmbTipoGrupoH.value == "1" then
            									local mesas = rrpg.getRooms();
            									local bibliotecaAtual = mesas[1].library;
            									
            									lista = {}
            
            									local function obterNomesRecursivoH(bibItem)
            										local itensFilhos = bibItem.children;
            										local nomes = bibItem.name;
            
            										
            										
            										for i = 1, #itensFilhos, 1 do
            											local bibItemFilho = itensFilhos[i];
            											local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            											if nomesDoFilho == "Sistema de Combaate Velen" then
            												-- Obter ID do personagem Loan
            												local idPersonagem = bibItemFilho;
            
            												-- Solicita acesso à ficha do personagem
            												local promise = bibItemFilho:asyncOpenNDB();
            
            												-- Aguarda até que a ficha esteja carregada
            												local nodeExterno = await(promise);
            												
            												local nodesO = ndb.getChildNodes(nodeExterno.NomeOponentes)											
            												
            												for _, node in ipairs(nodesO) do
            													if node.NomeDoOponenteVez then  -- Verifica se o campo NomeDoOponenteVez existe
            														table.insert(lista, node.NomeDoOponenteVez)  -- Adiciona o valor do campo NomeDoOponenteVez à lista
            														
            													end
            												end
            												
            												table.sort(lista)
            												
            											end
            										end
            										return nomes
            									end
            
            									
            
            									local function atualizarComboBoxH()
            										local comboBox = self.cmbInimigosH
            
            										-- Adiciona os novos itens na ordem desejada
            										table.insert(lista, "Alvo Simulado")  -- Penúltimo item
            										table.insert(lista, "Dano em Área")   -- Último item
            										table.insert(lista, "Cura em Área")   -- Último item
            
            										comboBox.items = lista
            										comboBox.values = lista
            										comboBox.value = ""
            									end
            
            									local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            									atualizarComboBoxH()
            								end
            
            								if self.cmbTipoGrupoH.value == "2" then
            									local mesas = rrpg.getRooms();
            									local bibliotecaAtual = mesas[1].library;
            									
            									lista = {}
            
            									local function obterNomesRecursivoH(bibItem)
            										local itensFilhos = bibItem.children;
            										local nomes = bibItem.name;
            										
            										for i = 1, #itensFilhos, 1 do
            											local bibItemFilho = itensFilhos[i];
            											local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            											if nomesDoFilho == "Sistema de Combaate Velen" then
            												-- Obter ID do personagem Loan
            												local idPersonagem = bibItemFilho;
            
            												-- Solicita acesso à ficha do personagem
            												local promise = bibItemFilho:asyncOpenNDB();
            
            												-- Aguarda até que a ficha esteja carregada
            												local nodeExterno = await(promise);
            												
            												local nodesJ = ndb.getChildNodes(nodeExterno.NomeJogador)
            												
            												for _, node in ipairs(nodesJ) do
            													if node.NomeDoPersonagemVez then  -- Verifica se o campo NomeDoPersonagemVez existe
            														table.insert(lista, node.NomeDoPersonagemVez)  -- Adiciona o valor do campo NomeDoPersonagemVez à lista
            													end
            												end
            												
            												table.sort(lista)
            												
            											end
            										end
            										return nomes
            									end
            
            									local function atualizarComboBoxH()
            										local comboBox = self.cmbInimigosH
            
            										-- Adiciona os novos itens na ordem desejada
            										table.insert(lista, "Alvo Simulado")  -- Penúltimo item
            										table.insert(lista, "Dano em Área")   -- Último item
            										table.insert(lista, "Cura em Área")   -- Último item
            
            										comboBox.items = lista
            										comboBox.values = lista
            										comboBox.value = ""  -- Defina o primeiro item como selecionado por padrão
            									end
            
            									local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            									atualizarComboBoxH()
            								end;
            
            											if node.DanoAtributo1 == 'Cura' or node.DanoAtributo1 == 'Cura Fixa' then
            												if self.cmbTipoGrupoH.value == "1" then
            												local mesas = rrpg.getRooms();
            												local bibliotecaAtual = mesas[1].library;
            												
            												lista = {}
            
            												local function obterNomesRecursivoH(bibItem)
            													local itensFilhos = bibItem.children;
            													local nomes = bibItem.name;
            
            													
            													
            													for i = 1, #itensFilhos, 1 do
            														local bibItemFilho = itensFilhos[i];
            														local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            														if nomesDoFilho == "Sistema de Combaate Velen" then
            															-- Obter ID do personagem Loan
            															local idPersonagem = bibItemFilho;
            
            															-- Solicita acesso à ficha do personagem
            															local promise = bibItemFilho:asyncOpenNDB();
            
            															-- Aguarda até que a ficha esteja carregada
            															local nodeExterno = await(promise);
            															
            															local nodesO = ndb.getChildNodes(nodeExterno.NomeJogador)								
            															
            															for _, node in ipairs(nodesO) do
            																if node.NomeDoPersonagemVez then  -- Verifica se o campo NomeDoPersonagemVez existe
            																	table.insert(lista, node.NomeDoPersonagemVez)  -- Adiciona o valor do campo NomeDoPersonagemVez à lista
            																end
            															end
            															
            															table.sort(lista)
            															
            														end
            													end
            													return nomes
            												end
            
            												
            
            												local function atualizarComboBoxH()
            													local comboBox = self.cmbInimigosH
            
            													-- Adiciona os novos itens na ordem desejada
            													table.insert(lista, "Alvo Simulado")  -- Penúltimo item
            													table.insert(lista, "Dano em Área")   -- Último item
            													table.insert(lista, "Cura em Área")   -- Último item
            
            													comboBox.items = lista
            													comboBox.values = lista
            													comboBox.value = ""
            												end
            
            												local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            												atualizarComboBoxH()
            											end
            
            											if self.cmbTipoGrupoH.value == "2" then
            												local mesas = rrpg.getRooms();
            												local bibliotecaAtual = mesas[1].library;
            												
            												lista = {}
            
            												local function obterNomesRecursivoH(bibItem)
            													local itensFilhos = bibItem.children;
            													local nomes = bibItem.name;
            													
            													for i = 1, #itensFilhos, 1 do
            														local bibItemFilho = itensFilhos[i];
            														local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            														if nomesDoFilho == "Sistema de Combaate Velen" then
            															-- Obter ID do personagem Loan
            															local idPersonagem = bibItemFilho;
            
            															-- Solicita acesso à ficha do personagem
            															local promise = bibItemFilho:asyncOpenNDB();
            
            															-- Aguarda até que a ficha esteja carregada
            															local nodeExterno = await(promise);
            															
            															local nodesJ = ndb.getChildNodes(nodeExterno.NomeJogador)
            															
            															for _, node in ipairs(nodesJ) do
            																
            																if node.NomeDoOponenteVez then  -- Verifica se o campo NomeDoOponenteVez existe
            																	table.insert(lista, node.NomeDoOponenteVez)  -- Adiciona o valor do campo NomeDoOponenteVez à lista
            																	
            																end
            															end
            															
            															table.sort(lista)
            															
            														end
            													end
            													return nomes
            												end
            
            												local function atualizarComboBoxH()
            													local comboBox = self.cmbInimigosH
            
            													-- Adiciona os novos itens na ordem desejada
            													table.insert(lista, "Alvo Simulado")  -- Penúltimo item
            													table.insert(lista, "Dano em Área")   -- Último item
            													table.insert(lista, "Cura em Área")   -- Último item
            
            													comboBox.items = lista
            													comboBox.values = lista
            													comboBox.value = ""  -- Defina o primeiro item como selecionado por padrão
            												end
            
            												local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            												atualizarComboBoxH()
            											end;
            								end;
        end);

    obj._e_event9 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            local node = self.rclListaDosItens3.selectedNode; 
            								self.ListaJutsus3.node = node;                       
            								self.ListaJutsus3.visible = (node ~= nil);
            
            								if self.cmbTipoGrupoH.value == "1" then
            									local mesas = rrpg.getRooms();
            									local bibliotecaAtual = mesas[1].library;
            									
            									lista = {}
            
            									local function obterNomesRecursivoH(bibItem)
            										local itensFilhos = bibItem.children;
            										local nomes = bibItem.name;
            
            										
            										
            										for i = 1, #itensFilhos, 1 do
            											local bibItemFilho = itensFilhos[i];
            											local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            											if nomesDoFilho == "Sistema de Combaate Velen" then
            												-- Obter ID do personagem Loan
            												local idPersonagem = bibItemFilho;
            
            												-- Solicita acesso à ficha do personagem
            												local promise = bibItemFilho:asyncOpenNDB();
            
            												-- Aguarda até que a ficha esteja carregada
            												local nodeExterno = await(promise);
            												
            												local nodesO = ndb.getChildNodes(nodeExterno.NomeOponentes)											
            												
            												for _, node in ipairs(nodesO) do
            													if node.NomeDoOponenteVez then  -- Verifica se o campo NomeDoOponenteVez existe
            														table.insert(lista, node.NomeDoOponenteVez)  -- Adiciona o valor do campo NomeDoOponenteVez à lista
            														
            													end
            												end
            												
            												table.sort(lista)
            												
            											end
            										end
            										return nomes
            									end
            
            									
            
            									local function atualizarComboBoxH()
            										local comboBox = self.cmbInimigosH
            
            										-- Adiciona os novos itens na ordem desejada
            										table.insert(lista, "Alvo Simulado")  -- Penúltimo item
            										table.insert(lista, "Dano em Área")   -- Último item
            										table.insert(lista, "Cura em Área")   -- Último item
            
            										comboBox.items = lista
            										comboBox.values = lista
            										comboBox.value = ""
            									end
            
            									local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            									atualizarComboBoxH()
            								end
            
            								if self.cmbTipoGrupoH.value == "2" then
            									local mesas = rrpg.getRooms();
            									local bibliotecaAtual = mesas[1].library;
            									
            									lista = {}
            
            									local function obterNomesRecursivoH(bibItem)
            										local itensFilhos = bibItem.children;
            										local nomes = bibItem.name;
            										
            										for i = 1, #itensFilhos, 1 do
            											local bibItemFilho = itensFilhos[i];
            											local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            											if nomesDoFilho == "Sistema de Combaate Velen" then
            												-- Obter ID do personagem Loan
            												local idPersonagem = bibItemFilho;
            
            												-- Solicita acesso à ficha do personagem
            												local promise = bibItemFilho:asyncOpenNDB();
            
            												-- Aguarda até que a ficha esteja carregada
            												local nodeExterno = await(promise);
            												
            												local nodesJ = ndb.getChildNodes(nodeExterno.NomeJogador)
            												
            												for _, node in ipairs(nodesJ) do
            													if node.NomeDoPersonagemVez then  -- Verifica se o campo NomeDoPersonagemVez existe
            														table.insert(lista, node.NomeDoPersonagemVez)  -- Adiciona o valor do campo NomeDoPersonagemVez à lista
            													end
            												end
            												
            												table.sort(lista)
            												
            											end
            										end
            										return nomes
            									end
            
            									local function atualizarComboBoxH()
            										local comboBox = self.cmbInimigosH
            
            										-- Adiciona os novos itens na ordem desejada
            										table.insert(lista, "Alvo Simulado")  -- Penúltimo item
            										table.insert(lista, "Dano em Área")   -- Último item
            										table.insert(lista, "Cura em Área")   -- Último item
            
            										comboBox.items = lista
            										comboBox.values = lista
            										comboBox.value = ""  -- Defina o primeiro item como selecionado por padrão
            									end
            
            									local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            									atualizarComboBoxH()
            								end;
            
            											if node.DanoAtributo1 == 'Cura' or node.DanoAtributo1 == 'Cura Fixa' then
            												if self.cmbTipoGrupoH.value == "1" then
            												local mesas = rrpg.getRooms();
            												local bibliotecaAtual = mesas[1].library;
            												
            												lista = {}
            
            												local function obterNomesRecursivoH(bibItem)
            													local itensFilhos = bibItem.children;
            													local nomes = bibItem.name;
            
            													
            													
            													for i = 1, #itensFilhos, 1 do
            														local bibItemFilho = itensFilhos[i];
            														local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            														if nomesDoFilho == "Sistema de Combaate Velen" then
            															-- Obter ID do personagem Loan
            															local idPersonagem = bibItemFilho;
            
            															-- Solicita acesso à ficha do personagem
            															local promise = bibItemFilho:asyncOpenNDB();
            
            															-- Aguarda até que a ficha esteja carregada
            															local nodeExterno = await(promise);
            															
            															local nodesO = ndb.getChildNodes(nodeExterno.NomeJogador)								
            															
            															for _, node in ipairs(nodesO) do
            																if node.NomeDoPersonagemVez then  -- Verifica se o campo NomeDoPersonagemVez existe
            																	table.insert(lista, node.NomeDoPersonagemVez)  -- Adiciona o valor do campo NomeDoPersonagemVez à lista
            																end
            															end
            															
            															table.sort(lista)
            															
            														end
            													end
            													return nomes
            												end
            
            												
            
            												local function atualizarComboBoxH()
            													local comboBox = self.cmbInimigosH
            
            													-- Adiciona os novos itens na ordem desejada
            													table.insert(lista, "Alvo Simulado")  -- Penúltimo item
            													table.insert(lista, "Dano em Área")   -- Último item
            													table.insert(lista, "Cura em Área")   -- Último item
            
            													comboBox.items = lista
            													comboBox.values = lista
            													comboBox.value = ""
            												end
            
            												local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            												atualizarComboBoxH()
            											end
            
            											if self.cmbTipoGrupoH.value == "2" then
            												local mesas = rrpg.getRooms();
            												local bibliotecaAtual = mesas[1].library;
            												
            												lista = {}
            
            												local function obterNomesRecursivoH(bibItem)
            													local itensFilhos = bibItem.children;
            													local nomes = bibItem.name;
            													
            													for i = 1, #itensFilhos, 1 do
            														local bibItemFilho = itensFilhos[i];
            														local nomesDoFilho = obterNomesRecursivoH(bibItemFilho) or "";
            
            														if nomesDoFilho == "Sistema de Combaate Velen" then
            															-- Obter ID do personagem Loan
            															local idPersonagem = bibItemFilho;
            
            															-- Solicita acesso à ficha do personagem
            															local promise = bibItemFilho:asyncOpenNDB();
            
            															-- Aguarda até que a ficha esteja carregada
            															local nodeExterno = await(promise);
            															
            															local nodesJ = ndb.getChildNodes(nodeExterno.NomeJogador)
            															
            															for _, node in ipairs(nodesJ) do
            																
            																if node.NomeDoOponenteVez then  -- Verifica se o campo NomeDoOponenteVez existe
            																	table.insert(lista, node.NomeDoOponenteVez)  -- Adiciona o valor do campo NomeDoOponenteVez à lista
            																	
            																end
            															end
            															
            															table.sort(lista)
            															
            														end
            													end
            													return nomes
            												end
            
            												local function atualizarComboBoxH()
            													local comboBox = self.cmbInimigosH
            
            													-- Adiciona os novos itens na ordem desejada
            													table.insert(lista, "Alvo Simulado")  -- Penúltimo item
            													table.insert(lista, "Dano em Área")   -- Último item
            													table.insert(lista, "Cura em Área")   -- Último item
            
            													comboBox.items = lista
            													comboBox.values = lista
            													comboBox.value = ""  -- Defina o primeiro item como selecionado por padrão
            												end
            
            												local nomesDeTodosOsItens = obterNomesRecursivoH(bibliotecaAtual);
            												atualizarComboBoxH()
            											end;
            								end;
        end);

    obj._e_event10 = obj.button6:addEventListener("onClick",
        function (event)
            SoTesteH()
        end);

    function obj:_releaseEvents()
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

        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rclListaDosItens3 ~= nil then self.rclListaDosItens3:destroy(); self.rclListaDosItens3 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.cmbTipoGrupoH ~= nil then self.cmbTipoGrupoH:destroy(); self.cmbTipoGrupoH = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.TargetName ~= nil then self.TargetName:destroy(); self.TargetName = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.ListaJutsus3 ~= nil then self.ListaJutsus3:destroy(); self.ListaJutsus3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.NameTipoDeGrupo ~= nil then self.NameTipoDeGrupo:destroy(); self.NameTipoDeGrupo = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.imghability ~= nil then self.imghability:destroy(); self.imghability = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.cmbInimigosH ~= nil then self.cmbInimigosH:destroy(); self.cmbInimigosH = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmhabilidade()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmhabilidade();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmhabilidade = {
    newEditor = newfrmhabilidade, 
    new = newfrmhabilidade, 
    name = "frmhabilidade", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmhabilidade = _frmhabilidade;
Firecast.registrarForm(_frmhabilidade);

return _frmhabilidade;
