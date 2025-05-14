Feature: As a provider, I want to be able to update the information of the blog with the specified id number
  via API connection.

  Scenario: Verify that a PATCH request to /api/editBlog/{id} with valid authorization and correct data returns status code
  200, response_message “Blog  Updated successfully”, and that updated_blog_id in the response matches the path parameter id.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlog/91" path parameters.
    # Api kullanicisi "api/editBlog" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlog endpoint
    # Api kullanicisi api editBlog endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog  Updated successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog  Updated successfully" oldugunu dogrular
    * The api user verifies that the "data.updated_blog_id" information in the response body is the same as the id path parameter in the endpoint.
    # Api kullanıcısı response body icindeki "updated_blog_id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular.


  Scenario: Verify that a PATCH request to /api/editBlog/{id} with valid authorization but no data returns status code
  203 and response_message “No data for updated.”

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlog/83" path parameters.
    # Api kullanicisi "api/editBlog" path parametrelerini olusturur
    * The api user prepares a patch request that does not contain any data to send to the api editBlog endpoint.
    # Api kullanicisi api editBlog endpointine gondermek için data içermeyen bir patch request hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No data for updated.".
    # Api kullanicisi response bodydeki response_message bilgisinin "No data for updated." oldugunu dogrular


  Scenario: Verify that a PATCH request to /api/editBlog/{id} with valid authorization and correct data but missing
  id returns status code 203 and response_message “Id missing”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlog" path parameters.
    # Api kullanicisi "api/editBlog" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlog endpoint
    # Api kullanicisi api editBlog endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Id missing" oldugunu dogrular


  Scenario: Verify that a PATCH request to /api/editBlog/{id} with valid authorization and correct data but
  a non-existent id returns status code 203 and response_message “No Results found for the given ID”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/editBlog/8659" path parameters.
    # Api kullanicisi "api/editBlog" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlog endpoint
    # Api kullanicisi api editBlog endpointine gondermek icin bir patch request body hazirlar
    * The api user sends a PATCH request and saves the returned response.
    # Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No Results found for the given ID".
    # Api kullanicisi response bodydeki response_message bilgisinin "No Results found for the given ID" oldugunu dogrular


  Scenario: Verify that a PATCH request to /api/editBlog/{id} with an invalid API key, correct id, and valid data
  returns status code 401 and response_message “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/editBlog/91" path parameters.
    # Api kullanicisi "api/editBlog" path parametrelerini olusturur
    * The api user prepares a patch request body to send to the api editBlog endpoint
    # Api kullanicisi api editBlog endpointine gondermek icin bir patch request body hazirlar

    #* The api user sends a PATCH request and saves the returned response.
    ## Api kullanicisi PATCH request gonderir ve donen responsei kaydeder
    #* The api user verifies that the status code is 401.
    ## Api kullanicisi status codeun 401 oldugunu dogrular
    #* The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
    ## Api kullanicisi response bodydeki response_message bilgisinin "Invalid token or token missing" oldugunu dogrular


    * The api user sends a PATCH request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi PATCH request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


  Scenario Outline: Verify that the updated blog is successfully modified via API by sending a GET request to /api/blog/{id}
  using the updated_blog_id returned in the PATCH response.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the content information is "Content"
    # Api kullanıcısı content bilgisinin "Content" olduğunu doğrular

    Examples:
      | id |
      | 91 |