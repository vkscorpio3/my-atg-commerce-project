package com.tool;

import javax.naming.InitialContext;
import javax.transaction.TransactionManager;

import com.bean.User;

import atg.dtm.TransactionDemarcation;
import atg.repository.MutableRepository;
import atg.repository.MutableRepositoryItem;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryView;
import atg.repository.rql.RqlStatement;

public class SearchDBManager {
	private Repository repository;
	private Repository productRepository;
	private RepositoryView repositoryView;
	RepositoryItem[] repositoryItem;
	private MutableRepository mutableRepository;
	private MutableRepository dmutableRepository;

	public Repository getRepository() {
		return repository;
	}

	public void setRepository(Repository repository) {
		this.repository = repository;
	}

	public MutableRepository getMutableRepository() {
		return mutableRepository;
	}

	public void setMutableRepository(MutableRepository mutableRepository) {
		this.mutableRepository = mutableRepository;
	}

	public MutableRepository getDmutableRepository() {
		return dmutableRepository;
	}

	public void setDmutableRepository(MutableRepository dmutableRepository) {
		this.dmutableRepository = dmutableRepository;
	}

	public Repository getProductRepository() {
		return productRepository;
	}

	public void setProductRepository(Repository productRepository) {
		this.productRepository = productRepository;
	}

	/**
	 * Get All the Details of All users
	 * 
	 * @param userName
	 * @return Array of Repository Items...1 Array is 1 record
	 * @throws RepositoryException
	 */
	public RepositoryItem[] getUserDetails(String userName)
			throws RepositoryException {
		repositoryView = this.getRepository().getView("user_db");
		RqlStatement rqlStatement = RqlStatement.parseRqlStatement("ALL");

		/*
		 * QueryBuilder qBuilder=repositoryView.getQueryBuilder();
		 * QueryExpression
		 * expressionFirstName=qBuilder.createPropertyQueryExpression
		 * ("firstName"); QueryExpression
		 * valueFirstName=qBuilder.createConstantQueryExpression(userName);
		 * Query
		 * queryFirstName=qBuilder.createComparisonQuery(expressionFirstName,
		 * valueFirstName, QueryBuilder.EQUALS);
		 */
		Object[] param = {};

		repositoryItem = rqlStatement.executeQuery(repositoryView, param);
		// repositoryItem=repositoryView.executeQuery(queryFirstName);

		return repositoryItem;
	}
	/**
	 * Get All the Details of All Products
	 * 
	 * @param productId
	 * @return Array of Repository Items...1 Array is 1 record
	 * @throws RepositoryException
	 */
	public RepositoryItem[] getSkuDetails(String skuId)
	throws RepositoryException {
		repositoryView = getProductRepository().getView("sku");
		Object[] param = null;
		RqlStatement rqlStatement =null;
		if(skuId.equals("ALL"))
		{
			rqlStatement=RqlStatement.parseRqlStatement("ALL");
		}
		else{
			rqlStatement=RqlStatement.parseRqlStatement("id=?0");
			param=new Object[1];
			param[0]=skuId;
		}
		/*
		 * QueryBuilder qBuilder=repositoryView.getQueryBuilder();
		 * QueryExpression
		 * expressionFirstName=qBuilder.createPropertyQueryExpression
		 * ("firstName"); QueryExpression
		 * valueFirstName=qBuilder.createConstantQueryExpression(userName);
		 * Query
		 * queryFirstName=qBuilder.createComparisonQuery(expressionFirstName,
		 * valueFirstName, QueryBuilder.EQUALS);
		 */
		
		
		repositoryItem = rqlStatement.executeQuery(repositoryView, param);
		// repositoryItem=repositoryView.executeQuery(queryFirstName);
		
		return repositoryItem;
	}
	/**
	 * Get All the Details of All Products
	 * 
	 * @param productId
	 * @return Array of Repository Items...1 Array is 1 record
	 * @throws RepositoryException
	 */
	public RepositoryItem[] getProductDetails(String productId)
	throws RepositoryException {
		repositoryView = getProductRepository().getView("product");
		Object[] param = null;
		RqlStatement rqlStatement =null;
		
		if(productId.equals("ALL"))
		{
			rqlStatement=RqlStatement.parseRqlStatement("ALL");
		}
		else if(productId.startsWith("prod")){
			rqlStatement=RqlStatement.parseRqlStatement("id=?0");
			param=new Object[1];
			param[0]=productId;
		}
		else{
			rqlStatement=RqlStatement.parseRqlStatement("displayName CONTAINS ?0");
			param=new Object[1];
			param[0]=productId;
		}
		/*
		 * QueryBuilder qBuilder=repositoryView.getQueryBuilder();
		 * QueryExpression
		 * expressionFirstName=qBuilder.createPropertyQueryExpression
		 * ("firstName"); QueryExpression
		 * valueFirstName=qBuilder.createConstantQueryExpression(userName);
		 * Query
		 * queryFirstName=qBuilder.createComparisonQuery(expressionFirstName,
		 * valueFirstName, QueryBuilder.EQUALS);
		 */
		
		
		repositoryItem = rqlStatement.executeQuery(repositoryView, param);
		// repositoryItem=repositoryView.executeQuery(queryFirstName);
		
		return repositoryItem;
	}
	/**
	 * Get All the Details of All Products
	 * 
	 * @param productId
	 * @return Array of Repository Items...1 Array is 1 record
	 * @throws RepositoryException
	 */
	public RepositoryItem[] getCategoryDetails()
	throws RepositoryException {
		repositoryView = getProductRepository().getView("category");
		Object[] param = null;
		RqlStatement rqlStatement =null;
			rqlStatement=RqlStatement.parseRqlStatement("ALL");
		/*
		 * QueryBuilder qBuilder=repositoryView.getQueryBuilder();
		 * QueryExpression
		 * expressionFirstName=qBuilder.createPropertyQueryExpression
		 * ("firstName"); QueryExpression
		 * valueFirstName=qBuilder.createConstantQueryExpression(userName);
		 * Query
		 * queryFirstName=qBuilder.createComparisonQuery(expressionFirstName,
		 * valueFirstName, QueryBuilder.EQUALS);
		 */
		
		repositoryItem = rqlStatement.executeQuery(repositoryView, param);
		// repositoryItem=repositoryView.executeQuery(queryFirstName);
		
		return repositoryItem;
	}

