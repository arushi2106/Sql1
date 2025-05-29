with rank_email_duplicates as 
(
select 
    id
    , email
    , row_number() over(partition by email order by id) as rownum
from 
    Person
)
select 
    id 
    , email
from 
    rank_email_duplicates
where rownum = 1