@product @regression
Feature: Product API - Get Product 4

  Background:
    * url baseUrl

  Scenario: Get product 4 successfully
    Given path '/products/4'
    When method get
    Then status 200
    And match response.id == 4
    And match response.title == '#string'
    And match response.price == '#number'
