@product
Feature: Validate Reusable Add Product

  Scenario: Call reusable add product
    * def productData = { title: 'Validation Product' }
    * def result = call read('classpath:reusable/product/add_product.feature') { productData: '#(productData)' }
    * match result.payload == { title: 'Validation Product' }
    * match result.addProductResponse.id == '#? _ > 0'
    * match result.responseStatus == 201
