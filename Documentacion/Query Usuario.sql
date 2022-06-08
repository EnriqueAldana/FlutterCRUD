SELECT 
U.id,
U.email,
U.name,
U.lastname,
U.lastname2,
U.image_path,
U.phone,
U.password,
JSON_ARRAYAGG(
	JSON_OBJECT(
		'id', R.id,
        'name', R.name,
        'image', R.image,
        'route', R.route
    )
) AS roles,

JSON_ARRAYAGG(
	JSON_OBJECT(
		'id', C.id,
        'email', C.email,
        'name', C.name,
        'idname', C.idname,
        'phone', C.phone,
        'image_path', C.image_path,
        'route', C.route
    )
) AS companies

FROM

users AS U

INNER JOIN 
user_has_roles AS UHR
ON
UHR.id_user = U.id

INNER JOIN
roles AS R
ON
UHR.id_rol = R.id

INNER JOIN
companies AS C
ON
UHR.id_company = C.id

WHERE
	U.email= 'e@e.com'

GROUP BY
	U.id