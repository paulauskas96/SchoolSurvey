BEGIN
  DELETE FROM [Answer];
  DBCC CHECKIDENT ([Answer], RESEED, 0);

  DELETE FROM [Statement];
  DBCC CHECKIDENT ([Statement], RESEED, 0);

  DELETE FROM [Category];
  DBCC CHECKIDENT ([Category], RESEED, 0);

  INSERT INTO [Answer]([Text], [IsDefault]) VALUES (N'Sutinku', 1);
  INSERT INTO [Answer]([Text], [IsDefault]) VALUES (N'Iš dalies sutinku', 1);
  INSERT INTO [Answer]([Text], [IsDefault]) VALUES (N'Nesutinku', 1);

  INSERT INTO [Category]([CategoryPrompt]) VALUES (N'Keletas klausimų apie tave:');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Tu esi:', 1);
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (1, N'Mergaitė');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (1, N'Berniukas');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Kokiai rasei save priskirtum?', 1);
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (2, N'Baltaodžių');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (2, N'Juodaodžių');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (2, N'Geltonodžių');
  INSERT INTO [Answer]([StatementId], [Text], [IsCustom], [CustomPrompt]) VALUES (2, N'Kitai', 1, N'prašome įrašyti');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Kokios esi tautybės?', 1);
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (3, N'Lietuvių');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (3, N'Rusų');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (3, N'Lenkų');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (3, N'Žydų');
  INSERT INTO [Answer]([StatementId], [Text], [IsCustom], [CustomPrompt]) VALUES (3, N'Kitos', 1, N'prašome įrašyti');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Ar gauni mokykloje nemokamus pietus?', 1);
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (4, N'Taip');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (4, N'Ne');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Ar tavo klasėje mokosi vaikų, kurių odos spalva yra kitokia nei tavo (pvz. juodaodžių)?', 1);
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (5, N'Taip');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (5, N'Ne');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Ar visada gyvenai tik Lietuvoje?', 1);
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (6, N'Taip');
  INSERT INTO [Answer]([StatementId], [Text], [IsCustom], [CustomPrompt]) VALUES (6, N'Ne', 1, N'parašyk, kurioje šalyje gyvenai ir kiek metų');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Ar tau padeda mokytis specialusis pedagogas?', 1);
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (7, N'Taip');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (7, N'Ne');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Kaip tau sekasi mokytis?', 1);
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (8, N'Puikiai');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (8, N'Labai gerai');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (8, N'Gerai');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (8, N'Vidutiniškai');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (8, N'Patenkinamai');
  INSERT INTO [Answer]([StatementId], [Text]) VALUES (8, N'Blogai');

  INSERT INTO [Category]([CategoryPrompt]) VALUES (N'Ką norėtum pakeisti savo mokykloje? Kodėl?');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'1.', 2);
  INSERT INTO [Answer]([StatementId], [Text], [IsCustom], [CustomPrompt]) VALUES (9, N'Pasiūlymas 1', 1, N'Pasiūlymas 1');
  
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'2.', 2);
  INSERT INTO [Answer]([StatementId], [Text], [IsCustom], [CustomPrompt]) VALUES (10, N'Pasiūlymas 2', 1, N'Pasiūlymas 2');
    
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'3.', 2);
  INSERT INTO [Answer]([StatementId], [Text], [IsCustom], [CustomPrompt]) VALUES (11, N'Pasiūlymas 3', 1, N'Pasiūlymas 3');

  INSERT INTO [Category]([CategoryPrompt]) VALUES (N'Apie tavo mokyklą ir draugus:');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mokykloje yra jaukių ir patogių vietų prisėsti, pabūti', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Pertraukų metu man yra ką veikti mokykloje', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mielai leidžiu laiką mokykloje po pamokų (bibliotekoje, sporto salėje, būreliuose ir kt.)', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Savo mokykloje aš turiu keletą gerų draugų', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Kai kurie mano klasės draugai prasivardžiuoja', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Man draugai padeda, kai susiduriu su sunkumais', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Aš padedu klasės draugams, kai jiems kyla sunkumų', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mūsų klasės taisyklės yra teisingos', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'„Prisidirbęs“ mokinys gali būti pašalintas iš mokyklos', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Būna, kad vaikai iš manęs tyčiojasi', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Būna, kad Facebook ar telefonu gaunu įžeidžiančių žinučių', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Būna, kad kiti mokiniai  mane stumdo ar kitaip skriaudžia', 3);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Jei iš manęs tyčiojasi, aš pasakau mokytojams', 3);

  INSERT INTO [Category]([CategoryPrompt]) VALUES (N'Apie tavo klasės mokytoją...');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mano mokytoja ir kiti mokyklos darbuotojai yra labai draugiški', 4);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Kai man negera, esu nusiminęs, mokykloje sulaukiu suaugusiųjų paramos', 4);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mano mokytoja visada padeda teisingai išspręsti kilusius konfliktus', 4);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Man patinka mūsų klasės mokytoja', 4);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Kai susiduriu su sunkumais atlikdamas užduotį, prašau mokytojos pagalbos', 4);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mano mokytoja man visada padeda', 4);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mano mokytojai patinka man padėti', 4);
  INSERT INTO [Statement]([Text], [CategoryId], [IsNullable]) VALUES (N'Man lengviau mokytis, kai tam tikrose pamokose man padeda specialusis pedagogas (atsakyk, jei turi tokią pagalbą)', 4, 1);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mano mokytojai patinka klausytis, ką aš sakau', 4);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mano mokytojai įdomu, kuo aš domiuosi ir ką aš veikiu laisvalaikiu', 4);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Jei aš praleidžiu pamokas, mano mokytoja visada paklausia, kas man buvo nutikę', 4);

  INSERT INTO [Category]([CategoryPrompt]) VALUES (N'Apie tavo norą mokytis...');
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mokykloje yra pamokų, kurias labai mėgstu', 5);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Man įdomu tai, ko mokausi mokykloje', 5);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Tai, ko mokausi, man yra per sunku', 5);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Sunkių užduočių aš dažniausiai nedarau arba bandau nusirašyti', 5);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Man patinka sužinoti ką nors nauja', 5);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Jei ko nesuprantu, visada stengiuosi išsiaiškinti', 5);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mokykloje man nuobodu', 5);

  INSERT INTO [Category]([CategoryPrompt]) VALUES (N'Apie pamokas...');
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Kartu su mokytoja aptariame, ką turiu išmokti artimiausiu metu', 6);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mokytoja mus dažnai skirsto dirbti porose, grupėse', 6);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mokydamiesi mes dažnai naudojame kompiuterius, planšetes, telefonus ir kt.', 6);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Pamokų metų daug kalbame apie žmonių įvairovę  pasaulyje (pvz. žmones su negalia, juodaodžius, musulmonus)', 6);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Kai mokytoja aiškina, dažnai galvoju apie kitus dalykus', 6);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mokytoja barasi, jei suklystu ar ko nors nemoku', 6);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Jei kas nors blogai elgiasi, dažnai yra išvaromi iš klasės', 6);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mokytojus erzina „kitokie“ savo išvaizda, elgesiu, požiūriu vaikai', 6);

  INSERT INTO [Category]([CategoryPrompt]) VALUES (N'Apie namų darbus ir kitas užduotis...');

  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mokytoja man dažnai leidžia pasirinkti, kokias užduotis atlikti', 7);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Klasėje visuomet spėju atlikti pateiktas užduotis', 7);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mano darbai yra kabinami ant sienų', 7);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Mokytoja skiria namų darbus daryti kartu su klasės draugu / drauge', 7);
  INSERT INTO [Statement]([Text], [CategoryId]) VALUES (N'Dažniausiai suprantu, kaip reikia atlikti namų darbus', 7);
END;
