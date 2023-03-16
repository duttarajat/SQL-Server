select trim('           Rajat         Dutta         ')
select replace('Rajat', 'aja', 'j')
select reverse('Rajat')
select substring('Rajat',3,10)
select charindex('j','Rajat')
select concat('Rajat', null, 'Dutta')

use AdventureWorks2019
select case when TaxRate<=7 then 'Small Tax' when TaxRate<=8 then 'Medium Tax' else 'Big Tax' end TaxSize, * from Sales.SalesTaxRate
select case TaxRate when 7 then 'Small Tax' when 8 then 'Medium Tax' else 'Big Tax' end TaxSize, * from Sales.SalesTaxRate

select * from sys.messages order by severity

declare @Num int = 1
;with cte as
(
select @Num as Num
union all
select Num+1 from cte where Num<=19
)
select * from cte

select * from A
left join B on
A.ID=B.ID
and B.DeptName='IT'

select * from A
left join B on
A.ID=B.ID
where B.DeptName='IT'

--Scope of Magic Tables - Triggers and Output Keyword