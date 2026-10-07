@user @regression
Feature: Test Reusable Delete User Flow

  Scenario: Call reusable delete user flow with userId = 1
    * def deleteResult = call read('classpath:reusable/user/delete_user.feature') { userId: 1 }
    * match deleteResult.deleteResponse.id == 1
    * match deleteResult.deleteResponse.isDeleted == true
