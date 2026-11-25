SELECT * FROM Users;

insert into users (name, email, age) values ('minhquan','quan@gmail.com',23),
('minhtu','quan@gmail.com',23)

SELECT * FROM Users
WHERE id = 1;

UPDATE Users
SET name='hang'
WHERE id=2;

SELECT DISTINCT [name],email  From Users;--lọc dữ liệu trùng lặp

SELECT COUNT(DISTINCT [NAME]) AS [NAME] FROM USERS

SELECT SUM(ID) AS ID FROM USERS;

SELECT AVG(ID) AS ID FROM USERS;

SELECT * FROM Users
ORDER BY [NAME] DESC;-- SẮP XẾP DỮ LIỆU TRẢ VỀ THEO THỨ TỰ

SELECT * FROM Users
WHERE [name] LIKE '%a%';-- sự khác biệt giữa dấu _ và % là 
										--1 kí tự và nhiều kí tự

SELECT [NAME], COUNT([NAME]) AS [NAME]
FROM USERS
GROUP BY [NAME]-- NHÓM DỮ LIÊỤ
HAVING COUNT([NAME])>0 -- ĐIỀU KIỆN KHI DÙNG GROUP BY
ORDER BY COUNT([NAME]) DESC;