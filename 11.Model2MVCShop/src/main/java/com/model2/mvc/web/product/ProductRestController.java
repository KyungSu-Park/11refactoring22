package com.model2.mvc.web.product;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {

@Autowired
@Qualifier("productServiceImpl")
	ProductService productService;

@Value("#{commonProperties['pageSize'] ?: 10}")
int pageSize;

@Value("#{commonProperties['pageUnit'] ?: 10}")
int pageUnit;	

	public ProductRestController() {
		// TODO Auto-generated constructor stub
		
		System.out.println(":: ProductRestController default Constructor");
		
	}
	
	@RequestMapping(value = "/json/addProduct/{value}", method = RequestMethod.POST)
	public Product addProduct(@RequestBody Product product, @PathVariable MultipartFile[] file) throws Exception {
		
		System.out.println("/product/json/addProduct : POST");
		
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		
		StringBuilder sb = new StringBuilder();
		
		int fileCount = 0;
		// �ִ� 3�� ���� �Է� ����
		for(MultipartFile files : file) {
			fileCount++;
			System.out.println("���� �̸� : " + files.getOriginalFilename());
			sb.append(files.getOriginalFilename());
			
			if(fileCount != file.length) {
				sb.append("*");
			}
			String path = "C:\\Users\\903-16\\git\\repository4\\10.Model2MVCShop(AjaxKS2)\\src\\main\\webapp\\images\\uploadFiles\\";
			
			File saveFile = new File(path + files.getOriginalFilename());
			
			files.transferTo(saveFile);
		}
		
		System.out.println("DB�� ����� ���� �̸� : " + sb.toString());
		
		product.setFileName(sb.toString());
		productService.addProduct(product);
		
		return product;
		
	}
	
	@RequestMapping(value = "/json/listProduct")
	public Map<String, Object> listProduct(@RequestBody Search search) throws Exception {
		
		System.out.println("/product/json/listProduct : GET & POST");
		

		search.setPageSize(pageSize);
		
		
		return productService.getProductList(search);

	}
	
	@RequestMapping(value = "/json/getProduct/{prodNo}")
	public Product getProduct(@PathVariable("prodNo") int prodNo) throws Exception {
		
		System.out.println("/product/json/getProduct : GET & POST");
		
		System.out.println("/product/json/getProduct : GET & POST");
		
		return productService.getProduct(prodNo);
		
	}
	
	@RequestMapping(value = "/json/updateProduct/{prodNo}", method = RequestMethod.GET)
	public Product updateProduct(@PathVariable int prodNo) throws Exception {
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value = "/json/updateProduct/{value}", method = RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product, @PathVariable MultipartFile[] file) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Product> list = new ArrayList<Product>();
		
		StringBuilder sb = new StringBuilder();

		int fileCount = 0;
		
		for(MultipartFile files : file) {
			fileCount++;
			System.out.println("���� �̸� : " + files.getOriginalFilename());
			sb.append(files.getOriginalFilename());
			
			if(fileCount != file.length) {
				sb.append("*");
			}
			

			String path = "C:\\Users\\903-16\\git\\repository4\\10.Model2MVCShop(AjaxKS2)\\src\\main\\webapp\\images\\uploadFiles\\";
			File saveFile = new File(path + files.getOriginalFilename());
			
			files.transferTo(saveFile);
		}
		sb.append("*" + product.getFileName());
		product.setFileName(sb.toString());
		
		list.add(product);
		
		map.put("product", list);
		productService.updateProduct(map);
		
		System.out.println("������Ʈ ���� product " + product);
		
		product = productService.getProduct(product.getProdNo());
				
		return product;
	}
}