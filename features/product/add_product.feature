@parallel @product @regression
Feature: Product API - Add Product

  Background:
    * url baseUrl
    * def productData = read('classpath:test-data/product/add_product.json')

  Scenario: Add a new product successfully
    Given path '/products/add'
    And request productData
    When method post
    Then status 201
    And match response == '#object'
    And match response.id == '#? _ > 0'
    And match response.title == productData.title
    * print 'Request Data:', productData
    * print 'Response Data:', response
