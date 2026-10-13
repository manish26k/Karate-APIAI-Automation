@product @regression
Feature: Product API - Get Product 10

  Background:
    * url baseUrl

  Scenario: Get product 10 successfully
    Given path '/products/10'
    When method get
    Then status 200
    And match response.id == 10
    And match response.title == '#string'
    And match response.price == '#number'