	@SuppressWarnings("static-access")
	public boolean addUser(User user) {
		boolean success = Boolean.FALSE;
		try {

			mutableRepository = getDmutableRepository();
			InitialContext ic = new InitialContext();
			TransactionManager tmgr = (TransactionManager) ic
					.lookup("dynamo:/atg/dynamo/transaction/TransactionManager");
			TransactionDemarcation td = new TransactionDemarcation();
			td.begin(tmgr, td.REQUIRED);
			MutableRepositoryItem item = mutableRepository.createItem(String
					.valueOf(user.getUserId()), "user_db");

			item.setPropertyValue("Password", user.getPassword());
			item.setPropertyValue("UserName", user.getUserName());
			item.setPropertyValue("Email", user.getEmail());
			item.setPropertyValue("Address", user.getAddress());
			item.setPropertyValue("DateOfBirth", user.getDateOfBirth());
			item.setPropertyValue("Gender", user.getSex());

			mutableRepository.addItem(item);
			td.end(false);
			success = Boolean.TRUE;

		} catch (Exception e) {
			e.printStackTrace();
			// throw e;
			System.out.println(e);
		}
		return success;

	}

	public boolean deleteUser(String userId) {
		@SuppressWarnings("unused")
		boolean flag = false;
		MutableRepository mutableRepository = getMutableRepository();
		MutableRepositoryItem mutableRepositoryItem = null;

		RepositoryItem repositoryItem;
		try {
			repositoryItem = mutableRepository.getItem(String.valueOf(userId),
					"user_db");
			if (null != repositoryItem) {
				System.out.println(repositoryItem);
				mutableRepository.removeItem(String.valueOf(userId), "user_db");
				mutableRepository.updateItem(mutableRepositoryItem);
			}

		} catch (RepositoryException e) {

			e.printStackTrace();
		}

		return true;
	}
	/**
	 * To Update the details of user
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("static-access")
	public  boolean updateUser(User user) {
		boolean success = Boolean.FALSE;
		try {

			mutableRepository = getDmutableRepository();
			InitialContext ic = new InitialContext();
			TransactionManager tmgr = (TransactionManager) ic
					.lookup("dynamo:/atg/dynamo/transaction/TransactionManager");
			TransactionDemarcation td = new TransactionDemarcation();
			td.begin(tmgr, td.REQUIRED);
			MutableRepositoryItem item = mutableRepository.createItem(String
					.valueOf(user.getUserId()), "user_db");

			item.setPropertyValue("Password", user.getPassword());
			item.setPropertyValue("UserName", user.getUserName());
			item.setPropertyValue("Email", user.getEmail());
			item.setPropertyValue("Address", user.getAddress());
			item.setPropertyValue("DateOfBirth", user.getDateOfBirth());
			item.setPropertyValue("Gender", user.getSex());

			mutableRepository.updateItem(item);
			td.end(false);
			success = Boolean.TRUE;

		} catch (Exception e) {
			e.printStackTrace();
			// throw e;
			System.out.println(e);
		}
		return success;
	}
	public static void main(String[] args) throws RepositoryException {
		User user=new User();
		user.setUserName("Tuhin");
		user.setUserId("318890");
		user.setSex("M");
		user.setPassword("XXXX");
		user.setEmail("na");
		user.setDateOfBirth("29-APR-90");
		user.setAddress("Bagnan");
		SearchDBManager searchDBManager=new SearchDBManager();
		searchDBManager.addUser(user);
		System.out.println(searchDBManager.getUserDetails("Tuhin"));
		
		/*user.setUserName("Tuhin Chandra");
		user.setUserId("318888");
		user.setSex("Male");
		user.setPassword("Password");
		user.setEmail("santuc1990@gmail.com");
		user.setDateOfBirth("29-APR-1990");
		user.setAddress("Bagnan N.D.Block");
		searchDBManager.updateUser(user);
		*/
	}
}
