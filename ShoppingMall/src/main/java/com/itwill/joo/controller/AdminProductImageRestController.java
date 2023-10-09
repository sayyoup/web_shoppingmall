package com.itwill.joo.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.*;
import org.springframework.util.StringUtils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/api/AdminProductImage")
public class AdminProductImageRestController {

	@PostMapping("/ProductTitleImage")
	public void productTitleImageProcess(@RequestPart("ptitle_image") MultipartFile title_image, @RequestParam("pname") String pname) {
		// 파일이 빈값일 경우 = 기존에 있던 파일이 지워진것 전에 파일 삭제해야한다.
		if (title_image.isEmpty()) {
			// 상품이름의 폴더가 있으면 폴더를 삭제한다.
			String delFolderName = "C:/jooImage/products/"+pname+"/";
			File delFolder = new File(delFolderName);
			if(delFolder.exists()) {
				delFolder.delete();
			}
            return ;
        }
		
		log.info("이미지 name = {}",title_image.getName());
		log.info("상품 name = {}",pname);
		
	  //상품이름 가져오기 우선 
		try {
		  
		  // 저장 경로 설정 (절대경로로 설정, (실제 서비스에서도 메인 컴퓨터하나만 있기에))
		  String Route = "C:/jooImage/products/";
		  // 폴더 이름 설정 = 제품이름
		  String folderMainname = Route + pname + "/";
		  // 상위폴더
		  String folderTitlename = folderMainname + "Title_Image/"; // 안에 타이틀 폴더
		  
		  // 폴더만들기(최상위 폴더)
		  File folderMain = new File(folderMainname);
		  // 상위파일이 존재하지 않는다면, 생성
		  if(!folderMain.exists()) {
			  folderMain.mkdirs();
		  }
		  
		  // 타이틀 이미지 넣을 폴더 덮어쓰기
		  File folderTitle = new
		  File(folderTitlename); 
		  folderTitle.mkdirs();
		  
		  log.info("타이틀 이미지 폴더 이름= {}", folderTitle);
		  
		  // 이미지를 해당 폴더안에 저장
		  String originalFilename = StringUtils.cleanPath(title_image.getName()+".jpg");
		  Path filePath = Path.of(folderTitlename, originalFilename);
		  Files.copy(title_image.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
		  
		  log.info("파일저장 성공");
		  
		 }catch (Exception e) {
			 e.printStackTrace(); 
		 }
		 
		
	}
	
	@PostMapping("/ProductDetailImage")
	public void productDetailImageProcess(@RequestPart("pdetail_image") MultipartFile detail_image, @RequestParam("pname") String pname) {
		// 파일이 빈값일 경우 = 기존에 있던 파일이 지워진것 전에 파일 삭제해야한다.
		if (detail_image.isEmpty()) {
			// 상품이름의 폴더가 있으면 폴더를 삭제한다.
			String delFolderName = "C:/jooImage/products/"+pname+"/";
			File delFolder = new File(delFolderName);
			if(delFolder.exists()) {
				delFolder.delete();
			}
            return ;
        }
		
		log.info("이미지 name = {}",detail_image.getName());
		log.info("상품 name = {}",pname);
		
	  //상품이름 가져오기 우선 
		try {
		  
		  // 저장 경로 설정 (절대경로로 설정, (실제 서비스에서도 메인 컴퓨터하나만 있기에))
		  String Route = "C:/jooImage/products/";
		  // 폴더 이름 설정 = 제품이름
		  String folderMainname = Route + pname + "/";
		  // 상위폴더
		  String folderDetailname = folderMainname + "Detail_Image/"; // 안에 타이틀 폴더
		  
		  // 폴더만들기(최상위 폴더)
		  File folderMain = new File(folderMainname);
		  // 상위파일이 존재하지 않는다면, 생성
		  if(!folderMain.exists()) {
			  folderMain.mkdirs();
		  }
		  
		  // 타이틀 이미지 넣을 폴더 덮어쓰기
		  File folderTitle = new
		  File(folderDetailname); 
		  folderTitle.mkdirs();
		  
		  log.info("타이틀 이미지 폴더 이름= {}", folderTitle);
		  
		  // 이미지를 해당 폴더안에 저장
		  String originalFilename = StringUtils.cleanPath(detail_image.getName()+".jpg");
		  Path filePath = Path.of(folderDetailname, originalFilename);
		  Files.copy(detail_image.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
		  
		  log.info("파일저장 성공");
		  
		 }catch (Exception e) {
			 e.printStackTrace(); 
		 }
	}
	@PostMapping("/ProductTitleImageDelete")
	public void ProductTitleImageDelete(@RequestParam("pname") String pname) {
		log.info("상품 타이틀 폴더 지우기");
		// 파일이 빈값일 경우 = 기존에 있던 파일이 지워진것 전에 파일 삭제해야한다.
		// 상품이름의 폴더가 있으면 폴더를 삭제한다.
		String delFolderName = "C:/jooImage/products/"+pname+"/Title_Image";
		String delFileName = "C:/jooImage/products/"+pname+"/Title_Image/ptitle_image.jpg";
		File delFolder = new File(delFolderName);
		File delFile = new File(delFileName);
		if(delFolder.exists()) {
			log.info("지움");
			delFile.delete();
		}
	}
	
	@PostMapping("/ProductDetailImageDelete")
	public void ProductDetailImageDelete(@RequestParam("pname") String pname) {
		log.info("상품 디테일 폴더 지우기");
		// 파일이 빈값일 경우 = 기존에 있던 파일이 지워진것 전에 파일 삭제해야한다.
		// 상품이름의 폴더가 있으면 폴더를 삭제한다.
		String delFolderName = "C:/jooImage/products/"+pname+"/Detail_Image";
		String delFileName = "C:/jooImage/products/"+pname+"/Detail_Image/pdetail_image.jpg";
		File delFolder = new File(delFolderName);
		File delFile = new File(delFileName);
		if(delFolder.exists()) {
			log.info("지움");
			delFile.delete();
		}
	}
}
