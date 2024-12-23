require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmRacial()
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
    obj:setName("frmRacial");
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
    obj.image1:setSRC("/imagens/HR.png");
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setField("ImagemRacial");
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
    obj.edit1:setEnabled(false);
    obj.edit1:setFontSize(16);
    obj.edit1:setField("NomeRacial");
    obj.edit1:setName("edit1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.scrollBox1);
    obj.textEditor1:setLeft(100);
    obj.textEditor1:setTop(170);
    obj.textEditor1:setWidth(370);
    obj.textEditor1:setHeight(270);
    obj.textEditor1:setEnabled(false);
    obj.textEditor1:setField("RacialDescri");
    obj.textEditor1:setName("textEditor1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(130);
    obj.button1:setTop(450);
    obj.button1:setFontSize(20);
    obj.button1:setHeight(30);
    obj.button1:setWidth(200);
    obj.button1:setText("Usar Racial");
    obj.button1:setFontColor("White");
    obj.button1:setName("button1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.scrollBox1);
    obj.edit2:setLeft(625);
    obj.edit2:setTop(69);
    obj.edit2:setWidth(70);
    obj.edit2:setHeight(25);
    obj.edit2:setEnabled(false);
    obj.edit2:setFontSize(18);
    obj.edit2:setField("DanoRacial");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.scrollBox1);
    obj.edit3:setLeft(780);
    obj.edit3:setTop(69);
    obj.edit3:setWidth(70);
    obj.edit3:setHeight(25);
    obj.edit3:setEnabled(false);
    obj.edit3:setFontSize(18);
    obj.edit3:setField("CustoRacial");
    obj.edit3:setName("edit3");

    obj.DTRacialT = GUI.fromHandle(_obj_newObject("edit"));
    obj.DTRacialT:setParent(obj.scrollBox1);
    obj.DTRacialT:setName("DTRacialT");
    obj.DTRacialT:setLeft(650);
    obj.DTRacialT:setTop(102);
    obj.DTRacialT:setWidth(100);
    obj.DTRacialT:setHeight(25);
    obj.DTRacialT:setEnabled(false);
    obj.DTRacialT:setVisible(false);
    obj.DTRacialT:setFontSize(18);
    obj.DTRacialT:setField("DTRacial");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.scrollBox1);
    obj.edit4:setLeft(600);
    obj.edit4:setTop(225);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(20);
    obj.edit4:setOpacity(1.0);
    obj.edit4:setEnabled(true);
    obj.edit4:setType("float");
    obj.edit4:setDecimalPlaces(2);
    obj.edit4:setFontSize(16);
    obj.edit4:setField("OrcRacial");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.scrollBox1);
    obj.edit5:setLeft(710);
    obj.edit5:setTop(225);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(20);
    obj.edit5:setEnabled(true);
    obj.edit5:setFontSize(16);
    obj.edit5:setField("PMRacial");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox1);
    obj.edit6:setLeft(830);
    obj.edit6:setTop(225);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(20);
    obj.edit6:setEnabled(true);
    obj.edit6:setFontSize(16);
    obj.edit6:setField("PFRacial");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox1);
    obj.edit7:setLeft(600);
    obj.edit7:setTop(252);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(20);
    obj.edit7:setEnabled(true);
    obj.edit7:setFontSize(16);
    obj.edit7:setField("DEFRacial");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox1);
    obj.edit8:setLeft(710);
    obj.edit8:setTop(252);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(20);
    obj.edit8:setEnabled(true);
    obj.edit8:setFontSize(16);
    obj.edit8:setField("RESRacial");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox1);
    obj.edit9:setLeft(600);
    obj.edit9:setTop(303);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(20);
    obj.edit9:setEnabled(true);
    obj.edit9:setFontSize(16);
    obj.edit9:setField("AcertoRacial");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.scrollBox1);
    obj.edit10:setLeft(710);
    obj.edit10:setTop(303);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(20);
    obj.edit10:setEnabled(true);
    obj.edit10:setFontSize(16);
    obj.edit10:setField("AMRacial");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.scrollBox1);
    obj.edit11:setLeft(830);
    obj.edit11:setTop(303);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(20);
    obj.edit11:setEnabled(true);
    obj.edit11:setFontSize(16);
    obj.edit11:setField("ESQRacial");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.scrollBox1);
    obj.edit12:setLeft(600);
    obj.edit12:setTop(328);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(20);
    obj.edit12:setEnabled(true);
    obj.edit12:setFontSize(16);
    obj.edit12:setField("CritRacial");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.scrollBox1);
    obj.edit13:setLeft(710);
    obj.edit13:setTop(328);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(20);
    obj.edit13:setEnabled(true);
    obj.edit13:setFontSize(16);
    obj.edit13:setField("CMRacial");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.scrollBox1);
    obj.edit14:setLeft(830);
    obj.edit14:setTop(328);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(20);
    obj.edit14:setEnabled(true);
    obj.edit14:setFontSize(16);
    obj.edit14:setField("PersistRacial");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.scrollBox1);
    obj.edit15:setLeft(600);
    obj.edit15:setTop(353);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(20);
    obj.edit15:setEnabled(true);
    obj.edit15:setFontSize(16);
    obj.edit15:setField("PHPRacial");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.scrollBox1);
    obj.edit16:setLeft(710);
    obj.edit16:setTop(353);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(20);
    obj.edit16:setEnabled(true);
    obj.edit16:setFontSize(16);
    obj.edit16:setField("PMPRacial");
    obj.edit16:setName("edit16");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.scrollBox1);
    obj.dataLink1:setField("Raca");
    obj.dataLink1:setName("dataLink1");


			local function SkillRacial(RacialHabilidade)
				sheet.PARacial = 0;
				
				if sheet.classe == "Cavaleiro Draconico" then
					sheet.RacialDescri = "Skill Racial : Escama Draconica\nToda Batalha ele anulará o primeiro dano critico causados a ele anulando o dano total\nPassiva";
					sheet.CustoRacial = 0;
					sheet.PARacial = 0;
				else
					if sheet.Raca == "Humano" then
						sheet.NomeRacial = "Despertar (NIVEL UNICO)"
						sheet.RacialDescri = "Skill da Raça : Despertar\n Se livra de um efeito negativo, seja la qual for : sangramento, atordoamento, lentidão, silencio e etc.\n Custo 30 CD 1 vez por batalha / Defensiva";	
						sheet.CustoRacial = 30;
					end;
					
					if sheet.Raca == "Elfo" then
						sheet.NomeRacial = "Interromper (NIVEL UNICO)"
						sheet.RacialDescri = "Skill racial : Interromper\nNo momento que o oponente estiver conjurando a habilidade ele corta sua corrente de mana impedindo ele de completar sua conjuração e deixando a habilidade em CD\n( OBS : Ela não corta o conjuramento de Ultima )\n30 mana 1 vez por batalha /Defesa\nSkill Passiva :  Por ter uma audição e visão mais aguçada ele recebe +3 de percepção passiva";			   
						sheet.CustoRacial = 30;
					end;
					
					if sheet.Raca == "Elfo Negro" then
						sheet.NomeRacial = "Sombra da Natureza (NIVEL UNICO)"
						sheet.RacialDescri = "Skill da raça : Sombra da Natureza\nFicar Invisível se movimentando lentamente por 1 rodada teste de percepção 15\n30 Custo -CD 1 vez por batalha / Defesa\nSkill Passiva :  Por ter uma audição e visão mais aguçada ele recebe +3 de percepção passiva";		   
						sheet.CustoRacial = 30;
					end;

					if sheet.Raca == "Anão" then
						sheet.NomeRacial = "Cantoria de Anão (NIVEL UNICO)"
						sheet.RacialDescri = "Skill de Raça : Cantoria de Anão\nCanta muito alto com uma voz horrível e deixa todas as Habilidades do oponente com atraso de 1 de CD ate o ( final da batalha )\nHabilidades Basicas e Ultimas não sofrem esse efeito\nCusto 30 CD 1 vez por Batalha / Buff\nSkill Passiva : Tem + 10% de chance de Fortificar um equipamento";			   
						sheet.CustoRacial = 30;
					end;

					if sheet.Raca == "Orc" then						
						sheet.NomeRacial = "Furia Natural (NIVEL UNICO)"
						sheet.PARacial = math.floor(tonumber(sheet.PA) * 0.10); 
						sheet.RacialDescri = "Skill Passiva da Raça : Fúria Natural\n10% de Poder de Ataque de bônus\n[ Passiva ]\nSkill Passiva :  Recebe + 5 de Atletismo\nVeja com o mestre";		   
						sheet.CustoRacial = 0;
					end;

					if sheet.Raca == "Kamael" then
						sheet.NomeRacial = "Colecionador (NIVEL UNICO)"
						sheet.RacialDescri = "Skill de Raça : Colecionador\nAumenta em +1 o limite de Habilidades escolhidas pela classe\nPassiva\nSkill Passiva : Kamaeis não recebem dano de queda independente da altura que caírem pois podem planar com apenas 1 asa, não permitindo a eles voar";			   
						sheet.CustoRacial = 0;
					end;

					if sheet.Raca == "Thiefling" then
						sheet.NomeRacial = "Rabada (NIVEL UNICO)"
						sheet.RacialDescri = "Skill de Raça : Rabada\nUsa seu rabo que tem uma ponta afiada que causa 10% da vida do oponente em Dano Real\n35 Custo CD 1 vez por Dia \nSkill Passiva : Visão na penumbra ( Conseguem enxergar no escuro )";		   
						sheet.CustoRacial = 35;
					end;
				end;
			end;
		


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            --[[ HABILIDADE BASICA ]]--								
            				local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            				sheet.AcertoMagico = tonumber(sheet.AcertoMagico) or 0;						
            				mesaDoPersonagem.chat:rolarDados("1d20", "[§K3]Habilidade Racial",
            				function (rolado)					
            					if sheet.AcertoMagico >= rolado.resultado then
            						mesaDoPersonagem.chat:enviarMensagem(".. [§K3]".. sheet.RacialDescri);
            						
            						if sheet.DanoRacial > 0 then
            							mesaDoPersonagem.chat:enviarMensagem(".. [§K4]Causando ".. tonumber(sheet.DanoRacial));
            						end;
            						
            						local mesa = Firecast.getMesaDe(sheet); 
            						sheet.RacialBarrinha = sheet.MPAtual;
            						sheet.RacialBarrinha = (tonumber(sheet.RacialBarrinha) or 0) - (tonumber(sheet.CustoRacial) or 0);
            						sheet.MPAtual = sheet.RacialBarrinha;
            						mesa.meuJogador:requestSetBarValue(2, sheet.RacialBarrinha);
            					else
            						mesaDoPersonagem.chat:enviarMensagem("[§K4]FALHA :troll: ");
            					end;
            				end);
        end);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            SkillRacial(sheet.Raca);
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

        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.DTRacialT ~= nil then self.DTRacialT:destroy(); self.DTRacialT = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmRacial()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmRacial();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmRacial = {
    newEditor = newfrmRacial, 
    new = newfrmRacial, 
    name = "frmRacial", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmRacial = _frmRacial;
Firecast.registrarForm(_frmRacial);

return _frmRacial;
