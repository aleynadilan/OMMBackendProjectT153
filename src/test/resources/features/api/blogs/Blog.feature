Feature: As a provider, I should be able to access the detailed information of the blog with the specified
  id number through the API connection.

  Scenario Outline: Verify that a GET request to /api/blog/{id} with valid authorization and correct id returns status
  code 200, response_message “Blog  Details”, and that all expected blog fields are present in the response body.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog  Details".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog  Details" oldugunu dogrular
    * The api user validates the "<data_id>", "<lang_id>", "<title>", "<slug>", "<tags>" and "<summary>" contents of the data in the response body.
    # Api kullanicisi response bodydeki dataların "<data_id>", "<lang_id>", "<title>", "<slug>", "<tags>" ve "<summary>" içeriklerini doğrular.

    Examples:
      | id | data_id | lang_id | title              | slug      | tags | summary     |
      | 2  | 2       | 1       | Household Services | household |      | Maintaining |


  Scenario: Verify that a GET request to /api/blog/{id} without valid authorization and id returns status code 203 and
  response_message “Id missing”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Id missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Id missing" oldugunu dogrular


  Scenario: Verify that a GET request to /api/blog/{id} with valid authorization and an unregistered id returns status
  code 203 and response_message “No Details for this id.”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog/6571" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "No Details for this id.".
    # Api kullanicisi response bodydeki response_message bilgisinin "No Details for this id." oldugunu dogrular


  Scenario: Verify that a GET request to /api/blog/{id} with an invalid API key returns status code 401 and
  response_message “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/blog/2" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur

   # * The api user sends a GET request and saves the returned response.
   # # Api kullanicisi GET request gonderir ve donen responsei kaydeder
   # * The api user verifies that the status code is 401.
   # # Api kullanicisi status codeun 401 oldugunu dogrular
   # * The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
   # # Api kullanicisi response bodydeki response_message bilgisinin "Invalid token or token missing" oldugunu dogrular

    * The api user sends a GET request, saves the returned response, and verifies that the status code is '401' with the reason phrase Unauthorized.
    # Api kullanicisi GET request gonderir, donen responsei kaydeder, status codeun '401' ve reason phrase bilgisinin Unauthorized oldugunu dogrular
