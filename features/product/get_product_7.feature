@product @regression
Feature: Product API - Get Product 7

  Background:
    * url baseUrl

  Scenario: Get product 7 successfully
    Given path '/products/7'
    When method get
    Then status 200
    And match response.id == 7
    And match response.title == '#string'
    And match response.price == '#number'
