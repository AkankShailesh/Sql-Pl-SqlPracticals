DECLARE 
    aId number;
    fName varchar(50);
    lName varchar(50);
begin
  select associateId,firstName,lastName INTO aId,fName,lName
        from Associate
          where associateId=&aId;
            DBMS_OUTPUT.PUT_LINE(aId||' '||fName||' '||lName);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
          DBMS_OUTPUT.PUT_LINE('No employees exits');
      WHEN TOO_MANY_ROWS THEN
          DBMS_OUTPUT.PUT_LINE('Too many raecords foundf');
end;

DECLARE 
    CURSOR associateCursor is select * from Associate  where YEARLYINVESTMENTUNDER80C>=&YEARLYINVESTMENTUNDER80C;
    associateRow ASSOCIATE%ROWTYPE;
     NO_Records_Found EXCEPTION ;
     begin
      OPEN associateCursor;
      FETCH associateCursor INTO associateRow;
      IF associateCursor%ROWCOUNT>0
          THEN
          LOOP
              FETCH associateCursor INTO associateRow;
                  DBMS_OUTPUT.PUT_LINE(associateRow.ASSOCIATEID||' '||associateRow.firstName||' '||associateRow.lastName);
                  EXIT WHEN associateCursor%NOTFOUND;
          END LOOP;
        ELSE
            RAISE NO_Records_Found; 
       END IF;     
          CLOSE associateCursor;
---------------------------------------------------------------------------------------------------------
DECLARE 
    CURSOR associateCursor IS SELECT * FROM ASSOCIATE 
     where YEARLYINVESTMENTUNDER80C>=&YEARLYINVESTMENTUNDER80C;
    AssociateRow ASSOCIATE%ROWTYPE;
     NO_Records_Found EXCEPTION ;
     begin
      OPEN associateCursor;
      FETCH associateCursor INTO associateRow;
      IF associateCursor%ROWCOUNT>0
          THEN
          LOOP
              FETCH associateCursor INTO associateRow;
                  DBMS_OUTPUT.PUT_LINE(associateRow.ASSOCIATEID||' '||associateRow.firstName||' '||associateRow.lastName);
                  EXIT WHEN associateCursor%NOTFOUND;
          END LOOP;
        ELSE
            RAISE NO_Records_Found; 
       END IF;     
          CLOSE associateCursor;  
          
        EXCEPTION 
          WHEN NO_Records_Found THEN
                  DBMS_OUTPUT.PUT_LINE('NO details found');
END;