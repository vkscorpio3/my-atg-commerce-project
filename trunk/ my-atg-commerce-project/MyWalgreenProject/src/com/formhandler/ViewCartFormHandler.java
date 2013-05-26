package com.formhandler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import atg.common.droplet.GenericFormError;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.json.*;

public class ViewCartFormHandler extends GenericFormError {
	public String getSelectText() {
		return selectText;
	}

	public void setSelectText(String selectText) {
		this.selectText = selectText;
	}

	private String selectText;
	public JSONObject preSubmitAction(String page) throws JSONException{
		Map<String, String> map = new HashMap<String, String>();
		map.put("page1", page);
		map.put("page2", page);
		map.put("page3", page);
		JSONObject json = new JSONObject();
		json.put("json", map);
		
		return json;
		
	}
	public boolean handleSubmit(DynamoHttpServletRequest request,
			DynamoHttpServletResponse response) throws IOException, JSONException {

		String searchText = "";
		searchText = getSelectText();
		JSONObject json = preSubmitAction(searchText);
		System.out.println(json.toString());
		response.sendLocalRedirect("loginSuccess.jsp", request);
		/*
		 * HttpSession session = request.getSession();
		 * session.setAttribute("prodId", searchText);
		 */

		return Boolean.TRUE;
	}

	/*public static void main(String[] args) throws JSONException {
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("A", 10L);
		map.put("B", 20L);
		map.put("C", 30L);
		JSONObject json = new JSONObject();
		json.put("json", map);
		System.out.println(json.toString());
		List<String> list = new ArrayList<String>();
		list.add("Sunday");
		list.add("Monday");
		list.add("Tuesday");
		json.accumulate("weekdays", list);
		System.out.println(json);
	}*/


}
