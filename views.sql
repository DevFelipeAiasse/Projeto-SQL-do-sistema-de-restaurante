use restaurante;

-- View resumo_pedido
create view resumo_pedido as
select
    p.id_pedido as pedido_id,
    p.quantidade,
    p.data_pedido,
    c.nome as cliente_nome,
    c.email as cliente_email,
    f.nome as funcionario_nome,
    pr.nome as produtos_nome,
    pr.preco as produto_preco,
    coalesce((p.quantidade * pr.preco),0) as valor_total
from pedidos p
join clientes c on c.id_cliente = p.id_cliente
join funcionarios f on f.id_funcionario = p.id_funcionario
join produtos pr on pr.id_produto = p.id_produto;