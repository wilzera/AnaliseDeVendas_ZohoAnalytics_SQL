# DesafioKinvo
Repositório contendo a resolução do desafio técnico para a vaga de Analista de Dados Pleno da Kinvo
Candidato: Willian Rocha - CPF:112.704.696-90

# Visualização de dados:
Ferramenta escolhida foi a Zoho Analytics. Optei por esta ferramenta pela sua praticidade e como a utilizo no meu atual emprego, tenho mais experiência com ela do que com outras ferramentas, como o Power BI por exemplo. 

# Relatórios/Visualizações:
- ** KINVO - Acompanhamento das vendas** - https://analytics.zoho.com/open-view/2333751000000026317: Dashboard contendo 4 KPIs: Faturamento Bruto, Ticket Médio, Quantidade de Clientes atendidos e Quantidade de vendas realizadas. E contendo também os demais relatórios citados abaixo.
- **- Quantidade de clientes por canal de comunicação:** Relatório contendo a quantidade de clientes por canal de comunicação
- **- Top10 produtos mais vendidos em quantidade:** Relatório contendo os 10 produtos mais vendidos em quantidade
- **- Faturamento por canal  de comunicação:** Relatório contendo o faturamento por canal de comunicação
- **- Top5 categorias de produto mais lucrativas:** Relatório contendo as 5 categorias de produtos mais lucrativas
- **- Valor total de venda por mês/ano:** Relatório contendo o valor de faturamento (venda total) por mês/ano
- **- Vendas analíticas:** Relatório contendo uma visão analítica das vendas, no modelo de tabela pivot

# Análise de vendas:
1) Quais são os produtos mais vendidos em termos de quantidade?
```
SELECT
		 prod.id AS 'IDProduto',
         prod.nome AS 'Produto',
         SUM(ven.quantidade) AS 'QuantidadeTotalVendida'
FROM  vendas ven
LEFT JOIN produtos prod ON ven.produto_id  = prod.id 
GROUP BY
	 prod.id,
         prod.nome
 ORDER BY
	QuantidadeTotalVendida DESC
```
2) Qual é o valor total das vendas para cada mês do último ano?
```
SELECT
		 	ABS_MONTH(ven.data_venda) AS 'DataVenda',
      -- Para facilitar na inserção de dados e não precisar calcular o valor_total correto para cada venda manualmente, estou calculando o valor total de venda multiplicando o preco do produto x quantidade da venda
		 SUM(prod.preco * ven.quantidade) AS 'ValorTotal'
FROM  vendas ven
LEFT JOIN produtos prod ON ven.produto_id  = prod.id 
WHERE YEAR(ven.data_venda) < YEAR(CURDATE())
GROUP BY DataVenda
```
3)Quais são as categorias de produtos mais lucrativas?
```
SELECT
		 prod.categoria AS 'Categoria de Produto',
         -- Para facilitar na inserção de dados e não precisar calcular o valor_total correto para cada venda manualmente, estou calculando o valor total de venda multiplicando o preco do produto x quantidade da venda
         SUM(prod.preco * ven.quantidade) AS 'ValorFaturamento'
FROM  vendas ven
LEFT JOIN produtos prod ON ven.produto_id  = prod.id 
GROUP BY
	 prod.categoria
 ORDER BY
	ValorFaturamento DESC   
  ```

# Análise de clientes:
1) A idade média dos clientes é de 31 anos a preferência dos clientes com esta média de idade é a categoria de produtos eletrônicos, que é a categoria com maior faturamento e quantidade de produtos vendidos. Os clientes de cidade pequenas (São Sebastião do Paraíso e Jacuí) representam 46,7% dos clientes totais.
2) Os principais canais de comunicação preferidos pelos clientes são: 1- WhatsApp(86,7%), 2- E-mail(8,0%), 3- Telefone(5,4%).

# Insights e recomendações:
- A categoria de produtos Eletrodomésticos representa apenas 5,3% do faturamento total. Seria interessante rever os produtos ou até mesmo desoncontinuar esta categoria e focar nas demais.
- As categorias de calçados, acessórios e vestuário representam 40,2% do faturamento total. Porém, as categorias de acessórios e vestuário somadas representam apenas 17,6% enquanto os outros 22,6% são apenas dos calçados. Como são categorias semelhantes, pode ser estudado uma forma de vender todas as três categorias de produto numa única venda ou elaborar uma promoção por exemplo.
- O principal canal de comunicação preferido pelos clientes é o WhatsApp, que representa 86,7% do total. Com isto, tanto as propagandas quanto o atendimento pode ser focado no WhatsApp do que nos demais canais de comunicação.
- Os clientes com a média de idade 30, compram mais produtos da categoria Eletrônicos que qualquer outra categoria. Uma campanha focada nesta faixa de idade e categoria de produtos pode trazer muitos resultados

