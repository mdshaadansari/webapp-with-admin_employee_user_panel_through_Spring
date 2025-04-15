package com.example.project2_test.DAO_Repository;

public class DAOImpleSingeltonFOR_jsp {
//in jsp no way to do @Autowired autowiring ,so to access DB in .jsp use this 
	
	private DAOImpleSingeltonFOR_jsp(){}
	
	
	static DAOInterface DAOImpl;
	
	static {
		DAOImpl = new DAOImpl();
	}
	
	public static DAOInterface getDAOImpl() {
		return DAOImpl;
	}
	
}
