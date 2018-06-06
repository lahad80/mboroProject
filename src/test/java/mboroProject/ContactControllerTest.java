package mboroProject;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.lahad.controllers.ContactController;

public class ContactControllerTest {
	
	@Test
	public void viewName(){	
		String expectedValue = new ContactController().printContact();
		assertEquals(expectedValue,"contact");
	}
}
