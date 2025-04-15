package com.example.project2_test.idCreator;

public class clientIdGenerator {
public static String generateNextId(String lastProjectIdFromEmployeeDB) {
	//=========incrimenting employeeId which is coming from DB=======
	int num = Integer.parseInt(lastProjectIdFromEmployeeDB.substring(7).trim());
	num++;
	lastProjectIdFromEmployeeDB = String.format("client-%03d", num); 
	return lastProjectIdFromEmployeeDB;
}
}

