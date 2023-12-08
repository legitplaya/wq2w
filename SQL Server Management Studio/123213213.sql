USE [ip521_Sofronov]
GO
/****** Object:  StoredProcedure [dbo].[Student_Select_Faculty]    Script Date: 06.12.2023 12:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[Student_Select_Faculty]
@Код_специальности int
as
select Абитуриенты.* from Абитуриенты join Заявления on Абитуриенты.Код_абитуриента = Заявления.Код_абитуриента join Специальности on Заявления.Код_специальности = Специальности.Код_специальности
where Специальности.Код_специальности=@Код_специальности
