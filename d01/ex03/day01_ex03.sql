SELECT 
	pv.visit_date AS action_date, 
	pv.person_id AS person_id
FROM 
	person_visits AS pv
INTERSECT 
SELECT 
	po.order_date AS action_date, 
	po.person_id AS person_id
FROM 
	person_order AS po
ORDER BY
	action_date ASC,
	person_id DESC;