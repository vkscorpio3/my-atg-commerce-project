package com.droplet;

import java.io.IOException;

import javax.servlet.ServletException;

import com.tool.SearchDBManager;

import atg.json.JSONException;
import atg.json.JSONObject;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;

public class ViewCartDroplet extends DynamoServlet  {
	SearchDBManager searchDBManager;
	
	public SearchDBManager getSearchDBManager() {
		return searchDBManager;
	}

	public void setSearchDBManager(SearchDBManager searchDBManager) {
		this.searchDBManager = searchDBManager;
	}
	public static JSONObject createJSONObject(String option) throws JSONException{
		JSONObject jsonPage = new JSONObject();
		if(option.equalsIgnoreCase("A")){
			jsonPage.put("div1", "login.jsp");
			jsonPage.put("div2", "cart.jsp");
			jsonPage.put("div3", "registration.jsp");
		}
		else if(option.equalsIgnoreCase("B")){
			jsonPage.put("div1", "cart.jsp");
			jsonPage.put("div2", "login.jsp");
			jsonPage.put("div3", "registration.jsp");
		}
		else if(option.equalsIgnoreCase("C")){
			jsonPage.put("div1", "registration.jsp");
			jsonPage.put("div2", "cart.jsp");
			jsonPage.put("div3", "login.jsp");
		}
		
		return jsonPage;
		
	}
	public void service(DynamoHttpServletRequest req,
			DynamoHttpServletResponse res) throws ServletException, IOException {
			String optionValue=String.valueOf(req.getParameter("pageOption"));
			JSONObject jsonResult=new JSONObject();
			if(optionValue!=null ){
				try {
					if(createJSONObject(optionValue)!=null){
						jsonResult.put("result",createJSONObject(optionValue));
					}
				} catch (JSONException e) {
					e.printStackTrace();
				}
				res.setContentType("application/x-json");
				res.getWriter().print(jsonResult);
			}
			/*String[] sports=req.getParameterValues("pageOption");
			if (sports != null) {
				for (int i = 0; i < sports.length; i++) {
					req.setParameter("removalCommerceId", sports[i]);
					CartModifierFormHandler c=new CartModifierFormHandler();
					c.setRemovalCommerceIds(sports);
				}
			} 
			res.sendLocalRedirect("radio.jsp",req);*/
	}
}
