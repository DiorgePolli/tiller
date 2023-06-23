  #Foram adicionados dados da tabela order_line_clean_view para enriquecer a tabela payment com todos os dados financeiros.
  
  WITH payment_cleaned AS(SELECT 
   ###Primary Key###
   id_pagamento
   ###Foreign Key###
  ,id_ordem
   ### Data ###
  ,data_pagamento
   ### Dados Fianaceiros ###
  ,categoria_pagamento
  ,desconto*(total_pago/preco_total_com_taxa) AS desconto
  ,preco_total_sem_taxa*(total_pago/preco_total_com_taxa) AS conta_sem_taxa
  ,total_pago AS preco_total_com_taxa
FROM `proj-tiller.tiller_proj.payment_data_cleaned` P
RIGHT JOIN 
  (SELECT * FROM `tiller_proj.order_line_clean_view`
  WHERE preco_total_com_taxa != 0 AND preco_total_sem_taxa !=0) O ON
O.pedido = P.id_ordem
)

SELECT 
  ###Primary Key###
   id_pagamento
   ###Foreign Key###
  ,id_ordem
   ### Nome Restaurante ###
  ,loja
   ### Data ###
  ,data_pagamento
   ### Dados Fianaceiros ###
  ,categoria_pagamento
  ,ROUND(conta_sem_taxa,2) AS preco_total_sem_taxa
  ,ROUND(desconto,2) AS desconto
  ,ROUND((preco_total_com_taxa - conta_sem_taxa)/preco_total_com_taxa,2) AS taxa_de_imposto
  ,ROUND((preco_total_com_taxa - conta_sem_taxa),2) AS imposto
  ,preco_total_com_taxa
FROM payment_cleaned
INNER JOIN `tiller_proj.order_clean_join_store_data` d 
ON payment_cleaned.id_ordem = d.pedido
ORDER BY desconto desc