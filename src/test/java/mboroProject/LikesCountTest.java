package mboroProject;


import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.lahad.daoImpl.MboroForEnglishDaoImpl;

public class LikesCountTest {
	
	@Autowired
	MboroForEnglishDaoImpl mdi;
	
	@Test
	public void testIncrementation(){
		int currentCount = mdi.getLikesCount();
		mdi.incrementLikesCount();
		assertEquals(currentCount + 1, mdi.getLikesCount());
	}
}
