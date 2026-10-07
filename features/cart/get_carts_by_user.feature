@cart @regression
Feature: Cart API - Get Carts by User ID

  Background:
    * url baseUrl
    * def targetUserId = 5

  Scenario: Retrieve carts by user ID successfully
    Given path '/carts/user', targetUserId
    When method get
    Then status 200
    And match response.carts == '#[]'
    And match response.carts != '#[0]'
    And match response.total == '#number'
    And match response.skip == '#number'
    And match response.limit == '#number'
    And match each response.carts == '#? _.userId == targetUserId'
    And match each response.carts == '#? _.totalProducts > 0 && _.totalQuantity > 0'
    And match each response.carts[*].products[*] contains { id: '#number', title: '#string', quantity: '#number', price: '#number' }
    * print 'User ID:', targetUserId
    * print 'Carts by User:', response.carts
