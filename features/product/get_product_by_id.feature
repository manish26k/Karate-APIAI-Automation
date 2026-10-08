@product @regression
Feature: Product API - Get Product By ID

  Background:
    * url baseUrl

  Scenario: Get a single product by id successfully
    Given path '/products/1'
    When method get
    Then status 200
    And match response.id == 1
    And match response.title == '#string'
    And match response.price == '#number'
