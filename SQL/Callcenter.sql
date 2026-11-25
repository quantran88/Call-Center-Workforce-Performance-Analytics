--PHẦN 1 SELECT,FROM,WHERE.
SELECT * FROM Callcenter;
SELECT [Agent_ID],[Agent_Name],[Team_clean],[Calls_Handled] FROM Callcenter;
--Tìm bản ghi có số cuộc gọi xử lí hơn 50
SELECT [Record_ID] AS MABANGHI,[Calls_Handled]  AS TONGSOCUOCGOI FROM Callcenter
WHERE Calls_Handled>50;
--Tìm điểm hài lòng của NHANVIEN nhỏ hơn 4
SELECT [Record_ID] AS MABANGHI ,[Agent_Name_Clean] AS TENNHANVIEN,[CSAT_Score] AS DOHAILONG FROM Callcenter
WHERE [CSAT_Score]<4;


--PHẦN 2 AND,OR,LIKE
--Tìm các bản ghi có Calls_Handled lớn hơn 50 hoặc CSAT_Score nhỏ hơn 4.
SELECT [Record_ID] AS MABANGHI,[Calls_Handled]  AS SOCUOCGOI,[Agent_Name_Clean] AS TENNHANVIEN,[CSAT_Score]AS DOHAILONG 
FROM Callcenter
WHERE Calls_Handled>50 OR [CSAT_Score]<4
--Tìm nhân viên tên có chứa chữ An
SELECT [Agent_Name_Clean] AS TENNHANVIEN FROM Callcenter
WHERE [Agent_Name_Clean] LIKE '%AN%'


--PHẦN 3 ORDER BY, DISTINCT 
--Sắp xếp nhân viên theo số cuộc gọi giảm dần.
SELECT [Agent_Name_Clean] AS TENNHANVIEN,[Calls_Handled] AS SOCUOCGOI
FROM Callcenter
ORDER BY [Calls_Handled] DESC;
--Liệt kê danh sách Team không trùng lặp.
SELECT DISTINCT [Team_clean] AS DANHSACHTEAM
FROM Callcenter

--Phần 4. SUM, COUNT, AVG
--Tính tổng số cuộc gọi đã xử lý của toàn Call Center.
SELECT SUM([Calls_Handled]) AS TONGSOCUOCGOI 
FROM Callcenter;
--Đếm tổng số bản ghi trong bảng.
SELECT COUNT([Record_ID]) AS TONGSOBANGHI
FROM Callcenter;
--Tính AHT trung bình của toàn Call Center.
SELECT AVG([AHT]) AS THOIGIANXULYTRUNGBINHCUOCGOI 
FROM CALLCENTER;


--Phần 5. GROUP BY, HAVING
--Tính tổng số cuộc gọi theo từng nhân viên.
SELECT [Agent_Name_Clean] AS TENNHANVIEN,SUM([Calls_Handled])AS TONGSOCUOCGOI 
FROM Callcenter
GROUP BY [Agent_Name_Clean];
--Tìm những nhân viên có tổng số cuộc gọi lớn hơn 1.200.
SELECT [Agent_Name_Clean] AS TENNHANVIEN,SUM([Calls_Handled])AS TONGSOCUOCGOI 
FROM Callcenter
GROUP BY [Agent_Name_Clean]
HAVING SUM([Calls_Handled])>1200


--Phần 6. INNER JOIN, LEFT JOIN
--Dùng INNER JOIN kết hợp hai bảng để hiển thị Agent_ID, Agent_Name_Clean, Team_Clean, Calls_Handled.
SELECT DISTINCT
    Agent_ID,
    Agent_Name_Clean,
    Team_Clean
INTO dbo.DimAgent
FROM dbo.CallCenter;

SELECT  c.Agent_ID AS IDNHANVIEN, q.Agent_Name_Clean AS TENNHANVIEN, q.Team_clean AS TEAM ,c.[Calls_Handled] AS SOCUOCGOI
FROM [dbo].[Callcenter] c
JOIN  [dbo].[DimAgent] q
ON c.Agent_ID = q.Agent_ID;

--Dùng LEFT JOIN để tìm nhân viên trong DimAgent chưa có dữ liệu hiệu suất trong CallCenter.
SELECT * FROM [dbo].[DimAgent];
INSERT INTO dbo.DimAgent
    (Agent_ID, Agent_Name_Clean, Team_Clean)
VALUES
    ('AG013', 'Nguyen Van An', 'TEAMC');
update dbo.DimAgent
set Team_clean ='Team C'
WHERE Agent_ID='AG013'
--Dùng LEFT JOIN để tìm nhân viên trong DimAgent chưa có dữ liệu hiệu suất trong CallCenter.
SELECT  c.Agent_ID AS IDNHANVIEN, c.Agent_Name_Clean AS TENNHANVIEN, c.Team_clean AS TEAM ,q.Calls_Handled AS SOCUOCGOI
FROM [dbo].[DimAgent] c
LEFT JOIN  [dbo].Callcenter q
ON c.Agent_ID = q.Agent_ID


--Phần 7. Subquery
--Tìm các nhân viên có tổng số cuộc gọi cao hơn tổng số cuộc gọi trung bình của các nhân viên.
SELECT [Agent_ID] AS IDNHANVIEN,[Agent_Name_Clean] AS TENNHANVIEN,SUM([Calls_Handled]) AS TONGSOCUOCGOI
FROM [dbo].[Callcenter] 
GROUP BY Agent_ID,Agent_Name_Clean
HAVING SUM([Calls_Handled]) > (
    SELECT AVG(TONGSOCUOCGOI)
    FROM (
        SELECT SUM(Calls_Handled) AS TONGSOCUOCGOI
            FROM dbo.CallCenter
            GROUP BY Agent_ID
    ) AS T
   );
--Tìm các bản ghi có AHT cao hơn AHT trung bình của toàn bộ dữ liệu.
SELECT [Record_ID] AS MABANGHI,[AHT] AS THOIGIANXULYTRUNGBINH
FROM [dbo].[Callcenter]
WHERE [AHT] > (
    SELECT AVG([AHT])
    FROM [dbo].[Callcenter] 
    );