Feature: Reusable Update Product (PATCH)

  Scenario: Update product using provided productId and productData payload
    * url baseUrl
    * def id = (__arg && __arg.productId) ? __arg.productId : productId
    * def payload = (__arg && __arg.productData) ? __arg.productData : productData
    Given path '/products', id
    And request payload
    When method patch
    Then status 200
    * def updateProductResponse = response
