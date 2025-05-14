package utilities.API_Utilities;

import java.util.HashMap;

public class TestData{
    HashMap<String, Object> requestBody;

    public HashMap blogEditRequestBody() {

        requestBody = new HashMap<>();

        requestBody.put("title", "New Blog Updated");
        requestBody.put("summary", "Summary");
        requestBody.put("content", "Content");

        return requestBody;
    }


}
