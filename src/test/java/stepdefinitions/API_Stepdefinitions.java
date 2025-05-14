package stepdefinitions;

import config_Requirements.ConfigLoader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;
import org.junit.Assert;
import pojos.AddBlogPojo;
import utilities.API_Utilities.API_Methods;
import utilities.API_Utilities.TestData;

import java.util.HashMap;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.*;

public class API_Stepdefinitions {
    Response response;
    JsonPath jsonPath;
    String exceptionMesaj;
    ConfigLoader configLoader = new ConfigLoader();
    JSONObject jsonObjectRequest = new JSONObject();
    HashMap<String, Object> hashMapRequest = new HashMap<>();
    TestData testData = new TestData();
    AddBlogPojo addBlogPojoRequest;

    @Given("The api user constructs the base url with the {string} token.")
    public void the_api_user_constructs_the_base_url_with_the_token(String userType) {
        HooksAPI.setUpApi(userType);
    }

    @Given("The api user sets {string} path parameters.")
    public void the_api_user_sets_path_parameters(String pathParam) {
        API_Methods.pathParam(pathParam);
    }

    @Given("The api user sends a GET request and saves the returned response.")
    public void the_api_user_sends_a_get_request_and_saves_the_returned_response() {
        response = given()
                .spec(HooksAPI.spec)
                .when()
                .get(API_Methods.fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the status code is {int}.")
    public void the_api_user_verifies_that_the_status_code_is(int code) {
        response.then()
                .assertThat()
                .statusCode(code);
    }

    @Given("The api user verifies that the {string} information in the response body is {string}.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is(String key, String value) {
        response.then()
                .assertThat()
                .body(key, equalTo(value));
    }

    @Given("The api user verifies the information in the response body for the entry with the specified {int} index, including {string}, {string}, {string}, {string} and {string}.")
    public void the_api_user_verifies_the_information_in_the_response_body_for_the_entry_with_the_specified_index_including_and(int dataIndex, String lang_id, String title, String slug, String tags, String summary) {
        jsonPath = response.jsonPath();
        Assert.assertEquals(lang_id, jsonPath.getString("data.blogs[" + dataIndex + "].lang_id"));
        Assert.assertEquals(title, jsonPath.getString("data.blogs[" + dataIndex + "].title"));
        Assert.assertTrue(jsonPath.getString("data.blogs[" + dataIndex + "].slug").contains(slug));
        Assert.assertEquals(tags, jsonPath.getString("data.blogs[" + dataIndex + "].tags"));
        Assert.assertTrue(jsonPath.getString("data.blogs[" + dataIndex + "].summary").contains(summary));
        // Assert.assertNull(jsonPath.getString("data.blogs[" + dataIndex + "].updatedAt"));
    }

    @Given("The api user sends a GET request, saves the returned response, and verifies that the status code is {string} with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_get_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String string) {
        try {
            response = given()
                    .spec(HooksAPI.spec)
                    .when()
                    .get(API_Methods.fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user validates the {string}, {string}, {string}, {string}, {string} and {string} contents of the data in the response body.")
    public void the_api_user_validates_the_and_contents_of_the_data_in_the_response_body(String id, String lang_id, String title, String slug, String tags, String summary) {
        response.then()
                .assertThat()
                .body("data[0].id", equalTo(id),
                        "data[0].lang_id", equalTo(lang_id),
                        "data[0].title", containsString(title),
                        "data[0].slug", containsString(slug),
                        "data[0].tags", equalTo(tags),
                        "data[0].summary", containsString(summary));
    }

    @Given("The api user prepares a post request body to send to the api addBlog endpoint")
    public void the_api_user_prepares_a_post_request_body_to_send_to_the_api_add_blog_endpoint() {

        /*
        {
"title" : "New Blog",
"category_id" :1,
"summary":"Blog Summary.",
"content":"Blog Content"
}
         */

        jsonObjectRequest.put("title", "New Blog");
        jsonObjectRequest.put("category_id", 1);
        jsonObjectRequest.put("summary", "Blog Summary.");
        jsonObjectRequest.put("content", "Blog Content");
        System.out.println("Post Body : " + jsonObjectRequest);

        addBlogPojoRequest = new AddBlogPojo("New Blog",1,"Summary","content");
    }

    @Given("The api user sends a POST request and saves the returned response.")
    public void the_api_user_sends_a_post_request_and_saves_the_returned_response() {
        response = given()
                .spec(HooksAPI.spec)
                .contentType(ContentType.JSON)
                .when()
                .body(addBlogPojoRequest)
                .post(API_Methods.fullPath);

        response.prettyPrint();
    }

    @Given("The api user prepares a post request body containing missing data to send to the api addBlog endpoint.")
    public void the_api_user_prepares_a_post_request_body_containing_missing_data_to_send_to_the_api_add_blog_endpoint() {
        /*
        {
"title" : "New Blog",
"category_id" :1,
"summary":"Blog Summary."
}
         */

        hashMapRequest.put("title", "New Blog");
        hashMapRequest.put("category_id", 1);
        hashMapRequest.put("summary", "Blog Summary.");
        System.out.println("Post Body : " + hashMapRequest);
    }

    @Given("The api user prepares a post request without any data to send to the api addBlog endpoint.")
    public void the_api_user_prepares_a_post_request_without_any_data_to_send_to_the_api_add_blog_endpoint() {
    }

    @Given("The api user prepares a patch request body to send to the api editBlog endpoint")
    public void the_api_user_prepares_a_patch_request_body_to_send_to_the_api_edit_blog_endpoint() {
        hashMapRequest = testData.blogEditRequestBody();
        System.out.println("Patch Body : " + hashMapRequest);
    }

    @Given("The api user sends a PATCH request and saves the returned response.")
    public void the_api_user_sends_a_patch_request_and_saves_the_returned_response() {
        response = given()
                .spec(HooksAPI.spec)
                .contentType(ContentType.JSON)
                .when()
                .body(hashMapRequest)
                .patch(API_Methods.fullPath);

        response.prettyPrint();
    }

    @Given("The api user verifies that the {string} information in the response body is the same as the id path parameter in the endpoint.")
    public void the_api_user_verifies_that_the_information_in_the_response_body_is_the_same_as_the_id_path_parameter_in_the_endpoint(String key) {
        jsonPath = response.jsonPath();
        int dataKey = Integer.parseInt(jsonPath.getString(key));
        Assert.assertEquals(dataKey, API_Methods.id);
    }

    @Given("The api user sends a PATCH request, saves the returned response, and verifies that the status code is {string} with the reason phrase Unauthorized.")
    public void the_api_user_sends_a_patch_request_saves_the_returned_response_and_verifies_that_the_status_code_is_with_the_reason_phrase_unauthorized(String string) {
        try {
            response = given()
                    .spec(HooksAPI.spec)
                    .contentType(ContentType.JSON)
                    .when()
                    .body(hashMapRequest)
                    .patch(API_Methods.fullPath);
        } catch (Exception e) {
            exceptionMesaj = e.getMessage();
        }
        System.out.println("exceptionMesaj : " + exceptionMesaj);
        Assert.assertEquals(configLoader.getApiConfig("unauthorizedExceptionMessage"), exceptionMesaj);
    }

    @Given("The api user verifies that the content information is {string}")
    public void the_api_user_verifies_that_the_content_information_is(String content) {
        response.then()
                .assertThat()
                .body("data[0].content",equalTo(content));
    }
    @Given("The api user sends a DELETE request and saves the returned response.")
    public void the_api_user_sends_a_delete_request_and_saves_the_returned_response() {
        response = given()
                .spec(HooksAPI.spec)
                .when()
                .delete(API_Methods.fullPath);
        response.prettyPrint();
    }

}