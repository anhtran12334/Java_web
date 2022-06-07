/*
 * package com.java.shop15.components;
 * 
 * import java.math.BigDecimal; import java.util.Date;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.boot.context.event.ApplicationReadyEvent; import
 * org.springframework.context.ApplicationListener; import
 * org.springframework.stereotype.Component;
 * 
 * import com.java.shop15.entities.Categories; import
 * com.java.shop15.entities.Products; import
 * com.java.shop15.services.CategoryService;
 * 
 * @Component // bean public class ApplicationStartup implements
 * ApplicationListener<ApplicationReadyEvent> {
 * 
 * @Autowired // inject 1 bean vào trong 1 bean khác private CategoryService
 * categoryService;
 * 
 *//**
	 * khi ứng dụng chạy xong sẽ chạy vào hàm này.
	 *//*
		 * // @Override // public void onApplicationEvent(final ApplicationReadyEvent
		 * event) { // // Categories cateJava = new Categories(); //
		 * cateJava.setName("Java"); // cateJava.setDescription("Java"); //
		 * cateJava.setCreatedDate(new Date()); //
		 * categoryService.saveOrUpdate(cateJava); // // }
		 * 
		 * @Override public void onApplicationEvent(final ApplicationReadyEvent event) {
		 * this.seedCategoryJava(); }
		 * 
		 * private void seedCategoryJava() { // Tìm kiếm cate java có trong db hay không
		 * ? Categories cateJava = categoryService.
		 * getByTransactQuerySQL("select * from tbl_category where name = 'java'");
		 * 
		 * //nếu không có thì thêm mới if(cateJava == null) { cateJava = new
		 * Categories(); cateJava.setName("Java"); cateJava.setDescription("Java");
		 * cateJava.setCreatedDate(new Date());
		 * 
		 * 
		 * //thêm ds sản phẩm cho java for(int i = 0 ; i< 20; i++) { Products p = new
		 * Products(); p.setTitle("java Title" +i);
		 * p.setShortDescription("Java ShortDes" + i);
		 * p.setDetailDescription("javaDetail" + i); p.setPrice(new BigDecimal("1000"));
		 * p.setCreatedDate(new Date());
		 * 
		 * cateJava.addRelationProduct(p); }
		 * 
		 * //Ngược lại chỉnh sửa ngày }else { cateJava.setUpdatedDate(new Date()); }
		 * categoryService.saveOrUpdate(cateJava); } }
		 */