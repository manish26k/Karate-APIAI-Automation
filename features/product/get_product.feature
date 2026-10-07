@product @regression
Feature: Product API - Get Products

  Background:
    * url baseUrl

  Scenario: Get all products successfully
    Given path '/products'
    When method get
    Then status 200
    And match response.products == '#[]'
    And match response.total == '#number'
