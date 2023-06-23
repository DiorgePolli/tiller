#foi feita uma agragação pelo order id em finance pq muitos itens de algumas ordens estao com valor zero entao foi melhor considerar o valor total da ordem ao inves de item por item

#Foram mantidos os dados relevantes para o calculo financeiro

#desconsiderados os nomes e as categorias dos produtos devido a falta de informações e nomeclaturas incorretas

#uniprice nao foi considerado por tem muitos dados com valor 0

WITH finance AS (SELECT pedido
  ,SUM(quantidade) AS quantidade_itens
  ,ROUND(SUM(preco_total_sem_taxa),2) AS preco_total_sem_taxa
  ,ROUND(SUM(desconto),2) AS desconto
  ,ROUND(SUM(preco_total_com_taxa),2) AS preco_total_com_taxa
FROM `proj-tiller.tiller_proj.order_line_clean`
WHERE preco_total_com_taxa != 0
GROUP BY pedido
ORDER BY desconto DESC
)

SELECT 
  *
FROM finance
ORDER BY pedido