select *
from hr_data

--Menampilkan jumlah karyawan aktif (yang masih bekerja) berdasarkan jenis kelamin.
select "Gender", count("CF_attrition label")  as "Jumlah_Karyawan_Aktif"
from hr_data hd 
where "CF_attrition label" ='Current Employees'
group by "Gender"

--Menghitung jumlah karyawan yang keluar berdasarkan jenis kelamin.
select "Gender", count("Attrition") 
from hr_data hd 
where "Attrition" ='Yes'
group by "Gender" 

--Menghitung total keseluruhan karyawan yang keluar (tanpa memandang gender, umur, atau departemen).
select count("Attrition") as "pegawai keluar"
from hr_data hd 
where "Attrition" ='Yes'

--Menghitung rata-rata usia seluruh karyawan dalam dataset.
select cast(avg("Age") as decimal(10,2)) as avg_umur
from hr_data hd 

--Menampilkan jumlah karyawan yang keluar per departemen serta persentasenya terhadap 
--total karyawan yang keluar di seluruh perusahaan.
select "Department", count("Attrition"), round((cast(count("Attrition") as numeric) / (select count("Attrition") 
from hr_data where "Attrition"= 'Yes')) * 100,2) as percentage
from hr_data where "Attrition"='Yes' 
group by "Department" 
order by count("Attrition") desc

--Menampilkan jumlah karyawan di setiap kelompok usia (age band).
select "CF_age band", count("Age")
from hr_data hd 
group by "CF_age band"

--Menghitung jumlah karyawan yang keluar berdasarkan bidang pendidikan (Education Field).
select count("Attrition"), "Education Field"
from hr_data hd 
where "Attrition"='Yes'
group by "Education Field"

--Menampilkan jumlah karyawan yang keluar berdasarkan kombinasi kelompok usia dan jenis kelamin, 
--beserta persentasenya terhadap total karyawan yang keluar.
select "CF_age band", "Gender", count("Attrition") as "jumlah karyawan keluar", round((cast(count("Attrition") as numeric) / 
(select count("Attrition") from hr_data where "Attrition"='Yes'))  *100,2) as percentage
from hr_data
where "Attrition"='Yes'
group by "CF_age band","Gender"
order by "CF_age band" desc
