@product
Feature: Validate Reusable Add Product

  Scenario: Call reusable add product
    * def productData = { title: 'Validation Product' }
    * def result = call read('classpath:reusable/product/add_product.feature') { productData: productData }
    * match result.addProductResponse.title == 'Validation Product'
