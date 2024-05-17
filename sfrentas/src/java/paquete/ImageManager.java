package paquete;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class ImageManager {
    private static final String IMAGE_FOLDER = "sfrentas" + File.separator + "imagenes";

    public static String saveImage(InputStream inputStream, String fileName) throws IOException {
        String imagePath = IMAGE_FOLDER + File.separator + fileName;
        File directory = new File(IMAGE_FOLDER);

        if (!directory.exists()) {
            directory.mkdirs();
        }

        try (OutputStream outputStream = new FileOutputStream(imagePath)) {
            byte[] buffer = new byte[4096];
            int bytesRead;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }

        return imagePath;
    }

    public static void deleteImage(String imagePath) {
        File file = new File(imagePath);
        file.delete();
    }
}
