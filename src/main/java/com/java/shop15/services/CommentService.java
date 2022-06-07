package com.java.shop15.services;


import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.java.shop15.dto.SaleOrderComment;
import com.java.shop15.dto.SaleOrderProductSearch;
import com.java.shop15.entities.Comment;
import com.java.shop15.entities.SaleOderProducts;

@Service
public class CommentService extends BaseService<Comment>{

	@Override
	protected Class<Comment> clazz() {
		// TODO Auto-generated method stub
		return Comment.class;
	}
	public PagerData<Comment> search(SaleOrderComment searchModel) {
		// khoi tao cau lenh
		String sql = "SELECT * FROM tbl_comment s WHERE 1=1";
		
		if (searchModel != null) { // tim kiem theo categories
			if(searchModel.saleOrderId != null) {
				sql += " and s.saleorder_id = " + searchModel.saleOrderId;
				
			}
			// tim kiem san pham theo seachText
			/*
			 * if (!StringUtils.isEmpty(searchModel.keyword)) { sql +=
			 * " and (s.product_id like '%" + searchModel.keyword + "%')" ; }
			 */
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

	@Transactional
	public Comment add(Comment c, MultipartFile imageComment)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(imageComment)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = UPLOAD_FOLDER_ROOT + "comment/image/" + imageComment.getOriginalFilename();

			// lưu avatar vào đường dẫn trên
			imageComment.transferTo(new File(pathToFile));

			c.setPicture("comment/image/" + imageComment.getOriginalFilename());
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
	public Comment update(Comment c, MultipartFile imageComment) throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Comment categoryInDb = super.getById(c.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(imageComment)) {
			// xóa avatar trong folder lên
			new File(UPLOAD_FOLDER_ROOT + categoryInDb.getPicture()).delete();

			// add avartar moi
			imageComment.transferTo(new File(UPLOAD_FOLDER_ROOT + "comment/image/" + imageComment.getOriginalFilename()));
			c.setPicture("comment/image/" + imageComment.getOriginalFilename());
		} else {
			// su dung lai avatar cu
			c.setPicture(categoryInDb.getPicture());
		}
		// lưu vào database
		return super.saveOrUpdate(c);

	}
}
