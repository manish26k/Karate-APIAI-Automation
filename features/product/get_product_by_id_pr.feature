@product @regression @pr_test
Feature: Product API - Get Product By ID (PR Test)

  Background:
    * url baseUrl

  Scenario: Get product by ID successfully for PR test
    Given path '/products/1'
    When method get
    Then status 200
    And match response.id == 1
    And match response.title == '#string'
    And match response.price == '#number'
