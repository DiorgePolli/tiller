# Tiller by SUMUP

Nesse projeto foi pedido um dashboard para que o cliente, nesse caso, 21 restaurantes de Paris tivessem uma forma de controlar suas operações a partir dos dados coletados pelo software Tiller by Sumup que é uma espécie de caixa registradora em que os garçons anotam os pedidos e recebem os pagamentos dos clientes, tudo por um Ipad. 

## DADOS
Num primeiro momento recebi os dados provenientes de todas as operações armazenados em um uma base de dados armazenada no BigQuery, os dados das tabelas order_line_clean e payment_data_cleaned com o tamanho de 3.924.748 linhas - 79.18MB e 1.403.213 linhas - 19.12MB respectivamente.

## PROCESSAMENTO E ENRIQUECIMENTO

Os dados fornecidos foram processados e limpos com SQL. Todas as operações podem ser consultadas nas SQLs do projeto. No final a tabela usada para o dashboard ficou com o total de 1402745 linhas.

## ML E ENRIQUECIMENTO

Para fins de comparação foram usados os dados até o dia 18 de novembro de 2019 para previr o faturamento das lojas para o ano seguinte, foi usado um modelo de regrssão linear em Python para tal, que está anexo ao projeto. As tendências foram muito fiéis a projeção o que mostrou que o modelo foi eficaz para prever tendencia mas nao teve um acerto significativo nos valores exatos.

## DASHBOARD

Foi feita uma apresentação em que o cliente pode comparar os dados fianceiros de seu restaurante de forma simples e intuitiva. Num primeiro momento é possivel observar o desempenho dos ultimos 365 dias e comparar com o periodo anterior. O controle de tempo fica a cargo do cliente que pode altera-lo de maneira simples para uma analise mais detalhada.



### Dashboard Financeiro
https://lookerstudio.google.com/reporting/f54e133a-1dfa-43d8-926e-821bdbef86bd
