@parallel @cart @regression
Feature: Cart API - Add Cart

  Background:
    * url baseUrl
    * def cartData = read('classpath:test-data/cart/add_cart.json')

  Scenario: Add a new cart successfully
    Given path '/carts/add'
    And request cartData
    When method post
    Then status 201
    And match response == '#object'
    And match response.id == '#? _ > 0'
    And match response.userId == cartData.userId
    And match response.products == '#[]'
    And match response.products.length == cartData.products.length
    And match each response.products contains { id: '#number', quantity: '#? _ > 0' }
    * print 'Request Data:', cartData
    * print 'Response Data:', response
