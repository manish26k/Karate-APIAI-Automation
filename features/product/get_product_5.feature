@product @regression
Feature: Product API - Get Product 5

  Background:
    * url baseUrl

  Scenario: Get product 5 successfully
    Given path '/products/5'
    When method get
    Then status 200
    And match response.id == 5
    And match response.title == '#string'
    And match response.price == '#number'
