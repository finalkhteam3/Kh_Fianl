package kh.java.project.test.test;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;

import kh.java.project.config.security.CheckAuthService;
import kh.java.project.member.dto.request.MemberRequest;
import kh.java.project.test.ajax.controller.AjaxController;
import kh.java.project.test.ajax.dto.request.AjaxRequest;
import kh.java.project.test.ajax.dto.response.AjaxResponse;
import kh.java.project.test.ajax.service.AjaxService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class CkEditorController {
	private final AjaxService ajaxService;

	@GetMapping("/ck")
	public String smarteditor2() {
		return "ckeditor/ck";
	}

//	@PostMapping("/ck")
//    public String join(MemberRequest request) {
//        memberService.createMember(request);
//        return "redirect:/ckboard";
//    }

	// ????????? ?????????
	@RequestMapping(value = "/imageUpload.do", method = RequestMethod.POST)
	public String imageUpload(
//    		@RequestParam("file") MultipartFile file,
			@RequestParam("upload") MultipartFile file,
			MultipartHttpServletRequest multiFile
//    		,HttpServletRequest request
//    		,HttpServletResponse response
	) throws Exception {
//		???
		String result = null;
		if (file != null) {
			if (file.getSize() > 0 && !file.getName().trim().equals("")) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					String url = ajaxService.getCkEditorResult(file);
					log.info("url => {}", url);
					Map<String, String> map = new HashMap<String, String>();
					map.put("uploaded", "1");
					map.put("fileName", file.getOriginalFilename());
					map.put("url", url);
					result = new Gson().toJson(map);
				}
			}
		}

		return result;
		// ?????? ?????? ??????
//    	UUID uid = UUID.randomUUID();

//    	OutputStream out = null;
//    	PrintWriter printWriter = null;

		// ?????????
//    	response.setCharacterEncoding("utf-8");
//    	response.setContentType("text/html;charset=utf-8");
//    	try{
//    		//?????? ?????? ????????????
//    		String fileName = upload.getOriginalFilename();
//    		byte[] bytes = upload.getBytes();
//    		
//    		//????????? ?????? ??????
//    		String path = "C:\\z_workspace" + "ckImage/";	// ????????? ?????? ??????(?????? ?????? ??????)
//    		String ckUploadPath = path + uid + "_" + fileName;
//    		File folder = new File(path);
//    		System.out.println("path:"+path);	// ????????? ???????????? console??? ??????
//    		//?????? ???????????? ??????
//    		if(!folder.exists()){
//    			try{
//    				folder.mkdirs(); // ?????? ??????
//    		}catch(Exception e){
//    			e.getStackTrace();
//    		}
//    	}
//    	
//    	out = new FileOutputStream(new File(ckUploadPath));
//    	out.write(bytes);
//    	out.flush(); // outputStram??? ????????? ???????????? ???????????? ?????????
//    	
//    	String callback = request.getParameter("CKEditorFuncNum");
//    	printWriter = response.getWriter();
//    	String fileUrl = "/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // ????????????
//    	
//    	// ???????????? ????????? ??????
//    	printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
//    	printWriter.flush();
//    	
//    	}catch(IOException e){
//    		e.printStackTrace();
//    	} finally {
//    		try {
//    		if(out != null) { out.close(); }
//    		if(printWriter != null) { printWriter.close(); }
//    	} catch(IOException e) { e.printStackTrace(); }
//    	}
//    	
//    	if(upload != null) {
//    		
//    	}

//    	return;
	}

	// ????????? ????????? ????????? ????????????
	@RequestMapping(value = "/ckImgSubmit.do")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// ????????? ????????? ????????? ??????
		String path = "C:\\z_workspace" + "ckImage/"; // ????????? ????????? ??????
		System.out.println("path:" + path);
		String sDirPath = path + uid + "_" + fileName;

		File imgFile = new File(sDirPath);

		// ?????? ????????? ?????? ????????? ?????? ??????????????? ??? ????????? ????????? ????????????.
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();

				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}

				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();

			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				outputStream.close();
				fileInputStream.close();
				out.close();
			}
		}
	}

	@ExceptionHandler(RuntimeException.class)
	public String handleUserException(RuntimeException e, Model model) {
		log.info("handleUserException {}", e.getMessage());
		model.addAttribute("msg", e.getMessage());
		return "error/403";
	}
}
