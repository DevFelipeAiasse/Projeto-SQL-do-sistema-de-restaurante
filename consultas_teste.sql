use restaurante;

-- Testando a view
select * from resumo_pedido;

-- Selecionando campos específicos
select pedido_id, cliente_nome, valor_total from resumo_pedido;

-- EXPLAIN
explain select pedido_id, cliente_nome, valor_total from resumo_pedido;

-- Testando função de ingredientes
select BuscaIngredientesProduto(10) as ingredientes;

-- Testando função de média
select mediaPedido(5);
select mediaPedido(6);

-- Visualizar info_produtos
select * from info_produtos;