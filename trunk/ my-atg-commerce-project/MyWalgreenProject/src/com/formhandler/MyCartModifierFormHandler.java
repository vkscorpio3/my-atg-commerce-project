package com.formhandler;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;

import atg.commerce.order.CommerceItem;
import atg.commerce.order.OrderImpl;
import atg.commerce.order.purchase.CartModifierFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class MyCartModifierFormHandler extends CartModifierFormHandler {

	private String[] optionSelected;

	public String[] getOptionSelected() {
		return optionSelected;
	}

	public void setOptionSelected(String[] optionSelected) {
		this.optionSelected = optionSelected;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void preRemoveItemFromOrder(DynamoHttpServletRequest pRequest,
			DynamoHttpServletResponse pResponse) throws ServletException,
			IOException {
		/*
		 * CommerceItem commerceItem = getOrder().getCommerceItem(
		 * pRequest.getParameter("removalCommerceIds"));
		 */
		String[] sports = pRequest.getParameterValues("sports");
		setRemovalCommerceIds(sports);
	}

	/*
	 * public boolean handleSetOrderByCommerceId(DynamoHttpServletRequest req,
	 * DynamoHttpServletResponse res) throws ServletException, IOException {
	 * OrderImpl orderImpl = (OrderImpl) req
	 * .getObjectParameter("removalCommerceIds"); for (Iterator i =
	 * orderImpl.getCommerceItems().iterator(); i.hasNext();) { CommerceItem
	 * commerceItem = (CommerceItem) i.next();
	 * req.setParameter("removalCommerceId", commerceItem);
	 * handleRemoveItemFromOrder(req, res); } return
	 * super.handleSetOrderByCommerceId(req, res); }
	 */
	public void handleSubmit(DynamoHttpServletRequest req,
			DynamoHttpServletResponse res) throws ServletException, IOException {
		/*
		 * String[] sports=req.getParameterValues("sports"); if (sports != null)
		 * { for (int i = 0; i < sports.length; i++) {
		 * req.setParameter("removalCommerceId", sports[i]);
		 * handleRemoveItemFromOrder(req, res); } }
		 */
		handleSetOrderByCommerceId(req, res);
	}

	public void handleRemoveItems(DynamoHttpServletRequest req,
			DynamoHttpServletResponse res) throws ServletException, IOException {
		List<String> sports = new ArrayList<String>();
		optionSelected = req.getParameterValues("sports");
		for (String sport : optionSelected) {
			sports.add(sport);
		}
		if (sports != null) {
			for (String sport : sports) {
				req.setParameter("removalCommerceId", sport);
				handleRemoveItemFromOrder(req, res);
			}
		}
		handleSetOrderByCommerceId(req, res);
	}
}
