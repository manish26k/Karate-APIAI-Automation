@e2e @regression
Feature: E2E User Journey - Login, Get Me, Update User, Delete User

  Scenario: Complete user journey from authentication to deletion using reusable flows
    # 1. Login to get access token
    * def loginResult = call read('classpath:reusable/auth/login.feature')
    * def accessToken = loginResult.accessToken
    * match accessToken != ''

    # 2. Get authenticated user profile (Me) to obtain userId
    * def meResult = call read('classpath:reusable/auth/me.feature') { accessToken: '#(accessToken)' }
    * def userId = meResult.meResponse.id
    * match userId == '#? _ > 0'

    # 3. Update user profile using userId and update_user test data
    * def updateData = read('classpath:test-data/user/update_user.json')
    * def updateResult = call read('classpath:reusable/user/update_user.feature') { userId: '#(userId)', userData: '#(updateData)' }
    * match updateResult.updateResponse.id == userId
    * match updateResult.updateResponse.lastName == updateData.lastName

    # 4. Delete user using userId
    * def deleteResult = call read('classpath:reusable/user/delete_user.feature') { userId: '#(userId)' }
    * match deleteResult.deleteResponse.id == userId
    * match deleteResult.deleteResponse.isDeleted == true
    * match deleteResult.deleteResponse.deletedOn != ''
