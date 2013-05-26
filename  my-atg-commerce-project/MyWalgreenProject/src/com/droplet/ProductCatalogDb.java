package com.droplet;

import java.util.HashMap;
import java.util.List;

import atg.nucleus.GenericService;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryView;
import atg.repository.rql.RqlStatement;

public class ProductCatalogDb extends GenericService {
	public Repository getRepository() {
		return repository;
	}

	public void setRepository(Repository repository) {
		this.repository = repository;
	}

	public Repository repository;
	RepositoryItem[] repItem;
	HashMap<Integer, String> hMap = new HashMap<Integer, String>();

	public HashMap<Integer, String> catDetails() throws RepositoryException {
		repItem = null;
		RepositoryView repView = this.getRepository().getView("category");
		RqlStatement stmt = RqlStatement.parseRqlStatement("ALL");
		repItem = stmt.executeQuery(repView, null);
		String catId = null;
		hMap.clear();
		int i = 0;
		for (RepositoryItem re : repItem) {
			RepositoryItem list = (RepositoryItem) re
					.getPropertyValue("parentCategory");
			if (list == null) {
				if (hMap.containsValue(re.getRepositoryId())) {
				} else {
					catId = re.getRepositoryId();
					hMap.put(i, catId);
					i++;
				}
			}
			if (list != null) {
				Z: do {
					if (list.getPropertyValue("parentCategory") == null) {
						break Z;
					}
					list = (RepositoryItem) list
							.getPropertyValue("parentCategory");
				} while (!(list == null));
			}
			if (list != null) {
				if (hMap.containsValue(list.getRepositoryId())) {
				} else {
					catId = list.getRepositoryId();
					hMap.put(i, catId);
					i++;
				}
			}
		}
		return hMap;
	}

	@SuppressWarnings("unchecked")
	public List<RepositoryItem> prodDetails(String string)
			throws RepositoryException {
		repItem = null;
		List<RepositoryItem> list = null;
		Object[] param = { string };
		RepositoryView repView = this.getRepository().getView("category");
		RqlStatement stmt = RqlStatement.parseRqlStatement("id=?0");
		repItem = stmt.executeQuery(repView, param);
		for (RepositoryItem re : repItem) {
			list = (List<RepositoryItem>) re
					.getPropertyValue("fixedChildProducts");
		}
		return list;
	}

	public HashMap<Integer, String> catChildDetails(String string)
			throws RepositoryException {
		repItem = null;
		Object[] param = { string };
		RepositoryView repView = this.getRepository().getView("category");
		RqlStatement stmt = RqlStatement.parseRqlStatement("parentCategory=?0");
		repItem = stmt.executeQuery(repView, param);
		hMap.clear();
		String catId = null;
		int i = 0;
		for (RepositoryItem re : repItem) {
			catId = re.getRepositoryId();
			hMap.put(i, catId);
			i++;
		}

		return hMap;

	}

	@SuppressWarnings("unchecked")
	public HashMap<Integer, String> catMoreDetails(String home)
			throws RepositoryException {
		repItem = null;
		RepositoryView repView = this.getRepository().getView("category");
		RqlStatement stmt = RqlStatement.parseRqlStatement("id=?0");
		Object[] param = { home };
		repItem = stmt.executeQuery(repView, param);
		String catId = null;
		hMap.clear();
		int i = 0;
		for (RepositoryItem re : repItem) {
			List<RepositoryItem> list = (List<RepositoryItem>) re
					.getPropertyValue("fixedChildCategories");
			for (RepositoryItem r : list) {
				if (hMap.containsValue(r.getRepositoryId())) {
				} else {
					catId = r.getRepositoryId();
					hMap.put(i, catId);
					i++;
				}
			}

		}
		return hMap;
	}
}
