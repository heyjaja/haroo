package com.haroo.mapper;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	@Test
	public void test() {
		try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "haroo", "1234")) {
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

}
