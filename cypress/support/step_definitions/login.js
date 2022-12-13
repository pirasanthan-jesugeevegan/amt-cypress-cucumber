import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';
Given('the user navigate to the login page', () => {
  cy.visit('/web/index.php/auth/login');
});
When('the user enter login credentials', () => {
  cy.contains('Login').should('be.visible');
  cy.get('input[name="username"]').type('Admin');
  cy.get('input[name="password"]').type('admin123');
  cy.get('button[type="submit"]').click();
});
Then('the user should be logged in', () => {
  cy.get('.oxd-topbar-header-title')
    .should('be.visible')
    .and('contain', 'Dashboard');
});
