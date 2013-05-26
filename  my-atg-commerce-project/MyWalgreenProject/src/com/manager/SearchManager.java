package com.manager;

import com.tool.SearchDBManager;

import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;

public class SearchManager {
	public RepositoryItem[] getDetails(String userName) throws RepositoryException{
		RepositoryItem[] repositoryItem= new SearchDBManager().getUserDetails(userName);
		return repositoryItem;
	}
}
