@product @regression
Feature: Product API - Get Product 6
  Background:
    * url baseUrl
  Scenario: Get product 6 successfully
    Given path '/products/6'
    When method get
    Then status 200
    And match response.id == 6
    And match response.title == '#string'
    And match response.price == '#number'
