unit UAtualizacoes;

interface
  type TAtualizacoes = Class
     private
       procedure alteraVersao(versao: string);
       function atualizar1_0: boolean;
       function atualizar1_0_1: boolean;
       function atualizar1_0_2: boolean;
       function atualizar1_1_2: boolean;
       function atualizar1_2_3: boolean;
     public
       procedure atualizar;
  End;

var
  atualizacoes: TAtualizacoes;
implementation

uses UDM, System.SysUtils;


procedure TAtualizacoes.alteraVersao(versao: string);
begin
  with dm.config do
  begin
    Refresh;
    Filter := 'id = 2';
    Edit;
    FieldByName('valor').AsString := versao;
    Post;
    Refresh;
    Filter := 'id = 2';
    dm.config2 := FieldByName('valor').AsString;
  end;
end;

function TAtualizacoes.atualizar1_0: boolean;
begin
  with dm.qry_atualizacoes do
  begin
    close;
    sql.Clear;
    sql.Add('INSERT INTO config ( id, descri, valor) VALUES ( 2,''Versao'',''1.0'')');
    Execute;
  end;
  alteraVersao('1.0');
  Result := true;
end;

function TAtualizacoes.atualizar1_0_1: boolean;
begin
  with dm.qry_atualizacoes do
  begin
    close;
    sql.Clear;
    sql.Add('DROP VIEW vw_lista_vendas;                                                                                                                                                      '+
             'CREATE VIEW vw_lista_vendas (                                                                                                                                                  '+
             '    id,                                                                                                                                                                        '+
             '    nome,                                                                                                                                                                      '+
             '    valor,                                                                                                                                                                     '+
             '    data,                                                                                                                                                                      '+
             '    valor_descontado_cartao,                                                                                                                                                   '+
             '    valor_comiss,                                                                                                                                                              '+
             '    v_cartao,                                                                                                                                                                  '+
             '    v_dinheiro,                                                                                                                                                                '+
             '    cliente                                                                                                                                                                    '+
             ')                                                                                                                                                                              '+
             'AS                                                                                                                                                                             '+
             '    SELECT id,                                                                                                                                                                 '+
             '           CAST (ifnull(cliente, '''') AS VARCHAR (200) ) AS nome,                                                                                                               '+
             '           ifnull(sum(valor), 0) AS valor,                                                                                                                                     '+
             '           data AS data,                                                                                                                                                       '+
             '           CAST (ifnull(sum(valor_descontado_cartao), 0) AS FLOAT) AS valor_descontado_cartao,                                                                                 '+
             '           CAST (ifnull(sum(valor_comiss), 0) AS FLOAT) AS valor_comiss,                                                                                                       '+
             '           CAST (ifnull(sum(v_cartao), 0) AS FLOAT) AS v_cartao,                                                                                                               '+
             '           CAST (ifnull(sum(v_dinheiro), 0) AS FLOAT) AS v_dinheiro,                                                                                                           '+
             '           cliente                                                                                                                                                             '+
             '      FROM (                                                                                                                                                                   '+
             '               SELECT v.id,                                                                                                                                                    '+
             '                      iv.valor,                                                                                                                                                '+
             '                      iv.cartao,                                                                                                                                               '+
             '                      v.data,                                                                                                                                                  '+
             '                      v.cliente,                                                                                                                                               '+
             '                      CASE iv.cartao WHEN 1 THEN iv.valor * (1 - CAST (iv.perc_cartao AS FLOAT) / 100) ELSE iv.valor END valor_descontado_cartao,                              '+
             '                      CASE iv.cartao WHEN 1 THEN (iv.valor * (1 - CAST (iv.perc_cartao AS FLOAT) / 100) ) * (iv.comis / 100) ELSE iv.valor * (iv.comis / 100) END valor_comiss,'+
             '                      CASE iv.cartao WHEN 1 THEN iv.valor ELSE 0.0 END v_cartao,                                                                                               '+
             '                      CASE iv.cartao WHEN 0 THEN iv.valor ELSE 0.0 END v_dinheiro                                                                                              '+
             '                 FROM venda v                                                                                                                                                  '+
             '                      LEFT JOIN                                                                                                                                                '+
             '                      item_venda iv ON v.id = iv.id_venda AND                                                                                                                  '+
             '                                       iv.excluido = 0                                                                                                                         '+
             '                      LEFT JOIN                                                                                                                                                '+
             '                      servico s ON iv.id_servico = s.id                                                                                                                        '+
             '                      LEFT JOIN                                                                                                                                                '+
             '                      colaborador c ON iv.id_colaborador = c.id                                                                                                                '+
             '                WHERE v.excluido = 0                                                                                                                                           '+
             '           )                                                                                                                                                                   '+
             '     GROUP BY id;                                                                                                                                                              '
     );
    Execute;
  end;
  alteraVersao('1.01');
  Result := true;
end;

function TAtualizacoes.atualizar1_0_2: boolean;
begin
  with dm.qry_atualizacoes do
  begin
    close;
    sql.Clear;
    sql.Add(
              'DROP VIEW vw_item_venda;                                                                                                                                                             '+
              '                                                                                                                                                                                     '+
              'CREATE VIEW vw_item_venda (                                                                                                                                                          '+
              '    id,                                                                                                                                                                              '+
              '    id_venda,                                                                                                                                                                        '+
              '    servico,                                                                                                                                                                         '+
              '    valor,                                                                                                                                                                           '+
              '    cartao,                                                                                                                                                                          '+
              '    colaborador,                                                                                                                                                                     '+
              '    valor_descontado_cartao,                                                                                                                                                         '+
              '    valor_comiss,                                                                                                                                                                    '+
              '    v_cartao,                                                                                                                                                                        '+
              '    v_dinheiro                                                                                                                                                                       '+
              ')                                                                                                                                                                                    '+
              'AS                                                                                                                                                                                   '+
              '    SELECT iv.id,                                                                                                                                                                    '+
              '           CAST (iv.id_venda AS INTEGER) AS id_venda,                                                                                                                                '+
              '           CAST (s.descri AS VARCHAR (200) ) AS descri,                                                                                                                              '+
              '           iv.valor AS valor,                                                                                                                                                        '+
              '           CAST (iv.cartao AS BOOLEAN) AS cartao,                                                                                                                                    '+
              '           CAST (c.nome AS VARCHAR (200) ) AS nome,                                                                                                                                  '+
              '           CAST (CASE iv.cartao WHEN 1 THEN (iv.valor * (1 - CAST (iv.perc_cartao AS FLOAT) / 100) ) ELSE iv.valor END AS FLOAT) AS [valor_descontado_cartao::FLOAT],                '+
              '           CAST (CASE iv.cartao WHEN 1 THEN (iv.valor * (1 - CAST (iv.perc_cartao AS FLOAT) / 100) ) * (s.comis / 100) ELSE iv.valor * (s.comis / 100) END AS FLOAT) AS valor_comiss,'+
              '           CAST (CASE iv.cartao WHEN 1 THEN iv.valor ELSE 0.0 END AS FLOAT) AS v_cartao,                                                                                             '+
              '           CAST (CASE iv.cartao WHEN 0 THEN iv.valor ELSE 0.0 END AS FLOAT) AS v_dinheiro                                                                                            '+
              '      FROM item_venda iv                                                                                                                                                             '+
              '           JOIN                                                                                                                                                                      '+
              '           servico s ON iv.id_servico = s.id                                                                                                                                         '+
              '           JOIN                                                                                                                                                                      '+
              '           colaborador c ON iv.id_colaborador = c.id                                                                                                                                 '+
              '     WHERE iv.excluido = 0;                                                                                                                                                          '+
              '                                                                                                                                                                                     '+
              'DROP VIEW vw_comissoes;                                                                                                                                                              '+
              '                                                                                                                                                                                     '+
              'CREATE VIEW vw_comissoes (                                                                                                                                                           '+
              '    id,                                                                                                                                                                              '+
              '    valor,                                                                                                                                                                           '+
              '    cartao,                                                                                                                                                                          '+
              '    data,                                                                                                                                                                            '+
              '    cliente,                                                                                                                                                                         '+
              '    descri,                                                                                                                                                                          '+
              '    comis,                                                                                                                                                                           '+
              '    colaborador,                                                                                                                                                                     '+
              '    valor_comiss                                                                                                                                                                     '+
              ')                                                                                                                                                                                    '+
              'AS                                                                                                                                                                                   '+
              '    SELECT v.id,                                                                                                                                                                     '+
              '           iv.valor AS valor,                                                                                                                                                        '+
              '           iv.cartao AS cartao,                                                                                                                                                      '+
              '           v.data,                                                                                                                                                                   '+
              '           CAST (v.cliente AS VARCHAR (200) ) AS cliente,                                                                                                                            '+
              '           CAST (s.descri AS VARCHAR (200) ) AS descri,                                                                                                                              '+
              '           iv.comis AS comis,                                                                                                                                                        '+
              '           CAST (c.nome AS VARCHAR (200) ) AS colaborador,                                                                                                                           '+
              '           CASE iv.cartao WHEN 1 THEN (iv.valor * (1 - CAST (iv.perc_cartao AS FLOAT) / 100) ) * (iv.comis / 100) ELSE iv.valor * (iv.comis / 100) END AS valor_comiss               '+
              '      FROM venda v                                                                                                                                                                   '+
              '           LEFT JOIN                                                                                                                                                                 '+
              '           item_venda iv ON v.id = iv.id_venda                                                                                                                                       '+
              '           LEFT JOIN                                                                                                                                                                 '+
              '           servico s ON iv.id_servico = s.id                                                                                                                                         '+
              '           LEFT JOIN                                                                                                                                                                 '+
              '           colaborador c ON iv.id_colaborador = c.id                                                                                                                                 '+
              '     WHERE v.excluido = 0 AND                                                                                                                                                        '+
              '           iv.excluido = 0                                                                                                                                                           '+
              '     ORDER BY colaborador,                                                                                                                                                           '+
              '              data;                                                                                                                                                                  '
     );
    Execute;
  end;
  alteraVersao('1.02');
  Result := true;
end;

function TAtualizacoes.atualizar1_1_2: boolean;
begin
   with dm.qry_atualizacoes do
  begin
    close;
    sql.Clear;
    sql.Add(
              'PRAGMA foreign_keys = 0;                              '+
              '                                                      '+
              'CREATE TABLE sqlitestudio_temp_table AS SELECT *      '+
              '                                          FROM venda; '+
              '                                                      '+
              'DROP TABLE venda;                                     '+
              '                                                      '+
              'CREATE TABLE venda (                                  '+
              '    id         INTEGER      PRIMARY KEY AUTOINCREMENT,'+
              '    cliente    STRING (160),                          '+
              '    telefone   STRING (30),                           '+
              '    data       DATE         NOT NULL,                 '+
              '    obs        STRING (150),                          '+
              '    id_cliente              REFERENCES cliente (id),  '+
              '    excluido   BOOLEAN      NOT NULL                  '+
              '                            DEFAULT (0),              '+
              '    requisicao BOOLEAN      DEFAULT (0)               '+
              ');                                                    '+
              '                                                      '+
              'INSERT INTO venda (                                   '+
              '                      id,                             '+
              '                      cliente,                        '+
              '                      telefone,                       '+
              '                      data,                           '+
              '                      obs,                            '+
              '                      id_cliente,                     '+
              '                      excluido                        '+
              '                  )                                   '+
              '                  SELECT id,                          '+
              '                         cliente,                     '+
              '                         telefone,                    '+
              '                         data,                        '+
              '                         obs,                         '+
              '                         id_cliente,                  '+
              '                         excluido                     '+
              '                    FROM sqlitestudio_temp_table;     '+
              '                                                      '+
              'DROP TABLE sqlitestudio_temp_table;                   '+
              '                                                      '+
              'PRAGMA foreign_keys = 1;                              '
     );
    Execute;
  end;
  alteraVersao('1.12');
  Result := true;
end;

function TAtualizacoes.atualizar1_2_3: boolean;
begin
   with dm.qry_atualizacoes do
  begin
    close;
    sql.Clear;
    sql.Add(
            'DROP VIEW vw_comissoes;                                                                      '+
            '                                                                                             '+
            'CREATE VIEW vw_comissoes (                                                                   '+
            '    id,                                                                                      '+
            '    valor,                                                                                   '+
            '    cartao,                                                                                  '+
            '    data,                                                                                    '+
            '    cliente,                                                                                 '+
            '    descri,                                                                                  '+
            '    comis,                                                                                   '+
            '    id_colaborador,                                                                          '+
            '    colaborador,                                                                             '+
            '    valor_comiss                                                                             '+
            ')                                                                                            '+
            'AS                                                                                           '+
            '    SELECT v.id,                                                                             '+
            '           iv.valor AS valor,                                                                '+
            '           iv.cartao AS cartao,                                                              '+
            '           v.data,                                                                           '+
            '           CAST (v.cliente AS VARCHAR (200) ) AS cliente,                                    '+
            '           CAST (s.descri AS VARCHAR (200) ) AS descri,                                      '+
            '           iv.comis AS comis,                                                                '+
            '           c.id AS id_colaborador,                                                           '+
            '           CAST (c.nome AS VARCHAR (200) ) AS colaborador,                                   '+
            '           CASE iv.cartao WHEN 1                                                             '+
            '		     THEN (iv.valor * (1 - CAST (iv.perc_cartao AS FLOAT) / 100) ) * (iv.comis / 100)     '+
            '			 ELSE iv.valor * (iv.comis / 100) END AS valor_comiss                                   '+
            '      FROM venda v                                                                           '+
            '           LEFT JOIN                                                                         '+
            '           item_venda iv ON v.id = iv.id_venda                                               '+
            '           LEFT JOIN                                                                         '+
            '           servico s ON iv.id_servico = s.id                                                 '+
            '           LEFT JOIN                                                                         '+
            '           colaborador c ON iv.id_colaborador = c.id                                         '+
            '     WHERE v.excluido = 0 AND                                                                '+
            '           iv.excluido = 0                                                                   '+
            '     ORDER BY colaborador,                                                                   '+
            '              data;                                                                          '
     );
    Execute;
  end;
  alteraVersao('1.23');
  Result := true;
end;

procedure TAtualizacoes.atualizar;
// PRIMEIRO NUMERO SE REFERE A TOTALIZADOR DE FUNCIONALIDADE EX: 2 = 10 funcionalidades,
// SEGUNDO NUMERO A INSERCAO DE FUNCIONALIDADES QUANDO CHEGA A 9 AUMENTA O PRIMEIRO NUMERO,
// TERCEIRO NUMERO A CORREÇÃO DE BUGS,
// EX: 1.223 : ANO 2018 - DUAS NOVAS FUNCIONALIDAS - 23 BUGS CORRIGIDOS
begin
  if dm.config2 = '' then
    if not atualizar1_0 then
      dm.mostraMsg('Erro ao atualizar para a versão 1.0');
  if 1.01 > strtofloat(StringReplace(dm.config2,'.',',',[rfReplaceAll, rfIgnoreCase])) then
    if not atualizar1_0_1 then
      dm.mostraMsg('Erro ao atualizar para a versão 1.01');
  if 1.02 > strtofloat(StringReplace(dm.config2,'.',',',[rfReplaceAll, rfIgnoreCase])) then
    if not atualizar1_0_2 then
      dm.mostraMsg('Erro ao atualizar para a versão 1.02');
  if 1.12 > strtofloat(StringReplace(dm.config2,'.',',',[rfReplaceAll, rfIgnoreCase])) then
    if not atualizar1_1_2 then
      dm.mostraMsg('Erro ao atualizar para a versão 1.12');
  if 1.23 > strtofloat(StringReplace(dm.config2,'.',',',[rfReplaceAll, rfIgnoreCase])) then
    if not atualizar1_2_3 then
      dm.mostraMsg('Erro ao atualizar para a versão 1.23');
end;

end.
