DECLARE @SchoolCnt INT = 0
BEGIN
    DELETE FROM [Scholar];
	DELETE FROM [School];
	DBCC CHECKIDENT ([Scholar], RESEED, 0);
	DBCC CHECKIDENT ([School], RESEED, 0);

	WHILE @SchoolCnt < 4
	BEGIN
		SET @SchoolCnt = @SchoolCnt + 1;
		DECLARE @ScholarCnt INT = 0;

		INSERT INTO [School](Title)
		VALUES (CONCAT(N'Mokykla ', @SchoolCnt));

		WHILE @ScholarCnt < 5
		BEGIN
			INSERT INTO [Scholar](FirstName, LastName, SchoolId)
			VALUES (N'Mokinys', CONCAT('Nr ', @SchoolCnt, '.', @ScholarCnt), @SchoolCnt);
			SET @ScholarCnt = @ScholarCnt + 1;
		END;
	END;
END;
