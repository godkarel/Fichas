require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItemDaLista3()
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
    obj:setName("frmItemDaLista3");
    obj:setHeight(50);
    obj:setTheme("dark");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({left=4, right=4, top=4, bottom=4});
    obj.layout1:setName("layout1");

    obj.imgIconSkill = GUI.fromHandle(_obj_newObject("image"));
    obj.imgIconSkill:setParent(obj.layout1);
    obj.imgIconSkill:setName("imgIconSkill");
    obj.imgIconSkill:setAlign("left");
    obj.imgIconSkill:setWidth(32);
    obj.imgIconSkill:setHeight(32);
    obj.imgIconSkill:setField("fldImgIconSkill");
    obj.imgIconSkill:setSRC("/imagens/tt.png	");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("client");
    obj.label1:setText("Teste de label");
    obj.label1:setFontColor("blue");
    obj.label1:setField("NomeHabilidade");
    obj.label1:setMargins({left=10});
    obj.label1:setName("label1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("NomeHabilidade");
    obj.dataLink1:setName("dataLink1");


		function ChecaLimiteUlt(Ficha)				
			if sheet.LevelHabilidade > 0 then
				if 6 > Ficha.Level then	
					showMessage('Level Menor');
					return "Menor6"
				end;
				if 6 > Ficha.Level then	
					showMessage('Level Menor');
					return "Menor6"
				end;
			end;			
		end;	
	


    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            if sheet.NomeHabilidade == nil then
            			self.imgIconSkill.src = "https://lh5.googleusercontent.com/70fWDStNEtNK1GnCCPTWFAs8rXkn3MpSHR1ML5qMg8eojU1_E15EB9HviSjfyr7ueuGikLsjeX3jvQwnEeTCRqD6jmRo_jzv7I0l2nN2daWRtoahkvIxjb-Kkx26YIWiuFw6eG2M"
            			sheet.fldImgIconSkill = "/imagens/tt.png"; 
            		end;
        end);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.imgIconSkill.width="32"
            			self.imgIconSkill.height="32"
            							
            			if sheet.NomeHabilidade == nil then
            				self.imgIconSkill.src = "https://lh5.googleusercontent.com/70fWDStNEtNK1GnCCPTWFAs8rXkn3MpSHR1ML5qMg8eojU1_E15EB9HviSjfyr7ueuGikLsjeX3jvQwnEeTCRqD6jmRo_jzv7I0l2nN2daWRtoahkvIxjb-Kkx26YIWiuFw6eG2M"
            				sheet.fldImgIconSkill = "/imagens/tt.png"; 
            			end;
            				
            			if sheet.NomeHabilidade == "Pulso Natural" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2gaeq-3ba8cb5f-4a82-43bd-93f0-7eacdaeac373.png/v1/fill/w_64,h_64,strp/1_pulsonatural_by_karelsama_df2gaeq-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjQiLCJwYXRoIjoiXC9mXC9kYjFjMzZhMC03OGFjLTRmYjctOThlYS0xYjBhYWU4NmNlMmNcL2RmMmdhZXEtM2JhOGNiNWYtNGE4Mi00M2JkLTkzZjAtN2VhY2RhZWFjMzczLnBuZyIsIndpZHRoIjoiPD02NCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.edD4MvHLcBAT0dGSJbmAXzL-ysnn_ARQUM8Ihy4NFMM"
            			end;
            			
            			if sheet.NomeHabilidade == "Totem de Fogo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2gaet-900655b7-b8ca-4d70-a4d3-1d2bca2feda4.png/v1/fill/w_64,h_64,strp/2_totemfogo_by_karelsama_df2gaet-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjQiLCJwYXRoIjoiXC9mXC9kYjFjMzZhMC03OGFjLTRmYjctOThlYS0xYjBhYWU4NmNlMmNcL2RmMmdhZXQtOTAwNjU1YjctYjhjYS00ZDcwLWE0ZDMtMWQyYmNhMmZlZGE0LnBuZyIsIndpZHRoIjoiPD02NCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.U0qQ95y46uu0Rjz9XP1Bd09u2U9sPlSSlD_0-BlGJFM"
            			end;
            			
            			if sheet.NomeHabilidade == "Terremoto" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2gaev-1b79b246-cf77-4d8d-aecf-7551738b0afe.png/v1/fill/w_64,h_64,strp/3_terremotto_by_karelsama_df2gaev-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjQiLCJwYXRoIjoiXC9mXC9kYjFjMzZhMC03OGFjLTRmYjctOThlYS0xYjBhYWU4NmNlMmNcL2RmMmdhZXYtMWI3OWIyNDYtY2Y3Ny00ZDhkLWFlY2YtNzU1MTczOGIwYWZlLnBuZyIsIndpZHRoIjoiPD02NCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.0qXSo-45E2yu8EL3x94OtczpBlGlBArWUkgz2Tx-K9g"
            			end;
            			
            			if sheet.NomeHabilidade == "Regeneração" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2gaez-9628a43d-1a35-4d85-a9a6-bef8cc0e658a.png/v1/fill/w_64,h_64,strp/4_regenerao_by_karelsama_df2gaez-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjQiLCJwYXRoIjoiXC9mXC9kYjFjMzZhMC03OGFjLTRmYjctOThlYS0xYjBhYWU4NmNlMmNcL2RmMmdhZXotOTYyOGE0M2QtMWEzNS00ZDg1LWE5YTYtYmVmOGNjMGU2NThhLnBuZyIsIndpZHRoIjoiPD02NCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.aPAtBW3sZ7iqvlELR5d-e8fP8hw7N6Mhnp1oJVbHNK4"
            			end;
            			
            			if sheet.NomeHabilidade == "Espirito Animal" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2gaf1-796bca0d-19e0-4260-ac54-d6dde311f685.png/v1/fill/w_32,h_32,q_80,strp/5_espiritoanimal_by_karelsama_df2gaf1-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzIiLCJwYXRoIjoiXC9mXC9kYjFjMzZhMC03OGFjLTRmYjctOThlYS0xYjBhYWU4NmNlMmNcL2RmMmdhZjEtNzk2YmNhMGQtMTllMC00MjYwLWFjNTQtZDZkZGUzMTFmNjg1LnBuZyIsIndpZHRoIjoiPD0zMiJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.CA8CsR1m0ZNz1Rt2YE9DcgnfRRvaEjQLAlJPvBGMQPM"
            				self.imgIconSkill.width="45"
            				self.imgIconSkill.height="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Totem de Mana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8h9i-18b943ef-db39-48a6-83ec-27463653f7ab.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOGg5aS0xOGI5NDNlZi1kYjM5LTQ4YTYtODNlYy0yNzQ2MzY1M2Y3YWIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.AqQ0X4JO-b-6u01PV70qDghxbQLNJ0nvI2HfraDFyPU"
            			end;
            			
            			if sheet.NomeHabilidade == "Totem da cura" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2gaf4-6820fe27-4d4c-423c-adc3-f5dfb258659c.png/v1/fill/w_64,h_64,strp/6_totemcura_by_karelsama_df2gaf4-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjQiLCJwYXRoIjoiXC9mXC9kYjFjMzZhMC03OGFjLTRmYjctOThlYS0xYjBhYWU4NmNlMmNcL2RmMmdhZjQtNjgyMGZlMjctNGQ0Yy00MjNjLWFkYzMtZjVkZmIyNTg2NTljLnBuZyIsIndpZHRoIjoiPD02NCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.O5GCnUhv_CuRnsmpNlWL8pxVXhmJWM5sjILqxzCHW2g"
            			end;
            			
            			if sheet.NomeHabilidade == "Espinhos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2gaf8-96090d7c-f02f-49f0-a32d-c7287e954fe9.png/v1/fill/w_64,h_64,strp/7_espinhos_by_karelsama_df2gaf8-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjQiLCJwYXRoIjoiXC9mXC9kYjFjMzZhMC03OGFjLTRmYjctOThlYS0xYjBhYWU4NmNlMmNcL2RmMmdhZjgtOTYwOTBkN2MtZjAyZi00OWYwLWEzMmQtYzcyODdlOTU0ZmU5LnBuZyIsIndpZHRoIjoiPD02NCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.Ij2u7Y_KniT4suOU5mtkiCnrLnofJy88ji_Vhqmk3D0"
            			end;
            			
            			if sheet.NomeHabilidade == "Vórtice da Natureza" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2gafa-aa01b23c-3248-49b1-a580-d3f652cccce3.png/v1/fill/w_101,h_101,q_80,strp/8_energianatural_by_karelsama_df2gafa-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTAxIiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjJnYWZhLWFhMDFiMjNjLTMyNDgtNDliMS1hNTgwLWQzZjY1MmNjY2NlMy5wbmciLCJ3aWR0aCI6Ijw9MTAxIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.629PNfvXXelHlCMW0mDBM2we8vwFQujWpabwkj2VOuQ"
            				self.imgIconSkill.width="45"
            				self.imgIconSkill.height="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Armadilha" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xgwc-a5a5c3fc-58e2-42e3-93dd-38ec8a4a32b9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGd3Yy1hNWE1YzNmYy01OGUyLTQyZTMtOTNkZC0zOGVjOGE0YTMyYjkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.X7uAt3I_HMl9AfFyCRZOzxjNicvCRlTnGD8cUQXnj0g"
            			end;
            			
            			if sheet.NomeHabilidade == "Flecha Poderosa" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xgw8-fde94bfd-cce5-4080-837b-18466a64cd93.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGd3OC1mZGU5NGJmZC1jY2U1LTQwODAtODM3Yi0xODQ2NmE2NGNkOTMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.x7N65Thes1c11vyatX_7T0c2PGh6snpcjv7vxevFgW0"
            			end;
            			
            			if sheet.NomeHabilidade == "Chuva de Flechas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xgw4-0327b627-139f-4378-ab17-88496c646192.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGd3NC0wMzI3YjYyNy0xMzlmLTQzNzgtYWIxNy04ODQ5NmM2NDYxOTIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.5svVlB3yzW5f_8L4vS4_N1Yvg_3Z93XVkx4BSHscdRQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Guarda Animal" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8x6o-8c518777-59cf-482a-85cb-cd391a15e36c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOHg2by04YzUxODc3Ny01OWNmLTQ4MmEtODVjYi1jZDM5MWExNWUzNmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.TiqbEIuIKmsY0Tl7b68LFq3cfqIZ6aDZt_ZH5pCesj0"
            			end;
            			
            			if sheet.NomeHabilidade == "Flecha Paralisante" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xgwg-59964434-c847-4f41-9492-df57268b148e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGd3Zy01OTk2NDQzNC1jODQ3LTRmNDEtOTQ5Mi1kZjU3MjY4YjE0OGUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.pWWcYRNvM-1WzAL-xyMmjpK3DxSgX8--OjnZjy0mVeo"
            				self.imgIconSkill.width="45"
            				self.imgIconSkill.height="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Rastreamento" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xgwh-d6d2a278-2a6f-47db-abc1-be4ed2aa2552.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGd3aC1kNmQyYTI3OC0yYTZmLTQ3ZGItYWJjMS1iZTRlZDJhYTI1NTIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.GnqdHnEEEvBSpk5ByXHyIY67s1Bohu8iK0alL545DyM"
            			end;
            			
            			if sheet.NomeHabilidade == "Destreza de Evasão" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8hds-2582b983-8467-4329-8376-d623f688cf1a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOGhkcy0yNTgyYjk4My04NDY3LTQzMjktODM3Ni1kNjIzZjY4OGNmMWEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.jqNhKXxv71muKYEssbL2mvckvHSq5HqT4TmoWQXsBMY"
            			end;
            			
            			if sheet.NomeHabilidade == "Tiro Triplo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3az40-4524b0ba-0dcf-4020-a55a-4c02fae88623.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXo0MC00NTI0YjBiYS0wZGNmLTQwMjAtYTU1YS00YzAyZmFlODg2MjMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.7QbwGJDaIIhRrxIEJMvFsy9tFhOcqKh39FmLsFGJyBY"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Dó" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xhe8-e7e93ca5-20aa-4891-b3d6-ef2e0b454bea.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGhlOC1lN2U5M2NhNS0yMGFhLTQ4OTEtYjNkNi1lZjJlMGI0NTRiZWEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.DAoYv-JyDXMO5kbGVEF7RbThI1Im7XU-BWhVNQW8Ie4"
            			end;
            			
            			if sheet.NomeHabilidade == "Ré" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xhdn-d2ca9b45-c563-45ee-9105-899c6cb672e5.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGhkbi1kMmNhOWI0NS1jNTYzLTQ1ZWUtOTEwNS04OTljNmNiNjcyZTUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.1K3c6HIOEYC1NmgV6mMQuH7DCIzSn80s61Zh09jiGrI"
            			end;
            			
            			if sheet.NomeHabilidade == "Mi" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xhdt-459ababb-1046-464b-8d0b-f99592dbfae0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGhkdC00NTlhYmFiYi0xMDQ2LTQ2NGItOGQwYi1mOTk1OTJkYmZhZTAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.KPdcDTx5bYi-vyE9Nd35IV-MT4dzENjyU0RBs0l3ux8"
            			end;
            			
            			if sheet.NomeHabilidade == "Fá" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xhdz-ce42467f-69b9-423d-99e5-6a498dfe0a80.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGhkei1jZTQyNDY3Zi02OWI5LTQyM2QtOTllNS02YTQ5OGRmZTBhODAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.pKfH7iw8kG_ipF_A4fK3V8cbpQV1Lg9WUZY72NFK1DY"
            			end;
            			
            			if sheet.NomeHabilidade == "Sol" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xhdb-6e3d096f-f7b0-41a8-a905-61d87601976c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGhkYi02ZTNkMDk2Zi1mN2IwLTQxYTgtYTkwNS02MWQ4NzYwMTk3NmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.uoi3RvxtBTsUoZL_wBN2TBjC_MlATz8ug51cvblCm_w"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Lá" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xhdw-45de8735-f71f-4754-acf9-d5cc73a49c63.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGhkdy00NWRlODczNS1mNzFmLTQ3NTQtYWNmOS1kNWNjNzNhNDljNjMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.XtqCJ1g3ItjIWYU6eANgsBq0v3b0oz9SZzNA8LW_vik"
            			end;
            			
            			if sheet.NomeHabilidade == "A Capella" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xhed-a305dae1-4b59-4846-8963-391209d102cf.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGhlZC1hMzA1ZGFlMS00YjU5LTQ4NDYtODk2My0zOTEyMDlkMTAyY2YucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.V7_jYQEQSol1khsp21y9MXD_gk1M7pHP0WrGl6D1TsE"
            			end;
            			
            			if sheet.NomeHabilidade == "Sí" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2xhdg-060557f2-5f2f-4139-9c36-57f56b2662c7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeGhkZy0wNjA1NTdmMi01ZjJmLTQxMzktOWMzNi01N2Y1NmIyNjYyYzcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.eWXzXWd22kFrMAtsNAamBtwAA0aJCAIjYF29u3OGlXE"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Fogo Divino" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zio4-4c647caa-d01c-46d7-84aa-7e652f9b8cd6.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyemlvNC00YzY0N2NhYS1kMDFjLTQ2ZDctODRhYS03ZTY1MmY5YjhjZDYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.lGNZVlEus_rgiaZn4vRHX8OkqKyFQ-dNEy_e5qxPlRA"
            			end;
            			
            			if sheet.NomeHabilidade == "Cura" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zinv-552c1113-21a6-463d-a331-ce515a2948c8.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyemludi01NTJjMTExMy0yMWE2LTQ2M2QtYTMzMS1jZTUxNWEyOTQ4YzgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.jM_qreH_wzCtsQxvODKu02-oqIvaO7t0YE4gZ471bhg"
            			end;
            			
            			if sheet.NomeHabilidade == "Sonhos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zinj-e0a5f932-20d0-4198-9930-b338eb062bdf.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyemluai1lMGE1ZjkzMi0yMGQwLTQxOTgtOTkzMC1iMzM4ZWIwNjJiZGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.QF32x_CtVji3ImvhACmLU4jOytxnRs6SzpZAbJ9k7v0"
            			end;
            			
            			if sheet.NomeHabilidade == "Curaga" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zinx-95fe7ef5-8428-43f0-81ea-88fb2e9031bc.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyemlueC05NWZlN2VmNS04NDI4LTQzZjAtODFlYS04OGZiMmU5MDMxYmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.f2d8OJbHzrSowy-pulVuC9lS3sSgNuGYsS3ePDWgEX0"
            			end;
            			
            			if sheet.NomeHabilidade == "Imunidade" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zint-96e1b4ea-b910-43e3-a538-80420783708c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyemludC05NmUxYjRlYS1iOTEwLTQzZTMtYTUzOC04MDQyMDc4MzcwOGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.frSxB1f_HWu7bqCciWkQvJiwY7pAK5AYm0eL4GcrPZQ"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Purificação" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zinq-9ba0cd35-05a6-40ef-8682-17fe292a2477.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyemlucS05YmEwY2QzNS0wNWE2LTQwZWYtODY4Mi0xN2ZlMjkyYTI0NzcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ioxqTUPTq51vVPMrqGdG7u8ijentcaceDfAkxhI8fws"
            			end;
            			
            			if sheet.NomeHabilidade == "Explosão Divina" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zio2-d16dde3b-fc43-4271-9d07-0977b225eb48.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyemlvMi1kMTZkZGUzYi1mYzQzLTQyNzEtOWQwNy0wOTc3YjIyNWViNDgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.mXprZud2JzkDbceyk4KUQZmKqyKhKqTwn8puStEJqUk"
            			end;
            			
            			if sheet.NomeHabilidade == "Reviver" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zinm-4c26d6f6-aa56-49eb-aee1-5195dca63e82.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyemlubS00YzI2ZDZmNi1hYTU2LTQ5ZWItYWVlMS01MTk1ZGNhNjNlODIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.rustAgJmsRGzZGrBdIuzsjqCsNDEwKwz2wJKjql_afU"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Labareda Abissal" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3okxh-ab2e7df9-3b92-4f77-b37b-fe6f5d6cf65b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzb2t4aC1hYjJlN2RmOS0zYjkyLTRmNzctYjM3Yi1mZTZmNWQ2Y2Y2NWIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.6zHpykrsvq0OZRBx7UOvWduNCOX3Ej_S1Ekl2jEpi2s"
            			end;
            			
            			if sheet.NomeHabilidade == "Hiperatividade Arcanja" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zz5t-c21d241d-cb81-4b15-b654-778a5e41d423.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeno1dC1jMjFkMjQxZC1jYjgxLTRiMTUtYjY1NC03NzhhNWU0MWQ0MjMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.nRV-uK82amAVj0qwejJWbH9115Yrnya4AZMm8OHrDug"
            			end;
            			
            			if sheet.NomeHabilidade == "Drenar Espirito" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zz5l-28cc1b49-d14d-4d11-a3da-3b95a528c557.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeno1bC0yOGNjMWI0OS1kMTRkLTRkMTEtYTNkYS0zYjk1YTUyOGM1NTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.aeI2zHpxqmun2jyibCJNnJ61X9FFeZpfWotAelgoV8o"
            			end;
            			
            			if sheet.NomeHabilidade == "Lamina das Trevas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zz5o-605b5ec6-635c-45cb-861d-ebd76558296a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeno1by02MDViNWVjNi02MzVjLTQ1Y2ItODYxZC1lYmQ3NjU1ODI5NmEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.kct-nXwkVrzC0UJefW6ohjNPSF1ZGNmOvZgC-IzJWGA"
            			end;
            			
            			if sheet.NomeHabilidade == "Explosion" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zz5w-f312ff24-da4e-403e-b609-41d98722091f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeno1dy1mMzEyZmYyNC1kYTRlLTQwM2UtYjYwOS00MWQ5ODcyMjA5MWYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.tMHI1sUrJSdmAzPO5YSsoZ6zpVs7eA4C4yF59oQTnTY"
            			end;
            			
            			if sheet.NomeHabilidade == "Tiro Negro" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3okxl-0cba7478-4c2c-43a9-b666-6b24ec726a24.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzb2t4bC0wY2JhNzQ3OC00YzJjLTQzYTktYjY2Ni02YjI0ZWM3MjZhMjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.PophtYGKfWScb-j37U5ywKDt6zaaelFHhNF8R4iatt4"
            			end;
            			
            			if sheet.NomeHabilidade == "Imagem Espelhada" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zz5s-7f21c44c-15d4-452f-8b0f-635bf2561d35.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeno1cy03ZjIxYzQ0Yy0xNWQ0LTQ1MmYtOGIwZi02MzViZjI1NjFkMzUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.tTtuoM9Xh4e91N9BNdxb5q39RtQyQgfkJNgOpJgmJ04"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Roubar Cura" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zz5g-65887d4b-10c2-445d-afe9-3afa47cb02bb.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeno1Zy02NTg4N2Q0Yi0xMGMyLTQ0NWQtYWZlOS0zYWZhNDdjYjAyYmIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.6dlDbALur7umPuP2A_MxUfx5SFa0NLrB6jujW7bcFNg"
            			end;
            			
            			if sheet.NomeHabilidade == "Estilo de Combate Kamael" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zz5y-64899119-dbad-402b-9046-575b516ff973.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeno1eS02NDg5OTExOS1kYmFkLTQwMmItOTA0Ni01NzViNTE2ZmY5NzMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.rV0q-AfEd4AohMz94e4Tar0HVBAfgN5HjhSdDlkDszU"
            			end;
            			
            			if sheet.NomeHabilidade == "Roubar Buff" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df2zz5h-08e0998a-644f-49ee-93a9-82c2b1505c95.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYyeno1aC0wOGUwOTk4YS02NDRmLTQ5ZWUtOTNhOS04MmMyYjE1MDVjOTUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.hRBIgBLkNkoNS5uhpergF0OQxrTcgZA5pW-rSy4rnv0"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Corte Fatal" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3006p-a64cab77-8b08-4658-9f1f-6760786375ac.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMDA2cC1hNjRjYWI3Ny04YjA4LTQ2NTgtOWYxZi02NzYwNzg2Mzc1YWMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ZdHSGrImzcuOU8RvE59nn9BtjNC9T6E_qSPO-MoC7zQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Grito de Vitória" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3006n-2c81dbcb-0ad4-4ba4-aad0-256c02264438.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMDA2bi0yYzgxZGJjYi0wYWQ0LTRiYTQtYWFkMC0yNTZjMDIyNjQ0MzgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ahhFn6KKnwO2rl_N9rq73-aeCmdKW3lirDY1pGhioiI"
            			end;
            			
            			if sheet.NomeHabilidade == "Regeneração Poderosa" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3006h-3e9281e6-5720-48bf-bf7b-fc701fc8e105.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMDA2aC0zZTkyODFlNi01NzIwLTQ4YmYtYmY3Yi1mYzcwMWZjOGUxMDUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.adS3KIhq5wd5BIwMSwtFQv6G6hX8wGU1D583r6B9b1s"
            			end;
            			
            			if sheet.NomeHabilidade == "Lançar Arma" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8hl1-3a69637c-509b-452c-b0f3-e21609185f4e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOGhsMS0zYTY5NjM3Yy01MDliLTQ1MmMtYjBmMy1lMjE2MDkxODVmNGUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Ppbxm3UeWtyjiQJhZ45f9mQRQHAMEE-AXm3yOZPYUrA"
            			end;
            			
            			if sheet.NomeHabilidade == "Imortalidade" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3006j-2c88e3ab-a2e0-4106-86f9-8be633746841.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMDA2ai0yYzg4ZTNhYi1hMmUwLTQxMDYtODZmOS04YmU2MzM3NDY4NDEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VNMH-o2or9cSk8YnYqwNCASwVLEm2RcFDRopY_FFZzc"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Sangramento" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3006g-5a129b62-1462-4ad5-82ee-4e91bb05cfc9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMDA2Zy01YTEyOWI2Mi0xNDYyLTRhZDUtODJlZS00ZTkxYmIwNWNmYzkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.L9Q3TDrwIRUl5HXESVjD9rZdcVGAbOuQu3EJIhCzNSQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Guardar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3006k-275e6814-961b-479c-8549-6b3cd8b1a80c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMDA2ay0yNzVlNjgxNC05NjFiLTQ3OWMtODU0OS02YjNjZDhiMWE4MGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.YkESFfXcpIJ44cY_Q5F7oXlHN3Md8_8g-Emebj-XNl4"
            			end;
            			
            			if sheet.NomeHabilidade == "Defender" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df926ni-6d6a0a7d-c139-4ada-b60f-0d600b0e6018.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGY5MjZuaS02ZDZhMGE3ZC1jMTM5LTRhZGEtYjYwZi0wZDYwMGIwZTYwMTgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.AdwBUJAvbLkYsHMymGRCxNm-llWUmfXwEScNeIfbvVs"
            			end;
            			
            			if sheet.NomeHabilidade == "Mestre da Batalha" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3006i-d543f1a6-a17a-49f7-9530-e1e0a57b8024.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMDA2aS1kNTQzZjFhNi1hMTdhLTQ5ZjctOTUzMC1lMWUwYTU3YjgwMjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VoyO4ilhozn-1vMo8kq0kMyq44APO0S-q6wsELwExrE"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Maestria com Adaga"	 then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31oo5-e21263b7-dacc-4eea-8d40-afaaf1a0b2be.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMW9vNS1lMjEyNjNiNy1kYWNjLTRlZWEtOGQ0MC1hZmFhZjFhMGIyYmUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.w1nyzbT2Cq-D-VDvWRAc0dZnA14N439JS4jjc4W2F1s	"
            			end;
            							
            			if sheet.NomeHabilidade == "Ponto Fraco" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31owl-7ec30c23-a1a2-4967-b836-43db9e0f459e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMW93bC03ZWMzMGMyMy1hMWEyLTQ5NjctYjgzNi00M2RiOWUwZjQ1OWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ifX9ybJj3zmVhwG_kBHHzDAfLyrgk3cyGwIcnnrPVdY"
            			end;
            			
            			if sheet.NomeHabilidade == "Jeito de Atacar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31ooi-07fa1ffd-dcc8-4152-a85c-4190e60bfb44.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMW9vaS0wN2ZhMWZmZC1kY2M4LTQxNTItYTg1Yy00MTkwZTYwYmZiNDQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.YP4RtvXhdRA0MNE2pLe9LpMhT3uiUChxhFgJb_jUlqY"
            			end;
            			
            			if sheet.NomeHabilidade == "Hemorragia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31oox-a5d2c6df-2114-4e39-ab47-b5d9449808fd.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMW9veC1hNWQyYzZkZi0yMTE0LTRlMzktYWI0Ny1iNWQ5NDQ5ODA4ZmQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ZBYdkJtIM69mcfnb9PGbpdib0KAf6ZZcrmTOUfxBmTI"
            			end;
            			
            			if sheet.NomeHabilidade == "Tiro no Pé" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31oo3-9b3c99e1-e055-43ce-85dc-5259431b8660.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMW9vMy05YjNjOTllMS1lMDU1LTQzY2UtODVkYy01MjU5NDMxYjg2NjAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.qJDUjz4UDEk4psLpjUzpB5Rlm2bU0KIj3QnmfAu3zig"
            			end;
            			
            			if sheet.NomeHabilidade == "Lançar Adaga" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31ooa-a533a40b-724f-47a4-80d0-51ce33e7b28f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMW9vYS1hNTMzYTQwYi03MjRmLTQ3YTQtODBkMC01MWNlMzNlN2IyOGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3G4phmMSF8PBFDyD6--pRyCEQgH6fWD4phC2NRgljO4"
            			end;
            			
            			if sheet.NomeHabilidade == "Bomba de Fumaça" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8hmo-5b51ac5a-a813-4d90-b21b-0e045e7c8151.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOGhtby01YjUxYWM1YS1hODEzLTRkOTAtYjIxYi0wZTA0NWU3YzgxNTEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.4vF09fRiulm8R3py4s7CBlkzChnRJBMwlEnTbA1B7gE"
            			end;
            			
            			if sheet.NomeHabilidade == "Vulto" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8hms-79352c66-822e-4e8c-a5ec-862fd83d129b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOGhtcy03OTM1MmM2Ni04MjJlLTRlOGMtYTVlYy04NjJmZDgzZDEyOWIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.j313ucGXgTr73r4FzgTt5clD2hJMdPZNyP3qqtuwlF0"
            			end;
            			
            			if sheet.NomeHabilidade == "Invisibilidade" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31ooq-a8f7afb6-25ed-4fff-9cb7-ce7f55d78f67.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMW9vcS1hOGY3YWZiNi0yNWVkLTRmZmYtOWNiNy1jZTdmNTVkNzhmNjcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.-KQbIrkxuQb3ZzQj3_MalCaSIULdjHyQNtUoNaOobAg"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Flash" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31op1-5b28dff2-c9df-4a30-b2b5-a17147ed2e17.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMW9wMS01YjI4ZGZmMi1jOWRmLTRhMzAtYjJiNS1hMTcxNDdlZDJlMTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Sw3GmFN8Y1CDJbtP1nNf7EThROPCrEi4ntQ072dZVz8"
            			end;
            			
            			if sheet.NomeHabilidade == "Combater com 2 Adagas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31op6-4aaef0f3-6d6b-4401-af9e-943fb1ef755c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMW9wNi00YWFlZjBmMy02ZDZiLTQ0MDEtYWY5ZS05NDNmYjFlZjc1NWMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.s4B4zCz4lkjEZXXr3sCJJt-3LIoAOtNRCesSypRGLAs"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Bola de Fogo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31x4f-42523372-803e-486c-831c-91e443e17a93.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMXg0Zi00MjUyMzM3Mi04MDNlLTQ4NmMtODMxYy05MWU0NDNlMTdhOTMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.d1k2B7U3ocEs3Gsh4grfaMli7OByAWYckG8zB6f6zAg"
            			end;
            			
            			if sheet.NomeHabilidade == "Congelar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31x44-aa37de84-fb74-40e5-9206-6675a23c77e7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMXg0NC1hYTM3ZGU4NC1mYjc0LTQwZTUtOTIwNi02Njc1YTIzYzc3ZTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.lmBLXqXOYu-Dx7MK3flvmIPm1Nar0uTqxKwkDf2Bio4"
            			end;
            			
            			if sheet.NomeHabilidade == "Explosão Arcana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31x4c-6a9ddb63-9d78-4b80-b40e-1b270494b03f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMXg0Yy02YTlkZGI2My05ZDc4LTRiODAtYjQwZS0xYjI3MDQ5NGIwM2YucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VlyPVmD64iHj7_LEv9b7N_ao6ATnyNqacrMpyMMB7Po"
            			end;
            			
            			if sheet.NomeHabilidade == "Queimar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31x42-b145b373-1d34-478b-a488-f8a4f6bd6c5f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMXg0Mi1iMTQ1YjM3My0xZDM0LTQ3OGItYTQ4OC1mOGE0ZjZiZDZjNWYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.5Y5BxgWazmJ53KGMnq_9zWfdaqqrSmDLKodipc6-6OQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Barreira Magica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31x48-fe00b3ab-181d-4e93-9fbf-f86c661ebe9f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMXg0OC1mZTAwYjNhYi0xODFkLTRlOTMtOWZiZi1mODZjNjYxZWJlOWYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.DaMjsRtGOIDFBaxL3wE7RSgS8nvc-tSu_8YaUz5m4ek"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Meditar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31x3y-340e7ed2-6264-41f5-8e95-ed539489c739.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMXgzeS0zNDBlN2VkMi02MjY0LTQxZjUtOGU5NS1lZDUzOTQ4OWM3MzkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.bgphvH3yiyCdlxWCq83bLHB9EEZU1H0TXOsY-M1-4Sw"
            			end;
            			
            			if sheet.NomeHabilidade == "Vampirismo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31x3t-fe653a06-463e-41de-8e3c-482604920fde.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMXgzdC1mZTY1M2EwNi00NjNlLTQxZGUtOGUzYy00ODI2MDQ5MjBmZGUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.tCYn-VyMrptj0Y8mYqndg0Grus7mgbpRkQi-Dt8QsFM"
            			end;
            			
            			if sheet.NomeHabilidade == "Meteoros" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df31x46-2f5379a2-6cfb-4e1b-8fef-62771aaae57b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzMXg0Ni0yZjUzNzlhMi02Y2ZiLTRlMWItOGZlZi02Mjc3MWFhYWU1N2IucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ZpipBdEVQIxtn_j_z16uPCMUiCst96-hgbUnWorgoYo"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Aparar Passivamente" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df34kw2-7aa5375c-a027-4a12-8857-7c664c589db3.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNGt3Mi03YWE1Mzc1Yy1hMDI3LTRhMTItODg1Ny03YzY2NGM1ODlkYjMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.hqOyMu4or3BOSYHsa11CXYzMmcux84209vn3yG6-a94"
            			end;
            			
            			if sheet.NomeHabilidade == "Dor" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df34kvq-88d6a285-502a-4992-b4da-e19a11a00927.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNGt2cS04OGQ2YTI4NS01MDJhLTQ5OTItYjRkYS1lMTlhMTFhMDA5MjcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.nZWQcIfcqYkAzd0CBnmqpMpevsfMUgbBbH6S_5FBPAU"
            			end;
            			
            			if sheet.NomeHabilidade == "Disparo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df34kvu-79e4002d-23dc-4cd1-9576-50b584693b29.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNGt2dS03OWU0MDAyZC0yM2RjLTRjZDEtOTU3Ni01MGI1ODQ2OTNiMjkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.p46LN7ADBDt3tizYj5P-DLOrTTTIfw-PdytHmTv_gso"
            			end;
            			
            			if sheet.NomeHabilidade == "Valsa da Lamina" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfebrep-0d59e55b-086a-47bc-b947-0b687bf61465.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlYnJlcC0wZDU5ZTU1Yi0wODZhLTQ3YmMtYjk0Ny0wYjY4N2JmNjE0NjUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.tR_KZO3mpvQXlQap6v2AJGnvvujJvbTkZGEtn9BcUTw"
            			end;
            			
            			if sheet.NomeHabilidade == "Dança da Lamina" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df34kvz-e4398f33-6aa3-4b4b-9d24-3e7f3f463f7b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNGt2ei1lNDM5OGYzMy02YWEzLTRiNGItOWQyNC0zZTdmM2Y0NjNmN2IucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dGAE2ADy9iG2nSp7gGbPONQqx51-yJ2v8it8Kx_L5_M"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Enfraquecer" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df34kvo-9c07c9a3-a864-4409-8214-2fd1d8273f96.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNGt2by05YzA3YzlhMy1hODY0LTQ0MDktODIxNC0yZmQxZDgyNzNmOTYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.i1DW9O-ZKvfSEARVy7fsm5DftER9RnXfvj9ufnqj7Qo"
            			end;
            			
            			if sheet.NomeHabilidade == "Dizimar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df34kvs-cb725461-e967-476f-8de7-79fd2477ce42.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNGt2cy1jYjcyNTQ2MS1lOTY3LTQ3NmYtOGRlNy03OWZkMjQ3N2NlNDIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.lkDqWdbgZKXYOrnvKxfwI59AAGtQa2A1G4xRqY6iRFY"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Punhos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df35xj1-8deccb1a-b4b9-4fcf-99eb-7e469b4fc4b3.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNXhqMS04ZGVjY2IxYS1iNGI5LTRmY2YtOTllYi03ZTQ2OWI0ZmM0YjMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.p0vaLn1fY3um_KKwO-ia9YspGxsGqHEPW8KYF_4C1B0"
            			end;
            			
            			if sheet.NomeHabilidade == "Ponto de Pressão" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df35xu2-ef3e6bd3-eeea-465b-93bc-844411f34c5b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNXh1Mi1lZjNlNmJkMy1lZWVhLTQ2NWItOTNiYy04NDQ0MTFmMzRjNWIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.1Vo7nqe4s772QCSB1soHMvkkITpgEFOs9_-DMTGnbDU"
            			end;
            			
            			if sheet.NomeHabilidade == "Onda de Socos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df35xj6-d0e2baeb-9bb8-480e-af24-42a19dd3caa9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNXhqNi1kMGUyYmFlYi05YmI4LTQ4MGUtYWYyNC00MmExOWRkM2NhYTkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.pPMkCnaMTmY6L7hyE5adNK1vY4oPnCFD3ceI1JW2F9w"
            			end;
            			
            			if sheet.NomeHabilidade == "Soco Astral" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3j0n9-1e766e87-72d9-45b9-81ac-b720e00b376e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzajBuOS0xZTc2NmU4Ny03MmQ5LTQ1YjktODFhYy1iNzIwZTAwYjM3NmUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._G_aCGp9wOwmngupeDP-iGTAA0RyQBu_sVdjVtiB77I	"
            			end;
            			
            			if sheet.NomeHabilidade == "Marcar Presa" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8xds-d7b4a0ec-e8b2-4077-8dd9-68776625ec27.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOHhkcy1kN2I0YTBlYy1lOGIyLTQwNzctOGRkOS02ODc3NjYyNWVjMjcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.iU3RFJJSVnzHvBgiJVFm-jmNAmq6qewm0m6nU0_a1LY"
            			end;
            			
            			if sheet.NomeHabilidade == "Chute Giratorio" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8xdk-7301cc05-b5f2-4921-be84-b334f7eb3fa1.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOHhkay03MzAxY2MwNS1iNWYyLTQ5MjEtYmU4NC1iMzM0ZjdlYjNmYTEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.amTZU7EdFm7Q7YXmngqXlaX7GAhb0fsb2Y-3LiAjYOU"
            			end;
            			
            			if sheet.NomeHabilidade == "Pressão Final" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfganq1-9e418193-a3a5-4082-afdd-76f7e09c9a46.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZnYW5xMS05ZTQxODE5My1hM2E1LTQwODItYWZkZC03NmY3ZTA5YzlhNDYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.LMFAOky3wYzewK6lMg7f2zRjssog6JKNj8wbuN4eDUk"
            			end;
            			
            			if sheet.NomeHabilidade == "Flash de Socos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df35xje-17725efe-e88a-466c-9906-15ea0d1501db.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNXhqZS0xNzcyNWVmZS1lODhhLTQ2NmMtOTkwNi0xNWVhMGQxNTAxZGIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.tUZTqhQixtC4VXEVmuIPDAVwqKzx7dAVNlwqVz7ucfE"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Espirito do Urso" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df35xjg-968b8ee5-8759-4f6e-8942-9aaa70bdc0ff.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNXhqZy05NjhiOGVlNS04NzU5LTRmNmUtODk0Mi05YWFhNzBiZGMwZmYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.su9zpxOog1aSPDiCBQasNGRLDzhKtiL_kA5UlLvhbB0"
            			end;
            			
            			if sheet.NomeHabilidade == "Ponto Mental" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df35xj3-3067a39f-9c58-4292-8a12-dd672d4e8e38.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzNXhqMy0zMDY3YTM5Zi05YzU4LTQyOTItOGExMi1kZDY3MmQ0ZThlMzgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Ne_SyhcsyfBjb4hdQV9Ddh9Eit72UxX0RHvsXohnx9U"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Cicatrizar Ferida" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df389bo-f97f00de-936e-46d8-a9c3-6dc2898b5c3e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzODliby1mOTdmMDBkZS05MzZlLTQ2ZDgtYTljMy02ZGMyODk4YjVjM2UucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3S19FLouthsaHCQMrT7cYYH6jg3xKbRi-sMC7gZf0sY"
            			end;
            			
            			if sheet.NomeHabilidade == "Golpe Divino" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8xgs-ac969be1-9fcb-41e4-a976-83b4fd499e7f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOHhncy1hYzk2OWJlMS05ZmNiLTQxZTQtYTk3Ni04M2I0ZmQ0OTllN2YucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.E04PhghVmwTyHKeforsYjXJPLKeQkZ8IJsWF3YLRsXw"
            			end;
            			
            			if sheet.NomeHabilidade == "Poder Divino" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8xgo-52f4cc4c-fb83-44ff-90bb-191f18bd7f24.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOHhnby01MmY0Y2M0Yy1mYjgzLTQ0ZmYtOTBiYi0xOTFmMThiZDdmMjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.SjNArIxF5lKKG_L_d9uV-rBuzc-ik9x7y28lrzEgc2w"
            			end;
            			
            			if sheet.NomeHabilidade == "Tornado Divino" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8xg7-5fb67909-a5d0-4efc-b15b-58108171a602.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOHhnNy01ZmI2NzkwOS1hNWQwLTRlZmMtYjE1Yi01ODEwODE3MWE2MDIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.KnXLeraERWjowYv_CMC1HegY9Pyo2Q1d0q6SscuXfsE"
            			end;
            			
            			if sheet.NomeHabilidade == "Julgamento do Céu" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df389bf-d578ef76-32a6-409b-a2b7-c38de3a5f3eb.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzODliZi1kNTc4ZWY3Ni0zMmE2LTQwOWItYTJiNy1jMzhkZTNhNWYzZWIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._yZ3MQ0QCCzSZGOUdwEduF0se-JlhlurzUR8Zr5JQt8"
            			end;
            			
            			if sheet.NomeHabilidade == "Benção Divina" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df389bv-efb2519b-94bf-49e3-baea-66346e1f8aae.png/v1/fit/w_150,h_150,q_70,strp/beno_divina_by_karelsama_df389bv-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTAwIiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjM4OWJ2LWVmYjI1MTliLTk0YmYtNDllMy1iYWVhLTY2MzQ2ZTFmOGFhZS5wbmciLCJ3aWR0aCI6Ijw9NTAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.E72T4Pco6n9wRKOQj2jHMd6TQfj1tctWXO2PR22QWzw"
            			end;
            			
            			if sheet.NomeHabilidade == "Defesa Absoluta" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df389bk-632af487-1aaa-41b0-93c3-4d40ec224841.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzODliay02MzJhZjQ4Ny0xYWFhLTQxYjAtOTNjMy00ZDQwZWMyMjQ4NDEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.QEwFvVKf-VUnT4Q_6LeQ7u4Bm36JzwfAOUmVk-N2FI0"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Critical Stum" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df389bq-bec4c013-3cf6-446c-8038-5697a657960c.png/v1/fit/w_150,h_150,q_70,strp/critical_stum_by_karelsama_df389bq-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjU2IiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjM4OWJxLWJlYzRjMDEzLTNjZjYtNDQ2Yy04MDM4LTU2OTdhNjU3OTYwYy5wbmciLCJ3aWR0aCI6Ijw9MjU2In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.xp15zavPNPVRmXwXrgTINzTNxRFCR37jFvbI288r_Aw"					
            			end;
            			
            			if sheet.NomeHabilidade == "Toque da Vida" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df389bc-1c2bb96a-d0c0-4213-8dba-35bd9935fa97.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzODliYy0xYzJiYjk2YS1kMGMwLTQyMTMtOGRiYS0zNWJkOTkzNWZhOTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.m-oL7V9Y_Q3EtQyXiPM5emoCDj7S2XAt82kiXAJZUsU"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Metamorfose Pantera" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df38ado-18ebcae3-ea23-4aa2-b41a-d08fe006ea5c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzOGFkby0xOGViY2FlMy1lYTIzLTRhYTItYjQxYS1kMDhmZTAwNmVhNWMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.YEod-l42HbURZPLc7VQR6gnmjHradEfj4RqwWv9Slkg"
            			end;
            			
            			if sheet.NomeHabilidade == "Metamorfose Urso" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df38adl-827e997c-7c45-4aa8-adb3-211df6da6632.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzOGFkbC04MjdlOTk3Yy03YzQ1LTRhYTgtYWRiMy0yMTFkZjZkYTY2MzIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.2xmpGRm1mjfBsAt9CcvfnYKr0lo5re7Kv-AauzG7tVc"
            			end;
            			
            			if sheet.NomeHabilidade == "Metamorfose Águia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df38adr-a17529ab-98da-4e25-87e4-f79e9d426a67.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzOGFkci1hMTc1MjlhYi05OGRhLTRlMjUtODdlNC1mNzllOWQ0MjZhNjcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.jzudUG-a-ixY8FXjBogwwURXKaYEIjYnXsW-sGYF0bI"
            			end;
            			
            			if sheet.NomeHabilidade == "Praga" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df38adj-5a619b93-dd77-44e9-96bb-419e540a1d9f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzOGFkai01YTYxOWI5My1kZDc3LTQ0ZTktOTZiYi00MTllNTQwYTFkOWYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3tZn-yBttRW-ocDhYRyf_iqhMI0Llz4SBMMFz2KafJg"
            			end;
            			
            			if sheet.NomeHabilidade == "Renovação" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df38ad6-5d6af3e9-efa9-4511-ab82-2ef948b1a31c.png/v1/fit/w_150,h_150,q_70,strp/renovacao_by_karelsama_df38ad6-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTI4MCIsInBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzOGFkNi01ZDZhZjNlOS1lZmE5LTQ1MTEtYWI4Mi0yZWY5NDhiMWEzMWMucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.a545-WWrBzLd5ORXCzffrfBHSyrLmstrHqgdCO6VRuk"
            			end;
            			
            			if sheet.NomeHabilidade == "Propagar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfgao5o-72d538ae-30bc-47ec-861f-6e50ec7fda48.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZnYW81by03MmQ1MzhhZS0zMGJjLTQ3ZWMtODYxZi02ZTUwZWM3ZmRhNDgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.t60WIgYKZZo9u8qIbusfkr_7IvFzvJnGRvUg7Iwty-A"
            			end;
            			
            			if sheet.NomeHabilidade == "Vinhas Maléficas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df38ade-3c37c99e-d656-41ec-8029-f53ccf248c74.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzOGFkZS0zYzM3Yzk5ZS1kNjU2LTQxZWMtODAyOS1mNTNjY2YyNDhjNzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.MBRjRrHcojJl_eMJZBhAJCYdXZC3njMu1du2KrBXH0M"
            			end;
            			
            			if sheet.NomeHabilidade == "Aura da Mãe Natureza" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfeathh-e6fa1c59-8b0b-4a98-b7a4-ef30f7f971dc.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlYXRoaC1lNmZhMWM1OS04YjBiLTRhOTgtYjdhNC1lZjMwZjdmOTcxZGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ggHLy_zW6nMQoPRYTZegvOZ4atBVeP4inaqYTdg4K_A"
            			end;
            							
            			if sheet.NomeHabilidade == "Estrela Cadente" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df38adu-ce69335b-8446-47b2-960f-7b5320e13370.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzOGFkdS1jZTY5MzM1Yi04NDQ2LTQ3YjItOTYwZi03YjUzMjBlMTMzNzAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.rAj6kXk0KjtY0XQCwYzAcEuE-cY6cOy6qtXqyH8QVKA"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            						
            			if sheet.NomeHabilidade == "Raio" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axq2-63cf2ba1-521b-4a87-9a89-8d3a2194c9b4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhxMi02M2NmMmJhMS01MjFiLTRhODctOWE4OS04ZDNhMjE5NGM5YjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.cCWi5sU6oVcyCQMSdHe3SZLeToMVKI-PscXvvNaU7LI"
            			end;
            			
            			if sheet.NomeHabilidade == "Golpe de Pedra" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axqo-09facc99-9257-4815-8abe-290f12593505.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhxby0wOWZhY2M5OS05MjU3LTQ4MTUtOGFiZS0yOTBmMTI1OTM1MDUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Tqk_vw29nwfLF5yiU6s8L-YVBVfPBht7bPaDDcsUi6w"
            			end;
            			
            			if sheet.NomeHabilidade == "Regeneração dos Ventos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axpv-bf10c4b8-45e8-43ec-a35b-b3f6d319b5bd.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhwdi1iZjEwYzRiOC00NWU4LTQzZWMtYTM1Yi1iM2Y2ZDMxOWI1YmQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dPp_viedDwBQiGxJUI4yDKhP8VtZ2KXSA6F-wQ_tO_w"
            			end;
            			
            			if sheet.NomeHabilidade == "Golpe Elétrico" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axqw-c2292af6-1fd1-4c1d-8cae-3fae646f0279.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhxdy1jMjI5MmFmNi0xZmQxLTRjMWQtOGNhZS0zZmFlNjQ2ZjAyNzkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.4yp6Eb1gLcy_rH_PIwdaUrS_5qzvvRWfAtbsvQ1Puhw"
            			end;
            			
            			if sheet.NomeHabilidade == "Statica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axqt-07d619c9-7242-423f-bac8-07656326b95e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhxdC0wN2Q2MTljOS03MjQyLTQyM2YtYmFjOC0wNzY1NjMyNmI5NWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ng6pOotncQrNcnLwRQE10Hhg2QDhMQWGl-x3ZYTM0oA"
            			end;
            			
            			if sheet.NomeHabilidade == "Tempestade Elétrica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axq6-bc398e7d-4e7e-4f80-a0a6-cee93873fcd7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhxNi1iYzM5OGU3ZC00ZTdlLTRmODAtYTBhNi1jZWU5Mzg3M2ZjZDcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.7NzHXd604JiOJ7Xbi07XICar0MO_bJZtd7h0u7UVbG4"
            			end;
            			
            			if sheet.NomeHabilidade == "Totem Elétrico" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axpe-6764d06a-a426-4e81-882d-f952a9eaeea8.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhwZS02NzY0ZDA2YS1hNDI2LTRlODEtODgyZC1mOTUyYTllYWVlYTgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dJv1rSx1dxOkAgDMF_SqHyJrjAZIlY91dqqGv4ogUx8"
            			end;
            			
            			if sheet.NomeHabilidade == "Aqua Vita" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axpi-f251629e-657d-4a1f-9536-03d59482037d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhwaS1mMjUxNjI5ZS02NTdkLTRhMWYtOTUzNi0wM2Q1OTQ4MjAzN2QucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.fWTDMlEPmdKm-_-m6lb7d1p_qch2rcPE69t6s6BJuTY"
            			end;
            			
            			if sheet.NomeHabilidade == "Esferas de Raio" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axpm-f81b493b-ef13-4bf3-947e-38fddb139f20.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhwbS1mODFiNDkzYi1lZjEzLTRiZjMtOTQ3ZS0zOGZkZGIxMzlmMjAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.owcqAs8jW98jbTsn6aGinjFhS2mY8_chyEOwZcKVyjk"
            			end;
            			
            			if sheet.NomeHabilidade == "Ventos da Tempestade" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axpr-0345b1a2-612f-49d0-97cf-36db87152f03.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhwci0wMzQ1YjFhMi02MTJmLTQ5ZDAtOTdjZi0zNmRiODcxNTJmMDMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VZdmhbcuWGx2BHDHKLFKwKOahokL3yDTx2yiy2kWpa8"
            			end;
            			
            			if sheet.NomeHabilidade == "Espíritos dos Lobos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axp8-6fc266b9-8572-40e3-85c3-313cc1a59c33.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhwOC02ZmMyNjZiOS04NTcyLTQwZTMtODVjMy0zMTNjYzFhNTljMzMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.SlZE56rNlLD7nanw7lx1nv7sjOxAZ7IPrKaBmCbAIGc"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Onda de Lava" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axqd-ab29dd32-da40-4a0c-9cef-d6ee91a3740a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhxZC1hYjI5ZGQzMi1kYTQwLTRhMGMtOWNlZi1kNmVlOTFhMzc0MGEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.W32QTNa43P6BZ6cgyUtQHKwmrJMYD6ZnTBEhPOJNRwo"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Mago Pesado" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3axqh-e0e824e0-3d84-4e2e-815a-d53242a3025b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXhxaC1lMGU4MjRlMC0zZDg0LTRlMmUtODE1YS1kNTMyNDJhMzAyNWIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.d3oc8D-5LJ-9vyL8NiT8GCwJHwXc_y_LY5uD-2ascCg"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;				
            			
            			if sheet.NomeHabilidade == "Curar Animal" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3az25-0c2359fa-8b70-4cb7-b39d-c11ad0cc95e0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXoyNS0wYzIzNTlmYS04YjcwLTRjYjctYjM5ZC1jMTFhZDBjYzk1ZTAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.BTzruH-r3QbkWnF3LQ7gZ4c24bACHmyWT2kssHX968A"
            			end;
            			
            			if sheet.NomeHabilidade == "Laminar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3az1x-766ae644-f7dd-46cc-97b3-eddecfae210f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXoxeC03NjZhZTY0NC1mN2RkLTQ2Y2MtOTdiMy1lZGRlY2ZhZTIxMGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Kn1szNzvnDUzWBRECA1QUtp5bWMju2Kzp5mz6EwT_rY"
            			end;
            			
            			if sheet.NomeHabilidade == "Arqueiro de Batalha" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3az29-41f262be-203b-45c2-ad74-d57101ed1f22.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXoyOS00MWYyNjJiZS0yMDNiLTQ1YzItYWQ3NC1kNTcxMDFlZDFmMjIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.w5G1d96n7Gczb0ElTHB4Yu718r-KK0fQbK-V9ZxzKKc"
            			end;
            			
            			if sheet.NomeHabilidade == "Arco Corpo a Corpo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3az2e-3117f82e-8c19-43bb-9b7a-800234066161.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXoyZS0zMTE3ZjgyZS04YzE5LTQzYmItOWI3YS04MDAyMzQwNjYxNjEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.EmSZi9eEStYjmgP0J9wWNZMej2siPAN-sFk72hfZdIc"
            			end;
            			
            			if sheet.NomeHabilidade == "Flecha Envenenada" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3az21-8fc081c9-e45a-44e1-8a4f-1b13918c492c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXoyMS04ZmMwODFjOS1lNDVhLTQ0ZTEtOGE0Zi0xYjEzOTE4YzQ5MmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.UrHlVWwifcn8hTvhfjsuiD0XY_TJIRcc5PQBUjXRUwM"
            			end;
            			
            			if sheet.NomeHabilidade == "Flecha Armadilha" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3az1l-04daa9f5-e5a7-495f-854b-857f816bc0dd.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYXoxbC0wNGRhYTlmNS1lNWE3LTQ5NWYtODU0Yi04NTdmODE2YmMwZGQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.t_4hd3tcaRZcPW8fiOhiBzV8YYXZDshK-rdmD-JD22M"
            			end;
            			
            			if sheet.NomeHabilidade == "Elo da Fera" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8hgk-ef88f211-1b41-47b0-9111-9b8b85c2f342.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOGhnay1lZjg4ZjIxMS0xYjQxLTQ3YjAtOTExMS05YjhiODVjMmYzNDIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.vVOmVatXEZI7mrIV00DgsibYffS7JpiLcjMhGclABWE"
            			end;
            					
            			if sheet.NomeHabilidade == "Companheiro Animal" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3az1u-7b2c05b2-578e-4de1-bf8f-bade16409d1d.png/v1/fit/w_150,h_150,strp/pet_icon_by_karelsama_df3az1u-150.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTEyIiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjNhejF1LTdiMmMwNWIyLTU3OGUtNGRlMS1iZjhmLWJhZGUxNjQwOWQxZC5wbmciLCJ3aWR0aCI6Ijw9NTEyIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.gDc_95K-vK7HdQ0QX9siy8EtawYa_mBfaUhUThn4LxY"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;				
            			
            			if sheet.NomeHabilidade == "Flecha Magica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b0nz-36bfbfc4-ebad-4613-bd26-643a8f2961e5.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjBuei0zNmJmYmZjNC1lYmFkLTQ2MTMtYmQyNi02NDNhOGYyOTYxZTUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.JZ3MRqpDKMCBy7UI2H6jFvxC03ZdhpzCCiRMHE5gSOg"
            			end;
            			
            			if sheet.NomeHabilidade == "Perfuração Magica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b0nx-1ef032a5-8651-49f4-857c-d74b76f559f4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjBueC0xZWYwMzJhNS04NjUxLTQ5ZjQtODU3Yy1kNzRiNzZmNTU5ZjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Svfs99HJSghQh6dbseYeuht4-Gv5xZT-LoDkeP3A_3Q"
            			end;
            			
            			if sheet.NomeHabilidade == "Saraivada de Flechas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b0np-fea286d3-ef21-4242-bfb4-1c11e880597f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjBucC1mZWEyODZkMy1lZjIxLTQyNDItYmZiNC0xYzExZTg4MDU5N2YucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.COTcqAtL6H-4bJWPhWqMxdsUwYJoX5eq8MS_1HKre3Y"
            			end;
            			
            			if sheet.NomeHabilidade == "Libertar Destreza" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfgan8i-a8f23724-6091-4846-a208-f1b523f64751.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZnYW44aS1hOGYyMzcyNC02MDkxLTQ4NDYtYTIwOC1mMWI1MjNmNjQ3NTEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.FJYzkURvSBUAixdUGmNH46TnZHEJno7n8vWy4bndEdQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Tiro a Distancia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfgan8t-b312324e-5dc7-4b4a-ba6d-e06654f09ac1.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZnYW44dC1iMzEyMzI0ZS01ZGM3LTRiNGEtYmE2ZC1lMDY2NTRmMDlhYzEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.xkbmZAGhm8oaUxjoUvEQihr_Ta18oBmBV99W5rsO7_0"
            			end;
            			
            			if sheet.NomeHabilidade == "Salto de Salvação" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b0nv-6c078a71-158a-4586-b2b3-09baf198bf5d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjBudi02YzA3OGE3MS0xNThhLTQ1ODYtYjJiMy0wOWJhZjE5OGJmNWQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ap0Y0-6mjmYBf5doefuIZlG_Sg2U8S66r5a0CBSl_8s	"
            			end;
            			
            			if sheet.NomeHabilidade == "Flecha do Silencio" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3o6ir-d8c04f1f-737d-498a-850f-28dc4b2aad1f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzbzZpci1kOGMwNGYxZi03MzdkLTQ5OGEtODUwZi0yOGRjNGIyYWFkMWYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.lb2LSF65Pmd3WETTTwAkwZwQgkRg_d7aIbG57Jmylsw"
            			end;
            			
            			if sheet.NomeHabilidade == "Tiro Almejado" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b0no-6d172e95-401d-48c5-aa79-6a87b309c984.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjBuby02ZDE3MmU5NS00MDFkLTQ4YzUtYWE3OS02YTg3YjMwOWM5ODQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ivuwi4ftezpLpCZKu2zf4_9n4cxxn3RYYeLql5UqrbM"
            			end;
            			
            			if sheet.NomeHabilidade == "Arco Magico" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b0o2-f55ff50f-1cae-4dc8-b6c2-adb53498a5dd.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjBvMi1mNTVmZjUwZi0xY2FlLTRkYzgtYjZjMi1hZGI1MzQ5OGE1ZGQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.p1Jt1H4uRUS1l_ogVzpmQ6FBggZ2lGFaKZLmyt2hWgM"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Sinfonia Dissipadora" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b2dk-b8e0cb84-70ee-4427-9b0c-6c284066fc17.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjJkay1iOGUwY2I4NC03MGVlLTQ0MjctOWIwYy02YzI4NDA2NmZjMTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.KdAui90ElvCMxK54rHK6pasijG2kb-9Su-qmBhJeZsU"
            			end;
            			
            			if sheet.NomeHabilidade == "Fantasma da Mana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b2df-d1fa9350-00fd-43b3-ad0b-4956e1598a4a.png/v1/fit/w_150,h_150,q_70,strp/fantasma_da_mana_by_karelsama_df3b2df-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzAwIiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjNiMmRmLWQxZmE5MzUwLTAwZmQtNDNiMy1hZDBiLTQ5NTZlMTU5OGE0YS5wbmciLCJ3aWR0aCI6Ijw9MzAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.O8ZJW4Lkv0tgVjKxJoJVLX_aTTiK8yj2H6AJCfAtiTQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Fantasma da Vida" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b2db-8c828381-e763-498c-b13e-3d3123052472.png/v1/fit/w_150,h_150,q_70,strp/fantasma_da_vida_by_karelsama_df3b2db-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzAyIiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjNiMmRiLThjODI4MzgxLWU3NjMtNDk4Yy1iMTNlLTNkMzEyMzA1MjQ3Mi5wbmciLCJ3aWR0aCI6Ijw9MzAzIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.RKGoenOQVf-8HVE_1OlkjVeP4n-Y8UtFUFlb7mLUtjs"
            			end;
            			
            			if sheet.NomeHabilidade == "Sinfonia Inspiradora" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b2d2-070df907-56b2-4d83-b7d2-3800d5eb3f00.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjJkMi0wNzBkZjkwNy01NmIyLTRkODMtYjdkMi0zODAwZDVlYjNmMDAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3hDsypo9TvNIxHqSd8WNu4i2Gp0ElZuN5RURQm1ZHXM"
            			end;
            			
            			if sheet.NomeHabilidade == "Solo de Cura" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b2do-1f81079b-350d-42e5-8be2-d2d83bfdcc54.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjJkby0xZjgxMDc5Yi0zNTBkLTQyZTUtOGJlMi1kMmQ4M2JmZGNjNTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.vY-ecQwe03n-mJFU2pfWdN4VugR7Smzg23iDGJH-FEQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Solo de Mana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b2cw-2094dd08-e176-4fe5-9a3c-c769898df726.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjJjdy0yMDk0ZGQwOC1lMTc2LTRmZTUtOWEzYy1jNzY5ODk4ZGY3MjYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.jSeV3v9PcxwaSMuef_Fv2sWV0XXOa2nfY6qv5_rJSD8"
            			end;
            			
            			if sheet.NomeHabilidade == "Acústico de Proteção" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b2dw-3140007e-0eac-4547-90ca-9ce5eacd12df.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjJkdy0zMTQwMDA3ZS0wZWFjLTQ1NDctOTBjYS05Y2U1ZWFjZDEyZGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.fnCLtj5bUxFsYdi1IgIABebBfaaUwvfVpySQHvPYTrA"
            			end;
            			
            			if sheet.NomeHabilidade == "Acordes Perfeitos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3b2e0-584e4c5b-785c-40ef-98e8-44cab1a67d4b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzYjJlMC01ODRlNGM1Yi03ODVjLTQwZWYtOThlOC00NGNhYjFhNjdkNGIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ozSTRuMMjpQ_mVrqcHQmCnKCqE6nrvxtb01XxIuYlbU"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            
            			
            			if sheet.NomeHabilidade == "Mão Magica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df6y6tz-0202b5a6-9f21-4f0c-b854-1c7cf7a11cb2.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGY2eTZ0ei0wMjAyYjVhNi05ZjIxLTRmMGMtYjg1NC0xYzdjZjdhMTFjYjIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.bKl6HWi8r9Cu8fPxjtmscCevsrd8A16g5ysRoLsbrUg"
            			end;
            			
            			if sheet.NomeHabilidade == "Dissonancia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df6y6u4-9dfdcbf8-f0eb-4e60-8173-d76de66c8a15.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGY2eTZ1NC05ZGZkY2JmOC1mMGViLTRlNjAtODE3My1kNzZkZTY2YzhhMTUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.gjjZw3Q3MjHJULJvMd-RWv2KByx-o69agkvx_8KZKs8"
            			end;
            			
            			if sheet.NomeHabilidade == "Réquiem de Cordas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df6y6tb-9b8f2c64-c61c-4679-a67b-3289375ef424.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGY2eTZ0Yi05YjhmMmM2NC1jNjFjLTQ2NzktYTY3Yi0zMjg5Mzc1ZWY0MjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.jgIsP49maadPtWg1FzQjPhotL2eeiBAI1aHx1YjEexY"
            			end;
            			
            			if sheet.NomeHabilidade == "Queda Sonora" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df6y6tn-1da1ab1b-f00c-4387-a042-6153fa4c7157.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGY2eTZ0bi0xZGExYWIxYi1mMDBjLTQzODctYTA0Mi02MTUzZmE0YzcxNTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.TLXzcNRD9Zrup-3GUyFcSxk6sYKUrom43apQlJaSfcw"
            			end;
            			
            			if sheet.NomeHabilidade == "Pelo Colarinho" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df6y7dr-21196efb-a414-4b5b-974a-261fa8e1ba2e.png/v1/fill/w_267,h_250,q_70,strp/pelo_colarinho_by_karelsama_df6y7dr-250t.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzYwIiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjZ5N2RyLTIxMTk2ZWZiLWE0MTQtNGI1Yi05NzRhLTI2MWZhOGUxYmEyZS5wbmciLCJ3aWR0aCI6Ijw9Mzg0In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.Pd31SPtuBIAunC85mchdbIZcCjoTsxYkE5WYp7Tw4Rc"
            			end;
            			
            			if sheet.NomeHabilidade == "Recomeçar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df6y6td-85dd25bc-61b0-49fe-823d-b57db8b61bb1.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGY2eTZ0ZC04NWRkMjViYy02MWIwLTQ5ZmUtODIzZC1iNTdkYjhiNjFiYjEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._vEg_7DZVIiBISAlhO_-WRvspcmTCxsm5NUp95LVV30"
            			end;
            			
            			if sheet.NomeHabilidade == "Rebater Magia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df6y6th-df688681-c002-4c1d-bea9-6251f3bb9ccc.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGY2eTZ0aC1kZjY4ODY4MS1jMDAyLTRjMWQtYmVhOS02MjUxZjNiYjljY2MucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ZYgI-Hs11cSaCjEFFb9F9KhLTd1Ggc9YZFdRDe2nA2U"
            			end;
            			
            			if sheet.NomeHabilidade == "Orquestrar e Persistir" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfeatsl-dabab1ed-d744-4178-99f6-d66c75cb0d1d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlYXRzbC1kYWJhYjFlZC1kNzQ0LTQxNzgtOTlmNi1kNjZjNzVjYjBkMWQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.-I5NFa7ahtjg0sdo6jNSG5xgctoBOyMxOX3h0lCrErY"
            			end;
            			
            			if sheet.NomeHabilidade == "Porta da Infelicidade" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df6y6tq-69ed91be-e731-4b9d-8736-5d2d4a98f235.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGY2eTZ0cS02OWVkOTFiZS1lNzMxLTRiOWQtODczNi01ZDJkNGE5OGYyMzUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ESOnXTpV6hF6agwAyWzlA7RVepOWWcUDdbO90rUvCxg"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Santuario Musical" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df7n676-175b0c9c-978b-4f43-b8cf-c07c1c8c9473.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGY3bjY3Ni0xNzViMGM5Yy05NzhiLTRmNDMtYjhjZi1jMDdjMWM4Yzk0NzMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.1vinFDO3A-sgO97-pH5tMmKIP2pCzP_-_5W6KYVb3qg"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Pedra Espiritual" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbtx-bdf04ded-8fb3-4e4d-87ca-97d14f4b7d8c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J0eC1iZGYwNGRlZC04ZmIzLTRlNGQtODdjYS05N2QxNGY0YjdkOGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.2RIBXwlnzofqe3TBiygiBJx-mtq9hc5NWcmL97OWVbQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Consumo da Pedra Espiritual" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbtx-bdf04ded-8fb3-4e4d-87ca-97d14f4b7d8c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J0eC1iZGYwNGRlZC04ZmIzLTRlNGQtODdjYS05N2QxNGY0YjdkOGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.2RIBXwlnzofqe3TBiygiBJx-mtq9hc5NWcmL97OWVbQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Controlar o Mau" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbum-79d492d1-060d-45b7-ab26-05d43be709d4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J1bS03OWQ0OTJkMS0wNjBkLTQ1YjctYWIyNi0wNWQ0M2JlNzA5ZDQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Xd1nDwKVJxJTRvR3dMp14OyF_-H2RphYBK23KQZGBZ0"
            			end;
            			
            			if sheet.NomeHabilidade == "Drenar Mana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbtz-e371ec22-7ca2-4409-9e4b-42bb173e280c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J0ei1lMzcxZWMyMi03Y2EyLTQ0MDktOWU0Yi00MmJiMTczZTI4MGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._BGHYgcXAM4erlJaC-Dyj58G6RAGuWKM0_m-zpUcqFM"
            			end;
            			
            			if sheet.NomeHabilidade == "Drenar Vida" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbud-c6e42f56-7ef8-420e-8c2b-534d194ee9a0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J1ZC1jNmU0MmY1Ni03ZWY4LTQyMGUtOGMyYi01MzRkMTk0ZWU5YTAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.I7TLMjZC6YPvuRV5lMmlKSBOi__Gsf1QqE1S8cF7tPs"
            			end;
            			
            			if sheet.NomeHabilidade == "Seta da Morte" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbtr-5121396a-430a-4492-ade4-247893e8b2df.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J0ci01MTIxMzk2YS00MzBhLTQ0OTItYWRlNC0yNDc4OTNlOGIyZGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.8PLIlvY-TUHrXrTIpbafTWpSs-bMLcowsFrL619DeSI"
            			end;
            			
            			if sheet.NomeHabilidade == "Toque da Morte" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbtl-eb4bd6a6-3c54-4836-9776-e815da284e1a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J0bC1lYjRiZDZhNi0zYzU0LTQ4MzYtOTc3Ni1lODE1ZGEyODRlMWEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.PI-i6Nzg--E3AKuZdfKuNCRBxgBb40i6e3VIOt_nq1s"
            			end;
            			
            			if sheet.NomeHabilidade == "Golpe Das Trevas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbu7-e8130563-6670-4f65-a116-71f9fe0c9a9e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J1Ny1lODEzMDU2My02NjcwLTRmNjUtYTExNi03MWY5ZmUwYzlhOWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ELxPjI3UJrr6eo8fcN3esBMJMQOD-Fyzl_h_1E9CJP4"
            			end;
            			
            			if sheet.NomeHabilidade == "Troca Equivalente" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbtj-6733c0c7-9e33-49c0-8346-7acf37abf325.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J0ai02NzMzYzBjNy05ZTMzLTQ5YzAtODM0Ni03YWNmMzdhYmYzMjUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.H_zthmBC0HQ00AAsmwiObCBmjCt_AS13ZEQ4x3KQyJo"
            			end;
            			
            			if sheet.NomeHabilidade == "Inspiração da Dor" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbu2-8147627b-8042-406a-afae-f1d63e2de666.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J1Mi04MTQ3NjI3Yi04MDQyLTQwNmEtYWZhZS1mMWQ2M2UyZGU2NjYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Rcfbg6TegQwRrGuQ9JC73_sywbTYPPfrvI4lowilKQE"
            			end;
            			
            			if sheet.NomeHabilidade == "Inferno" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbub-b8c9891c-3ced-48b1-b027-05d179550ee0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J1Yi1iOGM5ODkxYy0zY2VkLTQ4YjEtYjAyNy0wNWQxNzk1NTBlZTAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.eh7dvM8RQYf6cdARMB_XXiGJ4w4rPVCdsp3AddlqUvg"
            			end;
            			
            			if sheet.NomeHabilidade == "Corrente Infernal" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbuj-7decdfdf-603d-4436-bffc-efb8a64c0ca2.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J1ai03ZGVjZGZkZi02MDNkLTQ0MzYtYmZmYy1lZmI4YTY0YzBjYTIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.iQDXK8xeW7M-ndFR4Fcpw0Zx4B6pNpccaMoJU3EN8-I"
            			end;
            			
            			if sheet.NomeHabilidade == "Re Encarnar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbtu-9730f1c1-cce0-46d2-8128-f5c39cf670d1.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J0dS05NzMwZjFjMS1jY2UwLTQ2ZDItODEyOC1mNWMzOWNmNjcwZDEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dXF8i6fDtAWKDLEnWIMqUjTJtpGFag-d3iHqohHpTN0"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Metamorfose" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbto-88435fb5-5855-4900-82ad-3ca80bd58770.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J0by04ODQzNWZiNS01ODU1LTQ5MDAtODJhZC0zY2E4MGJkNTg3NzAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.PDje69elnen5RIm_p0JEeV_xcg985iQPIXRQxOnq39U"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Infernal" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cbu4-ea8f1514-8a21-413d-ae34-3cfae63ebae8.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2J1NC1lYThmMTUxNC04YTIxLTQxM2QtYWUzNC0zY2ZhZTYzZWJhZTgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.c-q6Aui_VRsAE8WfgcRjyygk7BgYDqpKCDftRsGsyzY"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Revigoração Espiritual" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cddb-77a376ae-43ce-4180-8f44-bf307339042c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2RkYi03N2EzNzZhZS00M2NlLTQxODAtOGY0NC1iZjMwNzMzOTA0MmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Z0P0JxDb05wnaSEz1SALVeRTqr-z7uCyfXRVhukxN7A"
            			end;
            			
            			if sheet.NomeHabilidade == "Fortitude" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cdcy-ade34480-36c1-47ab-bddc-df1fbda0a215.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2RjeS1hZGUzNDQ4MC0zNmMxLTQ3YWItYmRkYy1kZjFmYmRhMGEyMTUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.xG87NgF9bVEIKbZu0AORY_0KuhSR3u-GP66XCmWwxxQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Fogo na Alma" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cdde-7df4ec9d-7b7b-4204-abed-66c008cac290.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2RkZS03ZGY0ZWM5ZC03YjdiLTQyMDQtYWJlZC02NmMwMDhjYWMyOTAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.rElCtpUNZczPJAWnGWQNZs_tzfo2WkFklfbPCAmudZc"
            			end;
            			
            			if sheet.NomeHabilidade == "Queimar Mana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8xjp-cb0a2b6b-5d25-492f-ab9e-ab0f6f12d91d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOHhqcC1jYjBhMmI2Yi01ZDI1LTQ5MmYtYWI5ZS1hYjBmNmYxMmQ5MWQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.5hnpdSiQ8bUPLYJ4qBZBFmNAU_91-CIH-rNnE-9tXq8"
            			end;
            			
            			if sheet.NomeHabilidade == "Barreira Divina" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cddh-7effcb5a-fc3f-4684-8621-d94d28676d00.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2RkaC03ZWZmY2I1YS1mYzNmLTQ2ODQtODYyMS1kOTRkMjg2NzZkMDAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.1yR6YHlq4iT4hjBElkOun_5o3A4M8yT8LjPEVcBtwPM"
            			end;
            			
            			if sheet.NomeHabilidade == "Oferenda" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cdd7-912c7d2e-eb9a-44cf-b878-f74c9ac412f2.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2RkNy05MTJjN2QyZS1lYjlhLTQ0Y2YtYjg3OC1mNzRjOWFjNDEyZjIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.82rTAVZS2p0JZAZiOXHRI3AvX1liUgm73DKPOp9_S_0"
            			end;
            			
            			if sheet.NomeHabilidade == "Revigoração Espiritual" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8hjw-5d0c390e-eaa1-4e8d-b6bc-6bc037c59481.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOGhqdy01ZDBjMzkwZS1lYWExLTRlOGQtYjZiYy02YmMwMzdjNTk0ODEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.0Oc2_Mp7XjgIMh-a3Ms4H5drm-cmfR1RuVQgprVvuXc"
            			end;
            			
            			if sheet.NomeHabilidade == "Proteção Sagrada" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3ok3b-e66fecd3-4eac-4f81-a595-e298bf9c5d43.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzb2szYi1lNjZmZWNkMy00ZWFjLTRmODEtYTU5NS1lMjk4YmY5YzVkNDMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.cx5gh0ab_GXDOJRAjrMCwjgnZqI4iR5K9a_9TOeQqDQ"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Olhar do Éden" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3ok33-4bff5f26-9622-4dfe-9085-b32bfe40ea46.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzb2szMy00YmZmNWYyNi05NjIyLTRkZmUtOTA4NS1iMzJiZmU0MGVhNDYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.bmN-cx8kZEf4hcvlu7P8m-kp-bwiU_5TGWgErmCXqMQ"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Espirito da Dor" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cgsl-83c78241-d198-40e9-973f-1f95e0e83e05.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2dzbC04M2M3ODI0MS1kMTk4LTQwZTktOTczZi0xZjk1ZTBlODNlMDUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.MpayXAKvgkbgUpwstCRYog_Am1PlLx5W2TufiC3zbX8"
            			end;
            			
            			if sheet.NomeHabilidade == "Pulso Magico" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cgsf-685c418e-899b-4d74-a57f-f08dd617d6f5.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2dzZi02ODVjNDE4ZS04OTliLTRkNzQtYTU3Zi1mMDhkZDYxN2Q2ZjUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ywpWqI6xepYn_IPxX7Wosg-yeaJlZMxb4q6Xjw3fawk"
            			end;
            			
            			if sheet.NomeHabilidade == "Regeneração Rápida" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cgsd-19cf7320-dcdd-4409-bd28-22f01ec97d09.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2dzZC0xOWNmNzMyMC1kY2RkLTQ0MDktYmQyOC0yMmYwMWVjOTdkMDkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VU36ZgNMi_TlKEW_jfHsA3KVhVQEcC7Witbw6mmEeTU"
            			end;
            			
            			if sheet.NomeHabilidade == "Coragem" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3okk9-11227393-1dcc-43f1-9fc5-3b6eede26d91.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzb2trOS0xMTIyNzM5My0xZGNjLTQzZjEtOWZjNS0zYjZlZWRlMjZkOTEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.lDjsL8w-ec-pcUCF57T3Erhd73bPaqvDLblzaYvlp7A"
            			end;
            			
            			if sheet.NomeHabilidade == "Assalto" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cgsn-1bbfc5be-a86a-4d3c-92ce-301a4af4ceb2.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2dzbi0xYmJmYzViZS1hODZhLTRkM2MtOTJjZS0zMDFhNGFmNGNlYjIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.rRVxQF9DVYxznRnVlMwVj-56QRubGU1-XfdtWk1DSzc"
            			end;
            			
            			if sheet.NomeHabilidade == "Tiro Pecaminoso" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3okkx-a057854b-6784-46f2-bb9d-8ece8859d72c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzb2treC1hMDU3ODU0Yi02Nzg0LTQ2ZjItYmI5ZC04ZWNlODg1OWQ3MmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.icYIieU4cdaijlAt6dhhLX9oQEG1TX1bFytm6rqgp38"
            			end;
            			
            			if sheet.NomeHabilidade == "Pacto Sangrento" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3okrh-25a901a7-a858-4918-bc45-86b3be840b03.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzb2tyaC0yNWE5MDFhNy1hODU4LTQ5MTgtYmM0NS04NmIzYmU4NDBiMDMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.8iqwgAKi2eU7twmQn7ri3RwR8cD1iSImx9xY2CDG-ZI"
            			end;
            			
            			if sheet.NomeHabilidade == "Forma Final" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cgsg-3e836082-dbc6-4d36-9b5b-f30621bb1a24.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2dzZy0zZTgzNjA4Mi1kYmM2LTRkMzYtOWI1Yi1mMzA2MjFiYjFhMjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.0CCzrVeDaCBDb1cPlWNngaxhHc6518mf7lzWyS8a7Wg"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Tornado de Fúria" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cl4k-f852a719-591a-46a0-b644-fb3558a9675e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2w0ay1mODUyYTcxOS01OTFhLTQ2YTAtYjY0NC1mYjM1NThhOTY3NWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.bqKL2cEDjCpuyaYkCG7SDrrFIh2vj19YAu5Gq3js0d8"
            			end;
            			
            			if sheet.NomeHabilidade == "Imparável" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cl4r-57626126-762a-4ed7-b200-6cf452b548cd.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2w0ci01NzYyNjEyNi03NjJhLTRlZDctYjIwMC02Y2Y0NTJiNTQ4Y2QucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.mzZj2LassiwpgX43xvvBbai4Po-NAhP0xg_VbLkeQZ0"
            			end;
            			
            			if sheet.NomeHabilidade == "Destroçar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cl4y-8327cca7-38f2-4c66-9a32-bdd449f779bd.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2w0eS04MzI3Y2NhNy0zOGYyLTRjNjYtOWEzMi1iZGQ0NDlmNzc5YmQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.wLe1F7o6RDVduclEBJc2K3yCaQPWSrZVqdFgLhQedxY"
            			end;
            			
            			if sheet.NomeHabilidade == "Contra Golpe" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cl50-a7a6874f-7e08-454b-bfea-8350ea4b7db3.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2w1MC1hN2E2ODc0Zi03ZTA4LTQ1NGItYmZlYS04MzUwZWE0YjdkYjMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.DWUjLpjMH07T9j1czNm5YDBbqd-2KAu14zvifOoI7AU"
            			end;
            			
            			if sheet.NomeHabilidade == "Devastar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cl4u-f0a06c0c-895d-4196-add4-eaa2ca8912c7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2w0dS1mMGEwNmMwYy04OTVkLTQxOTYtYWRkNC1lYWEyY2E4OTEyYzcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.AR-zg8gYvsVPcFZ0W8GxG83_FYKfbX-z8bFZhtMc2IE"
            			end;
            			
            			if sheet.NomeHabilidade == "Orgulho" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cl4o-bd524ae0-1c09-4128-a784-c74c3c45e64a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2w0by1iZDUyNGFlMC0xYzA5LTQxMjgtYTc4NC1jNzRjM2M0NWU2NGEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.4KSZQ7X8R9rlvWG0hKUZY91uMMCLqtCSUTBCb94WeNg"
            			end;
            			
            			if sheet.NomeHabilidade == "Quebrar Pernas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cl4n-240f9e69-9c68-4846-82e4-0aeaba4e2570.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2w0bi0yNDBmOWU2OS05YzY4LTQ4NDYtODJlNC0wYWVhYmE0ZTI1NzAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.INejg8-6aUuCFh6KNYU8k6nFJUHyTVionGoxZnFq5Bk"
            			end;
            			
            			if sheet.NomeHabilidade == "Guerra" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cl4s-b3183595-8304-4611-bfbd-578043515644.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2w0cy1iMzE4MzU5NS04MzA0LTQ2MTEtYmZiZC01NzgwNDM1MTU2NDQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ysbxUjut3e_bmcKYUZKvG7X9LMdvhq5_lwmeZiitYys"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Bloqueio Certeiro" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3clie-a82348c8-8103-476a-b01d-1258265f668a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2xpZS1hODIzNDhjOC04MTAzLTQ3NmEtYjAxZC0xMjU4MjY1ZjY2OGEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.rgv9ookwx-c-x4NrgbsjIfNbd4QA7Dbdp7kFCnR_4Oc"
            			end;
            			
            			if sheet.NomeHabilidade == "Direto Na Vida" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cli9-38d8cd0d-cc95-4c90-87c9-647534e65a3d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2xpOS0zOGQ4Y2QwZC1jYzk1LTRjOTAtODdjOS02NDc1MzRlNjVhM2QucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.XpGxmXJJy13h1V3rpV573EHC_B9-R_ewAEYmDH7Vyuk"
            			end;
            			
            			if sheet.NomeHabilidade == "Venha Comigo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3clhi-d43afbec-0015-42fd-a287-d60542d04edc.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2xoaS1kNDNhZmJlYy0wMDE1LTQyZmQtYTI4Ny1kNjA1NDJkMDRlZGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.NMYt_JiW-_uFmUw2Zc1-7b9h5NOH1OZ_zbqNYVqSwtc"
            			end;
            			
            			if sheet.NomeHabilidade == "Quebrar Defesa" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3clhq-f47732c9-88a2-4af3-8fe6-22c73159998d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2xocS1mNDc3MzJjOS04OGEyLTRhZjMtOGZlNi0yMmM3MzE1OTk5OGQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VWnIfmZ7Aq9pDqwaF0B95WNLxGUJlvjS6kUk1oxnQyk"
            			end;
            			
            			if sheet.NomeHabilidade == "Defletar Flechas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3clhp-0253bb83-41e8-465f-b549-187b27ac554b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2xocC0wMjUzYmI4My00MWU4LTQ2NWYtYjU0OS0xODdiMjdhYzU1NGIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VPHD1bi9ogiVfaLUaX0vnbgh2tj4g03a3HCw9PtbH1A"
            			end;
            			
            			if sheet.NomeHabilidade == "Giro da Morte" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3cli1-a6c456aa-bf02-4654-b54b-961970101771.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2xpMS1hNmM0NTZhYS1iZjAyLTQ2NTQtYjU0Yi05NjE5NzAxMDE3NzEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.bF0RAHie3j1_dtPijFf5hXi8Qth0H-_vwLG1fXKByPE"
            			end;
            			
            			if sheet.NomeHabilidade == "Humilhação" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3clhw-a7cd9a0f-c35c-47c0-9cad-0d87c8ad80f5.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2xody1hN2NkOWEwZi1jMzVjLTQ3YzAtOWNhZC0wZDg3YzhhZDgwZjUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.6CTB0MDXcbdf5IFI2I1I4fEKr-XLdIuYiLvqNtM9Hi8"
            			end;
            			
            			if sheet.NomeHabilidade == "Aura de Fogo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3clil-b10fa381-eb03-4bf5-bf71-cb0e2b70ff11.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2xpbC1iMTBmYTM4MS1lYjAzLTRiZjUtYmY3MS1jYjBlMmI3MGZmMTEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.xroOBAn_iy08PoQ6EFY06RcYd64I6PXndmuro0Rzv1Y"
            			end;
            			
            			if sheet.NomeHabilidade == "Ultimate Defense" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3clhl-dbdd9eea-2ece-4025-b8ac-65826fc8058b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2xobC1kYmRkOWVlYS0yZWNlLTQwMjUtYjhhYy02NTgyNmZjODA1OGIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.4k9WnRjtmmMYdxT3h9HFOLSSjEfzJuT1d_GxNndctns"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Vitalidade e Força" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3clhd-29612d36-3812-43af-9c20-7f4efef950c0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY2xoZC0yOTYxMmQzNi0zODEyLTQzYWYtOWMyMC03ZjRlZmVmOTUwYzAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Yg_060BQnaT6pbOBxe8LSNsVYr7vg9KlnTwZ-qPqToU"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Esquiva Sobrenatural" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3co9d-86d96a96-d90c-45b7-a65c-8c317abf2dcd.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY285ZC04NmQ5NmE5Ni1kOTBjLTQ1YjctYTY1Yy04YzMxN2FiZjJkY2QucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.CUcLeflw8IW_1Gx-JyeOzfSnAr2gLjXAi1BI4cVSwSw"
            			end;
            			
            			if sheet.NomeHabilidade == "Falha na Armadura" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3co98-c6f5a15e-a3eb-46fe-bb31-dfd3ad6bef48.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY285OC1jNmY1YTE1ZS1hM2ViLTQ2ZmUtYmIzMS1kZmQzYWQ2YmVmNDgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.uL4XqiVYpayEOprsOPmpc0v1uZBC23bgofzMqo9TZD4"
            			end;
            			
            			if sheet.NomeHabilidade == "Penetração" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3co8u-1795e676-9700-4dc2-be99-eaacb7a0d4ee.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY284dS0xNzk1ZTY3Ni05NzAwLTRkYzItYmU5OS1lYWFjYjdhMGQ0ZWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.9sKxsnyWvGAHMImTulaX14MUHWDmHuCHNmg7-fNcq5c"
            			end;
            			
            			if sheet.NomeHabilidade == "Gancho" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3co97-2699d5db-5cf3-493c-acc3-ff3d5564ef29.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY285Ny0yNjk5ZDVkYi01Y2YzLTQ5M2MtYWNjMy1mZjNkNTU2NGVmMjkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.RDrZ6BXfKX01UF9VVmArmyaglqJqh2MBwUQwZQsYTPU"
            			end;
            			
            			if sheet.NomeHabilidade == "Vantagem" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3co8m-61726a8d-d519-4843-8493-b70b7c71d743.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY284bS02MTcyNmE4ZC1kNTE5LTQ4NDMtODQ5My1iNzBiN2M3MWQ3NDMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.z2M47lVTMD8JDWWiyL6aTjOIVtAfOLi2aCCO7kjMJxg"
            			end;
            			
            			if sheet.NomeHabilidade == "Critical Poderoso" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3co9q-988418a4-d688-4c98-9b92-c5ca843a6aa4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY285cS05ODg0MThhNC1kNjg4LTRjOTgtOWI5Mi1jNWNhODQzYTZhYTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.oh3vTUXfXptCvvnK0l_OSTUyCHs8TzYRBnbEh6r0U0A"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Em um piscar de Olhos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3co9k-7610b647-cef3-41eb-856c-97d8b96b1597.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzY285ay03NjEwYjY0Ny1jZWYzLTQxZWItODU2Yy05N2Q4Yjk2YjE1OTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.EpX48ITyjJc_Z-kSctGAOynpt19nHg65SUbDfAbHPBY"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Emboscada" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3d125-77895d4e-e2f0-403f-b531-fc3bf02019b7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZDEyNS03Nzg5NWQ0ZS1lMmYwLTQwM2YtYjUzMS1mYzNiZjAyMDE5YjcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.hSpZwGld7ZhsJjFgrWVH8AeaQsAlHBkR0y_7zO0kVL8"
            			end;
            			
            			if sheet.NomeHabilidade == "Mestre das Habilidades" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3d11w-ddf2df86-8d96-4eae-a59e-b2dc5ffed847.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZDExdy1kZGYyZGY4Ni04ZDk2LTRlYWUtYTU5ZS1iMmRjNWZmZWQ4NDcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.J-d7lErfZugW53EcOL2DOPiNwwlUd4hHAOP9fSkC_Q8"
            			end;
            			
            			if sheet.NomeHabilidade == "Combo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3d129-72d3763a-fdff-48ea-9a3a-a6e2b09e336a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZDEyOS03MmQzNzYzYS1mZGZmLTQ4ZWEtOWEzYS1hNmUyYjA5ZTMzNmEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.38o0qetys6OUZbXCaJ0mNqKG3pBPSxSY7hll5bVEfMQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Apunhalar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3d12l-c6d84fe3-a194-4066-bf73-0bd13641214f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZDEybC1jNmQ4NGZlMy1hMTk0LTQwNjYtYmY3My0wYmQxMzY0MTIxNGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.gaXi3N655XInWW07_05X6UBowi388tMg3oyort-tSE0"
            			end;
            			
            			if sheet.NomeHabilidade == "Penetração" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3d1fw-9015caa5-c322-48b0-8055-9d313cebe98f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZDFmdy05MDE1Y2FhNS1jMzIyLTQ4YjAtODA1NS05ZDMxM2NlYmU5OGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3V5qu3hT2RjSD9MSUVW-PxZy29FEDXNdyXpr-H8hqoE"
            			end;
            			
            			if sheet.NomeHabilidade == "Espreita" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3d123-1e0d1f2f-53b0-4736-9251-f85bae3d6b91.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZDEyMy0xZTBkMWYyZi01M2IwLTQ3MzYtOTI1MS1mODViYWUzZDZiOTEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.8kuwCkcNrg7NQ9QHC0sWjXT0WtMZ9bh9pSGdeK7Kc_I"
            			end;
            			
            			if sheet.NomeHabilidade == "Assassinato" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3d12e-10f02184-ab84-450c-b6fb-4b90deb32fe6.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZDEyZS0xMGYwMjE4NC1hYjg0LTQ1MGMtYjZmYi00YjkwZGViMzJmZTYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.xkg4CCwg9uc--xEMofLJ8CGpUPhiVZOXLXd2OlGJ6_Y"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Carga Arcana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eiya-ec05ef26-6c2d-40a8-8ede-1a58e8703294.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl5YS1lYzA1ZWYyNi02YzJkLTQwYTgtOGVkZS0xYTU4ZTg3MDMyOTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.CGgso9FM_z138iZkgjmqxbsTZSzpo83V_XZfdOo3Jyo"
            			end;
            			
            			if sheet.NomeHabilidade == "Impacto Arcano" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eiy0-8e064a42-81d0-4cf3-b252-e61e8569934a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl5MC04ZTA2NGE0Mi04MWQwLTRjZjMtYjI1Mi1lNjFlODU2OTkzNGEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._JyYEpO39W1NgWk0FKyeSM6UGLIx43_Xlf2qss5lvJk"
            			end;
            			
            			if sheet.NomeHabilidade == "Misseis Mágicos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eixu-4ca4b98e-0bb7-4149-94ca-93efdf7793e4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl4dS00Y2E0Yjk4ZS0wYmI3LTQxNDktOTRjYS05M2VmZGY3NzkzZTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.iyycWmOXbgukFlWUkIDUUorEZVJ3qK12PYkRzZNRN3M"
            			end;
            			
            			if sheet.NomeHabilidade == "Conhecimento Antigo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eiy9-5209f0cf-08e6-4e19-8ae6-9babf5a2ddc0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl5OS01MjA5ZjBjZi0wOGU2LTRlMTktOGFlNi05YmFiZjVhMmRkYzAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.FgCWVFd1YmSCRLKqXlT40PVXJ7TQjj5IP2aqtTRAb6c"
            			end;
            			
            			if sheet.NomeHabilidade == "Tornado de Mana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eix1-936cea3d-1b9c-41e6-8150-d396f65b492e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl4MS05MzZjZWEzZC0xYjljLTQxZTYtODE1MC1kMzk2ZjY1YjQ5MmUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.sU6w9tB6yskgYzdPikbeBphMRM8UOR4LbvGN6C-kzyo"
            			end;
            			
            			if sheet.NomeHabilidade == "Dissipar Magia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eiy7-11907d84-20c4-4698-ae26-95a78143f060.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl5Ny0xMTkwN2Q4NC0yMGM0LTQ2OTgtYWUyNi05NWE3ODE0M2YwNjAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.rJ-v6DZoAKRZFOBnYsZpa31KokqwRv2BWMdhGEIhwNg"
            			end;
            			
            			if sheet.NomeHabilidade == "Pilar Magico" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eixn-6d9769e3-a82a-4222-97df-fea106a691b3.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl4bi02ZDk3NjllMy1hODJhLTQyMjItOTdkZi1mZWExMDZhNjkxYjMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.wPrsUY0aEDXeHnO2LxY9QLwjf6n9yhZaTgGS_djT4ss"
            			end;
            			
            			if sheet.NomeHabilidade == "Flash" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eiy2-1b9265f4-8efa-41e6-a961-b68df329471d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl5Mi0xYjkyNjVmNC04ZWZhLTQxZTYtYTk2MS1iNjhkZjMyOTQ3MWQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.znJtr0xuHGmmHWaQyG5zMG5vQyvTxb57sU9rjVdMJG0"
            			end;
            			
            			if sheet.NomeHabilidade == "Selo Arcano" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eiyc-ef89367a-d35c-4236-863d-54c04daf9380.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl5Yy1lZjg5MzY3YS1kMzVjLTQyMzYtODYzZC01NGMwNGRhZjkzODAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.1ZxOyDA_kVuu1aON5FoRc0DZmGEKL96PUXbCgQzLw5Q"
            			end;
            			
            			if sheet.NomeHabilidade == "Enrolar a linguá" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3ejq4-70b10ab9-378e-4fb1-8cb5-a9638cb6f9df.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWpxNC03MGIxMGFiOS0zNzhlLTRmYjEtOGNiNS1hOTYzOGNiNmY5ZGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.A21rpVsFN46v3qJA9ldvW5J4a3ZSURGnc5KQKs0hsvs"
            			end;
            			
            			if sheet.NomeHabilidade == "Costurar Boca" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eix7-dad72248-c5ac-4d26-a76a-4a07124f0533.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl4Ny1kYWQ3MjI0OC1jNWFjLTRkMjYtYTc2YS00YTA3MTI0ZjA1MzMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Dt8cta90u1jlzWU-5X37v9UYaqz6zVrXLBskEIH7NLw"
            			end;
            			
            			if sheet.NomeHabilidade == "Parede Arcana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eixp-42f045a4-fdc2-49c1-a902-9871aafe5860.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl4cC00MmYwNDVhNC1mZGMyLTQ5YzEtYTkwMi05ODcxYWFmZTU4NjAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.XxIdN8JrFv8m5i3coMn9px-k6cnqCddwPAistwTYcsA"
            			end;
            			
            			if sheet.NomeHabilidade == "Polimorfia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eixk-be7c6e5f-f11f-4f82-81b2-1cf1f3b161ee.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl4ay1iZTdjNmU1Zi1mMTFmLTRmODItODFiMi0xY2YxZjNiMTYxZWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.jEZ70TdSeiWYwz896VtDeRS0u5mzuu5D8T8TIXEWbQY"
            			end;
            			
            			if sheet.NomeHabilidade == "Visão Arcana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eiwz-33af767b-862d-48a8-ae62-2d7e574e0972.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl3ei0zM2FmNzY3Yi04NjJkLTQ4YTgtYWU2Mi0yZDdlNTc0ZTA5NzIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.clqDIrpnvTbozYNTD7YlB5suSqIdVlmF_iEFhByD_GM"
            			end;
            			
            			if sheet.NomeHabilidade == "Marca Arcana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eixx-06abb3d9-8e7d-438f-988c-46a7c5511768.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl4eC0wNmFiYjNkOS04ZTdkLTQzOGYtOTg4Yy00NmE3YzU1MTE3NjgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Z52m8mbFocligAk0oJOfYrDPpWSzqCgfgmmTS0R9cZg"
            			end;
            			
            			if sheet.NomeHabilidade == "Abertura dos Portões Arcanos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eiyd-25e8b1d5-3ecc-4ddd-849e-08c398594924.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl5ZC0yNWU4YjFkNS0zZWNjLTRkZGQtODQ5ZS0wOGMzOTg1OTQ5MjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.EIz4bLVkTk0fdVcWBkZlCuLpyhqfY4GR06HIsAq88ew"
            			end;
            			
            			if sheet.NomeHabilidade == "Quebrar o Tempo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eixh-e1cbb143-9b9d-4f44-935b-f660584d6d67.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl4aC1lMWNiYjE0My05YjlkLTRmNDQtOTM1Yi1mNjYwNTg0ZDZkNjcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.EVAsVlv-sjGF7Eo8hBsi9pqIoRmIh3JYJQOrc94VNSI"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Roubar Magia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3eixb-52c3c378-350a-4d45-a6cb-05c248b6ba00.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZWl4Yi01MmMzYzM3OC0zNTBhLTRkNDUtYTZjYi0wNWMyNDhiNmJhMDAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.cChyIpfOLOVJGJLvxJP8xJGtQhOIUR5f-9apysSJKvc"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Fogo Frio" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fijk-4168be4e-344b-413c-8e59-f4b3eac33b9c.png/v1/fit/w_150,h_150,q_70,strp/fogofrio_by_karelsama_df3fijk-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTM2OSIsInBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmlqay00MTY4YmU0ZS0zNDRiLTQxM2MtOGU1OS1mNGIzZWFjMzNiOWMucG5nIiwid2lkdGgiOiI8PTEwNTUifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.WuiSYrkUXyKvzrx7_kt0odnSMI58fPyu_GyeSgnmLDY"
            			end;
            			
            			if sheet.NomeHabilidade == "Seta de Gelo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhuh-7be34dce-d594-41ac-a3a6-c2b020ac95c8.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh1aC03YmUzNGRjZS1kNTk0LTQxYWMtYTNhNi1jMmIwMjBhYzk1YzgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.IlRMXTtGxBYWEuyEtpni8ght_GjmH2sgLrMFSpkzzYs"
            			end;
            			
            			if sheet.NomeHabilidade == "Companheiro Magico" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhw4-9705d5b1-e4f6-4974-95cf-b8b26617a5fb.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh3NC05NzA1ZDViMS1lNGY2LTQ5NzQtOTVjZi1iOGIyNjYxN2E1ZmIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.OjjsTEDCu_XGYYgBvy-jLnHNAxzFL8-spN4GCSEqdOg"
            			end;
            			
            			if sheet.NomeHabilidade == "Nevoeiro" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhux-422475ef-0932-43be-8e57-aa417aa31905.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh1eC00MjI0NzVlZi0wOTMyLTQzYmUtOGU1Ny1hYTQxN2FhMzE5MDUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.W8Orh1FIhXwQmubGSMxqYi_T-f6l7T-9gBrEB-9oU9Q"
            			end;
            			
            			if sheet.NomeHabilidade == "Sopro Draconico" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhua-d1ae91ad-e911-4393-907e-a14d8cc3ba92.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh1YS1kMWFlOTFhZC1lOTExLTQzOTMtOTA3ZS1hMTRkOGNjM2JhOTIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.LdnW1kxaL7dAqULbvkGL-JGf6nIzWcaYMxVIVVWB-Gc"
            			end;
            			
            			if sheet.NomeHabilidade == "Incendiar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhvf-a02042a8-9427-408d-93af-c709ea0e3dec.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh2Zi1hMDIwNDJhOC05NDI3LTQwOGQtOTNhZi1jNzA5ZWEwZTNkZWMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Dwb89hWO4HsevBSrkiSU39yA7ZDAYa6rSHylfYcCF0g"
            			end;
            			
            			if sheet.NomeHabilidade == "Cintilar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3q4pr-670ce5ed-834b-410e-b689-8fbf1581e38b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzcTRwci02NzBjZTVlZC04MzRiLTQxMGUtYjY4OS04ZmJmMTU4MWUzOGIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.pfuhsbBykC3JTXWzUzL8TH1o75wcoHBacGbYQAmU8xk"
            			end;
            			
            			if sheet.NomeHabilidade == "Senhor das Chamas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhuo-6bf699cc-d2af-4b65-86e4-4add2b4676ba.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh1by02YmY2OTljYy1kMmFmLTRiNjUtODZlNC00YWRkMmI0Njc2YmEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Le5mcRweehEBaGEq4e5-bME0ZPq8JY0dSibb7cPXXzw"
            			end;
            			
            			if sheet.NomeHabilidade == "Senhor Gélido" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhul-de84249d-f1df-4f98-96b2-6c8edc67f2dc.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh1bC1kZTg0MjQ5ZC1mMWRmLTRmOTgtOTZiMi02YzhlZGM2N2YyZGMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.xT7WpPOfaFkf0hbW9tSO_VrgyP_rqza_ql1OQQoV9ro"
            			end;
            			
            			if sheet.NomeHabilidade == "Drenar Mana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhv9-d1df6c35-bbe1-4432-b86b-2f03016e5b3d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh2OS1kMWRmNmMzNS1iYmUxLTQ0MzItYjg2Yi0yZjAzMDE2ZTViM2QucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.KOOi5CUfg-zIPXr_qvcWKm9zGjdnKvJmvTEuRDMqKkE"
            			end;
            			
            			if sheet.NomeHabilidade == "Silenciar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhue-85b90791-c396-4ef2-a160-fc5968a26231.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh1ZS04NWI5MDc5MS1jMzk2LTRlZjItYTE2MC1mYzU5NjhhMjYyMzEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.N_ljRR8ilxN6R_9scYTWo07XqkOsfs8CwD96BptEtt0"
            			end;
            			
            			if sheet.NomeHabilidade == "Dissipar Magia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhvw-1d98c283-08e3-4d18-88ad-8876be0d1d3a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh2dy0xZDk4YzI4My0wOGUzLTRkMTgtODhhZC04ODc2YmUwZDFkM2EucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.9AGbzwS7SeaFw8W8W8CSkfWyeJAYn8wowEr84ny3RM8"
            			end;
            			
            			if sheet.NomeHabilidade == "Marca Arcana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhv2-00ddfb20-3e3f-47b2-b8b0-dd091b0cfd90.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh2Mi0wMGRkZmIyMC0zZTNmLTQ3YjItYjhiMC1kZDA5MWIwY2ZkOTAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.doUC6XfI-je8udqaAeqEp-A7YdGrCginPzHu3q38TCc"
            			end;
            							
            			if sheet.NomeHabilidade == "Criogenização" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhw1-a4520f6a-36ef-4952-b0bd-ea6c4d29233a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh3MS1hNDUyMGY2YS0zNmVmLTQ5NTItYjBiZC1lYTZjNGQyOTIzM2EucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ZKRlf8zEEX1Z3gGqX5Puzy3REdCzCyr32Lg8N75AAr8"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Teleportar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhuq-39487d59-5441-4c13-b0b3-c6029b4bf1f0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh1cS0zOTQ4N2Q1OS01NDQxLTRjMTMtYjBiMy1jNjAyOWI0YmYxZjAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.u0bGBpOAUDfJS-ePDdG0B2rEiZQ54KNbNkuM7VXrdQE"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Recarregar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhut-78192926-a5cd-4e65-a2f2-5d6efa68064d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh1dC03ODE5MjkyNi1hNWNkLTRlNjUtYTJmMi01ZDZlZmE2ODA2NGQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.vqCZAj9kjpGx-G_FNGeDY2eC2fLyMLksfNKYGhOmPHM"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Dobro do Custo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3fhvt-41d1694a-88bf-4b7f-a8c8-8dca592d0205.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZmh2dC00MWQxNjk0YS04OGJmLTRiN2YtYThjOC04ZGNhNTkyZDAyMDUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.tMkS1MATM3kquSEuZ0qC2H0weL1vAnRCuCks1wHCKEE"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Summon" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3gyzk-24ea5a2d-8ec7-4ab2-a1db-8a73f89cff62.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZ3l6ay0yNGVhNWEyZC04ZWM3LTRhYjItYTFkYi04YTczZjg5Y2ZmNjIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Lv88np3Cwe5eJbHWPem0M12NyNUQA5bnQCjBCZ_R9d0"
            			end;
            			
            			if sheet.NomeHabilidade == "Curar Summon" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3gz06-6f989ffd-64e9-4074-8170-9998b674e334.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZ3owNi02Zjk4OWZmZC02NGU5LTQwNzQtODE3MC05OTk4YjY3NGUzMzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.FfOwLoSK1BcY4zFvYD_ODsMDaJFSOSg2SY8hYWV0elI"
            			end;	
            			
            			if sheet.NomeHabilidade == "Amarrar Músculos" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h0lb-7e2748a3-da29-4030-ac77-216eb3fd653a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDBsYi03ZTI3NDhhMy1kYTI5LTQwMzAtYWM3Ny0yMTZlYjNmZDY1M2EucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.KEClzz7Fh25KoC7N7bKyjvvGTPZZhJvWexCPRv9R6Nk"
            			end;
            			
            			if sheet.NomeHabilidade == "Fortificar Summon" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3gyzr-b3658342-4d3d-4fa8-a087-10eb09fbcc02.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZ3l6ci1iMzY1ODM0Mi00ZDNkLTRmYTgtYTA4Ny0xMGViMDlmYmNjMDIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.utEW-IDMBOx80m70k_oZmZIz0s_nxGT9sPYtYfmBu_M"
            			end;
            			
            			if sheet.NomeHabilidade == "Troca Equivalente" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3gyzi-f4179908-92df-4d0a-9dc6-b6f7fe8ee0ab.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZ3l6aS1mNDE3OTkwOC05MmRmLTRkMGEtOWRjNi1iNmY3ZmU4ZWUwYWIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._BWil_uqfNaZX9BdXhjZiorSJGUBxZQyRh1VOz1LY4s"
            			end;
            			
            			if sheet.NomeHabilidade == "Aumentar Velocidade" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3gz08-48b4d0fd-54db-4adc-9855-7bf2f9fff45b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZ3owOC00OGI0ZDBmZC01NGRiLTRhZGMtOTg1NS03YmYyZjlmZmY0NWIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.YQJ3mFhvK8htL9nMHPxyYjAFPg4nOxtwSqH9AIG8Pxw"
            			end;
            			
            			if sheet.NomeHabilidade == "Sacrifício" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3gyzu-ec2a46a2-0343-40ee-9046-3e7cf0e23fb4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZ3l6dS1lYzJhNDZhMi0wMzQzLTQwZWUtOTA0Ni0zZTdjZjBlMjNmYjQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.6IW7hFWNNuSpMHn93GHiPpmj5kWkxRpmWpaNYHPPPQU"
            			end;
            			
            			if sheet.NomeHabilidade == "Fantasma da Mana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3gz02-a943ceb1-f4e8-457c-8de4-1073e273de11.png/v1/fit/w_150,h_150,q_70,strp/fantasma_da_mana_by_karelsama_df3gz02-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzAwIiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjNnejAyLWE5NDNjZWIxLWY0ZTgtNDU3Yy04ZGU0LTEwNzNlMjczZGUxMS5wbmciLCJ3aWR0aCI6Ijw9MzAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.wkuyB2iDvPMXCFiY5H-DFRlNbEZMKpX8lPivqgF9SRs"
            			end;
            			
            			if sheet.NomeHabilidade == "Dissipar Magia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3gz04-7c495770-6a76-4d31-aca8-4183ce365056.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZ3owNC03YzQ5NTc3MC02YTc2LTRkMzEtYWNhOC00MTgzY2UzNjUwNTYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ZUspi0dhErHbCgg-Iter3sRd6K7VTkzE3uk9YFjRcKU"
            			end;
            			
            			if sheet.NomeHabilidade == "Mestre das Summons" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3gzqa-d4ca4926-b08a-4efd-a44b-2207cb43b52b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzZ3pxYS1kNGNhNDkyNi1iMDhhLTRlZmQtYTQ0Yi0yMjA3Y2I0M2I1MmIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.WQ7T3PyO9WXZQVhki6UnpHztnlK8QdJqv9nYODM0djc"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Invocador Ilimitado" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h0l6-dfe7bc13-9be6-4aba-b065-7cbe525a518d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDBsNi1kZmU3YmMxMy05YmU2LTRhYmEtYjA2NS03Y2JlNTI1YTUxOGQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.vkRsJG0m4kZWMy_rtBA-sg4wMIYg-DfwMwdUhV-uTG4"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;	
            
            			if sheet.NomeHabilidade == "Duelo Limpo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1ba-fdee3671-c56f-4edf-8e0a-58fc9284a21d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFiYS1mZGVlMzY3MS1jNTZmLTRlZGYtOGUwYS01OGZjOTI4NGEyMWQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.AGetLb3HO_SelIfviaCDWv3zxGSPyhkcxiK3eWtas9Q"
            			end;
            			
            			if sheet.NomeHabilidade == "Desafio" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1bf-6b8bba12-ad6f-4f3d-adb2-0eb621c20627.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFiZi02YjhiYmExMi1hZDZmLTRmM2QtYWRiMi0wZWI2MjFjMjA2MjcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.R2QEmUNn210lFjnc6K_Z7Jj6m_VqWSPf6oTVvdEmvFU"
            			end;
            			
            			if sheet.NomeHabilidade == "Duelando Contra um Exercito" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1bd-7a0def7b-7471-4ae8-92a6-99214d4319c1.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFiZC03YTBkZWY3Yi03NDcxLTRhZTgtOTJhNi05OTIxNGQ0MzE5YzEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ydFyIKs2UVbkaxAhRGm1F6IRMV4Kwjvg538ahaH0Mbo"
            			end;
            			
            			if sheet.NomeHabilidade == "Força é Poder de Fogo" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1b5-37b0ad3e-c915-423c-a353-76ad55917f3a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFiNS0zN2IwYWQzZS1jOTE1LTQyM2MtYTM1My03NmFkNTU5MTdmM2EucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Gym-TwCAizEO8ks0DLunG4lfHPdk2k-eDL82u3S1Nes"
            			end;
            			
            			if sheet.NomeHabilidade == "Aparar Golpe" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1e5-5d4ac8e1-8c0a-4f0d-95dc-38fbd87fd37f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFlNS01ZDRhYzhlMS04YzBhLTRmMGQtOTVkYy0zOGZiZDg3ZmQzN2YucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.yIyuurZoE2PztLhMVD3VDPSL6bwDY8bDI9Tg0F8gGRI"
            			end;
            			
            			if sheet.NomeHabilidade == "Resistência Magica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1b0-f3943f86-f1b3-4e44-8684-7036989f69aa.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFiMC1mMzk0M2Y4Ni1mMWIzLTRlNDQtODY4NC03MDM2OTg5ZjY5YWEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.QxcYzn-BCLbknUtwYdQAgUAMWQUtT4LgGyp-VMVdWZc"
            			end;
            			
            			if sheet.NomeHabilidade == "Frenesi da Guerra" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1b3-6a90acc5-0cf1-48ce-9da4-113568c74dbd.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFiMy02YTkwYWNjNS0wY2YxLTQ4Y2UtOWRhNC0xMTM1NjhjNzRkYmQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.pBxXLoaQsTNQ-l_I87LfsGET4ZOYq3o0moWWH9eAs7A"
            			end;
            			
            			if sheet.NomeHabilidade == "Coração Valente" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1bh-4bcacb44-86c2-4223-b3a8-ab3c07c9d014.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFiaC00YmNhY2I0NC04NmMyLTQyMjMtYjNhOC1hYjNjMDdjOWQwMTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.LuAgvw0XYu0vPwBimIEb6P72Uf2S_wVWaqLl_txqBpY"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Troféu" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1ax-20d5fd9a-cfb5-43f7-86e7-7f1e0e0b87a7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFheC0yMGQ1ZmQ5YS1jZmI1LTQzZjctODZlNy03ZjFlMGUwYjg3YTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.6vVX1sFjkKePX8X5a2sxIQz5-ciEUSHDYBtCoQZj7XA"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Espadachim" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1b8-ff8ab953-41e5-46b0-a6c4-366734dd95b9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFiOC1mZjhhYjk1My00MWU1LTQ2YjAtYTZjNC0zNjY3MzRkZDk1YjkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.663RhztPhbapkU9VjOKfeIWCMdjokmH4uoH7ACHKnQA"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;			
            			
            			if sheet.NomeHabilidade == "Fintar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3hko1-92659882-e15a-4eaf-a028-0630376509a9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaGtvMS05MjY1OTg4Mi1lMTVhLTRlYWYtYTAyOC0wNjMwMzc2NTA5YTkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.mQ0s_DZcVM-SkEdJKkP_xARrybcY7JN4YR8cEkTuO-U"
            			end;
            			
            			if sheet.NomeHabilidade == "Disparo Penetrante" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3hkoc-93ba52cb-206d-4a8f-a8da-8717c4b2a487.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaGtvYy05M2JhNTJjYi0yMDZkLTRhOGYtYThkYS04NzE3YzRiMmE0ODcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.v2vVMKht45mPvBjOTiwBYYvrYYhmJPmR2E9RvsLqPYg"
            			end;
            			
            			if sheet.NomeHabilidade == "1 Garrafa de Rum" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3hkp5-defd5858-c511-4d09-a9c8-7ee0869a29c4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaGtwNS1kZWZkNTg1OC1jNTExLTRkMDktYTljOC03ZWUwODY5YTI5YzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.OewpvWWkVZJa5_j8DyiJO1eotkk0pB_ze4nAO3UTlNE"
            			end;
            			
            			if sheet.NomeHabilidade == "Aparar e Atacar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3h1e5-5d4ac8e1-8c0a-4f0d-95dc-38fbd87fd37f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaDFlNS01ZDRhYzhlMS04YzBhLTRmMGQtOTVkYy0zOGZiZDg3ZmQzN2YucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.yIyuurZoE2PztLhMVD3VDPSL6bwDY8bDI9Tg0F8gGRI"
            			end;
            			
            			if sheet.NomeHabilidade == "Dança dos Sete Mares" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3hkoh-3cd3262f-ec71-4241-a924-b798572d76d9.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaGtvaC0zY2QzMjYyZi1lYzcxLTQyNDEtYTkyNC1iNzk4NTcyZDc2ZDkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.OiC_LZDu8VInp1GLv-ccLWu7CoGsvG6sjvwSJEHCPes"
            			end;
            			
            			if sheet.NomeHabilidade == "Corte Marinho" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3hkom-e2bc0881-6842-4ec8-93f2-5171555f42c4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaGtvbS1lMmJjMDg4MS02ODQyLTRlYzgtOTNmMi01MTcxNTU1ZjQyYzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.kmZdmVjxTmFCovBYX8LVduasDZencsp4VnH5BHz8d2I"
            			end;
            			
            			if sheet.NomeHabilidade == "Saraivada de Balas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3hknk-1ed785ec-4141-4f7f-8536-e2caf1b97d36.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaGtuay0xZWQ3ODVlYy00MTQxLTRmN2YtODUzNi1lMmNhZjFiOTdkMzYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.87VFzYPBpma1lCqgLSaMyuT-LE4P2uv1VDZQETSN3Io"
            			end;
            			
            			if sheet.NomeHabilidade == "Roubando no Dado" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3hkp0-b35e44e7-2a5c-4ad2-8ede-522cc2672adf.png/v1/fit/w_150,h_150,q_70,strp/95990_broche_dado_d20_you_are_fucked_5d68a48e73a82_by_karelsama_df3hkp0-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjAwIiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjNoa3AwLWIzNWU0NGU3LTJhNWMtNGFkMi04ZWRlLTUyMmNjMjY3MmFkZi5wbmciLCJ3aWR0aCI6Ijw9NjAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.Xll9oaL-qMcAU-Qx9hGyUq7b1oBgPUM_kGF3jiSb53E"
            			end;
            			
            			if sheet.NomeHabilidade == "Neblina" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3hknp-c6341164-69b5-4089-b02c-2d346ff62874.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaGtucC1jNjM0MTE2NC02OWI1LTQwODktYjAyYy0yZDM0NmZmNjI4NzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.cycdhvA4FPNAIoexWHyVELRrJcjSeZIRxRBbpaNz8xs"
            			end;
            			
            			if sheet.NomeHabilidade == "Barragem de Canhão" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3hkoq-ff02ea9a-47e2-42ef-be86-7ceda0bc01c4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaGtvcS1mZjAyZWE5YS00N2UyLTQyZWYtYmU4Ni03Y2VkYTBiYzAxYzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.tazDpNygapM0cGe2gFk1iP4eIcM2tliVRCiNW2n5i1g"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Navio Fantasma" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3hknu-2ffb3dbd-9595-4c16-bb7d-9317091f9d6c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaGtudS0yZmZiM2RiZC05NTk1LTRjMTYtYmI3ZC05MzE3MDkxZjlkNmMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.grgqBjkAa0_Qlx8c4A5jiK6GQipJbyf1O2MQ6VriWfk"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			
            			if sheet.NomeHabilidade == "Marca da Harmónica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfyqt9e-6244be0a-121a-4c16-81cf-56156e42e0f5.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ5cXQ5ZS02MjQ0YmUwYS0xMjFhLTRjMTYtODFjZi01NjE1NmU0MmUwZjUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.WQ04ZUETT8AA1Xvd-cYhiJW6DL2Mi7JJf9A5-028FRY"
            			end;
            			
            			if sheet.NomeHabilidade == "Barreira de Vento" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfyqt9y-3a93aa69-33ff-4b06-9a2a-3522b6d1fe28.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ5cXQ5eS0zYTkzYWE2OS0zM2ZmLTRiMDYtOWEyYS0zNTIyYjZkMWZlMjgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.GjpSnDbt5sdy6DspmrKCzFI3CITPmzuMzGgeMeGxfQ8"
            			end;
            			
            			if sheet.NomeHabilidade == "Vendaval Veloz" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfyqt8m-c47b9638-4146-4a74-833d-7acca55544a3.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ5cXQ4bS1jNDdiOTYzOC00MTQ2LTRhNzQtODMzZC03YWNjYTU1NTQ0YTMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.D8q_mwaKVkdgonhUbWVJH_V7PcTQ7IVl9sySUUjl8FE"
            			end;
            			
            			if sheet.NomeHabilidade == "Explosão da Serenidade" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfyqt9p-9e85b699-9db2-4114-badd-c1fde9385f6a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ5cXQ5cC05ZTg1YjY5OS05ZGIyLTQxMTQtYmFkZC1jMWZkZTkzODVmNmEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3lKEf2GL8ChyBD6LE1BdEWdrB2Dt1jOE0_TviSyakwg"
            			end;
            			
            			if sheet.NomeHabilidade == "Cura Serena" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfyqt9v-c405dfe8-9080-45fb-a78d-c3f794284539.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ5cXQ5di1jNDA1ZGZlOC05MDgwLTQ1ZmItYTc4ZC1jM2Y3OTQyODQ1MzkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.a6ShslXUD-OJtfv8no3qP5dAlyRYPGIHRfb8UY7MlPA"
            			end;
            			
            			if sheet.NomeHabilidade == "Passo Protetor" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfyqt9a-a3799d19-9e38-4072-8a08-1d75368d66e2.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ5cXQ5YS1hMzc5OWQxOS05ZTM4LTQwNzItOGEwOC0xZDc1MzY4ZDY2ZTIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.nEkOuLIT1Kj64k8cKsTseB-9dCcD5JSCuFWIle6tiJw"
            			end;
            			
            			if sheet.NomeHabilidade == "Toque da Serenidade" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfyqt8y-3c719fdd-f542-49fd-a28c-f12ddb0bd808.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ5cXQ4eS0zYzcxOWZkZC1mNTQyLTQ5ZmQtYTI4Yy1mMTJkZGIwYmQ4MDgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.TI2hPXsv1D7kHxL-jIvzfhyxTv3nO7aSu744-K7_kGk"
            			end;
            			
            			if sheet.NomeHabilidade == "Impacto Sereno" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfyqt9j-ec7e557f-ecfb-49fb-b4f4-cab54f1d2748.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ5cXQ5ai1lYzdlNTU3Zi1lY2ZiLTQ5ZmItYjRmNC1jYWI1NGYxZDI3NDgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.6HOhpZYfq_9J6SDKAPzBs2vwL-wFtayTsWSaZ2VNVvM"
            			end;
            			
            			if sheet.NomeHabilidade == "Marcação Tríplice" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfz1as3-30eb7a9a-cbd3-408f-8e39-96b6a2cf1518.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ6MWFzMy0zMGViN2E5YS1jYmQzLTQwOGYtOGUzOS05NmI2YTJjZjE1MTgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Z8Yqc67teZIcjul8K2DAT39p9O6Zv21sSt2B1H6IARE"
            			end;
            			
            			if sheet.NomeHabilidade == "Toque da Morte" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfyqt94-0f1fa439-021e-4246-8555-91a379687d5a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ5cXQ5NC0wZjFmYTQzOS0wMjFlLTQyNDYtODU1NS05MWEzNzk2ODdkNWEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.pjV-YqIoMOkFkGw3-0nkPpTqbFhMohPIebw-ha3gt7Y"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Transcendencia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfyqt8u-ec34cfdd-197f-4878-9dee-ad73a70397fe.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZ5cXQ4dS1lYzM0Y2ZkZC0xOTdmLTQ4NzgtOWRlZS1hZDczYTcwMzk3ZmUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Q2_aZQThVDiD1AhJkxWmM0XWq5hSrWWrhcIzeRBhQco"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;	
            			
            			
            			if sheet.NomeHabilidade == "Postura do Tigre" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3izdn-febf8363-3749-4410-a880-f2df999eed59.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaXpkbi1mZWJmODM2My0zNzQ5LTQ0MTAtYTg4MC1mMmRmOTk5ZWVkNTkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.nNa98u55Umj32SwIUSetbtfcT1jzycXaXJWCFatwIjU"
            			end;
            			
            			if sheet.NomeHabilidade == "Postura da Tartaruga" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3izdq-8a206126-2c36-4c5b-85e4-1d4a838e9905.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaXpkcS04YTIwNjEyNi0yYzM2LTRjNWItODVlNC0xZDRhODM4ZTk5MDUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.hOf-bugZDECTyGHX0c9hw-DvSOoRrlSml1GyxZYPl2Y"
            			end;
            			
            			if sheet.NomeHabilidade == "Postura do Urso" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3izdl-b8db8f64-64b5-448e-a5fb-055bee39bb66.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaXpkbC1iOGRiOGY2NC02NGI1LTQ0OGUtYTVmYi0wNTViZWUzOWJiNjYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.8Gj0Vy6GvK7nvDb2rCVwuxMrNwfSieddNZTKpvZpFcc"
            			end;
            			
            			if sheet.NomeHabilidade == "Postura da Fênix" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3izdu-57c655b7-f6de-4702-af23-48a5f581c6af.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaXpkdS01N2M2NTViNy1mNmRlLTQ3MDItYWYyMy00OGE1ZjU4MWM2YWYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.GtmPigQjJYBd3DPu4BvDxlGq3zSF-sb-l7VDG2noddA"
            			end;
            			
            			if sheet.NomeHabilidade == "Postura do Parasita" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3izdo-812f42c6-3355-4657-8ccf-0e70a0393935.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaXpkby04MTJmNDJjNi0zMzU1LTQ2NTctOGNjZi0wZTcwYTAzOTM5MzUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.wokPIQpzamb1HtnYAm-QE6l-VhlvtAZVCr9IYYZQIi4"
            			end;
            			
            			if sheet.NomeHabilidade == "Postura da Garça" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3izds-d02e1dc7-a21b-442a-8b85-fdd1d2c25aae.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaXpkcy1kMDJlMWRjNy1hMjFiLTQ0MmEtOGI4NS1mZGQxZDJjMjVhYWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.26qnHFiML-ivh3UNeoajRhX9QAj_qAsmC4iezfMCNMc"
            			end;
            			
            			if sheet.NomeHabilidade == "Espirito do Dragão de Jade" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3izdy-ae499716-a93d-4fa5-89eb-f8b37bf88b56.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaXpkeS1hZTQ5OTcxNi1hOTNkLTRmYTUtODllYi1mOGIzN2JmODhiNTYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.NB0Yldwjc5GARIbJAqVL50dlHVbts6smbje3egsOQsA"
            			end;
            			
            			if sheet.NomeHabilidade == "Espirito do Tarrasque" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3izdw-b0a74482-3278-42bb-a8db-6227b069faf7.png/v1/fit/w_150,h_150,q_70,strp/espirito_do_trrasque_by_karelsama_df3izdw-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjU2IiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjNpemR3LWIwYTc0NDgyLTMyNzgtNDJiYi1hOGRiLTYyMjdiMDY5ZmFmNy5wbmciLCJ3aWR0aCI6Ijw9MjU2In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.jTpRTI2FBRkbysuGtUgBgBDjBrqj71qdL6dqxYU_RIY"
            			end;
            			
            			if sheet.NomeHabilidade == "Livramento Espiritual" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3izdv-72cb2891-0e1f-467b-9e3f-20495bafd583.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaXpkdi03MmNiMjg5MS0wZTFmLTQ2N2ItOWUzZi0yMDQ5NWJhZmQ1ODMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Is7GIEvC_xYG7YxsSaaQwjnGYcUbJd5Fq8fbTj4F6B8"
            			end;
            			
            			if sheet.NomeHabilidade == "Chi" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3ize3-91772d2b-3b2e-4a5c-a944-7c7af1e7bc34.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaXplMy05MTc3MmQyYi0zYjJlLTRhNWMtYTk0NC03YzdhZjFlN2JjMzQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.d3e3COg47NQXKaEBNpi4_TZMvzljzj94SfkY822Dja0"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Dano em Vida" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3ize1-62f4a714-ada8-4826-a314-d5daebb85d8f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzaXplMS02MmY0YTcxNC1hZGE4LTQ4MjYtYTMxNC1kNWRhZWJiODVkOGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.8tbjUHj1NvUvB14R9CmxhUN9CWxtSq5j5WIc1MY_9k0"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;			
            			
            			if sheet.NomeHabilidade == "Aura Gélida" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3jol5-5d9fb728-0d45-4df6-96b8-7a0922f6cf3b.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9sNS01ZDlmYjcyOC0wZDQ1LTRkZjYtOTZiOC03YTA5MjJmNmNmM2IucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3AsXd1QtYuJ4qBJmQKXq-nlxAyNV3UJJEhIGGOsf63w"
            			end;
            			
            			if sheet.NomeHabilidade == "Aura Sangrenta" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3jol1-82ab2e36-1d10-40c2-af66-9817a67f8d98.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9sMS04MmFiMmUzNi0xZDEwLTQwYzItYWY2Ni05ODE3YTY3ZjhkOTgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.50yH5L-_-yYiFJzFh09W95yqp-NjPf08DjdwDlzGgBM"
            			end;
            			
            			if sheet.NomeHabilidade == "Aura Profana" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3jol3-8061b687-9d09-41fe-aed4-57078edaf0af.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9sMy04MDYxYjY4Ny05ZDA5LTQxZmUtYWVkNC01NzA3OGVkYWYwYWYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.jufnWdHV2oEqZCN57gEE7KtTbVFMSK0ahRvQkTUy0YM"
            			end;
            			
            			if sheet.NomeHabilidade == "Alma Dependente" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3jolb-97877c5c-ae46-4f75-bbf6-4515918a6b1a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9sYi05Nzg3N2M1Yy1hZTQ2LTRmNzUtYmJmNi00NTE1OTE4YTZiMWEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.EA8UPHQ1k5JlnjDvoEsF0s4fY7kO7eUVU79_wRQjApE"
            			end;
            			
            			if sheet.NomeHabilidade == "Golpe da Morte" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3joki-7d9afafe-071d-4dab-9f77-0c7b564f4017.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9raS03ZDlhZmFmZS0wNzFkLTRkYWItOWY3Ny0wYzdiNTY0ZjQwMTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.W1bzXUTRUXTNEqpVF-mnVD_4FafHfcKUz8pZ_iwhIV0"
            			end;
            			
            			if sheet.NomeHabilidade == "Espiral da Morte" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3joko-c8694015-c9f1-4cbc-92d2-4ecf9af4cae4.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9rby1jODY5NDAxNS1jOWYxLTRjYmMtOTJkMi00ZWNmOWFmNGNhZTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.0TOdu0IeNjvWkBG5_AeOrM-FZ0e06N0_dlDN9EdJz2I"
            			end;
            			
            			if sheet.NomeHabilidade == "Sangue Fervente" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3joka-df879728-234d-4751-a837-435364aa2a01.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9rYS1kZjg3OTcyOC0yMzRkLTQ3NTEtYTgzNy00MzUzNjRhYTJhMDEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.RAPZsa_XIlc0nNwcBcP64Q83H_uUaxa40HGzpqdLiwI"
            			end;
            			
            			if sheet.NomeHabilidade == "Toque Congelante" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3jok8-b8307593-e4e3-4af9-85c8-6550ab2f82cf.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9rOC1iODMwNzU5My1lNGUzLTRhZjktODVjOC02NTUwYWIyZjgyY2YucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.KL7L7p3uomSberGpDxam8EpqxwpBkyBhyJG616Ep8Ew"
            			end;
            			
            			if sheet.NomeHabilidade == "Inverno Impiedoso" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3jokg-7e3c67ce-9aa6-4d40-87d8-ac41351eb2a7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9rZy03ZTNjNjdjZS05YWE2LTRkNDAtODdkOC1hYzQxMzUxZWIyYTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.ZFP91uxkCfMtcrm0ZCOiqAZ48irnrNE2ELot2B3axQ0"
            			end;
            			
            			if sheet.NomeHabilidade == "Garra da Morte" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3jokk-f65ce04d-2008-434a-b06d-d85a4aff4329.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9ray1mNjVjZTA0ZC0yMDA4LTQzNGEtYjA2ZC1kODVhNGFmZjQzMjkucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.H8CHjK0bp7N7IekwadBid-8xIZurifzcY25MYaLSnAE"
            			end;
            			
            			if sheet.NomeHabilidade == "Barreira Anti-Magica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3jokw-685b390c-c9c9-420e-9137-2f63124c931e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9rdy02ODViMzkwYy1jOWM5LTQyMGUtOTEzNy0yZjYzMTI0YzkzMWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.5cHEyWZ2VSIFmrUsbZMboFw2hsWI3AkdpdPmwcTiwBY"
            			end;
            			
            			if sheet.NomeHabilidade == "Arma Runica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfe8xor-469edfa6-d15f-46a2-9071-406ba6a37413.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZlOHhvci00NjllZGZhNi1kMTVmLTQ2YTItOTA3MS00MDZiYTZhMzc0MTMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.rhUXyPJ9zvBDe5NPy2bq4CvNjxQDROZJrou9MZxrXzw"
            			end;
            			
            			if sheet.NomeHabilidade == "Carniçal" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3joks-ba6ec8e2-3a6a-404a-b90f-92ab960807d8.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9rcy1iYTZlYzhlMi0zYTZhLTQwNGEtYjkwZi05MmFiOTYwODA3ZDgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.7jdQD0rropyPhPqEudtu_WDydfb69gvzOg9FlPuvRKU"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Abraço de Delevit" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3jolf-8b5748df-eafc-4806-b4d7-c27733e155c5.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9sZi04YjU3NDhkZi1lYWZjLTQ4MDYtYjRkNy1jMjc3MzNlMTU1YzUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VNZJPWSGmI8KdO1ZWbA4ZNw5jmros4-8nDfDEHtZ9-A"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Obliterar" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3jokd-3b836db2-87cc-489c-9eaf-de6de94c1fd6.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzam9rZC0zYjgzNmRiMi04N2NjLTQ4OWMtOWVhZi1kZTZkZTk0YzFmZDYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.QMIUJnva1DuV0h_n2oKH3imAQbJmwhrX8VIXZ1tcrf0"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Aura de Jamiel" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3j32f-b437bb0a-6d28-4fec-add2-504cfbc04b9c.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzajMyZi1iNDM3YmIwYS02ZDI4LTRmZWMtYWRkMi01MDRjZmJjMDRiOWMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.DEVOdUnlJ_eBXCiIObY41p3_b_MaVB2frALmJH0a_cw"
            			end;
            			
            			if sheet.NomeHabilidade == "Aura de Alinez" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3j32l-50713eb9-7f7e-477e-9c29-93379f274127.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzajMybC01MDcxM2ViOS03ZjdlLTQ3N2UtOWMyOS05MzM3OWYyNzQxMjcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._jQAiLABouar0bnjyRBHwYXOCVwQesQvDUayem_Yrn4"
            			end;
            			
            			if sheet.NomeHabilidade == "Aura de Thorin" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3j329-aa757e06-1143-4828-82a7-07b34e22ba7e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzajMyOS1hYTc1N2UwNi0xMTQzLTQ4MjgtODJhNy0wN2IzNGUyMmJhN2UucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Kv1p76P7Pa70-vuqfMuFPruVWL8O-eRPPYSBDZEdeOU"
            			end;
            			
            			if sheet.NomeHabilidade == "Punição Divina" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3j31y-7da65f1c-8eb7-49ca-a9c1-039aeaa40f0d.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzajMxeS03ZGE2NWYxYy04ZWI3LTQ5Y2EtYTljMS0wMzlhZWFhNDBmMGQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._Z6sd3pJcvB-BmFcEmBXSMuZ24UeXFZOk-f3eI0B5LY"
            			end;
            			
            			if sheet.NomeHabilidade == "Olhar da Penitencia" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3j322-81bf2481-ab5c-4194-8c70-c44bbbeceb0e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzajMyMi04MWJmMjQ4MS1hYjVjLTQxOTQtOGM3MC1jNDRiYmJlY2ViMGUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.9cNHsbybVKxWNZPs17aX-XtNdOblw9_sVAd05kSjxSk"
            			end;
            			
            			if sheet.NomeHabilidade == "Rastro de Cinzas" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/dfartzf-f656ffab-1f5f-4c2b-9552-5c201ae8b198.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGZhcnR6Zi1mNjU2ZmZhYi0xZjVmLTRjMmItOTU1Mi01YzIwMWFlOGIxOTgucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VJBf8rSx3yoOWIqIGz1bPwKxyD9EhkUtbtBajGzwayE"
            			end;
            			
            			if sheet.NomeHabilidade == "Perito em Mithril" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3j320-bcf1fb0a-3c82-45f1-9d18-60a08ab63026.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzajMyMC1iY2YxZmIwYS0zYzgyLTQ1ZjEtOWQxOC02MGEwOGFiNjMwMjYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.C-GMcDOZGxW97M7AdtdARLT-oV6rCQIyeKzNZV_r9H4"
            			end;
            			
            			if sheet.NomeHabilidade == "Fênix Caída" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3j325-62e5e021-0027-4d30-b9e5-d490a99f3394.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzajMyNS02MmU1ZTAyMS0wMDI3LTRkMzAtYjllNS1kNDkwYTk5ZjMzOTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.5-LCm91EbhymDqIJnzVXw3SMTy76lTo68_PxMvkbz_4"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Lamina do Dragão Vermelho" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvtr-fc1f5052-1345-4a99-b216-68bd5babf14f.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzd3Z0ci1mYzFmNTA1Mi0xMzQ1LTRhOTktYjIxNi02OGJkNWJhYmYxNGYucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.-Fyd1B6Q2V5rS8-IjkbxYS_It1y9Pon-3c7bZSQKCUM"
            			end;
            			
            			if sheet.NomeHabilidade == "Lamina do Dragão Azul" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvuh-61e0cdfb-44a4-4fa1-abf4-1da156d411c3.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzd3Z1aC02MWUwY2RmYi00NGE0LTRmYTEtYWJmNC0xZGExNTZkNDExYzMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.UEoG9IDZdliYi5Zw7Dd0_0yZy55qHiUH1v_G2D54HMQ"
            			end;
            			
            			if sheet.NomeHabilidade == "Lamina do Dragão Verde" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvtu-95dd48fa-66f4-4793-af73-6d91afc5c89a.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzd3Z0dS05NWRkNDhmYS02NmY0LTQ3OTMtYWY3My02ZDkxYWZjNWM4OWEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Df_l1luEdWep1GgiZ_TxmXTrksE59TMpBJEcDElbk9I"
            			end;
            			
            			if sheet.NomeHabilidade == "Lamina do Dragão Branco" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvue-c1ac22fe-53d8-4c07-9eb2-1af8137880a0.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzd3Z1ZS1jMWFjMjJmZS01M2Q4LTRjMDctOWViMi0xYWY4MTM3ODgwYTAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.iAgeT52Ao2nrHK0k3Kf_ahheKdA7sDheGq2lTkVQ-KM"
            			end;
            			
            			if sheet.NomeHabilidade == "Lamina do Dragão Marrom" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvtz-df484b66-564b-4c19-be6e-797196a59b25.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzd3Z0ei1kZjQ4NGI2Ni01NjRiLTRjMTktYmU2ZS03OTcxOTZhNTliMjUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.NBM0z1pypMenL7kQyLqtCqRopSE9cgrM988qo2-hfZk"
            			end;
            			
            			if sheet.NomeHabilidade == "Lamina do Dragão De Bronze" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvuc-25b6e10d-1801-456e-9fe7-81585a967f51.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzd3Z1Yy0yNWI2ZTEwZC0xODAxLTQ1NmUtOWZlNy04MTU4NWE5NjdmNTEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.3TjxAWwu_Ui6dSMLxNlZEVMRD26qI9UMTfPUo5mPCp4"
            			end;
            			
            			if sheet.NomeHabilidade == "Lamina do Dragão De Prata" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvu2-2494bfc0-c067-4fa4-8d63-84e50a4c3a40.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzd3Z1Mi0yNDk0YmZjMC1jMDY3LTRmYTQtOGQ2My04NGU1MGE0YzNhNDAucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.NIw6cJMANG-vT1SCoq8If7JC7jYlYi6XfMfWCiFQWZk"
            			end;
            			
            			if sheet.NomeHabilidade == "Lamina do Dragão De Ouro" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvu5-209265b1-0422-411b-8da9-da9d340ebdad.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2RiMWMzNmEwLTc4YWMtNGZiNy05OGVhLTFiMGFhZTg2Y2UyY1wvZGYzd3Z1NS0yMDkyNjViMS0wNDIyLTQxMWItOGRhOS1kYTlkMzQwZWJkYWQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.eNJoLSAQEpScW7NXX7Rm7ikfOSkTWBSyGlHbWkxJZjY"
            			end;
            			
            			if sheet.NomeHabilidade == "Sopro Do Cavaleiro Draconico" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvtb-9fc496cc-9fa9-4505-8189-b7843fbf39e2.png/v1/fit/w_150,h_150,strp/sopro_draconico_by_karelsama_df3wvtb-150.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjAwIiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjN3dnRiLTlmYzQ5NmNjLTlmYTktNDUwNS04MTg5LWI3ODQzZmJmMzllMi5wbmciLCJ3aWR0aCI6Ijw9MjAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.Dke5AcefKomvzA9fXUYvnL5MRW_0Ox6SYTF16GlRmtE"
            			end;
            			
            			if sheet.NomeHabilidade == "Olhar Draconico" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvtf-03784e6e-534b-4442-8e89-a76e08658e75.png/v1/fit/w_150,h_150,q_70,strp/olhar_draconico_by_karelsama_df3wvtf-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjM2IiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjN3dnRmLTAzNzg0ZTZlLTUzNGItNDQ0Mi04ZTg5LWE3NmUwODY1OGU3NS5wbmciLCJ3aWR0aCI6Ijw9MjM2In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.ecOES_LyaKcu-WivQEFD1JBH7LfMkW9ANksyr-3D5X8"
            			end;
            			
            			if sheet.NomeHabilidade == "O Verdadeiro Sopro Draconico" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvto-2f3d801d-de58-4ecc-9a8b-2d4daa542ea7.png/v1/fit/w_150,h_150,strp/o_verdadeiro_sopro_draconico_by_karelsama_df3wvto-150.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MzIyIiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjN3dnRvLTJmM2Q4MDFkLWRlNTgtNGVjYy05YThiLTJkNGRhYTU0MmVhNy5wbmciLCJ3aWR0aCI6Ijw9MzIyIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.8KrMyp5-LIKCrBUyQk3tPYgiV9fixsG22evQvXrcsm8"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Transformação Draconica" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvt7-e1bd0de6-dba3-410a-943d-0e21b93186c2.png/v1/fit/w_150,h_150,q_70,strp/transformao_draconica_by_karelsama_df3wvt7-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MjM2IiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjN3dnQ3LWUxYmQwZGU2LWRiYTMtNDEwYS05NDNkLTBlMjFiOTMxODZjMi5wbmciLCJ3aWR0aCI6Ijw9MjM2In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.loBcAgrtzjFEKIKztk5WExJiNKupYvy_lEGq2DJGRUE"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "Chamado do Dragão" then
            				sheet.fldImgIconSkill = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/db1c36a0-78ac-4fb7-98ea-1b0aae86ce2c/df3wvum-98e5d6ad-7432-4e04-9963-826ca941a123.png/v1/fit/w_150,h_150,q_70,strp/ff1360cf7e1324e4457d860b797b6452_by_karelsama_df3wvum-150.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTU4IiwicGF0aCI6IlwvZlwvZGIxYzM2YTAtNzhhYy00ZmI3LTk4ZWEtMWIwYWFlODZjZTJjXC9kZjN3dnVtLTk4ZTVkNmFkLTc0MzItNGUwNC05OTYzLTgyNmNhOTQxYTEyMy5wbmciLCJ3aWR0aCI6Ijw9NTY0In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.h9nLvNUWdZdR8TlhFoAJdan9Wz8alo2IFtJmyInD2lw"
            				self.imgIconSkill.width = "45"
            				self.imgIconSkill.height ="45"
            			end;
            			
            			if sheet.NomeHabilidade == "" then
            				sheet.fldImgIconSkill = ""
            			end;
            			
            			if sheet.NomeHabilidade == "" then
            				sheet.fldImgIconSkill = "/imagens/tt.png"
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

        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.imgIconSkill ~= nil then self.imgIconSkill:destroy(); self.imgIconSkill = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItemDaLista3()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItemDaLista3();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItemDaLista3 = {
    newEditor = newfrmItemDaLista3, 
    new = newfrmItemDaLista3, 
    name = "frmItemDaLista3", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmItemDaLista3 = _frmItemDaLista3;
Firecast.registrarForm(_frmItemDaLista3);

return _frmItemDaLista3;