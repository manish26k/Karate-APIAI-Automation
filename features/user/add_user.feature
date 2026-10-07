@parallel @user @regression
Feature: User API - Add New User

  Background:
    * url baseUrl
    * def userData = read('classpath:test-data/user/add_user.json')

  Scenario: Add a new user successfully
    Given path '/users/add'
    And request userData
    When method post
    Then status 201
    And match response == '#object'
    And match response.id == '#? _ > 0'
    And match response.firstName == userData.firstName
    And match response.lastName == userData.lastName
    And match response.age == userData.age
    * print 'Request Data:', userData
    * print 'Response Data:', response
