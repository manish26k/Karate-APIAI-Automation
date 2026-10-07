Feature: Reusable Delete Cart

  Scenario: Delete cart using provided cartId
    * url baseUrl
    * def arg = karate.get('__arg') || {}
    * def id = arg.cartId || 1
    Given path '/carts', id
    When method delete
    Then status 200
    * def deleteCartResponse = response
