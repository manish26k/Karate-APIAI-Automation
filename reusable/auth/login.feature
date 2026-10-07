Feature: Reusable Auth Login

  Scenario: Authenticate and return tokens
    * url baseUrl
    * def env = karate.env || 'dev'
    * def loginData = read('classpath:test-data/auth/' + env + '/login.json')
    Given path '/auth/login'
    And request loginData.validUser
    When method post
    Then status 200
    And match response.accessToken == '#string'
    And match response.refreshToken == '#string'
    * def accessToken = response.accessToken
    * def refreshToken = response.refreshToken
