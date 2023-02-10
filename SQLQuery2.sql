WITH CTE_Name AS
(
	SELECT 
	[Title],
    [Authors],
    [Scopus Author Ids],
    [Year],
    [Scopus Source title],
    [Citations],
    [DOI],
    [Publication type],
    [Open Access],
    [EID],
    [All Science Journal Classification (ASJC) code],
    [Sustainable Development Goals (2022)],
	value AS ScopusID
	FROM [Scopus_Data].[dbo].[Scopus]
	CROSS APPLY string_split ([Scopus Author Ids], '|')

)
/***SELECT * FROM CTE_Name

SELECT * FROM [Scopus_Data].[dbo].[ScopusID]***/

SELECT
	a.[FnameTH],
	b.[Title],
    b.[Authors],
    b.[Year],
    b.[Scopus Source title],
    b.[Citations],
    b.[DOI],
    b.[Publication type],
    b.[Open Access],
    b.[EID]
FROM [Scopus_Data].[dbo].[ScopusID] AS a
INNER JOIN CTE_Name AS b
ON a.[Scopus Author ID] = b.ScopusID
ORDER BY b.[Year] DESC;

    
    
    
