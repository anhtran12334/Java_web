package com.java.shop15.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.java.shop15.dto.CategorySearch;

import com.java.shop15.entities.Categories;
import com.java.shop15.entities.Products;
import com.java.shop15.entities.ProductsImage;

@Service
public class CategoryService extends BaseService<Categories>{

	@Override
	protected Class<Categories> clazz() {
		// TODO Auto-generated method stub
		return Categories.class;
	}
	public PagerData<Categories> search(CategorySearch categoryModel){
		// khoi tao cau lenh
		String sql = "SELECT * FROM tbl_category c WHERE 1=1";
		
		if(categoryModel != null) {
			//tim kiem theo categories
			if(categoryModel.categoryId != null) {
				sql += " and category_id = " + categoryModel.categoryId;
				
			}
			if(!StringUtils.isEmpty(categoryModel.seo)) {
				sql += " and c.seo = '" + categoryModel.seo + "'";
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(categoryModel.keyword)) {
				sql += " and (c.name like '%" + categoryModel.keyword + "%'" + " or c.description like '%"
						+ categoryModel.keyword + "%' )";
			}
		}
		return runTransactQuerySQL(sql, categoryModel == null ? 0 : categoryModel.page,5);
		
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	/**
	 * Dùng để thêm mới sản phẩm
	 * 
	 * @param p
	 * @param productAvatar
	 * @param productPictures
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@Transactional
	public Categories add(Categories c, MultipartFile categoryAvatar)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(categoryAvatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = UPLOAD_FOLDER_ROOT + "category/avatar/" + categoryAvatar.getOriginalFilename();

			// lưu avatar vào đường dẫn trên
			categoryAvatar.transferTo(new File(pathToFile));

			c.setAvatar("category/avatar/" + categoryAvatar.getOriginalFilename());
		}

		// lưu vào database
		return super.saveOrUpdate(c);
	}

	/**
	 * Cập nhật sản phẩm
	 * 
	 * @param p
	 * @param productAvatar
	 * @param productPictures
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@Transactional
	public Categories update(Categories c, MultipartFile categoryAvatar) throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Categories categoryInDb = super.getById(c.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(categoryAvatar)) {
			// xóa avatar trong folder lên
			new File(UPLOAD_FOLDER_ROOT + categoryInDb.getAvatar()).delete();

			// add avartar moi
			categoryAvatar.transferTo(new File(UPLOAD_FOLDER_ROOT + "category/avatar/" + categoryAvatar.getOriginalFilename()));
			c.setAvatar("category/avatar/" + categoryAvatar.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			c.setAvatar(categoryInDb.getAvatar());
		}
		// lưu vào database
		return super.saveOrUpdate(c);

	}
}
