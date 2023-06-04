CREATE VIEW vw_vendas_XYZCORP AS
SELECT
ven.id AS 'IDVenda',
ven.data_venda AS 'DataVenda',
cli.id AS 'IDCliente',
cli.nome AS 'Cliente',
concat_ws(' - ', cli.id, cli.nome) AS 'Código+Cliente',
cli.idade AS 'IdadeCliente',
cli.cidade AS 'CidadeCliente',
cli.canal_comunicacao AS 'CanalComunicacao',
prod.id AS 'IDProduto',
prod.nome AS 'Produto',
concat_ws(' - ', prod.id, prod.nome) AS 'Código+Produto',
prod.categoria AS 'CategoriaProduto',
prod.preco AS 'ValorUnitario',
ven.quantidade AS 'Quantidade',
-- Para facilitar na inserção de dados e não precisar calcular o valor_total correto para cada venda manualmente, estou calculando o valor total de venda multiplicando o preco do produto x quantidade da venda
(prod.preco * ven.quantidade) AS 'ValorTotal'
FROM  vendas ven
LEFT JOIN produtos prod ON ven.produto_id  = prod.id 
LEFT JOIN clientes cli ON ven.cliente_id  = cli.id  
