/* list providers */

select  p.pk_id as id
		,active as isActive
		,CONCAT(firstname,' ',lastname) as name
		,slogan
		,short_description as description
		,50.00 as price
		,3 as rating
		,"Provided" as transportation
		,email
from providers p inner join experiences e on e.fk_provider_id = p.pk_id
limit 6;