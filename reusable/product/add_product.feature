Feature: Reusable Add Product

  Scenario: Add product using provided productData payload
    * url baseUrl
    * def payload = (__arg && __arg.productData) ? __arg.productData : productData
    Given path '/products/add'
    And request payload
    When method post
    Then status 201
    * def addProductResponse = response
