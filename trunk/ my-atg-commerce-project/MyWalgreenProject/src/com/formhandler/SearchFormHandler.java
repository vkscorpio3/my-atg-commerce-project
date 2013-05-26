package com.formhandler;

import java.io.IOException;

import atg.droplet.GenericFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class SearchFormHandler extends GenericFormHandler {
	private String searchText;

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public boolean handleSubmit(DynamoHttpServletRequest request,
			DynamoHttpServletResponse response) throws IOException {

		String searchText = "";
		/*
		 * if (getSearchText().equals("")) { searchText = "ALL"; } else {
		 * searchText = getSearchText(); }
		 */
		searchText = getSearchText();
		request.addQueryParameter("prodId", searchText);
		response.sendLocalRedirect("displayProdSku.jsp", request);
		/*
		 * HttpSession session = request.getSession();
		 * session.setAttribute("prodId", searchText);
		 */

		return Boolean.TRUE;
	}

}
