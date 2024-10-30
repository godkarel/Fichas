require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSCV4()
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
    obj:setName("frmSCV4");
    obj:setFormType("tablesDock");
    obj:setDataType("RRPG.DataTypeUnico.SCV4");
    obj:setTitle("Sistema de Combate Velen 4");


		


 
			function AtualizadordeStatus()
				if self.cmbInimigo1.text == sheet.NomeJ1 then
					sheet.VI1 = (tonumber(sheet.VIDAJ1) or 0);
					sheet.DefesaAlvo1 = (tonumber(sheet.DefesaJ1) or 0);
					sheet.BuffDefesaAlvo1 = (tonumber(sheet.BuffDefJ1) or 0);
					sheet.ResistenciaAlvo1 = (tonumber(sheet.ResistenciaJ1) or 0);
					sheet.BuffResistenciaAlvo1 = (tonumber(sheet.BuffResisJ1) or 0);
				end;

				if self.cmbInimigo1.text == sheet.NomeJ2 then
					sheet.VI1 = (tonumber(sheet.VIDAJ2) or 0)
					sheet.DefesaAlvo1 = (tonumber(sheet.DefesaJ2) or 0);
					sheet.BuffDefesaAlvo1 = (tonumber(sheet.BuffDefJ2) or 0);
					sheet.ResistenciaAlvo1 = (tonumber(sheet.ResistenciaJ2) or 0);
					sheet.BuffResistenciaAlvo1 = (tonumber(sheet.BuffResisJ2) or 0);
				end;				 
				 
				if self.cmbInimigo1.text == sheet.NomeJ3 then
					sheet.VI1 = (tonumber(sheet.VIDAJ3) or 0)
					sheet.DefesaAlvo1 = (tonumber(sheet.DefesaJ3) or 0);
					sheet.BuffDefesaAlvo1 = (tonumber(sheet.BuffDefJ3) or 0);
					sheet.ResistenciaAlvo1 = (tonumber(sheet.ResistenciaJ3) or 0);
					sheet.BuffResistenciaAlvo1 = (tonumber(sheet.BuffResisJ3) or 0);
				end;	

				if self.cmbInimigo1.text == sheet.NomeJ4 then
					sheet.VI1 = (tonumber(sheet.VIDAJ4) or 0)
					sheet.DefesaAlvo1 = (tonumber(sheet.DefesaJ4) or 0);
					sheet.BuffDefesaAlvo1 = (tonumber(sheet.BuffDefJ4) or 0);
					sheet.ResistenciaAlvo1 = (tonumber(sheet.ResistenciaJ4) or 0);
					sheet.BuffResistenciaAlvo1 = (tonumber(sheet.BuffResisJ4) or 0);
				end;

				if self.cmbInimigo1.text == sheet.NomeJ5 then
					sheet.VI1 = (tonumber(sheet.VIDAJ5) or 0)
					sheet.DefesaAlvo1 = (tonumber(sheet.DefesaJ5) or 0);
					sheet.BuffDefesaAlvo1 = (tonumber(sheet.BuffDefJ5) or 0);
					sheet.ResistenciaAlvo1 = (tonumber(sheet.ResistenciaJ5) or 0);
					sheet.BuffResistenciaAlvo1 = (tonumber(sheet.BuffResisJ5) or 0);
				end;				 
				 
				if self.cmbInimigo1.text == sheet.NomeJ6 then
					sheet.VI1 = (tonumber(sheet.VIDAJ6) or 0)
					sheet.DefesaAlvo1 = (tonumber(sheet.DefesaJ6) or 0);
					sheet.BuffDefesaAlvo1 = (tonumber(sheet.BuffDefJ6) or 0);
					sheet.ResistenciaAlvo1 = (tonumber(sheet.ResistenciaJ6) or 0);
					sheet.BuffResistenciaAlvo1 = (tonumber(sheet.BuffResisJ6) or 0);
				end;
				
				if self.cmbInimigo1.text == sheet.NomeJ7 then
					sheet.VI1 = (tonumber(sheet.VIDAJ7) or 0)
					sheet.DefesaAlvo1 = (tonumber(sheet.DefesaJ7) or 0);
					sheet.BuffDefesaAlvo1 = (tonumber(sheet.BuffDefJ7) or 0);
					sheet.ResistenciaAlvo1 = (tonumber(sheet.ResistenciaJ7) or 0);
					sheet.BuffResistenciaAlvo1	= (tonumber(sheet.BuffResisJ7) or 0);
				end;
				
				if self.cmbInimigo1.text == sheet.NomeJ8 then
					sheet.VI1 = (tonumber(sheet.VIDAJ8) or 0)
					sheet.DefesaAlvo1 = (tonumber(sheet.DefesaJ8) or 0);
					sheet.BuffDefesaAlvo1 = (tonumber(sheet.BuffDefJ8) or 0);
					sheet.ResistenciaAlvo1 = (tonumber(sheet.ResistenciaJ8) or 0);
					sheet.BuffResistenciaAlvo1 = (tonumber(sheet.BuffResisJ8) or 0);
				end;
				
				if self.cmbInimigo1.text == sheet.NomeJ9 then
					sheet.VI1 = (tonumber(sheet.VIDAJ9) or 0)
					sheet.DefesaAlvo1 = (tonumber(sheet.DefesaJ9) or 0);
					sheet.BuffDefesaAlvo1 = (tonumber(sheet.BuffDefJ9) or 0);
					sheet.ResistenciaAlvo1 = (tonumber(sheet.ResistenciaJ9) or 0);
					sheet.BuffResistenciaAlvo1 = (tonumber(sheet.BuffResisJ9) or 0);
				end;
				
				if self.cmbInimigo1.text == sheet.NomeJ10 then
					sheet.VI1 = (tonumber(sheet.VIDAJ10) or 0)
					sheet.DefesaAlvo1 = (tonumber(sheet.DefesaJ10) or 0);
					sheet.BuffDefesaAlvo1 = (tonumber(sheet.BuffDefJ10) or 0);
					sheet.ResistenciaAlvo1 = (tonumber(sheet.ResistenciaJ10) or 0);
					sheet.BuffResistenciaAlvo1 = (tonumber(sheet.BuffResisJ10) or 0);
				end;
					
				---- ALVO 2 ---	
					
				if self.cmbInimigo2.text == sheet.NomeJ1 then
					sheet.VI2 = (tonumber(sheet.VIDAJ1) or 0);
					sheet.DefesaAlvo2 = (tonumber(sheet.DefesaJ1) or 0);
					sheet.BuffDefesaAlvo2 = (tonumber(sheet.BuffDefJ1) or 0);
					sheet.ResistenciaAlvo2 = (tonumber(sheet.ResistenciaJ1) or 0);
					sheet.BuffResistenciaAlvo2 = (tonumber(sheet.BuffResisJ1) or 0);
				end;

				if self.cmbInimigo2.text == sheet.NomeJ2 then
					sheet.VI2 = (tonumber(sheet.VIDAJ2) or 0)
					sheet.DefesaAlvo2 = (tonumber(sheet.DefesaJ2) or 0);
					sheet.BuffDefesaAlvo2 = (tonumber(sheet.BuffDefJ2) or 0);
					sheet.ResistenciaAlvo2 = (tonumber(sheet.ResistenciaJ2) or 0);
					sheet.BuffResistenciaAlvo2 = (tonumber(sheet.BuffResisJ2) or 0);
				end;				 
				 
				if self.cmbInimigo2.text == sheet.NomeJ3 then
					sheet.VI2 = (tonumber(sheet.VIDAJ3) or 0)
					sheet.DefesaAlvo2 = (tonumber(sheet.DefesaJ3) or 0);
					sheet.BuffDefesaAlvo2 = (tonumber(sheet.BuffDefJ3) or 0);
					sheet.ResistenciaAlvo2 = (tonumber(sheet.ResistenciaJ3) or 0);
					sheet.BuffResistenciaAlvo2 = (tonumber(sheet.BuffResisJ3) or 0);
				end;	

				if self.cmbInimigo2.text == sheet.NomeJ4 then
					sheet.VI2 = (tonumber(sheet.VIDAJ4) or 0)
					sheet.DefesaAlvo2 = (tonumber(sheet.DefesaJ4) or 0);
					sheet.BuffDefesaAlvo2 = (tonumber(sheet.BuffDefJ4) or 0);
					sheet.ResistenciaAlvo2 = (tonumber(sheet.ResistenciaJ4) or 0);
					sheet.BuffResistenciaAlvo2 = (tonumber(sheet.BuffResisJ4) or 0);
				end;

				if self.cmbInimigo2.text == sheet.NomeJ5 then
					sheet.VI2 = (tonumber(sheet.VIDAJ5) or 0)
					sheet.DefesaAlvo2 = (tonumber(sheet.DefesaJ5) or 0);
					sheet.BuffDefesaAlvo2 = (tonumber(sheet.BuffDefJ5) or 0);
					sheet.ResistenciaAlvo2 = (tonumber(sheet.ResistenciaJ5) or 0);
					sheet.BuffResistenciaAlvo2 = (tonumber(sheet.BuffResisJ5) or 0);
				end;				 
				 
				if self.cmbInimigo2.text == sheet.NomeJ6 then
					sheet.VI2 = (tonumber(sheet.VIDAJ6) or 0)
					sheet.DefesaAlvo2 = (tonumber(sheet.DefesaJ6) or 0);
					sheet.BuffDefesaAlvo2 = (tonumber(sheet.BuffDefJ6) or 0);
					sheet.ResistenciaAlvo2 = (tonumber(sheet.ResistenciaJ6) or 0);
					sheet.BuffResistenciaAlvo2 = (tonumber(sheet.BuffResisJ6) or 0);
				end;
				
				if self.cmbInimigo2.text == sheet.NomeJ7 then
					sheet.VI2 = (tonumber(sheet.VIDAJ7) or 0)
					sheet.DefesaAlvo2 = (tonumber(sheet.DefesaJ7) or 0);
					sheet.BuffDefesaAlvo2 = (tonumber(sheet.BuffDefJ7) or 0);
					sheet.ResistenciaAlvo2 = (tonumber(sheet.ResistenciaJ7) or 0);
					sheet.BuffResistenciaAlvo2	= (tonumber(sheet.BuffResisJ7) or 0);
				end;
				
				if self.cmbInimigo2.text == sheet.NomeJ8 then
					sheet.VI2 = (tonumber(sheet.VIDAJ8) or 0)
					sheet.DefesaAlvo2 = (tonumber(sheet.DefesaJ8) or 0);
					sheet.BuffDefesaAlvo2 = (tonumber(sheet.BuffDefJ8) or 0);
					sheet.ResistenciaAlvo2 = (tonumber(sheet.ResistenciaJ8) or 0);
					sheet.BuffResistenciaAlvo2 = (tonumber(sheet.BuffResisJ8) or 0);
				end;
				
				if self.cmbInimigo2.text == sheet.NomeJ9 then
					sheet.VI2 = (tonumber(sheet.VIDAJ9) or 0)
					sheet.DefesaAlvo2 = (tonumber(sheet.DefesaJ9) or 0);
					sheet.BuffDefesaAlvo2 = (tonumber(sheet.BuffDefJ9) or 0);
					sheet.ResistenciaAlvo2 = (tonumber(sheet.ResistenciaJ9) or 0);
					sheet.BuffResistenciaAlvo2	= (tonumber(sheet.BuffResisJ9) or 0);
				end;
				
				if self.cmbInimigo2.text == sheet.NomeJ10 then
					sheet.VI2 = (tonumber(sheet.VIDAJ10) or 0)
					sheet.DefesaAlvo2 = (tonumber(sheet.DefesaJ10) or 0);
					sheet.BuffDefesaAlvo2 = (tonumber(sheet.BuffDefJ10) or 0);
					sheet.ResistenciaAlvo2 = (tonumber(sheet.ResistenciaJ10) or 0);
					sheet.BuffResistenciaAlvo2 = (tonumber(sheet.BuffResisJ10) or 0);
				end;
				
				---- ALVO 3 ---	
				
				if self.cmbInimigo3.text == sheet.NomeJ1 then
					sheet.VI3 = (tonumber(sheet.VIDAJ1) or 0);
					sheet.DefesaAlvo3 = (tonumber(sheet.DefesaJ1) or 0);
					sheet.BuffDefesaAlvo3 = (tonumber(sheet.BuffDefJ1) or 0);
					sheet.ResistenciaAlvo3 = (tonumber(sheet.ResistenciaJ1) or 0);
					sheet.BuffResistenciaAlvo3 = (tonumber(sheet.BuffResisJ1) or 0);
				end;

				if self.cmbInimigo3.text == sheet.NomeJ2 then
					sheet.VI3 = (tonumber(sheet.VIDAJ2) or 0)
					sheet.DefesaAlvo3 = (tonumber(sheet.DefesaJ2) or 0);
					sheet.BuffDefesaAlvo3 = (tonumber(sheet.BuffDefJ2) or 0);
					sheet.ResistenciaAlvo3 = (tonumber(sheet.ResistenciaJ2) or 0);
					sheet.BuffResistenciaAlvo3 = (tonumber(sheet.BuffResisJ2) or 0);
				end;				 
				 
				if self.cmbInimigo3.text == sheet.NomeJ3 then
					sheet.VI3 = (tonumber(sheet.VIDAJ3) or 0)
					sheet.DefesaAlvo3 = (tonumber(sheet.DefesaJ3) or 0);
					sheet.BuffDefesaAlvo3 = (tonumber(sheet.BuffDefJ3) or 0);
					sheet.ResistenciaAlvo3 = (tonumber(sheet.ResistenciaJ3) or 0);
					sheet.BuffResistenciaAlvo3 = (tonumber(sheet.BuffResisJ3) or 0);
				end;	

				if self.cmbInimigo3.text == sheet.NomeJ4 then
					sheet.VI3 = (tonumber(sheet.VIDAJ4) or 0)
					sheet.DefesaAlvo3 = (tonumber(sheet.DefesaJ4) or 0);
					sheet.BuffDefesaAlvo3 = (tonumber(sheet.BuffDefJ4) or 0);
					sheet.ResistenciaAlvo3 = (tonumber(sheet.ResistenciaJ4) or 0);
					sheet.BuffResistenciaAlvo3 = (tonumber(sheet.BuffResisJ4) or 0);
				end;

				if self.cmbInimigo3.text == sheet.NomeJ5 then
					sheet.VI3 = (tonumber(sheet.VIDAJ5) or 0)
					sheet.DefesaAlvo3 = (tonumber(sheet.DefesaJ5) or 0);
					sheet.BuffDefesaAlvo3 = (tonumber(sheet.BuffDefJ5) or 0);
					sheet.ResistenciaAlvo3 = (tonumber(sheet.ResistenciaJ5) or 0);
					sheet.BuffResistenciaAlvo3 = (tonumber(sheet.BuffResisJ5) or 0);
				end;				 
				 
				if self.cmbInimigo3.text == sheet.NomeJ6 then
					sheet.VI3 = (tonumber(sheet.VIDAJ6) or 0)
					sheet.DefesaAlvo3 = (tonumber(sheet.DefesaJ6) or 0);
					sheet.BuffDefesaAlvo3 = (tonumber(sheet.BuffDefJ6) or 0);
					sheet.ResistenciaAlvo3 = (tonumber(sheet.ResistenciaJ6) or 0);
					sheet.BuffResistenciaAlvo3 = (tonumber(sheet.BuffResisJ6) or 0);
				end;
				
				if self.cmbInimigo3.text == sheet.NomeJ7 then
					sheet.VI3 = (tonumber(sheet.VIDAJ7) or 0)
					sheet.DefesaAlvo3 = (tonumber(sheet.DefesaJ7) or 0);
					sheet.BuffDefesaAlvo3 = (tonumber(sheet.BuffDefJ7) or 0);
					sheet.ResistenciaAlvo3 = (tonumber(sheet.ResistenciaJ7) or 0);
					sheet.BuffResistenciaAlvo3	= (tonumber(sheet.BuffResisJ7) or 0);
				end;
				
				if self.cmbInimigo3.text == sheet.NomeJ8 then
					sheet.VI3 = (tonumber(sheet.VIDAJ8) or 0)
					sheet.DefesaAlvo3 = (tonumber(sheet.DefesaJ8) or 0);
					sheet.BuffDefesaAlvo3 = (tonumber(sheet.BuffDefJ8) or 0);
					sheet.ResistenciaAlvo3 = (tonumber(sheet.ResistenciaJ8) or 0);
					sheet.BuffResistenciaAlvo3 = (tonumber(sheet.BuffResisJ8) or 0);
				end;
				
				if self.cmbInimigo3.text == sheet.NomeJ9 then
					sheet.VI3 = (tonumber(sheet.VIDAJ9) or 0)
					sheet.DefesaAlvo3 = (tonumber(sheet.DefesaJ9) or 0);
					sheet.BuffDefesaAlvo3 = (tonumber(sheet.BuffDefJ9) or 0);
					sheet.ResistenciaAlvo3 = (tonumber(sheet.ResistenciaJ9) or 0);
					sheet.BuffResistenciaAlvo3	= (tonumber(sheet.BuffResisJ9) or 0);
				end;
				
				if self.cmbInimigo3.text == sheet.NomeJ10 then
					sheet.VI3 = (tonumber(sheet.VIDAJ10) or 0)
					sheet.DefesaAlvo3 = (tonumber(sheet.DefesaJ10) or 0);
					sheet.BuffDefesaAlvo3 = (tonumber(sheet.BuffDefJ10) or 0);
					sheet.ResistenciaAlvo3 = (tonumber(sheet.ResistenciaJ10) or 0);
					sheet.BuffResistenciaAlvo3 = (tonumber(sheet.BuffResisJ10) or 0);
				end;
				
				---- ALVO 4 ---	
				
				if self.cmbInimigo4.text == sheet.NomeJ1 then
					sheet.VI4 = (tonumber(sheet.VIDAJ1) or 0);
					sheet.DefesaAlvo4 = (tonumber(sheet.DefesaJ1) or 0);
					sheet.BuffDefesaAlvo4 = (tonumber(sheet.BuffDefJ1) or 0);
					sheet.ResistenciaAlvo4 = (tonumber(sheet.ResistenciaJ1) or 0);
					sheet.BuffResistenciaAlvo4 = (tonumber(sheet.BuffResisJ1) or 0);
				end;

				if self.cmbInimigo4.text == sheet.NomeJ2 then
					sheet.VI4 = (tonumber(sheet.VIDAJ2) or 0)
					sheet.DefesaAlvo4 = (tonumber(sheet.DefesaJ2) or 0);
					sheet.BuffDefesaAlvo4 = (tonumber(sheet.BuffDefJ2) or 0);
					sheet.ResistenciaAlvo4 = (tonumber(sheet.ResistenciaJ2) or 0);
					sheet.BuffResistenciaAlvo4 = (tonumber(sheet.BuffResisJ2) or 0);
				end;				 
				 
				if self.cmbInimigo4.text == sheet.NomeJ3 then
					sheet.VI4 = (tonumber(sheet.VIDAJ3) or 0)
					sheet.DefesaAlvo4 = (tonumber(sheet.DefesaJ3) or 0);
					sheet.BuffDefesaAlvo4 = (tonumber(sheet.BuffDefJ3) or 0);
					sheet.ResistenciaAlvo4 = (tonumber(sheet.ResistenciaJ3) or 0);
					sheet.BuffResistenciaAlvo4 = (tonumber(sheet.BuffResisJ3) or 0);
				end;	

				if self.cmbInimigo4.text == sheet.NomeJ4 then
					sheet.VI4 = (tonumber(sheet.VIDAJ4) or 0)
					sheet.DefesaAlvo4 = (tonumber(sheet.DefesaJ4) or 0);
					sheet.BuffDefesaAlvo4 = (tonumber(sheet.BuffDefJ4) or 0);
					sheet.ResistenciaAlvo4 = (tonumber(sheet.ResistenciaJ4) or 0);
					sheet.BuffResistenciaAlvo4 = (tonumber(sheet.BuffResisJ4) or 0);
				end;

				if self.cmbInimigo4.text == sheet.NomeJ5 then
					sheet.VI4 = (tonumber(sheet.VIDAJ5) or 0)
					sheet.DefesaAlvo4 = (tonumber(sheet.DefesaJ5) or 0);
					sheet.BuffDefesaAlvo4 = (tonumber(sheet.BuffDefJ5) or 0);
					sheet.ResistenciaAlvo4 = (tonumber(sheet.ResistenciaJ5) or 0);
					sheet.BuffResistenciaAlvo4 = (tonumber(sheet.BuffResisJ5) or 0);
				end;				 
				 
				if self.cmbInimigo4.text == sheet.NomeJ6 then
					sheet.VI4 = (tonumber(sheet.VIDAJ6) or 0)
					sheet.DefesaAlvo4 = (tonumber(sheet.DefesaJ6) or 0);
					sheet.BuffDefesaAlvo4 = (tonumber(sheet.BuffDefJ6) or 0);
					sheet.ResistenciaAlvo4 = (tonumber(sheet.ResistenciaJ6) or 0);
					sheet.BuffResistenciaAlvo4 = (tonumber(sheet.BuffResisJ6) or 0);
				end;
				
				if self.cmbInimigo4.text == sheet.NomeJ7 then
					sheet.VI4 = (tonumber(sheet.VIDAJ7) or 0)
					sheet.DefesaAlvo4 = (tonumber(sheet.DefesaJ7) or 0);
					sheet.BuffDefesaAlvo4 = (tonumber(sheet.BuffDefJ7) or 0);
					sheet.ResistenciaAlvo4 = (tonumber(sheet.ResistenciaJ7) or 0);
					sheet.BuffResistenciaAlvo4	= (tonumber(sheet.BuffResisJ7) or 0);
				end;
				
				if self.cmbInimigo4.text == sheet.NomeJ8 then
					sheet.VI4 = (tonumber(sheet.VIDAJ8) or 0)
					sheet.DefesaAlvo4 = (tonumber(sheet.DefesaJ8) or 0);
					sheet.BuffDefesaAlvo4 = (tonumber(sheet.BuffDefJ8) or 0);
					sheet.ResistenciaAlvo4 = (tonumber(sheet.ResistenciaJ8) or 0);
					sheet.BuffResistenciaAlvo4 = (tonumber(sheet.BuffResisJ8) or 0);
				end;
				
				if self.cmbInimigo4.text == sheet.NomeJ9 then
					sheet.VI4 = (tonumber(sheet.VIDAJ9) or 0)
					sheet.DefesaAlvo4 = (tonumber(sheet.DefesaJ9) or 0);
					sheet.BuffDefesaAlvo4 = (tonumber(sheet.BuffDefJ9) or 0);
					sheet.ResistenciaAlvo4 = (tonumber(sheet.ResistenciaJ9) or 0);
					sheet.BuffResistenciaAlvo4	= (tonumber(sheet.BuffResisJ9) or 0);
				end;
				
				if self.cmbInimigo4.text == sheet.NomeJ10 then
					sheet.VI4 = (tonumber(sheet.VIDAJ10) or 0)
					sheet.DefesaAlvo4 = (tonumber(sheet.DefesaJ10) or 0);
					sheet.BuffDefesaAlvo4 = (tonumber(sheet.BuffDefJ10) or 0);
					sheet.ResistenciaAlvo4 = (tonumber(sheet.ResistenciaJ10) or 0);
					sheet.BuffResistenciaAlvo4 = (tonumber(sheet.BuffResisJ10) or 0);
				end;

				---- ALVO 5 ---	
							
				if self.cmbInimigo5.text == sheet.NomeJ1 then
					sheet.VI5 = (tonumber(sheet.VIDAJ1) or 0);
					sheet.DefesaAlvo5 = (tonumber(sheet.DefesaJ1) or 0);
					sheet.BuffDefesaAlvo5 = (tonumber(sheet.BuffDefJ1) or 0);
					sheet.ResistenciaAlvo5 = (tonumber(sheet.ResistenciaJ1) or 0);
					sheet.BuffResistenciaAlvo5 = (tonumber(sheet.BuffResisJ1) or 0);
				end;

				if self.cmbInimigo5.text == sheet.NomeJ2 then
					sheet.VI5 = (tonumber(sheet.VIDAJ2) or 0)
					sheet.DefesaAlvo5 = (tonumber(sheet.DefesaJ2) or 0);
					sheet.BuffDefesaAlvo5 = (tonumber(sheet.BuffDefJ2) or 0);
					sheet.ResistenciaAlvo5 = (tonumber(sheet.ResistenciaJ2) or 0);
					sheet.BuffResistenciaAlvo5 = (tonumber(sheet.BuffResisJ2) or 0);
				end;				 
				 
				if self.cmbInimigo5.text == sheet.NomeJ3 then
					sheet.VI5 = (tonumber(sheet.VIDAJ3) or 0)
					sheet.DefesaAlvo5 = (tonumber(sheet.DefesaJ3) or 0);
					sheet.BuffDefesaAlvo5 = (tonumber(sheet.BuffDefJ3) or 0);
					sheet.ResistenciaAlvo5 = (tonumber(sheet.ResistenciaJ3) or 0);
					sheet.BuffResistenciaAlvo5 = (tonumber(sheet.BuffResisJ3) or 0);
				end;	

				if self.cmbInimigo5.text == sheet.NomeJ4 then
					sheet.VI5 = (tonumber(sheet.VIDAJ4) or 0)
					sheet.DefesaAlvo5 = (tonumber(sheet.DefesaJ4) or 0);
					sheet.BuffDefesaAlvo5 = (tonumber(sheet.BuffDefJ4) or 0);
					sheet.ResistenciaAlvo5 = (tonumber(sheet.ResistenciaJ4) or 0);
					sheet.BuffResistenciaAlvo5 = (tonumber(sheet.BuffResisJ4) or 0);
				end;

				if self.cmbInimigo5.text == sheet.NomeJ5 then
					sheet.VI5 = (tonumber(sheet.VIDAJ5) or 0)
					sheet.DefesaAlvo5 = (tonumber(sheet.DefesaJ5) or 0);
					sheet.BuffDefesaAlvo5 = (tonumber(sheet.BuffDefJ5) or 0);
					sheet.ResistenciaAlvo5 = (tonumber(sheet.ResistenciaJ5) or 0);
					sheet.BuffResistenciaAlvo5 = (tonumber(sheet.BuffResisJ5) or 0);
				end;				 
				 
				if self.cmbInimigo5.text == sheet.NomeJ6 then
					sheet.VI5 = (tonumber(sheet.VIDAJ6) or 0)
					sheet.DefesaAlvo5 = (tonumber(sheet.DefesaJ6) or 0);
					sheet.BuffDefesaAlvo5 = (tonumber(sheet.BuffDefJ6) or 0);
					sheet.ResistenciaAlvo5 = (tonumber(sheet.ResistenciaJ6) or 0);
					sheet.BuffResistenciaAlvo5 = (tonumber(sheet.BuffResisJ6) or 0);
				end;
				
				if self.cmbInimigo5.text == sheet.NomeJ7 then
					sheet.VI5 = (tonumber(sheet.VIDAJ7) or 0)
					sheet.DefesaAlvo5 = (tonumber(sheet.DefesaJ7) or 0);
					sheet.BuffDefesaAlvo5 = (tonumber(sheet.BuffDefJ7) or 0);
					sheet.ResistenciaAlvo5 = (tonumber(sheet.ResistenciaJ7) or 0);
					sheet.BuffResistenciaAlvo5	= (tonumber(sheet.BuffResisJ7) or 0);
				end;
				
				if self.cmbInimigo5.text == sheet.NomeJ8 then
					sheet.VI5 = (tonumber(sheet.VIDAJ8) or 0)
					sheet.DefesaAlvo5 = (tonumber(sheet.DefesaJ8) or 0);
					sheet.BuffDefesaAlvo5 = (tonumber(sheet.BuffDefJ8) or 0);
					sheet.ResistenciaAlvo5 = (tonumber(sheet.ResistenciaJ8) or 0);
					sheet.BuffResistenciaAlvo5 = (tonumber(sheet.BuffResisJ8) or 0);
				end;
				
				if self.cmbInimigo5.text == sheet.NomeJ9 then
					sheet.VI5 = (tonumber(sheet.VIDAJ9) or 0)
					sheet.DefesaAlvo5 = (tonumber(sheet.DefesaJ9) or 0);
					sheet.BuffDefesaAlvo5 = (tonumber(sheet.BuffDefJ9) or 0);
					sheet.ResistenciaAlvo5 = (tonumber(sheet.ResistenciaJ9) or 0);
					sheet.BuffResistenciaAlvo5	= (tonumber(sheet.BuffResisJ9) or 0);
				end;
				
				if self.cmbInimigo5.text == sheet.NomeJ10 then
					sheet.VI5 = (tonumber(sheet.VIDAJ10) or 0)
					sheet.DefesaAlvo5 = (tonumber(sheet.DefesaJ10) or 0);
					sheet.BuffDefesaAlvo5 = (tonumber(sheet.BuffDefJ10) or 0);
					sheet.ResistenciaAlvo5 = (tonumber(sheet.ResistenciaJ10) or 0);
					sheet.BuffResistenciaAlvo5 = (tonumber(sheet.BuffResisJ10) or 0);
				end;
				
				---- ALVO 6 ---	
				
				if self.cmbInimigo6.text == sheet.NomeJ1 then
					sheet.VI6 = (tonumber(sheet.VIDAJ1) or 0);
					sheet.DefesaAlvo6 = (tonumber(sheet.DefesaJ1) or 0);
					sheet.BuffDefesaAlvo6 = (tonumber(sheet.BuffDefJ1) or 0);
					sheet.ResistenciaAlvo6 = (tonumber(sheet.ResistenciaJ1) or 0);
					sheet.BuffResistenciaAlvo6 = (tonumber(sheet.BuffResisJ1) or 0);
				end;

				if self.cmbInimigo6.text == sheet.NomeJ2 then
					sheet.VI6 = (tonumber(sheet.VIDAJ2) or 0)
					sheet.DefesaAlvo6 = (tonumber(sheet.DefesaJ2) or 0);
					sheet.BuffDefesaAlvo6 = (tonumber(sheet.BuffDefJ2) or 0);
					sheet.ResistenciaAlvo6 = (tonumber(sheet.ResistenciaJ2) or 0);
					sheet.BuffResistenciaAlvo6 = (tonumber(sheet.BuffResisJ2) or 0);
				end;				 
				 
				if self.cmbInimigo6.text == sheet.NomeJ3 then
					sheet.VI6 = (tonumber(sheet.VIDAJ3) or 0)
					sheet.DefesaAlvo6 = (tonumber(sheet.DefesaJ3) or 0);
					sheet.BuffDefesaAlvo6 = (tonumber(sheet.BuffDefJ3) or 0);
					sheet.ResistenciaAlvo6 = (tonumber(sheet.ResistenciaJ3) or 0);
					sheet.BuffResistenciaAlvo6 = (tonumber(sheet.BuffResisJ3) or 0);
				end;	

				if self.cmbInimigo6.text == sheet.NomeJ4 then
					sheet.VI6 = (tonumber(sheet.VIDAJ4) or 0)
					sheet.DefesaAlvo6 = (tonumber(sheet.DefesaJ4) or 0);
					sheet.BuffDefesaAlvo6 = (tonumber(sheet.BuffDefJ4) or 0);
					sheet.ResistenciaAlvo6 = (tonumber(sheet.ResistenciaJ4) or 0);
					sheet.BuffResistenciaAlvo6 = (tonumber(sheet.BuffResisJ4) or 0);
				end;

				if self.cmbInimigo6.text == sheet.NomeJ5 then
					sheet.VI6 = (tonumber(sheet.VIDAJ5) or 0)
					sheet.DefesaAlvo6 = (tonumber(sheet.DefesaJ5) or 0);
					sheet.BuffDefesaAlvo6 = (tonumber(sheet.BuffDefJ5) or 0);
					sheet.ResistenciaAlvo6 = (tonumber(sheet.ResistenciaJ5) or 0);
					sheet.BuffResistenciaAlvo6 = (tonumber(sheet.BuffResisJ5) or 0);
				end;				 
				 
				if self.cmbInimigo6.text == sheet.NomeJ6 then
					sheet.VI6 = (tonumber(sheet.VIDAJ6) or 0)
					sheet.DefesaAlvo6 = (tonumber(sheet.DefesaJ6) or 0);
					sheet.BuffDefesaAlvo6 = (tonumber(sheet.BuffDefJ6) or 0);
					sheet.ResistenciaAlvo6 = (tonumber(sheet.ResistenciaJ6) or 0);
					sheet.BuffResistenciaAlvo6 = (tonumber(sheet.BuffResisJ6) or 0);
				end;
				
				if self.cmbInimigo6.text == sheet.NomeJ7 then
					sheet.VI6 = (tonumber(sheet.VIDAJ7) or 0)
					sheet.DefesaAlvo6 = (tonumber(sheet.DefesaJ7) or 0);
					sheet.BuffDefesaAlvo6 = (tonumber(sheet.BuffDefJ7) or 0);
					sheet.ResistenciaAlvo6 = (tonumber(sheet.ResistenciaJ7) or 0);
					sheet.BuffResistenciaAlvo6	 = (tonumber(sheet.BuffResisJ7) or 0);
				end;
				
				if self.cmbInimigo6.text == sheet.NomeJ8 then
					sheet.VI6 = (tonumber(sheet.VIDAJ8) or 0)
					sheet.DefesaAlvo6 = (tonumber(sheet.DefesaJ8) or 0);
					sheet.BuffDefesaAlvo6 = (tonumber(sheet.BuffDefJ8) or 0);
					sheet.ResistenciaAlvo6 = (tonumber(sheet.ResistenciaJ8) or 0);
					sheet.BuffResistenciaAlvo6	 = (tonumber(sheet.BuffResisJ8) or 0);
				end;
				
				if self.cmbInimigo6.text == sheet.NomeJ9 then
					sheet.VI6 = (tonumber(sheet.VIDAJ9) or 0)
					sheet.DefesaAlvo6 = (tonumber(sheet.DefesaJ9) or 0);
					sheet.BuffDefesaAlvo6 = (tonumber(sheet.BuffDefJ9) or 0);
					sheet.ResistenciaAlvo6 = (tonumber(sheet.ResistenciaJ9) or 0);
					sheet.BuffResistenciaAlvo6	 = (tonumber(sheet.BuffResisJ9) or 0);
				end;
				
				if self.cmbInimigo6.text == sheet.NomeJ10 then
					sheet.VI6 = (tonumber(sheet.VIDAJ10) or 0)
					sheet.DefesaAlvo6 = (tonumber(sheet.DefesaJ10) or 0);
					sheet.BuffDefesaAlvo6 = (tonumber(sheet.BuffDefJ10) or 0);
					sheet.ResistenciaAlvo6 = (tonumber(sheet.ResistenciaJ10) or 0);
					sheet.BuffResistenciaAlvo6	 = (tonumber(sheet.BuffResisJ10) or 0);
				end;
				
				---- ALVO 7 ---	
				
				if self.cmbInimigo7.text == sheet.NomeJ1 then
					sheet.VI7 = (tonumber(sheet.VIDAJ1) or 0);
					sheet.DefesaAlvo7 = (tonumber(sheet.DefesaJ1) or 0);
					sheet.BuffDefesaAlvo7 = (tonumber(sheet.BuffDefJ1) or 0);
					sheet.ResistenciaAlvo7 = (tonumber(sheet.ResistenciaJ1) or 0);
					sheet.BuffResistenciaAlvo7 = (tonumber(sheet.BuffResisJ1) or 0);
				end;

				if self.cmbInimigo7.text == sheet.NomeJ2 then
					sheet.VI7 = (tonumber(sheet.VIDAJ2) or 0)
					sheet.DefesaAlvo7 = (tonumber(sheet.DefesaJ2) or 0);
					sheet.BuffDefesaAlvo7 = (tonumber(sheet.BuffDefJ2) or 0);
					sheet.ResistenciaAlvo7 = (tonumber(sheet.ResistenciaJ2) or 0);
					sheet.BuffResistenciaAlvo7 = (tonumber(sheet.BuffResisJ2) or 0);
				end;				 
				 
				if self.cmbInimigo7.text == sheet.NomeJ3 then
					sheet.VI7 = (tonumber(sheet.VIDAJ3) or 0)
					sheet.DefesaAlvo7 = (tonumber(sheet.DefesaJ3) or 0);
					sheet.BuffDefesaAlvo7 = (tonumber(sheet.BuffDefJ3) or 0);
					sheet.ResistenciaAlvo7 = (tonumber(sheet.ResistenciaJ3) or 0);
					sheet.BuffResistenciaAlvo7 = (tonumber(sheet.BuffResisJ3) or 0);
				end;	

				if self.cmbInimigo7.text == sheet.NomeJ4 then
					sheet.VI7 = (tonumber(sheet.VIDAJ4) or 0)
					sheet.DefesaAlvo7 = (tonumber(sheet.DefesaJ4) or 0);
					sheet.BuffDefesaAlvo7 = (tonumber(sheet.BuffDefJ4) or 0);
					sheet.ResistenciaAlvo7 = (tonumber(sheet.ResistenciaJ4) or 0);
					sheet.BuffResistenciaAlvo7 = (tonumber(sheet.BuffResisJ4) or 0);
				end;

				if self.cmbInimigo7.text == sheet.NomeJ5 then
					sheet.VI7 = (tonumber(sheet.VIDAJ5) or 0)
					sheet.DefesaAlvo7 = (tonumber(sheet.DefesaJ5) or 0);
					sheet.BuffDefesaAlvo7 = (tonumber(sheet.BuffDefJ5) or 0);
					sheet.ResistenciaAlvo7 = (tonumber(sheet.ResistenciaJ5) or 0);
					sheet.BuffResistenciaAlvo7 = (tonumber(sheet.BuffResisJ5) or 0);
				end;				 
				 
				if self.cmbInimigo7.text == sheet.NomeJ6 then
					sheet.VI7 = (tonumber(sheet.VIDAJ6) or 0)
					sheet.DefesaAlvo7 = (tonumber(sheet.DefesaJ6) or 0);
					sheet.BuffDefesaAlvo7 = (tonumber(sheet.BuffDefJ6) or 0);
					sheet.ResistenciaAlvo7 = (tonumber(sheet.ResistenciaJ6) or 0);
					sheet.BuffResistenciaAlvo7	 = (tonumber(sheet.BuffResisJ6) or 0);
				end;
				
				if self.cmbInimigo7.text == sheet.NomeJ7 then
					sheet.VI7 = (tonumber(sheet.VIDAJ7) or 0)
					sheet.DefesaAlvo7 = (tonumber(sheet.DefesaJ7) or 0);
					sheet.BuffDefesaAlvo7 = (tonumber(sheet.BuffDefJ7) or 0);
					sheet.ResistenciaAlvo7 = (tonumber(sheet.ResistenciaJ7) or 0);
					sheet.BuffResistenciaAlvo7	 = (tonumber(sheet.BuffResisJ7) or 0);
				end;
				
				if self.cmbInimigo7.text == sheet.NomeJ8 then
					sheet.VI7 = (tonumber(sheet.VIDAJ8) or 0)
					sheet.DefesaAlvo7 = (tonumber(sheet.DefesaJ8) or 0);
					sheet.BuffDefesaAlvo7 = (tonumber(sheet.BuffDefJ8) or 0);
					sheet.ResistenciaAlvo7 = (tonumber(sheet.ResistenciaJ8) or 0);
					sheet.BuffResistenciaAlvo7	 = (tonumber(sheet.BuffResisJ8) or 0);
				end;
				
				if self.cmbInimigo7.text == sheet.NomeJ9 then
					sheet.VI7 = (tonumber(sheet.VIDAJ9) or 0)
					sheet.DefesaAlvo7 = (tonumber(sheet.DefesaJ9) or 0);
					sheet.BuffDefesaAlvo7 = (tonumber(sheet.BuffDefJ9) or 0);
					sheet.ResistenciaAlvo7 = (tonumber(sheet.ResistenciaJ9) or 0);
					sheet.BuffResistenciaAlvo7	 = (tonumber(sheet.BuffResisJ9) or 0);
				end;
				
				if self.cmbInimigo7.text == sheet.NomeJ10 then
					sheet.VI7 = (tonumber(sheet.VIDAJ10) or 0)
					sheet.DefesaAlvo7 = (tonumber(sheet.DefesaJ10) or 0);
					sheet.BuffDefesaAlvo7 = (tonumber(sheet.BuffDefJ10) or 0);
					sheet.ResistenciaAlvo7 = (tonumber(sheet.ResistenciaJ10) or 0);
					sheet.BuffResistenciaAlvo7	 = (tonumber(sheet.BuffResisJ10) or 0);
				end;
				
				---- ALVO 8 ---	
				
				if self.cmbInimigo8.text == sheet.NomeJ1 then
					sheet.VI8 = (tonumber(sheet.VIDAJ1) or 0);
					sheet.DefesaAlvo8 = (tonumber(sheet.DefesaJ1) or 0);
					sheet.BuffDefesaAlvo8 = (tonumber(sheet.BuffDefJ1) or 0);
					sheet.ResistenciaAlvo8 = (tonumber(sheet.ResistenciaJ1) or 0);
					sheet.BuffResistenciaAlvo8 = (tonumber(sheet.BuffResisJ1) or 0);
				end;

				if self.cmbInimigo8.text == sheet.NomeJ2 then
					sheet.VI8 = (tonumber(sheet.VIDAJ2) or 0)
					sheet.DefesaAlvo8 = (tonumber(sheet.DefesaJ2) or 0);
					sheet.BuffDefesaAlvo8 = (tonumber(sheet.BuffDefJ2) or 0);
					sheet.ResistenciaAlvo8 = (tonumber(sheet.ResistenciaJ2) or 0);
					sheet.BuffResistenciaAlvo8 = (tonumber(sheet.BuffResisJ2) or 0);
				end;				 
				 
				if self.cmbInimigo8.text == sheet.NomeJ3 then
					sheet.VI8 = (tonumber(sheet.VIDAJ3) or 0)
					sheet.DefesaAlvo8 = (tonumber(sheet.DefesaJ3) or 0);
					sheet.BuffDefesaAlvo8 = (tonumber(sheet.BuffDefJ3) or 0);
					sheet.ResistenciaAlvo8 = (tonumber(sheet.ResistenciaJ3) or 0);
					sheet.BuffResistenciaAlvo8 = (tonumber(sheet.BuffResisJ3) or 0);
				end;	

				if self.cmbInimigo8.text == sheet.NomeJ4 then
					sheet.VI8 = (tonumber(sheet.VIDAJ4) or 0)
					sheet.DefesaAlvo8 = (tonumber(sheet.DefesaJ4) or 0);
					sheet.BuffDefesaAlvo8 = (tonumber(sheet.BuffDefJ4) or 0);
					sheet.ResistenciaAlvo8 = (tonumber(sheet.ResistenciaJ4) or 0);
					sheet.BuffResistenciaAlvo8 = (tonumber(sheet.BuffResisJ4) or 0);
				end;

				if self.cmbInimigo8.text == sheet.NomeJ5 then
					sheet.VI8 = (tonumber(sheet.VIDAJ5) or 0)
					sheet.DefesaAlvo8 = (tonumber(sheet.DefesaJ5) or 0);
					sheet.BuffDefesaAlvo8 = (tonumber(sheet.BuffDefJ5) or 0);
					sheet.ResistenciaAlvo8 = (tonumber(sheet.ResistenciaJ5) or 0);
					sheet.BuffResistenciaAlvo8 = (tonumber(sheet.BuffResisJ5) or 0);
				end;				 
				 
				if self.cmbInimigo8.text == sheet.NomeJ6 then
					sheet.VI8 = (tonumber(sheet.VIDAJ6) or 0)
					sheet.DefesaAlvo8 = (tonumber(sheet.DefesaJ6) or 0);
					sheet.BuffDefesaAlvo8 = (tonumber(sheet.BuffDefJ6) or 0);
					sheet.ResistenciaAlvo8 = (tonumber(sheet.ResistenciaJ6) or 0);
					sheet.BuffResistenciaAlvo8 = (tonumber(sheet.BuffResisJ6) or 0);
				end;
				
				if self.cmbInimigo8.text == sheet.NomeJ7 then
					sheet.VI8 = (tonumber(sheet.VIDAJ7) or 0)
					sheet.DefesaAlvo8 = (tonumber(sheet.DefesaJ7) or 0);
					sheet.BuffDefesaAlvo8 = (tonumber(sheet.BuffDefJ7) or 0);
					sheet.ResistenciaAlvo8 = (tonumber(sheet.ResistenciaJ7) or 0);
					sheet.BuffResistenciaAlvo8	 = (tonumber(sheet.BuffResisJ7) or 0);
				end;
				
				if self.cmbInimigo8.text == sheet.NomeJ8 then
					sheet.VI8 = (tonumber(sheet.VIDAJ8) or 0)
					sheet.DefesaAlvo8 = (tonumber(sheet.DefesaJ8) or 0);
					sheet.BuffDefesaAlvo8 = (tonumber(sheet.BuffDefJ8) or 0);
					sheet.ResistenciaAlvo8 = (tonumber(sheet.ResistenciaJ8) or 0);
					sheet.BuffResistenciaAlvo8	 = (tonumber(sheet.BuffResisJ8) or 0);
				end;
				
				if self.cmbInimigo8.text == sheet.NomeJ9 then
					sheet.VI8 = (tonumber(sheet.VIDAJ9) or 0)
					sheet.DefesaAlvo8 = (tonumber(sheet.DefesaJ9) or 0);
					sheet.BuffDefesaAlvo8 = (tonumber(sheet.BuffDefJ9) or 0);
					sheet.ResistenciaAlvo8 = (tonumber(sheet.ResistenciaJ9) or 0);
					sheet.BuffResistenciaAlvo8	 = (tonumber(sheet.BuffResisJ9) or 0);
				end;
				
				if self.cmbInimigo8.text == sheet.NomeJ10 then
					sheet.VI8 = (tonumber(sheet.VIDAJ10) or 0)
					sheet.DefesaAlvo8 = (tonumber(sheet.DefesaJ10) or 0);
					sheet.BuffDefesaAlvo8 = (tonumber(sheet.BuffDefJ10) or 0);
					sheet.ResistenciaAlvo8 = (tonumber(sheet.ResistenciaJ10) or 0);
					sheet.BuffResistenciaAlvo8	 = (tonumber(sheet.BuffResisJ10) or 0);
				end;
				
					---- ALVO 9 ---	
				
				if self.cmbInimigo9.text == sheet.NomeJ1 then
					sheet.VI9 = (tonumber(sheet.VIDAJ1) or 0);
					sheet.DefesaAlvo9 = (tonumber(sheet.DefesaJ1) or 0);
					sheet.BuffDefesaAlvo9 = (tonumber(sheet.BuffDefJ1) or 0);
					sheet.ResistenciaAlvo9 = (tonumber(sheet.ResistenciaJ1) or 0);
					sheet.BuffResistenciaAlvo9 = (tonumber(sheet.BuffResisJ1) or 0);
				end;

				if self.cmbInimigo9.text == sheet.NomeJ2 then
					sheet.VI9 = (tonumber(sheet.VIDAJ2) or 0)
					sheet.DefesaAlvo9 = (tonumber(sheet.DefesaJ2) or 0);
					sheet.BuffDefesaAlvo9 = (tonumber(sheet.BuffDefJ2) or 0);
					sheet.ResistenciaAlvo9 = (tonumber(sheet.ResistenciaJ2) or 0);
					sheet.BuffResistenciaAlvo9 = (tonumber(sheet.BuffResisJ2) or 0);
				end;				 
				 
				if self.cmbInimigo9.text == sheet.NomeJ3 then
					sheet.VI9 = (tonumber(sheet.VIDAJ3) or 0)
					sheet.DefesaAlvo9 = (tonumber(sheet.DefesaJ3) or 0);
					sheet.BuffDefesaAlvo9 = (tonumber(sheet.BuffDefJ3) or 0);
					sheet.ResistenciaAlvo9 = (tonumber(sheet.ResistenciaJ3) or 0);
					sheet.BuffResistenciaAlvo9 = (tonumber(sheet.BuffResisJ3) or 0);
				end;	

				if self.cmbInimigo9.text == sheet.NomeJ4 then
					sheet.VI9 = (tonumber(sheet.VIDAJ4) or 0)
					sheet.DefesaAlvo9 = (tonumber(sheet.DefesaJ4) or 0);
					sheet.BuffDefesaAlvo9 = (tonumber(sheet.BuffDefJ4) or 0);
					sheet.ResistenciaAlvo9 = (tonumber(sheet.ResistenciaJ4) or 0);
					sheet.BuffResistenciaAlvo9 = (tonumber(sheet.BuffResisJ4) or 0);
				end;

				if self.cmbInimigo9.text == sheet.NomeJ5 then
					sheet.VI9 = (tonumber(sheet.VIDAJ5) or 0)
					sheet.DefesaAlvo9 = (tonumber(sheet.DefesaJ5) or 0);
					sheet.BuffDefesaAlvo9 = (tonumber(sheet.BuffDefJ5) or 0);
					sheet.ResistenciaAlvo9 = (tonumber(sheet.ResistenciaJ5) or 0);
					sheet.BuffResistenciaAlvo9 = (tonumber(sheet.BuffResisJ5) or 0);
				end;				 
				 
				if self.cmbInimigo9.text == sheet.NomeJ6 then
					sheet.VI9 = (tonumber(sheet.VIDAJ6) or 0)
					sheet.DefesaAlvo9 = (tonumber(sheet.DefesaJ6) or 0);
					sheet.BuffDefesaAlvo9 = (tonumber(sheet.BuffDefJ6) or 0);
					sheet.ResistenciaAlvo9 = (tonumber(sheet.ResistenciaJ6) or 0);
					sheet.BuffResistenciaAlvo9 = (tonumber(sheet.BuffResisJ6) or 0);
				end;
				
				if self.cmbInimigo9.text == sheet.NomeJ7 then
					sheet.VI9 = (tonumber(sheet.VIDAJ7) or 0)
					sheet.DefesaAlvo9 = (tonumber(sheet.DefesaJ7) or 0);
					sheet.BuffDefesaAlvo9 = (tonumber(sheet.BuffDefJ7) or 0);
					sheet.ResistenciaAlvo9 = (tonumber(sheet.ResistenciaJ7) or 0);
					sheet.BuffResistenciaAlvo9	 = (tonumber(sheet.BuffResisJ7) or 0);
				end;
				
				if self.cmbInimigo9.text == sheet.NomeJ8 then
					sheet.VI9 = (tonumber(sheet.VIDAJ8) or 0)
					sheet.DefesaAlvo9 = (tonumber(sheet.DefesaJ8) or 0);
					sheet.BuffDefesaAlvo9 = (tonumber(sheet.BuffDefJ8) or 0);
					sheet.ResistenciaAlvo9 = (tonumber(sheet.ResistenciaJ8) or 0);
					sheet.BuffResistenciaAlvo9	 = (tonumber(sheet.BuffResisJ8) or 0);
				end;
				
				if self.cmbInimigo9.text == sheet.NomeJ9 then
					sheet.VI9 = (tonumber(sheet.VIDAJ9) or 0)
					sheet.DefesaAlvo9 = (tonumber(sheet.DefesaJ9) or 0);
					sheet.BuffDefesaAlvo9 = (tonumber(sheet.BuffDefJ9) or 0);
					sheet.ResistenciaAlvo9 = (tonumber(sheet.ResistenciaJ9) or 0);
					sheet.BuffResistenciaAlvo9	 = (tonumber(sheet.BuffResisJ9) or 0);
				end;
				
				if self.cmbInimigo9.text == sheet.NomeJ10 then
					sheet.VI9 = (tonumber(sheet.VIDAJ10) or 0)
					sheet.DefesaAlvo9 = (tonumber(sheet.DefesaJ10) or 0);
					sheet.BuffDefesaAlvo9 = (tonumber(sheet.BuffDefJ10) or 0);
					sheet.ResistenciaAlvo9 = (tonumber(sheet.ResistenciaJ10) or 0);
					sheet.BuffResistenciaAlvo9	 = (tonumber(sheet.BuffResisJ10) or 0);
				end;
				
					---- ALVO 10 ---	
				
				if self.cmbInimigo10.text == sheet.NomeJ1 then
					sheet.VI10 = (tonumber(sheet.VIDAJ1) or 0);
					sheet.DefesaAlvo10 = (tonumber(sheet.DefesaJ1) or 0);
					sheet.BuffDefesaAlvo10 = (tonumber(sheet.BuffDefJ1) or 0);
					sheet.ResistenciaAlvo10 = (tonumber(sheet.ResistenciaJ1) or 0);
					sheet.BuffResistenciaAlvo10 = (tonumber(sheet.BuffResisJ1) or 0);
				end;

				if self.cmbInimigo10.text == sheet.NomeJ2 then
					sheet.VI10 = (tonumber(sheet.VIDAJ2) or 0)
					sheet.DefesaAlvo10 = (tonumber(sheet.DefesaJ2) or 0);
					sheet.BuffDefesaAlvo10 = (tonumber(sheet.BuffDefJ2) or 0);
					sheet.ResistenciaAlvo10 = (tonumber(sheet.ResistenciaJ2) or 0);
					sheet.BuffResistenciaAlvo10 = (tonumber(sheet.BuffResisJ2) or 0);
				end;				 
				 
				if self.cmbInimigo10.text == sheet.NomeJ3 then
					sheet.VI10 = (tonumber(sheet.VIDAJ3) or 0)
					sheet.DefesaAlvo10 = (tonumber(sheet.DefesaJ3) or 0);
					sheet.BuffDefesaAlvo10 = (tonumber(sheet.BuffDefJ3) or 0);
					sheet.ResistenciaAlvo10 = (tonumber(sheet.ResistenciaJ3) or 0);
					sheet.BuffResistenciaAlvo10 = (tonumber(sheet.BuffResisJ3) or 0);
				end;	

				if self.cmbInimigo10.text == sheet.NomeJ4 then
					sheet.VI10 = (tonumber(sheet.VIDAJ4) or 0)
					sheet.DefesaAlvo10 = (tonumber(sheet.DefesaJ4) or 0);
					sheet.BuffDefesaAlvo10 = (tonumber(sheet.BuffDefJ4) or 0);
					sheet.ResistenciaAlvo10 = (tonumber(sheet.ResistenciaJ4) or 0);
					sheet.BuffResistenciaAlvo10 = (tonumber(sheet.BuffResisJ4) or 0);
				end;

				if self.cmbInimigo10.text == sheet.NomeJ5 then
					sheet.VI10 = (tonumber(sheet.VIDAJ5) or 0)
					sheet.DefesaAlvo10 = (tonumber(sheet.DefesaJ5) or 0);
					sheet.BuffDefesaAlvo10 = (tonumber(sheet.BuffDefJ5) or 0);
					sheet.ResistenciaAlvo10 = (tonumber(sheet.ResistenciaJ5) or 0);
					sheet.BuffResistenciaAlvo10 = (tonumber(sheet.BuffResisJ5) or 0);
				end;				 
				 
				if self.cmbInimigo10.text == sheet.NomeJ6 then
					sheet.VI10 = (tonumber(sheet.VIDAJ6) or 0)
					sheet.DefesaAlvo10 = (tonumber(sheet.DefesaJ6) or 0);
					sheet.BuffDefesaAlvo10 = (tonumber(sheet.BuffDefJ6) or 0);
					sheet.ResistenciaAlvo10 = (tonumber(sheet.ResistenciaJ6) or 0);
					sheet.BuffResistenciaAlvo10 = (tonumber(sheet.BuffResisJ6) or 0);
				end;
				
				if self.cmbInimigo10.text == sheet.NomeJ7 then
					sheet.VI10 = (tonumber(sheet.VIDAJ7) or 0)
					sheet.DefesaAlvo10 = (tonumber(sheet.DefesaJ7) or 0);
					sheet.BuffDefesaAlvo10 = (tonumber(sheet.BuffDefJ7) or 0);
					sheet.ResistenciaAlvo10 = (tonumber(sheet.ResistenciaJ7) or 0);
					sheet.BuffResistenciaAlvo10	 = (tonumber(sheet.BuffResisJ7) or 0);
				end;
				
				if self.cmbInimigo10.text == sheet.NomeJ8 then
					sheet.VI10 = (tonumber(sheet.VIDAJ8) or 0)
					sheet.DefesaAlvo10 = (tonumber(sheet.DefesaJ8) or 0);
					sheet.BuffDefesaAlvo10 = (tonumber(sheet.BuffDefJ8) or 0);
					sheet.ResistenciaAlvo10 = (tonumber(sheet.ResistenciaJ8) or 0);
					sheet.BuffResistenciaAlvo10	 = (tonumber(sheet.BuffResisJ8) or 0);
				end;
				
				if self.cmbInimigo10.text == sheet.NomeJ9 then
					sheet.VI10 = (tonumber(sheet.VIDAJ9) or 0)
					sheet.DefesaAlvo10 = (tonumber(sheet.DefesaJ9) or 0);
					sheet.BuffDefesaAlvo10 = (tonumber(sheet.BuffDefJ9) or 0);
					sheet.ResistenciaAlvo10 = (tonumber(sheet.ResistenciaJ9) or 0);
					sheet.BuffResistenciaAlvo10	 = (tonumber(sheet.BuffResisJ9) or 0);
				end;
				
				if self.cmbInimigo10.text == sheet.NomeJ10 then
					sheet.VI10 = (tonumber(sheet.VIDAJ10) or 0)
					sheet.DefesaAlvo10 = (tonumber(sheet.DefesaJ10) or 0);
					sheet.BuffDefesaAlvo10 = (tonumber(sheet.BuffDefJ10) or 0);
					sheet.ResistenciaAlvo10 = (tonumber(sheet.ResistenciaJ10) or 0);
					sheet.BuffResistenciaAlvo10	 = (tonumber(sheet.BuffResisJ10) or 0);
				end;
				
				------ DEFESA ------
				
				sheet.TR1 = (tonumber(sheet.DefesaAlvo1) or 0) + (tonumber(sheet.BuffDefesaAlvo1) or 0) -100
				sheet.Sobra1 = (tonumber(sheet.TR1) or 0) * -1
				 
				sheet.TR2 = (tonumber(sheet.DefesaAlvo2) or 0) + (tonumber(sheet.BuffDefesaAlvo2) or 0) -100
				sheet.Sobra2 = (tonumber(sheet.TR2) or 0) * -1
				 
				sheet.TR3 = (tonumber(sheet.DefesaAlvo3) or 0) + (tonumber(sheet.BuffDefesaAlvo3) or 0) -100
				sheet.Sobra3 = (tonumber(sheet.TR3) or 0) * -1
				 
				sheet.TR4 = (tonumber(sheet.DefesaAlvo4) or 0) + (tonumber(sheet.BuffDefesaAlvo4) or 0) -100
				sheet.Sobra4 = (tonumber(sheet.TR4) or 0) * -1
				 
				sheet.TR5 = (tonumber(sheet.DefesaAlvo5) or 0) + (tonumber(sheet.BuffDefesaAlvo5) or 0) -100
				sheet.Sobra5 = (tonumber(sheet.TR5) or 0) * -1
				 
				sheet.TR6 = (tonumber(sheet.DefesaAlvo6) or 0) + (tonumber(sheet.BuffDefesaAlvo6) or 0) -100
				sheet.Sobra6 = (tonumber(sheet.TR6) or 0) * -1		
				
				sheet.TR7 = (tonumber(sheet.DefesaAlvo7) or 0) + (tonumber(sheet.BuffDefesaAlvo7) or 0) -100
				sheet.Sobra7 = (tonumber(sheet.TR7) or 0) * -1
				 
				sheet.TR8 = (tonumber(sheet.DefesaAlvo8) or 0) + (tonumber(sheet.BuffDefesaAlvo8) or 0) -100
				sheet.Sobra8 = (tonumber(sheet.TR8) or 0) * -1		
				
				sheet.TR9 = (tonumber(sheet.DefesaAlvo9) or 0) + (tonumber(sheet.BuffDefesaAlvo9) or 0) -100
				sheet.Sobra9 = (tonumber(sheet.TR9) or 0) * -1
				 
				sheet.TR10 = (tonumber(sheet.DefesaAlvo10) or 0) + (tonumber(sheet.BuffDefesaAlvo10) or 0) -100
				sheet.Sobra10 = (tonumber(sheet.TR10) or 0) * -1	

				----- RESISTENCIA ------
				
				sheet.TRR1 = (tonumber(sheet.ResistenciaAlvo1) or 0) + (tonumber(sheet.BuffResistenciaAlvo1) or 0) -100
				sheet.SobraR1 = (tonumber(sheet.TRR1) or 0) * -1
				 
				sheet.TRR2 = (tonumber(sheet.ResistenciaAlvo2) or 0) + (tonumber(sheet.BuffResistenciaAlvo2) or 0) -100
				sheet.SobraR2 = (tonumber(sheet.TRR2) or 0) * -1
				 
				sheet.TRR3 = (tonumber(sheet.ResistenciaAlvo3) or 0) + (tonumber(sheet.BuffResistenciaAlvo3) or 0) -100
				sheet.SobraR3 = (tonumber(sheet.TRR3) or 0) * -1
				 
				sheet.TRR4 = (tonumber(sheet.ResistenciaAlvo4) or 0) + (tonumber(sheet.BuffResistenciaAlvo4) or 0) -100
				sheet.SobraR4 = (tonumber(sheet.TRR4) or 0) * -1
				 
				sheet.TRR5 = (tonumber(sheet.ResistenciaAlvo5) or 0) + (tonumber(sheet.BuffResistenciaAlvo5) or 0) -100
				sheet.SobraR5 = (tonumber(sheet.TRR5) or 0) * -1
				 
				sheet.TRR6 = (tonumber(sheet.ResistenciaAlvo6) or 0) + (tonumber(sheet.BuffResistenciaAlvo6) or 0) -100
				sheet.SobraR6 = (tonumber(sheet.TRR6) or 0) * -1	
				
				sheet.TRR7 = (tonumber(sheet.ResistenciaAlvo7) or 0) + (tonumber(sheet.BuffResistenciaAlvo7) or 0) -100
				sheet.SobraR7 = (tonumber(sheet.TRR7) or 0) * -1
				 
				sheet.TRR8 = (tonumber(sheet.ResistenciaAlvo8) or 0) + (tonumber(sheet.BuffResistenciaAlvo8) or 0) -100
				sheet.SobraR8 = (tonumber(sheet.TRR8) or 0) * -1	
				
				sheet.TRR9 = (tonumber(sheet.ResistenciaAlvo9) or 0) + (tonumber(sheet.BuffResistenciaAlvo9) or 0) -100
				sheet.SobraR9 = (tonumber(sheet.TRR9) or 0) * -1
				 
				sheet.TRR10 = (tonumber(sheet.ResistenciaAlvo10) or 0) + (tonumber(sheet.BuffResistenciaAlvo10) or 0) -100
				sheet.SobraR10 = (tonumber(sheet.TRR10) or 0) * -1					
			end;
		


		
		
		
    



		function ColocarNomes()
			Nomes = {} 
			Nomes[1] = sheet.NomeJ1
			Nomes[2] = sheet.NomeJ2
			Nomes[3] = sheet.NomeJ3
			Nomes[4] = sheet.NomeJ4
			Nomes[5] = sheet.NomeJ5
			Nomes[6] = sheet.NomeJ6
			Nomes[7] = sheet.NomeJ7
			Nomes[8] = sheet.NomeJ8
			Nomes[9] = sheet.NomeJ9
			Nomes[10] = sheet.NomeJ10
			
			self.cmbInimigo1.items = Nomes;
			self.cmbInimigo2.items = Nomes;
			self.cmbInimigo3.items = Nomes;
			self.cmbInimigo4.items = Nomes;
			self.cmbInimigo5.items = Nomes;
			self.cmbInimigo6.items = Nomes;
			self.cmbInimigo7.items = Nomes;
			self.cmbInimigo8.items = Nomes;
			self.cmbInimigo9.items = Nomes;
			self.cmbInimigo10.items = Nomes;
		end;
		
		function SetaTarget()
			Nomes = {} 
			Nomes[1] = "Player1"
			Nomes[2] = "Player1"
			Nomes[3] = "Player1"
			Nomes[4] = "Player1"
			Nomes[5] = "Player1"
			Nomes[6] = "Player1"
			Nomes[7] = "Player1"
			Nomes[8] = "Player1"
			Nomes[9] = "Player1"
			Nomes[10] = "Player1"
			
			self.cmbInimigo1.items = Nomes;
			self.cmbInimigo2.items = Nomes;
			self.cmbInimigo3.items = Nomes;
			self.cmbInimigo4.items = Nomes;
			self.cmbInimigo5.items = Nomes;
			self.cmbInimigo6.items = Nomes;
			self.cmbInimigo7.items = Nomes;
			self.cmbInimigo8.items = Nomes;
			Self.cmbInimigo9.items = Nomes;
			Self.cmbInimigo10.items = Nomes;
		end;		
    


    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setLeft(1);
    obj.image1:setTop(1);
    obj.image1:setScale(0.7);
    obj.image1:setWidth(1050);
    obj.image1:setHeight(600);
    obj.image1:setSRC("/imagens/1.png");
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.image1);
    obj.edit1:setLeft(10);
    obj.edit1:setTop(10);
    obj.edit1:setWidth(30);
    obj.edit1:setType("number");
    obj.edit1:setVisible(false);
    obj.edit1:setHeight(30);
    obj.edit1:setField("VJ");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.image1);
    obj.edit2:setLeft(225);
    obj.edit2:setTop(555);
    obj.edit2:setWidth(30);
    obj.edit2:setType("number");
    obj.edit2:setVisible(true);
    obj.edit2:setHeight(30);
    obj.edit2:setField("turno");
    obj.edit2:setName("edit2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.image1);
    obj.image2:setLeft(975);
    obj.image2:setTop(520);
    obj.image2:setWidth(60);
    obj.image2:setHeight(60);
    obj.image2:setSRC("/imagens/Tok.png");
    obj.image2:setName("image2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.image1);
    obj.button1:setLeft(975);
    obj.button1:setTop(520);
    obj.button1:setWidth(60);
    obj.button1:setHeight(60);
    obj.button1:setOpacity(0.1);
    obj.button1:setText("Ficha1");
    obj.button1:setName("button1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.image1);
    obj.dataLink1:setFields({'Alvo1', 'Alvo2', 'Alvo3', 'Alvo4', 'Alvo5', 'Alvo6', 'Alvo7', 'Alvo8', 'Alvo9', 'Alvo10', 'VIDAJ1', 'VIDAJ2', 'VIDAJ3', 'VIDAJ4', 'VIDAJ5', 'VIDAJ6', 'VIDAJ7', 'VIDAJ8', 'VIDAJ9', 'VIDAJ10', 'DefesaAlvo1', 'DefesaAlvo2', 'DefesaAlvo3',
		'DefesaAlvo4', 'DefesaAlvo5', 'DefesaAlvo6', 'DefesaAlvo7', 'DefesaAlvo8', 'DefesaAlvo9', 'DefesaAlvo10', 'BuffDefesaAlvo1', 'BuffDefesaAlvo2', 'BuffDefesaAlvo3', 'BuffDefesaAlvo4', 'BuffDefesaAlvo5', 'BuffDefesaAlvo6', 'BuffDefesaAlvo7',
		'BuffDefesaAlvo8', 'BuffDefesaAlvo9', 'BuffDefesaAlvo10', 'DefesaJ1', 'DefesaJ2', 'DefesaJ3', 'DefesaJ4', 'DefesaJ5', 'DefesaJ6', 'DefesaJ7', 'DefesaJ8', 'DefesaJ9', 'DefesaJ10', 'BuffDefJ1', 'BuffDefJ2', 'BuffDefJ3', 'BuffDefJ4', 'BuffDefJ5', 'BuffDefJ6', 'BuffDefJ7', 'BuffDefJ8',
		'BuffDefJ9', 'BuffDefJ10', 'ResistenciaJ1', 'ResistenciaJ2', 'ResistenciaJ3', 'ResistenciaJ4', 'ResistenciaJ5', 'ResistenciaJ6', 'ResistenciaJ7', 'ResistenciaJ8', 'ResistenciaJ9', 'ResistenciaJ10', 'BuffResisJ1', 'BuffResisJ2', 'BuffResisJ3', 'BuffResisJ4', 'BuffResisJ5', 'BuffResisJ6',
		'BuffResisJ7', 'BuffResisJ8', 'BuffResisJ9', 'BuffResisJ10'});
    obj.dataLink1:setName("dataLink1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.image1);
    obj.rectangle1:setLeft(445);
    obj.rectangle1:setTop(277);
    obj.rectangle1:setWidth(300);
    obj.rectangle1:setHeight(80);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setStrokeColor("Red");
    obj.rectangle1:setStrokeSize(3);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.image1);
    obj.label1:setLeft(450);
    obj.label1:setTop(283);
    obj.label1:setHeight(30);
    obj.label1:setWidth(80);
    obj.label1:setFontSize(30);
    obj.label1:setText("Vez");
    obj.label1:setName("label1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.image1);
    obj.button2:setLeft(500);
    obj.button2:setTop(283);
    obj.button2:setText("«");
    obj.button2:setFontSize(31);
    obj.button2:setHeight(35);
    obj.button2:setWidth(30);
    obj.button2:setName("button2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.image1);
    obj.label2:setLeft(535);
    obj.label2:setTop(285);
    obj.label2:setHeight(30);
    obj.label2:setWidth(80);
    obj.label2:setFontSize(15);
    obj.label2:setFontColor("white");
    obj.label2:setField("Vezde");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.image1);
    obj.label3:setLeft(710);
    obj.label3:setTop(285);
    obj.label3:setHeight(30);
    obj.label3:setWidth(80);
    obj.label3:setFontSize(25);
    obj.label3:setFontColor("red");
    obj.label3:setField("turno");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.image1);
    obj.edit3:setLeft(600);
    obj.edit3:setTop(320);
    obj.edit3:setHeight(30);
    obj.edit3:setWidth(40);
    obj.edit3:setMax(10);
    obj.edit3:setType("number");
    obj.edit3:setFontSize(25);
    obj.edit3:setFontColor("red");
    obj.edit3:setField("Emcombate");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.image1);
    obj.label4:setLeft(450);
    obj.label4:setTop(320);
    obj.label4:setHeight(30);
    obj.label4:setWidth(200);
    obj.label4:setFontSize(25);
    obj.label4:setText("Em Combate");
    obj.label4:setFontColor("white");
    obj.label4:setName("label4");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.image1);
    obj.button3:setLeft(600);
    obj.button3:setTop(283);
    obj.button3:setText("»");
    obj.button3:setFontSize(31);
    obj.button3:setHeight(35);
    obj.button3:setWidth(30);
    obj.button3:setName("button3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.image1);
    obj.label5:setLeft(635);
    obj.label5:setTop(283);
    obj.label5:setHeight(30);
    obj.label5:setWidth(80);
    obj.label5:setFontSize(20);
    obj.label5:setText("Rodada");
    obj.label5:setName("label5");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.image1);
    obj.button4:setLeft(40);
    obj.button4:setTop(40);
    obj.button4:setWidth(100);
    obj.button4:setHeight(100);
    obj.button4:setName("button4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.image1);
    obj.label6:setLeft(60);
    obj.label6:setTop(80);
    obj.label6:setText("Jogador 1");
    obj.label6:setField("NomeJ1");
    obj.label6:setName("label6");

    obj.PopJ1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ1:setParent(obj.image1);
    obj.PopJ1:setName("PopJ1");
    obj.PopJ1:setWidth(400);
    obj.PopJ1:setScale(0.9);
    obj.PopJ1:setHeight(450);
    obj.PopJ1:setBackOpacity(0.5);

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.PopJ1);
    obj.label7:setLeft(20);
    obj.label7:setTop(20);
    obj.label7:setHeight(30);
    obj.label7:setWidth(80);
    obj.label7:setText("Nome");
    obj.label7:setName("label7");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.PopJ1);
    obj.edit4:setLeft(80);
    obj.edit4:setTop(20);
    obj.edit4:setHeight(30);
    obj.edit4:setWidth(80);
    obj.edit4:setField("NomeJ1");
    obj.edit4:setName("edit4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.PopJ1);
    obj.label8:setLeft(20);
    obj.label8:setTop(60);
    obj.label8:setHeight(30);
    obj.label8:setWidth(80);
    obj.label8:setText("Dano");
    obj.label8:setName("label8");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.PopJ1);
    obj.edit5:setLeft(80);
    obj.edit5:setTop(60);
    obj.edit5:setHeight(30);
    obj.edit5:setWidth(80);
    obj.edit5:setField("DanoJ1");
    obj.edit5:setName("edit5");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.PopJ1);
    obj.label9:setLeft(170);
    obj.label9:setTop(60);
    obj.label9:setHeight(30);
    obj.label9:setWidth(80);
    obj.label9:setText("Buff Dano");
    obj.label9:setName("label9");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.PopJ1);
    obj.edit6:setLeft(250);
    obj.edit6:setTop(60);
    obj.edit6:setHeight(30);
    obj.edit6:setWidth(80);
    obj.edit6:setField("BuffDNJ1");
    obj.edit6:setName("edit6");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.PopJ1);
    obj.label10:setLeft(170);
    obj.label10:setTop(20);
    obj.label10:setHeight(30);
    obj.label10:setWidth(80);
    obj.label10:setFontColor("red");
    obj.label10:setText("Target/Alvo");
    obj.label10:setName("label10");

    obj.cmbInimigo1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigo1:setParent(obj.PopJ1);
    obj.cmbInimigo1:setName("cmbInimigo1");
    obj.cmbInimigo1:setLeft(250);
    obj.cmbInimigo1:setTop(20);
    obj.cmbInimigo1:setScale(1.4);
    obj.cmbInimigo1:setField("Alvo1");
    obj.cmbInimigo1:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6', 'Player7', 'Player8', 'Player9', 'Player10'});
    obj.cmbInimigo1:setValues({'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'});

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.PopJ1);
    obj.label11:setLeft(20);
    obj.label11:setTop(130);
    obj.label11:setHeight(30);
    obj.label11:setWidth(80);
    obj.label11:setText("Defesa");
    obj.label11:setName("label11");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.PopJ1);
    obj.edit7:setLeft(80);
    obj.edit7:setTop(130);
    obj.edit7:setHeight(30);
    obj.edit7:setWidth(80);
    obj.edit7:setEnabled(false);
    obj.edit7:setField("DefesaAlvo1");
    obj.edit7:setName("edit7");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.PopJ1);
    obj.label12:setLeft(170);
    obj.label12:setTop(130);
    obj.label12:setHeight(30);
    obj.label12:setWidth(80);
    obj.label12:setText("Buff Defesa");
    obj.label12:setName("label12");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.PopJ1);
    obj.edit8:setLeft(250);
    obj.edit8:setTop(130);
    obj.edit8:setHeight(30);
    obj.edit8:setWidth(80);
    obj.edit8:setEnabled(false);
    obj.edit8:setField("BuffDefesaAlvo1");
    obj.edit8:setName("edit8");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.PopJ1);
    obj.label13:setLeft(20);
    obj.label13:setTop(170);
    obj.label13:setHeight(30);
    obj.label13:setWidth(80);
    obj.label13:setText("Resist");
    obj.label13:setName("label13");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.PopJ1);
    obj.edit9:setLeft(80);
    obj.edit9:setTop(170);
    obj.edit9:setHeight(30);
    obj.edit9:setWidth(80);
    obj.edit9:setEnabled(false);
    obj.edit9:setField("ResistenciaAlvo1");
    obj.edit9:setName("edit9");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.PopJ1);
    obj.label14:setLeft(170);
    obj.label14:setTop(170);
    obj.label14:setHeight(30);
    obj.label14:setWidth(80);
    obj.label14:setText("Buff Resis");
    obj.label14:setName("label14");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.PopJ1);
    obj.edit10:setLeft(250);
    obj.edit10:setTop(170);
    obj.edit10:setHeight(30);
    obj.edit10:setWidth(80);
    obj.edit10:setEnabled(false);
    obj.edit10:setField("BuffResistenciaAlvo1");
    obj.edit10:setName("edit10");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.PopJ1);
    obj.image3:setLeft(350);
    obj.image3:setTop(60);
    obj.image3:setWidth(30);
    obj.image3:setHeight(30);
    obj.image3:setSRC("/imagens/Shield.png");
    obj.image3:setName("image3");

    obj.btnPopREDPJ1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPopREDPJ1:setParent(obj.PopJ1);
    obj.btnPopREDPJ1:setName("btnPopREDPJ1");
    obj.btnPopREDPJ1:setLeft(350);
    obj.btnPopREDPJ1:setTop(60);
    obj.btnPopREDPJ1:setFontColor("white");
    obj.btnPopREDPJ1:setOpacity(0.3);
    obj.btnPopREDPJ1:setWidth(30);
    obj.btnPopREDPJ1:setHeight(30);

    obj.popDefREDPJ1 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDefREDPJ1:setParent(obj.PopJ1);
    obj.popDefREDPJ1:setName("popDefREDPJ1");
    obj.popDefREDPJ1:setWidth(230);
    obj.popDefREDPJ1:setHeight(100);
    obj.popDefREDPJ1:setBackOpacity(0.5);

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.popDefREDPJ1);
    obj.label15:setLeft(20);
    obj.label15:setTop(10);
    obj.label15:setFontSize(10);
    obj.label15:setHeight(25);
    obj.label15:setWidth(40);
    obj.label15:setText("Defesa");
    obj.label15:setName("label15");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.popDefREDPJ1);
    obj.edit11:setLeft(60);
    obj.edit11:setTop(10);
    obj.edit11:setFontSize(10);
    obj.edit11:setHeight(25);
    obj.edit11:setWidth(40);
    obj.edit11:setField("DefesaJ1");
    obj.edit11:setName("edit11");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.popDefREDPJ1);
    obj.label16:setLeft(110);
    obj.label16:setTop(10);
    obj.label16:setFontSize(10);
    obj.label16:setHeight(25);
    obj.label16:setWidth(80);
    obj.label16:setText("Buff Defesa");
    obj.label16:setName("label16");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.popDefREDPJ1);
    obj.edit12:setLeft(170);
    obj.edit12:setTop(10);
    obj.edit12:setFontSize(10);
    obj.edit12:setHeight(25);
    obj.edit12:setWidth(40);
    obj.edit12:setField("BuffDefJ1");
    obj.edit12:setName("edit12");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.popDefREDPJ1);
    obj.label17:setLeft(20);
    obj.label17:setTop(40);
    obj.label17:setFontSize(10);
    obj.label17:setHeight(25);
    obj.label17:setWidth(40);
    obj.label17:setText("Resist");
    obj.label17:setName("label17");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.popDefREDPJ1);
    obj.edit13:setLeft(60);
    obj.edit13:setTop(40);
    obj.edit13:setFontSize(10);
    obj.edit13:setHeight(25);
    obj.edit13:setWidth(40);
    obj.edit13:setField("ResistenciaJ1");
    obj.edit13:setName("edit13");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.popDefREDPJ1);
    obj.label18:setLeft(110);
    obj.label18:setTop(40);
    obj.label18:setFontSize(10);
    obj.label18:setHeight(25);
    obj.label18:setWidth(80);
    obj.label18:setText("Buff Resis");
    obj.label18:setName("label18");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.popDefREDPJ1);
    obj.edit14:setLeft(170);
    obj.edit14:setTop(40);
    obj.edit14:setFontSize(10);
    obj.edit14:setHeight(25);
    obj.edit14:setWidth(40);
    obj.edit14:setField("BuffResisJ1");
    obj.edit14:setName("edit14");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.popDefREDPJ1);
    obj.label19:setLeft(40);
    obj.label19:setTop(70);
    obj.label19:setWidth(230);
    obj.label19:setFontSize(16);
    obj.label19:setFontColor("red");
    obj.label19:setText("REDUÇOES PLAYER 1");
    obj.label19:setName("label19");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.PopJ1);
    obj.button5:setLeft(20);
    obj.button5:setTop(100);
    obj.button5:setFontColor("red");
    obj.button5:setText("Dano Fisico");
    obj.button5:setWidth(100);
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.PopJ1);
    obj.button6:setLeft(130);
    obj.button6:setTop(100);
    obj.button6:setFontColor("Cyan");
    obj.button6:setText("Dano Magico");
    obj.button6:setWidth(100);
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.PopJ1);
    obj.button7:setLeft(240);
    obj.button7:setTop(100);
    obj.button7:setFontColor("white");
    obj.button7:setText("Dano Real");
    obj.button7:setWidth(100);
    obj.button7:setName("button7");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.PopJ1);
    obj.label20:setLeft(20);
    obj.label20:setTop(200);
    obj.label20:setHeight(30);
    obj.label20:setWidth(150);
    obj.label20:setFontSize(20);
    obj.label20:setFontColor("MediumBlue");
    obj.label20:setText("Dano Causado");
    obj.label20:setName("label20");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.PopJ1);
    obj.rectangle2:setLeft(20);
    obj.rectangle2:setTop(240);
    obj.rectangle2:setWidth(130);
    obj.rectangle2:setHeight(30);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setStrokeColor("DarkGray");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setName("rectangle2");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.PopJ1);
    obj.label21:setLeft(25);
    obj.label21:setTop(240);
    obj.label21:setWidth(130);
    obj.label21:setHeight(30);
    obj.label21:setText("white");
    obj.label21:setFontSize(20);
    obj.label21:setFontColor("red");
    obj.label21:setField("DC1");
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.PopJ1);
    obj.label22:setLeft(220);
    obj.label22:setTop(200);
    obj.label22:setHeight(30);
    obj.label22:setWidth(150);
    obj.label22:setFontSize(20);
    obj.label22:setFontColor("MediumBlue");
    obj.label22:setText("Dano Total");
    obj.label22:setName("label22");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.PopJ1);
    obj.rectangle3:setLeft(220);
    obj.rectangle3:setTop(240);
    obj.rectangle3:setWidth(130);
    obj.rectangle3:setHeight(30);
    obj.rectangle3:setColor("DarkGray");
    obj.rectangle3:setStrokeColor("Red");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setName("rectangle3");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.PopJ1);
    obj.label23:setLeft(225);
    obj.label23:setTop(240);
    obj.label23:setWidth(130);
    obj.label23:setHeight(30);
    obj.label23:setText("white");
    obj.label23:setFontSize(20);
    obj.label23:setFontColor("red");
    obj.label23:setField("DT1");
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.PopJ1);
    obj.label24:setLeft(220);
    obj.label24:setTop(280);
    obj.label24:setHeight(30);
    obj.label24:setWidth(150);
    obj.label24:setFontSize(20);
    obj.label24:setFontColor("MediumBlue");
    obj.label24:setText("Numero da Vez");
    obj.label24:setName("label24");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.PopJ1);
    obj.edit15:setLeft(220);
    obj.edit15:setTop(315);
    obj.edit15:setWidth(130);
    obj.edit15:setHeight(30);
    obj.edit15:setText("white");
    obj.edit15:setFontSize(20);
    obj.edit15:setField("TJ1");
    obj.edit15:setName("edit15");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.PopJ1);
    obj.label25:setLeft(20);
    obj.label25:setTop(280);
    obj.label25:setHeight(30);
    obj.label25:setWidth(150);
    obj.label25:setFontSize(20);
    obj.label25:setFontColor("MediumBlue");
    obj.label25:setText("Critical");
    obj.label25:setName("label25");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.PopJ1);
    obj.rectangle4:setLeft(20);
    obj.rectangle4:setTop(315);
    obj.rectangle4:setWidth(130);
    obj.rectangle4:setHeight(30);
    obj.rectangle4:setColor("DarkGray");
    obj.rectangle4:setStrokeColor("red");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setName("rectangle4");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.PopJ1);
    obj.label26:setLeft(25);
    obj.label26:setTop(315);
    obj.label26:setWidth(130);
    obj.label26:setHeight(30);
    obj.label26:setText("white");
    obj.label26:setFontSize(20);
    obj.label26:setFontColor("red");
    obj.label26:setField("CI1");
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.PopJ1);
    obj.label27:setLeft(20);
    obj.label27:setTop(350);
    obj.label27:setHeight(30);
    obj.label27:setWidth(150);
    obj.label27:setFontSize(20);
    obj.label27:setFontColor("MediumBlue");
    obj.label27:setText("Vida do Player");
    obj.label27:setName("label27");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.PopJ1);
    obj.edit16:setLeft(20);
    obj.edit16:setTop(385);
    obj.edit16:setWidth(130);
    obj.edit16:setHeight(30);
    obj.edit16:setField("VIDAJ1");
    obj.edit16:setName("edit16");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.PopJ1);
    obj.label28:setLeft(220);
    obj.label28:setTop(350);
    obj.label28:setHeight(30);
    obj.label28:setWidth(150);
    obj.label28:setFontSize(20);
    obj.label28:setFontColor("MediumBlue");
    obj.label28:setText("Vida do Inimigo");
    obj.label28:setName("label28");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.PopJ1);
    obj.rectangle5:setLeft(220);
    obj.rectangle5:setTop(385);
    obj.rectangle5:setWidth(130);
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("DarkGray");
    obj.rectangle5:setStrokeSize(2);
    obj.rectangle5:setName("rectangle5");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.PopJ1);
    obj.label29:setLeft(225);
    obj.label29:setTop(385);
    obj.label29:setWidth(130);
    obj.label29:setHeight(30);
    obj.label29:setText("white");
    obj.label29:setFontSize(20);
    obj.label29:setFontColor("red");
    obj.label29:setField("VI1");
    obj.label29:setName("label29");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.PopJ1);
    obj.edit17:setLeft(20);
    obj.edit17:setTop(420);
    obj.edit17:setHeight(30);
    obj.edit17:setVisible(false);
    obj.edit17:setWidth(80);
    obj.edit17:setField("Sobra1");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.PopJ1);
    obj.edit18:setLeft(220);
    obj.edit18:setTop(420);
    obj.edit18:setHeight(30);
    obj.edit18:setVisible(false);
    obj.edit18:setWidth(80);
    obj.edit18:setField("TR1");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.PopJ1);
    obj.edit19:setLeft(220);
    obj.edit19:setTop(420);
    obj.edit19:setHeight(30);
    obj.edit19:setVisible(false);
    obj.edit19:setWidth(80);
    obj.edit19:setField("Macete1");
    obj.edit19:setName("edit19");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.image1);
    obj.button8:setLeft(170);
    obj.button8:setTop(40);
    obj.button8:setWidth(100);
    obj.button8:setHeight(100);
    obj.button8:setName("button8");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.image1);
    obj.label30:setLeft(190);
    obj.label30:setTop(80);
    obj.label30:setText("Jogador 2");
    obj.label30:setField("NomeJ2");
    obj.label30:setName("label30");

    obj.PopJ2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ2:setParent(obj.image1);
    obj.PopJ2:setName("PopJ2");
    obj.PopJ2:setWidth(400);
    obj.PopJ2:setScale(0.9);
    obj.PopJ2:setHeight(450);
    obj.PopJ2:setBackOpacity(0.5);

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.PopJ2);
    obj.label31:setLeft(20);
    obj.label31:setTop(20);
    obj.label31:setHeight(30);
    obj.label31:setWidth(80);
    obj.label31:setText("Nome");
    obj.label31:setName("label31");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.PopJ2);
    obj.edit20:setLeft(80);
    obj.edit20:setTop(20);
    obj.edit20:setHeight(30);
    obj.edit20:setWidth(80);
    obj.edit20:setField("NomeJ2");
    obj.edit20:setName("edit20");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.PopJ2);
    obj.label32:setLeft(20);
    obj.label32:setTop(60);
    obj.label32:setHeight(30);
    obj.label32:setWidth(80);
    obj.label32:setText("Dano");
    obj.label32:setName("label32");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.PopJ2);
    obj.edit21:setLeft(80);
    obj.edit21:setTop(60);
    obj.edit21:setHeight(30);
    obj.edit21:setWidth(80);
    obj.edit21:setField("DanoJ2");
    obj.edit21:setName("edit21");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.PopJ2);
    obj.label33:setLeft(170);
    obj.label33:setTop(60);
    obj.label33:setHeight(30);
    obj.label33:setWidth(80);
    obj.label33:setText("Buff Dano");
    obj.label33:setName("label33");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.PopJ2);
    obj.edit22:setLeft(250);
    obj.edit22:setTop(60);
    obj.edit22:setHeight(30);
    obj.edit22:setWidth(80);
    obj.edit22:setField("BuffDNJ2");
    obj.edit22:setName("edit22");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.PopJ2);
    obj.label34:setLeft(170);
    obj.label34:setTop(20);
    obj.label34:setHeight(30);
    obj.label34:setWidth(80);
    obj.label34:setFontColor("red");
    obj.label34:setText("Target/Alvo");
    obj.label34:setName("label34");

    obj.cmbInimigo2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigo2:setParent(obj.PopJ2);
    obj.cmbInimigo2:setName("cmbInimigo2");
    obj.cmbInimigo2:setLeft(250);
    obj.cmbInimigo2:setTop(20);
    obj.cmbInimigo2:setScale(1.4);
    obj.cmbInimigo2:setField("Alvo2");
    obj.cmbInimigo2:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6', 'Player7', 'Player8', 'Player9', 'Player10'});

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.PopJ2);
    obj.label35:setLeft(20);
    obj.label35:setTop(130);
    obj.label35:setHeight(30);
    obj.label35:setWidth(80);
    obj.label35:setText("Defesa");
    obj.label35:setName("label35");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.PopJ2);
    obj.edit23:setLeft(80);
    obj.edit23:setTop(130);
    obj.edit23:setHeight(30);
    obj.edit23:setWidth(80);
    obj.edit23:setEnabled(false);
    obj.edit23:setField("DefesaAlvo2");
    obj.edit23:setName("edit23");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.PopJ2);
    obj.label36:setLeft(170);
    obj.label36:setTop(130);
    obj.label36:setHeight(30);
    obj.label36:setWidth(80);
    obj.label36:setText("Buff Defesa");
    obj.label36:setName("label36");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.PopJ2);
    obj.edit24:setLeft(250);
    obj.edit24:setTop(130);
    obj.edit24:setHeight(30);
    obj.edit24:setWidth(80);
    obj.edit24:setEnabled(false);
    obj.edit24:setField("BuffDefesaAlvo2");
    obj.edit24:setName("edit24");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.PopJ2);
    obj.label37:setLeft(20);
    obj.label37:setTop(170);
    obj.label37:setHeight(30);
    obj.label37:setWidth(80);
    obj.label37:setText("Resist");
    obj.label37:setName("label37");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.PopJ2);
    obj.edit25:setLeft(80);
    obj.edit25:setTop(170);
    obj.edit25:setHeight(30);
    obj.edit25:setWidth(80);
    obj.edit25:setEnabled(false);
    obj.edit25:setField("ResistenciaAlvo2");
    obj.edit25:setName("edit25");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.PopJ2);
    obj.label38:setLeft(170);
    obj.label38:setTop(170);
    obj.label38:setHeight(30);
    obj.label38:setWidth(80);
    obj.label38:setText("Buff Resis");
    obj.label38:setName("label38");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.PopJ2);
    obj.edit26:setLeft(250);
    obj.edit26:setTop(170);
    obj.edit26:setHeight(30);
    obj.edit26:setWidth(80);
    obj.edit26:setEnabled(false);
    obj.edit26:setField("BuffResistenciaAlvo2");
    obj.edit26:setName("edit26");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.PopJ2);
    obj.image4:setLeft(350);
    obj.image4:setTop(60);
    obj.image4:setWidth(30);
    obj.image4:setHeight(30);
    obj.image4:setSRC("/imagens/Shield.png");
    obj.image4:setName("image4");

    obj.btnPopREDPJ2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPopREDPJ2:setParent(obj.PopJ2);
    obj.btnPopREDPJ2:setName("btnPopREDPJ2");
    obj.btnPopREDPJ2:setLeft(350);
    obj.btnPopREDPJ2:setTop(60);
    obj.btnPopREDPJ2:setFontColor("white");
    obj.btnPopREDPJ2:setOpacity(0.3);
    obj.btnPopREDPJ2:setWidth(30);
    obj.btnPopREDPJ2:setHeight(30);

    obj.popDefREDPJ2 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDefREDPJ2:setParent(obj.PopJ2);
    obj.popDefREDPJ2:setName("popDefREDPJ2");
    obj.popDefREDPJ2:setWidth(230);
    obj.popDefREDPJ2:setHeight(100);
    obj.popDefREDPJ2:setBackOpacity(0.5);

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.popDefREDPJ2);
    obj.label39:setLeft(20);
    obj.label39:setTop(10);
    obj.label39:setFontSize(10);
    obj.label39:setHeight(25);
    obj.label39:setWidth(40);
    obj.label39:setText("Defesa");
    obj.label39:setName("label39");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.popDefREDPJ2);
    obj.edit27:setLeft(60);
    obj.edit27:setTop(10);
    obj.edit27:setFontSize(10);
    obj.edit27:setHeight(25);
    obj.edit27:setWidth(40);
    obj.edit27:setField("DefesaJ2");
    obj.edit27:setName("edit27");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.popDefREDPJ2);
    obj.label40:setLeft(110);
    obj.label40:setTop(10);
    obj.label40:setFontSize(10);
    obj.label40:setHeight(25);
    obj.label40:setWidth(80);
    obj.label40:setText("Buff Defesa");
    obj.label40:setName("label40");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.popDefREDPJ2);
    obj.edit28:setLeft(170);
    obj.edit28:setTop(10);
    obj.edit28:setFontSize(10);
    obj.edit28:setHeight(25);
    obj.edit28:setWidth(40);
    obj.edit28:setField("BuffDefJ2");
    obj.edit28:setName("edit28");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.popDefREDPJ2);
    obj.label41:setLeft(20);
    obj.label41:setTop(40);
    obj.label41:setFontSize(10);
    obj.label41:setHeight(25);
    obj.label41:setWidth(40);
    obj.label41:setText("Resist");
    obj.label41:setName("label41");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.popDefREDPJ2);
    obj.edit29:setLeft(60);
    obj.edit29:setTop(40);
    obj.edit29:setFontSize(10);
    obj.edit29:setHeight(25);
    obj.edit29:setWidth(40);
    obj.edit29:setField("ResistenciaJ2");
    obj.edit29:setName("edit29");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.popDefREDPJ2);
    obj.label42:setLeft(110);
    obj.label42:setTop(40);
    obj.label42:setFontSize(10);
    obj.label42:setHeight(25);
    obj.label42:setWidth(80);
    obj.label42:setText("Buff Resis");
    obj.label42:setName("label42");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.popDefREDPJ2);
    obj.edit30:setLeft(170);
    obj.edit30:setTop(40);
    obj.edit30:setFontSize(10);
    obj.edit30:setHeight(25);
    obj.edit30:setWidth(40);
    obj.edit30:setField("BuffResisJ2");
    obj.edit30:setName("edit30");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.popDefREDPJ2);
    obj.label43:setLeft(40);
    obj.label43:setTop(70);
    obj.label43:setWidth(230);
    obj.label43:setFontSize(16);
    obj.label43:setFontColor("red");
    obj.label43:setText("REDUÇOES PLAYER 2");
    obj.label43:setName("label43");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.PopJ2);
    obj.button9:setLeft(20);
    obj.button9:setTop(100);
    obj.button9:setFontColor("red");
    obj.button9:setText("Dano Fisico");
    obj.button9:setWidth(100);
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.PopJ2);
    obj.button10:setLeft(130);
    obj.button10:setTop(100);
    obj.button10:setFontColor("Cyan");
    obj.button10:setText("Dano Magico");
    obj.button10:setWidth(100);
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.PopJ2);
    obj.button11:setLeft(240);
    obj.button11:setTop(100);
    obj.button11:setFontColor("white");
    obj.button11:setText("Dano Real");
    obj.button11:setWidth(100);
    obj.button11:setName("button11");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.PopJ2);
    obj.label44:setLeft(20);
    obj.label44:setTop(200);
    obj.label44:setHeight(30);
    obj.label44:setWidth(150);
    obj.label44:setFontSize(20);
    obj.label44:setFontColor("MediumBlue");
    obj.label44:setText("Dano Causado");
    obj.label44:setName("label44");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.PopJ2);
    obj.rectangle6:setLeft(20);
    obj.rectangle6:setTop(240);
    obj.rectangle6:setWidth(130);
    obj.rectangle6:setHeight(30);
    obj.rectangle6:setColor("white");
    obj.rectangle6:setStrokeColor("DarkGray");
    obj.rectangle6:setStrokeSize(2);
    obj.rectangle6:setName("rectangle6");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.PopJ2);
    obj.label45:setLeft(25);
    obj.label45:setTop(240);
    obj.label45:setWidth(130);
    obj.label45:setHeight(30);
    obj.label45:setText("white");
    obj.label45:setFontSize(20);
    obj.label45:setFontColor("red");
    obj.label45:setField("DC2");
    obj.label45:setName("label45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.PopJ2);
    obj.label46:setLeft(220);
    obj.label46:setTop(200);
    obj.label46:setHeight(30);
    obj.label46:setWidth(150);
    obj.label46:setFontSize(20);
    obj.label46:setFontColor("MediumBlue");
    obj.label46:setText("Dano Total");
    obj.label46:setName("label46");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.PopJ2);
    obj.rectangle7:setLeft(220);
    obj.rectangle7:setTop(240);
    obj.rectangle7:setWidth(130);
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setColor("DarkGray");
    obj.rectangle7:setStrokeColor("Red");
    obj.rectangle7:setStrokeSize(2);
    obj.rectangle7:setName("rectangle7");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.PopJ2);
    obj.label47:setLeft(225);
    obj.label47:setTop(240);
    obj.label47:setWidth(130);
    obj.label47:setHeight(30);
    obj.label47:setText("white");
    obj.label47:setFontSize(20);
    obj.label47:setFontColor("red");
    obj.label47:setField("DT2");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.PopJ2);
    obj.label48:setLeft(220);
    obj.label48:setTop(280);
    obj.label48:setHeight(30);
    obj.label48:setWidth(150);
    obj.label48:setFontSize(20);
    obj.label48:setFontColor("MediumBlue");
    obj.label48:setText("Numero da Vez");
    obj.label48:setName("label48");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.PopJ2);
    obj.edit31:setLeft(220);
    obj.edit31:setTop(315);
    obj.edit31:setWidth(130);
    obj.edit31:setHeight(30);
    obj.edit31:setText("white");
    obj.edit31:setFontSize(20);
    obj.edit31:setField("TJ2");
    obj.edit31:setName("edit31");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.PopJ2);
    obj.label49:setLeft(20);
    obj.label49:setTop(280);
    obj.label49:setHeight(30);
    obj.label49:setWidth(150);
    obj.label49:setFontSize(20);
    obj.label49:setFontColor("MediumBlue");
    obj.label49:setText("Critical");
    obj.label49:setName("label49");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.PopJ2);
    obj.rectangle8:setLeft(20);
    obj.rectangle8:setTop(315);
    obj.rectangle8:setWidth(130);
    obj.rectangle8:setHeight(30);
    obj.rectangle8:setColor("DarkGray");
    obj.rectangle8:setStrokeColor("red");
    obj.rectangle8:setStrokeSize(2);
    obj.rectangle8:setName("rectangle8");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.PopJ2);
    obj.label50:setLeft(25);
    obj.label50:setTop(315);
    obj.label50:setWidth(130);
    obj.label50:setHeight(30);
    obj.label50:setText("white");
    obj.label50:setFontSize(20);
    obj.label50:setFontColor("red");
    obj.label50:setField("CI2");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.PopJ2);
    obj.label51:setLeft(20);
    obj.label51:setTop(350);
    obj.label51:setHeight(30);
    obj.label51:setWidth(150);
    obj.label51:setFontSize(20);
    obj.label51:setFontColor("MediumBlue");
    obj.label51:setText("Vida do Player");
    obj.label51:setName("label51");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.PopJ2);
    obj.edit32:setLeft(20);
    obj.edit32:setTop(385);
    obj.edit32:setWidth(130);
    obj.edit32:setHeight(30);
    obj.edit32:setField("VIDAJ2");
    obj.edit32:setName("edit32");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.PopJ2);
    obj.label52:setLeft(220);
    obj.label52:setTop(350);
    obj.label52:setHeight(30);
    obj.label52:setWidth(150);
    obj.label52:setFontSize(20);
    obj.label52:setFontColor("MediumBlue");
    obj.label52:setText("Vida do Inimigo");
    obj.label52:setName("label52");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.PopJ2);
    obj.rectangle9:setLeft(220);
    obj.rectangle9:setTop(385);
    obj.rectangle9:setWidth(130);
    obj.rectangle9:setHeight(30);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("DarkGray");
    obj.rectangle9:setStrokeSize(2);
    obj.rectangle9:setName("rectangle9");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.PopJ2);
    obj.label53:setLeft(225);
    obj.label53:setTop(385);
    obj.label53:setWidth(130);
    obj.label53:setHeight(30);
    obj.label53:setText("white");
    obj.label53:setFontSize(20);
    obj.label53:setFontColor("red");
    obj.label53:setField("VI2");
    obj.label53:setName("label53");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.PopJ2);
    obj.edit33:setLeft(20);
    obj.edit33:setTop(420);
    obj.edit33:setHeight(30);
    obj.edit33:setVisible(false);
    obj.edit33:setWidth(80);
    obj.edit33:setField("Sobra2");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.PopJ2);
    obj.edit34:setLeft(220);
    obj.edit34:setTop(420);
    obj.edit34:setHeight(30);
    obj.edit34:setVisible(false);
    obj.edit34:setWidth(80);
    obj.edit34:setField("TR2");
    obj.edit34:setName("edit34");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.PopJ2);
    obj.edit35:setLeft(220);
    obj.edit35:setTop(420);
    obj.edit35:setHeight(30);
    obj.edit35:setVisible(false);
    obj.edit35:setWidth(80);
    obj.edit35:setField("Macete2");
    obj.edit35:setName("edit35");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.image1);
    obj.button12:setLeft(300);
    obj.button12:setTop(40);
    obj.button12:setWidth(100);
    obj.button12:setHeight(100);
    obj.button12:setName("button12");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.image1);
    obj.label54:setLeft(320);
    obj.label54:setTop(80);
    obj.label54:setText("Jogador 3");
    obj.label54:setField("NomeJ3");
    obj.label54:setName("label54");

    obj.PopJ3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ3:setParent(obj.image1);
    obj.PopJ3:setName("PopJ3");
    obj.PopJ3:setWidth(400);
    obj.PopJ3:setHeight(450);
    obj.PopJ3:setBackOpacity(0.5);

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.PopJ3);
    obj.label55:setLeft(20);
    obj.label55:setTop(20);
    obj.label55:setHeight(30);
    obj.label55:setWidth(80);
    obj.label55:setText("Nome");
    obj.label55:setName("label55");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.PopJ3);
    obj.edit36:setLeft(80);
    obj.edit36:setTop(20);
    obj.edit36:setHeight(30);
    obj.edit36:setWidth(80);
    obj.edit36:setField("NomeJ3");
    obj.edit36:setName("edit36");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.PopJ3);
    obj.label56:setLeft(20);
    obj.label56:setTop(60);
    obj.label56:setHeight(30);
    obj.label56:setWidth(80);
    obj.label56:setText("Dano");
    obj.label56:setName("label56");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.PopJ3);
    obj.edit37:setLeft(80);
    obj.edit37:setTop(60);
    obj.edit37:setHeight(30);
    obj.edit37:setWidth(80);
    obj.edit37:setField("DanoJ3");
    obj.edit37:setName("edit37");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.PopJ3);
    obj.label57:setLeft(170);
    obj.label57:setTop(60);
    obj.label57:setHeight(30);
    obj.label57:setWidth(80);
    obj.label57:setText("Buff Dano");
    obj.label57:setName("label57");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.PopJ3);
    obj.edit38:setLeft(250);
    obj.edit38:setTop(60);
    obj.edit38:setHeight(30);
    obj.edit38:setWidth(80);
    obj.edit38:setField("BuffDNJ3");
    obj.edit38:setName("edit38");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.PopJ3);
    obj.label58:setLeft(170);
    obj.label58:setTop(20);
    obj.label58:setHeight(30);
    obj.label58:setWidth(80);
    obj.label58:setFontColor("red");
    obj.label58:setText("Target/Alvo");
    obj.label58:setName("label58");

    obj.cmbInimigo3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigo3:setParent(obj.PopJ3);
    obj.cmbInimigo3:setName("cmbInimigo3");
    obj.cmbInimigo3:setLeft(250);
    obj.cmbInimigo3:setTop(20);
    obj.cmbInimigo3:setScale(1.4);
    obj.cmbInimigo3:setField("Alvo3");
    obj.cmbInimigo3:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6', 'Player7', 'Player8', 'Player9', 'Player10'});

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.PopJ3);
    obj.label59:setLeft(20);
    obj.label59:setTop(130);
    obj.label59:setHeight(30);
    obj.label59:setWidth(80);
    obj.label59:setText("Defesa");
    obj.label59:setName("label59");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.PopJ3);
    obj.edit39:setLeft(80);
    obj.edit39:setTop(130);
    obj.edit39:setHeight(30);
    obj.edit39:setWidth(80);
    obj.edit39:setEnabled(false);
    obj.edit39:setField("DefesaAlvo3");
    obj.edit39:setName("edit39");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.PopJ3);
    obj.label60:setLeft(170);
    obj.label60:setTop(130);
    obj.label60:setHeight(30);
    obj.label60:setWidth(80);
    obj.label60:setText("Buff Defesa");
    obj.label60:setName("label60");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.PopJ3);
    obj.edit40:setLeft(250);
    obj.edit40:setTop(130);
    obj.edit40:setHeight(30);
    obj.edit40:setWidth(80);
    obj.edit40:setEnabled(false);
    obj.edit40:setField("BuffDefesaAlvo3");
    obj.edit40:setName("edit40");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.PopJ3);
    obj.label61:setLeft(20);
    obj.label61:setTop(170);
    obj.label61:setHeight(30);
    obj.label61:setWidth(80);
    obj.label61:setText("Resist");
    obj.label61:setName("label61");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.PopJ3);
    obj.edit41:setLeft(80);
    obj.edit41:setTop(170);
    obj.edit41:setHeight(30);
    obj.edit41:setWidth(80);
    obj.edit41:setEnabled(false);
    obj.edit41:setField("ResistenciaAlvo3");
    obj.edit41:setName("edit41");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.PopJ3);
    obj.label62:setLeft(170);
    obj.label62:setTop(170);
    obj.label62:setHeight(30);
    obj.label62:setWidth(80);
    obj.label62:setText("Buff Resis");
    obj.label62:setName("label62");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.PopJ3);
    obj.edit42:setLeft(250);
    obj.edit42:setTop(170);
    obj.edit42:setHeight(30);
    obj.edit42:setWidth(80);
    obj.edit42:setEnabled(false);
    obj.edit42:setField("BuffResistenciaAlvo3");
    obj.edit42:setName("edit42");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.PopJ3);
    obj.image5:setLeft(350);
    obj.image5:setTop(60);
    obj.image5:setWidth(30);
    obj.image5:setHeight(30);
    obj.image5:setSRC("/imagens/Shield.png");
    obj.image5:setName("image5");

    obj.btnPopREDPJ3 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPopREDPJ3:setParent(obj.PopJ3);
    obj.btnPopREDPJ3:setName("btnPopREDPJ3");
    obj.btnPopREDPJ3:setLeft(350);
    obj.btnPopREDPJ3:setTop(60);
    obj.btnPopREDPJ3:setFontColor("white");
    obj.btnPopREDPJ3:setOpacity(0.3);
    obj.btnPopREDPJ3:setWidth(30);
    obj.btnPopREDPJ3:setHeight(30);

    obj.popDefREDPJ3 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDefREDPJ3:setParent(obj.PopJ3);
    obj.popDefREDPJ3:setName("popDefREDPJ3");
    obj.popDefREDPJ3:setWidth(230);
    obj.popDefREDPJ3:setHeight(100);
    obj.popDefREDPJ3:setBackOpacity(0.5);

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.popDefREDPJ3);
    obj.label63:setLeft(20);
    obj.label63:setTop(10);
    obj.label63:setFontSize(10);
    obj.label63:setHeight(25);
    obj.label63:setWidth(40);
    obj.label63:setText("Defesa");
    obj.label63:setName("label63");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.popDefREDPJ3);
    obj.edit43:setLeft(60);
    obj.edit43:setTop(10);
    obj.edit43:setFontSize(10);
    obj.edit43:setHeight(25);
    obj.edit43:setWidth(40);
    obj.edit43:setField("DefesaJ3");
    obj.edit43:setName("edit43");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.popDefREDPJ3);
    obj.label64:setLeft(110);
    obj.label64:setTop(10);
    obj.label64:setFontSize(10);
    obj.label64:setHeight(25);
    obj.label64:setWidth(80);
    obj.label64:setText("Buff Defesa");
    obj.label64:setName("label64");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.popDefREDPJ3);
    obj.edit44:setLeft(170);
    obj.edit44:setTop(10);
    obj.edit44:setFontSize(10);
    obj.edit44:setHeight(25);
    obj.edit44:setWidth(40);
    obj.edit44:setField("BuffDefJ3");
    obj.edit44:setName("edit44");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.popDefREDPJ3);
    obj.label65:setLeft(20);
    obj.label65:setTop(40);
    obj.label65:setFontSize(10);
    obj.label65:setHeight(25);
    obj.label65:setWidth(40);
    obj.label65:setText("Resist");
    obj.label65:setName("label65");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.popDefREDPJ3);
    obj.edit45:setLeft(60);
    obj.edit45:setTop(40);
    obj.edit45:setFontSize(10);
    obj.edit45:setHeight(25);
    obj.edit45:setWidth(40);
    obj.edit45:setField("ResistenciaJ3");
    obj.edit45:setName("edit45");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.popDefREDPJ3);
    obj.label66:setLeft(110);
    obj.label66:setTop(40);
    obj.label66:setFontSize(10);
    obj.label66:setHeight(25);
    obj.label66:setWidth(80);
    obj.label66:setText("Buff Resis");
    obj.label66:setName("label66");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.popDefREDPJ3);
    obj.edit46:setLeft(170);
    obj.edit46:setTop(40);
    obj.edit46:setFontSize(10);
    obj.edit46:setHeight(25);
    obj.edit46:setWidth(40);
    obj.edit46:setField("BuffResisJ3");
    obj.edit46:setName("edit46");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.popDefREDPJ3);
    obj.label67:setLeft(40);
    obj.label67:setTop(70);
    obj.label67:setWidth(230);
    obj.label67:setFontSize(16);
    obj.label67:setFontColor("red");
    obj.label67:setText("REDUÇOES PLAYER 3");
    obj.label67:setName("label67");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.PopJ3);
    obj.button13:setLeft(20);
    obj.button13:setTop(100);
    obj.button13:setFontColor("red");
    obj.button13:setText("Dano Fisico");
    obj.button13:setWidth(100);
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.PopJ3);
    obj.button14:setLeft(130);
    obj.button14:setTop(100);
    obj.button14:setFontColor("Cyan");
    obj.button14:setText("Dano Magico");
    obj.button14:setWidth(100);
    obj.button14:setName("button14");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.PopJ3);
    obj.button15:setLeft(240);
    obj.button15:setTop(100);
    obj.button15:setFontColor("white");
    obj.button15:setText("Dano Real");
    obj.button15:setWidth(100);
    obj.button15:setName("button15");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.PopJ3);
    obj.label68:setLeft(20);
    obj.label68:setTop(200);
    obj.label68:setHeight(30);
    obj.label68:setWidth(150);
    obj.label68:setFontSize(20);
    obj.label68:setFontColor("MediumBlue");
    obj.label68:setText("Dano Causado");
    obj.label68:setName("label68");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.PopJ3);
    obj.rectangle10:setLeft(20);
    obj.rectangle10:setTop(240);
    obj.rectangle10:setWidth(130);
    obj.rectangle10:setHeight(30);
    obj.rectangle10:setColor("white");
    obj.rectangle10:setStrokeColor("DarkGray");
    obj.rectangle10:setStrokeSize(2);
    obj.rectangle10:setName("rectangle10");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.PopJ3);
    obj.label69:setLeft(25);
    obj.label69:setTop(240);
    obj.label69:setWidth(130);
    obj.label69:setHeight(30);
    obj.label69:setText("white");
    obj.label69:setFontSize(20);
    obj.label69:setFontColor("red");
    obj.label69:setField("DC3");
    obj.label69:setName("label69");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.PopJ3);
    obj.label70:setLeft(220);
    obj.label70:setTop(200);
    obj.label70:setHeight(30);
    obj.label70:setWidth(150);
    obj.label70:setFontSize(20);
    obj.label70:setFontColor("MediumBlue");
    obj.label70:setText("Dano Total");
    obj.label70:setName("label70");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.PopJ3);
    obj.rectangle11:setLeft(220);
    obj.rectangle11:setTop(240);
    obj.rectangle11:setWidth(130);
    obj.rectangle11:setHeight(30);
    obj.rectangle11:setColor("DarkGray");
    obj.rectangle11:setStrokeColor("Red");
    obj.rectangle11:setStrokeSize(2);
    obj.rectangle11:setName("rectangle11");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.PopJ3);
    obj.label71:setLeft(225);
    obj.label71:setTop(240);
    obj.label71:setWidth(130);
    obj.label71:setHeight(30);
    obj.label71:setText("white");
    obj.label71:setFontSize(20);
    obj.label71:setFontColor("red");
    obj.label71:setField("DT3");
    obj.label71:setName("label71");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.PopJ3);
    obj.label72:setLeft(220);
    obj.label72:setTop(280);
    obj.label72:setHeight(30);
    obj.label72:setWidth(150);
    obj.label72:setFontSize(20);
    obj.label72:setFontColor("MediumBlue");
    obj.label72:setText("Numero da Vez");
    obj.label72:setName("label72");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.PopJ3);
    obj.edit47:setLeft(220);
    obj.edit47:setTop(315);
    obj.edit47:setWidth(130);
    obj.edit47:setHeight(30);
    obj.edit47:setText("white");
    obj.edit47:setFontSize(20);
    obj.edit47:setField("TJ3");
    obj.edit47:setName("edit47");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.PopJ3);
    obj.label73:setLeft(20);
    obj.label73:setTop(280);
    obj.label73:setHeight(30);
    obj.label73:setWidth(150);
    obj.label73:setFontSize(20);
    obj.label73:setFontColor("MediumBlue");
    obj.label73:setText("Critical");
    obj.label73:setName("label73");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.PopJ3);
    obj.rectangle12:setLeft(20);
    obj.rectangle12:setTop(315);
    obj.rectangle12:setWidth(130);
    obj.rectangle12:setHeight(30);
    obj.rectangle12:setColor("DarkGray");
    obj.rectangle12:setStrokeColor("red");
    obj.rectangle12:setStrokeSize(2);
    obj.rectangle12:setName("rectangle12");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.PopJ3);
    obj.label74:setLeft(25);
    obj.label74:setTop(315);
    obj.label74:setWidth(130);
    obj.label74:setHeight(30);
    obj.label74:setText("white");
    obj.label74:setFontSize(20);
    obj.label74:setFontColor("red");
    obj.label74:setField("CI3");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.PopJ3);
    obj.label75:setLeft(20);
    obj.label75:setTop(350);
    obj.label75:setHeight(30);
    obj.label75:setWidth(150);
    obj.label75:setFontSize(20);
    obj.label75:setFontColor("MediumBlue");
    obj.label75:setText("Vida do Player");
    obj.label75:setName("label75");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.PopJ3);
    obj.edit48:setLeft(20);
    obj.edit48:setTop(385);
    obj.edit48:setWidth(130);
    obj.edit48:setHeight(30);
    obj.edit48:setField("VIDAJ3");
    obj.edit48:setName("edit48");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.PopJ3);
    obj.label76:setLeft(220);
    obj.label76:setTop(350);
    obj.label76:setHeight(30);
    obj.label76:setWidth(150);
    obj.label76:setFontSize(20);
    obj.label76:setFontColor("MediumBlue");
    obj.label76:setText("Vida do Inimigo");
    obj.label76:setName("label76");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.PopJ3);
    obj.rectangle13:setLeft(220);
    obj.rectangle13:setTop(385);
    obj.rectangle13:setWidth(130);
    obj.rectangle13:setHeight(30);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("DarkGray");
    obj.rectangle13:setStrokeSize(2);
    obj.rectangle13:setName("rectangle13");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.PopJ3);
    obj.label77:setLeft(225);
    obj.label77:setTop(385);
    obj.label77:setWidth(130);
    obj.label77:setHeight(30);
    obj.label77:setText("white");
    obj.label77:setFontSize(20);
    obj.label77:setFontColor("red");
    obj.label77:setField("VI3");
    obj.label77:setName("label77");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.PopJ3);
    obj.edit49:setLeft(20);
    obj.edit49:setTop(420);
    obj.edit49:setHeight(30);
    obj.edit49:setVisible(false);
    obj.edit49:setWidth(80);
    obj.edit49:setField("Sobra3");
    obj.edit49:setName("edit49");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.PopJ3);
    obj.edit50:setLeft(220);
    obj.edit50:setTop(420);
    obj.edit50:setHeight(30);
    obj.edit50:setVisible(false);
    obj.edit50:setWidth(80);
    obj.edit50:setField("TR3");
    obj.edit50:setName("edit50");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.PopJ3);
    obj.edit51:setLeft(220);
    obj.edit51:setTop(420);
    obj.edit51:setHeight(30);
    obj.edit51:setVisible(false);
    obj.edit51:setWidth(80);
    obj.edit51:setField("Macete3");
    obj.edit51:setName("edit51");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.image1);
    obj.button16:setLeft(430);
    obj.button16:setTop(40);
    obj.button16:setWidth(100);
    obj.button16:setHeight(100);
    obj.button16:setName("button16");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.image1);
    obj.label78:setLeft(450);
    obj.label78:setTop(80);
    obj.label78:setText("Jogador 4");
    obj.label78:setField("NomeJ4");
    obj.label78:setName("label78");

    obj.PopJ4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ4:setParent(obj.image1);
    obj.PopJ4:setName("PopJ4");
    obj.PopJ4:setWidth(400);
    obj.PopJ4:setHeight(450);
    obj.PopJ4:setBackOpacity(0.5);

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.PopJ4);
    obj.label79:setLeft(20);
    obj.label79:setTop(20);
    obj.label79:setHeight(30);
    obj.label79:setWidth(80);
    obj.label79:setText("Nome");
    obj.label79:setName("label79");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.PopJ4);
    obj.edit52:setLeft(80);
    obj.edit52:setTop(20);
    obj.edit52:setHeight(30);
    obj.edit52:setWidth(80);
    obj.edit52:setField("NomeJ4");
    obj.edit52:setName("edit52");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.PopJ4);
    obj.label80:setLeft(20);
    obj.label80:setTop(60);
    obj.label80:setHeight(30);
    obj.label80:setWidth(80);
    obj.label80:setText("Dano");
    obj.label80:setName("label80");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.PopJ4);
    obj.edit53:setLeft(80);
    obj.edit53:setTop(60);
    obj.edit53:setHeight(30);
    obj.edit53:setWidth(80);
    obj.edit53:setField("DanoJ4");
    obj.edit53:setName("edit53");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.PopJ4);
    obj.label81:setLeft(170);
    obj.label81:setTop(60);
    obj.label81:setHeight(30);
    obj.label81:setWidth(80);
    obj.label81:setText("Buff Dano");
    obj.label81:setName("label81");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.PopJ4);
    obj.edit54:setLeft(250);
    obj.edit54:setTop(60);
    obj.edit54:setHeight(30);
    obj.edit54:setWidth(80);
    obj.edit54:setField("BuffDNJ4");
    obj.edit54:setName("edit54");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.PopJ4);
    obj.label82:setLeft(170);
    obj.label82:setTop(20);
    obj.label82:setHeight(30);
    obj.label82:setWidth(80);
    obj.label82:setFontColor("red");
    obj.label82:setText("Target/Alvo");
    obj.label82:setName("label82");

    obj.cmbInimigo4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigo4:setParent(obj.PopJ4);
    obj.cmbInimigo4:setName("cmbInimigo4");
    obj.cmbInimigo4:setLeft(250);
    obj.cmbInimigo4:setTop(20);
    obj.cmbInimigo4:setScale(1.4);
    obj.cmbInimigo4:setField("Alvo4");
    obj.cmbInimigo4:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6', 'Player7', 'Player8', 'Player9', 'Player10'});

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.PopJ4);
    obj.label83:setLeft(20);
    obj.label83:setTop(130);
    obj.label83:setHeight(30);
    obj.label83:setWidth(80);
    obj.label83:setText("Defesa");
    obj.label83:setName("label83");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.PopJ4);
    obj.edit55:setLeft(80);
    obj.edit55:setTop(130);
    obj.edit55:setHeight(30);
    obj.edit55:setWidth(80);
    obj.edit55:setEnabled(false);
    obj.edit55:setField("DefesaAlvo4");
    obj.edit55:setName("edit55");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.PopJ4);
    obj.label84:setLeft(170);
    obj.label84:setTop(130);
    obj.label84:setHeight(30);
    obj.label84:setWidth(80);
    obj.label84:setText("Buff Defesa");
    obj.label84:setName("label84");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.PopJ4);
    obj.edit56:setLeft(250);
    obj.edit56:setTop(130);
    obj.edit56:setHeight(30);
    obj.edit56:setWidth(80);
    obj.edit56:setEnabled(false);
    obj.edit56:setField("BuffDefesaAlvo4");
    obj.edit56:setName("edit56");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.PopJ4);
    obj.label85:setLeft(20);
    obj.label85:setTop(170);
    obj.label85:setHeight(30);
    obj.label85:setWidth(80);
    obj.label85:setText("Resist");
    obj.label85:setName("label85");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.PopJ4);
    obj.edit57:setLeft(80);
    obj.edit57:setTop(170);
    obj.edit57:setHeight(30);
    obj.edit57:setWidth(80);
    obj.edit57:setEnabled(false);
    obj.edit57:setField("ResistenciaAlvo4");
    obj.edit57:setName("edit57");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.PopJ4);
    obj.label86:setLeft(170);
    obj.label86:setTop(170);
    obj.label86:setHeight(30);
    obj.label86:setWidth(80);
    obj.label86:setText("Buff Resis");
    obj.label86:setName("label86");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.PopJ4);
    obj.edit58:setLeft(250);
    obj.edit58:setTop(170);
    obj.edit58:setHeight(30);
    obj.edit58:setWidth(80);
    obj.edit58:setEnabled(false);
    obj.edit58:setField("BuffResistenciaAlvo4");
    obj.edit58:setName("edit58");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.PopJ4);
    obj.image6:setLeft(350);
    obj.image6:setTop(60);
    obj.image6:setWidth(30);
    obj.image6:setHeight(30);
    obj.image6:setSRC("/imagens/Shield.png");
    obj.image6:setName("image6");

    obj.btnPopREDPJ4 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPopREDPJ4:setParent(obj.PopJ4);
    obj.btnPopREDPJ4:setName("btnPopREDPJ4");
    obj.btnPopREDPJ4:setLeft(350);
    obj.btnPopREDPJ4:setTop(60);
    obj.btnPopREDPJ4:setFontColor("white");
    obj.btnPopREDPJ4:setOpacity(0.3);
    obj.btnPopREDPJ4:setWidth(30);
    obj.btnPopREDPJ4:setHeight(30);

    obj.popDefREDPJ4 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDefREDPJ4:setParent(obj.PopJ4);
    obj.popDefREDPJ4:setName("popDefREDPJ4");
    obj.popDefREDPJ4:setWidth(230);
    obj.popDefREDPJ4:setHeight(100);
    obj.popDefREDPJ4:setBackOpacity(0.5);

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.popDefREDPJ4);
    obj.label87:setLeft(20);
    obj.label87:setTop(10);
    obj.label87:setFontSize(10);
    obj.label87:setHeight(25);
    obj.label87:setWidth(40);
    obj.label87:setText("Defesa");
    obj.label87:setName("label87");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.popDefREDPJ4);
    obj.edit59:setLeft(60);
    obj.edit59:setTop(10);
    obj.edit59:setFontSize(10);
    obj.edit59:setHeight(25);
    obj.edit59:setWidth(40);
    obj.edit59:setField("DefesaJ4");
    obj.edit59:setName("edit59");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.popDefREDPJ4);
    obj.label88:setLeft(110);
    obj.label88:setTop(10);
    obj.label88:setFontSize(10);
    obj.label88:setHeight(25);
    obj.label88:setWidth(80);
    obj.label88:setText("Buff Defesa");
    obj.label88:setName("label88");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.popDefREDPJ4);
    obj.edit60:setLeft(170);
    obj.edit60:setTop(10);
    obj.edit60:setFontSize(10);
    obj.edit60:setHeight(25);
    obj.edit60:setWidth(40);
    obj.edit60:setField("BuffDefJ4");
    obj.edit60:setName("edit60");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.popDefREDPJ4);
    obj.label89:setLeft(20);
    obj.label89:setTop(40);
    obj.label89:setFontSize(10);
    obj.label89:setHeight(25);
    obj.label89:setWidth(40);
    obj.label89:setText("Resist");
    obj.label89:setName("label89");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.popDefREDPJ4);
    obj.edit61:setLeft(60);
    obj.edit61:setTop(40);
    obj.edit61:setFontSize(10);
    obj.edit61:setHeight(25);
    obj.edit61:setWidth(40);
    obj.edit61:setField("ResistenciaJ4");
    obj.edit61:setName("edit61");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.popDefREDPJ4);
    obj.label90:setLeft(110);
    obj.label90:setTop(40);
    obj.label90:setFontSize(10);
    obj.label90:setHeight(25);
    obj.label90:setWidth(80);
    obj.label90:setText("Buff Resis");
    obj.label90:setName("label90");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.popDefREDPJ4);
    obj.edit62:setLeft(170);
    obj.edit62:setTop(40);
    obj.edit62:setFontSize(10);
    obj.edit62:setHeight(25);
    obj.edit62:setWidth(40);
    obj.edit62:setField("BuffResisJ4");
    obj.edit62:setName("edit62");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.popDefREDPJ4);
    obj.label91:setLeft(40);
    obj.label91:setTop(70);
    obj.label91:setWidth(230);
    obj.label91:setFontSize(16);
    obj.label91:setFontColor("red");
    obj.label91:setText("REDUÇOES PLAYER 4");
    obj.label91:setName("label91");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.PopJ4);
    obj.button17:setLeft(20);
    obj.button17:setTop(100);
    obj.button17:setFontColor("red");
    obj.button17:setText("Dano Fisico");
    obj.button17:setWidth(100);
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.PopJ4);
    obj.button18:setLeft(130);
    obj.button18:setTop(100);
    obj.button18:setFontColor("Cyan");
    obj.button18:setText("Dano Magico");
    obj.button18:setWidth(100);
    obj.button18:setName("button18");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.PopJ4);
    obj.button19:setLeft(240);
    obj.button19:setTop(100);
    obj.button19:setFontColor("white");
    obj.button19:setText("Dano Real");
    obj.button19:setWidth(100);
    obj.button19:setName("button19");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.PopJ4);
    obj.label92:setLeft(20);
    obj.label92:setTop(200);
    obj.label92:setHeight(30);
    obj.label92:setWidth(150);
    obj.label92:setFontSize(20);
    obj.label92:setFontColor("MediumBlue");
    obj.label92:setText("Dano Causado");
    obj.label92:setName("label92");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.PopJ4);
    obj.rectangle14:setLeft(20);
    obj.rectangle14:setTop(240);
    obj.rectangle14:setWidth(130);
    obj.rectangle14:setHeight(30);
    obj.rectangle14:setColor("white");
    obj.rectangle14:setStrokeColor("DarkGray");
    obj.rectangle14:setStrokeSize(2);
    obj.rectangle14:setName("rectangle14");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.PopJ4);
    obj.label93:setLeft(25);
    obj.label93:setTop(240);
    obj.label93:setWidth(130);
    obj.label93:setHeight(30);
    obj.label93:setText("white");
    obj.label93:setFontSize(20);
    obj.label93:setFontColor("red");
    obj.label93:setField("DC4");
    obj.label93:setName("label93");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.PopJ4);
    obj.label94:setLeft(220);
    obj.label94:setTop(200);
    obj.label94:setHeight(30);
    obj.label94:setWidth(150);
    obj.label94:setFontSize(20);
    obj.label94:setFontColor("MediumBlue");
    obj.label94:setText("Dano Total");
    obj.label94:setName("label94");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.PopJ4);
    obj.rectangle15:setLeft(220);
    obj.rectangle15:setTop(240);
    obj.rectangle15:setWidth(130);
    obj.rectangle15:setHeight(30);
    obj.rectangle15:setColor("DarkGray");
    obj.rectangle15:setStrokeColor("Red");
    obj.rectangle15:setStrokeSize(2);
    obj.rectangle15:setName("rectangle15");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.PopJ4);
    obj.label95:setLeft(225);
    obj.label95:setTop(240);
    obj.label95:setWidth(130);
    obj.label95:setHeight(30);
    obj.label95:setText("white");
    obj.label95:setFontSize(20);
    obj.label95:setFontColor("red");
    obj.label95:setField("DT4");
    obj.label95:setName("label95");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.PopJ4);
    obj.label96:setLeft(220);
    obj.label96:setTop(280);
    obj.label96:setHeight(30);
    obj.label96:setWidth(150);
    obj.label96:setFontSize(20);
    obj.label96:setFontColor("MediumBlue");
    obj.label96:setText("Numero da Vez");
    obj.label96:setName("label96");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.PopJ4);
    obj.edit63:setLeft(220);
    obj.edit63:setTop(315);
    obj.edit63:setWidth(130);
    obj.edit63:setHeight(30);
    obj.edit63:setText("white");
    obj.edit63:setFontSize(20);
    obj.edit63:setField("TJ4");
    obj.edit63:setName("edit63");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.PopJ4);
    obj.label97:setLeft(20);
    obj.label97:setTop(280);
    obj.label97:setHeight(30);
    obj.label97:setWidth(150);
    obj.label97:setFontSize(20);
    obj.label97:setFontColor("MediumBlue");
    obj.label97:setText("Critical");
    obj.label97:setName("label97");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.PopJ4);
    obj.rectangle16:setLeft(20);
    obj.rectangle16:setTop(315);
    obj.rectangle16:setWidth(130);
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setColor("DarkGray");
    obj.rectangle16:setStrokeColor("red");
    obj.rectangle16:setStrokeSize(2);
    obj.rectangle16:setName("rectangle16");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.PopJ4);
    obj.label98:setLeft(25);
    obj.label98:setTop(315);
    obj.label98:setWidth(130);
    obj.label98:setHeight(30);
    obj.label98:setText("white");
    obj.label98:setFontSize(20);
    obj.label98:setFontColor("red");
    obj.label98:setField("CI4");
    obj.label98:setName("label98");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.PopJ4);
    obj.label99:setLeft(20);
    obj.label99:setTop(350);
    obj.label99:setHeight(30);
    obj.label99:setWidth(150);
    obj.label99:setFontSize(20);
    obj.label99:setFontColor("MediumBlue");
    obj.label99:setText("Vida do Player");
    obj.label99:setName("label99");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.PopJ4);
    obj.edit64:setLeft(20);
    obj.edit64:setTop(385);
    obj.edit64:setWidth(130);
    obj.edit64:setHeight(30);
    obj.edit64:setField("VIDAJ4");
    obj.edit64:setName("edit64");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.PopJ4);
    obj.label100:setLeft(220);
    obj.label100:setTop(350);
    obj.label100:setHeight(30);
    obj.label100:setWidth(150);
    obj.label100:setFontSize(20);
    obj.label100:setFontColor("MediumBlue");
    obj.label100:setText("Vida do Inimigo");
    obj.label100:setName("label100");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.PopJ4);
    obj.rectangle17:setLeft(220);
    obj.rectangle17:setTop(385);
    obj.rectangle17:setWidth(130);
    obj.rectangle17:setHeight(30);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("DarkGray");
    obj.rectangle17:setStrokeSize(2);
    obj.rectangle17:setName("rectangle17");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.PopJ4);
    obj.label101:setLeft(225);
    obj.label101:setTop(385);
    obj.label101:setWidth(130);
    obj.label101:setHeight(30);
    obj.label101:setText("white");
    obj.label101:setFontSize(20);
    obj.label101:setFontColor("red");
    obj.label101:setField("VI4");
    obj.label101:setName("label101");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.PopJ4);
    obj.edit65:setLeft(20);
    obj.edit65:setTop(420);
    obj.edit65:setHeight(30);
    obj.edit65:setVisible(false);
    obj.edit65:setWidth(80);
    obj.edit65:setField("Sobra4");
    obj.edit65:setName("edit65");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.PopJ4);
    obj.edit66:setLeft(220);
    obj.edit66:setTop(420);
    obj.edit66:setHeight(30);
    obj.edit66:setVisible(false);
    obj.edit66:setWidth(80);
    obj.edit66:setField("TR4");
    obj.edit66:setName("edit66");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.PopJ4);
    obj.edit67:setLeft(220);
    obj.edit67:setTop(420);
    obj.edit67:setHeight(30);
    obj.edit67:setVisible(false);
    obj.edit67:setWidth(80);
    obj.edit67:setField("Macete4");
    obj.edit67:setName("edit67");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.image1);
    obj.button20:setLeft(560);
    obj.button20:setTop(40);
    obj.button20:setWidth(100);
    obj.button20:setHeight(100);
    obj.button20:setName("button20");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.image1);
    obj.label102:setLeft(580);
    obj.label102:setTop(80);
    obj.label102:setText("Jogador 5");
    obj.label102:setField("NomeJ5");
    obj.label102:setName("label102");

    obj.PopJ5 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ5:setParent(obj.image1);
    obj.PopJ5:setName("PopJ5");
    obj.PopJ5:setWidth(400);
    obj.PopJ5:setHeight(450);
    obj.PopJ5:setBackOpacity(0.5);

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.PopJ5);
    obj.label103:setLeft(20);
    obj.label103:setTop(20);
    obj.label103:setHeight(30);
    obj.label103:setWidth(80);
    obj.label103:setText("Nome");
    obj.label103:setName("label103");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.PopJ5);
    obj.edit68:setLeft(80);
    obj.edit68:setTop(20);
    obj.edit68:setHeight(30);
    obj.edit68:setWidth(80);
    obj.edit68:setField("NomeJ5");
    obj.edit68:setName("edit68");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.PopJ5);
    obj.label104:setLeft(20);
    obj.label104:setTop(60);
    obj.label104:setHeight(30);
    obj.label104:setWidth(80);
    obj.label104:setText("Dano");
    obj.label104:setName("label104");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.PopJ5);
    obj.edit69:setLeft(80);
    obj.edit69:setTop(60);
    obj.edit69:setHeight(30);
    obj.edit69:setWidth(80);
    obj.edit69:setField("DanoJ5");
    obj.edit69:setName("edit69");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.PopJ5);
    obj.label105:setLeft(170);
    obj.label105:setTop(60);
    obj.label105:setHeight(30);
    obj.label105:setWidth(80);
    obj.label105:setText("Buff Dano");
    obj.label105:setName("label105");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.PopJ5);
    obj.edit70:setLeft(250);
    obj.edit70:setTop(60);
    obj.edit70:setHeight(30);
    obj.edit70:setWidth(80);
    obj.edit70:setField("BuffDNJ5");
    obj.edit70:setName("edit70");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.PopJ5);
    obj.label106:setLeft(170);
    obj.label106:setTop(20);
    obj.label106:setHeight(30);
    obj.label106:setWidth(80);
    obj.label106:setFontColor("red");
    obj.label106:setText("Target/Alvo");
    obj.label106:setName("label106");

    obj.cmbInimigo5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigo5:setParent(obj.PopJ5);
    obj.cmbInimigo5:setName("cmbInimigo5");
    obj.cmbInimigo5:setLeft(250);
    obj.cmbInimigo5:setTop(20);
    obj.cmbInimigo5:setScale(1.4);
    obj.cmbInimigo5:setField("Alvo5");
    obj.cmbInimigo5:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6', 'Player7', 'Player8', 'Player9', 'Player10'});

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.PopJ5);
    obj.label107:setLeft(20);
    obj.label107:setTop(130);
    obj.label107:setHeight(30);
    obj.label107:setWidth(80);
    obj.label107:setText("Defesa");
    obj.label107:setName("label107");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.PopJ5);
    obj.edit71:setLeft(80);
    obj.edit71:setTop(130);
    obj.edit71:setHeight(30);
    obj.edit71:setWidth(80);
    obj.edit71:setEnabled(false);
    obj.edit71:setField("DefesaAlvo5");
    obj.edit71:setName("edit71");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.PopJ5);
    obj.label108:setLeft(170);
    obj.label108:setTop(130);
    obj.label108:setHeight(30);
    obj.label108:setWidth(80);
    obj.label108:setText("Buff Defesa");
    obj.label108:setName("label108");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.PopJ5);
    obj.edit72:setLeft(250);
    obj.edit72:setTop(130);
    obj.edit72:setHeight(30);
    obj.edit72:setWidth(80);
    obj.edit72:setEnabled(false);
    obj.edit72:setField("BuffDefesaAlvo5");
    obj.edit72:setName("edit72");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.PopJ5);
    obj.label109:setLeft(20);
    obj.label109:setTop(170);
    obj.label109:setHeight(30);
    obj.label109:setWidth(80);
    obj.label109:setText("Resist");
    obj.label109:setName("label109");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.PopJ5);
    obj.edit73:setLeft(80);
    obj.edit73:setTop(170);
    obj.edit73:setHeight(30);
    obj.edit73:setWidth(80);
    obj.edit73:setEnabled(false);
    obj.edit73:setField("ResistenciaAlvo5");
    obj.edit73:setName("edit73");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.PopJ5);
    obj.label110:setLeft(170);
    obj.label110:setTop(170);
    obj.label110:setHeight(30);
    obj.label110:setWidth(80);
    obj.label110:setText("Buff Resis");
    obj.label110:setName("label110");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.PopJ5);
    obj.edit74:setLeft(250);
    obj.edit74:setTop(170);
    obj.edit74:setHeight(30);
    obj.edit74:setWidth(80);
    obj.edit74:setEnabled(false);
    obj.edit74:setField("BuffResistenciaAlvo5");
    obj.edit74:setName("edit74");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.PopJ5);
    obj.image7:setLeft(350);
    obj.image7:setTop(60);
    obj.image7:setWidth(30);
    obj.image7:setHeight(30);
    obj.image7:setSRC("/imagens/Shield.png");
    obj.image7:setName("image7");

    obj.btnPopREDPJ5 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPopREDPJ5:setParent(obj.PopJ5);
    obj.btnPopREDPJ5:setName("btnPopREDPJ5");
    obj.btnPopREDPJ5:setLeft(350);
    obj.btnPopREDPJ5:setTop(60);
    obj.btnPopREDPJ5:setFontColor("white");
    obj.btnPopREDPJ5:setOpacity(0.3);
    obj.btnPopREDPJ5:setWidth(30);
    obj.btnPopREDPJ5:setHeight(30);

    obj.popDefREDPJ5 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDefREDPJ5:setParent(obj.PopJ5);
    obj.popDefREDPJ5:setName("popDefREDPJ5");
    obj.popDefREDPJ5:setWidth(230);
    obj.popDefREDPJ5:setHeight(100);
    obj.popDefREDPJ5:setBackOpacity(0.5);

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.popDefREDPJ5);
    obj.label111:setLeft(20);
    obj.label111:setTop(10);
    obj.label111:setFontSize(10);
    obj.label111:setHeight(25);
    obj.label111:setWidth(40);
    obj.label111:setText("Defesa");
    obj.label111:setName("label111");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.popDefREDPJ5);
    obj.edit75:setLeft(60);
    obj.edit75:setTop(10);
    obj.edit75:setFontSize(10);
    obj.edit75:setHeight(25);
    obj.edit75:setWidth(40);
    obj.edit75:setField("DefesaJ5");
    obj.edit75:setName("edit75");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.popDefREDPJ5);
    obj.label112:setLeft(110);
    obj.label112:setTop(10);
    obj.label112:setFontSize(10);
    obj.label112:setHeight(25);
    obj.label112:setWidth(80);
    obj.label112:setText("Buff Defesa");
    obj.label112:setName("label112");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.popDefREDPJ5);
    obj.edit76:setLeft(170);
    obj.edit76:setTop(10);
    obj.edit76:setFontSize(10);
    obj.edit76:setHeight(25);
    obj.edit76:setWidth(40);
    obj.edit76:setField("BuffDefJ5");
    obj.edit76:setName("edit76");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.popDefREDPJ5);
    obj.label113:setLeft(20);
    obj.label113:setTop(40);
    obj.label113:setFontSize(10);
    obj.label113:setHeight(25);
    obj.label113:setWidth(40);
    obj.label113:setText("Resist");
    obj.label113:setName("label113");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.popDefREDPJ5);
    obj.edit77:setLeft(60);
    obj.edit77:setTop(40);
    obj.edit77:setFontSize(10);
    obj.edit77:setHeight(25);
    obj.edit77:setWidth(40);
    obj.edit77:setField("ResistenciaJ5");
    obj.edit77:setName("edit77");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.popDefREDPJ5);
    obj.label114:setLeft(110);
    obj.label114:setTop(40);
    obj.label114:setFontSize(10);
    obj.label114:setHeight(25);
    obj.label114:setWidth(80);
    obj.label114:setText("Buff Resis");
    obj.label114:setName("label114");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.popDefREDPJ5);
    obj.edit78:setLeft(170);
    obj.edit78:setTop(40);
    obj.edit78:setFontSize(10);
    obj.edit78:setHeight(25);
    obj.edit78:setWidth(40);
    obj.edit78:setField("BuffResisJ5");
    obj.edit78:setName("edit78");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.popDefREDPJ5);
    obj.label115:setLeft(40);
    obj.label115:setTop(70);
    obj.label115:setWidth(230);
    obj.label115:setFontSize(16);
    obj.label115:setFontColor("red");
    obj.label115:setText("REDUÇOES PLAYER 5");
    obj.label115:setName("label115");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.PopJ5);
    obj.button21:setLeft(20);
    obj.button21:setTop(100);
    obj.button21:setFontColor("red");
    obj.button21:setText("Dano Fisico");
    obj.button21:setWidth(100);
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.PopJ5);
    obj.button22:setLeft(130);
    obj.button22:setTop(100);
    obj.button22:setFontColor("Cyan");
    obj.button22:setText("Dano Magico");
    obj.button22:setWidth(100);
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.PopJ5);
    obj.button23:setLeft(240);
    obj.button23:setTop(100);
    obj.button23:setFontColor("white");
    obj.button23:setText("Dano Real");
    obj.button23:setWidth(100);
    obj.button23:setName("button23");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.PopJ5);
    obj.label116:setLeft(20);
    obj.label116:setTop(200);
    obj.label116:setHeight(30);
    obj.label116:setWidth(150);
    obj.label116:setFontSize(20);
    obj.label116:setFontColor("MediumBlue");
    obj.label116:setText("Dano Causado");
    obj.label116:setName("label116");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.PopJ5);
    obj.rectangle18:setLeft(20);
    obj.rectangle18:setTop(240);
    obj.rectangle18:setWidth(130);
    obj.rectangle18:setHeight(30);
    obj.rectangle18:setColor("white");
    obj.rectangle18:setStrokeColor("DarkGray");
    obj.rectangle18:setStrokeSize(2);
    obj.rectangle18:setName("rectangle18");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.PopJ5);
    obj.label117:setLeft(25);
    obj.label117:setTop(240);
    obj.label117:setWidth(130);
    obj.label117:setHeight(30);
    obj.label117:setText("white");
    obj.label117:setFontSize(20);
    obj.label117:setFontColor("red");
    obj.label117:setField("DC5");
    obj.label117:setName("label117");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.PopJ5);
    obj.label118:setLeft(220);
    obj.label118:setTop(200);
    obj.label118:setHeight(30);
    obj.label118:setWidth(150);
    obj.label118:setFontSize(20);
    obj.label118:setFontColor("MediumBlue");
    obj.label118:setText("Dano Total");
    obj.label118:setName("label118");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.PopJ5);
    obj.rectangle19:setLeft(220);
    obj.rectangle19:setTop(240);
    obj.rectangle19:setWidth(130);
    obj.rectangle19:setHeight(30);
    obj.rectangle19:setColor("DarkGray");
    obj.rectangle19:setStrokeColor("Red");
    obj.rectangle19:setStrokeSize(2);
    obj.rectangle19:setName("rectangle19");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.PopJ5);
    obj.label119:setLeft(225);
    obj.label119:setTop(240);
    obj.label119:setWidth(130);
    obj.label119:setHeight(30);
    obj.label119:setText("white");
    obj.label119:setFontSize(20);
    obj.label119:setFontColor("red");
    obj.label119:setField("DT5");
    obj.label119:setName("label119");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.PopJ5);
    obj.label120:setLeft(220);
    obj.label120:setTop(280);
    obj.label120:setHeight(30);
    obj.label120:setWidth(150);
    obj.label120:setFontSize(20);
    obj.label120:setFontColor("MediumBlue");
    obj.label120:setText("Numero da Vez");
    obj.label120:setName("label120");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.PopJ5);
    obj.edit79:setLeft(220);
    obj.edit79:setTop(315);
    obj.edit79:setWidth(130);
    obj.edit79:setHeight(30);
    obj.edit79:setText("white");
    obj.edit79:setFontSize(20);
    obj.edit79:setField("TJ5");
    obj.edit79:setName("edit79");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.PopJ5);
    obj.label121:setLeft(20);
    obj.label121:setTop(280);
    obj.label121:setHeight(30);
    obj.label121:setWidth(150);
    obj.label121:setFontSize(20);
    obj.label121:setFontColor("MediumBlue");
    obj.label121:setText("Critical");
    obj.label121:setName("label121");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.PopJ5);
    obj.rectangle20:setLeft(20);
    obj.rectangle20:setTop(315);
    obj.rectangle20:setWidth(130);
    obj.rectangle20:setHeight(30);
    obj.rectangle20:setColor("DarkGray");
    obj.rectangle20:setStrokeColor("red");
    obj.rectangle20:setStrokeSize(2);
    obj.rectangle20:setName("rectangle20");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.PopJ5);
    obj.label122:setLeft(25);
    obj.label122:setTop(315);
    obj.label122:setWidth(130);
    obj.label122:setHeight(30);
    obj.label122:setText("white");
    obj.label122:setFontSize(20);
    obj.label122:setFontColor("red");
    obj.label122:setField("CI5");
    obj.label122:setName("label122");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.PopJ5);
    obj.label123:setLeft(20);
    obj.label123:setTop(350);
    obj.label123:setHeight(30);
    obj.label123:setWidth(150);
    obj.label123:setFontSize(20);
    obj.label123:setFontColor("MediumBlue");
    obj.label123:setText("Vida do Player");
    obj.label123:setName("label123");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.PopJ5);
    obj.edit80:setLeft(20);
    obj.edit80:setTop(385);
    obj.edit80:setWidth(130);
    obj.edit80:setHeight(30);
    obj.edit80:setField("VIDAJ5");
    obj.edit80:setName("edit80");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.PopJ5);
    obj.label124:setLeft(220);
    obj.label124:setTop(350);
    obj.label124:setHeight(30);
    obj.label124:setWidth(150);
    obj.label124:setFontSize(20);
    obj.label124:setFontColor("MediumBlue");
    obj.label124:setText("Vida do Inimigo");
    obj.label124:setName("label124");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.PopJ5);
    obj.rectangle21:setLeft(220);
    obj.rectangle21:setTop(385);
    obj.rectangle21:setWidth(130);
    obj.rectangle21:setHeight(30);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("DarkGray");
    obj.rectangle21:setStrokeSize(2);
    obj.rectangle21:setName("rectangle21");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.PopJ5);
    obj.label125:setLeft(225);
    obj.label125:setTop(385);
    obj.label125:setWidth(130);
    obj.label125:setHeight(30);
    obj.label125:setText("white");
    obj.label125:setFontSize(20);
    obj.label125:setFontColor("red");
    obj.label125:setField("VI5");
    obj.label125:setName("label125");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.PopJ5);
    obj.edit81:setLeft(20);
    obj.edit81:setTop(420);
    obj.edit81:setHeight(30);
    obj.edit81:setVisible(false);
    obj.edit81:setWidth(80);
    obj.edit81:setField("Sobra5");
    obj.edit81:setName("edit81");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.PopJ5);
    obj.edit82:setLeft(220);
    obj.edit82:setTop(420);
    obj.edit82:setHeight(30);
    obj.edit82:setVisible(false);
    obj.edit82:setWidth(80);
    obj.edit82:setField("TR5");
    obj.edit82:setName("edit82");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.PopJ5);
    obj.edit83:setLeft(220);
    obj.edit83:setTop(420);
    obj.edit83:setHeight(30);
    obj.edit83:setVisible(false);
    obj.edit83:setWidth(80);
    obj.edit83:setField("Macete5");
    obj.edit83:setName("edit83");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.image1);
    obj.button24:setLeft(690);
    obj.button24:setTop(40);
    obj.button24:setWidth(100);
    obj.button24:setHeight(100);
    obj.button24:setName("button24");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.image1);
    obj.label126:setLeft(710);
    obj.label126:setTop(80);
    obj.label126:setText("Jogador 6");
    obj.label126:setField("NomeJ6");
    obj.label126:setName("label126");

    obj.PopJ6 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ6:setParent(obj.image1);
    obj.PopJ6:setName("PopJ6");
    obj.PopJ6:setWidth(400);
    obj.PopJ6:setHeight(450);
    obj.PopJ6:setBackOpacity(0.5);

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.PopJ6);
    obj.label127:setLeft(20);
    obj.label127:setTop(20);
    obj.label127:setHeight(30);
    obj.label127:setWidth(80);
    obj.label127:setText("Nome");
    obj.label127:setName("label127");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.PopJ6);
    obj.edit84:setLeft(80);
    obj.edit84:setTop(20);
    obj.edit84:setHeight(30);
    obj.edit84:setWidth(80);
    obj.edit84:setField("NomeJ6");
    obj.edit84:setName("edit84");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.PopJ6);
    obj.label128:setLeft(20);
    obj.label128:setTop(60);
    obj.label128:setHeight(30);
    obj.label128:setWidth(80);
    obj.label128:setText("Dano");
    obj.label128:setName("label128");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.PopJ6);
    obj.edit85:setLeft(80);
    obj.edit85:setTop(60);
    obj.edit85:setHeight(30);
    obj.edit85:setWidth(80);
    obj.edit85:setField("DanoJ6");
    obj.edit85:setName("edit85");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.PopJ6);
    obj.label129:setLeft(170);
    obj.label129:setTop(60);
    obj.label129:setHeight(30);
    obj.label129:setWidth(80);
    obj.label129:setText("Buff Dano");
    obj.label129:setName("label129");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.PopJ6);
    obj.edit86:setLeft(250);
    obj.edit86:setTop(60);
    obj.edit86:setHeight(30);
    obj.edit86:setWidth(80);
    obj.edit86:setField("BuffDNJ6");
    obj.edit86:setName("edit86");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.PopJ6);
    obj.label130:setLeft(170);
    obj.label130:setTop(20);
    obj.label130:setHeight(30);
    obj.label130:setWidth(80);
    obj.label130:setFontColor("red");
    obj.label130:setText("Target/Alvo");
    obj.label130:setName("label130");

    obj.cmbInimigo6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigo6:setParent(obj.PopJ6);
    obj.cmbInimigo6:setName("cmbInimigo6");
    obj.cmbInimigo6:setLeft(250);
    obj.cmbInimigo6:setTop(20);
    obj.cmbInimigo6:setScale(1.4);
    obj.cmbInimigo6:setField("Alvo6");
    obj.cmbInimigo6:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6', 'Player7', 'Player8', 'Player9', 'Player10'});

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.PopJ6);
    obj.label131:setLeft(20);
    obj.label131:setTop(130);
    obj.label131:setHeight(30);
    obj.label131:setWidth(80);
    obj.label131:setText("Defesa");
    obj.label131:setName("label131");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.PopJ6);
    obj.edit87:setLeft(80);
    obj.edit87:setTop(130);
    obj.edit87:setHeight(30);
    obj.edit87:setWidth(80);
    obj.edit87:setEnabled(false);
    obj.edit87:setField("DefesaAlvo6");
    obj.edit87:setName("edit87");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.PopJ6);
    obj.label132:setLeft(170);
    obj.label132:setTop(130);
    obj.label132:setHeight(30);
    obj.label132:setWidth(80);
    obj.label132:setText("Buff Defesa");
    obj.label132:setName("label132");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.PopJ6);
    obj.edit88:setLeft(250);
    obj.edit88:setTop(130);
    obj.edit88:setHeight(30);
    obj.edit88:setWidth(80);
    obj.edit88:setEnabled(false);
    obj.edit88:setField("BuffDefesaAlvo6");
    obj.edit88:setName("edit88");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.PopJ6);
    obj.label133:setLeft(20);
    obj.label133:setTop(170);
    obj.label133:setHeight(30);
    obj.label133:setWidth(80);
    obj.label133:setText("Resist");
    obj.label133:setName("label133");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.PopJ6);
    obj.edit89:setLeft(80);
    obj.edit89:setTop(170);
    obj.edit89:setHeight(30);
    obj.edit89:setWidth(80);
    obj.edit89:setEnabled(false);
    obj.edit89:setField("ResistenciaAlvo6");
    obj.edit89:setName("edit89");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.PopJ6);
    obj.label134:setLeft(170);
    obj.label134:setTop(170);
    obj.label134:setHeight(30);
    obj.label134:setWidth(80);
    obj.label134:setText("Buff Resis");
    obj.label134:setName("label134");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.PopJ6);
    obj.edit90:setLeft(250);
    obj.edit90:setTop(170);
    obj.edit90:setHeight(30);
    obj.edit90:setWidth(80);
    obj.edit90:setEnabled(false);
    obj.edit90:setField("BuffResistenciaAlvo6");
    obj.edit90:setName("edit90");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.PopJ6);
    obj.image8:setLeft(350);
    obj.image8:setTop(60);
    obj.image8:setWidth(30);
    obj.image8:setHeight(30);
    obj.image8:setSRC("/imagens/Shield.png");
    obj.image8:setName("image8");

    obj.btnPopREDPJ6 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPopREDPJ6:setParent(obj.PopJ6);
    obj.btnPopREDPJ6:setName("btnPopREDPJ6");
    obj.btnPopREDPJ6:setLeft(350);
    obj.btnPopREDPJ6:setTop(60);
    obj.btnPopREDPJ6:setFontColor("white");
    obj.btnPopREDPJ6:setOpacity(0.3);
    obj.btnPopREDPJ6:setWidth(30);
    obj.btnPopREDPJ6:setHeight(30);

    obj.popDefREDPJ6 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDefREDPJ6:setParent(obj.PopJ6);
    obj.popDefREDPJ6:setName("popDefREDPJ6");
    obj.popDefREDPJ6:setWidth(230);
    obj.popDefREDPJ6:setHeight(100);
    obj.popDefREDPJ6:setBackOpacity(0.5);

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.popDefREDPJ6);
    obj.label135:setLeft(20);
    obj.label135:setTop(10);
    obj.label135:setFontSize(10);
    obj.label135:setHeight(25);
    obj.label135:setWidth(40);
    obj.label135:setText("Defesa");
    obj.label135:setName("label135");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.popDefREDPJ6);
    obj.edit91:setLeft(60);
    obj.edit91:setTop(10);
    obj.edit91:setFontSize(10);
    obj.edit91:setHeight(25);
    obj.edit91:setWidth(40);
    obj.edit91:setField("DefesaJ6");
    obj.edit91:setName("edit91");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.popDefREDPJ6);
    obj.label136:setLeft(110);
    obj.label136:setTop(10);
    obj.label136:setFontSize(10);
    obj.label136:setHeight(25);
    obj.label136:setWidth(80);
    obj.label136:setText("Buff Defesa");
    obj.label136:setName("label136");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.popDefREDPJ6);
    obj.edit92:setLeft(170);
    obj.edit92:setTop(10);
    obj.edit92:setFontSize(10);
    obj.edit92:setHeight(25);
    obj.edit92:setWidth(40);
    obj.edit92:setField("BuffDefJ6");
    obj.edit92:setName("edit92");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.popDefREDPJ6);
    obj.label137:setLeft(20);
    obj.label137:setTop(40);
    obj.label137:setFontSize(10);
    obj.label137:setHeight(25);
    obj.label137:setWidth(40);
    obj.label137:setText("Resist");
    obj.label137:setName("label137");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.popDefREDPJ6);
    obj.edit93:setLeft(60);
    obj.edit93:setTop(40);
    obj.edit93:setFontSize(10);
    obj.edit93:setHeight(25);
    obj.edit93:setWidth(40);
    obj.edit93:setField("ResistenciaJ6");
    obj.edit93:setName("edit93");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.popDefREDPJ6);
    obj.label138:setLeft(110);
    obj.label138:setTop(40);
    obj.label138:setFontSize(10);
    obj.label138:setHeight(25);
    obj.label138:setWidth(80);
    obj.label138:setText("Buff Resis");
    obj.label138:setName("label138");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.popDefREDPJ6);
    obj.edit94:setLeft(170);
    obj.edit94:setTop(40);
    obj.edit94:setFontSize(10);
    obj.edit94:setHeight(25);
    obj.edit94:setWidth(40);
    obj.edit94:setField("BuffResisJ6");
    obj.edit94:setName("edit94");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.popDefREDPJ6);
    obj.label139:setLeft(40);
    obj.label139:setTop(70);
    obj.label139:setWidth(230);
    obj.label139:setFontSize(16);
    obj.label139:setFontColor("red");
    obj.label139:setText("REDUÇOES PLAYER 6");
    obj.label139:setName("label139");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.PopJ6);
    obj.button25:setLeft(20);
    obj.button25:setTop(100);
    obj.button25:setFontColor("red");
    obj.button25:setText("Dano Fisico");
    obj.button25:setWidth(100);
    obj.button25:setName("button25");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.PopJ6);
    obj.button26:setLeft(130);
    obj.button26:setTop(100);
    obj.button26:setFontColor("Cyan");
    obj.button26:setText("Dano Magico");
    obj.button26:setWidth(100);
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.PopJ6);
    obj.button27:setLeft(240);
    obj.button27:setTop(100);
    obj.button27:setFontColor("white");
    obj.button27:setText("Dano Real");
    obj.button27:setWidth(100);
    obj.button27:setName("button27");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.PopJ6);
    obj.label140:setLeft(20);
    obj.label140:setTop(200);
    obj.label140:setHeight(30);
    obj.label140:setWidth(150);
    obj.label140:setFontSize(20);
    obj.label140:setFontColor("MediumBlue");
    obj.label140:setText("Dano Causado");
    obj.label140:setName("label140");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.PopJ6);
    obj.rectangle22:setLeft(20);
    obj.rectangle22:setTop(240);
    obj.rectangle22:setWidth(130);
    obj.rectangle22:setHeight(30);
    obj.rectangle22:setColor("white");
    obj.rectangle22:setStrokeColor("DarkGray");
    obj.rectangle22:setStrokeSize(2);
    obj.rectangle22:setName("rectangle22");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.PopJ6);
    obj.label141:setLeft(25);
    obj.label141:setTop(240);
    obj.label141:setWidth(130);
    obj.label141:setHeight(30);
    obj.label141:setText("white");
    obj.label141:setFontSize(20);
    obj.label141:setFontColor("red");
    obj.label141:setField("DC6");
    obj.label141:setName("label141");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.PopJ6);
    obj.label142:setLeft(220);
    obj.label142:setTop(200);
    obj.label142:setHeight(30);
    obj.label142:setWidth(150);
    obj.label142:setFontSize(20);
    obj.label142:setFontColor("MediumBlue");
    obj.label142:setText("Dano Total");
    obj.label142:setName("label142");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.PopJ6);
    obj.rectangle23:setLeft(220);
    obj.rectangle23:setTop(240);
    obj.rectangle23:setWidth(130);
    obj.rectangle23:setHeight(30);
    obj.rectangle23:setColor("DarkGray");
    obj.rectangle23:setStrokeColor("Red");
    obj.rectangle23:setStrokeSize(2);
    obj.rectangle23:setName("rectangle23");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.PopJ6);
    obj.label143:setLeft(225);
    obj.label143:setTop(240);
    obj.label143:setWidth(130);
    obj.label143:setHeight(30);
    obj.label143:setText("white");
    obj.label143:setFontSize(20);
    obj.label143:setFontColor("red");
    obj.label143:setField("DT6");
    obj.label143:setName("label143");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.PopJ6);
    obj.label144:setLeft(220);
    obj.label144:setTop(280);
    obj.label144:setHeight(30);
    obj.label144:setWidth(150);
    obj.label144:setFontSize(20);
    obj.label144:setFontColor("MediumBlue");
    obj.label144:setText("Numero da Vez");
    obj.label144:setName("label144");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.PopJ6);
    obj.edit95:setLeft(220);
    obj.edit95:setTop(315);
    obj.edit95:setWidth(130);
    obj.edit95:setHeight(30);
    obj.edit95:setText("white");
    obj.edit95:setFontSize(20);
    obj.edit95:setField("TJ6");
    obj.edit95:setName("edit95");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.PopJ6);
    obj.label145:setLeft(20);
    obj.label145:setTop(280);
    obj.label145:setHeight(30);
    obj.label145:setWidth(150);
    obj.label145:setFontSize(20);
    obj.label145:setFontColor("MediumBlue");
    obj.label145:setText("Critical");
    obj.label145:setName("label145");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.PopJ6);
    obj.rectangle24:setLeft(20);
    obj.rectangle24:setTop(315);
    obj.rectangle24:setWidth(130);
    obj.rectangle24:setHeight(30);
    obj.rectangle24:setColor("DarkGray");
    obj.rectangle24:setStrokeColor("red");
    obj.rectangle24:setStrokeSize(2);
    obj.rectangle24:setName("rectangle24");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.PopJ6);
    obj.label146:setLeft(25);
    obj.label146:setTop(315);
    obj.label146:setWidth(130);
    obj.label146:setHeight(30);
    obj.label146:setText("white");
    obj.label146:setFontSize(20);
    obj.label146:setFontColor("red");
    obj.label146:setField("CI6");
    obj.label146:setName("label146");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.PopJ6);
    obj.label147:setLeft(20);
    obj.label147:setTop(350);
    obj.label147:setHeight(30);
    obj.label147:setWidth(150);
    obj.label147:setFontSize(20);
    obj.label147:setFontColor("MediumBlue");
    obj.label147:setText("Vida do Player");
    obj.label147:setName("label147");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.PopJ6);
    obj.edit96:setLeft(20);
    obj.edit96:setTop(385);
    obj.edit96:setWidth(130);
    obj.edit96:setHeight(30);
    obj.edit96:setField("VIDAJ6");
    obj.edit96:setName("edit96");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.PopJ6);
    obj.label148:setLeft(220);
    obj.label148:setTop(350);
    obj.label148:setHeight(30);
    obj.label148:setWidth(150);
    obj.label148:setFontSize(20);
    obj.label148:setFontColor("MediumBlue");
    obj.label148:setText("Vida do Inimigo");
    obj.label148:setName("label148");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.PopJ6);
    obj.rectangle25:setLeft(220);
    obj.rectangle25:setTop(385);
    obj.rectangle25:setWidth(130);
    obj.rectangle25:setHeight(30);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("DarkGray");
    obj.rectangle25:setStrokeSize(2);
    obj.rectangle25:setName("rectangle25");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.PopJ6);
    obj.label149:setLeft(225);
    obj.label149:setTop(385);
    obj.label149:setWidth(130);
    obj.label149:setHeight(30);
    obj.label149:setText("white");
    obj.label149:setFontSize(20);
    obj.label149:setFontColor("red");
    obj.label149:setField("VI6");
    obj.label149:setName("label149");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.PopJ6);
    obj.edit97:setLeft(20);
    obj.edit97:setTop(420);
    obj.edit97:setHeight(30);
    obj.edit97:setVisible(false);
    obj.edit97:setWidth(80);
    obj.edit97:setField("Sobra6");
    obj.edit97:setName("edit97");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.PopJ6);
    obj.edit98:setLeft(220);
    obj.edit98:setTop(420);
    obj.edit98:setHeight(30);
    obj.edit98:setVisible(false);
    obj.edit98:setWidth(80);
    obj.edit98:setField("TR6");
    obj.edit98:setName("edit98");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.PopJ6);
    obj.edit99:setLeft(220);
    obj.edit99:setTop(420);
    obj.edit99:setHeight(30);
    obj.edit99:setVisible(false);
    obj.edit99:setWidth(80);
    obj.edit99:setField("Macete6");
    obj.edit99:setName("edit99");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.image1);
    obj.button28:setLeft(40);
    obj.button28:setTop(150);
    obj.button28:setWidth(100);
    obj.button28:setHeight(100);
    obj.button28:setName("button28");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.image1);
    obj.label150:setLeft(60);
    obj.label150:setTop(190);
    obj.label150:setText("Jogador 7");
    obj.label150:setField("NomeJ7");
    obj.label150:setName("label150");

    obj.PopJ7 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ7:setParent(obj.image1);
    obj.PopJ7:setName("PopJ7");
    obj.PopJ7:setWidth(400);
    obj.PopJ7:setHeight(450);
    obj.PopJ7:setBackOpacity(0.5);

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.PopJ7);
    obj.label151:setLeft(20);
    obj.label151:setTop(20);
    obj.label151:setHeight(30);
    obj.label151:setWidth(80);
    obj.label151:setText("Nome");
    obj.label151:setName("label151");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.PopJ7);
    obj.edit100:setLeft(80);
    obj.edit100:setTop(20);
    obj.edit100:setHeight(30);
    obj.edit100:setWidth(80);
    obj.edit100:setField("NomeJ7");
    obj.edit100:setName("edit100");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.PopJ7);
    obj.label152:setLeft(20);
    obj.label152:setTop(60);
    obj.label152:setHeight(30);
    obj.label152:setWidth(80);
    obj.label152:setText("Dano");
    obj.label152:setName("label152");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.PopJ7);
    obj.edit101:setLeft(80);
    obj.edit101:setTop(60);
    obj.edit101:setHeight(30);
    obj.edit101:setWidth(80);
    obj.edit101:setField("DanoJ7");
    obj.edit101:setName("edit101");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.PopJ7);
    obj.label153:setLeft(170);
    obj.label153:setTop(60);
    obj.label153:setHeight(30);
    obj.label153:setWidth(80);
    obj.label153:setText("Buff Dano");
    obj.label153:setName("label153");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.PopJ7);
    obj.edit102:setLeft(250);
    obj.edit102:setTop(60);
    obj.edit102:setHeight(30);
    obj.edit102:setWidth(80);
    obj.edit102:setField("BuffDNJ7");
    obj.edit102:setName("edit102");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.PopJ7);
    obj.label154:setLeft(170);
    obj.label154:setTop(20);
    obj.label154:setHeight(30);
    obj.label154:setWidth(80);
    obj.label154:setFontColor("red");
    obj.label154:setText("Target/Alvo");
    obj.label154:setName("label154");

    obj.cmbInimigo7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigo7:setParent(obj.PopJ7);
    obj.cmbInimigo7:setName("cmbInimigo7");
    obj.cmbInimigo7:setLeft(250);
    obj.cmbInimigo7:setTop(20);
    obj.cmbInimigo7:setScale(1.4);
    obj.cmbInimigo7:setField("Alvo7");
    obj.cmbInimigo7:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6', 'Player7', 'Player8', 'Player9', 'Player10'});

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.PopJ7);
    obj.label155:setLeft(20);
    obj.label155:setTop(130);
    obj.label155:setHeight(30);
    obj.label155:setWidth(80);
    obj.label155:setText("Defesa");
    obj.label155:setName("label155");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.PopJ7);
    obj.edit103:setLeft(80);
    obj.edit103:setTop(130);
    obj.edit103:setHeight(30);
    obj.edit103:setWidth(80);
    obj.edit103:setEnabled(false);
    obj.edit103:setField("DefesaAlvo7");
    obj.edit103:setName("edit103");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.PopJ7);
    obj.label156:setLeft(170);
    obj.label156:setTop(130);
    obj.label156:setHeight(30);
    obj.label156:setWidth(80);
    obj.label156:setText("Buff Defesa");
    obj.label156:setName("label156");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.PopJ7);
    obj.edit104:setLeft(250);
    obj.edit104:setTop(130);
    obj.edit104:setHeight(30);
    obj.edit104:setWidth(80);
    obj.edit104:setEnabled(false);
    obj.edit104:setField("BuffDefesaAlvo7");
    obj.edit104:setName("edit104");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.PopJ7);
    obj.label157:setLeft(20);
    obj.label157:setTop(170);
    obj.label157:setHeight(30);
    obj.label157:setWidth(80);
    obj.label157:setText("Resist");
    obj.label157:setName("label157");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.PopJ7);
    obj.edit105:setLeft(80);
    obj.edit105:setTop(170);
    obj.edit105:setHeight(30);
    obj.edit105:setWidth(80);
    obj.edit105:setEnabled(false);
    obj.edit105:setField("ResistenciaAlvo7");
    obj.edit105:setName("edit105");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.PopJ7);
    obj.label158:setLeft(170);
    obj.label158:setTop(170);
    obj.label158:setHeight(30);
    obj.label158:setWidth(80);
    obj.label158:setText("Buff Resis");
    obj.label158:setName("label158");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.PopJ7);
    obj.edit106:setLeft(250);
    obj.edit106:setTop(170);
    obj.edit106:setHeight(30);
    obj.edit106:setWidth(80);
    obj.edit106:setEnabled(false);
    obj.edit106:setField("BuffResistenciaAlvo7");
    obj.edit106:setName("edit106");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.PopJ7);
    obj.image9:setLeft(350);
    obj.image9:setTop(60);
    obj.image9:setWidth(30);
    obj.image9:setHeight(30);
    obj.image9:setSRC("/imagens/Shield.png");
    obj.image9:setName("image9");

    obj.btnPopREDPJ7 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPopREDPJ7:setParent(obj.PopJ7);
    obj.btnPopREDPJ7:setName("btnPopREDPJ7");
    obj.btnPopREDPJ7:setLeft(350);
    obj.btnPopREDPJ7:setTop(60);
    obj.btnPopREDPJ7:setFontColor("white");
    obj.btnPopREDPJ7:setOpacity(0.3);
    obj.btnPopREDPJ7:setWidth(30);
    obj.btnPopREDPJ7:setHeight(30);

    obj.popDefREDPJ7 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDefREDPJ7:setParent(obj.PopJ7);
    obj.popDefREDPJ7:setName("popDefREDPJ7");
    obj.popDefREDPJ7:setWidth(230);
    obj.popDefREDPJ7:setHeight(100);
    obj.popDefREDPJ7:setBackOpacity(0.5);

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.popDefREDPJ7);
    obj.label159:setLeft(20);
    obj.label159:setTop(10);
    obj.label159:setFontSize(10);
    obj.label159:setHeight(25);
    obj.label159:setWidth(40);
    obj.label159:setText("Defesa");
    obj.label159:setName("label159");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.popDefREDPJ7);
    obj.edit107:setLeft(60);
    obj.edit107:setTop(10);
    obj.edit107:setFontSize(10);
    obj.edit107:setHeight(25);
    obj.edit107:setWidth(40);
    obj.edit107:setField("DefesaJ7");
    obj.edit107:setName("edit107");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.popDefREDPJ7);
    obj.label160:setLeft(110);
    obj.label160:setTop(10);
    obj.label160:setFontSize(10);
    obj.label160:setHeight(25);
    obj.label160:setWidth(80);
    obj.label160:setText("Buff Defesa");
    obj.label160:setName("label160");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.popDefREDPJ7);
    obj.edit108:setLeft(170);
    obj.edit108:setTop(10);
    obj.edit108:setFontSize(10);
    obj.edit108:setHeight(25);
    obj.edit108:setWidth(40);
    obj.edit108:setField("BuffDefJ7");
    obj.edit108:setName("edit108");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.popDefREDPJ7);
    obj.label161:setLeft(20);
    obj.label161:setTop(40);
    obj.label161:setFontSize(10);
    obj.label161:setHeight(25);
    obj.label161:setWidth(40);
    obj.label161:setText("Resist");
    obj.label161:setName("label161");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.popDefREDPJ7);
    obj.edit109:setLeft(60);
    obj.edit109:setTop(40);
    obj.edit109:setFontSize(10);
    obj.edit109:setHeight(25);
    obj.edit109:setWidth(40);
    obj.edit109:setField("ResistenciaJ7");
    obj.edit109:setName("edit109");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.popDefREDPJ7);
    obj.label162:setLeft(110);
    obj.label162:setTop(40);
    obj.label162:setFontSize(10);
    obj.label162:setHeight(25);
    obj.label162:setWidth(80);
    obj.label162:setText("Buff Resis");
    obj.label162:setName("label162");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.popDefREDPJ7);
    obj.edit110:setLeft(170);
    obj.edit110:setTop(40);
    obj.edit110:setFontSize(10);
    obj.edit110:setHeight(25);
    obj.edit110:setWidth(40);
    obj.edit110:setField("BuffResisJ7");
    obj.edit110:setName("edit110");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.popDefREDPJ7);
    obj.label163:setLeft(40);
    obj.label163:setTop(70);
    obj.label163:setWidth(230);
    obj.label163:setFontSize(16);
    obj.label163:setFontColor("red");
    obj.label163:setText("REDUÇOES PLAYER 7");
    obj.label163:setName("label163");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.PopJ7);
    obj.button29:setLeft(20);
    obj.button29:setTop(100);
    obj.button29:setFontColor("red");
    obj.button29:setText("Dano Fisico");
    obj.button29:setWidth(100);
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.PopJ7);
    obj.button30:setLeft(130);
    obj.button30:setTop(100);
    obj.button30:setFontColor("Cyan");
    obj.button30:setText("Dano Magico");
    obj.button30:setWidth(100);
    obj.button30:setName("button30");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.PopJ7);
    obj.button31:setLeft(240);
    obj.button31:setTop(100);
    obj.button31:setFontColor("white");
    obj.button31:setText("Dano Real");
    obj.button31:setWidth(100);
    obj.button31:setName("button31");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.PopJ7);
    obj.label164:setLeft(20);
    obj.label164:setTop(200);
    obj.label164:setHeight(30);
    obj.label164:setWidth(150);
    obj.label164:setFontSize(20);
    obj.label164:setFontColor("MediumBlue");
    obj.label164:setText("Dano Causado");
    obj.label164:setName("label164");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.PopJ7);
    obj.rectangle26:setLeft(20);
    obj.rectangle26:setTop(240);
    obj.rectangle26:setWidth(130);
    obj.rectangle26:setHeight(30);
    obj.rectangle26:setColor("white");
    obj.rectangle26:setStrokeColor("DarkGray");
    obj.rectangle26:setStrokeSize(2);
    obj.rectangle26:setName("rectangle26");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.PopJ7);
    obj.label165:setLeft(25);
    obj.label165:setTop(240);
    obj.label165:setWidth(130);
    obj.label165:setHeight(30);
    obj.label165:setText("white");
    obj.label165:setFontSize(20);
    obj.label165:setFontColor("red");
    obj.label165:setField("DC7");
    obj.label165:setName("label165");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.PopJ7);
    obj.label166:setLeft(220);
    obj.label166:setTop(200);
    obj.label166:setHeight(30);
    obj.label166:setWidth(150);
    obj.label166:setFontSize(20);
    obj.label166:setFontColor("MediumBlue");
    obj.label166:setText("Dano Total");
    obj.label166:setName("label166");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.PopJ7);
    obj.rectangle27:setLeft(220);
    obj.rectangle27:setTop(240);
    obj.rectangle27:setWidth(130);
    obj.rectangle27:setHeight(30);
    obj.rectangle27:setColor("DarkGray");
    obj.rectangle27:setStrokeColor("Red");
    obj.rectangle27:setStrokeSize(2);
    obj.rectangle27:setName("rectangle27");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.PopJ7);
    obj.label167:setLeft(225);
    obj.label167:setTop(240);
    obj.label167:setWidth(130);
    obj.label167:setHeight(30);
    obj.label167:setText("white");
    obj.label167:setFontSize(20);
    obj.label167:setFontColor("red");
    obj.label167:setField("DT7");
    obj.label167:setName("label167");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.PopJ7);
    obj.label168:setLeft(220);
    obj.label168:setTop(280);
    obj.label168:setHeight(30);
    obj.label168:setWidth(150);
    obj.label168:setFontSize(20);
    obj.label168:setFontColor("MediumBlue");
    obj.label168:setText("Numero da Vez");
    obj.label168:setName("label168");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.PopJ7);
    obj.edit111:setLeft(220);
    obj.edit111:setTop(315);
    obj.edit111:setWidth(130);
    obj.edit111:setHeight(30);
    obj.edit111:setText("white");
    obj.edit111:setFontSize(20);
    obj.edit111:setField("TJ7");
    obj.edit111:setName("edit111");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.PopJ7);
    obj.label169:setLeft(20);
    obj.label169:setTop(280);
    obj.label169:setHeight(30);
    obj.label169:setWidth(150);
    obj.label169:setFontSize(20);
    obj.label169:setFontColor("MediumBlue");
    obj.label169:setText("Critical");
    obj.label169:setName("label169");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.PopJ7);
    obj.rectangle28:setLeft(20);
    obj.rectangle28:setTop(315);
    obj.rectangle28:setWidth(130);
    obj.rectangle28:setHeight(30);
    obj.rectangle28:setColor("DarkGray");
    obj.rectangle28:setStrokeColor("red");
    obj.rectangle28:setStrokeSize(2);
    obj.rectangle28:setName("rectangle28");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.PopJ7);
    obj.label170:setLeft(25);
    obj.label170:setTop(315);
    obj.label170:setWidth(130);
    obj.label170:setHeight(30);
    obj.label170:setText("white");
    obj.label170:setFontSize(20);
    obj.label170:setFontColor("red");
    obj.label170:setField("CI7");
    obj.label170:setName("label170");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.PopJ7);
    obj.label171:setLeft(20);
    obj.label171:setTop(350);
    obj.label171:setHeight(30);
    obj.label171:setWidth(150);
    obj.label171:setFontSize(20);
    obj.label171:setFontColor("MediumBlue");
    obj.label171:setText("Vida do Player");
    obj.label171:setName("label171");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.PopJ7);
    obj.edit112:setLeft(20);
    obj.edit112:setTop(385);
    obj.edit112:setWidth(130);
    obj.edit112:setHeight(30);
    obj.edit112:setField("VIDAJ7");
    obj.edit112:setName("edit112");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.PopJ7);
    obj.label172:setLeft(220);
    obj.label172:setTop(350);
    obj.label172:setHeight(30);
    obj.label172:setWidth(150);
    obj.label172:setFontSize(20);
    obj.label172:setFontColor("MediumBlue");
    obj.label172:setText("Vida do Inimigo");
    obj.label172:setName("label172");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.PopJ7);
    obj.rectangle29:setLeft(220);
    obj.rectangle29:setTop(385);
    obj.rectangle29:setWidth(130);
    obj.rectangle29:setHeight(30);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("DarkGray");
    obj.rectangle29:setStrokeSize(2);
    obj.rectangle29:setName("rectangle29");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.PopJ7);
    obj.label173:setLeft(225);
    obj.label173:setTop(385);
    obj.label173:setWidth(130);
    obj.label173:setHeight(30);
    obj.label173:setText("white");
    obj.label173:setFontSize(20);
    obj.label173:setFontColor("red");
    obj.label173:setField("VI7");
    obj.label173:setName("label173");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.PopJ7);
    obj.edit113:setLeft(20);
    obj.edit113:setTop(420);
    obj.edit113:setHeight(30);
    obj.edit113:setVisible(false);
    obj.edit113:setWidth(80);
    obj.edit113:setField("Sobra7");
    obj.edit113:setName("edit113");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.PopJ7);
    obj.edit114:setLeft(220);
    obj.edit114:setTop(420);
    obj.edit114:setHeight(30);
    obj.edit114:setVisible(false);
    obj.edit114:setWidth(80);
    obj.edit114:setField("TR7");
    obj.edit114:setName("edit114");

    obj.edit115 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.PopJ7);
    obj.edit115:setLeft(220);
    obj.edit115:setTop(420);
    obj.edit115:setHeight(30);
    obj.edit115:setVisible(false);
    obj.edit115:setWidth(80);
    obj.edit115:setField("Macete7");
    obj.edit115:setName("edit115");

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.image1);
    obj.button32:setLeft(170);
    obj.button32:setTop(150);
    obj.button32:setWidth(100);
    obj.button32:setHeight(100);
    obj.button32:setName("button32");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.image1);
    obj.label174:setLeft(190);
    obj.label174:setTop(190);
    obj.label174:setText("Jogador 8");
    obj.label174:setField("NomeJ8");
    obj.label174:setName("label174");

    obj.PopJ8 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ8:setParent(obj.image1);
    obj.PopJ8:setName("PopJ8");
    obj.PopJ8:setWidth(400);
    obj.PopJ8:setHeight(450);
    obj.PopJ8:setBackOpacity(0.5);

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.PopJ8);
    obj.label175:setLeft(20);
    obj.label175:setTop(20);
    obj.label175:setHeight(30);
    obj.label175:setWidth(80);
    obj.label175:setText("Nome");
    obj.label175:setName("label175");

    obj.edit116 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.PopJ8);
    obj.edit116:setLeft(80);
    obj.edit116:setTop(20);
    obj.edit116:setHeight(30);
    obj.edit116:setWidth(80);
    obj.edit116:setField("NomeJ8");
    obj.edit116:setName("edit116");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.PopJ8);
    obj.label176:setLeft(20);
    obj.label176:setTop(60);
    obj.label176:setHeight(30);
    obj.label176:setWidth(80);
    obj.label176:setText("Dano");
    obj.label176:setName("label176");

    obj.edit117 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.PopJ8);
    obj.edit117:setLeft(80);
    obj.edit117:setTop(60);
    obj.edit117:setHeight(30);
    obj.edit117:setWidth(80);
    obj.edit117:setField("DanoJ8");
    obj.edit117:setName("edit117");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.PopJ8);
    obj.label177:setLeft(170);
    obj.label177:setTop(60);
    obj.label177:setHeight(30);
    obj.label177:setWidth(80);
    obj.label177:setText("Buff Dano");
    obj.label177:setName("label177");

    obj.edit118 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.PopJ8);
    obj.edit118:setLeft(250);
    obj.edit118:setTop(60);
    obj.edit118:setHeight(30);
    obj.edit118:setWidth(80);
    obj.edit118:setField("BuffDNJ8");
    obj.edit118:setName("edit118");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.PopJ8);
    obj.label178:setLeft(170);
    obj.label178:setTop(20);
    obj.label178:setHeight(30);
    obj.label178:setWidth(80);
    obj.label178:setFontColor("red");
    obj.label178:setText("Target/Alvo");
    obj.label178:setName("label178");

    obj.cmbInimigo8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigo8:setParent(obj.PopJ8);
    obj.cmbInimigo8:setName("cmbInimigo8");
    obj.cmbInimigo8:setLeft(250);
    obj.cmbInimigo8:setTop(20);
    obj.cmbInimigo8:setScale(1.4);
    obj.cmbInimigo8:setField("Alvo8");
    obj.cmbInimigo8:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6', 'Player7', 'Player8', 'Player9', 'Player10'});

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.PopJ8);
    obj.label179:setLeft(20);
    obj.label179:setTop(130);
    obj.label179:setHeight(30);
    obj.label179:setWidth(80);
    obj.label179:setText("Defesa");
    obj.label179:setName("label179");

    obj.edit119 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.PopJ8);
    obj.edit119:setLeft(80);
    obj.edit119:setTop(130);
    obj.edit119:setHeight(30);
    obj.edit119:setWidth(80);
    obj.edit119:setEnabled(false);
    obj.edit119:setField("DefesaAlvo8");
    obj.edit119:setName("edit119");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.PopJ8);
    obj.label180:setLeft(170);
    obj.label180:setTop(130);
    obj.label180:setHeight(30);
    obj.label180:setWidth(80);
    obj.label180:setText("Buff Defesa");
    obj.label180:setName("label180");

    obj.edit120 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.PopJ8);
    obj.edit120:setLeft(250);
    obj.edit120:setTop(130);
    obj.edit120:setHeight(30);
    obj.edit120:setWidth(80);
    obj.edit120:setEnabled(false);
    obj.edit120:setField("BuffDefesaAlvo8");
    obj.edit120:setName("edit120");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.PopJ8);
    obj.label181:setLeft(20);
    obj.label181:setTop(170);
    obj.label181:setHeight(30);
    obj.label181:setWidth(80);
    obj.label181:setText("Resist");
    obj.label181:setName("label181");

    obj.edit121 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.PopJ8);
    obj.edit121:setLeft(80);
    obj.edit121:setTop(170);
    obj.edit121:setHeight(30);
    obj.edit121:setWidth(80);
    obj.edit121:setEnabled(false);
    obj.edit121:setField("ResistenciaAlvo8");
    obj.edit121:setName("edit121");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.PopJ8);
    obj.label182:setLeft(170);
    obj.label182:setTop(170);
    obj.label182:setHeight(30);
    obj.label182:setWidth(80);
    obj.label182:setText("Buff Resis");
    obj.label182:setName("label182");

    obj.edit122 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.PopJ8);
    obj.edit122:setLeft(250);
    obj.edit122:setTop(170);
    obj.edit122:setHeight(30);
    obj.edit122:setWidth(80);
    obj.edit122:setEnabled(false);
    obj.edit122:setField("BuffResistenciaAlvo8");
    obj.edit122:setName("edit122");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.PopJ8);
    obj.image10:setLeft(350);
    obj.image10:setTop(60);
    obj.image10:setWidth(30);
    obj.image10:setHeight(30);
    obj.image10:setSRC("/imagens/Shield.png");
    obj.image10:setName("image10");

    obj.btnPopREDPJ8 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPopREDPJ8:setParent(obj.PopJ8);
    obj.btnPopREDPJ8:setName("btnPopREDPJ8");
    obj.btnPopREDPJ8:setLeft(350);
    obj.btnPopREDPJ8:setTop(60);
    obj.btnPopREDPJ8:setFontColor("white");
    obj.btnPopREDPJ8:setOpacity(0.3);
    obj.btnPopREDPJ8:setWidth(30);
    obj.btnPopREDPJ8:setHeight(30);

    obj.popDefREDPJ8 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDefREDPJ8:setParent(obj.PopJ8);
    obj.popDefREDPJ8:setName("popDefREDPJ8");
    obj.popDefREDPJ8:setWidth(230);
    obj.popDefREDPJ8:setHeight(100);
    obj.popDefREDPJ8:setBackOpacity(0.5);

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.popDefREDPJ8);
    obj.label183:setLeft(20);
    obj.label183:setTop(10);
    obj.label183:setFontSize(10);
    obj.label183:setHeight(25);
    obj.label183:setWidth(40);
    obj.label183:setText("Defesa");
    obj.label183:setName("label183");

    obj.edit123 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.popDefREDPJ8);
    obj.edit123:setLeft(60);
    obj.edit123:setTop(10);
    obj.edit123:setFontSize(10);
    obj.edit123:setHeight(25);
    obj.edit123:setWidth(40);
    obj.edit123:setField("DefesaJ8");
    obj.edit123:setName("edit123");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.popDefREDPJ8);
    obj.label184:setLeft(110);
    obj.label184:setTop(10);
    obj.label184:setFontSize(10);
    obj.label184:setHeight(25);
    obj.label184:setWidth(80);
    obj.label184:setText("Buff Defesa");
    obj.label184:setName("label184");

    obj.edit124 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.popDefREDPJ8);
    obj.edit124:setLeft(170);
    obj.edit124:setTop(10);
    obj.edit124:setFontSize(10);
    obj.edit124:setHeight(25);
    obj.edit124:setWidth(40);
    obj.edit124:setField("BuffDefJ8");
    obj.edit124:setName("edit124");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.popDefREDPJ8);
    obj.label185:setLeft(20);
    obj.label185:setTop(40);
    obj.label185:setFontSize(10);
    obj.label185:setHeight(25);
    obj.label185:setWidth(40);
    obj.label185:setText("Resist");
    obj.label185:setName("label185");

    obj.edit125 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.popDefREDPJ8);
    obj.edit125:setLeft(60);
    obj.edit125:setTop(40);
    obj.edit125:setFontSize(10);
    obj.edit125:setHeight(25);
    obj.edit125:setWidth(40);
    obj.edit125:setField("ResistenciaJ8");
    obj.edit125:setName("edit125");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.popDefREDPJ8);
    obj.label186:setLeft(110);
    obj.label186:setTop(40);
    obj.label186:setFontSize(10);
    obj.label186:setHeight(25);
    obj.label186:setWidth(80);
    obj.label186:setText("Buff Resis");
    obj.label186:setName("label186");

    obj.edit126 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.popDefREDPJ8);
    obj.edit126:setLeft(170);
    obj.edit126:setTop(40);
    obj.edit126:setFontSize(10);
    obj.edit126:setHeight(25);
    obj.edit126:setWidth(40);
    obj.edit126:setField("BuffResisJ8");
    obj.edit126:setName("edit126");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.popDefREDPJ8);
    obj.label187:setLeft(40);
    obj.label187:setTop(70);
    obj.label187:setWidth(230);
    obj.label187:setFontSize(16);
    obj.label187:setFontColor("red");
    obj.label187:setText("REDUÇOES PLAYER 8");
    obj.label187:setName("label187");

    obj.button33 = GUI.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.PopJ8);
    obj.button33:setLeft(20);
    obj.button33:setTop(100);
    obj.button33:setFontColor("red");
    obj.button33:setText("Dano Fisico");
    obj.button33:setWidth(100);
    obj.button33:setName("button33");

    obj.button34 = GUI.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.PopJ8);
    obj.button34:setLeft(130);
    obj.button34:setTop(100);
    obj.button34:setFontColor("Cyan");
    obj.button34:setText("Dano Magico");
    obj.button34:setWidth(100);
    obj.button34:setName("button34");

    obj.button35 = GUI.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.PopJ8);
    obj.button35:setLeft(240);
    obj.button35:setTop(100);
    obj.button35:setFontColor("white");
    obj.button35:setText("Dano Real");
    obj.button35:setWidth(100);
    obj.button35:setName("button35");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.PopJ8);
    obj.label188:setLeft(20);
    obj.label188:setTop(200);
    obj.label188:setHeight(30);
    obj.label188:setWidth(150);
    obj.label188:setFontSize(20);
    obj.label188:setFontColor("MediumBlue");
    obj.label188:setText("Dano Causado");
    obj.label188:setName("label188");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.PopJ8);
    obj.rectangle30:setLeft(20);
    obj.rectangle30:setTop(240);
    obj.rectangle30:setWidth(130);
    obj.rectangle30:setHeight(30);
    obj.rectangle30:setColor("white");
    obj.rectangle30:setStrokeColor("DarkGray");
    obj.rectangle30:setStrokeSize(2);
    obj.rectangle30:setName("rectangle30");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.PopJ8);
    obj.label189:setLeft(25);
    obj.label189:setTop(240);
    obj.label189:setWidth(130);
    obj.label189:setHeight(30);
    obj.label189:setText("white");
    obj.label189:setFontSize(20);
    obj.label189:setFontColor("red");
    obj.label189:setField("DC8");
    obj.label189:setName("label189");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.PopJ8);
    obj.label190:setLeft(220);
    obj.label190:setTop(200);
    obj.label190:setHeight(30);
    obj.label190:setWidth(150);
    obj.label190:setFontSize(20);
    obj.label190:setFontColor("MediumBlue");
    obj.label190:setText("Dano Total");
    obj.label190:setName("label190");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.PopJ8);
    obj.rectangle31:setLeft(220);
    obj.rectangle31:setTop(240);
    obj.rectangle31:setWidth(130);
    obj.rectangle31:setHeight(30);
    obj.rectangle31:setColor("DarkGray");
    obj.rectangle31:setStrokeColor("Red");
    obj.rectangle31:setStrokeSize(2);
    obj.rectangle31:setName("rectangle31");

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.PopJ8);
    obj.label191:setLeft(225);
    obj.label191:setTop(240);
    obj.label191:setWidth(130);
    obj.label191:setHeight(30);
    obj.label191:setText("white");
    obj.label191:setFontSize(20);
    obj.label191:setFontColor("red");
    obj.label191:setField("DT8");
    obj.label191:setName("label191");

    obj.label192 = GUI.fromHandle(_obj_newObject("label"));
    obj.label192:setParent(obj.PopJ8);
    obj.label192:setLeft(220);
    obj.label192:setTop(280);
    obj.label192:setHeight(30);
    obj.label192:setWidth(150);
    obj.label192:setFontSize(20);
    obj.label192:setFontColor("MediumBlue");
    obj.label192:setText("Numero da Vez");
    obj.label192:setName("label192");

    obj.edit127 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.PopJ8);
    obj.edit127:setLeft(220);
    obj.edit127:setTop(315);
    obj.edit127:setWidth(130);
    obj.edit127:setHeight(30);
    obj.edit127:setText("white");
    obj.edit127:setFontSize(20);
    obj.edit127:setField("TJ8");
    obj.edit127:setName("edit127");

    obj.label193 = GUI.fromHandle(_obj_newObject("label"));
    obj.label193:setParent(obj.PopJ8);
    obj.label193:setLeft(20);
    obj.label193:setTop(280);
    obj.label193:setHeight(30);
    obj.label193:setWidth(150);
    obj.label193:setFontSize(20);
    obj.label193:setFontColor("MediumBlue");
    obj.label193:setText("Critical");
    obj.label193:setName("label193");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.PopJ8);
    obj.rectangle32:setLeft(20);
    obj.rectangle32:setTop(315);
    obj.rectangle32:setWidth(130);
    obj.rectangle32:setHeight(30);
    obj.rectangle32:setColor("DarkGray");
    obj.rectangle32:setStrokeColor("red");
    obj.rectangle32:setStrokeSize(2);
    obj.rectangle32:setName("rectangle32");

    obj.label194 = GUI.fromHandle(_obj_newObject("label"));
    obj.label194:setParent(obj.PopJ8);
    obj.label194:setLeft(25);
    obj.label194:setTop(315);
    obj.label194:setWidth(130);
    obj.label194:setHeight(30);
    obj.label194:setText("white");
    obj.label194:setFontSize(20);
    obj.label194:setFontColor("red");
    obj.label194:setField("CI8");
    obj.label194:setName("label194");

    obj.label195 = GUI.fromHandle(_obj_newObject("label"));
    obj.label195:setParent(obj.PopJ8);
    obj.label195:setLeft(20);
    obj.label195:setTop(350);
    obj.label195:setHeight(30);
    obj.label195:setWidth(150);
    obj.label195:setFontSize(20);
    obj.label195:setFontColor("MediumBlue");
    obj.label195:setText("Vida do Player");
    obj.label195:setName("label195");

    obj.edit128 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.PopJ8);
    obj.edit128:setLeft(20);
    obj.edit128:setTop(385);
    obj.edit128:setWidth(130);
    obj.edit128:setHeight(30);
    obj.edit128:setField("VIDAJ8");
    obj.edit128:setName("edit128");

    obj.label196 = GUI.fromHandle(_obj_newObject("label"));
    obj.label196:setParent(obj.PopJ8);
    obj.label196:setLeft(220);
    obj.label196:setTop(350);
    obj.label196:setHeight(30);
    obj.label196:setWidth(150);
    obj.label196:setFontSize(20);
    obj.label196:setFontColor("MediumBlue");
    obj.label196:setText("Vida do Inimigo");
    obj.label196:setName("label196");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.PopJ8);
    obj.rectangle33:setLeft(220);
    obj.rectangle33:setTop(385);
    obj.rectangle33:setWidth(130);
    obj.rectangle33:setHeight(30);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("DarkGray");
    obj.rectangle33:setStrokeSize(2);
    obj.rectangle33:setName("rectangle33");

    obj.label197 = GUI.fromHandle(_obj_newObject("label"));
    obj.label197:setParent(obj.PopJ8);
    obj.label197:setLeft(225);
    obj.label197:setTop(385);
    obj.label197:setWidth(130);
    obj.label197:setHeight(30);
    obj.label197:setText("white");
    obj.label197:setFontSize(20);
    obj.label197:setFontColor("red");
    obj.label197:setField("VI8");
    obj.label197:setName("label197");

    obj.edit129 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.PopJ8);
    obj.edit129:setLeft(20);
    obj.edit129:setTop(420);
    obj.edit129:setHeight(30);
    obj.edit129:setVisible(false);
    obj.edit129:setWidth(80);
    obj.edit129:setField("Sobra8");
    obj.edit129:setName("edit129");

    obj.edit130 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.PopJ8);
    obj.edit130:setLeft(220);
    obj.edit130:setTop(420);
    obj.edit130:setHeight(30);
    obj.edit130:setVisible(false);
    obj.edit130:setWidth(80);
    obj.edit130:setField("TR8");
    obj.edit130:setName("edit130");

    obj.edit131 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.PopJ8);
    obj.edit131:setLeft(220);
    obj.edit131:setTop(420);
    obj.edit131:setHeight(30);
    obj.edit131:setVisible(false);
    obj.edit131:setWidth(80);
    obj.edit131:setField("Macete8");
    obj.edit131:setName("edit131");

    obj.button36 = GUI.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.image1);
    obj.button36:setLeft(300);
    obj.button36:setTop(150);
    obj.button36:setWidth(100);
    obj.button36:setHeight(100);
    obj.button36:setName("button36");

    obj.label198 = GUI.fromHandle(_obj_newObject("label"));
    obj.label198:setParent(obj.image1);
    obj.label198:setLeft(320);
    obj.label198:setTop(190);
    obj.label198:setText("Jogador 9");
    obj.label198:setField("NomeJ9");
    obj.label198:setName("label198");

    obj.PopJ9 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ9:setParent(obj.image1);
    obj.PopJ9:setName("PopJ9");
    obj.PopJ9:setWidth(400);
    obj.PopJ9:setHeight(450);
    obj.PopJ9:setBackOpacity(0.5);

    obj.label199 = GUI.fromHandle(_obj_newObject("label"));
    obj.label199:setParent(obj.PopJ9);
    obj.label199:setLeft(20);
    obj.label199:setTop(20);
    obj.label199:setHeight(30);
    obj.label199:setWidth(80);
    obj.label199:setText("Nome");
    obj.label199:setName("label199");

    obj.edit132 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.PopJ9);
    obj.edit132:setLeft(80);
    obj.edit132:setTop(20);
    obj.edit132:setHeight(30);
    obj.edit132:setWidth(80);
    obj.edit132:setField("NomeJ9");
    obj.edit132:setName("edit132");

    obj.label200 = GUI.fromHandle(_obj_newObject("label"));
    obj.label200:setParent(obj.PopJ9);
    obj.label200:setLeft(20);
    obj.label200:setTop(60);
    obj.label200:setHeight(30);
    obj.label200:setWidth(80);
    obj.label200:setText("Dano");
    obj.label200:setName("label200");

    obj.edit133 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.PopJ9);
    obj.edit133:setLeft(80);
    obj.edit133:setTop(60);
    obj.edit133:setHeight(30);
    obj.edit133:setWidth(80);
    obj.edit133:setField("DanoJ9");
    obj.edit133:setName("edit133");

    obj.label201 = GUI.fromHandle(_obj_newObject("label"));
    obj.label201:setParent(obj.PopJ9);
    obj.label201:setLeft(170);
    obj.label201:setTop(60);
    obj.label201:setHeight(30);
    obj.label201:setWidth(80);
    obj.label201:setText("Buff Dano");
    obj.label201:setName("label201");

    obj.edit134 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.PopJ9);
    obj.edit134:setLeft(250);
    obj.edit134:setTop(60);
    obj.edit134:setHeight(30);
    obj.edit134:setWidth(80);
    obj.edit134:setField("BuffDNJ9");
    obj.edit134:setName("edit134");

    obj.label202 = GUI.fromHandle(_obj_newObject("label"));
    obj.label202:setParent(obj.PopJ9);
    obj.label202:setLeft(170);
    obj.label202:setTop(20);
    obj.label202:setHeight(30);
    obj.label202:setWidth(80);
    obj.label202:setFontColor("red");
    obj.label202:setText("Target/Alvo");
    obj.label202:setName("label202");

    obj.cmbInimigo9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigo9:setParent(obj.PopJ9);
    obj.cmbInimigo9:setName("cmbInimigo9");
    obj.cmbInimigo9:setLeft(250);
    obj.cmbInimigo9:setTop(20);
    obj.cmbInimigo9:setScale(1.4);
    obj.cmbInimigo9:setField("Alvo9");
    obj.cmbInimigo9:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6', 'Player7', 'Player8', 'Player9', 'Player10'});

    obj.label203 = GUI.fromHandle(_obj_newObject("label"));
    obj.label203:setParent(obj.PopJ9);
    obj.label203:setLeft(20);
    obj.label203:setTop(130);
    obj.label203:setHeight(30);
    obj.label203:setWidth(80);
    obj.label203:setText("Defesa");
    obj.label203:setName("label203");

    obj.edit135 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.PopJ9);
    obj.edit135:setLeft(80);
    obj.edit135:setTop(130);
    obj.edit135:setHeight(30);
    obj.edit135:setWidth(80);
    obj.edit135:setEnabled(false);
    obj.edit135:setField("DefesaAlvo9");
    obj.edit135:setName("edit135");

    obj.label204 = GUI.fromHandle(_obj_newObject("label"));
    obj.label204:setParent(obj.PopJ9);
    obj.label204:setLeft(170);
    obj.label204:setTop(130);
    obj.label204:setHeight(30);
    obj.label204:setWidth(80);
    obj.label204:setText("Buff Defesa");
    obj.label204:setName("label204");

    obj.edit136 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.PopJ9);
    obj.edit136:setLeft(250);
    obj.edit136:setTop(130);
    obj.edit136:setHeight(30);
    obj.edit136:setWidth(80);
    obj.edit136:setEnabled(false);
    obj.edit136:setField("BuffDefesaAlvo9");
    obj.edit136:setName("edit136");

    obj.label205 = GUI.fromHandle(_obj_newObject("label"));
    obj.label205:setParent(obj.PopJ9);
    obj.label205:setLeft(20);
    obj.label205:setTop(170);
    obj.label205:setHeight(30);
    obj.label205:setWidth(80);
    obj.label205:setText("Resist");
    obj.label205:setName("label205");

    obj.edit137 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.PopJ9);
    obj.edit137:setLeft(80);
    obj.edit137:setTop(170);
    obj.edit137:setHeight(30);
    obj.edit137:setWidth(80);
    obj.edit137:setEnabled(false);
    obj.edit137:setField("ResistenciaAlvo9");
    obj.edit137:setName("edit137");

    obj.label206 = GUI.fromHandle(_obj_newObject("label"));
    obj.label206:setParent(obj.PopJ9);
    obj.label206:setLeft(170);
    obj.label206:setTop(170);
    obj.label206:setHeight(30);
    obj.label206:setWidth(80);
    obj.label206:setText("Buff Resis");
    obj.label206:setName("label206");

    obj.edit138 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.PopJ9);
    obj.edit138:setLeft(250);
    obj.edit138:setTop(170);
    obj.edit138:setHeight(30);
    obj.edit138:setWidth(80);
    obj.edit138:setEnabled(false);
    obj.edit138:setField("BuffResistenciaAlvo9");
    obj.edit138:setName("edit138");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.PopJ9);
    obj.image11:setLeft(350);
    obj.image11:setTop(60);
    obj.image11:setWidth(30);
    obj.image11:setHeight(30);
    obj.image11:setSRC("/imagens/Shield.png");
    obj.image11:setName("image11");

    obj.btnPopREDPJ9 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPopREDPJ9:setParent(obj.PopJ9);
    obj.btnPopREDPJ9:setName("btnPopREDPJ9");
    obj.btnPopREDPJ9:setLeft(350);
    obj.btnPopREDPJ9:setTop(60);
    obj.btnPopREDPJ9:setFontColor("white");
    obj.btnPopREDPJ9:setOpacity(0.3);
    obj.btnPopREDPJ9:setWidth(30);
    obj.btnPopREDPJ9:setHeight(30);

    obj.popDefREDPJ9 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDefREDPJ9:setParent(obj.PopJ9);
    obj.popDefREDPJ9:setName("popDefREDPJ9");
    obj.popDefREDPJ9:setWidth(230);
    obj.popDefREDPJ9:setHeight(100);
    obj.popDefREDPJ9:setBackOpacity(0.5);

    obj.label207 = GUI.fromHandle(_obj_newObject("label"));
    obj.label207:setParent(obj.popDefREDPJ9);
    obj.label207:setLeft(20);
    obj.label207:setTop(10);
    obj.label207:setFontSize(10);
    obj.label207:setHeight(25);
    obj.label207:setWidth(40);
    obj.label207:setText("Defesa");
    obj.label207:setName("label207");

    obj.edit139 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.popDefREDPJ9);
    obj.edit139:setLeft(60);
    obj.edit139:setTop(10);
    obj.edit139:setFontSize(10);
    obj.edit139:setHeight(25);
    obj.edit139:setWidth(40);
    obj.edit139:setField("DefesaJ9");
    obj.edit139:setName("edit139");

    obj.label208 = GUI.fromHandle(_obj_newObject("label"));
    obj.label208:setParent(obj.popDefREDPJ9);
    obj.label208:setLeft(110);
    obj.label208:setTop(10);
    obj.label208:setFontSize(10);
    obj.label208:setHeight(25);
    obj.label208:setWidth(80);
    obj.label208:setText("Buff Defesa");
    obj.label208:setName("label208");

    obj.edit140 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.popDefREDPJ9);
    obj.edit140:setLeft(170);
    obj.edit140:setTop(10);
    obj.edit140:setFontSize(10);
    obj.edit140:setHeight(25);
    obj.edit140:setWidth(40);
    obj.edit140:setField("BuffDefJ9");
    obj.edit140:setName("edit140");

    obj.label209 = GUI.fromHandle(_obj_newObject("label"));
    obj.label209:setParent(obj.popDefREDPJ9);
    obj.label209:setLeft(20);
    obj.label209:setTop(40);
    obj.label209:setFontSize(10);
    obj.label209:setHeight(25);
    obj.label209:setWidth(40);
    obj.label209:setText("Resist");
    obj.label209:setName("label209");

    obj.edit141 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.popDefREDPJ9);
    obj.edit141:setLeft(60);
    obj.edit141:setTop(40);
    obj.edit141:setFontSize(10);
    obj.edit141:setHeight(25);
    obj.edit141:setWidth(40);
    obj.edit141:setField("ResistenciaJ9");
    obj.edit141:setName("edit141");

    obj.label210 = GUI.fromHandle(_obj_newObject("label"));
    obj.label210:setParent(obj.popDefREDPJ9);
    obj.label210:setLeft(110);
    obj.label210:setTop(40);
    obj.label210:setFontSize(10);
    obj.label210:setHeight(25);
    obj.label210:setWidth(80);
    obj.label210:setText("Buff Resis");
    obj.label210:setName("label210");

    obj.edit142 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.popDefREDPJ9);
    obj.edit142:setLeft(170);
    obj.edit142:setTop(40);
    obj.edit142:setFontSize(10);
    obj.edit142:setHeight(25);
    obj.edit142:setWidth(40);
    obj.edit142:setField("BuffResisJ9");
    obj.edit142:setName("edit142");

    obj.label211 = GUI.fromHandle(_obj_newObject("label"));
    obj.label211:setParent(obj.popDefREDPJ9);
    obj.label211:setLeft(40);
    obj.label211:setTop(70);
    obj.label211:setWidth(230);
    obj.label211:setFontSize(16);
    obj.label211:setFontColor("red");
    obj.label211:setText("REDUÇOES PLAYER 9");
    obj.label211:setName("label211");

    obj.button37 = GUI.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.PopJ9);
    obj.button37:setLeft(20);
    obj.button37:setTop(100);
    obj.button37:setFontColor("red");
    obj.button37:setText("Dano Fisico");
    obj.button37:setWidth(100);
    obj.button37:setName("button37");

    obj.button38 = GUI.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.PopJ9);
    obj.button38:setLeft(130);
    obj.button38:setTop(100);
    obj.button38:setFontColor("Cyan");
    obj.button38:setText("Dano Magico");
    obj.button38:setWidth(100);
    obj.button38:setName("button38");

    obj.button39 = GUI.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.PopJ9);
    obj.button39:setLeft(240);
    obj.button39:setTop(100);
    obj.button39:setFontColor("white");
    obj.button39:setText("Dano Real");
    obj.button39:setWidth(100);
    obj.button39:setName("button39");

    obj.label212 = GUI.fromHandle(_obj_newObject("label"));
    obj.label212:setParent(obj.PopJ9);
    obj.label212:setLeft(20);
    obj.label212:setTop(200);
    obj.label212:setHeight(30);
    obj.label212:setWidth(150);
    obj.label212:setFontSize(20);
    obj.label212:setFontColor("MediumBlue");
    obj.label212:setText("Dano Causado");
    obj.label212:setName("label212");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.PopJ9);
    obj.rectangle34:setLeft(20);
    obj.rectangle34:setTop(240);
    obj.rectangle34:setWidth(130);
    obj.rectangle34:setHeight(30);
    obj.rectangle34:setColor("white");
    obj.rectangle34:setStrokeColor("DarkGray");
    obj.rectangle34:setStrokeSize(2);
    obj.rectangle34:setName("rectangle34");

    obj.label213 = GUI.fromHandle(_obj_newObject("label"));
    obj.label213:setParent(obj.PopJ9);
    obj.label213:setLeft(25);
    obj.label213:setTop(240);
    obj.label213:setWidth(130);
    obj.label213:setHeight(30);
    obj.label213:setText("white");
    obj.label213:setFontSize(20);
    obj.label213:setFontColor("red");
    obj.label213:setField("DC9");
    obj.label213:setName("label213");

    obj.label214 = GUI.fromHandle(_obj_newObject("label"));
    obj.label214:setParent(obj.PopJ9);
    obj.label214:setLeft(220);
    obj.label214:setTop(200);
    obj.label214:setHeight(30);
    obj.label214:setWidth(150);
    obj.label214:setFontSize(20);
    obj.label214:setFontColor("MediumBlue");
    obj.label214:setText("Dano Total");
    obj.label214:setName("label214");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.PopJ9);
    obj.rectangle35:setLeft(220);
    obj.rectangle35:setTop(240);
    obj.rectangle35:setWidth(130);
    obj.rectangle35:setHeight(30);
    obj.rectangle35:setColor("DarkGray");
    obj.rectangle35:setStrokeColor("Red");
    obj.rectangle35:setStrokeSize(2);
    obj.rectangle35:setName("rectangle35");

    obj.label215 = GUI.fromHandle(_obj_newObject("label"));
    obj.label215:setParent(obj.PopJ9);
    obj.label215:setLeft(225);
    obj.label215:setTop(240);
    obj.label215:setWidth(130);
    obj.label215:setHeight(30);
    obj.label215:setText("white");
    obj.label215:setFontSize(20);
    obj.label215:setFontColor("red");
    obj.label215:setField("DT9");
    obj.label215:setName("label215");

    obj.label216 = GUI.fromHandle(_obj_newObject("label"));
    obj.label216:setParent(obj.PopJ9);
    obj.label216:setLeft(220);
    obj.label216:setTop(280);
    obj.label216:setHeight(30);
    obj.label216:setWidth(150);
    obj.label216:setFontSize(20);
    obj.label216:setFontColor("MediumBlue");
    obj.label216:setText("Numero da Vez");
    obj.label216:setName("label216");

    obj.edit143 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.PopJ9);
    obj.edit143:setLeft(220);
    obj.edit143:setTop(315);
    obj.edit143:setWidth(130);
    obj.edit143:setHeight(30);
    obj.edit143:setText("white");
    obj.edit143:setFontSize(20);
    obj.edit143:setField("TJ9");
    obj.edit143:setName("edit143");

    obj.label217 = GUI.fromHandle(_obj_newObject("label"));
    obj.label217:setParent(obj.PopJ9);
    obj.label217:setLeft(20);
    obj.label217:setTop(280);
    obj.label217:setHeight(30);
    obj.label217:setWidth(150);
    obj.label217:setFontSize(20);
    obj.label217:setFontColor("MediumBlue");
    obj.label217:setText("Critical");
    obj.label217:setName("label217");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.PopJ9);
    obj.rectangle36:setLeft(20);
    obj.rectangle36:setTop(315);
    obj.rectangle36:setWidth(130);
    obj.rectangle36:setHeight(30);
    obj.rectangle36:setColor("DarkGray");
    obj.rectangle36:setStrokeColor("red");
    obj.rectangle36:setStrokeSize(2);
    obj.rectangle36:setName("rectangle36");

    obj.label218 = GUI.fromHandle(_obj_newObject("label"));
    obj.label218:setParent(obj.PopJ9);
    obj.label218:setLeft(25);
    obj.label218:setTop(315);
    obj.label218:setWidth(130);
    obj.label218:setHeight(30);
    obj.label218:setText("white");
    obj.label218:setFontSize(20);
    obj.label218:setFontColor("red");
    obj.label218:setField("CI9");
    obj.label218:setName("label218");

    obj.label219 = GUI.fromHandle(_obj_newObject("label"));
    obj.label219:setParent(obj.PopJ9);
    obj.label219:setLeft(20);
    obj.label219:setTop(350);
    obj.label219:setHeight(30);
    obj.label219:setWidth(150);
    obj.label219:setFontSize(20);
    obj.label219:setFontColor("MediumBlue");
    obj.label219:setText("Vida do Player");
    obj.label219:setName("label219");

    obj.edit144 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.PopJ9);
    obj.edit144:setLeft(20);
    obj.edit144:setTop(385);
    obj.edit144:setWidth(130);
    obj.edit144:setHeight(30);
    obj.edit144:setField("VIDAJ9");
    obj.edit144:setName("edit144");

    obj.label220 = GUI.fromHandle(_obj_newObject("label"));
    obj.label220:setParent(obj.PopJ9);
    obj.label220:setLeft(220);
    obj.label220:setTop(350);
    obj.label220:setHeight(30);
    obj.label220:setWidth(150);
    obj.label220:setFontSize(20);
    obj.label220:setFontColor("MediumBlue");
    obj.label220:setText("Vida do Inimigo");
    obj.label220:setName("label220");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.PopJ9);
    obj.rectangle37:setLeft(220);
    obj.rectangle37:setTop(385);
    obj.rectangle37:setWidth(130);
    obj.rectangle37:setHeight(30);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("DarkGray");
    obj.rectangle37:setStrokeSize(2);
    obj.rectangle37:setName("rectangle37");

    obj.label221 = GUI.fromHandle(_obj_newObject("label"));
    obj.label221:setParent(obj.PopJ9);
    obj.label221:setLeft(225);
    obj.label221:setTop(385);
    obj.label221:setWidth(130);
    obj.label221:setHeight(30);
    obj.label221:setText("white");
    obj.label221:setFontSize(20);
    obj.label221:setFontColor("red");
    obj.label221:setField("VI9");
    obj.label221:setName("label221");

    obj.edit145 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.PopJ9);
    obj.edit145:setLeft(20);
    obj.edit145:setTop(420);
    obj.edit145:setHeight(30);
    obj.edit145:setVisible(false);
    obj.edit145:setWidth(80);
    obj.edit145:setField("Sobra9");
    obj.edit145:setName("edit145");

    obj.edit146 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.PopJ9);
    obj.edit146:setLeft(220);
    obj.edit146:setTop(420);
    obj.edit146:setHeight(30);
    obj.edit146:setVisible(false);
    obj.edit146:setWidth(80);
    obj.edit146:setField("TR9");
    obj.edit146:setName("edit146");

    obj.edit147 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.PopJ9);
    obj.edit147:setLeft(220);
    obj.edit147:setTop(420);
    obj.edit147:setHeight(30);
    obj.edit147:setVisible(false);
    obj.edit147:setWidth(80);
    obj.edit147:setField("Macete9");
    obj.edit147:setName("edit147");

    obj.button40 = GUI.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.image1);
    obj.button40:setLeft(430);
    obj.button40:setTop(150);
    obj.button40:setWidth(100);
    obj.button40:setHeight(100);
    obj.button40:setName("button40");

    obj.label222 = GUI.fromHandle(_obj_newObject("label"));
    obj.label222:setParent(obj.image1);
    obj.label222:setLeft(450);
    obj.label222:setTop(190);
    obj.label222:setText("Jogador 10");
    obj.label222:setField("NomeJ10");
    obj.label222:setName("label222");

    obj.PopJ10 = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopJ10:setParent(obj.image1);
    obj.PopJ10:setName("PopJ10");
    obj.PopJ10:setWidth(400);
    obj.PopJ10:setHeight(450);
    obj.PopJ10:setBackOpacity(0.5);

    obj.label223 = GUI.fromHandle(_obj_newObject("label"));
    obj.label223:setParent(obj.PopJ10);
    obj.label223:setLeft(20);
    obj.label223:setTop(20);
    obj.label223:setHeight(30);
    obj.label223:setWidth(80);
    obj.label223:setText("Nome");
    obj.label223:setName("label223");

    obj.edit148 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.PopJ10);
    obj.edit148:setLeft(80);
    obj.edit148:setTop(20);
    obj.edit148:setHeight(30);
    obj.edit148:setWidth(80);
    obj.edit148:setField("NomeJ10");
    obj.edit148:setName("edit148");

    obj.label224 = GUI.fromHandle(_obj_newObject("label"));
    obj.label224:setParent(obj.PopJ10);
    obj.label224:setLeft(20);
    obj.label224:setTop(60);
    obj.label224:setHeight(30);
    obj.label224:setWidth(80);
    obj.label224:setText("Dano");
    obj.label224:setName("label224");

    obj.edit149 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.PopJ10);
    obj.edit149:setLeft(80);
    obj.edit149:setTop(60);
    obj.edit149:setHeight(30);
    obj.edit149:setWidth(80);
    obj.edit149:setField("DanoJ10");
    obj.edit149:setName("edit149");

    obj.label225 = GUI.fromHandle(_obj_newObject("label"));
    obj.label225:setParent(obj.PopJ10);
    obj.label225:setLeft(170);
    obj.label225:setTop(60);
    obj.label225:setHeight(30);
    obj.label225:setWidth(80);
    obj.label225:setText("Buff Dano");
    obj.label225:setName("label225");

    obj.edit150 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.PopJ10);
    obj.edit150:setLeft(250);
    obj.edit150:setTop(60);
    obj.edit150:setHeight(30);
    obj.edit150:setWidth(80);
    obj.edit150:setField("BuffDNJ10");
    obj.edit150:setName("edit150");

    obj.label226 = GUI.fromHandle(_obj_newObject("label"));
    obj.label226:setParent(obj.PopJ10);
    obj.label226:setLeft(170);
    obj.label226:setTop(20);
    obj.label226:setHeight(30);
    obj.label226:setWidth(80);
    obj.label226:setFontColor("red");
    obj.label226:setText("Target/Alvo");
    obj.label226:setName("label226");

    obj.cmbInimigo10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigo10:setParent(obj.PopJ10);
    obj.cmbInimigo10:setName("cmbInimigo10");
    obj.cmbInimigo10:setLeft(250);
    obj.cmbInimigo10:setTop(20);
    obj.cmbInimigo10:setScale(1.4);
    obj.cmbInimigo10:setField("Alvo10");
    obj.cmbInimigo10:setItems({'Player1', 'Player2', 'Player3', 'Player4', 'Player5', 'Player6', 'Player7', 'Player8', 'Player9', 'Player10'});

    obj.label227 = GUI.fromHandle(_obj_newObject("label"));
    obj.label227:setParent(obj.PopJ10);
    obj.label227:setLeft(20);
    obj.label227:setTop(130);
    obj.label227:setHeight(30);
    obj.label227:setWidth(80);
    obj.label227:setText("Defesa");
    obj.label227:setName("label227");

    obj.edit151 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.PopJ10);
    obj.edit151:setLeft(80);
    obj.edit151:setTop(130);
    obj.edit151:setHeight(30);
    obj.edit151:setWidth(80);
    obj.edit151:setEnabled(false);
    obj.edit151:setField("DefesaAlvo10");
    obj.edit151:setName("edit151");

    obj.label228 = GUI.fromHandle(_obj_newObject("label"));
    obj.label228:setParent(obj.PopJ10);
    obj.label228:setLeft(170);
    obj.label228:setTop(130);
    obj.label228:setHeight(30);
    obj.label228:setWidth(80);
    obj.label228:setText("Buff Defesa");
    obj.label228:setName("label228");

    obj.edit152 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.PopJ10);
    obj.edit152:setLeft(250);
    obj.edit152:setTop(130);
    obj.edit152:setHeight(30);
    obj.edit152:setWidth(80);
    obj.edit152:setEnabled(false);
    obj.edit152:setField("BuffDefesaAlvo10");
    obj.edit152:setName("edit152");

    obj.label229 = GUI.fromHandle(_obj_newObject("label"));
    obj.label229:setParent(obj.PopJ10);
    obj.label229:setLeft(20);
    obj.label229:setTop(170);
    obj.label229:setHeight(30);
    obj.label229:setWidth(80);
    obj.label229:setText("Resist");
    obj.label229:setName("label229");

    obj.edit153 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.PopJ10);
    obj.edit153:setLeft(80);
    obj.edit153:setTop(170);
    obj.edit153:setHeight(30);
    obj.edit153:setWidth(80);
    obj.edit153:setEnabled(false);
    obj.edit153:setField("ResistenciaAlvo10");
    obj.edit153:setName("edit153");

    obj.label230 = GUI.fromHandle(_obj_newObject("label"));
    obj.label230:setParent(obj.PopJ10);
    obj.label230:setLeft(170);
    obj.label230:setTop(170);
    obj.label230:setHeight(30);
    obj.label230:setWidth(80);
    obj.label230:setText("Buff Resis");
    obj.label230:setName("label230");

    obj.edit154 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.PopJ10);
    obj.edit154:setLeft(250);
    obj.edit154:setTop(170);
    obj.edit154:setHeight(30);
    obj.edit154:setWidth(80);
    obj.edit154:setEnabled(false);
    obj.edit154:setField("BuffResistenciaAlvo10");
    obj.edit154:setName("edit154");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.PopJ10);
    obj.image12:setLeft(350);
    obj.image12:setTop(60);
    obj.image12:setWidth(30);
    obj.image12:setHeight(30);
    obj.image12:setSRC("/imagens/Shield.png");
    obj.image12:setName("image12");

    obj.btnPopREDPJ10 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnPopREDPJ10:setParent(obj.PopJ10);
    obj.btnPopREDPJ10:setName("btnPopREDPJ10");
    obj.btnPopREDPJ10:setLeft(350);
    obj.btnPopREDPJ10:setTop(60);
    obj.btnPopREDPJ10:setFontColor("white");
    obj.btnPopREDPJ10:setOpacity(0.3);
    obj.btnPopREDPJ10:setWidth(30);
    obj.btnPopREDPJ10:setHeight(30);

    obj.popDefREDPJ10 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popDefREDPJ10:setParent(obj.PopJ10);
    obj.popDefREDPJ10:setName("popDefREDPJ10");
    obj.popDefREDPJ10:setWidth(230);
    obj.popDefREDPJ10:setHeight(100);
    obj.popDefREDPJ10:setBackOpacity(0.5);

    obj.label231 = GUI.fromHandle(_obj_newObject("label"));
    obj.label231:setParent(obj.popDefREDPJ10);
    obj.label231:setLeft(20);
    obj.label231:setTop(10);
    obj.label231:setFontSize(10);
    obj.label231:setHeight(25);
    obj.label231:setWidth(40);
    obj.label231:setText("Defesa");
    obj.label231:setName("label231");

    obj.edit155 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.popDefREDPJ10);
    obj.edit155:setLeft(60);
    obj.edit155:setTop(10);
    obj.edit155:setFontSize(10);
    obj.edit155:setHeight(25);
    obj.edit155:setWidth(40);
    obj.edit155:setField("DefesaJ10");
    obj.edit155:setName("edit155");

    obj.label232 = GUI.fromHandle(_obj_newObject("label"));
    obj.label232:setParent(obj.popDefREDPJ10);
    obj.label232:setLeft(110);
    obj.label232:setTop(10);
    obj.label232:setFontSize(10);
    obj.label232:setHeight(25);
    obj.label232:setWidth(80);
    obj.label232:setText("Buff Defesa");
    obj.label232:setName("label232");

    obj.edit156 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.popDefREDPJ10);
    obj.edit156:setLeft(170);
    obj.edit156:setTop(10);
    obj.edit156:setFontSize(10);
    obj.edit156:setHeight(25);
    obj.edit156:setWidth(40);
    obj.edit156:setField("BuffDefJ10");
    obj.edit156:setName("edit156");

    obj.label233 = GUI.fromHandle(_obj_newObject("label"));
    obj.label233:setParent(obj.popDefREDPJ10);
    obj.label233:setLeft(20);
    obj.label233:setTop(40);
    obj.label233:setFontSize(10);
    obj.label233:setHeight(25);
    obj.label233:setWidth(40);
    obj.label233:setText("Resist");
    obj.label233:setName("label233");

    obj.edit157 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.popDefREDPJ10);
    obj.edit157:setLeft(60);
    obj.edit157:setTop(40);
    obj.edit157:setFontSize(10);
    obj.edit157:setHeight(25);
    obj.edit157:setWidth(40);
    obj.edit157:setField("ResistenciaJ10");
    obj.edit157:setName("edit157");

    obj.label234 = GUI.fromHandle(_obj_newObject("label"));
    obj.label234:setParent(obj.popDefREDPJ10);
    obj.label234:setLeft(110);
    obj.label234:setTop(40);
    obj.label234:setFontSize(10);
    obj.label234:setHeight(25);
    obj.label234:setWidth(80);
    obj.label234:setText("Buff Resis");
    obj.label234:setName("label234");

    obj.edit158 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.popDefREDPJ10);
    obj.edit158:setLeft(170);
    obj.edit158:setTop(40);
    obj.edit158:setFontSize(10);
    obj.edit158:setHeight(25);
    obj.edit158:setWidth(40);
    obj.edit158:setField("BuffResisJ10");
    obj.edit158:setName("edit158");

    obj.label235 = GUI.fromHandle(_obj_newObject("label"));
    obj.label235:setParent(obj.popDefREDPJ10);
    obj.label235:setLeft(40);
    obj.label235:setTop(70);
    obj.label235:setWidth(230);
    obj.label235:setFontSize(16);
    obj.label235:setFontColor("red");
    obj.label235:setText("REDUÇOES PLAYER 10");
    obj.label235:setName("label235");

    obj.button41 = GUI.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.PopJ10);
    obj.button41:setLeft(20);
    obj.button41:setTop(100);
    obj.button41:setFontColor("red");
    obj.button41:setText("Dano Fisico");
    obj.button41:setWidth(100);
    obj.button41:setName("button41");

    obj.button42 = GUI.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.PopJ10);
    obj.button42:setLeft(130);
    obj.button42:setTop(100);
    obj.button42:setFontColor("Cyan");
    obj.button42:setText("Dano Magico");
    obj.button42:setWidth(100);
    obj.button42:setName("button42");

    obj.button43 = GUI.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.PopJ10);
    obj.button43:setLeft(240);
    obj.button43:setTop(100);
    obj.button43:setFontColor("white");
    obj.button43:setText("Dano Real");
    obj.button43:setWidth(100);
    obj.button43:setName("button43");

    obj.label236 = GUI.fromHandle(_obj_newObject("label"));
    obj.label236:setParent(obj.PopJ10);
    obj.label236:setLeft(20);
    obj.label236:setTop(200);
    obj.label236:setHeight(30);
    obj.label236:setWidth(150);
    obj.label236:setFontSize(20);
    obj.label236:setFontColor("MediumBlue");
    obj.label236:setText("Dano Causado");
    obj.label236:setName("label236");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.PopJ10);
    obj.rectangle38:setLeft(20);
    obj.rectangle38:setTop(240);
    obj.rectangle38:setWidth(130);
    obj.rectangle38:setHeight(30);
    obj.rectangle38:setColor("white");
    obj.rectangle38:setStrokeColor("DarkGray");
    obj.rectangle38:setStrokeSize(2);
    obj.rectangle38:setName("rectangle38");

    obj.label237 = GUI.fromHandle(_obj_newObject("label"));
    obj.label237:setParent(obj.PopJ10);
    obj.label237:setLeft(25);
    obj.label237:setTop(240);
    obj.label237:setWidth(130);
    obj.label237:setHeight(30);
    obj.label237:setText("white");
    obj.label237:setFontSize(20);
    obj.label237:setFontColor("red");
    obj.label237:setField("DC10");
    obj.label237:setName("label237");

    obj.label238 = GUI.fromHandle(_obj_newObject("label"));
    obj.label238:setParent(obj.PopJ10);
    obj.label238:setLeft(220);
    obj.label238:setTop(200);
    obj.label238:setHeight(30);
    obj.label238:setWidth(150);
    obj.label238:setFontSize(20);
    obj.label238:setFontColor("MediumBlue");
    obj.label238:setText("Dano Total");
    obj.label238:setName("label238");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.PopJ10);
    obj.rectangle39:setLeft(220);
    obj.rectangle39:setTop(240);
    obj.rectangle39:setWidth(130);
    obj.rectangle39:setHeight(30);
    obj.rectangle39:setColor("DarkGray");
    obj.rectangle39:setStrokeColor("Red");
    obj.rectangle39:setStrokeSize(2);
    obj.rectangle39:setName("rectangle39");

    obj.label239 = GUI.fromHandle(_obj_newObject("label"));
    obj.label239:setParent(obj.PopJ10);
    obj.label239:setLeft(225);
    obj.label239:setTop(240);
    obj.label239:setWidth(130);
    obj.label239:setHeight(30);
    obj.label239:setText("white");
    obj.label239:setFontSize(20);
    obj.label239:setFontColor("red");
    obj.label239:setField("DT10");
    obj.label239:setName("label239");

    obj.label240 = GUI.fromHandle(_obj_newObject("label"));
    obj.label240:setParent(obj.PopJ10);
    obj.label240:setLeft(220);
    obj.label240:setTop(280);
    obj.label240:setHeight(30);
    obj.label240:setWidth(150);
    obj.label240:setFontSize(20);
    obj.label240:setFontColor("MediumBlue");
    obj.label240:setText("Numero da Vez");
    obj.label240:setName("label240");

    obj.edit159 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.PopJ10);
    obj.edit159:setLeft(220);
    obj.edit159:setTop(315);
    obj.edit159:setWidth(130);
    obj.edit159:setHeight(30);
    obj.edit159:setText("white");
    obj.edit159:setFontSize(20);
    obj.edit159:setField("TJ10");
    obj.edit159:setName("edit159");

    obj.label241 = GUI.fromHandle(_obj_newObject("label"));
    obj.label241:setParent(obj.PopJ10);
    obj.label241:setLeft(20);
    obj.label241:setTop(280);
    obj.label241:setHeight(30);
    obj.label241:setWidth(150);
    obj.label241:setFontSize(20);
    obj.label241:setFontColor("MediumBlue");
    obj.label241:setText("Critical");
    obj.label241:setName("label241");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.PopJ10);
    obj.rectangle40:setLeft(20);
    obj.rectangle40:setTop(315);
    obj.rectangle40:setWidth(130);
    obj.rectangle40:setHeight(30);
    obj.rectangle40:setColor("DarkGray");
    obj.rectangle40:setStrokeColor("red");
    obj.rectangle40:setStrokeSize(2);
    obj.rectangle40:setName("rectangle40");

    obj.label242 = GUI.fromHandle(_obj_newObject("label"));
    obj.label242:setParent(obj.PopJ10);
    obj.label242:setLeft(25);
    obj.label242:setTop(315);
    obj.label242:setWidth(130);
    obj.label242:setHeight(30);
    obj.label242:setText("white");
    obj.label242:setFontSize(20);
    obj.label242:setFontColor("red");
    obj.label242:setField("CI10");
    obj.label242:setName("label242");

    obj.label243 = GUI.fromHandle(_obj_newObject("label"));
    obj.label243:setParent(obj.PopJ10);
    obj.label243:setLeft(20);
    obj.label243:setTop(350);
    obj.label243:setHeight(30);
    obj.label243:setWidth(150);
    obj.label243:setFontSize(20);
    obj.label243:setFontColor("MediumBlue");
    obj.label243:setText("Vida do Player");
    obj.label243:setName("label243");

    obj.edit160 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.PopJ10);
    obj.edit160:setLeft(20);
    obj.edit160:setTop(385);
    obj.edit160:setWidth(130);
    obj.edit160:setHeight(30);
    obj.edit160:setField("VIDAJ10");
    obj.edit160:setName("edit160");

    obj.label244 = GUI.fromHandle(_obj_newObject("label"));
    obj.label244:setParent(obj.PopJ10);
    obj.label244:setLeft(220);
    obj.label244:setTop(350);
    obj.label244:setHeight(30);
    obj.label244:setWidth(150);
    obj.label244:setFontSize(20);
    obj.label244:setFontColor("MediumBlue");
    obj.label244:setText("Vida do Inimigo");
    obj.label244:setName("label244");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.PopJ10);
    obj.rectangle41:setLeft(220);
    obj.rectangle41:setTop(385);
    obj.rectangle41:setWidth(130);
    obj.rectangle41:setHeight(30);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("DarkGray");
    obj.rectangle41:setStrokeSize(2);
    obj.rectangle41:setName("rectangle41");

    obj.label245 = GUI.fromHandle(_obj_newObject("label"));
    obj.label245:setParent(obj.PopJ10);
    obj.label245:setLeft(225);
    obj.label245:setTop(385);
    obj.label245:setWidth(130);
    obj.label245:setHeight(30);
    obj.label245:setText("white");
    obj.label245:setFontSize(20);
    obj.label245:setFontColor("red");
    obj.label245:setField("VI10");
    obj.label245:setName("label245");

    obj.edit161 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.PopJ10);
    obj.edit161:setLeft(20);
    obj.edit161:setTop(420);
    obj.edit161:setHeight(30);
    obj.edit161:setVisible(false);
    obj.edit161:setWidth(80);
    obj.edit161:setField("Sobra10");
    obj.edit161:setName("edit161");

    obj.edit162 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.PopJ10);
    obj.edit162:setLeft(220);
    obj.edit162:setTop(420);
    obj.edit162:setHeight(30);
    obj.edit162:setVisible(false);
    obj.edit162:setWidth(80);
    obj.edit162:setField("TR10");
    obj.edit162:setName("edit162");

    obj.edit163 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.PopJ10);
    obj.edit163:setLeft(220);
    obj.edit163:setTop(420);
    obj.edit163:setHeight(30);
    obj.edit163:setVisible(false);
    obj.edit163:setWidth(80);
    obj.edit163:setField("Macete10");
    obj.edit163:setName("edit163");

    obj.label246 = GUI.fromHandle(_obj_newObject("label"));
    obj.label246:setParent(obj.image1);
    obj.label246:setLeft(10);
    obj.label246:setTop(500);
    obj.label246:setWidth(150);
    obj.label246:setVisible(true);
    obj.label246:setHeight(30);
    obj.label246:setText("Reduzido");
    obj.label246:setName("label246");

    obj.edit164 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.image1);
    obj.edit164:setLeft(70);
    obj.edit164:setTop(500);
    obj.edit164:setWidth(100);
    obj.edit164:setType("number");
    obj.edit164:setVisible(true);
    obj.edit164:setHeight(30);
    obj.edit164:setField("Reduzido");
    obj.edit164:setName("edit164");

    obj.label247 = GUI.fromHandle(_obj_newObject("label"));
    obj.label247:setParent(obj.image1);
    obj.label247:setLeft(10);
    obj.label247:setTop(450);
    obj.label247:setWidth(150);
    obj.label247:setVisible(true);
    obj.label247:setHeight(30);
    obj.label247:setText("Curado");
    obj.label247:setName("label247");

    obj.edit165 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.image1);
    obj.edit165:setLeft(70);
    obj.edit165:setTop(450);
    obj.edit165:setWidth(100);
    obj.edit165:setType("number");
    obj.edit165:setVisible(true);
    obj.edit165:setHeight(30);
    obj.edit165:setField("Curado");
    obj.edit165:setName("edit165");

    obj.button44 = GUI.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.image1);
    obj.button44:setLeft(10);
    obj.button44:setTop(550);
    obj.button44:setText("ZERAR TUDO");
    obj.button44:setFontColor("red");
    obj.button44:setFontSize(25);
    obj.button44:setHeight(35);
    obj.button44:setWidth(200);
    obj.button44:setName("button44");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.image1);
    obj.dataLink2:setFields({'NomeJ1', 'NomeJ2', 'NomeJ3', 'NomeJ4', 'NomeJ5', 'NomeJ6', 'NomeJ7', 'NomeJ8', 'NomeJ9', 'Alvo1', 'Alvo2', 'Alvo3', 'Alvo4', 'Alvo5', 'Alvo6', 'Alvo7', 'Alvo8', 'Alvo9'});
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            local novoForm = GUI.newForm("frmSCV4SobrePosta");
            				novoForm:setNodeObject(sheet);
            				novoForm:show();
        end);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            AtualizadordeStatus();
        end);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (event)
            sheet.VJ = (tonumber(sheet.VJ) or 0) - 1
            			
            			
             
            				if sheet.VJ < 1 then
            					sheet.VJ = 0
            					sheet.turno = (tonumber(sheet.turno) or 0) - 1
            				end;
            				
            				if sheet.VJ == 1 then
            					sheet.Vezde = (sheet.NomeJ1)
            				end;
            
            				if sheet.VJ == 2 then
            					sheet.Vezde = (sheet.NomeJ2)
            				end;						
            
            				if sheet.VJ == 3 then
            					sheet.Vezde = (sheet.NomeJ3)
            				end;
            
            				if sheet.VJ == 4 then
            					sheet.Vezde = (sheet.NomeJ4)
            				end;
            
            				if sheet.VJ == 5 then
            					sheet.Vezde = (sheet.NomeJ5)
            				end;
            
            				if sheet.VJ == 6 then
            					sheet.Vezde = (sheet.NomeJ6)
            				end;
            
            				if sheet.VJ == 7 then
            					sheet.Vezde = (sheet.NomeJ7)
            				end;
            
            				if sheet.VJ == 8 then
            					sheet.Vezde = (sheet.NomeJ8)
            				end;	
            					
            				if sheet.VJ == 9 then
            					sheet.Vezde = (sheet.NomeJ9)
            				end;
            
            				if sheet.VJ == 10 then
            					sheet.Vezde = (sheet.NomeJ10)
            				end;
        end);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (event)
            sheet.VJ = (tonumber(sheet.VJ) or 0) + 1
            									
            				if sheet.VJ > sheet.Emcombate then
            					sheet.VJ = 0
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;    
            					sheet.turno = (tonumber(sheet.turno) or 0) + 1
            					chat:enviarMensagem("[§U][§K4,0]Proxima Rodada");
            				end;
            				
            				if sheet.VJ == 1 then
            					sheet.Vezde = (sheet.NomeJ1)
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;           
            					chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ1 .. "[§K9,0] »");
            					chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            				end;
            
            				if sheet.VJ == 2 then
            					sheet.Vezde = (sheet.NomeJ2)
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;    
            					chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ2 .. "[§K9,0] »");
            					chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            				end;						
            
            				if sheet.VJ == 3 then
            					sheet.Vezde = (sheet.NomeJ3)
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;    
            					chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ3 .. "[§K9,0] »");
            					chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            				end;
            
            				if sheet.VJ == 4 then
            					sheet.Vezde = (sheet.NomeJ4)
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;    
            					chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ4 .. "[§K9,0] »");
            					chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            				end;
            
            				if sheet.VJ == 5 then
            					sheet.Vezde = (sheet.NomeJ5)
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;    
            					chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ5 .. "[§K9,0] »");
            					chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            				end;
            
            				if sheet.VJ == 6 then
            					sheet.Vezde = (sheet.NomeJ6)
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;    
            					chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ6 .. "[§K9,0] »");
            					chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            				end;	
            
            				if sheet.VJ == 7 then
            					sheet.Vezde = (sheet.NomeJ7)
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;    
            					chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ7 .. "[§K9,0] »");
            					chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            				end;	
            				
            				if sheet.VJ == 8 then
            					sheet.Vezde = (sheet.NomeJ8)
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;    
            					chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ8	 .. "[§K9,0] »");
            					chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            				end;
            
            				if sheet.VJ == 9 then
            					sheet.Vezde = (sheet.NomeJ9)
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;    
            					chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ9	 .. "[§K9,0] »");
            					chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            				end;	
            				
            				if sheet.VJ == 10 then
            					sheet.Vezde = (sheet.NomeJ10)
            					local minhaMesa = Firecast.getRoomOf(sheet);
            					local chat = minhaMesa.chat;    
            					chat:enviarMensagem("[§K9,0]Turno de « [§K4,0]" .. sheet.NomeJ10	 .. "[§K9,0] »");
            					chat:enviarMensagem("[§K9,0]Rodada « [§K4,0]" .. sheet.Turno .. " [§K9,0]»");
            				end;
        end);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (event)
            self.PopJ1:show('center');
        end);

    obj._e_event5 = obj.btnPopREDPJ1:addEventListener("onClick",
        function (event)
            self.popDefREDPJ1:show('center', self.btnPopREDPJ1);
        end);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (event)
            if self.cmbInimigo1.text == sheet.NomeJ1 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)				 				 
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					end;
            
            					if self.cmbInimigo1.text == sheet.NomeJ2 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					end;				 
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ3 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					end;	
            
            					if self.cmbInimigo1.text == sheet.NomeJ4 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					end;
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ5 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					end;			 
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ6 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					end;	
            
            					if self.cmbInimigo1.text == sheet.NomeJ7 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					end;		 
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ8 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					end;
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ9 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					end;
            					
            					if self.cmbInimigo1.text == sheet.NomeJ10 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					end;
            					
            					sheet.DC1 = (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.Sobra1) or 0)
            					sheet.CI1 = (tonumber(sheet.DC1) or 0) * 2
            					sheet.DT1 = (tonumber(sheet.DC1) or 0) + (tonumber(sheet.DT1) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete1) or 0) * 100 - (tonumber(sheet.DC1) or 0);
        end);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (event)
            if self.cmbInimigo1.text == sheet.NomeJ1 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)				 				 
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					end;
            
            					if self.cmbInimigo1.text == sheet.NomeJ2 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					end;				 
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ3 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					end;	
            
            					if self.cmbInimigo1.text == sheet.NomeJ4 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					end;
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ5 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					end;			 
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ6 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					end;	
            						
            					if self.cmbInimigo1.text == sheet.NomeJ7 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					end;			 
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ8 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					end;
            					
            					if self.cmbInimigo1.text == sheet.NomeJ9 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					end;
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ10 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.Macete1 = (tonumber(sheet.Macete1) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					end;
            					 
            					sheet.DC1 = (tonumber(sheet.Macete1) or 0) * (tonumber(sheet.SobraR1) or 0)
            					sheet.CI1 = (tonumber(sheet.DC1) or 0) * 2
            					sheet.DT1 = (tonumber(sheet.DC1) or 0) + (tonumber(sheet.DT1) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete1) or 0) * 100 - (tonumber(sheet.DC1) or 0);
        end);

    obj._e_event8 = obj.button7:addEventListener("onClick",
        function (event)
            if self.cmbInimigo1.text == sheet.NomeJ1 then			
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            					end;
            
            					if self.cmbInimigo1.text == sheet.NomeJ2 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            					end;				 
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ3 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            					end;	
            
            					if self.cmbInimigo1.text == sheet.NomeJ4 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            					end;
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ5 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            					end;			 
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ6 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            					end;
            
            					if self.cmbInimigo1.text == sheet.NomeJ7 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            					end;			 
            					 
            					if self.cmbInimigo1.text == sheet.NomeJ8 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            					end;
            					
            					if self.cmbInimigo1.text == sheet.NomeJ9 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            					end;
            					
            					if self.cmbInimigo1.text == sheet.NomeJ10 then
            						sheet.Macete1 = (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.DanoJ1) or 0) + (tonumber(sheet.BuffDNJ1) or 0)
            					end;
            					 
            					sheet.DC1 = (tonumber(sheet.Macete1) or 0)
            					sheet.CI1 = (tonumber(sheet.DC1) or 0) * 2
            					sheet.DT1 = (tonumber(sheet.DC1) or 0) + (tonumber(sheet.DT1) or 0)
        end);

    obj._e_event9 = obj.button8:addEventListener("onClick",
        function (event)
            self.PopJ2:show();
        end);

    obj._e_event10 = obj.btnPopREDPJ2:addEventListener("onClick",
        function (event)
            self.popDefREDPJ2:show('center', self.btnPopREDPJ2);
        end);

    obj._e_event11 = obj.button9:addEventListener("onClick",
        function (event)
            if self.cmbInimigo2.text == sheet.NomeJ1 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)				 				 
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					end;
            
            					if self.cmbInimigo2.text == sheet.NomeJ2 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					end;				 
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ3 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					end;	
            
            					if self.cmbInimigo2.text == sheet.NomeJ4 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					end;
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ5 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					end;			 
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ6 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					end;	
            					
            					if self.cmbInimigo2.text == sheet.NomeJ7 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					end;			 
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ8 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					end;
            
            					if self.cmbInimigo2.text == sheet.NomeJ9 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					end;	
            
            					if self.cmbInimigo2.text == sheet.NomeJ10 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					end;	
            					 
            					sheet.DC2 = (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.Sobra2) or 0)
            					sheet.CI2 = (tonumber(sheet.DC2) or 0) * 2
            					sheet.DT2 = (tonumber(sheet.DC2) or 0) + (tonumber(sheet.DT2) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete2) or 0) * 100 - (tonumber(sheet.DC2) or 0);
        end);

    obj._e_event12 = obj.button10:addEventListener("onClick",
        function (event)
            if self.cmbInimigo2.text == sheet.NomeJ1 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)				 				 
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					end;
            
            					if self.cmbInimigo2.text == sheet.NomeJ2 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					end;				 
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ3 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					end;	
            
            					if self.cmbInimigo2.text == sheet.NomeJ4 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					end;
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ5 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					end;			 
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ6 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					end;	 
            					
            					if self.cmbInimigo2.text == sheet.NomeJ7 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					end;			 
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ8 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					end;
            
            					if self.cmbInimigo2.text == sheet.NomeJ9 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					end;	
            
            					if self.cmbInimigo2.text == sheet.NomeJ10 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.Macete2 = (tonumber(sheet.Macete2) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					end;	
            					 
            					sheet.DC2 = (tonumber(sheet.Macete2) or 0) * (tonumber(sheet.SobraR2) or 0)
            					sheet.CI2 = (tonumber(sheet.DC2) or 0) * 2
            					sheet.DT2 = (tonumber(sheet.DC2) or 0) + (tonumber(sheet.DT2) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete2) or 0) * 100 - (tonumber(sheet.DC2) or 0);
        end);

    obj._e_event13 = obj.button11:addEventListener("onClick",
        function (event)
            if self.cmbInimigo2.text == sheet.NomeJ1 then			
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            					end;
            
            					if self.cmbInimigo2.text == sheet.NomeJ2 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            					end;				 
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ3 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            					end;	
            
            					if self.cmbInimigo2.text == sheet.NomeJ4 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            					end;
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ5 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            					end;			 
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ6 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            					end;	 
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ7 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            					end;			 
            					 
            					if self.cmbInimigo2.text == sheet.NomeJ8 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            					end;
            
            					if self.cmbInimigo2.text == sheet.NomeJ9 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            					end;	
            
            					if self.cmbInimigo2.text == sheet.NomeJ10 then
            						sheet.Macete2 = (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.DanoJ2) or 0) + (tonumber(sheet.BuffDNJ2) or 0)
            					end;	
            					 
            					sheet.DC2 = (tonumber(sheet.Macete2) or 0)
            					sheet.CI2 = (tonumber(sheet.DC2) or 0) * 2
            					sheet.DT2 = (tonumber(sheet.DC2) or 0) + (tonumber(sheet.DT2) or 0)
        end);

    obj._e_event14 = obj.button12:addEventListener("onClick",
        function (event)
            self.PopJ3:show();
        end);

    obj._e_event15 = obj.btnPopREDPJ3:addEventListener("onClick",
        function (event)
            self.popDefREDPJ3:show('center', self.btnPopREDPJ3);
        end);

    obj._e_event16 = obj.button13:addEventListener("onClick",
        function (event)
            if self.cmbInimigo3.text == sheet.NomeJ1 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)				 				 
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					 end;
            
            					if self.cmbInimigo3.text == sheet.NomeJ2 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					end;				 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ3 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					end;	
            
            					if self.cmbInimigo3.text == sheet.NomeJ4 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					end;
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ5 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					end;			 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ6 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					end;	 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ7 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					end;			 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ8 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					end;
            
            					if self.cmbInimigo3.text == sheet.NomeJ9 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					end;
            					
            					if self.cmbInimigo3.text == sheet.NomeJ10 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					end;
            					 
            					sheet.DC3 = (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.Sobra3) or 0)
            					sheet.CI3 = (tonumber(sheet.DC3) or 0) * 2
            					sheet.DT3 = (tonumber(sheet.DC3) or 0) + (tonumber(sheet.DT3) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete3) or 0) * 100 - (tonumber(sheet.DC3) or 0);
        end);

    obj._e_event17 = obj.button14:addEventListener("onClick",
        function (event)
            if self.cmbInimigo3.text == sheet.NomeJ1 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)				 				 
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					end;
            
            					if self.cmbInimigo3.text == sheet.NomeJ2 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					end;				 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ3 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					end;	
            
            					if self.cmbInimigo3.text == sheet.NomeJ4 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					end;
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ5 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					end;			 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ6 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					end;	 
            					
            					if self.cmbInimigo3.text == sheet.NomeJ7 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					end;			 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ8 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					end;
            					
            					if self.cmbInimigo3.text == sheet.NomeJ9 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					end;
            					
            					if self.cmbInimigo3.text == sheet.NomeJ10 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.Macete3 = (tonumber(sheet.Macete3) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					end;
            					
            					sheet.DC3 = (tonumber(sheet.Macete3) or 0) * (tonumber(sheet.SobraR3) or 0)
            					sheet.CI3 = (tonumber(sheet.DC3) or 0) * 2
            					sheet.DT3 = (tonumber(sheet.DC3) or 0) + (tonumber(sheet.DT3) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete3) or 0) * 100 - (tonumber(sheet.DC3) or 0);
        end);

    obj._e_event18 = obj.button15:addEventListener("onClick",
        function (event)
            if self.cmbInimigo3.text == sheet.NomeJ1 then			
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            					end;
            
            					if self.cmbInimigo3.text == sheet.NomeJ2 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            					end;				 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ3 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            					end;	
            
            					if self.cmbInimigo3.text == sheet.NomeJ4 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            					end;
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ5 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            					end;			 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ6 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            					end;	 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ7 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            					end;			 
            					 
            					if self.cmbInimigo3.text == sheet.NomeJ8 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            					end;	
            
            					if self.cmbInimigo3.text == sheet.NomeJ9 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            					end;
            					
            					if self.cmbInimigo3.text == sheet.NomeJ10 then
            						sheet.Macete3 = (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.DanoJ3) or 0) + (tonumber(sheet.BuffDNJ3) or 0)
            					end;
            					 
            					sheet.DC3 = (tonumber(sheet.Macete3) or 0)
            					sheet.CI3 = (tonumber(sheet.DC3) or 0) * 2
            					sheet.DT3 = (tonumber(sheet.DC3) or 0) + (tonumber(sheet.DT3) or 0)
        end);

    obj._e_event19 = obj.button16:addEventListener("onClick",
        function (event)
            self.PopJ4:show();
        end);

    obj._e_event20 = obj.btnPopREDPJ4:addEventListener("onClick",
        function (event)
            self.popDefREDPJ4:show('center', self.btnPopREDPJ4);
        end);

    obj._e_event21 = obj.button17:addEventListener("onClick",
        function (event)
            if self.cmbInimigo4.text == sheet.NomeJ1 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)				 				 
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					end;
            
            					if self.cmbInimigo4.text == sheet.NomeJ2 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					end;				 
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ3 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					end;	
            
            					if self.cmbInimigo4.text == sheet.NomeJ4 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					end;
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ5 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					    sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					end;			 
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ6 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					end;	 
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ7 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					end;			 
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ8 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					end;
            
            					if self.cmbInimigo4.text == sheet.NomeJ9 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					end;	
            
            					if self.cmbInimigo4.text == sheet.NomeJ10 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					end;
            					 
            					sheet.DC4 = (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.Sobra4) or 0)
            					sheet.CI4 = (tonumber(sheet.DC4) or 0) * 2
            					sheet.DT4 = (tonumber(sheet.DC4) or 0) + (tonumber(sheet.DT4) or 0)
            				 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete4) or 0) * 100 - (tonumber(sheet.DC4) or 0);
        end);

    obj._e_event22 = obj.button18:addEventListener("onClick",
        function (event)
            if self.cmbInimigo4.text == sheet.NomeJ1 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)				 				 
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					end;
            
            					if self.cmbInimigo4.text == sheet.NomeJ2 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					end;				 
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ3 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					end;	
            
            					if self.cmbInimigo4.text == sheet.NomeJ4 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					end;
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ5 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					end;			 
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ6 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					end;	
            
            					if self.cmbInimigo4.text == sheet.NomeJ7 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					end;			 
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ8 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					end;
            					
            					if self.cmbInimigo4.text == sheet.NomeJ9 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					end;
            					
            					if self.cmbInimigo4.text == sheet.NomeJ10 then
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.Macete4 = (tonumber(sheet.Macete4) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					end;
            					 
            					sheet.DC4 = (tonumber(sheet.Macete4) or 0) * (tonumber(sheet.SobraR4) or 0)
            					sheet.CI4 = (tonumber(sheet.DC4) or 0) * 2
            					sheet.DT4 = (tonumber(sheet.DC4) or 0) + (tonumber(sheet.DT4) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete4) or 0) * 100 - (tonumber(sheet.DC4) or 0);
        end);

    obj._e_event23 = obj.button19:addEventListener("onClick",
        function (event)
            if self.cmbInimigo4.text == sheet.NomeJ1 then			
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					end;
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ2 then	
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					end;				 
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ3 then	
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					end;	
            
            					if self.cmbInimigo4.text == sheet.NomeJ4 then	
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					end;
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ5 then	
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					end;			 
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ6 then	
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					end;	
            
            					if self.cmbInimigo4.text == sheet.NomeJ7 then	
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					end;			 
            					 
            					if self.cmbInimigo4.text == sheet.NomeJ8 then	
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					end;
            
            					if self.cmbInimigo4.text == sheet.NomeJ9 then	
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					end;	
            
            					if self.cmbInimigo4.text == sheet.NomeJ10 then	
            						sheet.Macete4 = (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.DanoJ4) or 0) + (tonumber(sheet.BuffDNJ4) or 0)
            					end;
            					 
            					 sheet.DC4 = (tonumber(sheet.Macete4) or 0)
            					 sheet.CI4 = (tonumber(sheet.DC4) or 0) * 2
            					 sheet.DT4 = (tonumber(sheet.DC4) or 0) + (tonumber(sheet.DT4) or 0)
        end);

    obj._e_event24 = obj.button20:addEventListener("onClick",
        function (event)
            self.PopJ5:show();
        end);

    obj._e_event25 = obj.btnPopREDPJ5:addEventListener("onClick",
        function (event)
            self.popDefREDPJ5:show('center', self.btnPopREDPJ5);
        end);

    obj._e_event26 = obj.button21:addEventListener("onClick",
        function (event)
            if self.cmbInimigo5.text == sheet.NomeJ1 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)				 				 
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					end;
            
            					if self.cmbInimigo5.text == sheet.NomeJ2 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					end;				 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ3 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					end;	
            
            					if self.cmbInimigo5.text == sheet.NomeJ4 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					end;
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ5 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					end;			 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ6 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					end;	 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ7 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					end;			 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ8 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					end; 
            					
            					if self.cmbInimigo5.text == sheet.NomeJ9 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					end; 
            					
            					if self.cmbInimigo5.text == sheet.NomeJ10 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					end; 
            					 
            					sheet.DC5 = (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.Sobra5) or 0)
            					sheet.CI5 = (tonumber(sheet.DC5) or 0) * 2
            					sheet.DT5 = (tonumber(sheet.DC5) or 0) + (tonumber(sheet.DT5) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete5) or 0) * 100 - (tonumber(sheet.DC5) or 0);
        end);

    obj._e_event27 = obj.button22:addEventListener("onClick",
        function (event)
            if self.cmbInimigo5.text == sheet.NomeJ1 then
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)				 				 
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					end;
            
            					if self.cmbInimigo5.text == sheet.NomeJ2 then
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					end;				 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ3 then
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					end;	
            
            					if self.cmbInimigo5.text == sheet.NomeJ4 then
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					end;
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ5 then
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					end;			 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ6 then
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					end;	 
            					
            					if self.cmbInimigo5.text == sheet.NomeJ7 then
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					end;			 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ8 then
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					end;	
            					
            					if self.cmbInimigo5.text == sheet.NomeJ9 then
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					end;
            
            					if self.cmbInimigo5.text == sheet.NomeJ10 then
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.Macete5 = (tonumber(sheet.Macete5) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					end;	
            					 
            					sheet.DC5 = (tonumber(sheet.Macete5) or 0) * (tonumber(sheet.SobraR5) or 0)
            					sheet.CI5 = (tonumber(sheet.DC5) or 0) * 2
            					sheet.DT5 = (tonumber(sheet.DC5) or 0) + (tonumber(sheet.DT5) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete5) or 0) * 100 - (tonumber(sheet.DC5) or 0);
        end);

    obj._e_event28 = obj.button23:addEventListener("onClick",
        function (event)
            if self.cmbInimigo5.text == sheet.NomeJ1 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            					end;
            
            					if self.cmbInimigo5.text == sheet.NomeJ2 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            					end;				 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ3 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            					end;	
            
            					if self.cmbInimigo5.text == sheet.NomeJ4 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            					end;
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ5 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            					end;			 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ6 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            					end;	 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ7 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            					end;			 
            					 
            					if self.cmbInimigo5.text == sheet.NomeJ8 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            					end;	
            
            					if self.cmbInimigo5.text == sheet.NomeJ9 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            					end;	
            					
            					if self.cmbInimigo5.text == sheet.NomeJ10 then		
            						sheet.Macete5 = (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.DanoJ5) or 0) + (tonumber(sheet.BuffDNJ5) or 0)
            					end;	
            					 
            					sheet.DC5 = (tonumber(sheet.Macete5) or 0)
            					sheet.CI5 = (tonumber(sheet.DC5) or 0) * 2
            					sheet.DT5 = (tonumber(sheet.DC5) or 0) + (tonumber(sheet.DT5) or 0)
        end);

    obj._e_event29 = obj.button24:addEventListener("onClick",
        function (event)
            self.PopJ6:show();
        end);

    obj._e_event30 = obj.btnPopREDPJ6:addEventListener("onClick",
        function (event)
            self.popDefREDPJ6:show('center', self.btnPopREDPJ6);
        end);

    obj._e_event31 = obj.button25:addEventListener("onClick",
        function (event)
            if self.cmbInimigo6.text == sheet.NomeJ1 then	
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)				 				 
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					end;
            
            					if self.cmbInimigo6.text == sheet.NomeJ2 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					end;				 
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ3 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					end;	
            
            					if self.cmbInimigo6.text == sheet.NomeJ4 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					end;
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ5 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					end;			 
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ6 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					end;	
            
            					if self.cmbInimigo6.text == sheet.NomeJ7 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					end;			 
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ8 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					end;
            					
            					if self.cmbInimigo6.text == sheet.NomeJ9 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					end;
            					
            					if self.cmbInimigo6.text == sheet.NomeJ10 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					end;
            					
            					sheet.DC6 = (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.Sobra6) or 0)
            					sheet.CI6 = (tonumber(sheet.DC6) or 0) * 2
            					sheet.DT6 = (tonumber(sheet.DC6) or 0) + (tonumber(sheet.DT6) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete6) or 0) * 100 - (tonumber(sheet.DC6) or 0);
        end);

    obj._e_event32 = obj.button26:addEventListener("onClick",
        function (event)
            if self.cmbInimigo6.text == sheet.NomeJ1 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)				 				 
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					end;
            
            					if self.cmbInimigo6.text == sheet.NomeJ2 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					end;				 
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ3 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					end;	
            
            					if self.cmbInimigo6.text == sheet.NomeJ4 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					end;
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ5 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					end;			 
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ6 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					end;	
            
            					if self.cmbInimigo6.text == sheet.NomeJ7 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					end;			 
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ8 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					end;	
            
            					if self.cmbInimigo6.text == sheet.NomeJ9 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					end;
            					
            					if self.cmbInimigo6.text == sheet.NomeJ10 then
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.Macete6 = (tonumber(sheet.Macete6) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					end;
            					 
            					sheet.DC6 = (tonumber(sheet.Macete6) or 0) * (tonumber(sheet.SobraR6) or 0)
            					sheet.CI6 = (tonumber(sheet.DC6) or 0) * 2
            					sheet.DT6 = (tonumber(sheet.DC6) or 0) + (tonumber(sheet.DT6) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete6) or 0) * 100 - (tonumber(sheet.DC6) or 0);
        end);

    obj._e_event33 = obj.button27:addEventListener("onClick",
        function (event)
            if self.cmbInimigo6.text == sheet.NomeJ1 then			
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            					end;
            
            					if self.cmbInimigo6.text == sheet.NomeJ2 then	
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            					end;				 
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ3 then	
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            					end;	
            
            					if self.cmbInimigo6.text == sheet.NomeJ4 then	
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            					end;
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ5 then	
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            					end;			 
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ6 then	
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            					end;	 
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ7 then	
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            					end;			 
            					 
            					if self.cmbInimigo6.text == sheet.NomeJ8 then	
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            					end;	
            
            					if self.cmbInimigo6.text == sheet.NomeJ9 then	
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            					end;
            
            					if self.cmbInimigo6.text == sheet.NomeJ10 then	
            						sheet.Macete6 = (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.DanoJ6) or 0) + (tonumber(sheet.BuffDNJ6) or 0)
            					end;					
            					 
            					sheet.DC6 = (tonumber(sheet.Macete6) or 0)
            					sheet.CI6 = (tonumber(sheet.DC6) or 0) * 2
            					sheet.DT6 = (tonumber(sheet.DC6) or 0) + (tonumber(sheet.DT6) or 0)
        end);

    obj._e_event34 = obj.button28:addEventListener("onClick",
        function (event)
            self.PopJ7:show();
        end);

    obj._e_event35 = obj.btnPopREDPJ7:addEventListener("onClick",
        function (event)
            self.popDefREDPJ7:show('center', self.btnPopREDPJ7);
        end);

    obj._e_event36 = obj.button29:addEventListener("onClick",
        function (event)
            if self.cmbInimigo7.text == sheet.NomeJ1 then	
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)				 				 
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					end;
            
            					if self.cmbInimigo7.text == sheet.NomeJ2 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					end;				 
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ3 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					end;	
            
            					if self.cmbInimigo7.text == sheet.NomeJ4 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					end;
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ5 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					end;			 
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ6 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					end;	 
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ7 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					end;			 
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ8 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					end;	
            					
            					if self.cmbInimigo7.text == sheet.NomeJ9 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					end;	
            					
            					if self.cmbInimigo7.text == sheet.NomeJ10 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					end;	
            					 
            					sheet.DC7 = (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.Sobra7) or 0)
            					sheet.CI7 = (tonumber(sheet.DC7) or 0) * 2
            					sheet.DT7 = (tonumber(sheet.DC7) or 0) + (tonumber(sheet.DT7) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete7) or 0) * 100 - (tonumber(sheet.DC7) or 0);
        end);

    obj._e_event37 = obj.button30:addEventListener("onClick",
        function (event)
            if self.cmbInimigo7.text == sheet.NomeJ1 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)				 				 
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					end;
            
            					if self.cmbInimigo7.text == sheet.NomeJ2 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					end;				 
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ3 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					end;	
            
            					if self.cmbInimigo7.text == sheet.NomeJ4 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					end;
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ5 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					end;			 
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ6 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					end;	
            
            					if self.cmbInimigo7.text == sheet.NomeJ7 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					end;			 
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ8 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					end;		
            
            					if self.cmbInimigo7.text == sheet.NomeJ9 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					end;
            
            					if self.cmbInimigo7.text == sheet.NomeJ10 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.Macete7 = (tonumber(sheet.Macete7) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					end;
            					 
            					sheet.DC7 = (tonumber(sheet.Macete7) or 0) * (tonumber(sheet.SobraR7) or 0)
            					sheet.CI7 = (tonumber(sheet.DC7) or 0) * 2
            					sheet.DT7 = (tonumber(sheet.DC7) or 0) + (tonumber(sheet.DT7) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete7) or 0) * 100 - (tonumber(sheet.DC7) or 0);
        end);

    obj._e_event38 = obj.button31:addEventListener("onClick",
        function (event)
            if self.cmbInimigo7.text == sheet.NomeJ1 then			
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            					end;
            
            					if self.cmbInimigo7.text == sheet.NomeJ2 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete7) or 0)
            					end;				 
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ3 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete7) or 0)
            					end;	
            
            					if self.cmbInimigo7.text == sheet.NomeJ4 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete7) or 0)
            					end;
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ5 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete7) or 0)
            					end;			 
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ6 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete7) or 0)
            					end;
            
            					if self.cmbInimigo7.text == sheet.NomeJ7 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete7) or 0)
            					end;			 
            					 
            					if self.cmbInimigo7.text == sheet.NomeJ8 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete7) or 0)
            					end;	
            					
            					if self.cmbInimigo7.text == sheet.NomeJ9 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete7) or 0)
            					end;
            					
            					if self.cmbInimigo7.text == sheet.NomeJ10 then
            						sheet.Macete7 = (tonumber(sheet.DanoJ7) or 0) + (tonumber(sheet.BuffDNJ7) or 0)
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete7) or 0)
            					end;
            					 					 
            					sheet.DC7 = (tonumber(sheet.Macete7) or 0)
            					sheet.CI7 = (tonumber(sheet.DC7) or 0) * 2
            					sheet.DT7 = (tonumber(sheet.DC7) or 0) + (tonumber(sheet.DT7) or 0)
        end);

    obj._e_event39 = obj.button32:addEventListener("onClick",
        function (event)
            self.PopJ8:show();
        end);

    obj._e_event40 = obj.btnPopREDPJ8:addEventListener("onClick",
        function (event)
            self.popDefREDPJ8:show('center', self.btnPopREDPJ8);
        end);

    obj._e_event41 = obj.button33:addEventListener("onClick",
        function (event)
            if self.cmbInimigo8.text == sheet.NomeJ1 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)				 				 
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					end;
            
            					if self.cmbInimigo8.text == sheet.NomeJ2 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					end;				 
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ3 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					end;	
            
            					if self.cmbInimigo8.text == sheet.NomeJ4 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					end;
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ5 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					end;			 
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ6 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					end;	 
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ7 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					end;			 
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ8 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					end;
            
            					if self.cmbInimigo8.text == sheet.NomeJ9 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					end;	
            					
            					if self.cmbInimigo8.text == sheet.NomeJ10 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					end;	
            					 
            					sheet.DC8 = (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.Sobra8) or 0)
            					sheet.CI8 = (tonumber(sheet.DC8) or 0) * 2
            					sheet.DT8 = (tonumber(sheet.DC8) or 0) + (tonumber(sheet.DT8) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete8) or 0) * 100 - (tonumber(sheet.DC8) or 0);
        end);

    obj._e_event42 = obj.button34:addEventListener("onClick",
        function (event)
            if self.cmbInimigo8.text == sheet.NomeJ1 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)				 				 
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					end;
            
            					if self.cmbInimigo8.text == sheet.NomeJ2 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					end;				 
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ3 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					end;	
            
            					if self.cmbInimigo8.text == sheet.NomeJ4 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					end;
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ5 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					end;			 
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ6 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					end;	
            
            					if self.cmbInimigo8.text == sheet.NomeJ7 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					end;			 
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ8 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					end;	
            
            					if self.cmbInimigo8.text == sheet.NomeJ9 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					end;
            					
            					if self.cmbInimigo8.text == sheet.NomeJ10 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.Macete8 = (tonumber(sheet.Macete8) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					end;
            					 
            					sheet.DC8 = (tonumber(sheet.Macete8) or 0) * (tonumber(sheet.SobraR8) or 0)
            					sheet.CI8 = (tonumber(sheet.DC8) or 0) * 2
            					sheet.DT8 = (tonumber(sheet.DC8) or 0) + (tonumber(sheet.DT8) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete8) or 0) * 100 - (tonumber(sheet.DC8) or 0);
        end);

    obj._e_event43 = obj.button35:addEventListener("onClick",
        function (event)
            if self.cmbInimigo8.text == sheet.NomeJ1 then			
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete8) or 0)
            					end;
            
            					if self.cmbInimigo8.text == sheet.NomeJ2 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete8) or 0)
            					end;				 
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ3 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete8) or 0)
            					end;	
            
            					if self.cmbInimigo8.text == sheet.NomeJ4 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete8) or 0)
            					end;
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ5 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete8) or 0)
            					end;			 
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ6 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete8) or 0)
            					end;
            
            					if self.cmbInimigo8.text == sheet.NomeJ7 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete8) or 0)
            					end;
            					 
            					if self.cmbInimigo8.text == sheet.NomeJ8 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete8) or 0)
            					end;	
            
            					if self.cmbInimigo8.text == sheet.NomeJ9 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete8) or 0)
            					end;
            					
            					if self.cmbInimigo8.text == sheet.NomeJ10 then
            						sheet.Macete8 = (tonumber(sheet.DanoJ8) or 0) + (tonumber(sheet.BuffDNJ8) or 0)
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete8) or 0)
            					end;
            					 
            					sheet.DC8 = (tonumber(sheet.Macete8) or 0)
            					sheet.CI8 = (tonumber(sheet.DC8) or 0) * 2
            					sheet.DT8 = (tonumber(sheet.DC8) or 0) + (tonumber(sheet.DT8) or 0)
        end);

    obj._e_event44 = obj.button36:addEventListener("onClick",
        function (event)
            self.PopJ9:show();
        end);

    obj._e_event45 = obj.btnPopREDPJ9:addEventListener("onClick",
        function (event)
            self.popDefREDPJ9:show('center', self.btnPopREDPJ9);
        end);

    obj._e_event46 = obj.button37:addEventListener("onClick",
        function (event)
            if self.cmbInimigo9.text == sheet.NomeJ1 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)	
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					end;
            
            					if self.cmbInimigo9.text == sheet.NomeJ2 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					end;				 
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ3 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					end;	
            
            					if self.cmbInimigo9.text == sheet.NomeJ4 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					end;
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ5 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					end;			 
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ6 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					end;	 
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ7 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					end;			 
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ8 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					end;	
            
            					if self.cmbInimigo9.text == sheet.NomeJ9 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					end;
            					
            					if self.cmbInimigo9.text == sheet.NomeJ10 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					end;
            					 
            					sheet.DC9 = (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.Sobra9) or 0)
            					sheet.CI9 = (tonumber(sheet.DC9) or 0) * 2
            					sheet.DT9 = (tonumber(sheet.DC9) or 0) + (tonumber(sheet.DT9) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete9) or 0) * 100 - (tonumber(sheet.DC9) or 0);
        end);

    obj._e_event47 = obj.button38:addEventListener("onClick",
        function (event)
            if self.cmbInimigo9.text == sheet.NomeJ1 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)				 				 
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					end;
            
            					if self.cmbInimigo9.text == sheet.NomeJ2 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					end;				 
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ3 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					end;	
            
            					if self.cmbInimigo9.text == sheet.NomeJ4 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					end;
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ5 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					end;			 
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ6 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					end;	
            
            					if self.cmbInimigo9.text == sheet.NomeJ7 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					end;			 
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ8 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					end;	
            
            					if self.cmbInimigo9.text == sheet.NomeJ9 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					end;
            					
            					if self.cmbInimigo9.text == sheet.NomeJ10 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.Macete9 = (tonumber(sheet.Macete9) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					end;
            					 
            					sheet.DC9 = (tonumber(sheet.Macete9) or 0) * (tonumber(sheet.SobraR9) or 0)
            					sheet.CI9 = (tonumber(sheet.DC9) or 0) * 2
            					sheet.DT9 = (tonumber(sheet.DC9) or 0) + (tonumber(sheet.DT9) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete9) or 0) * 100 - (tonumber(sheet.DC9) or 0);
        end);

    obj._e_event48 = obj.button39:addEventListener("onClick",
        function (event)
            if self.cmbInimigo9.text == sheet.NomeJ1 then			
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete9) or 0)
            					end;
            
            					if self.cmbInimigo9.text == sheet.NomeJ2 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete9) or 0)
            					end;				 
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ3 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete9) or 0)
            					end;	
            
            					if self.cmbInimigo9.text == sheet.NomeJ4 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete9) or 0)
            					end;
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ5 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete9) or 0)
            					end;			 
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ6 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete9) or 0)
            					end;
            
            					if self.cmbInimigo9.text == sheet.NomeJ7 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete9) or 0)
            					end;
            					 
            					if self.cmbInimigo9.text == sheet.NomeJ8 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete9) or 0)
            					end;
            
            					if self.cmbInimigo9.text == sheet.NomeJ9 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete9) or 0)
            					end;
            					
            					if self.cmbInimigo9.text == sheet.NomeJ10 then
            						sheet.Macete9 = (tonumber(sheet.DanoJ9) or 0) + (tonumber(sheet.BuffDNJ9) or 0)
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete9) or 0)
            					end;
            					 
            					sheet.DC9 = (tonumber(sheet.Macete9) or 0)
            					sheet.CI9 = (tonumber(sheet.DC9) or 0) * 2
            					sheet.DT9 = (tonumber(sheet.DC9) or 0) + (tonumber(sheet.DT9) or 0)
        end);

    obj._e_event49 = obj.button40:addEventListener("onClick",
        function (event)
            self.PopJ10:show();
        end);

    obj._e_event50 = obj.btnPopREDPJ10:addEventListener("onClick",
        function (event)
            self.popDefREDPJ10:show('center', self.btnPopREDPJ10);
        end);

    obj._e_event51 = obj.button41:addEventListener("onClick",
        function (event)
            if self.cmbInimigo10.text == sheet.NomeJ1 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)	
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					end;
            
            					if self.cmbInimigo10.text == sheet.NomeJ2 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					end;				 
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ3 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					end;	
            
            					if self.cmbInimigo10.text == sheet.NomeJ4 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					end;
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ5 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					end;			 
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ6 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					end;	 
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ7 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					end;			 
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ8 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					end;	
            
            					if self.cmbInimigo10.text == sheet.NomeJ9 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					end;
            					
            					if self.cmbInimigo10.text == sheet.NomeJ10 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					end;
            					 
            					sheet.DC10 = (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.Sobra10) or 0)
            					sheet.CI10 = (tonumber(sheet.DC10) or 0) * 2
            					sheet.DT10 = (tonumber(sheet.DC10) or 0) + (tonumber(sheet.DT10) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete10) or 0) * 100 - (tonumber(sheet.DC10) or 0);
        end);

    obj._e_event52 = obj.button42:addEventListener("onClick",
        function (event)
            if self.cmbInimigo10.text == sheet.NomeJ1 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)				 				 
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					end;
            
            					if self.cmbInimigo10.text == sheet.NomeJ2 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					end;				 
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ3 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					end;	
            
            					if self.cmbInimigo10.text == sheet.NomeJ4 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					end;
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ5 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					end;			 
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ6 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					end;	
            
            					if self.cmbInimigo10.text == sheet.NomeJ7 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					end;			 
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ8 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					end;	
            
            					if self.cmbInimigo10.text == sheet.NomeJ9 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					end;
            					
            					if self.cmbInimigo10.text == sheet.NomeJ10 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.Macete10 = (tonumber(sheet.Macete10) or 0) /100
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					end;
            					
            					sheet.DC10 = (tonumber(sheet.Macete10) or 0) * (tonumber(sheet.SobraR10) or 0)
            					sheet.CI10 = (tonumber(sheet.DC10) or 0) * 2
            					sheet.DT10 = (tonumber(sheet.DC10) or 0) + (tonumber(sheet.DT10) or 0)
            					 
            					sheet.Reduzido = (tonumber(sheet.Reduzido) or 0) + (tonumber(sheet.Macete10) or 0) * 100 - (tonumber(sheet.DC10) or 0);
        end);

    obj._e_event53 = obj.button43:addEventListener("onClick",
        function (event)
            if self.cmbInimigo10.text == sheet.NomeJ1 then			
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.VIDAJ1 = (tonumber(sheet.VIDAJ1) or 0) - (tonumber(sheet.Macete10) or 0)
            					end;
            
            					if self.cmbInimigo10.text == sheet.NomeJ2 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.VIDAJ2 = (tonumber(sheet.VIDAJ2) or 0) - (tonumber(sheet.Macete10) or 0)
            					end;				 
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ3 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.VIDAJ3 = (tonumber(sheet.VIDAJ3) or 0) - (tonumber(sheet.Macete10) or 0)
            					end;	
            
            					if self.cmbInimigo10.text == sheet.NomeJ4 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.VIDAJ4 = (tonumber(sheet.VIDAJ4) or 0) - (tonumber(sheet.Macete10) or 0)
            					end;
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ5 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.VIDAJ5 = (tonumber(sheet.VIDAJ5) or 0) - (tonumber(sheet.Macete10) or 0)
            					end;			 
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ6 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.VIDAJ6 = (tonumber(sheet.VIDAJ6) or 0) - (tonumber(sheet.Macete10) or 0)
            					end;
            
            					if self.cmbInimigo10.text == sheet.NomeJ7 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.VIDAJ7 = (tonumber(sheet.VIDAJ7) or 0) - (tonumber(sheet.Macete10) or 0)
            					end;
            					 
            					if self.cmbInimigo10.text == sheet.NomeJ8 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.VIDAJ8 = (tonumber(sheet.VIDAJ8) or 0) - (tonumber(sheet.Macete10) or 0)
            					end;
            
            					if self.cmbInimigo10.text == sheet.NomeJ9 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.VIDAJ9 = (tonumber(sheet.VIDAJ9) or 0) - (tonumber(sheet.Macete10) or 0)
            					end;
            					
            					if self.cmbInimigo10.text == sheet.NomeJ10 then
            						sheet.Macete10 = (tonumber(sheet.DanoJ10) or 0) + (tonumber(sheet.BuffDNJ10) or 0)
            						sheet.VIDAJ10 = (tonumber(sheet.VIDAJ10) or 0) - (tonumber(sheet.Macete10) or 0)
            					end;
            					 
            					sheet.DC10 = (tonumber(sheet.Macete10) or 0)
            					sheet.CI10 = (tonumber(sheet.DC10) or 0) * 2
            					sheet.DT10 = (tonumber(sheet.DC10) or 0) + (tonumber(sheet.DT10) or 0)
        end);

    obj._e_event54 = obj.button44:addEventListener("onClick",
        function (event)
            sheet.turno = 0
            				
            				sheet.NomeJ1 = 0
            				sheet.DanoJ1 = 0
            				sheet.BuffDNJ1 = 0
            				sheet.ReducaoJ1 = 0
            				sheet.BuffReduJ1 = 0
            				sheet.DefesaAlvo1 = 0
            				sheet.BuffDefesaAlvo1 = 0
            				sheet.ResistenciaAlvo1 = 0
            				sheet.BuffResistenciaAlvo1 = 0
            				sheet.DefesaJ1 = 0
            				sheet.BuffDefJ1 = 0
            				sheet.ResistenciaJ1 = 0
            				sheet.BuffResisJ1 = 0
            				sheet.DC1 = 0
            				sheet.DT1 = 0
            				sheet.TJ1 = 0
            				sheet.CI1 = 0
            				sheet.VIDAJ1 = 0
            				sheet.VI1 = 0
            				sheet.Sobra1 = 0
            				sheet.TR1 = 0
            				sheet.Macete1 = 0
            				
            				sheet.NomeJ2 = 0
            				sheet.DanoJ2 = 0
            				sheet.BuffDNJ2 = 0
            				sheet.ReducaoJ2 = 0
            				sheet.BuffReduJ2 = 0
            				sheet.DefesaAlvo2 = 0
            				sheet.BuffDefesaAlvo2 = 0
            				sheet.ResistenciaAlvo2 = 0
            				sheet.BuffResistenciaAlvo2 = 0
            				sheet.DefesaJ2 = 0
            				sheet.BuffDefJ2 = 0
            				sheet.ResistenciaJ2 = 0
            				sheet.BuffResisJ2 = 0
            				sheet.DC2 = 0
            				sheet.DT2 = 0
            				sheet.TJ2 = 0
            				sheet.CI2 = 0
            				sheet.VIDAJ2 = 0
            				sheet.VI2 = 0
            				sheet.Sobra2 = 0
            				sheet.TR2 = 0
            				sheet.Macete2 = 0
            				
            				sheet.NomeJ3 = 0
            				sheet.DanoJ3 = 0
            				sheet.BuffDNJ3 = 0
            				sheet.ReducaoJ3 = 0
            				sheet.BuffReduJ3 = 0
            				sheet.DefesaAlvo3 = 0
            				sheet.BuffDefesaAlvo3 = 0
            				sheet.ResistenciaAlvo3 = 0
            				sheet.BuffResistenciaAlvo3 = 0
            				sheet.DefesaJ3 = 0
            				sheet.BuffDefJ3 = 0
            				sheet.ResistenciaJ3 = 0
            				sheet.BuffResisJ3 = 0
            				sheet.DC3 = 0
            				sheet.DT3 = 0
            				sheet.TJ3 = 0
            				sheet.CI3 = 0
            				sheet.VIDAJ3 = 0
            				sheet.VI3 = 0
            				sheet.Sobra3 = 0
            				sheet.TR3 = 0
            				sheet.Macete3 = 0
            				
            				sheet.NomeJ4 = 0
            				sheet.DanoJ4 = 0
            				sheet.BuffDNJ4 = 0
            				sheet.ReducaoJ4 = 0
            				sheet.BuffReduJ4 = 0
            				sheet.DefesaAlvo4 = 0
            				sheet.BuffDefesaAlvo4 = 0
            				sheet.ResistenciaAlvo4 = 0
            				sheet.BuffResistenciaAlvo4 = 0
            				sheet.DefesaJ4 = 0
            				sheet.BuffDefJ4 = 0
            				sheet.ResistenciaJ4 = 0
            				sheet.BuffResisJ4 = 0
            				sheet.DC4 = 0
            				sheet.DT4 = 0
            				sheet.TJ4 = 0
            				sheet.CI4 = 0
            				sheet.VIDAJ4 = 0
            				sheet.VI4 = 0
            				sheet.Sobra4 = 0
            				sheet.TR4 = 0
            				sheet.Macete4 = 0
            				
            				sheet.NomeJ5 = 0
            				sheet.DanoJ5 = 0
            				sheet.BuffDNJ5 = 0
            				sheet.ReducaoJ5 = 0
            				sheet.BuffReduJ5 = 0
            				sheet.DefesaAlvo5 = 0
            				sheet.BuffDefesaAlvo5 = 0
            				sheet.ResistenciaAlvo5 = 0
            				sheet.BuffResistenciaAlvo5 = 0
            				sheet.DefesaJ5 = 0
            				sheet.BuffDefJ5 = 0
            				sheet.ResistenciaJ5 = 0
            				sheet.BuffResisJ5 = 0
            				sheet.DC5 = 0
            				sheet.DT5 = 0
            				sheet.TJ5 = 0
            				sheet.CI5 = 0
            				sheet.VIDAJ5 = 0
            				sheet.VI5 = 0
            				sheet.Sobra5 = 0
            				sheet.TR5 = 0
            				sheet.Macete5 = 0
            				
            				sheet.NomeJ6 = 0
            				sheet.DanoJ6 = 0
            				sheet.BuffDNJ6 = 0
            				sheet.ReducaoJ6 = 0
            				sheet.BuffReduJ6 = 0
            				sheet.DefesaAlvo6 = 0
            				sheet.BuffDefesaAlvo6 = 0
            				sheet.ResistenciaAlvo6 = 0
            				sheet.BuffResistenciaAlvo6 = 0
            				sheet.DefesaJ6 = 0
            				sheet.BuffDefJ6 = 0
            				sheet.ResistenciaJ6 = 0
            				sheet.BuffResisJ6 = 0
            				sheet.DC6 = 0
            				sheet.DT6 = 0
            				sheet.TJ6 = 0
            				sheet.CI6 = 0
            				sheet.VIDAJ6 = 0
            				sheet.VI6 = 0
            				sheet.Sobra6 = 0
            				sheet.TR6 = 0
            				sheet.Macete6 = 0
            				
            				sheet.NomeJ7 = 0
            				sheet.DanoJ7 = 0
            				sheet.BuffDNJ7 = 0
            				sheet.ReducaoJ7 = 0
            				sheet.BuffReduJ7 = 0
            				sheet.DefesaAlvo7 = 0
            				sheet.BuffDefesaAlvo7 = 0
            				sheet.ResistenciaAlvo7 = 0
            				sheet.BuffResistenciaAlvo7 = 0
            				sheet.DefesaJ7 = 0
            				sheet.BuffDefJ7 = 0
            				sheet.ResistenciaJ7 = 0
            				sheet.BuffResisJ7 = 0
            				sheet.DC7 = 0
            				sheet.DT7 = 0
            				sheet.TJ7 = 0
            				sheet.CI7 = 0
            				sheet.VIDAJ7 = 0
            				sheet.VI7 = 0
            				sheet.Sobra7 = 0
            				sheet.TR7 = 0
            				sheet.Macete7 = 0
            				
            				sheet.NomeJ8 = 0
            				sheet.DanoJ8 = 0
            				sheet.BuffDNJ8 = 0
            				sheet.ReducaoJ8 = 0
            				sheet.BuffReduJ8 = 0
            				sheet.DefesaAlvo8 = 0
            				sheet.BuffDefesaAlvo8 = 0
            				sheet.ResistenciaAlvo8 = 0
            				sheet.BuffResistenciaAlvo8 = 0
            				sheet.DefesaJ8 = 0
            				sheet.BuffDefJ8 = 0
            				sheet.ResistenciaJ8 = 0
            				sheet.BuffResisJ8 = 0
            				sheet.DC8 = 0
            				sheet.DT8 = 0
            				sheet.TJ8 = 0
            				sheet.CI8 = 0
            				sheet.VIDAJ8 = 0
            				sheet.VI8 = 0
            				sheet.Sobra8 = 0
            				sheet.TR8 = 0
            				sheet.Macete8 = 0
            				
            				sheet.NomeJ9 = 0
            				sheet.DanoJ9 = 0
            				sheet.BuffDNJ9 = 0
            				sheet.ReducaoJ9 = 0
            				sheet.BuffReduJ9 = 0
            				sheet.DefesaAlvo9 = 0
            				sheet.BuffDefesaAlvo9 = 0
            				sheet.ResistenciaAlvo9 = 0
            				sheet.BuffResistenciaAlvo9 = 0
            				sheet.DefesaJ9 = 0
            				sheet.BuffDefJ9 = 0
            				sheet.ResistenciaJ9 = 0
            				sheet.BuffResisJ9 = 0
            				sheet.DC9 = 0
            				sheet.DT9 = 0
            				sheet.TJ9 = 0
            				sheet.CI9 = 0
            				sheet.VIDAJ9 = 0
            				sheet.VI9 = 0
            				sheet.Sobra9 = 0
            				sheet.TR9 = 0
            				sheet.Macete9 = 0
            				
            				sheet.NomeJ10 = 0
            				sheet.DanoJ10 = 0
            				sheet.BuffDNJ10 = 0
            				sheet.ReducaoJ10 = 0
            				sheet.BuffReduJ10 = 0
            				sheet.DefesaAlvo10 = 0
            				sheet.BuffDefesaAlvo10 = 0
            				sheet.ResistenciaAlvo10 = 0
            				sheet.BuffResistenciaAlvo10 = 0
            				sheet.DefesaJ10 = 0
            				sheet.BuffDefJ10 = 0
            				sheet.ResistenciaJ10 = 0
            				sheet.BuffResisJ10 = 0
            				sheet.DC10 = 0
            				sheet.DT10 = 0
            				sheet.TJ10 = 0
            				sheet.CI10 = 0
            				sheet.VIDAJ10 = 0
            				sheet.VI10 = 0
            				sheet.Sobra10 = 0
            				sheet.TR10 = 0
            				sheet.Macete10 = 0
            				
            				sheet.Reduzido = 0 
            				sheet.Curado = 0
        end);

    obj._e_event55 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            ColocarNomes();
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
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

        if self.label213 ~= nil then self.label213:destroy(); self.label213 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label218 ~= nil then self.label218:destroy(); self.label218 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label245 ~= nil then self.label245:destroy(); self.label245 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label240 ~= nil then self.label240:destroy(); self.label240 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.btnPopREDPJ8 ~= nil then self.btnPopREDPJ8:destroy(); self.btnPopREDPJ8 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.cmbInimigo10 ~= nil then self.cmbInimigo10:destroy(); self.cmbInimigo10 = nil; end;
        if self.btnPopREDPJ3 ~= nil then self.btnPopREDPJ3:destroy(); self.btnPopREDPJ3 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.PopJ8 ~= nil then self.PopJ8:destroy(); self.PopJ8 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.btnPopREDPJ6 ~= nil then self.btnPopREDPJ6:destroy(); self.btnPopREDPJ6 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.PopJ2 ~= nil then self.PopJ2:destroy(); self.PopJ2 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.PopJ7 ~= nil then self.PopJ7:destroy(); self.PopJ7 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.label209 ~= nil then self.label209:destroy(); self.label209 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.cmbInimigo2 ~= nil then self.cmbInimigo2:destroy(); self.cmbInimigo2 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.label203 ~= nil then self.label203:destroy(); self.label203 = nil; end;
        if self.cmbInimigo5 ~= nil then self.cmbInimigo5:destroy(); self.cmbInimigo5 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label206 ~= nil then self.label206:destroy(); self.label206 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.cmbInimigo8 ~= nil then self.cmbInimigo8:destroy(); self.cmbInimigo8 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label192 ~= nil then self.label192:destroy(); self.label192 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.label221 ~= nil then self.label221:destroy(); self.label221 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.label195 ~= nil then self.label195:destroy(); self.label195 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.label231 ~= nil then self.label231:destroy(); self.label231 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.PopJ10 ~= nil then self.PopJ10:destroy(); self.PopJ10 = nil; end;
        if self.label224 ~= nil then self.label224:destroy(); self.label224 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label210 ~= nil then self.label210:destroy(); self.label210 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.label215 ~= nil then self.label215:destroy(); self.label215 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.label247 ~= nil then self.label247:destroy(); self.label247 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.label242 ~= nil then self.label242:destroy(); self.label242 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.btnPopREDPJ1 ~= nil then self.btnPopREDPJ1:destroy(); self.btnPopREDPJ1 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.btnPopREDPJ4 ~= nil then self.btnPopREDPJ4:destroy(); self.btnPopREDPJ4 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.PopJ4 ~= nil then self.PopJ4:destroy(); self.PopJ4 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.popDefREDPJ5 ~= nil then self.popDefREDPJ5:destroy(); self.popDefREDPJ5 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.label205 ~= nil then self.label205:destroy(); self.label205 = nil; end;
        if self.popDefREDPJ2 ~= nil then self.popDefREDPJ2:destroy(); self.popDefREDPJ2 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label229 ~= nil then self.label229:destroy(); self.label229 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label232 ~= nil then self.label232:destroy(); self.label232 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.label227 ~= nil then self.label227:destroy(); self.label227 = nil; end;
        if self.label237 ~= nil then self.label237:destroy(); self.label237 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.label238 ~= nil then self.label238:destroy(); self.label238 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.label212 ~= nil then self.label212:destroy(); self.label212 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.label217 ~= nil then self.label217:destroy(); self.label217 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label241 ~= nil then self.label241:destroy(); self.label241 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.btnPopREDPJ9 ~= nil then self.btnPopREDPJ9:destroy(); self.btnPopREDPJ9 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.btnPopREDPJ7 ~= nil then self.btnPopREDPJ7:destroy(); self.btnPopREDPJ7 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.PopJ1 ~= nil then self.PopJ1:destroy(); self.PopJ1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.PopJ6 ~= nil then self.PopJ6:destroy(); self.PopJ6 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.cmbInimigo3 ~= nil then self.cmbInimigo3:destroy(); self.cmbInimigo3 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.label200 ~= nil then self.label200:destroy(); self.label200 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.popDefREDPJ7 ~= nil then self.popDefREDPJ7:destroy(); self.popDefREDPJ7 = nil; end;
        if self.cmbInimigo6 ~= nil then self.cmbInimigo6:destroy(); self.cmbInimigo6 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label207 ~= nil then self.label207:destroy(); self.label207 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label198 ~= nil then self.label198:destroy(); self.label198 = nil; end;
        if self.cmbInimigo9 ~= nil then self.cmbInimigo9:destroy(); self.cmbInimigo9 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.popDefREDPJ9 ~= nil then self.popDefREDPJ9:destroy(); self.popDefREDPJ9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label193 ~= nil then self.label193:destroy(); self.label193 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.label196 ~= nil then self.label196:destroy(); self.label196 = nil; end;
        if self.label222 ~= nil then self.label222:destroy(); self.label222 = nil; end;
        if self.label230 ~= nil then self.label230:destroy(); self.label230 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label225 ~= nil then self.label225:destroy(); self.label225 = nil; end;
        if self.label235 ~= nil then self.label235:destroy(); self.label235 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label214 ~= nil then self.label214:destroy(); self.label214 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label219 ~= nil then self.label219:destroy(); self.label219 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label244 ~= nil then self.label244:destroy(); self.label244 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.label243 ~= nil then self.label243:destroy(); self.label243 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.btnPopREDPJ2 ~= nil then self.btnPopREDPJ2:destroy(); self.btnPopREDPJ2 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.PopJ9 ~= nil then self.PopJ9:destroy(); self.PopJ9 = nil; end;
        if self.btnPopREDPJ5 ~= nil then self.btnPopREDPJ5:destroy(); self.btnPopREDPJ5 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.popDefREDPJ10 ~= nil then self.popDefREDPJ10:destroy(); self.popDefREDPJ10 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.PopJ3 ~= nil then self.PopJ3:destroy(); self.PopJ3 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.label208 ~= nil then self.label208:destroy(); self.label208 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.btnPopREDPJ10 ~= nil then self.btnPopREDPJ10:destroy(); self.btnPopREDPJ10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.popDefREDPJ4 ~= nil then self.popDefREDPJ4:destroy(); self.popDefREDPJ4 = nil; end;
        if self.cmbInimigo1 ~= nil then self.cmbInimigo1:destroy(); self.cmbInimigo1 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.label202 ~= nil then self.label202:destroy(); self.label202 = nil; end;
        if self.popDefREDPJ1 ~= nil then self.popDefREDPJ1:destroy(); self.popDefREDPJ1 = nil; end;
        if self.cmbInimigo4 ~= nil then self.cmbInimigo4:destroy(); self.cmbInimigo4 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.label220 ~= nil then self.label220:destroy(); self.label220 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label194 ~= nil then self.label194:destroy(); self.label194 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label236 ~= nil then self.label236:destroy(); self.label236 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label211 ~= nil then self.label211:destroy(); self.label211 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label216 ~= nil then self.label216:destroy(); self.label216 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.label246 ~= nil then self.label246:destroy(); self.label246 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.PopJ5 ~= nil then self.PopJ5:destroy(); self.PopJ5 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.label201 ~= nil then self.label201:destroy(); self.label201 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.popDefREDPJ6 ~= nil then self.popDefREDPJ6:destroy(); self.popDefREDPJ6 = nil; end;
        if self.cmbInimigo7 ~= nil then self.cmbInimigo7:destroy(); self.cmbInimigo7 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.label204 ~= nil then self.label204:destroy(); self.label204 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.popDefREDPJ3 ~= nil then self.popDefREDPJ3:destroy(); self.popDefREDPJ3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.label199 ~= nil then self.label199:destroy(); self.label199 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.popDefREDPJ8 ~= nil then self.popDefREDPJ8:destroy(); self.popDefREDPJ8 = nil; end;
        if self.label228 ~= nil then self.label228:destroy(); self.label228 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.label197 ~= nil then self.label197:destroy(); self.label197 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label223 ~= nil then self.label223:destroy(); self.label223 = nil; end;
        if self.label233 ~= nil then self.label233:destroy(); self.label233 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.label226 ~= nil then self.label226:destroy(); self.label226 = nil; end;
        if self.label234 ~= nil then self.label234:destroy(); self.label234 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.label239 ~= nil then self.label239:destroy(); self.label239 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSCV4()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSCV4();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSCV4 = {
    newEditor = newfrmSCV4, 
    new = newfrmSCV4, 
    name = "frmSCV4", 
    dataType = "RRPG.DataTypeUnico.SCV4", 
    formType = "tablesDock", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Sistema de Combate Velen 4", 
    description=""};

frmSCV4 = _frmSCV4;
Firecast.registrarForm(_frmSCV4);
Firecast.registrarDataType(_frmSCV4);
Firecast.registrarSpecialForm(_frmSCV4);

return _frmSCV4;
