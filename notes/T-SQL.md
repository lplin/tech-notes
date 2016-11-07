# Over
https://msdn.microsoft.com/en-us/library/ms186734.aspx
SELECT ROW_NUMBER() OVER(ORDER BY id) AS Row#, id
FROM (
  SELECT 'B' id
  UNION SELECT 'A'
) t;

==>
Row#	id
1	A
2	B