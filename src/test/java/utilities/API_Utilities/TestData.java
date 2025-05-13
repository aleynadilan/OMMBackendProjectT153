package utilities.API_Utilities;

import java.util.HashMap;

public class TestData{
    HashMap<String, Object> requestBody;

    public HashMap BlogEditRequestBody() {

        requestBody = new HashMap<>();

        requestBody.put("title", "New Blog Updated");
        requestBody.put("summary", "Summary");
        requestBody.put("content", "Content");

        return requestBody;
    }


}
