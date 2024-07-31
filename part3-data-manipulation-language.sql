----------------------- PART III

-- 1a. Insert 3 product_type
insert into product_type (type_name) 
values ('Elektronik'), ('Pakaian'), ('Buku');

-- 1b. Insert 2 product dengan product_type_id = 1
insert into product (product_name, product_typeid, merk) 
values ('Laptop', 1, 'Samsung'), ('Smartphone', 1, 'Iphone');

select * from product

-- 1c. Insert 3 product dengan product_type_id = 2
insert into product (product_name, product_typeid, merk) 
values
('Kemeja', 2, 'Dust'), 
('Jeans', 2, 'Levis'), 
('Jaket', 2, 'Adidas');

-- 1d. Insert 3 product dengan product_type_id = 3
insert into product (product_name, product_typeid, merk) 
values 
('Novel', 3, 'Gramedia'), 
('Buku Pelajaran', 3, 'Airlangga'), 
('Majalah', 3, 'Tempo');

-- 1e. Insert product_description untuk setiap product
insert into product_description (product_descriptionid, description) 
values
(1, 'barang baru dan bagus'),
(2, 'barang bekas dan masih bagus'),
(3, 'Kemeja katun nyaman'), 
(4, 'Jeans denim gaya'), 
(5, 'Jaket musim dingin hangat'), 
(6, 'Novel terlaris'), 
(7, 'Buku pelajaran edukatif'), 
(8, 'Majalah populer');

update product set product_descriptionid = 1 where productid = 7;

update product set product_descriptionid = 2 where productid = 8;

-- 1f. Insert 3 payment_method
insert into payment_method (payment_methodid, method_name) 
values
(1, 'Kartu Kredit'), 
(2, 'Paypal'), 
(3, 'Bayar di Tempat');

-- 1g. Insert 5 user
insert into users (name, address_id, dob, status_user, gender, created_at, updated_at) 
values 
('Alisa', 1, '1990-01-01', 'aktif', 'F', NOW(), NOW()), 
('Boby', 2, '1985-05-05', 'tidak aktif', 'M', NOW(), NOW()), 
('Charly', 3, '1992-12-12', 'aktif', 'M', NOW(), NOW()), 
('Davidson', 4, '1988-03-03', 'aktif', 'M', NOW(), NOW()), 
('Eva', 5, '1995-07-07', 'aktif', 'F', NOW(), NOW());

-- 1h. Insert 3 transaksi untuk minimal 3 user
insert into transaction (userid, transaction_date) 
values 
(1, NOW()), 
(2, NOW()), 
(3, NOW()), 
(1, NOW() - interval '2 day'), 
(2, NOW() - interval '5 days'), 
(3, NOW() - interval '7 days');

-- 1i. Insert 3 product dalam setiap transaksi
insert into transaction_detail (transactionid, productid, quantity, price, payment_methodid) 
values
(1, 7, 1, 10000000, 2), 
(1, 8, 1, 5000000, 1), 
(1, 15, 1, 300000, 1), 
(2, 16, 1, 500000, 3), 
(2, 17, 1, 400000, 1), 
(2, 18, 1, 40000, 3), 
(3, 19, 1, 30000, 3), 
(3, 20, 1, 40000, 3), 
(3, 18, 1, 60000, 1);


-- 2a.  Pilih nama user dengan gender 'M'
select name from users where gender = 'M';

-- 2b. Pilih product dengan id = 3
select * from product
where productid = 3;

-- 2c. Pilih data pelanggan yang created_at dalam 7 hari terakhir dan nama mengandung 'a'
select * from users 
where created_at >= NOW() - interval '7 days' AND name LIKE '%a%';

-- 2d. Hitung jumlah pelanggan dengan gender Perempuan (Female/F)
select count(*) from users where gender = 'F';

-- 2e. Tampilkan data pelanggan dalam urutan nama abjad
select * from users 
order by name asc;

-- 2f. Tampilkan 5 data transaksi dengan product_id = 3
select * from transaction_detail 
where productid = 3 
limit 5;


-- 3a. Update nama product dimana product_id = 1 menjadi 'product_dummy'
update product 
set product_name = 'product_dummy' 
where productid = 1;

-- 3b. Update quantity menjadi 3 dalam transaction_detail dimana product_id = 1
update transaction_detail 
set quantity = 3 
where productid = 1;


-- 4a. Hapus data dalam tabel product dimana product_id = 1
delete from product 
where productid=1;

-- 4b. Hapus data dalam tabel product dimana product_type_id = 1
delete from product 
where product_typeid=1; 