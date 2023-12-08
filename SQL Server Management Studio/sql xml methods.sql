declare @myDoc xml
set @myDoc = '<country>
<name>France</name>
<population>59.7</population>
</country>'
select @myDoc.query('/country/ name')



declare @ProdId int
declare @myDoc1 xml
set @myDoc1 = '<country>
<name>Netherlands</name>
<population>21</population>
</country>'
set @ProdId=@myDoc1.value('(/country/population)[1]','int')
select @ProdId



declare @isExist bit
declare @myDox xml
set @myDox = '<country>
<name> Japan </name>
<population>15</population>
</country>'
set @isExist = @myDox.exist('/country/name = Japan')
select @isExist



declare @myDoxswat xml
set @myDoxswat = '<country>
<name>Mother Russia</name>
<cities>
<city>Moscow</city>
<city>Cheboksary</city>
<city>Balahna</city>
</cities>
</country>'
select T.Cities.value('./text()[1]','nvarchar(50)') as result
from @myDoxswat.nodes('/country/cities/city')
T(Cities)

