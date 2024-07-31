---------------------------------------------------------- PART IV

-- 1. Gabungkan data transaksi dari user_id = 1 dan user_id = 2
select * from transaction 
where userid IN (1, 2);

-- 2. Tampilkan jumlah harga transaksi user_id = 1
select sum(price * quantity) 
as total_price from transaction_detail td
join transaction t ON td.transactionid = t.transactionid
where t.userid = 1;

select * from users 
select * from product_type
select * from transaction
select * from transaction_detail

select transaction.transactionid , transaction_detail.price from transaction_detail
inner join transaction on transaction.transactionid=transaction_detail.transaction_detailid


-- 3. Tampilkan total transaksi untuk product_type = 2
select sum(price * quantity) 
as total_transaction from transaction_detail td
join product p ON td.productid = p.productid
where p.product_typeid = 2;

-- 4. Tampilkan semua field dari tabel product dan field name dari tabel product_type yang berhubungan
select p.*, pt.type_name 
from product p
join product_type pt ON p.product_typeid = pt.product_typeid;

-- 5. Tampilkan semua field dari tabel transaction, field nama dari tabel product dan field nama dari tabel user
select t.*, p.product_name, u.name 
from transaction t
join transaction_detail td ON t.transactionid = td.transactionid
join product p ON td.productid = p.productid
join users u ON t.userid = u.userid;

--6. Tampilkan product yang tidak pernah ada di tabel transaction_detail menggunakan subquery
select * from product 
where productid NOT IN (select productid from transaction_detail);

-- 7. Buat fungsi dan trigger untuk mengupdate otomatis kolom updated_at
create or replace function update_updated_at_column()
returns trigger as $$
begin
   new.updated_at = NOW();
   return new;
end;
$$ language plpgsql;

-- Terapkan trigger ke semua tabel
create trigger update_user_updated_at before update ON users
for each row execute function update_updated_at_column();

create trigger update_product_updated_at before update ON product
for each row execute function update_updated_at_column();

create trigger update_transaction_updated_at before update ON product_type
for each row execute function update_updated_at_column();

create trigger update_transaction_updated_at before update ON product_description
for each row execute function update_updated_at_column();

create trigger update_transaction_updated_at before update ON transaction
for each row execute function update_updated_at_column();

create trigger update_transaction_detail_updated_at before update ON transaction_detail
for each row execute function update_updated_at_column();

create trigger update_transaction_updated_at before update ON payment_method
for each row execute function update_updated_at_column();

create trigger update_transaction_updated_at before update ON address
for each row execute function update_updated_at_column();

-- 8. Buat view untuk menampilkan semua field dari product dan product_type
create view product_with_type AS
select p.*, pt.type_name 
from product p
join product_type pt ON p.product_typeid = pt.product_typeid;
