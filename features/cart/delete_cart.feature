@cart @regression
Feature: Cart API - Delete Cart

  Background:
    * url baseUrl
    * def cartId = 1

  Scenario: Delete an existing cart successfully
    Given path '/carts', cartId
    When method delete
    Then status 200
    And match response == '#object'
    And match response.id == cartId
    And match response.isDeleted == true
    And match response.deletedOn == '#string'
    And match response.deletedOn != ''
    * print 'Deleted Cart ID:', cartId
    * print 'Delete Response:', response
