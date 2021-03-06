CREATE VIEW view_status_produto_por_parceiro AS

/*
nome do produto X
modelo do produto X
preco X
categoria do produto X 
situacao do pedido
id_situacao_pedido
*/

SELECT 

/* tbl_produto */
p.nome AS nome_produto,
p.preco,

/* tbl_modelo_produto */
m.modelo,

/* tbl_categoria_produto */
c.categoria,

/* tbl_parceiro */
parc.id_parceiro,
parc.nome_fantasia,

/* tbl_situacao_pedido */
DATE_FORMAT(DATE(s.log_situacao_pedido),"%d/%m/%Y") AS data_pedido,

/* tbl_tipo_situacao_pedido */
tsp.situacao,

/* tbl_situacao_pedido */
s.id_situacao_pedido

FROM tbl_produto AS p

INNER JOIN tbl_modelo_produto AS m ON m.id_modelo_produto = p.id_modelo_produto

INNER JOIN tbl_categoria_produto AS c ON c.id_categoria_produto = p.id_categoria_produto

INNER JOIN tbl_pedido AS ped ON ped.id_produto = p.id_produto

INNER JOIN tbl_parceiro AS parc ON parc.id_parceiro = p.id_parceiro

INNER JOIN tbl_situacao_pedido AS s ON s.id_pedido = ped.id_pedido

INNER JOIN tbl_tipo_situacao_pedido AS tsp ON tsp.id_tipo_situacao_pedido = s.id_tipo_situacao_pedido

WHERE c.id_categoria_produto != 2;

select * from view_status_produto_por_parceiro;