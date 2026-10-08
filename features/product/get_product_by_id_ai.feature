@product @regression @ai_mcp_test
Feature: Product API - Get Product By ID (AI Generated)

  Background:
    * url baseUrl

  Scenario: Get product by ID successfully via AI generated test
    Given path '/products/1'
    When method get
    Then status 200
    And match response.id == 1
    And match response.title == '#string'
    And match response.price == '#number'
