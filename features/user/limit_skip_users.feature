@user @regression
Feature: User API - Pagination and Selection (Limit, Skip, Select)

  Background:
    * url baseUrl
    * def limitVal = 5
    * def skipVal = 10
    * def selectFields = 'firstName,age'

  Scenario: Retrieve paginated and selected users successfully
    Given path '/users'
    And param limit = limitVal
    And param skip = skipVal
    And param select = selectFields
    When method get
    Then status 200
    And match response.users == '#[]'
    And match response.users != '#[0]'
    * def userLen = response.users.length
    * assert userLen <= limitVal
    And match response.skip == skipVal
    And match response.limit == limitVal
    And match response.total == '#number'
    And match each response.users == { id: '#number', firstName: '#string', age: '#number' }
    * print 'Pagination Parameters -> Limit:', limitVal, 'Skip:', skipVal, 'Select:', selectFields
    * print 'Paginated Users:', response.users
