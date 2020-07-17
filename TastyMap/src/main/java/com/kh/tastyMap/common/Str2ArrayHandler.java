package com.kh.tastyMap.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 * 문자열과 배열을 상호 호환하기 위한
 * 타입(자료형)변환기
 * 
 *  3개의 getter 메소드와 1개의 setter 메소드를
 *  구현해야 한다.<br>
 *  
 *  <h3> getter </h3>
 *  <p> 1. 결과셋(ResultSet)에서 컬럼이름으로 변환하는 방법 </p>
 *  <p> 2. 결과셋에서 컬럼의 순번으로 찾아 변환하는 방법 </p>
 *  <p> 3. 프로시져 호출용 getter 구현 용도 </p>
 *  
 *  <h3> setter </h3>
 *  <p> 1. setter : String[] => String (join 메소드 역할)</p>
 *  
 * @author Daniel Yu
 */
public class Str2ArrayHandler implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		if(parameter != null) {
			ps.setString(i, String.join(",", parameter));
		} else {
			ps.setString(i, "");
		}
	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String colVal = rs.getString(columnName); // "Java,C,C++"
		String[] result = colVal.split(",");      //  0: "Java" / 1: "C" / 2: "C++"
		return result;
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String colVal = rs.getString(columnIndex); // "Java,C,C++"
		String[] result = colVal.split(",");      //  0: "Java" / 1: "C" / 2: "C++"
		return result;
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		String colVal = cs.getString(columnIndex); // "Java,C,C++"
		String[] result = colVal.split(",");      //  0: "Java" / 1: "C" / 2: "C++"
		return result;
	}
	
}
