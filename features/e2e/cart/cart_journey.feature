@e2e @regression
Feature: E2E Cart Journey - Add Cart, Update Cart, Delete Cart

  Scenario: Complete cart journey using reusable cart flows
    # 1. Add cart using add_cart.json test data
    * def addData = read('classpath:test-data/cart/add_cart.json')
    * def addResult = call read('classpath:reusable/cart/add_cart.feature') { cartData: '#(addData)' }
    * def addId = addResult.addCartResponse.id
    * match addId == '#? _ > 0'
    * match addResult.addCartResponse.userId == addData.userId
    * match addResult.addCartResponse.products == '#[]'
    * match addResult.addCartResponse.products != '#[0]'

    # 2. Update cart using valid existing cartId (1) and update_cart.json test data
    * def cartId = 1
    * def updateData = read('classpath:test-data/cart/update_cart.json')
    * def updateResult = call read('classpath:reusable/cart/update_cart.feature') { cartId: '#(cartId)', cartData: '#(updateData)' }
    * match updateResult.updateCartResponse.id == cartId
    * match updateResult.updateCartResponse.products == '#[]'
    * match updateResult.updateCartResponse.products != '#[0]'

    # 3. Delete cart using cartId (1)
    * def deleteResult = call read('classpath:reusable/cart/delete_cart.feature') { cartId: '#(cartId)' }
    * match deleteResult.deleteCartResponse.id == cartId
    * match deleteResult.deleteCartResponse.isDeleted == true
    * match deleteResult.deleteCartResponse.deletedOn != ''
