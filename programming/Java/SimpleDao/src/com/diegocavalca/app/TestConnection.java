package com.diegocavalca.app;

import java.sql.Connection;
import java.sql.SQLException;

import com.diegocavalca.dao.ConnectionFactory;

public class TestConnection {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = new ConnectionFactory().getConnection();
		System.out.println("Conexão aberta!");
		connection.close();

	}

}
