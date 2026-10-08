@product @regression
Feature: Product API - Get Product By ID 2

  Background:
    * url baseUrl

  Scenario: Get product 2 by id successfully
    Given path '/products/2'
    When method get
    Then status 200
    And match response.id == 2
    And match response.title == '#string'
    And match response.price == '#number'
