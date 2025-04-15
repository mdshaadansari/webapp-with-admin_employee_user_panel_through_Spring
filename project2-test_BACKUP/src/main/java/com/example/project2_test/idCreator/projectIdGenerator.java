package com.example.project2_test.idCreator;

public class projectIdGenerator {
public static String generateNextId(String lastProjectIdFromProjectDB) {
	//=========incrimenting employeeId which is coming from DB=======
	int num = Integer.parseInt(lastProjectIdFromProjectDB.substring(8).trim());
	num++;
	lastProjectIdFromProjectDB = String.format("project-%03d", num); 
	return lastProjectIdFromProjectDB;
}
}
