Feature: Login
    Scenario: Login user with correct email and password
        Given the user navigate to the login page
        When the user enter login credentials
        Then the user should be logged in