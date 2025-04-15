package com.example.project2_test.idCreator;

public class employeeIdGenerator {
public static String generateNextId(String lastEmployeeIdFromEmployeeDB) {
	//=========incrimenting employeeId which is coming from DB=======
	int num = Integer.parseInt(lastEmployeeIdFromEmployeeDB.substring(4).trim());
	num++;
	lastEmployeeIdFromEmployeeDB = String.format("JTC-%03d", num);
	return lastEmployeeIdFromEmployeeDB;
}
}
