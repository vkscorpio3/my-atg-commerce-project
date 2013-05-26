package com.formhandler;

import java.io.IOException;

import java.util.Map;

import javax.servlet.ServletException;

import atg.commerce.catalog.CatalogTools;
import atg.commerce.order.purchase.CartModifierFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class BikeStoreCartModifierFormHandler extends CartModifierFormHandler {
	/**
	 * Called before any processing is done by the moveToPurchaseInfo method. It
	 * currently does nothing.
	 * 
	 * @param pRequest
	 *            the request object
	 * @param pResponse
	 *            the response object
	 * @exception ServletException
	 *                if an error occurs
	 * @exception IOException
	 *                if an error occurs
	 */
	CatalogTools catalogTools;
	protected Map<String, Long> qtyCatalogMap;

	public CatalogTools getCatalogTools() {
		return catalogTools;
	}

	public void setCatalogTools(CatalogTools catalogTools) {
		this.catalogTools = catalogTools;
	}

	private String catalogId;

	public String getCatalogId() {
		return catalogId;
	}

	public void setCatalogId(String catalogId) {
		this.catalogId = catalogId;
	}
	private String commerceId;

	public String getCommerceId() {
		return commerceId;
	}

	public void setCommerceId(String commerceId) {
		this.commerceId = commerceId;
	}

	public void preMoveToPurchaseInfo(DynamoHttpServletRequest pRequest,
			DynamoHttpServletResponse pResponse) throws ServletException,
			IOException {
		setCheckForChangedQuantity(false);
	}

	public void preRemoveItemFromOrder(DynamoHttpServletRequest pRequest,
			DynamoHttpServletResponse pResponse) throws ServletException,
			IOException {
		/*CommerceItem commerceItem = getOrder().getCommerceItem(
				pRequest.getParameter("removalCommerceIds"));*/
		String commerceIds[] = { getCommerceId() };
		setRemovalCommerceIds(commerceIds);
	}
}
