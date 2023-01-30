package kh.java.project.config.firestore;

import com.google.cloud.storage.Blob;
import com.google.cloud.storage.Bucket;
import com.google.firebase.cloud.StorageClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@Service
@PropertySource({"classpath:properties/firestore.properties"})
public class FireBaseService {

    @Value("${fs.bucketName}")
    private String bucketName;
    public String uploadFiles(MultipartFile file) throws IOException{
//        String bucketName = new FireStoreParam().getFsBucket();
        String fileName = file.getOriginalFilename();
        String downloadUrl = "https://firebasestorage.googleapis.com/v0/b/kh-fi3.appspot.com/o/";
        assert fileName != null;
        fileName = UUID.randomUUID().toString().concat("_").concat(fileName);
        Bucket bucket = StorageClient.getInstance().bucket(bucketName);
        InputStream content = new ByteArrayInputStream(file.getBytes());
        Blob blob = bucket.create(fileName, content, file.getContentType());
        downloadUrl = downloadUrl.concat(blob.getName()).concat("?alt=media");
        return downloadUrl;
    }

}
