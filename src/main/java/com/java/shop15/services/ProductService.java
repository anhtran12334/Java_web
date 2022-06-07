package com.java.shop15.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.java.shop15.Constants;
import com.java.shop15.components.Utilities;
import com.java.shop15.dto.ProductSearch;
import com.java.shop15.entities.Products;
import com.java.shop15.entities.ProductsImage;

@Service // là 1 bean<service>
public class ProductService extends BaseService<Products> {

	@Autowired
	private ProductsImageService productImagesService;
	
	@Override
	protected Class<Products> clazz() {
		return Products.class;
	}
	
	public PagerData<Products> search(ProductSearch searchModel){
		// khoi tao cau lenh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";
		
		if(searchModel != null) {
			//tim kiem theo categories
			if(searchModel.categoryId != null) {
				sql += " and category_id = " + searchModel.categoryId;
				
			}
			if(!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo = '" + searchModel.seo + "'";
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.title like '%" + searchModel.keyword + "%'" + " or p.detail_description like '%"
						+ searchModel.keyword + "%'" + " or p.short_description like '%"
						+ searchModel.keyword + "%')";
			}
		}
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page,5);
		
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
	public Products add(Products p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = UPLOAD_FOLDER_ROOT + "product/avatar/" + productAvatar.getOriginalFilename();

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToFile));

			p.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) {

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/pictures/" + pic.getOriginalFilename()));

				// tạo mới 1 bản ghi product_images
				ProductsImage pi = new ProductsImage();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addRelationProduct(pi);
			}
		}
		p.setSeo(Utilities.slugify(p.getTitle()));
		// lưu vào database
		return super.saveOrUpdate(p);
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
	public Products update(Products p, MultipartFile productAvatar, MultipartFile[] productPictures) throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Products productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File(UPLOAD_FOLDER_ROOT + productInDb.getAvatar()).delete();

			// add avartar moi
			productAvatar
					.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/avatar/" + productAvatar.getOriginalFilename()));
			p.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			p.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImage() != null && productInDb.getProductImage().size() > 0) {
				for (ProductsImage opi : productInDb.getProductImage()) {
					// xóa avatar trong folder lên
					new File(UPLOAD_FOLDER_ROOT + opi.getPath()).delete();

					productImagesService.delete(opi);
				}
			}

			// thêm pictures mới
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/pictures/" + pic.getOriginalFilename()));

				ProductsImage pi = new ProductsImage();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addRelationProduct(pi);
			}
			
		}
		p.setSeo(Utilities.slugify(p.getTitle()));
		// lưu vào database
		return super.saveOrUpdate(p);

	}
}
