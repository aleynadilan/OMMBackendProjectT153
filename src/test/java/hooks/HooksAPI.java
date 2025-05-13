package hooks;

import config_Requirements.ConfigLoader;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.specification.RequestSpecification;
import utilities.API_Utilities.Authentication;

public class HooksAPI {
    public static RequestSpecification spec;
    static ConfigLoader configLoader = new ConfigLoader();

    public static void setUpApi(String userType) {
        String token;
        if (userType.equals("provider")) {
            token = Authentication.generateToken();
        } else {
            token = configLoader.getApiConfig("invalidApiKey");
        }

        spec = new RequestSpecBuilder()
                .setBaseUri(configLoader.getApiConfig("base_url"))
                .addHeader("Accept", "application/json")
                .addHeader("token", token)
                .build();
    }
}

