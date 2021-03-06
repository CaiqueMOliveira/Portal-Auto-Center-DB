/*
	VIEW DE EXIBIÇÃO DAS BREVES INFORMAÇÕES SOBRE OS OS PRODUTOS EXISTNTES
    OBS.: NÃO EXIBE OS PORDUTOS QUE POSSUEM A CATEGORIA COMO SERVICO 
*/
ALTER VIEW view_detalhes_produtos AS

SELECT 

/* tl_produto*/
p.id_produto,
p.nome,
p.preco,
p.descricao,
p.observacao,
p.garantia,

/* tbl_modelo_produto */
mp.modelo,

/* tbl_categoria_produto */
cp.id_categoria_produto,
cp.categoria,

/* tbl_fabricante_produto */
f.fabricante

/* tbl_feedback_cliente 
fc.feedback*/

FROM tbl_produto AS p

/* tbl_modelo_produto */
INNER JOIN tbl_modelo_produto AS mp ON mp.id_modelo_produto = p.id_modelo_produto

/* tbl_categoria_produto */
INNER JOIN tbl_categoria_produto AS cp ON cp.id_categoria_produto = p.id_categoria_produto

/* tbl_fabricante_produto */
INNER JOIN tbl_fabricante_produto AS f ON f.id_fabricante_produto = mp.id_fabricante_produto;

/* tbl_pedido 
INNER JOIN tbl_pedido AS pe ON pe.id_produto = pe.id_produto;*/

/* tbl_feedback_cliente 
LEFT JOIN tbl_feedback_cliente AS fc ON fc.id_pedido = pe.id_pedido;*/

SELECT * FROM view_detalhes_produtos;