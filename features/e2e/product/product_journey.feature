@e2e @regression
Feature: E2E Product Journey - Add Product, Update Product, Delete Product

  Scenario: Complete product journey using reusable product flows
    # 1. Add product using add_product.json test data
    * def addData = read('classpath:test-data/product/add_product.json')
    * def addResult = call read('classpath:reusable/product/add_product.feature') { productData: '#(addData)' }
    * def addId = addResult.addProductResponse.id
    * match addId == '#? _ > 0'
    * match addResult.addProductResponse.title == addData.title

    # 2. Update product using valid existing productId (1) and update_product.json test data
    * def productId = 1
    * def updateData = read('classpath:test-data/product/update_product.json')
    * def updateResult = call read('classpath:reusable/product/update_product.feature') { productId: '#(productId)', productData: '#(updateData)' }
    * match updateResult.updateProductResponse.id == productId
    * match updateResult.updateProductResponse.title == updateData.title

    # 3. Delete product using productId (1)
    * def deleteResult = call read('classpath:reusable/product/delete_product.feature') { productId: '#(productId)' }
    * match deleteResult.deleteProductResponse.id == productId
    * match deleteResult.deleteProductResponse.isDeleted == true
    * match deleteResult.deleteProductResponse.deletedOn != ''
