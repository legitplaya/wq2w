grant select, insert, update 
on ����������� to ��������

select * from ���������

sp_addlogin 'Sofronov_sql', 'Password_Sofronov'
sp_addsrvrolemember 'Sofronov_sql','securityadmin'

sp_helprole
sp_helprolemember [db_owner]

sp_adduser 'Sofronov_sql', 'Sofronov_user'
sp_addrolemember 'db_datareader', 'Sofronov_user'

grant select on ����������� to Sofronov_user
grant update on �����������(�������, ���, ��������) to Sofronov_user

select name as '���� �������'
from sys.server_principals
where type_desc = 'SERVER_ROLE';

exec sp_srvrolepermission 'dbcreator';

exec sp_srvrolepermission 'securityadmin'

alter login Sofronov_sql with password = 'Sofronovsql123'

use ip521_Sofronov
drop database t

select * from �����������