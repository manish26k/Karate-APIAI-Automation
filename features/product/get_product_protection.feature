@product @regression
Feature: Product API - Protection Enforcement Demo

  Background:
    * url baseUrl

  Scenario: Get product with failing assertion
    Given path '/products/1'
    When method get
    Then status 200
    And match response.id == 9999
