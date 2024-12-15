
/*
antalya g�m�ld�r -> izmir g�m�ld�r
antalya muratpa�a -> antalya muratpasa
ayd�n ku�adasi -> ayd�n kusadasi
ady�n sel�uk -> izmir sel�uk
di�er olan kayd� sildik.
odayeri -> eyupsultan
�e�me -> �esme
Cumaovasi(menderes) -> menderes
kar��yaka -> karsiyaka
izmir ku�adasi -> aydin ku�adasi
KKTC olanlar -> ? ? ?
*/

/*
update datapioneers_master_data
set SaleDistrictName_fixed = 'Muratpasa'
where SaleId = 175289
and ContactId = 673139

update datapioneers_master_data
set SaleCityName_fixed = 'Izmir'
where SaleDistrictName_fixed = 'Sel�uk'
and SaleCityName_fixed = 'Aydin'

delete from datapioneers_master_data
where SaleDistrictName_fixed = 'Diger'
and SaleCityName_fixed = 'Diger'

update datapioneers_master_data
set SaleDistrictName_fixed = 'EyupSultan '
where SaleDistrictName_fixed = 'Odayeri'
and SaleCityName_fixed = 'Istanbul'

update datapioneers_master_data
set SaleDistrictName_fixed = '�esme'
where SaleId = 149857
and ContactId = 664560

update datapioneers_master_data
set SaleDistrictName_fixed = 'Menderes'
where SaleDistrictName_fixed = 'Cumaovasi(menderes)'
and SaleCityName_fixed = 'Izmir'

update datapioneers_master_data
set SaleDistrictName_fixed = 'Karsiyaka'
where SaleId = 141781
and ContactId = 660304

update datapioneers_master_data
set SaleCityName_fixed = 'Aydin'
where SaleDistrictName_fixed = 'Kusadasi'
and SaleCityName_fixed = 'Izmir'

--update 1 �ehir bilgilerini district alan�na kayd�rma.
update  datapioneers_master_data
set SaleDistrictName_fixed = SaleCityName_fixed
where Bolge = 'KKTC'

--update 2 �ehir bilgilerine KKTC set et.
update  datapioneers_master_data
set SaleCityName_fixed = 'KKTC'
where Bolge = 'KKTC'

--Kaya Artemis Resort Hotel district alan�na iskele set edildi.
update datapioneers_master_data
set SaleDistrictName_fixed = '�skele'
where Bolge = 'KKTC'
and ProductName = 'Kaya Artemis Resort Hotel'

--Sea Life Long Beach Hotel district alan�na �skele set edildi.
update datapioneers_master_data
set SaleDistrictName_fixed = '�skele'
where Bolge = 'KKTC'
and ProductName = 'Sea Life Long Beach Hotel'

--Le Chateau Lambousa Hotel district alan�na Girne set edildi.
update datapioneers_master_data
set SaleDistrictName_fixed = 'Girne'
where Bolge = 'KKTC'
and ProductName = 'Le Chateau Lambousa Hotel'

--Merit Cyprus Gardens Resort & Casinol district alan�na iskele set edildi.
update datapioneers_master_data
set SaleDistrictName_fixed = '�skele'
where Bolge = 'KKTC'
and ProductName = 'Merit Cyprus Gardens Resort & Casino'

--Oscar Park Hotel district alan�na iskele set edildi.
update datapioneers_master_data
set SaleDistrictName_fixed = '�skele'
where Bolge = 'KKTC'
and ProductName = 'Oscar Park Hotel'

--District name alan� Iskele olanlara �skele set edildi.
update datapioneers_master_data
set SaleDistrictName_fixed = '�skele'
where SaleDistrictName_fixed = 'Iskele'

--otel ad�nda thermal ge�ip termal kolonu 0 olan kay�tlar.
update datapioneers_master_data
set Termal = 1
where Termal = 0
and ProductName like '%Thermal%' 

--ad�nda resort olup resort kolonu 0 olan de�erler g�ncellendi.
update datapioneers_master_data
set resort = 1
where productName like '%Resort%'
and resort =0

update datapioneers_master_data
set Bolge = 'Ege'
where saleDistrictName_fixed like '%G�m�ld�r%'

update datapioneers_master_data
set  payType = 'Havale'
where PayType = 'Null'


update datapioneers_master_data
set  payType = 'Havale'
where PayType = 'Nakit'

update datapioneers_master_data
set cardName = '0'
where cardName = 'Null'
and paytype = 'Havale'


update datapioneers_master_data
set cardName = 'Diger'
where cardName = 'Null'
and paytype = 'Pos'

update datapioneers_master_data
set Seasons_Winter =case when Seasons = 'High' then 'Low'
						 else 'High' end

--muhasebecilerin kar� tutturabilmek i�in girdi�i eksi de�er olabilir. silelim.
delete datapioneers_master_data
where Purchase < 0


delete from datapioneers_master_data
where GrosProfit_dolar = -14852

update datapioneers_master_data
set Daily_Room_Rate = CAST(
        (
            CAST(Price_dolar AS DECIMAL(15,2)) / 
            CAST(Stay_Fixed AS DECIMAL(15,2))
        ) /
        CAST(
            CASE 
                WHEN Pax = 0 THEN 1 
                ELSE Pax 
            END 
            AS DECIMAL(15,2)
        ) 
        AS DECIMAL(15,2)
    )
*/