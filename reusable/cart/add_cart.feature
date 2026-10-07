Feature: Reusable Add Cart

  Scenario: Add cart using provided cartData payload
    * url baseUrl
    * def payload = (__arg && __arg.cartData) ? __arg.cartData : cartData
    Given path '/carts/add'
    And request payload
    When method post
    Then status 201
    * def addCartResponse = response
