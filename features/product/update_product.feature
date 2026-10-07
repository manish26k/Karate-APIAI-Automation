@product @regression
Feature: Product API - Update Product (PATCH)

  Background:
    * url baseUrl
    * def productId = 1
    * def updateData = read('classpath:test-data/product/update_product.json')

  Scenario: Update an existing product successfully via PATCH
    Given path '/products', productId
    And request updateData
    When method patch
    Then status 200
    And match response == '#object'
    And match response.id == productId
    And match response.title == updateData.title
    * print 'Request Data:', updateData
    * print 'Response Data:', response
