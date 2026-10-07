@cart @regression
Feature: Cart API - Update Cart (PATCH)

  Background:
    * url baseUrl
    * def cartId = 1
    * def updateData = read('classpath:test-data/cart/update_cart.json')

  Scenario: Update an existing cart successfully via PATCH with merge
    Given path '/carts', cartId
    And request updateData
    When method patch
    Then status 200
    And match response == '#object'
    And match response.id == cartId
    And match response.products == '#[]'
    And match response.products != '#[0]'
    * def prodLen = response.products.length
    * assert prodLen > 1
    And match each response.products contains { id: '#number', quantity: '#? _ > 0' }
    * print 'Request Data:', updateData
    * print 'Response Data:', response
