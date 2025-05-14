Feature: As a provider, I want to be able to create a new blog record via API connection.

  Scenario: Verify that a POST request to /api/addBlog with valid authorization and correct data returns status code 200
  and response_message “Blog added successfully”.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a post request body to send to the api addBlog endpoint
    # Api kullanicisi api addBlog endpointine gondermek icin bir post request body hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Blog added successfully".
    # Api kullanicisi response bodydeki response_message bilgisinin "Blog added successfully" oldugunu dogrular


  Scenario: Verify that a POST request to /api/addBlog with valid authorization but missing data returns status code
  203 and response_message “Title, summary, content and category_id is required.”

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a post request body containing missing data to send to the api addBlog endpoint.
    # Api kullanicisi api addBlog endpointine gondermek icin eksik datalar içeren bir post request body hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Title, summary, content and category_id is required.".
    # Api kullanicisi response bodydeki response_message bilgisinin "Title, summary, content and category_id is required." oldugunu dogrular


  Scenario: Verify that a POST request to /api/addBlog without valid authorization and data returns status code 203
  and response_message “Title, summary, content and category_id is required.”

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a post request without any data to send to the api addBlog endpoint.
    # Api kullanicisi api addBlog endpointine gondermek için data içermeyen bir post request hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 203.
    # Api kullanicisi status codeun 203 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Title, summary, content and category_id is required.".
    # Api kullanicisi response bodydeki response_message bilgisinin "Title, summary, content and category_id is required." oldugunu dogrular


  Scenario: Verify that a POST request to /api/addBlog with an invalid API key and correct data returns status code
  401 and response_message “Invalid token or token missing”.

    * The api user constructs the base url with the "invalid" token.
    # Api kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/addBlog" path parameters.
    # Api kullanicisi "api/addBlog" path parametrelerini olusturur
    * The api user prepares a post request body to send to the api addBlog endpoint
    # Api kullanicisi api addBlog endpointine gondermek icin bir post request body hazirlar
    * The api user sends a POST request and saves the returned response.
    # Api kullanicisi POST request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 401.
    # Api kullanicisi status codeun 401 oldugunu dogrular
    * The api user verifies that the "response.response_message" information in the response body is "Invalid token or token missing".
    # Api kullanicisi response bodydeki response_message bilgisinin "Invalid token or token missing" oldugunu dogrular


  Scenario Outline: Verify that the newly created blog via /api/addBlog is successfully created by sending a GET request
  to /api/blog/{id} using the added_blog_id returned in the POST response.

    * The api user constructs the base url with the "provider" token.
    # Api kullanicisi "provider" token ile base urli olusturur
    * The api user sets "api/blog/<id>" path parameters.
    # Api kullanicisi "api/blogs" path parametrelerini olusturur
    * The api user sends a GET request and saves the returned response.
    # Api kullanicisi GET request gonderir ve donen responsei kaydeder
    * The api user verifies that the status code is 200.
    # Api kullanicisi status codeun 200 oldugunu dogrular

    Examples:
      | id |
      | 89 |
