@product @regression
Feature: Product API - Protection Enforcement Demo

  Background:
    * url baseUrl

  Scenario: Get product successfully
    Given path '/products/1'
    When method get
    Then status 200
    And match response.id == 1
