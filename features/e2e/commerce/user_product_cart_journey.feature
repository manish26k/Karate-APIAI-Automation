@e2e @regression
Feature: E2E Commerce Journey - User, Product, and Cart

  Scenario: Complete end-to-end user, product, and cart commerce journey
    # 1. Login to obtain access token
    * def loginResult = call read('classpath:reusable/auth/login.feature')
    * def accessToken = loginResult.accessToken
    * match accessToken != ''

    # 2. Get user profile (Me) to obtain userId
    * def meResult = call read('classpath:reusable/auth/me.feature') { accessToken: '#(accessToken)' }
    * def userId = meResult.meResponse.id
    * match userId == '#? _ > 0'

    # 3. Add product using test data
    * def productAddData = read('classpath:test-data/product/add_product.json')
    * def addProductResult = call read('classpath:reusable/product/add_product.feature') { productData: '#(productAddData)' }
    * def addedProductId = addProductResult.addProductResponse.id
    * match addedProductId == '#? _ > 0'
    * match addProductResult.addProductResponse.id == addedProductId
    * match addProductResult.addProductResponse.title == productAddData.title

    # 4. Update product using valid existing productId (1) and test data
    * def productId = 1
    * def productUpdateData = read('classpath:test-data/product/update_product.json')
    * def updateProductResult = call read('classpath:reusable/product/update_product.feature') { productId: '#(productId)', productData: '#(productUpdateData)' }
    * match updateProductResult.updateProductResponse.id == productId
    * match updateProductResult.updateProductResponse.title == productUpdateData.title

    # 5. Add cart overriding userId and product ID with runtime values
    * def cartAddData = read('classpath:test-data/cart/add_cart.json')
    * cartAddData.userId = userId
    * cartAddData.products[0].id = productId
    * def addCartResult = call read('classpath:reusable/cart/add_cart.feature') { cartData: '#(cartAddData)' }
    * def addedCartId = addCartResult.addCartResponse.id
    * match addedCartId == '#? _ > 0'
    * match addCartResult.addCartResponse.userId == userId
    * match addCartResult.addCartResponse.products[*].id contains productId

    # 6. Update cart using valid existing cartId (1) and test data
    * def cartId = 1
    * def cartUpdateData = read('classpath:test-data/cart/update_cart.json')
    * def updateCartResult = call read('classpath:reusable/cart/update_cart.feature') { cartId: '#(cartId)', cartData: '#(cartUpdateData)' }
    * match updateCartResult.updateCartResponse.id == cartId
    * match updateCartResult.updateCartResponse.products == '#[]'
    * match updateCartResult.updateCartResponse.products != '#[0]'

    # 7. Delete cart
    * def deleteCartResult = call read('classpath:reusable/cart/delete_cart.feature') { cartId: '#(cartId)' }
    * match deleteCartResult.deleteCartResponse.id == cartId
    * match deleteCartResult.deleteCartResponse.isDeleted == true
    * match deleteCartResult.deleteCartResponse.deletedOn != ''

    # 8. Delete product
    * def deleteProductResult = call read('classpath:reusable/product/delete_product.feature') { productId: '#(productId)' }
    * match deleteProductResult.deleteProductResponse.id == productId
    * match deleteProductResult.deleteProductResponse.isDeleted == true
    * match deleteProductResult.deleteProductResponse.deletedOn != ''
