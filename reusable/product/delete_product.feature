Feature: Reusable Delete Product

  Scenario: Delete product using provided productId
    * url baseUrl
    * def id = (__arg && __arg.productId) ? __arg.productId : productId
    Given path '/products', id
    When method delete
    Then status 200
    * def deleteProductResponse = response
