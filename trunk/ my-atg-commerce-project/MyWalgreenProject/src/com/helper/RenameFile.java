package com.helper;

import java.io.File;

public class RenameFile {
	public void renameFile() {
		String path = "C:\\ATG_Practice\\ATG\\ATG9.0\\MyWalgreenProject\\j2ee-apps\\MyWalgreenProject\\MyWalgreenProject.war\\product_images";
		File dir = new File(path);

		String[] children = dir.list();
		if (children == null) {
			// Either dir does not exist or is not a directory
		} else {
			for (int i = 0; i < children.length; i++) {
				// Get filename of file or directory
				if (children[i].startsWith("_")) {
					// System.out.println(children[i]);
					String fileName = children[i];
					File file = new File(path + "/" + fileName);
					fileName=fileName.substring(1, fileName.length());
					File newFile = new File(path+"/"+fileName);
//					// Rename
					if (file.renameTo(newFile)) {
					} else {
						System.out.println("Error renmaing file:"+fileName);
					}
				}
			}
		}

	}

	public static void main(String[] args) {
		new RenameFile().renameFile();
	}
}
