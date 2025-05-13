package utilities.API_Utilities;

import config_Requirements.ConfigLoader;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;

import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;

public class Authentication{

    static ConfigLoader configLoader = new ConfigLoader();
    public static String generateToken() {

        spec = new RequestSpecBuilder().setBaseUri(configLoader.getApiConfig("base_url")).build();

        spec.pathParams("pp1", "api", "pp2", "getToken");

        JSONObject reqBody  = new JSONObject();
        reqBody.put("email", configLoader.getApiConfig("providerEmail"));
        reqBody.put("password", configLoader.getApiConfig("providerPassword"));

        Response response = given()
                .spec(spec)
                .contentType(ContentType.JSON)
                .header("Accept", "application/json")
                .when()
                .body(reqBody.toString())
                .post("/{pp1}/{pp2}");


        JsonPath repJP = response.jsonPath();
        String token = repJP.getString("data.token");
        System.out.println("Token : " + token);

        return token;
    }
}
