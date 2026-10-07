Feature: Reusable Update Cart (PATCH)

  Scenario: Update cart using provided cartId and cartData payload
    * url baseUrl
    * def arg = karate.get('__arg') || {}
    * def id = arg.cartId || 1
    * def payload = arg.cartData || read('classpath:test-data/cart/update_cart.json')
    Given path '/carts', id
    And request payload
    When method patch
    Then status 200
    * def updateCartResponse = response
