package config_Requirements;

import org.yaml.snakeyaml.Yaml;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

public class ConfigLoader {

    private Map<String, Object> config;

    // Yapıcı (Constructor) ile YAML dosyasını yükleme
    public ConfigLoader() {
        Yaml yaml = new Yaml();
        InputStream inputStream = null;

        try {
            inputStream = new FileInputStream(new File("src/test/resources/config/config.yaml"));
            config = yaml.load(inputStream);
        } catch (IOException e) {
            throw new RuntimeException("config.yaml dosyası okunamadı.", e);
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // Belirli bir kategori (api, database) ve anahtar (key) için yapılandırma değerini alır
    public String getConfigValue(String category, String key) {
        Map<String, Object> categoryMap = (Map<String, Object>) config.get(category);
        if (categoryMap != null) {
            return (String) categoryMap.get(key);
        } else {
            throw new RuntimeException(category + " kategorisi bulunamadı.");
        }
    }


    public String getApiConfig(String key) {
        return getConfigValue("api", key);
    }

    // Database yapılandırma değerlerini almak için metod
    public String getDatabaseConfig(String key) {
        return getConfigValue("database", key);
    }
}
