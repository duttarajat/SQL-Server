use Historical_Events

drop synonym if exists SYN_tblCountry
create synonym SYN_tblCountry for Historical_Events.dbo.tblCountry

select left(base_object_name,charindex(']',base_object_name)) 'DatabaseName' from sys.synonyms

select replace(left(base_object_name,charindex(']',base_object_name)-1),'[','') 'DB_Name' from sys.synonyms

select replace(replace(left(base_object_name,charindex(']',base_object_name)),'[',''),']','') 'DB_Name' from sys.synonyms

select	isnull(parsename(base_object_name,4),'Not Yet Available') 'Server_Name'
		, parsename(base_object_name,3) 'DB_Name'
		, parsename(base_object_name,2) 'Schema_Name'
		, parsename(base_object_name,1) 'Table_Name'
from sys.synonyms

use master
select type_desc, count(*) 'Count' from sys.all_objects group by type_desc order by Count desc