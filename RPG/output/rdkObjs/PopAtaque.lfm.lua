require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPopAtaque()
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
    obj:setName("frmPopAtaque");
    obj:setWidth(200);
    obj:setHeight(160);

    obj.TargetName = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.TargetName:setParent(obj);
    obj.TargetName:setName("TargetName");
    obj.TargetName:setScale(1.2);
    obj.TargetName:setAlign("top");
    obj.TargetName:setHeight(50);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.TargetName);
    obj.label1:setText("Alvo:");
    obj.label1:setFontColor("red");
    obj.label1:setAlign("right");
    obj.label1:setWidth(75);
    obj.label1:setName("label1");

    obj.cmbInimigos = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbInimigos:setParent(obj.TargetName);
    obj.cmbInimigos:setItems({'Inimigo 1', 'Inimigo 2', 'Inimigo 3'});
    obj.cmbInimigos:setValues({'1', '2', '3'});
    obj.cmbInimigos:setValue("1");
    obj.cmbInimigos:setFontColor("#FF6347");
    obj.cmbInimigos:setName("cmbInimigos");
    obj.cmbInimigos:setWidth(150);
    obj.cmbInimigos:setHeight(25);

    obj.NameTipoDeGrupo = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.NameTipoDeGrupo:setParent(obj);
    obj.NameTipoDeGrupo:setName("NameTipoDeGrupo");
    obj.NameTipoDeGrupo:setScale(1.2);
    obj.NameTipoDeGrupo:setTop(70);
    obj.NameTipoDeGrupo:setWidth(200);
    obj.NameTipoDeGrupo:setHeight(50);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.NameTipoDeGrupo);
    obj.label2:setText("Grupo:");
    obj.label2:setFontColor("green");
    obj.label2:setAlign("right");
    obj.label2:setWidth(75);
    obj.label2:setName("label2");

    obj.cmbTipoGrupo = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbTipoGrupo:setParent(obj.NameTipoDeGrupo);
    obj.cmbTipoGrupo:setItems({'Jogadores', 'Inimigos'});
    obj.cmbTipoGrupo:setValues({'1', '2'});
    obj.cmbTipoGrupo:setValue("1");
    obj.cmbTipoGrupo:setFontColor("#00FF7F");
    obj.cmbTipoGrupo:setName("cmbTipoGrupo");
    obj.cmbTipoGrupo:setField("cmbTipoDeGrupoF");
    obj.cmbTipoGrupo:setWidth(150);
    obj.cmbTipoGrupo:setHeight(25);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.NameTipoDeGrupo);
    obj.dataLink1:setField("cmbTipoDeGrupoF");
    obj.dataLink1:setName("dataLink1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("bottom");
    obj.button1:setWidth(90);
    obj.button1:setHeight(30);
    obj.button1:setFontSize(12);
    obj.button1:setFontColor("#00FFFF");
    obj.button1:setText("Ataque Basico");
    obj.button1:setName("button1");

					
					function ClicaPraAtaqueBasico()
						
						if self.cmbInimigos.value == "" then
							showMessage("CADE O ALVO ?")
						else

							local nodeInimigo = await(ConsegueAlvoExterno(nil, nil, self.cmbInimigos.value, sheet.cmbTipoDeGrupoF));
							
							if nodeInimigo ~= nil then
								AtaqueBasico(self, node, self.cmbInimigos.value, sheet.cmbTipoDeGrupoF, nodeInimigo);
							else
								showMessage("Inimigo não encontrado.");
							end
						end;

					self:close();
					end																
				


    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            self.title = sheet.Nome
        end);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if self.cmbTipoGrupo.value == "1" then
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            								
            								lista = {}
            
            								local function obterNomesRecursivoCMB1(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            
            									
            									
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivoCMB1(bibItemFilho) or "";
            
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
            
            								
            
            								local function atualizarComboBox()
            									local comboBox = self.cmbInimigos
            
            									-- Adiciona os novos itens na ordem desejada
            									table.insert(lista, "Alvo Simulado")  -- Penúltimo item
            									table.insert(lista, "Dano em Área")   -- Último item
            
            									comboBox.items = lista
            									comboBox.values = lista
            									comboBox.value = lista[1] or ""
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivoCMB1(bibliotecaAtual);
            								atualizarComboBox()
            							end
            
            							if self.cmbTipoGrupo.value == "2" then
            								local mesas = rrpg.getRooms();
            								local bibliotecaAtual = mesas[1].library;
            								
            								lista = {}
            
            								local function obterNomesRecursivoCMB2(bibItem)
            									local itensFilhos = bibItem.children;
            									local nomes = bibItem.name;
            									
            									for i = 1, #itensFilhos, 1 do
            										local bibItemFilho = itensFilhos[i];
            										local nomesDoFilho = obterNomesRecursivoCMB2(bibItemFilho) or "";
            
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
            
            								local function atualizarComboBox()
            									local comboBox = self.cmbInimigos
            										-- Adiciona os novos itens na ordem desejada
            									table.insert(lista, "Alvo Simulado")  -- Penúltimo item
            									table.insert(lista, "Dano em Área")   -- Último item
            									
            									comboBox.items = lista
            									comboBox.values = lista
            									comboBox.value = lista[1] or ""  -- Defina o primeiro item como selecionado por padrão
            								end
            
            								local nomesDeTodosOsItens = obterNomesRecursivoCMB2(bibliotecaAtual);
            								atualizarComboBox()
            							end;
        end);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (event)
            ClicaPraAtaqueBasico();
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

        if self.cmbInimigos ~= nil then self.cmbInimigos:destroy(); self.cmbInimigos = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.TargetName ~= nil then self.TargetName:destroy(); self.TargetName = nil; end;
        if self.cmbTipoGrupo ~= nil then self.cmbTipoGrupo:destroy(); self.cmbTipoGrupo = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.NameTipoDeGrupo ~= nil then self.NameTipoDeGrupo:destroy(); self.NameTipoDeGrupo = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPopAtaque()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPopAtaque();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPopAtaque = {
    newEditor = newfrmPopAtaque, 
    new = newfrmPopAtaque, 
    name = "frmPopAtaque", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    cacheMode = "none", 
    title = "", 
    description=""};

frmPopAtaque = _frmPopAtaque;
Firecast.registrarForm(_frmPopAtaque);

return _frmPopAtaque;
