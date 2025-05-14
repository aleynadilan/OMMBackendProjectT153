Feature: As a provider, I want to be able to delete blog information with the specified id number via API connection.

  Scenario: Verify that a DELETE request to /api/deleteBlog/{id} with valid authorization and correct id returns status
  code 200, response_message “Blog deleted successfully”, and that deleted_blog_id in the response matches the path
  parameter id.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/deleteBlog/93" path parameters.
    # Api kullanicisi "api/deleteBlog" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog deleted successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog deleted successfully" oldugunu dogrular
    * The api user verifies that the "data.deleted_blog_id" information in the response body is the same as the id path parameter in the endpoint.
    # Api kullanıcısı response body icindeki "deleted_blog_id" bilgisinin endpointde yazan id path parametresi ile ayni oldugunu dogrular.


  Scenario: Verify that a DELETE request to /api/deleteBlog/{id} with valid authorization but missing id returns status
  code 203 and response_message “Id missing”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/deleteBlog" path parameters.
    # Api kullanicisi "api/deleteBlog" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Id missing" oldugunu dogrular


  Scenario: Verify that a DELETE request to /api/deleteBlog/{id} with valid authorization and a non-existent id returns
  status code 203 and response_message “Blog not found. Invalid ID.”

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/deleteBlog/6541" path parameters.
    # Api kullanicisi "api/deleteBlog" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog not found. Invalid ID.".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog not found. Invalid ID." oldugunu dogrular


  Scenario: Verify that a DELETE request to /api/deleteBlog/{id} with an invalid API key returns status code 401 and
  response_message “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/deleteBlog/85" path parameters.
    # Api kullanicisi "api/deleteBlog" path parametrelerini olusturur
    * The api user sends a DELETE request and saves the returned response.
    # Api kullanicisi DELETE request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Invalid token or token missing" oldugunu dogrular

    #* The api user sends a DELETE request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi DELETE request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular


  Scenario: Verify that the deleted blog is successfully removed via API by sending a GET request to /api/blog/{id}
  using the deleted_blog_id returned in the DELETE response.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog/93" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
