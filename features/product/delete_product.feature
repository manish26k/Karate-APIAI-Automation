@product @regression
Feature: Product API - Delete Product

  Background:
    * url baseUrl
    * def productId = 1

  Scenario: Delete an existing product successfully
    Given path '/products', productId
    When method delete
    Then status 200
    And match response == '#object'
    And match response.id == productId
    And match response.isDeleted == true
    And match response.deletedOn == '#string'
    And match response.deletedOn != ''
    * print 'Deleted Product ID:', productId
    * print 'Delete Response:', response
