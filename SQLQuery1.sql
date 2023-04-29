select [index_depth] from sys.dm_db_index_physical_stats(DB_ID(N'AdventureWorks2014'),OBJECT_ID(N'AdventureWorks2014.Person.Person'),1,NULL,'DETAILED')

SELECT index_depth,index_level,record_count,page_count,avg_page_space_used_in_percent 'Page:Percent Full',min_record_size_in_bytes 'Row:MinLen',
max_record_size_in_bytes 'Row:MaxLen', avg_record_size_in_bytes 'Row:AvgLen' from sys.dm_db_index_physical_stats(DB_ID (N'AdventureWorks2014'),OBJECT_ID
(N'AdventureWorks2014.Person.Person'),1,NULL,'DETAILED')

dbcc traceon (3604)

use WorldEvents
dbcc semetadata('tblEpisode')

dbcc page ('DoctorWho', 1, 361, 2)

dbcc page ('DoctorWho', 1, 360, 3)

select * from sys.dm_os_buffer_descriptors order by free_space_in_bytes desc

select count(*)*8/1024 'MB Used', sum(free_space_in_bytes)/1024/1024 'MB Empty' from sys.dm_os_buffer_descriptors

select case when database_id=32767 then 'Resourse DB' else db_name (database_id) end 'DB Name', count(*)*8/1024 'MB Used',
sum(free_space_in_bytes)/1024/1024 'MB Empty' from sys.dm_os_buffer_descriptors group by cube (database_id) order by 'MB Used' desc, 'MB Empty' desc

select wait_type, wait_time_ms from sys.dm_os_wait_stats order by wait_time_ms desc

select * from sys.dm_xe_packages
select * from sys.dm_xe_objects
select * from sys.dm_xe_object_columns

----Detecting Index Fragmentation----
SELECT db_name() 'Database'
		,S.name 'Schema'
		,T.name 'Table'
		,I.name 'Index'
		,DDIPS.index_type_desc 'Index Type'
		,DDIPS.avg_fragmentation_in_percent
		,DDIPS.page_count
FROM	sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) DDIPS
		INNER JOIN sys.tables T on T.object_id = DDIPS.object_id
		INNER JOIN sys.schemas S on T.schema_id = S.schema_id
		INNER JOIN sys.indexes I ON I.object_id = DDIPS.object_id
		AND DDIPS.index_id = I.index_id
WHERE	DDIPS.database_id = DB_ID()
		and I.name is not null
		--and DDIPS.avg_fragmentation_in_percent > 0
ORDER BY DDIPS.avg_fragmentation_in_percent desc

select * from sys.dm_db_index_physical_stats(db_id(),null,null,null,null)