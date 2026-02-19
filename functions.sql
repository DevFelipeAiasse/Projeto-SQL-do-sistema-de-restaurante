use restaurante;

delimiter //

-- Função que retorna os ingredientes de um produto
create function BuscaIngredientesProduto (produtoID int)
returns text
reads sql data
begin
    declare ingredientesProduto text;
    select ingredientes
    into ingredientesProduto
    from info_produtos
    where id_produto = produtoID;
    return ingredientesProduto;
end//
    
-- Função que compara o total do pedido com a média geral
create function mediaPedido (pedidoID int)
returns varchar(100)
reads sql data
begin
    declare totalPedido decimal(10,2);
    declare mediaGeral decimal(10,2);
    declare mensagem varchar(100);

    select (quantidade * pr.preco)
    into totalPedido
    from pedidos p
    join produtos pr on pr.id_produto = p.id_produto
    where p.id_pedido = pedidoID;

    select avg(p.quantidade * pr.preco)
    into mediaGeral
    from pedidos p
    join produtos pr on pr.id_produto = p.id_produto;

    if totalPedido > mediaGeral then
        set mensagem = 'O total do pedido é acima da média geral';
    elseif totalPedido < mediaGeral then
        set mensagem = 'O total do pedido é abaixo da média geral';
    else
        set mensagem = 'O total do pedido é igual à média geral';
    end if;

    return mensagem;
end//

delimiter ;