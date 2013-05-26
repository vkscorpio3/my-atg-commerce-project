package com.formhandler;

import java.io.IOException;
import java.util.Dictionary;

import javax.servlet.ServletException;

import atg.commerce.profile.CommerceProfileFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public
class eStoreProfileFormHandler
extends CommerceProfileFormHandler
{
	
	  @SuppressWarnings("unchecked")
	public void preCreateUser(DynamoHttpServletRequest pRequest,
              DynamoHttpServletResponse pResponse)
throws ServletException, IOException
{
		  	String firstName = (String) getValueProperty("firstName");
		    String middleName = (String) getValueProperty("middleName");
		    String lastName = (String) getValueProperty("lastName");

		    // Extract the billingAddress and shippingAddress, as dictionary objects,
		    // from the values dictionary.
		    Dictionary billingAddress = (Dictionary) getValueProperty("billingAddress");
		    Dictionary shippingAddress = (Dictionary) getValueProperty("shippingAddress");

		    // Copy all three names to billing & shipping addresses
		    if (billingAddress != null) {
		      billingAddress.put("firstName", firstName);
		      billingAddress.put("middleName", middleName);
		      billingAddress.put("lastName", lastName);
		    }

		    if (shippingAddress != null) {
		      shippingAddress.put("firstName", firstName);
		      shippingAddress.put("middleName", middleName);
		      shippingAddress.put("lastName", lastName);
		    }
		   
}
	
}
